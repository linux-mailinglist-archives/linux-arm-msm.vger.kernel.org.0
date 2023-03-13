Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2776B70A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 08:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjCMH6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 03:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCMH4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 03:56:51 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D512411B
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:14 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id j11so44926089edq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quQo6pOhl6y8TGUcX12fIubQW+W2OiQtrC5VDkiwRuk=;
        b=FOhQOPd5JL9G9LS9ORK5Tji01kJl5AJ98t96Ikcs9U/qDgDFeFkfqxrIzDQsO05JxD
         y3WIcezf3tcFpujDCymKjzdHTabONYch5BPxnUfO7I8gFbAZTkUnJ9umO6flB7RF7Eu3
         UA4pXvDc6YXRfw9XQpYdKu8cJYvza1zsppgxR2wwX6p+CjiQrMQV+z+To24UR+SiujKA
         MLGBGAYgFwLi39jGNxnv//5KN5zzQgw8ZaBTZJ9Ohm3RzVQlunGvv7LzC0x55DEywziY
         W4y5rsIkZLUaGBPPlkCoWicOfp6ovwqFO8113JI258DA8x7wYOnNQCU+Z+da+hchLoA+
         O42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quQo6pOhl6y8TGUcX12fIubQW+W2OiQtrC5VDkiwRuk=;
        b=nsQyTJhqfu3FlAbFofbu+ERX4a07pNOZvOC0fHlDBCwZSLjikvgxFFMFTnMWjg0jNq
         EpZB845gQCX0uEXBKGGkGvSbOjcIPgIXra2l+ggcfRFHfEwg7dHwVWvrxZT2s/aZob16
         5qUzKg7ithmrOeZKR/m/fQSEe7so+ZWavBqkHIrvWM+QsbfTP8spq/6BEfyjgrQVvuZ8
         NrBQSczYgCN3LDQ9vrC9A1QLieTgJTh7zSkyADDpskjOwOfJER4Zz8hOlUeC5n9oj7Oj
         aKwtPRRlOYZ4mWUs6X+913U5U211DHXQNaTWy5Xw7dw0c8PZkYni7HuivQGUaSj+EktR
         X5+g==
X-Gm-Message-State: AO0yUKU8Pn+UgRVoRsVvKwcroPQwfVQzrYMlFCseyOkZvwtfNmj5umK9
        gGDmeGtJYQUoTwVrYpxKuMmsbQ==
X-Google-Smtp-Source: AK7set/3PbFHdZy0ncdvyVkLVLkp6VS6VNXlpvP6aWjTg5xS1ztRZBKbr4EAVGSBtJBAdS22Zc6Ozw==
X-Received: by 2002:a17:907:6e03:b0:888:a72f:1599 with SMTP id sd3-20020a1709076e0300b00888a72f1599mr40929581ejc.11.1678694100270;
        Mon, 13 Mar 2023 00:55:00 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 9/9] ASoC: codecs: lpass-wsa-macro: add support for SM8550
Date:   Mon, 13 Mar 2023 08:54:45 +0100
Message-Id: <20230313075445.17160-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
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

Add support for the WSA macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-wsa-macro.c | 37 +++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ba7480f3831e..881b3154cc69 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
+
+#include "lpass-macro-common.h"
 #include "lpass-wsa-macro.h"
 
 #define CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
@@ -2346,7 +2348,10 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->npl);
+	if (wsa->npl)
+		parent_clk_name = __clk_get_name(wsa->npl);
+	else
+		parent_clk_name = __clk_get_name(wsa->mclk);
 
 	init.name = "mclk";
 	of_property_read_string(dev_of_node(dev), "clock-output-names",
@@ -2379,9 +2384,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct wsa_macro *wsa;
+	kernel_ulong_t flags;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
 	if (!wsa)
 		return -ENOMEM;
@@ -2398,9 +2406,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->mclk))
 		return PTR_ERR(wsa->mclk);
 
-	wsa->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(wsa->npl))
-		return PTR_ERR(wsa->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		wsa->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(wsa->npl))
+			return PTR_ERR(wsa->npl);
+	}
 
 	wsa->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(wsa->fsgen))
@@ -2553,10 +2563,21 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 };
 
 static const struct of_device_id wsa_macro_dt_match[] = {
-	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
-	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-wsa-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.34.1

