Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2396A65AB62
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 20:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjAATlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 14:41:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjAATku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 14:40:50 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D6AC6D
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 11:40:47 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so38891189lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt9qF2p4XV3UcntcRwMREXcr64MEVdaJRIf7w8TkGqg=;
        b=fAHb4vfOg6yVNKEGLNvpXBkuRYnXYROhkq3UvltOqfNlLGJzFICONebpMGsA+uDX3b
         VM8yOs/O1aGzqqDqvSarPnTuirSI8i2liBiwLjMxpBC5/jK4xppmJ6N2Zc1WiaXG306Z
         SLFGYcef/UWGg64ggayXXg99kXFWlHAEMrhOLr9bTab/WNq/336/SrXTiXkIyqTYNQq5
         QMGJ63DqHu5fz0phR865Q6ODUFMzRkmA5uMbbp+x3JuCMTzZiGe7pRDD0hoRCp3S5XmO
         I/S6UniANcdvAcrCrDXVoFs2WR4m35D2mTbLE96n6apfZX8mngNSresJ7s0tvHfLiBMx
         P/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt9qF2p4XV3UcntcRwMREXcr64MEVdaJRIf7w8TkGqg=;
        b=4PnzZWBHDr02Sb6bSzd0yr0h9DXWLWag54jw6rCSYdD6i/xx+7zU7VUEGa9i1itGnL
         WEIiZeOM4dhRtOs+p5p3pYH7ate0vq8SJI94Rf4XDIft12wzI+pXaGXJWz8JPv4UL3cp
         vXZKbcm4Dvb1d4DpOhhLzCQDSluFh23NYIAu0i3CT56PtIgDu/9StM/GiwxgEF9gwTWh
         01PV+oTEdRy3vLmZPamRPEfCpYZ0G1MPqaV/xayOQ36/cFulgSmaN3TEptHDWiDL194H
         SJ2haAgDnuzJz+rzzuayz+9jy93R/s7CluXS/cWTRfUl3Rw81JnpreHIUSZvCe91j/F/
         h3wQ==
X-Gm-Message-State: AFqh2kqzdScd+fzEXZE6jcc7y4wDq1bT28AKF0HgCM1Z60Y2wWsR9uOn
        ZfmNO2AMvAOC5lvwAS90DyvO5A==
X-Google-Smtp-Source: AMrXdXvbdbMuCebo3Of93Q9x1IBW1OOWRb3oS3VGR2JzaBJKVjKsPpwjpWybdeF3LUBRiwvFOV/8Qg==
X-Received: by 2002:a05:6512:3f1b:b0:4cb:2aa:9e58 with SMTP id y27-20020a0565123f1b00b004cb02aa9e58mr7769977lfa.13.1672602047401;
        Sun, 01 Jan 2023 11:40:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w11-20020a056512098b00b004a100c21eaesm4228013lft.97.2023.01.01.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 11:40:46 -0800 (PST)
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
Subject: [PATCH v6 13/20] thermal/drivers/tsens: Drop single-cell code for msm8939
Date:   Sun,  1 Jan 2023 21:40:27 +0200
Message-Id: <20230101194034.831222-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
References: <20230101194034.831222-1-dmitry.baryshkov@linaro.org>
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

There is no dtsi file for msm8939 in the kernel sources. Drop the
compatibility with unofficial dtsi and remove support for handling the
single-cell calibration data on msm8939.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Acked-by: Shawn Guo <shawn.guo@linaro.org>
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

