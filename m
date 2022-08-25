Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FF85A0816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 06:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbiHYEj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 00:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbiHYEjU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 00:39:20 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25989DF8D
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 21:39:18 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w29so12983481pfj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 21:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3KyRgv8hegXuoHwOoJcSpm7cTVHkbcINYODdP8Z8XpI=;
        b=v/H9zxvhtl2J3M9N7FR9/foaL0A+u4iiIPvRwiZX90d83BTGli2+7efH5E5fB2qhFB
         ryFdkNJL+4x6CsK+wwELVB4kwgZXuqPBF05Vx4eey1tBHVhsqGkM2VOtbxGmLj6SmVrK
         7ZVrQd7CnpMUSzTiHXfc1ui8ZV8nLZzBQxF09sV1+btQKe9ESkm1ZVFgk4KfydU0RB2q
         LjVDPDNcZ3noQTTuSKowFlcEEhOwopCFbkLlG2AfH8Smt0H6GRY62P+8xLGYDKI6YvTq
         lFCYZ+I6wJKLNUeOhLH4QRz2E09g++SgMVV8CkFlKLJMYir7wz8QGXMw2jEagEszIPxh
         8fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3KyRgv8hegXuoHwOoJcSpm7cTVHkbcINYODdP8Z8XpI=;
        b=y1o6IEUl4r+xdmHQ3rZ93xV0xQFSeGD9KzqiuYbA1CvORyyCE0afy78C93Bkatj+wr
         khxRxUkKwT0HNQxaHIL/7Le6XY2VluN5df5fKPKyvbMNnJ9zMC+H8K53/8SIUnvGQltU
         A/K/yi9vuhZYLn8rHtwRfwPu4XsKDNeLfd0urlIAbmC0dM9ad5Sl4mwTfGRzBP5hJbRJ
         8mY9Lahz7+EOQTgSHrAdE5YhxyiEjSSIv2zpMR3DrMYoTZzArIgXZv1GVhOxCx2YaQo3
         f/+Ds0RwpCTF3CnuI65exTdkKhaKUmsMS5t+e9tk3tXEOmepij9XBSL5b8rxtk22TYnv
         uqFw==
X-Gm-Message-State: ACgBeo3rnrKOBRu+ZOCTCx53+dXJA13G8n1QW3564HfGVka9cOe2THSg
        bS+s9LM8/kT/2GXaCkPi85dE
X-Google-Smtp-Source: AA6agR470cIRW2Jy2/jd+NIpGwIMEgX1doUyfJxPSUXY7kBozvwE0HSboioPAAZG60EAwI9gSZw1/w==
X-Received: by 2002:a63:cf0b:0:b0:419:f140:2876 with SMTP id j11-20020a63cf0b000000b00419f1402876mr1779091pgg.303.1661402358445;
        Wed, 24 Aug 2022 21:39:18 -0700 (PDT)
Received: from localhost.localdomain ([117.207.24.28])
        by smtp.gmail.com with ESMTPSA id i11-20020a17090a64cb00b001fa9f86f20csm2294296pjm.49.2022.08.24.21.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 21:39:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, bp@alien8.de, mchehab@kernel.org
Cc:     james.morse@arm.com, rric@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_saipraka@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/5] soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver
Date:   Thu, 25 Aug 2022 10:08:56 +0530
Message-Id: <20220825043859.30066-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
References: <20220825043859.30066-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC EDAC register offsets varies between each SoCs. Until now, the
EDAC driver used the hardcoded register offsets. But this caused crash
on SM8450 SoC where the register offsets has been changed.

So to avoid this crash and also to make it easy to accommodate changes for
new SoCs, let's pass the LLCC version specific register offsets to the
EDAC driver.

