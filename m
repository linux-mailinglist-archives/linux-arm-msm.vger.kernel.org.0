Return-Path: <linux-arm-msm+bounces-44204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3308A04AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AB683A51CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAD61F75B5;
	Tue,  7 Jan 2025 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhA7FK08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EF1F709B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280496; cv=none; b=W1xCzN1AoqPsK5ZmnzgXpOQR7lWpJ9OTnQFEju9pwGTNU5y6SAkEn6GYFU7Y27WOG/GMLFcMNU+eyWn9OnylQQJTUrRU0ASF4R946tbpcGjoKJfVs2u5WMdX5ByrMJZ7WhquCgFO+JtXuqysnEO6GPsCMHbp3gy+25HepASxbDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280496; c=relaxed/simple;
	bh=MRkbf/QMZ2Xws76DUZvOddSWdEn9he72mIsqwKwolEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0Sh59YhpphqRlMg9lsZz0L+gUndTvE15R/vIegOW6oiOwtivMI/lsTyZX07zQNby/7/X48UYFyKOk0uykERlwyAUgz4BjOYFd04+HM0BZrpYYaW4hZjVyHkPwoNRHP09ulhFubD72qrP+JiCxcncLRfIgKzffIzRqy4ieTP2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhA7FK08; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso20207265ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280492; x=1736885292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyuPoGoas0FXrrfma5oME99Ny+q0qNNG5nUGFTCnZN8=;
        b=RhA7FK08i7SDwuPkB/tAExQPmVzXtuCU3N623gajAXV1oql6O8VgnJUe6BfThXChOE
         RWNA9WmkeMxuVGS02tEQTso5KcNLDbAUdQJzELyG1PojW1+VV3E+YzD2pXqXxR05T06R
         88xAZWw2NG3H4h6MH4Pi9KaD5dfSwfn2CzdDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280492; x=1736885292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyuPoGoas0FXrrfma5oME99Ny+q0qNNG5nUGFTCnZN8=;
        b=XfMMuME7oqvXujQu62vxPsP6bIBZhcG2XGFQlejB9UhfixGCRqh9coJDyYbdFOrpte
         SeuUWFCHDkcJHN0LGBK1DLtugBH2xA8XSV9F/CkVXRemYtEYaXPJSybxPEPrmR4ana8b
         d8RbVc7G3yruh+z6Ro05IKCek9CzLVNX5azAt/GdT5aD8OVUchkWMtx5olClqUuIe6M3
         L3Cj8j3FW92tNKb4bFINuMnSGd9Sc1WXIC1mpcXD1QUwb+7xD5pZO2PTkH8gQM7qf+Ez
         U58rJ39UiiHaq+2Bat4KDLxluc+aqFlSadMEzd6bj1XDs1Dr1RTZoQzwLSwPTEpH/Rr3
         n7zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDCBsGkqP4BZQLYLRVOA03d/USNJLokd+K6OmoDPJX4gZiClUsuPV4Jm9kqbKjYkJHhL7Ic/BVOaHhQdXJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyW775Sf5tx414c11f2ln9MS6WJR+9GGLEcTSTAxy1JWV7l/e7o
	ruUZvQFgbOWynFrG9693/Ony1NVOlJAYEvaPgcG05rLdJ2mH+kjjEGApvL48Pg==
X-Gm-Gg: ASbGncvm0tdd5fKt5wzohXq4LUYFzDucteDDrgjKWAJykfZtoNiv1W+grelSktME7O6
	aYdDoCSJ8ecUunqDlW2stSSQPAuYwTe9FU9CzQUOzt8aql8eNaeXTe2ZPBenyQw++H6zHVNskaV
	gvnjNJBmYbz49cBnw2x1B9ypEMjqCLJtJfY4h/ZUuWR3JMYCDg1Q0t3HY3KdvM+O0rAEUmuYygX
	c8pmPftCb1rIPtLin7ftbWTy/3JKyyxR2H9eWDkaZ08iDK9N3KcGW/efNvwViCNXkzQqRipJy7P
X-Google-Smtp-Source: AGHT+IH9SDkWGRhHf89AC8Lyy6Me9FNM2MneEbrONqwNlFgWCin4uJi7+v53aHD2Xs3q0+CE3HhNxg==
X-Received: by 2002:a17:903:32cf:b0:216:644f:bc0e with SMTP id d9443c01a7336-21a83f502aemr4816215ad.24.1736280492102;
        Tue, 07 Jan 2025 12:08:12 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:11 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Scott Bauer <sbauer@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
Date: Tue,  7 Jan 2025 12:05:59 -0800
Message-ID: <20250107120555.v4.2.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20250107200715.422172-1-dianders@chromium.org>
References: <20250107200715.422172-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code for detecting CPUs that are vulnerable to Spectre BHB was
based on a hardcoded list of CPU IDs that were known to be affected.
Unfortunately, the list mostly only contained the IDs of standard ARM
cores. The IDs for many cores that are minor variants of the standard
ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
code to assume that those variants were not affected.

