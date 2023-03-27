Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDF56CA591
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjC0NXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbjC0NX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:23:28 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F385F55A5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:14 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cn12so36198991edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL1Hi3X0orGZTBrm+1PohiZFQrgy9knLwvGCmFqK1Xc=;
        b=Y+QiFOvkoqdFUWtBEhtuaG3ENcUwaPQw5O/C1BVM5MnukIWz3KPjKdTbde9AGcCGbr
         xs4Sai9ih6pqOrwrpRgv4dXEJ9OaUVAvD5PVdyak4uqjeAoEXNJuFu0RxKZA1UYsWA8h
         Ct8jjVagOr2e8iROSq3X1x0os3hoaAhMOYqO01D+/0X6EOaEJOY/g8ftG+//brU22kkZ
         DS5H0VlnhvyWpDRjtvYqipy+zk1NlexO7XOkNmOofhGeflF7v2ECsrnWmKktKGe9DI00
         zFiT5Jh0xjGOixgjwvyXc3ugZ8vqoPGsY1mOMiY+Sk+En+kFkR3PiV9wWWJYiHzL4Y1K
         V9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL1Hi3X0orGZTBrm+1PohiZFQrgy9knLwvGCmFqK1Xc=;
        b=ca+AzAJ+TgJTylOoTRb/wji1exFmjjEeEQ2mj7fGvXPa6Dn1TS+6sfBt44D4GCxrVa
         d5jx9QWMLxvpukKGL5d7xLCFDH4fFxz41EdX0NlSKwgbisMJNogwOr7AdQSMC6o6F7OK
         DPYza6v+bWMyTSKm+XCU+uXC0ho3seVt8O7IekyE68Od/xdvOiVkVDyk+NZQfSaiB1pJ
         l0GmahHLeegoPeAeiSTByZKIRzApEeTCPtAdaQvqOtzKj66qWvs2T7eHBKSBmJYea1D3
         yzgXhUWxhHqA1GW/hu/LCL0VO5DZ97kmUIwPuNh+PNKMqKnHfFLDsBNudPCGLzok60fL
         dEMw==
X-Gm-Message-State: AAQBX9d/jGWZuXQSHnACGC/d+I1/q9PQfOO37SjzKabr/SFDCTNzTTT7
        qA8XJEPu/dgUuAqN1fYsGoOL+ReeOVC+cwg1qwU=
X-Google-Smtp-Source: AKy350ZfC8HTAQDloW4dKgWmhG0qTpvb72a26hXxIRE6FS5bAyc7xOdoQoKtpuE6vQm9cU/MZw8NHg==
X-Received: by 2002:a17:906:6c91:b0:932:615c:33d4 with SMTP id s17-20020a1709066c9100b00932615c33d4mr12433354ejr.34.1679923393086;
        Mon, 27 Mar 2023 06:23:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Patrick Lai <quic_plai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/10] ASoC: codecs: lpass-rx-macro: add support for SM8550
Date:   Mon, 27 Mar 2023 15:22:47 +0200
Message-Id: <20230327132254.147975-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the RX macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 36 +++++++++++++++++++++------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index f2cbf9fe2c6e..4eb886565ea3 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -6,6 +6,9 @@
 #ifndef __LPASS_MACRO_COMMON_H__
 #define __LPASS_MACRO_COMMON_H__
 
+/* NPL clock is expected */
+#define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+
 struct lpass_macro {
 	struct device *macro_pd;
 	struct device *dcodec_pd;
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 372bea8b3525..685ca95ef4a9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3491,7 +3491,10 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->npl);
+	if (rx->npl)
+		parent_clk_name = __clk_get_name(rx->npl);
+	else
+		parent_clk_name = __clk_get_name(rx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -3521,10 +3524,13 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 static int rx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	kernel_ulong_t flags;
 	struct rx_macro *rx;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
 	if (!rx)
 		return -ENOMEM;
@@ -3541,9 +3547,11 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(rx->mclk))
 		return PTR_ERR(rx->mclk);
 
-	rx->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(rx->npl))
-		return PTR_ERR(rx->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		rx->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(rx->npl))
+			return PTR_ERR(rx->npl);
+	}
 
 	rx->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(rx->fsgen))
@@ -3653,10 +3661,22 @@ static void rx_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
-	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+
+	}, {
+		.compatible = "qcom,sm8250-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.34.1

