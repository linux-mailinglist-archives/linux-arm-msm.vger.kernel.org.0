Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200C2389B0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 03:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhETBta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 21:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETBt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 21:49:29 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587C0C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:48:09 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 69so8103277plc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 18:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ir1Dpg3bgUq0v/H9js0abZRsZHQ5PmTY8mx+eB1aHs0=;
        b=PtufKgnmd6DXX0n+Vuz+quN0FhXP/QXYDqTuIbfCCrI+RpSi1wz08zBNGC8LZKvZfr
         6Rarw7f4CMCfDB3Z2FRqJgd7rRYjBj34A/6TGR/0TmJOlrfC53kLnN2c1X4JGAAPqSTW
         l5i/oyLhU1BOH2qUsvcGKVwx7q62nSJljlteI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ir1Dpg3bgUq0v/H9js0abZRsZHQ5PmTY8mx+eB1aHs0=;
        b=gR7gecNwj3BJ0h1u2bke0KrhDgc2n/ajBiPqq4DweaMmbYuyv/1gLBmEt/5EDrEQUu
         1Bkx87oQWhfBPi2Z6JOB2Vj8jqQVTcJeO6BwDnNpyHvtlInJJCAGzNoJNgatUa7oY7cW
         QJ48Fticuy12UfZDzmDV1gfMHhDy8XEn/F/Rxl2WDRstujTCBOvECF6Qxhuld3Wg8l3l
         oozWEx4C7YErjTP1vdDTwMm6BmG/2ldF+uoBspAE+9TOthhMypEpdMlNlDWt0RZfB5d7
         MvMrWryzYjc0aL3cgmqEfhJ3xnmnCONaT571akjhCIBJPk8PxFrRu2w0fXtOaKiRPe2c
         3CtA==
X-Gm-Message-State: AOAM530IaBf59trLAbgHkVbJrGxmE2HbKITisrkIn7COyFPQd7fjteZP
        bkKA623UCcMYFOam+KwPwTJ8+Q==
X-Google-Smtp-Source: ABdhPJz7N0VmwvOgwy+qH0pZAbQ7t9pnPLjhIpOgCLFaidWogYGP3K6a/k6jHeTHfiDGcnQs+GOsQg==
X-Received: by 2002:a17:902:f291:b029:f0:ba5b:5c47 with SMTP id k17-20020a170902f291b02900f0ba5b5c47mr2963239plc.41.1621475288909;
        Wed, 19 May 2021 18:48:08 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
        by smtp.gmail.com with ESMTPSA id v14sm490668pfi.25.2021.05.19.18.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 18:48:08 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>
Subject: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
Date:   Wed, 19 May 2021 18:48:07 -0700
Message-Id: <20210520014807.3749797-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver spits out a warning for me at boot:

 sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2

but it looks like it is all an optional clk. Use the optional clk APIs
here so that we don't see this message and everything else is the same.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@codeaurora.org>
Fixes: 3e53ac8230c1 ("ASoC: qcom: make osr clock optional")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-cpu.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c62d2612e8f5..28c7497344e3 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -835,18 +835,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (dai_id == LPASS_DP_RX)
 			continue;
 
-		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
+		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get_optional(dev,
 					     variant->dai_osr_clk_names[i]);
-		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
-			dev_warn(dev,
-				"%s() error getting optional %s: %ld\n",
-				__func__,
-				variant->dai_osr_clk_names[i],
-				PTR_ERR(drvdata->mi2s_osr_clk[dai_id]));
-
-			drvdata->mi2s_osr_clk[dai_id] = NULL;
-		}
-
 		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
 						variant->dai_bit_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {

base-commit: 6efb943b8616ec53a5e444193dccf1af9ad627b5
-- 
https://chromeos.dev