Flip the code on its head and instead assume that a core is vulnerable
if it doesn't have CSV2_3 but is unrecognized as being safe. This
involves creating a "Spectre BHB safe" list.

As of right now, the only CPU IDs added to the "Spectre BHB safe" list
are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
looking for cores that weren't listed in ARM's list [1] as per review
feedback on v2 of this patch [2]. Additionally Brahma A53 is added as
per mailing list feedback [3].

NOTE: this patch will not actually _mitigate_ anyone, it will simply
cause them to report themselves as vulnerable. If any cores in the
system are reported as vulnerable but not mitigated then the whole
system will be reported as vulnerable though the system will attempt
to mitigate with the information it has about the known cores.

[1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
[2] https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck
[3] https://lore.kernel.org/r/18dbd7d1-a46c-4112-a425-320c99f67a8d@broadcom.com


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Add MIDR_BRAHMA_B53 as safe.
- Get rid of `spectre_bhb_firmware_mitigated_list`.

Changes in v3:
- Don't guess the mitigation; just report unknown cores as vulnerable.
- Restructure the code since is_spectre_bhb_affected() defaults to true

Changes in v2:
- New

 arch/arm64/include/asm/spectre.h |   1 -
 arch/arm64/kernel/proton-pack.c  | 203 ++++++++++++++++---------------
 2 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
index 0c4d9045c31f..f1524cdeacf1 100644
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@ -97,7 +97,6 @@ enum mitigation_state arm64_get_meltdown_state(void);
 
 enum mitigation_state arm64_get_spectre_bhb_state(void);
 bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry, int scope);
-u8 spectre_bhb_loop_affected(int scope);
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *__unused);
 bool try_emulate_el1_ssbs(struct pt_regs *regs, u32 instr);
 
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index e149efadff20..17aa836fe46d 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -845,53 +845,70 @@ static unsigned long system_bhb_mitigations;
  * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before any
  * SCOPE_SYSTEM call will give the right answer.
  */
-u8 spectre_bhb_loop_affected(int scope)
+static bool is_spectre_bhb_safe(int scope)
+{
+	static const struct midr_range spectre_bhb_safe_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
+		MIDR_ALL_VERSIONS(MIDR_BRAHMA_B53),
+		{},
+	};
+	static bool all_safe = true;
+
+	if (scope != SCOPE_LOCAL_CPU)
+		return all_safe;
+
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list))
+		return true;
+
+	all_safe = false;
+
+	return false;
+}
+
+static u8 spectre_bhb_loop_affected(void)
 {
 	u8 k = 0;
-	static u8 max_bhb_k;
-
-	if (scope == SCOPE_LOCAL_CPU) {
-		static const struct midr_range spectre_bhb_k32_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k24_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
-			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
-			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k11_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_AMPERE1),
-			{},
-		};
-		static const struct midr_range spectre_bhb_k8_list[] = {
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
-			MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
-			{},
-		};
-
-		if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
-			k = 32;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
-			k = 24;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
-			k = 11;
-		else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
-			k =  8;
-
-		max_bhb_k = max(max_bhb_k, k);
-	} else {
-		k = max_bhb_k;
-	}
+
+	static const struct midr_range spectre_bhb_k32_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k24_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k11_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		{},
+	};
+	static const struct midr_range spectre_bhb_k8_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
+		{},
+	};
+
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
+		k = 32;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
+		k = 24;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_list))
+		k = 11;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_list))
+		k =  8;
 
 	return k;
 }
@@ -917,29 +934,13 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_mitigation_state(void)
 	}
 }
 
-static bool is_spectre_bhb_fw_affected(int scope)
+static bool has_spectre_bhb_fw_mitigation(void)
 {
-	static bool system_affected;
 	enum mitigation_state fw_state;
 	bool has_smccc = arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_NONE;
-	static const struct midr_range spectre_bhb_firmware_mitigated_list[] = {
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
-		MIDR_ALL_VERSIONS(MIDR_CORTEX_A75),
-		{},
-	};
-	bool cpu_in_list = is_midr_in_range_list(read_cpuid_id(),
-					 spectre_bhb_firmware_mitigated_list);
-
-	if (scope != SCOPE_LOCAL_CPU)
-		return system_affected;
 
 	fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
-	if (cpu_in_list || (has_smccc && fw_state == SPECTRE_MITIGATED)) {
-		system_affected = true;
-		return true;
-	}
-
-	return false;
+	return has_smccc && fw_state == SPECTRE_MITIGATED;
 }
 
 static bool supports_ecbhb(int scope)
@@ -955,6 +956,8 @@ static bool supports_ecbhb(int scope)
 						    ID_AA64MMFR1_EL1_ECBHB_SHIFT);
 }
 
