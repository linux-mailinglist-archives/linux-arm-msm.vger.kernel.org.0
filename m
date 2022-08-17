Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C66859723C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240564AbiHQPAV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 11:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240556AbiHQO7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521FE9C2FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d14so19308727lfl.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=NUd8YryzxRUKn1lcURqTFfrnvxH9vHeWn1VsvKW9iig=;
        b=X94iDojcPqsc1MVcqiyBO0Rc/p1LrbebWyIoLVLo3aBStEdpS+QC8TrdEbidnjg4Bx
         tKyjqKm94/vS2njDCCIBDbGPwcCF7b9JZmuYNEp1YFKKsSaqnD3X43N+dLofZ+UE9qCj
         CQ/ukvtL8ZKUcQYXyHObZj0Y0XHUyhat8d3A/5FrxW/Vj95zXa29G6ydLVjJ3cRSk1xu
         KWlj81RQE9XtmkCmFyTTxepN5qzh/kV4yHBFNMi6T88Dt32fI84ivLiTGdPW5H3Pt+Di
         81z0YvzDxuyF4De97ANdGYemSLoMsA/qBIhMxAcnsvW3JV7sRywC+djOFY5Nu35+ceAj
         hntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=NUd8YryzxRUKn1lcURqTFfrnvxH9vHeWn1VsvKW9iig=;
        b=B7RlHx7AseixaZMlTtbdhHp5gNLJekvTDkhsYPUtGEnYzSYYBDL6VlU1A+hs2kHdKx
         +hNb7sb5+V//lDzl6CpBunb2cmmcO/84Oa59078OSHdBnqieJxanosm+sgVnvpE2f7Ho
         HiEIv4M9BAV+bIObNEpWhixalsWL7TNaCvWsSBRo2x+p2et+XcM3rDxkJP/nm18I/GQz
         J40gUi9TUB/1REHEXdg3y2LdLTB0rqXWTiKTF1Aqxreu608T/jqHBK2+EnTlkGHw5sqs
         Hjqalm5XnKMzpMvD8zRUBSDd5Nqb2xWWIitCCUjF1ocgzXNqlBgIQyBHwh1LLPY4U1Pr
         dN/Q==
X-Gm-Message-State: ACgBeo0k30RBO3i4LDVtiGI50h4fgtIya3rgZ8jPQ0wUTjKGYXQH4sin
        x1a1eaPnLLREtg8P0oUfbGi0ow==
X-Google-Smtp-Source: AA6agR4RSstN4AsKO4iD80D30PudaMWh5bcYIRT4EmuYsRZg8cf11wL7Zym3HyM0FOKMZtMoIpC/1Q==
X-Received: by 2002:ac2:4ac7:0:b0:48a:ee18:aa57 with SMTP id m7-20020ac24ac7000000b0048aee18aa57mr8438371lfp.660.1660748356530;
        Wed, 17 Aug 2022 07:59:16 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 06/17] hwspinlock: qcom: add support for MMIO on older SoCs
Date:   Wed, 17 Aug 2022 17:58:50 +0300
Message-Id: <20220817145901.865977-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
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

Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
of 0x1000.  Add dedicated compatibles and regmap for such case.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 42 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 9734e149d981..9cf186362ae2 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -22,6 +22,7 @@
 struct qcom_hwspinlock_of_data {
 	u32 offset;
 	u32 stride;
+	const struct regmap_config *regmap_config;
 };
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
@@ -73,15 +74,42 @@ static const struct qcom_hwspinlock_of_data of_sfpb_mutex = {
 	.stride = 0x4,
 };
 
-/* All modern platform has offset 0 and stride of 4k */
+static const struct regmap_config tcsr_msm8226_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x1000,
+	.fast_io		= true,
+};
+
+static const struct qcom_hwspinlock_of_data of_msm8226_tcsr_mutex = {
+	.offset = 0,
+	.stride = 0x80,
+	.regmap_config = &tcsr_msm8226_mutex_config,
+};
+
+static const struct regmap_config tcsr_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x20000,
+	.fast_io		= true,
+};
+
 static const struct qcom_hwspinlock_of_data of_tcsr_mutex = {
 	.offset = 0,
 	.stride = 0x1000,
+	.regmap_config = &tcsr_mutex_config,
 };
 
 static const struct of_device_id qcom_hwspinlock_of_match[] = {
 	{ .compatible = "qcom,sfpb-mutex", .data = &of_sfpb_mutex },
 	{ .compatible = "qcom,tcsr-mutex", .data = &of_tcsr_mutex },
+	{ .compatible = "qcom,apq8084-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,ipq6018-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8226-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8974-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
+	{ .compatible = "qcom,msm8994-tcsr-mutex", .data = &of_msm8226_tcsr_mutex },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
@@ -117,14 +145,6 @@ static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
 	return regmap;
 }
 
-static const struct regmap_config tcsr_mutex_config = {
-	.reg_bits		= 32,
-	.reg_stride		= 4,
-	.val_bits		= 32,
-	.max_register		= 0x20000,
-	.fast_io		= true,
-};
-
 static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 						 u32 *offset, u32 *stride)
 {
@@ -133,6 +153,8 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 	void __iomem *base;
 
 	data = of_device_get_match_data(dev);
+	if (!data->regmap_config)
+		return ERR_PTR(-EINVAL);
 
 	*offset = data->offset;
 	*stride = data->stride;
@@ -141,7 +163,7 @@ static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
-	return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
+	return devm_regmap_init_mmio(dev, base, data->regmap_config);
 }
 
 static int qcom_hwspinlock_probe(struct platform_device *pdev)
-- 
2.34.1

