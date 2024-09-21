Return-Path: <linux-arm-msm+bounces-32134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D911397DC2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 10:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25F671C20F22
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 08:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7D4155738;
	Sat, 21 Sep 2024 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVkrmkmC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1966E2D7B8
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726906662; cv=none; b=isshp63TgI/ZMBoL33T0Vbk4jLGfSoZ8mE4JSk+rUXFBwJQEGYDtFuv7bH8UYhO/0NJUo6PO40NQO8/6AXos6YjmzbDDEG05lyj1XY/7mjIJYTGfYO13F162CgzOelWKuupbSayApgs/m6cO5chxz0fBGqVEmJPsa95VQb0P23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726906662; c=relaxed/simple;
	bh=G6PowQr5FW3NdBDRADRSrKvw2U+ewXo5XcoYzvoJ6Pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIO9RmMoT+y0jMH2nrzPU/t0Ku8lFcu1L57AC2tMF7q6BX+wq2IKWWyNIaNGcPZCF3l8G8qsAef/r3ho9ZB2Tevr2p3MAEfWFaPHckzaSo5QFypSNSUyqhSnQ+VVCRks6+p0T1FMIPK7UoYtivmKDmiJa+DoBAON7NdhTue+tqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVkrmkmC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f66423686bso23818411fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2024 01:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726906658; x=1727511458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Od53nvDeJ6X0bdgIyj/l8ko1IVye/qAo8uvg9IuTxGE=;
        b=pVkrmkmCCcCyHnAtBzgQICROgSFWWAQ2pTtWpbpzkhOLVEDuMpXiRrPQudCdvO7mVt
         5AZQIA5nfLknYf147Xydxo2GXUW83Q2KrCgrNvOX38hlMxfyYsuVe2dl3JoF32CbgCCb
         RPH5aDlTFUUrm3xajYgYiivZeoAgdzC0GMRtSKjshrPhMkJDGU8HLpoabIipjHITyaKf
         focj7KnsRc4JL4FJuHYBqoJnDsPbPRKFog2DazG/j/w19hOnBQk8MqHz4mEnwmMgenFA
         I9FKQ2tuu2apvdvlLjQvrmQLwtfM07Btk68WeAKdht5gMBUDcO2lVze0M+F8ICc9iH0+
         D9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726906658; x=1727511458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od53nvDeJ6X0bdgIyj/l8ko1IVye/qAo8uvg9IuTxGE=;
        b=q/TOkGFEf3lApa2KTWeb+wcnNuxE6JpSuQlQxcgPnqgHF+v3lPO/JatJH80cl5WHPa
         QDE2QxQ3ZFwCJI/Jn2ldzMTTpi+F8dmtnLsL2ey+4Y2CPaMSWhOfXSJSSCMSuc3HOFAp
         gNF5JpFDJMkpo3Mb+Dxvh93c4yJlQVzms3ygUtj0Ej9mKo7FfMvkZCZUMtGDYrTkz36j
         cAPWUJ1WAYDE9T+8NCA06ybeZo+sF9KEfaFF0ZbaZq6XDz1xevGg7R2XRPS7xaZ8HReU
         TgczFhOMT+5eE5sZbZbIZ1y/WbrUHjSodC/PJe1SRS1/xBC85/DnDQYQRPKXWvtjxC64
         ZAPw==
X-Forwarded-Encrypted: i=1; AJvYcCUbxJph4HHBXTYInUXOGUZpLJrcIa4ylTM/4UVEwhQtCsVB6txMA+rkBYYR07XZ1nr30VpYkVHaqXc43omF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp7nawzmd8aD8PpscRh7iZJWz1PlYct77psHnfIAPATNa6DEdJ
	pRtIGgaukimkgkgX+AtLxdih4eXda4kIRT6Mnh8nrx8kdhHUiXDE6TwTJpbza4g=
X-Google-Smtp-Source: AGHT+IETJ3Ky8mWo/JLPiPgVUT28m25lTztokOWEmapijuMHe9ti1rkaEQDPEbL5hoAyCuOwe3QvXQ==
X-Received: by 2002:a05:6512:2208:b0:536:14a1:d645 with SMTP id 2adb3069b0e04-536ad3c9aefmr2997424e87.44.1726906658018;
        Sat, 21 Sep 2024 01:17:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 01:17:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:30 +0300
