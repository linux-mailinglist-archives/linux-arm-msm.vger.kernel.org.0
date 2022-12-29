Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242456588FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 04:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233056AbiL2DBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 22:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiL2DBX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 22:01:23 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C222513E01
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:20 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id z26so25912385lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8fkEIRN053WhYjiTpp1xxTiBjunqT5Gc+6hWigwVbA=;
        b=PuyFpyiD9Erz6vQykup0h9Ho/Xzq9VYJ/i0aAjVD/RrQS+0mVfCpWebapSo/xa2Bn1
         mkeb/ROwNS1yDI6t6X3VFKs3qYlKS5oMy1fSIHMHpwCa6g3T1/K59WLp8fg+LeiJ4ZXW
         zOoqKGdiElLiWZlIHCy1Upfl7wx1H6viqGBz64feiDpcgw0blv3Or8jdcI9LCfEtwFOi
         2cx2CCQ9k57CPNzL6D5GxT9A8irokW50wSuwRDGU2NbJ5BAFi24Toq6YywuHtkz+1JhT
         7O+SqYekGntPFiiFbRzYaAFJJy5SFPzmDv5kVBJxZE+8cW/3v2qt5RBX/zB0G+XHziaJ
         kOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8fkEIRN053WhYjiTpp1xxTiBjunqT5Gc+6hWigwVbA=;
        b=JASbp3ACDJhHlux7xeh0Xr64yiT2CyErptmMfUQjZgrsMX+Vv9RKXiqjNgtIZBjFoR
         AuiNjR2FTbAnqv+r+sa+cEXPuiSQo5R1f8ho1e4O+nJC+qGwY6OIvyzxdmURgmsV41em
         zFX5CtgNmr+Jp82MX14k7CKoj1BFTyy3rMyOGZO9glOXbOxi3sUskHs1dw3PkcZC/vHI
         HlhqYykCRw6+LmdZnid45LxV4FUvjEZIHj6cioSzAKgVjeTaXn3BHqWI4dCHA9bbj1gs
         7yNb9kG371zI+WAJ/iRkzLzDplsiCKgdnXVDQCQLWveftm7lonWzs52F+1+fsnKbsDGt
         tpew==
X-Gm-Message-State: AFqh2kpZr2FGM6aDYHumk1zSyQ9/VVX3GXZEkq8fBJtQ6Q5ZlHwFVs5x
        f73p/cHp4swlLXTPVhYpbum4tQ==
X-Google-Smtp-Source: AMrXdXsQugUXAr1g1iW3usfkxoMuG0tXTITitqGpck2a+9+d9zPNQ/rIqgnHJVAnih1EDvZRRFZSgQ==
X-Received: by 2002:a05:6512:3483:b0:4b6:eb6e:3187 with SMTP id v3-20020a056512348300b004b6eb6e3187mr7698096lfr.48.1672282878567;
        Wed, 28 Dec 2022 19:01:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm2883070lfo.106.2022.12.28.19.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 19:01:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 13/20] thermal/drivers/tsens: Drop single-cell code for msm8939
Date:   Thu, 29 Dec 2022 05:00:59 +0200
Message-Id: <20221229030106.3303205-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
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

There is no dtsi file for msm8939 in the kernel sources. Drop the
compatibility with unofficial dtsi and remove support for handling the
single-cell calibration data on msm8939.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 9488416b568c..e89c6f39a3ae 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -150,30 +150,6 @@ static int calibrate_8916(struct tsens_priv *priv)
 	return 0;
 }
 
-static int calibrate_8939(struct tsens_priv *priv)
-{
-	u32 p1[10], p2[10];
-	u32 *qfprom_cdata;
-	int mode, ret;
-
-	ret = tsens_calibrate_common(priv);
-	if (!ret)
-		return 0;
-
-	qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
-	if (IS_ERR(qfprom_cdata))
-		return PTR_ERR(qfprom_cdata);
-
-	mode = tsens_read_calibration_legacy(priv, &tsens_8939_nvmem,
-					     p1, p2,
-					     qfprom_cdata, NULL);
-
-	compute_intercept_slope(priv, p1, p2, mode);
-	kfree(qfprom_cdata);
-
-	return 0;
-}
-
 static void fixup_8974_points(int mode, u32 *p1, u32 *p2)
 {
 	int i;
@@ -354,7 +330,7 @@ struct tsens_plat_data data_8916 = {
 
 static const struct tsens_ops ops_8939 = {
 	.init		= init_8939,
-	.calibrate	= calibrate_8939,
+	.calibrate	= tsens_calibrate_common,
 	.get_temp	= get_temp_common,
 };
 
-- 
2.39.0

