Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E593E5B4652
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 14:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiIJMrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 08:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiIJMrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 08:47:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4634B57895
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:47:08 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k10so7262852lfm.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=iQQMZWiQo60j4E8YQUdNFlg6xHQjLMTSCPZx/5k4hto=;
        b=MGW6RT+7ZRjAWILA/5uFm4gR97jAJj0QfVSM8Zo/X0c9zGgFZCTx/Zsv19yB8Q8BLz
         /xNboDe78nfP2PZnKz3o5QBwopctGDbppuXNNK4qXqmPrhYUgMXcgcnMb3CplkpTw5H3
         dxgXhw3i82MJOdpsRpoMJQPP9godsawwJUborzILUCsjvjLRYF4K3mSmaJykvSmP1/jx
         X4W6BLp74fl1Ql1bz4g9T2dmtmuVI8SE5Am9Yz/iKpsNZPL4NYakGoVbdH/ILSuBmYhB
         U5vAdxI5Eotb3HZb43AUnkXcvFtMEMuoit/viVxgZZFpJCFEt1xrY46dsA/g4V5Hbmn0
         C0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iQQMZWiQo60j4E8YQUdNFlg6xHQjLMTSCPZx/5k4hto=;
        b=nuPfs9dbRmxqE0g/fpysw73AB1LRZxDmrQ8H+D+Kzs3/shaLADk8P7/jBjzbZTYdIl
         /ynHDnnif3qgSJahiy+PEoVNQx6klgo+gtJ61SSq5p2/AOFWgdn3ou573CngW3qDlQTI
         8VwzC/pVK9h1PtebWWiKO6iYYLv8+/jIWTk0cWN6DTW+WrrMd1YMC7vEHQgtNzXpH/OG
         cYz+XZAuNS1Me0hCLMlQ03DG7oq38Dwoy3qZ5r0wipxs7MDgzAGKz68Sm5SvaITwKrgN
         ZrcWE9FyTzxvjk7uwWNpFY/eopR77ser1y5jM80782n5yl8wqoVQt8BWSTknZkCQ2+Wf
         fvfw==
X-Gm-Message-State: ACgBeo1PuW9xIkt56qPTKmkl1H5QqmaQPFP6LYPCt1VUkxJtHuDRnIre
        qYuNQpotFeVhO0cBANvJQKYElg==
X-Google-Smtp-Source: AA6agR4BnPZ6R3AXFRgr/POumn5pPb4h25fzYSApp5BkcRMA+nkRVqSRAdRsKR0Ddr5um+h5VLeR4g==
X-Received: by 2002:a05:6512:114e:b0:498:76c2:658a with SMTP id m14-20020a056512114e00b0049876c2658amr4424699lfg.672.1662814027719;
        Sat, 10 Sep 2022 05:47:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k14-20020a2e920e000000b002677a3ad1d9sm327463ljg.76.2022.09.10.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 05:47:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [RFC PATCH 06/10] thermal/drivers/tsens: use generic calibration routine for msm8976
Date:   Sat, 10 Sep 2022 15:46:57 +0300
Message-Id: <20220910124701.4060321-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
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

According to msm-3.10, msm8976 uses the same routine for processing
calibration data as other platforms. Drop the msm8976-specific
compute_intercept_slope_8976() and use compute_intercept_slope().

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v1.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index e6ef3bacfc39..11363a318ae8 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -137,30 +137,6 @@
 #define CAL_SEL_MASK	7
 #define CAL_SEL_SHIFT	0
 
-static void compute_intercept_slope_8976(struct tsens_priv *priv,
-			      u32 *p1, u32 *p2, u32 mode)
-{
-	int i;
-
-	priv->sensor[0].slope = 3313;
-	priv->sensor[1].slope = 3275;
-	priv->sensor[2].slope = 3320;
-	priv->sensor[3].slope = 3246;
-	priv->sensor[4].slope = 3279;
-	priv->sensor[5].slope = 3257;
-	priv->sensor[6].slope = 3234;
-	priv->sensor[7].slope = 3269;
-	priv->sensor[8].slope = 3255;
-	priv->sensor[9].slope = 3239;
-	priv->sensor[10].slope = 3286;
-
-	for (i = 0; i < priv->num_sensors; i++) {
-		priv->sensor[i].offset = (p1[i] * SLOPE_FACTOR) -
-				(CAL_DEGC_PT1 *
-				priv->sensor[i].slope);
-	}
-}
-
 static int calibrate_v1(struct tsens_priv *priv)
 {
 	u32 base0 = 0, base1 = 0;
@@ -290,7 +266,7 @@ static int calibrate_8976(struct tsens_priv *priv)
 		break;
 	}
 
-	compute_intercept_slope_8976(priv, p1, p2, mode);
+	compute_intercept_slope(priv, p1, p2, mode);
 	kfree(qfprom_cdata);
 
 	return 0;
-- 
2.35.1

