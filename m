Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4127D62D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbjJYHcC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjJYHbt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:31:49 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B932DD
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:31:44 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4084095722aso43369995e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219102; x=1698823902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtHL7LpE3QD2/IvlMAVMaT0urMhUDFq2xkJqxNBcDXs=;
        b=e2Ol219B7q4fQlqNVtFJjhjdwCPUX6PWxf17OUTeapTn4sC2KMCGU5P6DFU0QsgIGB
         fuRV25hbOFuwT1SxTA+Z5TGHQRZVTyu3n97cUBj16+vibUQE1VpSvpMXYSZbBbSJNvF5
         ZNkP/oVjafxpBa9pJCA0MobW5AFny5O9DShPh/aA0FrmmeLo8g/IMxMl7bkCJXl4Epny
         TpTIugx/feT4QOABUSim4FJf4KTut5CUt/5bfdG6xle3Z/p+ybdSeDGIgqG1lAgYpX2x
         dLQood3f8d46lta885UMTuRRNxaQlYV6A1psN5BI1r5Ti1UYfvTjNcSdTFdFpxM7ASAe
         21JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219102; x=1698823902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtHL7LpE3QD2/IvlMAVMaT0urMhUDFq2xkJqxNBcDXs=;
        b=AQy8kt0a9HQBR5QJd07YizmUvSzOu0YMnJEglEba9k2vM8zZfhUwFWIcsFlJpn9UXy
         Qv85ngEbUmng5M6g5/aB7UvB0dX19Cgt0kKgCSLgNg+ZoKDeZezGaNPD+EyjgpsM2djs
         cTWhrpMgbvSydr7uCT9CsI+aC6tT6V+xIhUl/N52p+LhSM79jEBJjGgJPhfy9RNMe5KK
         7AA27EPT9tPk8Hl6TNpZvgRm4+sMZosmUFCGcKydU6PM0X5B3h+W3r+0HgnalOcxgSNa
         7EbgFlPfjw+dQ5Hoxr9pLeEbsBJ5Xmd++R22S6yvb4EdkcU2CzDT49U4239jVSi895F/
         rkMw==
X-Gm-Message-State: AOJu0Yz5tO9RXio8UvsHYNVIrFD0YXZ7gu4ppG9oo5FgqtAF3mzN7aBK
        l0S5NnlQ7//ahnL4QTO/Xt9/zA==
X-Google-Smtp-Source: AGHT+IGPF3ntvMBLZTzR73Jpnus1FdCBUouAAb1ke7apMhAFUBqTwGZ27NpmPpckgDyQOI3Cp3SXpA==
X-Received: by 2002:adf:fcca:0:b0:32d:a221:446 with SMTP id f10-20020adffcca000000b0032da2210446mr10372758wrs.59.1698219102110;
        Wed, 25 Oct 2023 00:31:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d17-20020a5d6451000000b0032da022855fsm11412184wrw.111.2023.10.25.00.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:31:41 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:31:37 +0200