Subject: [PATCH 2/4] drm/msm/mdss: use register definitions instead of
 hand-coding them
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-2-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=G6PowQr5FW3NdBDRADRSrKvw2U+ewXo5XcoYzvoJ6Pw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEf05dbGt5Lc6aHVGnCmSnC98kTf0qX6d9UE
 NnCD/w7AaqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHwAKCRCLPIo+Aiko
 1dcDCACg5ArOXMPZTRiJhXhrpweO8bTOXVhdYdh/WLR70YN5xSIeKiL6XFSJMwK2Sf/5QdIPwit
 nyF2N7SRgIbtc5i6+CPjY1UnAd4jC3KbAJYj5xXbEvcse3JL7J69jyo9EjN+3fkdRpGdaebVPtJ
 gvge8Of9xdqhu4ruDUrXLtOhly39eJNgQuZp4IaSLE+7uSWXfPbUXte0KdBVEwvLKobTzVjBfn0
 xA5B6HQSvB6Jazb6SxWSGLE+lYFDlPIQdF79sOxj2e10qYxDDVY3te0rhlXJ96j6aAtZHe4z5x7
 Xu2D+JHnnr5aRg2XxLNx2zE4tc/6TsbAe2E3UD2sKbf10bkE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move existing register definitions to mdss.xml and use generated defines
for registers access instead of hand-coding everything in the source
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c                 | 35 +++++++++++---------------
 drivers/gpu/drm/msm/registers/display/mdss.xml |  6 +++++
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index faa88fd6eb4d..ca9b7f953ac4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -19,13 +19,7 @@
 #include "msm_mdss.h"
 #include "msm_kms.h"
 
-#define HW_REV				0x0
-#define HW_INTR_STATUS			0x0010
-
-#define UBWC_DEC_HW_VERSION		0x58
-#define UBWC_STATIC			0x144
-#define UBWC_CTRL_2			0x150
-#define UBWC_PREDICTION_MODE		0x154
+#include <generated/mdss.xml.h>
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
@@ -83,7 +77,7 @@ static void msm_mdss_irq(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	interrupts = readl_relaxed(msm_mdss->mmio + HW_INTR_STATUS);
+	interrupts = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_INTR_STATUS);
 
 	while (interrupts) {
 		irq_hw_number_t hwirq = fls(interrupts) - 1;
@@ -173,7 +167,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
 
-	writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(data->ubwc_static, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
@@ -189,7 +183,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= BIT(8);
 
-	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
@@ -200,21 +194,22 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 		    (data->highest_bank_bit & 0x7) << 4 |
 		    (data->macrotile_mode & 0x1) << 12;
 
-	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
 	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 	} else {
 		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + UBWC_CTRL_2);
+			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
 		else
-			writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 	}
 }
 
-#define MDSS_HW_MAJ_MIN		GENMASK(31, 16)
+#define MDSS_HW_MAJ_MIN		\
+	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
 #define MDSS_HW_MSM8996		0x1007
 #define MDSS_HW_MSM8937		0x100e
@@ -235,7 +230,7 @@ static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_m
 	if (!data)
 		return NULL;
 
-	hw_rev = readl_relaxed(mdss->mmio + HW_REV);
+	hw_rev = readl_relaxed(mdss->mmio + REG_MDSS_HW_VERSION);
 	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
 
 	if (hw_rev == MDSS_HW_MSM8996 ||
@@ -334,9 +329,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
 		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + HW_REV));
+			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
 		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
 		break;
 	}
 
diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
index 9354cfffb730..ac85caf1575c 100644
--- a/drivers/gpu/drm/msm/registers/display/mdss.xml
+++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
@@ -18,6 +18,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="INTR_HDMI" pos="8"  type="boolean"/>
 		<bitfield name="INTR_EDP"  pos="12" type="boolean"/>
 	</reg32>
+
+	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
+
+	<reg32 offset="0x00144" name="UBWC_STATIC"/>
+	<reg32 offset="0x00150" name="UBWC_CTRL_2"/>
+	<reg32 offset="0x00154" name="UBWC_PREDICTION_MODE"/>
 </domain>
 
 </database>

-- 
2.39.5


