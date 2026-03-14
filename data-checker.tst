/**
 * Project: AI Data Integrity Checker
 * Logic: Ensures that JSON data structures from AI models are complete and valid.
 */

interface AIUserData {
    id: number;
    username: string;
    ai_response: string;
    timestamp: string;
}

class DataAuditor {
    // Logic: Check if the object has all required keys and valid data types
    validateData(data: any): { isValid: boolean; errors: string[] } {
        const errors: string[] = [];

        if (typeof data.id !== 'number') {
            errors.push("Invalid ID: Must be a number.");
        }
        if (!data.username || data.username.length < 3) {
            errors.push("Invalid Username: Too short or missing.");
        }
        if (!data.ai_response || data.ai_response.includes("undefined")) {
            errors.push("Invalid AI Response: Content is corrupted or undefined.");
        }

        return {
            isValid: errors.length === 0,
            errors: errors
        };
    }
}

// --- Practical Test ---
const auditor = new DataAuditor();

const suspiciousData = {
    id: "101", // Should be a number, not a string
    username: "Bo", // Too short
    ai_response: "The result is undefined" // AI error detected
};

const result = auditor.validateData(suspiciousData);
console.log("Data Integrity Report:", result);
