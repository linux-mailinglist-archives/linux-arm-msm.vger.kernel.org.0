Return-Path: <linux-arm-msm+bounces-44207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74222A04AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB71166B95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BE41F7066;
	Tue,  7 Jan 2025 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PgCPJ6l+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FCB1F76D1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280503; cv=none; b=kLpweiVdHfYtGeDZA5HM5pGt0ywRbGpfKgkbNMXy5p5WACNrZOHxWoqRKDKa0yhAOwpOMjdCWduxjIOfp0eglst7GvOIFEDnf1S9wmA8ZiFC0axFu/9uAo8mZdUUKNYR+hv43kYbxmkRmPJtifJyO4QUqcmyB6xpZ1d84BCQlFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280503; c=relaxed/simple;
	bh=Duq+INKIqNPUgvYTHZsJkbkyGq8prfurW6VmwQI5pbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGLsT7jjClfa7upKkhq5ghzDEvXHUOyH2KnGcolW3Mp/NmDGaaR0eYeUS/36ojBya2lmwhDHSr7xoMSXRl1dJzNRArHz2CZ0NsyCm8VWVZMeEJv/cAGS/alGDCtW0n+gVS7sHnYUWeAcVKWXwVly+UZsoyL1pNweWYXhemY2msI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PgCPJ6l+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21680814d42so200112195ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280499; x=1736885299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfHdG1ANNWPpZE2kjiBnSExD56hP6zWfFTzaWahyQ5I=;
        b=PgCPJ6l+mNt/l80HE6BzyNgX5kWGIe/m4WTXfKM8m5wD2+39y3c61K4xoE0zVtp1Pv
         kUsAIwZWBmVYy1/u9FsCzjpoGtNN6bJ8/WceueyFjrC5I8w8bTDxfoEvkWcmVK7CBcLc
         Wsxsi3arNIqeeKatGBHHXfyQk429zXACrhRpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280499; x=1736885299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfHdG1ANNWPpZE2kjiBnSExD56hP6zWfFTzaWahyQ5I=;
        b=rMZRcAM+4xs5aqnoMdrw3AXyimlg6KnIByaulvxcvJWsrG/vdFsmfghVKDaIWLlpL4
         lUVkfd507ivXkEQ98rFSujdSI6Gkf5W7P3qvuCLvPR4vh1WTMNvNtpcTph5Epstaongg
         fPFZzDfihfNFj4l1zKdizMutWSLlgZTI0vUJ3Ik4cdWXxORSR+CGXwk6QaUH3KCSzqm7
         IaVOS50nz8jBlyQp/9Rl14bYOcnj3eYEySTlFibytFPnPp7SPrsVXUKmiLeRDCJweXJH
         7y8Iea8H8cpFlagL3TwigM3UJ9zU4DJc26THwVbMNGE/zCNoBj1NwBejnCcuxxsjLe7T
         rQqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y6oL+OWSjow80LT8Eq5nY+4QNFonfQOXxS06NTKZW4v0ayrd+fYj+UQUN+FGMqIZZp54xcV8yWzF+XKL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz782b8NUzRtRIiHySWK1Ls1nSy2GNCzDuBWtUj+Y10ww7knelN
	82ntbo28TRAS7rPf5PcudPnfOXIGqX8M7F6x+7rNQ9T92Vob/NbGTJjM94Y7zQ==
X-Gm-Gg: ASbGncsd2WyKy10mOwxY+AKEiGuUsP2xM1JEe/gsptkfYhua5OpPDtIK+3ga51jO8K/
	WF05e5uy/dUgtiyLX2EEzGwXokjRmsDasInXL3Y8kQ6Vvb9fwaMAEJEtgheIohzhjZFHxCEJLwF
	L2CPgMXJDcBfP5dP6ey3CxmnZEu+FvozQbIZw9OH2Yk3jyoP4lzHzXYfI5cMGUFyIFHoKzUnWyv
	SXPvhLf7OdYUEw28kss/97E/titS40iE4rKmY7ElzsCgsl6hx2dXD7xtDGqkfawQ1QCh73HdIrC
X-Google-Smtp-Source: AGHT+IFu7otqKCCIAbXozs9Yi25BzurouHYPRUn+yFnfSXfUKFQHp3WyFH7S4/kldp390+NNufFNOg==
X-Received: by 2002:a17:902:ccc2:b0:216:4165:c05e with SMTP id d9443c01a7336-21a83f67982mr5749945ad.24.1736280499600;
        Tue, 07 Jan 2025 12:08:19 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:18 -0800 (PST)
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
Subject: [PATCH v4 5/5] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
Date: Tue,  7 Jan 2025 12:06:02 -0800
Message-ID: <20250107120555.v4.5.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
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

When comparing to the ARM list [1], it appears that several ARM cores
were missing from the lists in spectre_bhb_loop_affected(). Add them.

NOTE: for some of these cores it may not matter since other ways of
clearing the BHB may be used (like the CLRBHB instruction or ECBHB),
but it still seems good to have all the info from ARM's whitepaper
included.

[1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB


Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side channels")
Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- New

 arch/arm64/kernel/proton-pack.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 89405be53d8f..0f51fd10b4b0 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -876,6 +876,14 @@ static u8 spectre_bhb_loop_affected(void)
 {
 	u8 k = 0;
 
+	static const struct midr_range spectre_bhb_k132_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
+	};
+	static const struct midr_range spectre_bhb_k38_list[] = {
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	};
 	static const struct midr_range spectre_bhb_k32_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
@@ -889,6 +897,7 @@ static u8 spectre_bhb_loop_affected(void)
 	};
 	static const struct midr_range spectre_bhb_k24_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
@@ -904,7 +913,11 @@ static u8 spectre_bhb_loop_affected(void)
 		{},
 	};
 
-	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
+	if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k132_list))
+		k = 132;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k38_list))
+		k = 38;
+	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
 		k = 32;
 	else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_list))
 		k = 24;
-- 
2.47.1.613.gc27f4b7a9f-goog


