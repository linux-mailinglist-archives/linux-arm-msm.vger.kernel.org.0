Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A16265C289
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbjACOz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbjACOzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:46 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966B4120B0
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:35 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id n1so32077699ljg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGOM/WsYLYOk2jC46YBaJyxofD5npQLyF46OlyhRQWg=;
        b=fJQ+xGWyd/xbEweVtX+7jVnV4i2M1wBSGovZqR2UgfpLwa+tlZFxjK+OtMEtRV9irL
         eW9BRWorqtbFHBQO8hdmEtMmRhU3DuE9q/Y3dfBaIjlobi7ayYhlk3Ko84envFlzss1I
         wH1QQvf3mhMkMWKELZDDx3z9/fUb9cXKSzdM947gwY6bmus+5Oi7FAT+1SXrpP+OEOlC
         /hcdOw489p4/1W5wxtLKShaYTHfq7cCet5NalLLu3Emo9zphB64UGZX/hT8Bez1SAoko
         jlZWvddPyKChLHmKyhwuBk9zYYCjMuiaEMw1lcITzKELt3f9vSLuqQxbsfIoWr2JJcUP
         nASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGOM/WsYLYOk2jC46YBaJyxofD5npQLyF46OlyhRQWg=;
        b=Bzezy5uvZmWJ9jUaeOzfrk3joI1WBlmB4wt5s+PeeO1bWf0gmIpyWEqV+ZoB7040Dz
         luYn4mpn8s3FSF8cTubbLl5JpWNy+Ut9yO5U1Y39Z4rJnxL/QH+6PDtKJi0Xw3bVxHqP
         zcfrVpExVyffHaxD1OjK6kncuSL2WTLMe5/3IE5qZ2UVPErscD0kJUewaNe26dKSVhV3
         SK3movazQ16J1ZvtoSpfijqSfiEHoLrzHzhIOiDr9Rk2Lb2FZs4aPxKRi4YJMSbG6k0Y
         16EAZhzc2/7IEwM+yXkaRZF9wprD/NaP+Hs+yGAPeU1sj589fN5l9XyDkF/1H3jKboaR
         KzLA==
X-Gm-Message-State: AFqh2koSvljV0ny/8J2crtLD4H1B3H5zYdnReAHClP88Ty5w7x0vDYaw
        ZnEDnkTtCDT6lEs7K/Tl9+fYdQ==
X-Google-Smtp-Source: AMrXdXuZL5fLCv7Ya4Kngb4yKQDa3fcd+8QTkDaDgQufYmAwhO5aSCppizENwVP1//GVQz+AqvCDmw==
X-Received: by 2002:a2e:958e:0:b0:27f:bf7d:7117 with SMTP id w14-20020a2e958e000000b0027fbf7d7117mr7882896ljh.8.1672757735186;
        Tue, 03 Jan 2023 06:55:35 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 18/21] clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
Date:   Tue,  3 Jan 2023 16:55:12 +0200
Message-Id: <20230103145515.1164020-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Switch to using the devm_pm_runtime_enable() instead of hand-coding
corresponding action to call pm_runtime_disable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 382dbd8ba250..e17bb8b543b5 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -1251,19 +1251,12 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
 
-static void disp_cc_sm8250_pm_runtime_disable(void *data)
-{
-	pm_runtime_disable(data);
-}
-
 static int disp_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	int ret;
 
-	pm_runtime_enable(&pdev->dev);
-
-	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8250_pm_runtime_disable, &pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
 
-- 
2.39.0