+static u8 max_bhb_k;
+
 bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
 			     int scope)
 {
@@ -963,16 +966,18 @@ bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
 	if (supports_csv2p3(scope))
 		return false;
 
-	if (supports_clearbhb(scope))
-		return true;
-
-	if (spectre_bhb_loop_affected(scope))
-		return true;
+	if (is_spectre_bhb_safe(scope))
+		return false;
 
-	if (is_spectre_bhb_fw_affected(scope))
-		return true;
+	/*
+	 * At this point the core isn't known to be "safe" so we're going to
+	 * assume it's vulnerable. We still need to update `max_bhb_k` though,
+	 * but only if we aren't mitigating with clearbhb though.
+	 */
+	if (scope == SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCAL_CPU))
+		max_bhb_k = max(max_bhb_k, spectre_bhb_loop_affected());
 
-	return false;
+	return true;
 }
 
 static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
@@ -1003,7 +1008,7 @@ early_param("nospectre_bhb", parse_spectre_bhb_param);
 void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 {
 	bp_hardening_cb_t cpu_cb;
-	enum mitigation_state fw_state, state = SPECTRE_VULNERABLE;
+	enum mitigation_state state = SPECTRE_VULNERABLE;
 	struct bp_hardening_data *data = this_cpu_ptr(&bp_hardening_data);
 
 	if (!is_spectre_bhb_affected(entry, SCOPE_LOCAL_CPU))
@@ -1029,7 +1034,7 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		this_cpu_set_vectors(EL1_VECTOR_BHB_CLEAR_INSN);
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_INSN, &system_bhb_mitigations);
-	} else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
+	} else if (spectre_bhb_loop_affected()) {
 		/*
 		 * Ensure KVM uses the indirect vector which will have the
 		 * branchy-loop added. A57/A72-r0 will already have selected
@@ -1042,32 +1047,29 @@ void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *entry)
 		this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
 		state = SPECTRE_MITIGATED;
 		set_bit(BHB_LOOP, &system_bhb_mitigations);
-	} else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
-		fw_state = spectre_bhb_get_cpu_fw_mitigation_state();
-		if (fw_state == SPECTRE_MITIGATED) {
-			/*
-			 * Ensure KVM uses one of the spectre bp_hardening
-			 * vectors. The indirect vector doesn't include the EL3
-			 * call, so needs upgrading to
-			 * HYP_VECTOR_SPECTRE_INDIRECT.
-			 */
-			if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
-				data->slot += 1;
-
-			this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
-
-			/*
-			 * The WA3 call in the vectors supersedes the WA1 call
-			 * made during context-switch. Uninstall any firmware
-			 * bp_hardening callback.
-			 */
-			cpu_cb = spectre_v2_get_sw_mitigation_cb();
-			if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
-				__this_cpu_write(bp_hardening_data.fn, NULL);
-
-			state = SPECTRE_MITIGATED;
-			set_bit(BHB_FW, &system_bhb_mitigations);
-		}
+	} else if (has_spectre_bhb_fw_mitigation()) {
+		/*
+		 * Ensure KVM uses one of the spectre bp_hardening
+		 * vectors. The indirect vector doesn't include the EL3
+		 * call, so needs upgrading to
+		 * HYP_VECTOR_SPECTRE_INDIRECT.
+		 */
+		if (!data->slot || data->slot == HYP_VECTOR_INDIRECT)
+			data->slot += 1;
+
+		this_cpu_set_vectors(EL1_VECTOR_BHB_FW);
+
+		/*
+		 * The WA3 call in the vectors supersedes the WA1 call
+		 * made during context-switch. Uninstall any firmware
+		 * bp_hardening callback.
+		 */
+		cpu_cb = spectre_v2_get_sw_mitigation_cb();
+		if (__this_cpu_read(bp_hardening_data.fn) != cpu_cb)
+			__this_cpu_write(bp_hardening_data.fn, NULL);
+
+		state = SPECTRE_MITIGATED;
+		set_bit(BHB_FW, &system_bhb_mitigations);
 	}
 
 	update_mitigation_state(&spectre_bhb_state, state);
@@ -1101,7 +1103,6 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
 {
 	u8 rd;
 	u32 insn;
-	u16 loop_count = spectre_bhb_loop_affected(SCOPE_SYSTEM);
 
 	BUG_ON(nr_inst != 1); /* MOV -> MOV */
 
@@ -1110,7 +1111,7 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt_instr *alt,
 
 	insn = le32_to_cpu(*origptr);
 	rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn);
-	insn = aarch64_insn_gen_movewide(rd, loop_count, 0,
+	insn = aarch64_insn_gen_movewide(rd, max_bhb_k, 0,
 					 AARCH64_INSN_VARIANT_64BIT,
 					 AARCH64_INSN_MOVEWIDE_ZERO);
 	*updptr++ = cpu_to_le32(insn);
-- 
2.47.1.613.gc27f4b7a9f-goog


