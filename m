Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFD4652B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 03:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbiLUCFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 21:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbiLUCFh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 21:05:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0059120354
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:33 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p36so21320771lfa.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 18:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8esKx8S7sc+Ikm/lxRjH7mI5mO3ckUZswKh/6CRSk80=;
        b=RnxFcBdJCboA2a1MFYkKgygb0YchHL9pjxD3Kn8TPSwC8P3EFHw+ZquwgpSNT0ZE2Z
         KBUbVm1Bmh6nBHVbtqx7/WhVWLCx0YMYpennSWMn6ztgcX1yZD0uFgE9OxQJIk7OPSCA
         gT4yQPQUCRu9MPUoi7FJiS6iEUDxIJcFlUEp8fiwHBtO7ZZNnkXkF6boqlwnXP/2tyMF
         4qY+h3dhczCRZ/aKohcheHoOIaNZn1LSoQUYH3uU2Ac3RTDcoS7GaF/28YwsYfHx7GgB
         k80w5+V/e1CJYoQOmNDzV682KgV+S6qQT3e7qClWHWIu7ocDzG6DCitMSbwcyY7kMp+H
         6uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8esKx8S7sc+Ikm/lxRjH7mI5mO3ckUZswKh/6CRSk80=;
        b=4MeUdgKR+ZrAfmHIAYr6tffzNTm40NrT7RHqFJrGHKVXj6Wo9IQ3s7BHEE6L5M9Lwd
         9Taz1EGr24fwm0DFUw1eMpdupMRhVxI9DPR0vCX1boEkSFfisH2FE11alv/VxYz4hLlL
         1vfq+63Tuii2gcSSKGdvDxB2pKoBYjdxBIwwirocTcMBckwndcUBZ6zukG5NBkZpjYnH
         14lG+Gu/LQZR7EpzJTOuoAK/KX199gt7o9w3dqGFjlPdRm9ve4tyq2E0QqrQcY2O8xhU
         vNz4PzJoUKpYD7bQET9UK8RvEmYfcAYvISMhBJLEebUk5Nf1c3AUhNe8QZHUfDxyUPBH
         gTyg==
X-Gm-Message-State: AFqh2kq/0IbZkqvrrcK6ORVrpK+aLq2HxeNV28R/Cd8IGVIlN02P+L3F
        sCgNytHDQWeMi6T6pyZF9nj3oA==
X-Google-Smtp-Source: AMrXdXtYUgxdnROakETE2KiLSyHjaR1n8cZvC+Xr0AEkNsDD6Pz9yq8WCmDfQsNdaE4O0CNq3ZXtjw==
X-Received: by 2002:a05:6512:3d2a:b0:4ae:7974:7d32 with SMTP id d42-20020a0565123d2a00b004ae79747d32mr1840575lfv.29.1671588332373;
        Tue, 20 Dec 2022 18:05:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004b257fef958sm1673048lfr.94.2022.12.20.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:05:32 -0800 (PST)
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
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v4 13/20] thermal/drivers/tsens: Drop single-cell code for msm8939
Date:   Wed, 21 Dec 2022 04:05:13 +0200
Message-Id: <20221221020520.1326964-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
References: <20221221020520.1326964-1-dmitry.baryshkov@linaro.org>
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
index d3f46f44c1e1..7ebf5a2ca452 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -149,30 +149,6 @@ static int calibrate_8916(struct tsens_priv *priv)
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
@@ -352,7 +328,7 @@ struct tsens_plat_data data_8916 = {
 
 static const struct tsens_ops ops_8939 = {
 	.init		= init_8939,
-	.calibrate	= calibrate_8939,
+	.calibrate	= tsens_calibrate_common,
 	.get_temp	= get_temp_common,
 };
 
-- 
2.35.1

