Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0F955D8BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239654AbiF1MFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239659AbiF1MFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:05:05 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 712AA2496C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:41 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b26so4971316wrc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HA9Ju9WiWYMyHFa1RrEaM+Jl1wBHz+W0Kvbk+W2ZI4Q=;
        b=s3A+Tjnt6L5ct+uXElLKqAN+RCi5Q53fO2x4+Lzy+vMSEPrAskYDKsEIbQDI7w7tI+
         BkcCMWR8tlHAfFSk0Qf5L9EFZ5wJr+pMq0V0N5nR+pR4Z5v35M/HZBo6moSF2Rf0cJSF
         MU3va6nFgqpve/F6jHPiKzY+HlZ/EHa05HsVqDGsq5HQJ9sCpVb1oEzepj5TBDdYGZc+
         aWEUJIuF5VpSwwLGimI1H/X8mYZQE0NjZBkbk/vdaj6qcvwedpmJ9bxQqqLHR9OJfkP3
         yR8RfEoyctyjpiEP48XQ+jeeJO2aU4wlCJO4u+p+xN/i2iIWLGtDHLfxycSCX20my76B
         lipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HA9Ju9WiWYMyHFa1RrEaM+Jl1wBHz+W0Kvbk+W2ZI4Q=;
        b=FJwEczaCnZXd3Wcj2dVXjDj175X1UHGg8Wdd0VqeB4Wl4iJa7uGbWeV8gM883mgTRp
         FjDBsccO/34ndUrGGc+XWRujaS2QW/xcBQMZB1EEZDYW6+JL9PeeD5Wp0KmtVhxX0jDg
         l6D0hl/mIYZ8HJ1NuYPhiBNNfvwphBBIJ1gn2RB7eQPAY64bID/M0IKV9GxD8Cd3p+Mp
         WoEiTkV/D2lewhsNOjJpyEIdVYywxwx2UNUbaphl5aRpL5beMPLhzAvJgANK061Po5n1
         j3zrX41f4G/B2mSwDbrjEhgkehXAToslTdAcBIGxPuMDVLhkSA15l4FoL83z+b5v0E4U
         PbWQ==
X-Gm-Message-State: AJIora/60Gaz7NfPrLh/IoDsAwU5iBdahP0c7lyiZ6Oy8Ac/6X+2V4tu
        GsWfbLGOsfw2zPp45zwm2iRaqw==
X-Google-Smtp-Source: AGRyM1sCchwbqLWnT1eNhxSqPMIG3TnWhGdLsWF7fS7Cdz6ZFQdvj+vTi0FG+ORF366s/y1KfIOaXw==
X-Received: by 2002:a5d:64aa:0:b0:21b:c38b:bb81 with SMTP id m10-20020a5d64aa000000b0021bc38bbb81mr14388793wrp.666.1656417879960;
        Tue, 28 Jun 2022 05:04:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p20-20020a1c7414000000b003a05621dc53sm1457737wmc.29.2022.06.28.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:04:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
Cc:     perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v5 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
Date:   Tue, 28 Jun 2022 13:04:34 +0100
Message-Id: <20220628120435.3044939-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
References: <20220628120435.3044939-1-bryan.odonoghue@linaro.org>
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

