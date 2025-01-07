Return-Path: <linux-arm-msm+bounces-44206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84756A04AAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 998297A1F83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20A51F8670;
	Tue,  7 Jan 2025 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApAeMSWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECA1F76C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280501; cv=none; b=Yh3rU5BrNn2c8C9nkUK0no97V4wOqR5Oc8mlZrKR2O6sQvbPpvBcXs2JNUcyPuXkhLldWqAB52qz8V7xuEjvMA1fo70MqjCBIF+dpqgaABQIf74C8qRvjxMWrSbvrumlFwUbxUpwKwDyMk7pK3zdHdvTp4dKUJhiTU9mIwRzLdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280501; c=relaxed/simple;
	bh=s20fIlw9p2A8MPpe7e1vf1OBRFsKifSYci/GqL1Eyhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFn5a51iMm1v90IX1IswbxmB4tFQvk0KTP2GsmVODQcN8kpUWjR3Q4O5E0QmJRNWd8kEOMDXUhUaXeVRodrw3xbjQugRXtvjgJdtWk7LJotAx1gwedRybJtLUc/rHf4ndkYGOR9FLAq+wQhcjQSU5jZks87oN8OifCVUazHO80s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApAeMSWM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216395e151bso2082065ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736280497; x=1736885297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J3uEvrodRrvpIjWWGDgko7jtoYydXF7C2qPRbL5eTY=;
        b=ApAeMSWM6XnlVDKRWubk9k4yx2jI6/PrZXI79PUb4hYY9C9OfuIicjjZhmHCv+Zq+g
         Ixwdh56bkSDXgXhx7PTx2YP4W6M0GotkvP2w9c2aWgVvLjidPsPVqyF0STewevwyKZWo
         ZieDni9/yxDwrtkqCMvM+PVMo2sSQG3odyRC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736280497; x=1736885297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J3uEvrodRrvpIjWWGDgko7jtoYydXF7C2qPRbL5eTY=;
        b=QpfOHaTr6ej96smt/mNgZ+4iDWZE6YwrABZNiZLT+2F9myRPKkOt5yC9Slg0yeaS/O
         6wcTB3cnvgBIHDqAx37PIhjvAQRoDBxRmmLwDOkfGuERdbiXA2bVU5joLeadZBqVk1wj
         SwIrTnSs2YTLztku+wCkWH1Z7G9n5X0irvWFRrYG/gB8hVlz1de9AmQb8Kj9N3qJ3837
         bBi1xXZfVkEkSwrXc+EhQNfqoWUnZdLi1Nw+wyYcRos6vHN5Ard8qtjf+NCQ//oyO4G2
         ObV7dWCzHMbvnOB4o3vHDwIjmDgGXS6OUFgjj4YTfY1b/wndiyWWB4JxEXpKPs1LnuKP
         hAig==
X-Forwarded-Encrypted: i=1; AJvYcCX5dPLEwK7l/iDlfXSSRy2LRToTtU5sRe2bYyAkmfr7C7Wp1yF6TEbpWrCarJ7irlHLmG2NGm8HSeMBIDPW@vger.kernel.org
X-Gm-Message-State: AOJu0YxKD2bG/blubCaIbahjzl6zhMahPIR0qgXzrgbrGCK5UXc/eJNj
	1bLuCo5Z9Oiafk36VSHZEAeLHnjpabaL4NcXSMVenSbzznp259PgMY4ZKrV/YA==
X-Gm-Gg: ASbGncs/hk0uTYceMay8DqC7D6jHktVF+9riHAan3ti2YklAYbNK/cskCjcM2KJDPdH
	ZRSCh4MS/xR3ij7l8LVUA96QD3xG+K81qlmnv61gV63PnaN/Z/qxKrtcP+vyN7dd3bso5qS7dpj
	EzKp+TTGC51/dl06him5cOPtZCrJMRJVpAPrv0XShQqSrC9jkU7wEWZWL1xD0rzGHmg2k+Eyub8
	HQyf/dnGSsUL8b1OyWVUBu/so0I35LmX8Co6KfXKiKLC3rDmTEET0Mcxdl3Zoc51iWCC4Yg34Tc
X-Google-Smtp-Source: AGHT+IERsInGKvMTJwDEekT7zUQ/SqNr1OWxECv7WnReZ50o5l0ZIy479qmOPxldyGbLGh45fTS6jg==
X-Received: by 2002:a17:902:da85:b0:216:4676:dfb5 with SMTP id d9443c01a7336-21a83c721c1mr6200665ad.21.1736280496985;
        Tue, 07 Jan 2025 12:08:16 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:2961:4bbc:5703:5820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm314263425ad.55.2025.01.07.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 12:08:16 -0800 (PST)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] arm64: cputype: Add MIDR_CORTEX_A76AE
Date: Tue,  7 Jan 2025 12:06:01 -0800
Message-ID: <20250107120555.v4.4.I151f3b7ee323bcc3082179b8c60c3cd03308aa94@changeid>
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

From the TRM, MIDR_CORTEX_A76AE has a partnum of 0xDOE and an
implementor of 0x41 (ARM). Add the values.


Cc: stable@vger.kernel.org # dependency of the next fix in the series
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

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


