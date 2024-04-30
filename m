Return-Path: <linux-arm-msm+bounces-18856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338E8B6757
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 03:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A7D1F21B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 01:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EB21FA4;
	Tue, 30 Apr 2024 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YcylMBQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0331870
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 01:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714440014; cv=none; b=d9riIZiL/mE/Z1MOejMLtZE1rSsWcssfD8UcI6pr5XSI0y5fvqdzzsjo0OJthgfG3AR/R4VXFS8T1s0N45g9KL+kpo7M8CHK9Gubayaw7zReQvqoW8FN+BnsrCjNIGZLAB7znKpN2WVuaPb0MZHm6J0eACAVaDvvJkIMYN38cEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714440014; c=relaxed/simple;
	bh=t8WE1+fA8j81+AJkUCcorxLRWwscCfXSF46thI/6wwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyBK1rSCFV/XCgpN6RIrOOvbPKAPuWpSdkCrQyAWGPMES8bkNtRBS7E4/pUKBg4VnD08N/sAtgKpPfO/ZkfX6JH0gR8IdB+TOHAMhFDALX5KVLKuiK+F+/7TEEZRiXvJusyj8ZA3PU2tgNjn6zfMpBR/5vtdviEWg4PO8Bu/Wa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YcylMBQ3; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-518a56cdc03so5729023e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 18:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714440011; x=1715044811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=YcylMBQ3aftXzwFfj0XGnqIaLRQJ3+gabqjz56UOobbVwNoX2sV5CBaB8fmdnnvS+W
         VJj7G9cxfJQEnydPSiRwHGPclwNu7ZginTklUdi7fuWD2MUO0+/S4n/ikg5px7ecmmON
         I3EhEN3Kn5Gs1kTeste+bWfmfq7S/nfgZpe2OcdORyAPsljH61o9eAvPQeQOF1VU4OAU
         xg9TvZq3dI/93KezPo/MUP3qdhezfFTiItZ+S3CK9jk29v6NSaeHP6GWYwrlfI8h/5Qn
         MLKE5/mIXarToNsDtd2ZfYCJFZWjhmWZiVSI5h4p8AI6bndFMdlnuEI0Z0XYkScSI9sX
         MMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714440011; x=1715044811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dsfoDrDqhFi2M0qRhXB0Rpx7fbnSThvVod9k+rsj1w=;
        b=tXG47TeBAaBN/e32u0wYhA9AdNBE8Bbuiqj6fl+RvpIq76pjz3AXt6ymj6Pjz5N5+C
         y0HHBOj2RCVBhVMwBivBuxURXhXBJ9wsTLT8n8Mn22N+4OVeSqTlE9+dAMyOQrarsTyq
         sOTirUoCDCFPoIvMGhgjr2hZWHwzrwENnzQBaR7V0YYP6aHR8i4Fsbm6DiRdvYnogVif
         qlKxm1jXLO1iVh8amU2K9jmheEDk5ENLbdBSmLF/bQbYO94nrWa2bwGQSZ84vdTmopuQ
         SdpR2lo9HhshXdQ8tqGpJQ0Vx28IyKTLkZx6CSgz6+m2pCqBgfdmByTUEhvf2LDOVFBM
         2CLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv1+0VobssMQV6Ql2qUqFZXvjMTUcQFm49iMnoR62QMX/WJJwV2SQn4XVa/C43/GC0n4RXKPRKtX+PZo8pGU7PMNfrZdsXtSUeUWkQBA==
X-Gm-Message-State: AOJu0Yyn1AkjQBAivfD0QcZaCZZyYengQr7WtVjeq567zGN8ERVfgfs7
	u1MBYDMNP+++wKXwPFVE1WIwkEOuPJHrDnjH9nUuR4G51iqjN6hlblVrG+AYAAU=
X-Google-Smtp-Source: AGHT+IE79pdb3H2E5Nq28zFBUGJK9MOIsMcVZQXlavIWFjq+RNrNoGOlCeHKSWbpCQGMq8i/ELvcoA==
X-Received: by 2002:ac2:58ca:0:b0:518:e69b:25a2 with SMTP id u10-20020ac258ca000000b00518e69b25a2mr6947187lfo.45.1714440011192;
        Mon, 29 Apr 2024 18:20:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 17-20020ac24851000000b00518a01fdf2asm4322096lfy.144.2024.04.29.18.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 18:20:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Apr 2024 04:20:08 +0300
Subject: [PATCH RESEND 1/2] ARM: add CLIDR accessor functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-armv7-cacheinfo-v1-1-e3d1caa40dc5@linaro.org>
References: <20240430-armv7-cacheinfo-v1-0-e3d1caa40dc5@linaro.org>
In-Reply-To: <20240430-armv7-cacheinfo-v1-0-e3d1caa40dc5@linaro.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=t8WE1+fA8j81+AJkUCcorxLRWwscCfXSF46thI/6wwA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmMEdIjLCQZ2SQ2cybmALKMcsD4fzlk7p9Q2Qnf
 h7P8hLmmG6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZjBHSAAKCRCLPIo+Aiko
 1T0RB/wLwtHcsFKJHNF9r3i5xCA+7YDktL+lV1oTMWZBkAzXladfQXnaEabnTx/+0ZJct/rd/xr
 D82d2k0Ng/bxq2S+7ygkiCaqhM0Q9Z2CIl//L3Hlp0BGD7DD/8C/O96biCJKW9Br+Th/AL2yZYG
 cTb/V9HFpJ0N5WFgCGHHMVdZL6jbsxw+mJdoH0dx2gTMNDvla5Mmt8LRmwMoiCKEdHpcw1cadYS
 OVV+jgwvjrRozZebtOBPIZT1fFswWr/HMZqqUURXNueynlLSzFPKdfyE4u1jtA5mG6ZGt6u+EKy
 you5CNpc7ZbXiALAgaNnQvVBsy22O8svkz46TosSsyLJxFI7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add functions to read the CLIDR, Cache Level ID Register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/include/asm/cachetype.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/include/asm/cachetype.h b/arch/arm/include/asm/cachetype.h
index e8c30430be33..90203a6d7270 100644
--- a/arch/arm/include/asm/cachetype.h
+++ b/arch/arm/include/asm/cachetype.h
@@ -81,6 +81,14 @@ static inline unsigned int read_ccsidr(void)
 	asm volatile("mrc p15, 1, %0, c0, c0, 0" : "=r" (val));
 	return val;
 }
+
+static inline unsigned int read_clidr(void)
+{
+	unsigned int val;
+
+	asm volatile("mrc p15, 1, %0, c0, c0, 1" : "=r" (val));
+	return val;
+}
 #else /* CONFIG_CPU_V7M */
 #include <linux/io.h>
 #include "asm/v7m.h"
@@ -94,6 +102,11 @@ static inline unsigned int read_ccsidr(void)
 {
 	return readl(BASEADDR_V7M_SCB + V7M_SCB_CCSIDR);
 }
+
+static inline unsigned int read_clidr(void)
+{
+	return readl(BASEADDR_V7M_SCB + V7M_SCB_CLIDR);
+}
 #endif
 
 #endif

-- 
2.39.2


