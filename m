Return-Path: <linux-arm-msm+bounces-42852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F749F8667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B64407A3511
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F7C1D7E54;
	Thu, 19 Dec 2024 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kVjbQue2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440FC1C07EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641695; cv=none; b=pjnQ3bXNuoCunnhENQ7DLgiVcg7Ow0E/EjGqZPBSyFiyrRApjurjnxs1KfupTPaOAS2csiBz0maQ8jAg1NLx7efKkjDRJNcN4FurTSLypFqZNNponad4ONUp9rTajvUWVFV1hxz+2U2tN4Jso1XOXp4FoehAGd02LTMKGrvYk6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641695; c=relaxed/simple;
	bh=WWGrPOmehKv7Jm3KaVRDb/LfAgSgMERBcW5VTNeD/ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4kWLyd7Jk6QilJmS14Bu7e5EIXUt3Iv0kijbEC0xS6HlTxHWQKnIvMMyPOh1MRMLIKtGrfXLOVcl1ecqg/EObl5lvFLHHFVohe26plST7q1DvGNLwSIj7gQFf4xwr33XTRe9fgvuNznXB2Qa3SHWt3xvebxCvt9f0a45AZgptA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kVjbQue2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc41b4c78bso547774a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641693; x=1735246493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s4l03z+TiOWmT76Ozzx8G2m2dVtHZ3dYvzPccSMcPU=;
        b=kVjbQue26sKUnT8SgurDNdwN+nmGaM9/hK70Vcpi30GtdYGWk3AJP226k/05mjB5bg
         QWuJ6/ArlvUPzMAOHml+SWc7VrnIVbbE3b6VN/KPRmuvDDIKZ2EIrc+asCtF8OO+t1n3
         BdUQSctLTAhnb8f4L7WIwsuaINbPUaqT8ZCO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641693; x=1735246493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6s4l03z+TiOWmT76Ozzx8G2m2dVtHZ3dYvzPccSMcPU=;
        b=tU0kN2Tltt0x7ovpWivFT4ESWOa1XfrYoCLjb6TGqKSQ0Dcbjd/xUxva41/nn7MSRe
         fiWJvORSRa5a1f+vPJ+Eo9HouWtKPmnrW6cy+hjqn0M/EFYKVQ7OMZvXr9WRDVfGdrAx
         oIexsuay/RBhTYAb84UyAz3zATagkYH7/8oEn1vLj539oqldyQnmFa9bX7YekBGyhcAw
         d76qdi9QtLRmi7uKRBDtfo6MCO6I85PQe4M5gaJWutFcru/J1v9DQv/AJiBp+ZW6yGtf
         DAn4lvYzal0tzFhYKEv1qP2bg9UKt25lgsYnTWItJTGFcUiHQXxaTpfjdVEFXH81fhQ8
         Icvw==
X-Forwarded-Encrypted: i=1; AJvYcCVcjGL+sogTTXXP8YqhyrHIWw1XNf/9f2oAVK3DJpJqMX3L3iZ0zyYIeZmV8J0SzB5uf6wb/2YBhmDnX9nl@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrNhncmXxSnaOreVKGzRbcTw9Ph3g55qdWmdCQtWfUno660h+
	H1fxHSqziY2LnqoZp/cGkomCjrgz8pjTRSFpr24Vvtj321+bTnG4FeKzyC+Phg==
X-Gm-Gg: ASbGnctci3ptyV3I0eVFXEJmbIAGm638NqpvLR7pFPtM5e0hSqW1GNhuIyVS2uoJEGY
	asVwfYQLlbiLnHCCxBulHGn947nC+xckWCSk5XORqQ4a4RlcUn0mxK6mUrGS/UeXIbUED9Md3My
	dUPUMjcdIq+Z9cAi8dI+m7H+84pS7MR/5f8dAonks2eTsZvkPJWBl73HG7F3YRbcQg2JKSbQ3ua
	V41KcqqOhigToGb7rHhyyHU6Oem285KXYakmLFiasdB2vo3vw6kY/rOk0O1TRizzZd9ogMNiwlr
X-Google-Smtp-Source: AGHT+IEaD6/NCBxxxfKhVW+SQ2XuBT1Btw2c/4loiQPU6dq3AxKc2urxpDuKIcZdFcK3IchhrLacVA==
X-Received: by 2002:a17:90b:134b:b0:2ef:316b:53fe with SMTP id 98e67ed59e1d1-2f452e4d0e5mr545837a91.22.1734641692063;
        Thu, 19 Dec 2024 12:54:52 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Roxana Bradescu <roxabee@google.com>,
	Julius Werner <jwerner@chromium.org>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
Date: Thu, 19 Dec 2024 12:53:23 -0800
Message-ID: <20241219125317.v3.3.I4a9a527e03f663040721c5401c41de587d015c82@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241219205426.2275508-1-dianders@chromium.org>
References: <20241219205426.2275508-1-dianders@chromium.org>
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

Changes in v3:
- New

 arch/arm64/kernel/proton-pack.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 06e04c9e6480..86d67f5a5a72 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -872,6 +872,14 @@ static u8 spectre_bhb_loop_affected(void)
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
@@ -885,6 +893,7 @@ static u8 spectre_bhb_loop_affected(void)
 	};
 	static const struct midr_range spectre_bhb_k24_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A76AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 		{},
@@ -899,7 +908,11 @@ static u8 spectre_bhb_loop_affected(void)
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


