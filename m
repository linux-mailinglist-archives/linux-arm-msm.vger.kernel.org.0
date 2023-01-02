Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6FA65B14B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 12:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjABLmK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 06:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjABLmC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 06:42:02 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDB2E80
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 03:42:01 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id j17so31759465lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 03:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3ISjc0HqFZLXSFtXhlmeBjb8PLOBicDWq3ocAujh1c=;
        b=GK4P+qO5a7tUHbIu3KBEzJQf+LXCryVD3sQnn0/7NhmYDIr3J7AYo+OB/fW8fZRrBg
         aA7rscY8x7m82EAsVDetQNaiAXOuNr+95LtYickbCC2H/l1964yv+w+s32rhWGfywqcJ
         0vtSPyK9cxBxBJd972wcNTeNZZ11+frK8GIHZ4HgeDMWkyQwLJieUypa9+gXiOLZC2wZ
         Rj4Pdeh8UUaYaF5msURa97gdfPBDbM0VVBi1r1FEydq+7V7Rqrd78iPbDyF+uzDP1mfu
         dvqc7v539aBZBsQxIkEuFKfT+F0WYZdn4VHA7b94NHfrpAuebipeb+h+RwMjqOP6v4Yz
         VJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3ISjc0HqFZLXSFtXhlmeBjb8PLOBicDWq3ocAujh1c=;
        b=0uLsJCX1PJQOi/mRoNnTbRBqIWNX7Hmc9DWBUrppw12XmJrzgHVtlHhWGIU5qOWW8w
         MGGq2LL7iudMkN87dt8N1VKe/8mnsKhPshYIc6NALtD/RZS/XdNt7u9GPu4e8wj66RfG
         AZNQLmdE3XEj5E88JORm2XQDLETTFTmTzVnYmqoOVOtALuKGV0FVaAImzlr1Ko8MTd7L
         MsX3yLE0ymKPuR1ZmrjB2h92UeMypm4Tujl3uhrLcP7jqD333V0HH0Z2qOyHOK2+UTJK
         ilHHznEr8rb62S9EXLV8uhBR0evpcVngpZFqjn3aHMIgD1RWGaq8+NSkoDX0mfHPBeJp
         eaVw==
X-Gm-Message-State: AFqh2krY1YnglArnJ3R7f6obVrEPacV41p46jcYphmEQ9RMlC0tCW6yV
        s7hN16eAS2CI3jziMuMFLDwBfA==
X-Google-Smtp-Source: AMrXdXs9h8TiI5V7XQ5q+QwTxLi/FoTFF6VfTsBp3p4U0gG5FenWvfu1LJLWKzWit66ydiavrRVL5A==
X-Received: by 2002:a05:6512:4005:b0:4b5:9183:5ad0 with SMTP id br5-20020a056512400500b004b591835ad0mr14368017lfb.63.1672659719657;
        Mon, 02 Jan 2023 03:41:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 03:41:59 -0800 (PST)
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
Subject: [PATCH 3/8] ASoC: codecs: wsa881x: Simplify with dev_err_probe
Date:   Mon,  2 Jan 2023 12:41:47 +0100
Message-Id: <20230102114152.297305-3-krzysztof.kozlowski@linaro.org>
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

Code can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index cd7be55f6a89..6df9c48f42bf 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1119,10 +1119,9 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 
 	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	if (IS_ERR(wsa881x->sd_n)) {
-		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
-		return PTR_ERR(wsa881x->sd_n);
-	}
+	if (IS_ERR(wsa881x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
+				     "Shutdown Control GPIO not found\n");
 
 	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
@@ -1138,10 +1137,8 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	gpiod_direction_output(wsa881x->sd_n, 1);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-	if (IS_ERR(wsa881x->regmap)) {
-		dev_err(&pdev->dev, "regmap_init failed\n");
-		return PTR_ERR(wsa881x->regmap);
-	}
+	if (IS_ERR(wsa881x->regmap))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->regmap), "regmap_init failed\n");
 
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
-- 
2.34.1

