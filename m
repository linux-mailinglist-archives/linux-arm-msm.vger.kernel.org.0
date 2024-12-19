Return-Path: <linux-arm-msm+bounces-42851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 013819F8661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B9318939C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB11CD1F6;
	Thu, 19 Dec 2024 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zf1uV8FH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5FF1C5CCE
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 20:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641691; cv=none; b=Pmq/m2ercIbtTp/hbUXEkws9g5Ihmt6wVoRLPm5/xBRtTkt+Jasfjt5VBmvn8EfB9hcGv5VsNGfTaGGHYzlh0HiVE+ln2ulbxYzLjCBtIn+WPAdS171BaQzc1S4kC4NIEECdFp8kHoAmKlqPntg+CTn7MuMNFzl41JJH8fLWqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641691; c=relaxed/simple;
	bh=dk6yOhy+In+//VLQ9Xjx9LYbW1IaqEuO8wfTODHuApA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W35I/LuPEUsPScb4kf62tc8JKYFCUym55cAI2DmOQM8tyRyqk5spInSpWLTcb/lfYY85dZEqczehLRnPFexyhKM64sFg0M4E3YxgZvaVjmFv2X8l71mq6gsrTiqNQo7T9Aj+uqsgJBI4NLdqomac33PKARlmqqxEPZlBkd7SjNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zf1uV8FH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fd17f2312bso912449a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 12:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734641690; x=1735246490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nYPl8ByRqy7GQGlWB5bDU6INvfmgU7gSd26B40zOKE=;
        b=Zf1uV8FHilNfsoC/3WAZlS+n4Mh4a6PpZuEMCNHH7UnuxkZNwgxBcSkJQvJz5oa7jf
         +p1Q8A+dQ2X8cL3lL8VETH+KWSwwJue5DC9baab4eLm6lnOfdgtS4OUQRjTcOh3NwpcE
         NE1ItHHx3bW0buOZr3TOE/bT6spb8II/XSezw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641690; x=1735246490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nYPl8ByRqy7GQGlWB5bDU6INvfmgU7gSd26B40zOKE=;
        b=M5w2CSMEk9ANeT6yAG89G0Nys3AVi1oy1ik5NAlECcrTi8BKhsmzu+IpsjByDLt4TB
         dbrq8cRGUOukPQ7En0oDponqvn4e2/pZo/BP/MC9ys0O4FIcUdjC54ioj1y63XxNR/e6
         m72Toy2hTcH6x2yXTLxAvMzG4cB67r7ALzSfBtLZxArUFeuJ2Fhawd9DYxO9Zo4efwob
         FKhhNWX7+I1CLp2js8A7+Diyv/iJaOGjNP+mGv90/AB+GadlJ/mQe/VkFxImTT1SBkh1
         m8kaXG3/MPagUA8Od5XG5eKapjWksC/tV4RwONVVqlrMAdxKwDXdzY6X7TRIYc9UVFnY
         nojg==
X-Forwarded-Encrypted: i=1; AJvYcCVnnf0vLskHC7pGluWWpfXqs3pTzvjrRnRuktuh2qS8qlAvnJe4ZVqWcLxCBz1O3RWq7bIeMac9qYu+x8GF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ziopkHlWpOOqChDMvgOVSvhEf6INuovRmS29ObKlhAuZO/td
	ZZyicYlWaYUx2UKx0Nln0Ujm1z4MhGXv6dACXeVCwufpxti+JdxgE8ILVyN1/w==
X-Gm-Gg: ASbGncsNW65A3BRgYKyFxnuRBDYZznCkP8ghn13yVhu2DR973ANdTxjMDwbTMIQwaUl
	Gf1/WCmf8b7kwTw1Ls1+2XOAkHictE5/V2JjJCNni6KSWyOqNET0ptfLrCuVbBhO5aFTdY6jaA1
	aZUkSfFlEP1Xjh/RZv8sq41pesANJP4vYnnCQ+vUNtcVnHmT5r2pPdwpvccpSEI77LGSMqJVbT0
	sjoIBXv5VnZGiy3bqjUL7VX2uv2L4jIfXhyejHCw/1XNA3/YVILFpgqD5W0sqDBZJb7xrfFYGxH
X-Google-Smtp-Source: AGHT+IHwccOicX14rSFcDOJXBtww/CDCMLgDGO2mkaPlpWN8gXB9LCHU0FnM7zfKAT8dE4Ug4VhHdQ==
X-Received: by 2002:a17:90b:5487:b0:2ee:f653:9f8e with SMTP id 98e67ed59e1d1-2f452eeda4dmr637078a91.35.1734641689761;
        Thu, 19 Dec 2024 12:54:49 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:a8a3:6409:6518:340d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644d87sm4126905a91.27.2024.12.19.12.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:54:49 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: cputype: Add MIDR_CORTEX_A76AE
Date: Thu, 19 Dec 2024 12:53:22 -0800
Message-ID: <20241219125317.v3.2.I151f3b7ee323bcc3082179b8c60c3cd03308aa94@changeid>
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

From the TRM, MIDR_CORTEX_A76AE has a partnum of 0xDOE and an
implementor of 0x41 (ARM). Add the values.


Cc: stable@vger.kernel.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New

 arch/arm64/include/asm/cputype.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 488f8e751349..a345628fce51 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -75,6 +75,7 @@
 #define ARM_CPU_PART_CORTEX_A76		0xD0B
 #define ARM_CPU_PART_NEOVERSE_N1	0xD0C
 #define ARM_CPU_PART_CORTEX_A77		0xD0D
+#define ARM_CPU_PART_CORTEX_A76AE	0xD0E
 #define ARM_CPU_PART_NEOVERSE_V1	0xD40
 #define ARM_CPU_PART_CORTEX_A78		0xD41
 #define ARM_CPU_PART_CORTEX_A78AE	0xD42
@@ -158,6 +159,7 @@
 #define MIDR_CORTEX_A76	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
 #define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
 #define MIDR_CORTEX_A77	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A77)
+#define MIDR_CORTEX_A76AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76AE)
 #define MIDR_NEOVERSE_V1	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V1)
 #define MIDR_CORTEX_A78	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78)
 #define MIDR_CORTEX_A78AE	MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A78AE)
-- 
2.47.1.613.gc27f4b7a9f-goog