Subject: [PATCH 2/2] soc: qcom: llcc: Add configuration data for SM8650
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-llcc-v1-2-ba4566225424@linaro.org>
References: <20231025-topic-sm8650-upstream-llcc-v1-0-ba4566225424@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-llcc-v1-0-ba4566225424@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4489;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=WqW786t7q9+ihDgpJN44FgB1Jae/JlXTjR9cUVFHX5Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMRaLRiIOl73vjQW8a+WDffq8SPP3C0JS4B0l1jT
 wfRBWAiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjEWgAKCRB33NvayMhJ0cpYEA
 Ct4IzhYMW1f+Sui+qm/asTGqy7frjqZIkG345PgKXxwKsLYK+sjfeCKVYf6KgIoCYtBLasUcg3USWx
 6IEH3mJ4OiuaO32Kz7t8GZ6tI5j1PjSc7UwMSZkcr2LwXcqAMA1PgvFln+6hAleZrI/KN0Fb1WIOGC
 63QzgdXcaJJifYSmEEGQIn0WzdFXupJXk/tssjkkiPIT1OZcrC+7gDceNyKpFjmNge3o0PIiFZbhjN
 B9i1SfjKILTTS0I2eklKu+40e+CAeRMvO5Pcx1SPNlq5HMNiF6ZLa5+53GTOCp/Z1O+W2h2g9ISw+x
 LzG2Id5SHBZFE5KtBehPwYZOZ1aDuJHskXaq9gnfi2rriIlHW7z+y3LWQFe7x6zyR0O70BOxYkhwUl
 h72bzUD6u8bUL3AWB4JMdniAyqjhs5/JJlQ5JLKzQ4S56GtYc85QTU74dii4XCRaK5WpUiIHF0JwD4
 0D/3GIGfyT5aejDT1wcrLXK8iJbIcPLmtc2t0SXZYqXarlvToSZ11aRUWkiZMH1v/WVeRdF0hgfzp3
 GsvL1iGedBZ8OEKCqA37jfWDml+BqwhmJvAhL+vC/DPh621BVfezmzaq2Er2uOWLqKNaQqfoV4ZrXZ
 Lv7jXPuyGY0iGeUT9DxpICwhDXpGbcAlQ3xAqTv+lIHIsQCBW+1v/pTDqWMQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Last Level Cache Controller support for the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 674abd0d6700..dddbba52b057 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -362,6 +362,32 @@ static const struct llcc_slice_config sm8550_data[] =  {
 	{LLCC_VIDVSP,   28,  256, 4, 1, 0xFFFFFF, 0x0,   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
 };
 
+static const struct llcc_slice_config sm8650_data[] = {
+	{LLCC_CPUSS,     1,    0, 1, 1,      0x0, 0x0,      0, 0x0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDSC0,    2,  512, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDIO,     6, 1024, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MDMHPGRW, 25, 1024, 3, 0, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MODHW,    26, 1024, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPT,     10, 4096, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPUHTW,   11,  512, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_GPU,       9, 3096, 1, 0, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MMUHWT,   18,  768, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_DISP,     16, 6144, 1, 1, 0xFFFFFF, 0x0,      2, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MDMPNG,   27, 1024, 0, 1, 0x000000, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_AUDHW,    22, 1024, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CVP,       8,  256, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_MODPE,    29,  128, 1, 1, 0xF00000, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_WRCACHE,  31,  512, 1, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP0,   4,  256, 3, 1,      0xF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CAMEXP1,   7, 3200, 3, 1, 0xFFFFF0, 0x0,      2, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_CMPTHCP,  17,  256, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_LCPDARE,  30,  128, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
+	{LLCC_AENPU,     3, 3072, 1, 1, 0xFFFFFF, 0x0,      2, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_ISLAND1,  12, 6144, 7, 1,      0x0, 0xFFFFFF, 0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_DISP_WB,  23, 1024, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+	{LLCC_VIDVSP,   28,  256, 3, 1, 0xFFFFFF, 0x0,      0, 0x0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
+};
+
 static const struct llcc_slice_config qdu1000_data_2ch[] = {
 	{ LLCC_MDMHPGRW, 7, 512, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0, 0 },
 	{ LLCC_MODHW,    9, 256, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0, 0 },
@@ -610,6 +636,16 @@ static const struct qcom_llcc_config sm8550_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config sm8650_cfg[] = {
+	{
+		.sct_data       = sm8650_data,
+		.size           = ARRAY_SIZE(sm8650_data),
+		.need_llcc_cfg	= true,
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_sct_config qdu1000_cfgs = {
 	.llcc_config	= qdu1000_cfg,
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
@@ -675,6 +711,11 @@ static const struct qcom_sct_config sm8550_cfgs = {
 	.num_config	= ARRAY_SIZE(sm8550_cfg),
 };
 
+static const struct qcom_sct_config sm8650_cfgs = {
+	.llcc_config	= sm8650_cfg,
+	.num_config	= ARRAY_SIZE(sm8650_cfg),
+};
+
 static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 
 /**
@@ -1249,6 +1290,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sm8350-llcc", .data = &sm8350_cfgs },
 	{ .compatible = "qcom,sm8450-llcc", .data = &sm8450_cfgs },
 	{ .compatible = "qcom,sm8550-llcc", .data = &sm8550_cfgs },
+	{ .compatible = "qcom,sm8650-llcc", .data = &sm8650_cfgs },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_llcc_of_match);

-- 
2.34.1

