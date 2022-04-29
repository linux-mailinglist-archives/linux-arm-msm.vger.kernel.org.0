Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216D75157D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 00:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350072AbiD2WHP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 18:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239116AbiD2WHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 18:07:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A1ADC5A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:03:54 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id k126so1910687wme.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2mHHs9RiQ0Cwt9nao+8sO16iLMStFW4oWbdufcxBAas=;
        b=f8f/c/cTt3LssA9qXtjrOXFQPPavMOVTGZzpLcbXhurIAQzfWMJoP3GCLGl0ZMonWM
         eV/vF62G+AYpTnkUY9OO93Vj2WXHdG200uV5F2iwpR/aH4FHQEw1peimC2U55a6hkI+E
         m8Vf4wiQ9wE06sG/+b9X+82stcqLaMIWac0hauq9j4E5kSwhUdInDaieIB0f2inIelJg
         tMbDepMlC1zBlf09k6orCogIpEYFkzg51S31VaJ8GTFCa/VQ7KkKuyftLaqDtwp2UFiy
         GzfW95tvh3wQ2liE4YD6ZSsetNNl77It0r15PPtxV0fz6ikkACMzhx8EoYKeZKZ6rOSw
         TbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2mHHs9RiQ0Cwt9nao+8sO16iLMStFW4oWbdufcxBAas=;
        b=tgO3zYqGb4A1u+IV5q0KnxilnEYnq0FciVsfSzKL4K+poLRkLpPBICgQuAxd+imAJU
         v/hbjpiWIMlygvoMqMj0/kwzj9hkUiIoWH4aTzaD9ABjbmEL5S8zO8lUoR8Y3dkJ+0LF
         LNSCk+0FZVG/zrzn/TEp9prw0F2sW9r4vtHzPHgz16v1Qt7W/a2K2TztDDe0I9Xjpj4x
         00NrGUPPus8PcefihitPWxdrk3Ko0aVvr2fIUGB4YBB3YpweUIZ023kIWrAgibTZrJgU
         ay8XrqQNgNl7zxdOtII5jh3wHDFXi3qI7A29RUYQd2s8ocs49F3AvRWpnr++zYEufvcX
         3j2A==
X-Gm-Message-State: AOAM5327DGuanTcZnBpdtfG1L4iHgpgvusNXYJ+D+idz/Iv4gIx+0yba
        dq6TyJSS0C9LyGE8X2fUgq1xeg==
X-Google-Smtp-Source: ABdhPJx10OSweAWnFAfVBF8dE47IPSunHd4vm9HIlx8cMrsY5ylg8dBwo2QKcmir6edFrtpmwqXphQ==
X-Received: by 2002:a05:600c:3503:b0:38f:fbd7:1f0d with SMTP id h3-20020a05600c350300b0038ffbd71f0dmr857994wmq.170.1651269833182;
        Fri, 29 Apr 2022 15:03:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020adfc70f000000b0020c5253d90dsm338311wrg.89.2022.04.29.15.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:03:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
Date:   Fri, 29 Apr 2022 23:03:48 +0100
Message-Id: <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
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

The documented yaml compat string for the apq8016 is
"qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
lpass compat strings the general form is "qcom,socnum-lpass-cpu".

We need to fix both the driver and dts to match.

Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 1 +
 sound/soc/qcom/lpass-cpu.c     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 3efa133d1c64..abaf694ee9a3 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -293,6 +293,7 @@ static struct lpass_variant apq8016_data = {
 
 static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
+	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e6846ad2b5fa..53f9bf6581d3 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1102,6 +1102,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	if (!match || !match->data)
 		return -EINVAL;
 
+	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016")) {
+		dev_warn(dev, "%s compatible is deprecated\n",
+			 match->compatible);
+	}
+
 	drvdata->variant = (struct lpass_variant *)match->data;
 	variant = drvdata->variant;
 
-- 
2.35.1

