Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC51855DEB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241377AbiF1A3H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 20:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiF1A3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 20:29:06 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED57D63A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k129so4983065wme.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JhHo/c96RqUx3d1BSnJliVbZrX3rYoCTCoQbgEL1koc=;
        b=aQqKlx2nvthEI5iO+lZtBomWQE46C7nR5V8+E0UX9CBiYyfEPrxs1FIWpkUD1uTrrJ
         oDLPBcA4VNXrv/luMpXIUX2bsV/B0IxqbOXHcFdg1g6HdjWV+InlQrbQZPf/zd2KYxw4
         xbkgSd9Mc1wAKEuAQLX6N+iqgnmX63Yre6PwwPudj0haEg7bs25bdRgSpCcRfbZm/t7c
         +FDjRqmIh7XOedj/+n8RgCvDYwUWLBar7lL/Xb+lPFEEs8g6Fzz0MgnbMVDhuHoMqQd/
         pCGZajqqPtOCi4jMzLjcpDEnCzJCh/4NID3+aPaqFogjkBu/G2rJlgEqTrUqRSdxrihc
         viEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JhHo/c96RqUx3d1BSnJliVbZrX3rYoCTCoQbgEL1koc=;
        b=kP+HjxUt6z9Zg+hTNKuU47jaONx4QQbdyA90kVxtioOLQlIl7cuJ0k1qKz8+XfO6Ar
         JL7UFyRxsZQPOawjzWjsfIpXzzf5GFj8btTUYR8ckjUU0HRs5MuinZLwQcooQn8ZjoBu
         kQbvpF/segz9VlcirEq3j2FpWTa+ZAB6+HFAOhp64ZQnxEnINaPSyyL2WAtmqThzxAIu
         FZqsQ765g1wJeqFonkhPSTBiwfGY+8WyfGFIGZxsMUtW1yU3s9RwEN1raHT7h/rVUiIx
         p+g/fyY91c4HrpZjWCn6SFkTC+JBs7nBAypryIBxAljJYU8p2cauigvTcR8VGvAqAoLP
         OHPQ==
X-Gm-Message-State: AJIora851YpJTsEZxo1F22id8k4CrjpjOrRlr1yTxDW7k2Nb3pB/rBM4
        +Yu4K5s/W2zK8ZKyyKdKc2B0Dg==
X-Google-Smtp-Source: AGRyM1sNO9bsuFeQ5fHsF8c8Qskqwu0+/VCb/SKdTn8IG3y/OOaVd5SNGjQXVdS7iZrotMfL+w1x8g==
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id j6-20020a05600c190600b0039c7f823090mr22930876wmq.152.1656376143620;
        Mon, 27 Jun 2022 17:29:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 17:29:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
Date:   Tue, 28 Jun 2022 01:28:57 +0100
Message-Id: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 1 +
 sound/soc/qcom/lpass-cpu.c     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 3efa133d1c641..abaf694ee9a3a 100644
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
index e6846ad2b5fa4..53f9bf6581d33 100644
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
2.36.1

