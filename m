Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C41583DAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 13:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237058AbiG1Li3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 07:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiG1LiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 07:38:22 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F6567581
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:38:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t17so2491422lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vUNSXhigYPL6YxGm2dwwRSYcJw5sLrH/ALUNKD6VII=;
        b=XOJMgXpybulWrGv5BYGON9YiSnqxYrtIhsPEE+fdCvYm4cnp9bW1DaJLQ28XQgv4ni
         EZk+yYNnqO5zKpqfWWXOALRzrf3oUbkeLn0tbg5/CZ9zZISzsGjwgvIzFd8SBLDWWFTX
         nIp3ZdQqWOQDptA/nD+d7UzCtI0IODyRcLUw5qEnMZTNWA1zzFGT8xFQqvXtqdvpxL9c
         A5kwEiE2hC1Y2l0TDjnzAlmRinEWBOef8+x5pcpSsZXfEOXS3buN/LhBsMUMbe8JnqRO
         lZvqUe3A03W8cUTUjAEXApqkBZ9al4aMPKVYqRYZGunHGwnwBvPWuGzL4GX27NT6I0xm
         BRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vUNSXhigYPL6YxGm2dwwRSYcJw5sLrH/ALUNKD6VII=;
        b=yNOq1LQ/5wARvcTdVCewqfwEysQoFtLW71LLdmEc/m6rJF4+ObPWznK2Me3FkFo0Kv
         WlijNm8fzmmCwk/jG4TpcdSgHn0hAb2ctU+i/VYRmsRySf5HuhHgHsdWX3fYvwg/BVe2
         UIKxUDp/mfYyEg3pw3jVE7OYUXrpyhRUs759wykFJUAmfuRcaiYuIje9Y0Cwz8w5m76k
         7+Kfb9j6uZBFfGouTyvkhuRiphaD2tP+tG/XbYYcUa7yjZ/E1PfuXyoiZklRd0WSqnFC
         ousfP4mt2NZP+oVNR+rgNFs4GTBk5Y2Ircx0OrrFQus5ELc9keAo95x5jXt77GDPON9l
         MFXw==
X-Gm-Message-State: AJIora8Sr9/5z7S4cPUor2CfQX/jaqvahsfCKAMpNh/h8uAAu2L56/Q8
        akWukhcrEjQMUC0UzsfAXv539A==
X-Google-Smtp-Source: AGRyM1u4l5FrUVJW7COD2loUiZSWMDYea21EE9UTvzVI/D3j6i15Fo5HjsfTJdQqoa5lYZPE+dOlfg==
X-Received: by 2002:ac2:484c:0:b0:48a:7a62:6dd3 with SMTP id 12-20020ac2484c000000b0048a7a626dd3mr10869205lfy.455.1659008284090;
        Thu, 28 Jul 2022 04:38:04 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id l12-20020a2ea80c000000b0025e0396786dsm98192ljq.93.2022.07.28.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:38:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH v2 08/11] soc: qcom: icc-bwmon: add per-variant quirks
Date:   Thu, 28 Jul 2022 13:37:45 +0200
Message-Id: <20220728113748.170548-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728113748.170548-1-krzysztof.kozlowski@linaro.org>
References: <20220728113748.170548-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BWMON v5 lacks global interrupt registers.  Other BWMON versions differ
as well, so add quirks for easier customization of code flow.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/icc-bwmon.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 058c35d8dbbe..2e4a0fdfbf54 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -100,6 +100,9 @@
 
 #define BWMON_V4_ZONE_MAX(zone)			(0x2e0 + 4 * (zone))
 
+/* Quirks for specific BWMON types */
+#define BWMON_HAS_GLOBAL_IRQ			BIT(0)
+
 enum bwmon_fields {
 	F_GLOBAL_IRQ_CLEAR,
 	F_GLOBAL_IRQ_ENABLE,
@@ -136,6 +139,7 @@ struct icc_bwmon_data {
 	unsigned int default_lowbw_kbps;
 	u8 zone1_thres_count;
 	u8 zone3_thres_count;
+	unsigned int quirks;
 
 	const struct regmap_config *regmap_cfg;
 	const struct reg_field *regmap_fields;
@@ -270,14 +274,16 @@ static void bwmon_clear_irq(struct icc_bwmon *bwmon)
 	 * interrupt is cleared.
 	 */
 	regmap_field_force_write(bwmon->regs[F_IRQ_CLEAR], BWMON_IRQ_ENABLE_MASK);
-	regmap_field_force_write(bwmon->regs[F_GLOBAL_IRQ_CLEAR],
-				 BWMON_V4_GLOBAL_IRQ_ENABLE_ENABLE);
+	if (bwmon->data->quirks & BWMON_HAS_GLOBAL_IRQ)
+		regmap_field_force_write(bwmon->regs[F_GLOBAL_IRQ_CLEAR],
+					 BWMON_V4_GLOBAL_IRQ_ENABLE_ENABLE);
 }
 
 static void bwmon_disable(struct icc_bwmon *bwmon)
 {
 	/* Disable interrupts. Strict ordering, see bwmon_clear_irq(). */
-	regmap_field_write(bwmon->regs[F_GLOBAL_IRQ_ENABLE], 0x0);
+	if (bwmon->data->quirks & BWMON_HAS_GLOBAL_IRQ)
+		regmap_field_write(bwmon->regs[F_GLOBAL_IRQ_ENABLE], 0x0);
 	regmap_field_write(bwmon->regs[F_IRQ_ENABLE], 0x0);
 
 	/*
@@ -290,8 +296,9 @@ static void bwmon_disable(struct icc_bwmon *bwmon)
 static void bwmon_enable(struct icc_bwmon *bwmon, unsigned int irq_enable)
 {
 	/* Enable interrupts */
-	regmap_field_write(bwmon->regs[F_GLOBAL_IRQ_ENABLE],
-			   BWMON_V4_GLOBAL_IRQ_ENABLE_ENABLE);
+	if (bwmon->data->quirks & BWMON_HAS_GLOBAL_IRQ)
+		regmap_field_write(bwmon->regs[F_GLOBAL_IRQ_ENABLE],
+				   BWMON_V4_GLOBAL_IRQ_ENABLE_ENABLE);
 	regmap_field_write(bwmon->regs[F_IRQ_ENABLE], irq_enable);
 
 	/* Enable bwmon */
@@ -543,6 +550,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
 	.default_lowbw_kbps = 0,
 	.zone1_thres_count = 16,
 	.zone3_thres_count = 1,
+	.quirks = BWMON_HAS_GLOBAL_IRQ,
 	.regmap_fields = msm8998_bwmon_reg_fields,
 	.regmap_cfg = &msm8998_bwmon_regmap_cfg,
 };
-- 
2.34.1

