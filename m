Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3E665B147
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjABLmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232744AbjABLmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:42:01 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126FCF0D
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:42:00 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so24592560lfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5BQ+1OykJNJsHs5tcaOG30ml/uGVrBU87LMcPdV8zM=;
        b=fRM/fxDlUALu6ECRXeB8H4JGEENdHMfeVFBr4nnIjeAV1DMReAGdy+VQmFSBnoxrR4
         +fM6gGKxZuiN0uc1VijxgzkEIL5/4JpW/istSlmPsEsVOrtRIP71t0tzyJpfv1Mzwt0D
         6P0SryFFkmoz9JUo24GfQq8H/ULD/8LvMiFqiM6KQeIU1uqbtpSsM0fmRB4cI5mh42Vt
         mm6aOywOIBYU5dhjUDkfq1Hkkue6jP/8lsP04XOxCReEqu1S+8P4vXFZjk9iZ37AgMvw
         EoiWOjGMXnPhRiEp8nIThcy7mPCsvoj5UlJHSK1OAVs3b6bxqw/AmrsBmAo19cHgym40
         Tg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5BQ+1OykJNJsHs5tcaOG30ml/uGVrBU87LMcPdV8zM=;
        b=0aIUCLCamcB0qpkgm5fv2WWwNahLD7qCVpeTnRE0ya638yUT7gcvLG/dDc9ehN0zJM
         pitwtPC4M2keQBFAguNeJGHrFwgtQmxGMFqlwDbomDlX4QdAMPL+tVjI2dxg0OQx4BOB
         eGp4kHZpc3wJHt2y1OsevZTlKLDKjICUWRMYsmY9CaSKETovuv9PbLTiDc50ox9oGGY/
         ky32MpFB1Ji9HcaSs9yrGHLQuNUwW8khRbO6DdPL/aEmNyPFAKaJCBqAN+TAfdYykRC4
         CYoGMUdxHGUKOLm3Bcw3l+oMMU736UZ0/57T54GL2awiXEijRm7DvaM27c0h+ittYcYt
         0szA==
X-Gm-Message-State: AFqh2kro4CZ2yZw/uth5/F0UV69gOR+RjEbFDlWR6M3h7zileW1/dnx9
        N5+4t9hcthUTll7F7WLjw/5wIA==
X-Google-Smtp-Source: AMrXdXuGQ9JzQqwc2ZeEFIxkrXF2oicM9ZNu1cH2soNd9yHwRX/GsnC8xzPw/8AsZ3PhXrftAw3/ag==
X-Received: by 2002:a05:6512:b0c:b0:4b5:97cf:8f1a with SMTP id w12-20020a0565120b0c00b004b597cf8f1amr13379095lfu.40.1672659718470;
        Mon, 02 Jan 2023 03:41:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:41:58 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] ASoC: codecs: wsa881x: Simplify &pdev->dev in probe
Date:   Mon,  2 Jan 2023 12:41:46 +0100
Message-Id: <20230102114152.297305-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
References: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The probe already stores pointer to &pdev->dev, so use it to make the
code a bit easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 6c8b1db649b8..cd7be55f6a89 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1113,20 +1113,20 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	struct wsa881x_priv *wsa881x;
 	struct device *dev = &pdev->dev;
 
-	wsa881x = devm_kzalloc(&pdev->dev, sizeof(*wsa881x), GFP_KERNEL);
+	wsa881x = devm_kzalloc(dev, sizeof(*wsa881x), GFP_KERNEL);
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(wsa881x->sd_n)) {
 		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
 		return PTR_ERR(wsa881x->sd_n);
 	}
 
-	dev_set_drvdata(&pdev->dev, wsa881x);
+	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
-	wsa881x->dev = &pdev->dev;
+	wsa881x->dev = dev;
 	wsa881x->sconfig.ch_count = 1;
 	wsa881x->sconfig.bps = 1;
 	wsa881x->sconfig.frame_rate = 48000;
@@ -1149,7 +1149,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	return devm_snd_soc_register_component(&pdev->dev,
+	return devm_snd_soc_register_component(dev,
 					       &wsa881x_component_drv,
 					       wsa881x_dais,
 					       ARRAY_SIZE(wsa881x_dais));
-- 
2.34.1