Currently, two set of offsets are used. One is starting from LLCC version
v1.0.0 used by all SoCs other than SM8450. For SM8450, LLCC version
starting from v2.1.0 is used.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c       | 66 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h | 30 ++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 0dc2bb0c23cc..8b7e8118f3ce 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -104,6 +104,7 @@ struct qcom_llcc_config {
 	int size;
 	bool need_llcc_cfg;
 	const u32 *reg_offset;
+	const struct llcc_edac_reg_offset *edac_reg_offset;
 };
 
 enum llcc_reg_offset {
@@ -296,6 +297,60 @@ static const struct llcc_slice_config sm8450_data[] =  {
 	{LLCC_AENPU,     8, 2048, 1, 1, 0xFFFF, 0x0,   0, 0, 0, 0, 0, 0, 0 },
 };
 
+static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
+	.trp_ecc_error_status0 = 0x20344,
+	.trp_ecc_error_status1 = 0x20348,
+	.trp_ecc_sb_err_syn0 = 0x2304c,
+	.trp_ecc_db_err_syn0 = 0x20370,
+	.trp_ecc_error_cntr_clear = 0x20440,
+	.trp_interrupt_0_status = 0x20480,
+	.trp_interrupt_0_clear = 0x20484,
+	.trp_interrupt_0_enable = 0x20488,
+
+	/* LLCC Common registers */
+	.cmn_status0 = 0x3000c,
+	.cmn_interrupt_0_enable = 0x3001c,
+	.cmn_interrupt_2_enable = 0x3003c,
+
+	/* LLCC DRP registers */
+	.drp_ecc_error_cfg = 0x40000,
+	.drp_ecc_error_cntr_clear = 0x40004,
+	.drp_interrupt_status = 0x41000,
+	.drp_interrupt_clear = 0x41008,
+	.drp_interrupt_enable = 0x4100c,
+	.drp_ecc_error_status0 = 0x42044,
+	.drp_ecc_error_status1 = 0x42048,
+	.drp_ecc_sb_err_syn0 = 0x4204c,
+	.drp_ecc_db_err_syn0 = 0x42070,
+};
+
+static const struct llcc_edac_reg_offset llcc_v2_1_edac_reg_offset = {
+	.trp_ecc_error_status0 = 0x20344,
+	.trp_ecc_error_status1 = 0x20348,
+	.trp_ecc_sb_err_syn0 = 0x2034c,
+	.trp_ecc_db_err_syn0 = 0x20370,
+	.trp_ecc_error_cntr_clear = 0x20440,
+	.trp_interrupt_0_status = 0x20480,
+	.trp_interrupt_0_clear = 0x20484,
+	.trp_interrupt_0_enable = 0x20488,
+
+	/* LLCC Common registers */
+	.cmn_status0 = 0x3400c,
+	.cmn_interrupt_0_enable = 0x3401c,
+	.cmn_interrupt_2_enable = 0x3403c,
+
+	/* LLCC DRP registers */
+	.drp_ecc_error_cfg = 0x50000,
+	.drp_ecc_error_cntr_clear = 0x50004,
+	.drp_interrupt_status = 0x50020,
+	.drp_interrupt_clear = 0x50028,
+	.drp_interrupt_enable = 0x5002c,
+	.drp_ecc_error_status0 = 0x520f4,
+	.drp_ecc_error_status1 = 0x520f8,
+	.drp_ecc_sb_err_syn0 = 0x520fc,
+	.drp_ecc_db_err_syn0 = 0x52120,
+};
+
 /* LLCC register offset starting from v1.0.0 */
 static const u32 llcc_v1_reg_offset[] = {
 	[LLCC_COMMON_HW_INFO]	= 0x00030000,
@@ -313,6 +368,7 @@ static const struct qcom_llcc_config sc7180_cfg = {
 	.size		= ARRAY_SIZE(sc7180_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sc7280_cfg = {
@@ -320,6 +376,7 @@ static const struct qcom_llcc_config sc7280_cfg = {
 	.size		= ARRAY_SIZE(sc7280_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sc8180x_cfg = {
@@ -327,6 +384,7 @@ static const struct qcom_llcc_config sc8180x_cfg = {
 	.size		= ARRAY_SIZE(sc8180x_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sc8280xp_cfg = {
@@ -334,6 +392,7 @@ static const struct qcom_llcc_config sc8280xp_cfg = {
 	.size		= ARRAY_SIZE(sc8280xp_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sdm845_cfg = {
@@ -341,6 +400,7 @@ static const struct qcom_llcc_config sdm845_cfg = {
 	.size		= ARRAY_SIZE(sdm845_data),
 	.need_llcc_cfg	= false,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sm6350_cfg = {
@@ -348,6 +408,7 @@ static const struct qcom_llcc_config sm6350_cfg = {
 	.size		= ARRAY_SIZE(sm6350_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sm8150_cfg = {
@@ -355,6 +416,7 @@ static const struct qcom_llcc_config sm8150_cfg = {
 	.size           = ARRAY_SIZE(sm8150_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sm8250_cfg = {
@@ -362,6 +424,7 @@ static const struct qcom_llcc_config sm8250_cfg = {
 	.size           = ARRAY_SIZE(sm8250_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sm8350_cfg = {
@@ -369,6 +432,7 @@ static const struct qcom_llcc_config sm8350_cfg = {
 	.size           = ARRAY_SIZE(sm8350_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v1_reg_offset,
+	.edac_reg_offset = &llcc_v1_edac_reg_offset,
 };
 
 static const struct qcom_llcc_config sm8450_cfg = {
@@ -376,6 +440,7 @@ static const struct qcom_llcc_config sm8450_cfg = {
 	.size           = ARRAY_SIZE(sm8450_data),
 	.need_llcc_cfg	= true,
 	.reg_offset	= llcc_v2_1_reg_offset,
+	.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
 };
 
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
@@ -776,6 +841,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->cfg = llcc_cfg;
 	drv_data->cfg_size = sz;
+	drv_data->edac_reg_offset = cfg->edac_reg_offset;
 	mutex_init(&drv_data->lock);
 	platform_set_drvdata(pdev, drv_data);
 
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 9ed5384c5ca1..bc2fb8343a94 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -78,11 +78,40 @@ struct llcc_edac_reg_data {
 	u8  ways_shift;
 };
 
+struct llcc_edac_reg_offset {
+	/* LLCC TRP registers */
+	u32 trp_ecc_error_status0;
+	u32 trp_ecc_error_status1;
+	u32 trp_ecc_sb_err_syn0;
+	u32 trp_ecc_db_err_syn0;
+	u32 trp_ecc_error_cntr_clear;
+	u32 trp_interrupt_0_status;
+	u32 trp_interrupt_0_clear;
+	u32 trp_interrupt_0_enable;
+
+	/* LLCC Common registers */
+	u32 cmn_status0;
+	u32 cmn_interrupt_0_enable;
+	u32 cmn_interrupt_2_enable;
+
+	/* LLCC DRP registers */
+	u32 drp_ecc_error_cfg;
+	u32 drp_ecc_error_cntr_clear;
+	u32 drp_interrupt_status;
+	u32 drp_interrupt_clear;
+	u32 drp_interrupt_enable;
+	u32 drp_ecc_error_status0;
+	u32 drp_ecc_error_status1;
+	u32 drp_ecc_sb_err_syn0;
+	u32 drp_ecc_db_err_syn0;
+};
+
 /**
  * struct llcc_drv_data - Data associated with the llcc driver
  * @regmap: regmap associated with the llcc device
  * @bcast_regmap: regmap associated with llcc broadcast offset
  * @cfg: pointer to the data structure for slice configuration
+ * @edac_reg_offset: Offset of the LLCC EDAC registers
  * @lock: mutex associated with each slice
  * @cfg_size: size of the config data table
  * @max_slices: max slices as read from device tree
@@ -96,6 +125,7 @@ struct llcc_drv_data {
 	struct regmap *regmap;
 	struct regmap *bcast_regmap;
 	const struct llcc_slice_config *cfg;
+	const struct llcc_edac_reg_offset *edac_reg_offset;
 	struct mutex lock;
 	u32 cfg_size;
 	u32 max_slices;
-- 
2.25.1

