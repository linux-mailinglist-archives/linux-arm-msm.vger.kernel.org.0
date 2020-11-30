Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BC92C8137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 10:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgK3Jk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 04:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgK3Jk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 04:40:57 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D33C061A48
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:58 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id t12so1023892pjq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9/sVIVJ9gHynZQM3T8+B+L6di5fUU2mQNFRrCieXIo=;
        b=BFuY6eXMLe1zoh0gq3N62PNbmyRMWcg8FS3ufseZUcGqhGLAj6XhZ26cXqxaj5sPf5
         08RvwH6MqMq2Cg1JQUV7SAoIZ4fjPLnb14dzfN9emzjF0rVbFAraWVZRQkQlgtEgGSMm
         Si5C8/049UNjS+q6q1P9UYeYDoK5sFlk79Kuw+pzPs7QAXVA3cN5gODfyJUkWdC57D0W
         9U6Vyoh1lDalGPO/MxENEjNxzWwLEW0+RkYuQa4my9xy1hpyi3nsYwwym543I8+jwr5+
         c+VgMnXPYEriGN8omKsn7Pm2x8+4icBUXSAlzlKSTwb3KPwK4bgKWy1JBTkP91FthcFH
         eWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9/sVIVJ9gHynZQM3T8+B+L6di5fUU2mQNFRrCieXIo=;
        b=WXwU+48mCKjjBiU25dd05NAOknwtid74RqL//OHick6RK6aOE+xSKk+luZs+l8K8oL
         Bao1GdrIVA0uu3PwP+7pQIuKHHMF6TkPhaAaZQoHmezVE9R5YiFzSsox8FtelNmU9Aqz
         iD8906hkHPKmBU/uB3iZUquge/auypUgfp49MbzYzx3KUuUWDhjy3s1WKFd2x9AbmK1q
         YG2G7sBVQJLUR1+y4OnWTe9SjDkkD8sfBBMg813CCw4K546Klu6n1o0YZl2XgkU/eXP8
         YotPfqJU4+9A2l8TWOCNaeRLN/UOoNgGPbu8x61EYLJsCLm59zG09MOaytcdKmiVp9z4
         6GNg==
X-Gm-Message-State: AOAM530GBU87lsYqWwaANH/C45KdBMRMENdTLHqwSZUqby/wmku6kzw8
        PTjBnQoQO0cyurFOvwD1CkXF
X-Google-Smtp-Source: ABdhPJw/SBMYM6pTUB4lrLGYDeZz1ABiBX173ADiCFGbCneqG0VSbk8u59gxWEzHFYn9XxKH3ipiHA==
X-Received: by 2002:a17:90a:c588:: with SMTP id l8mr9991777pjt.147.1606729198107;
        Mon, 30 Nov 2020 01:39:58 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6c0d:98b:4016:605b:102d:cbb8])
        by smtp.gmail.com with ESMTPSA id u14sm16348429pfc.87.2020.11.30.01.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 01:39:57 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, saiprakash.ranjan@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 4/4] soc: qcom: llcc-qcom: Add support for SM8250 SoC
Date:   Mon, 30 Nov 2020 15:09:24 +0530
Message-Id: <20201130093924.45057-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 SoC uses LLCC IP version 2. In this version, the WRSC_EN register
needs to be written to enable the Write Sub Cache for each SCID. Hence,
use a dedicated "write_scid_en" member with predefined values and write
them for LLCC IP version 2.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 38 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index a559617ea7c0..8403a77b59fe 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -51,6 +51,7 @@
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
+#define LLCC_TRP_WRSC_EN              0x21f20
 
 #define BANK_OFFSET_STRIDE	      0x80000
 
@@ -77,6 +78,7 @@
  *               then the ways assigned to this client are not flushed on power
  *               collapse.
  * @activate_on_init: Activate the slice immediately after it is programmed
+ * @write_scid_en: Bit enables write cache support for a given scid.
  */
 struct llcc_slice_config {
 	u32 usecase_id;
@@ -91,6 +93,7 @@ struct llcc_slice_config {
 	bool dis_cap_alloc;
 	bool retain_on_pc;
 	bool activate_on_init;
+	bool write_scid_en;
 };
 
 struct qcom_llcc_config {
@@ -151,6 +154,25 @@ static const struct llcc_slice_config sm8150_data[] =  {
 	{  LLCC_WRCACHE, 31, 128,  1, 1, 0xFFF, 0x0,   0, 0, 0, 0, 0 },
 };
 
+static const struct llcc_slice_config sm8250_data[] =  {
+	{ LLCC_CPUSS,    1, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 1, 0 },
+	{ LLCC_VIDSC0,   2, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDIO,    6, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_CMPT,    10, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
+	{ LLCC_GPUHTW,  11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_GPU,     12, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
+	{ LLCC_MMUHWT,  13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+	{ LLCC_CMPTDMA, 15, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_DISP,    16, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_VIDFW,   17, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_AUDHW,   22, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_NPU,     23, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_WLHW,    24, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_CVP,     28, 256,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
+	{ LLCC_APTCM,   30, 128,  3, 0, 0x0,   0x3, 1, 0, 0, 1, 0, 0 },
+	{ LLCC_WRCACHE, 31, 256,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
+};
+
 static const struct qcom_llcc_config sc7180_cfg = {
 	.sct_data	= sc7180_data,
 	.size		= ARRAY_SIZE(sc7180_data),
@@ -168,6 +190,11 @@ static const struct qcom_llcc_config sm8150_cfg = {
 	.size           = ARRAY_SIZE(sm8150_data),
 };
 
+static const struct qcom_llcc_config sm8250_cfg = {
+	.sct_data       = sm8250_data,
+	.size           = ARRAY_SIZE(sm8250_data),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -417,6 +444,16 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 			return ret;
 	}
 
+	if (drv_data->major_version == 2) {
+		u32 wren;
+
+		wren = config->write_scid_en << config->slice_id;
+		ret = regmap_update_bits(drv_data->bcast_regmap, LLCC_TRP_WRSC_EN,
+					 BIT(config->slice_id), wren);
+		if (ret)
+			return ret;
+	}
+
 	if (config->activate_on_init) {
 		desc.slice_id = config->slice_id;
 		ret = llcc_slice_activate(&desc);
@@ -571,6 +608,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
+	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
 	{ }
 };
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index d17a3de80510..64fc582ae415 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -29,6 +29,7 @@
 #define LLCC_AUDHW       22
 #define LLCC_NPU         23
 #define LLCC_WLHW        24
+#define LLCC_CVP         28
 #define LLCC_MODPE       29
 #define LLCC_APTCM       30
 #define LLCC_WRCACHE     31
-- 
2.25.1

