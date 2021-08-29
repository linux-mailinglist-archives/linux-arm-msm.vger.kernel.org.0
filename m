Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43983FACCA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 17:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235694AbhH2Ps5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 11:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbhH2Psz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 11:48:55 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ECEC06175F
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:03 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id i28so21259923ljm.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAcFEY+E0qmgNU+cIgtsjckvcJT9e5o7gZcnimCS7qE=;
        b=txsSBxfFz3uME9EGWLKsPisD83NoqkW3PVZXnetyTCer1e+GSgMWMqq7SAD4ZUJa8I
         TvwG1N0kBLFhSg7gEzUYf+eieOVTCRzMza6Uje55n4Zilr76DyeS/doFV/8xEa4xBZWw
         v0tNqrwaCfRBsg+/e1rmKntNVjm0iZEvyunpzFyVvJTmq0zn9d8FHzZ/C4ZBbhjVjmV1
         /Hr8hi8gVwPM32KXdYL4yDYTwsOOVpDpUANtgfh+GzYh50EllusbX+yCyi3dw7Vc3Vsp
         F8B+TB84Mx0ulR7Az3eKnBf4L5SDD9T1fbyg44b9XKV1ucec2bvPktai9NMl+EkCpDj7
         nJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAcFEY+E0qmgNU+cIgtsjckvcJT9e5o7gZcnimCS7qE=;
        b=ONMEGBdHcV9pIDFFlpoPIovqFKbJPp9UbQ/QBrub6sF4u4hRjBhQgxXIlWTaQFsoh6
         NN3bJ97amteAJIRWtVHaB9GqN1UlU1bOLADD3mvsAzm1pLNW9h4iVuM1G7ZOgwBZOXYI
         Bj9INowDbZ2ojGkXmgBGPvYcDY5yO2DCeeI8vn4vUIXVLH8deKb6rtS5qdEBbUA/DXtY
         Euc940qw/pksKFxBNoisQ9cVOUkMO2u3itwnmI6qzymkkEPjV2HZHiQ4HL6TwhrG6KOk
         Rp1SnR19Wz7hFLqKhKPDjHf/FrWSm3UCLPFbFXcaNsnwctDm583W9hsbS0fCwDaQH5a7
         Ppyw==
X-Gm-Message-State: AOAM532O1VpYDJaJGIWeWujRi4Ev3YUHBvT8H7QwymSIa4UtQXR8mhal
        mACMoFXAWtB2Ee3mjObsUAiSLA==
X-Google-Smtp-Source: ABdhPJxh6ttGvJTuKrUIAct+s3sIoQe21OrLpijFoCP5JmFHSJh2yRJsONxu3oyPpABJLDKFO5PnMw==
X-Received: by 2002:a2e:a785:: with SMTP id c5mr16291427ljf.434.1630252081609;
        Sun, 29 Aug 2021 08:48:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] clk: qcom: dispcc-sm8250: use runtime PM for the clock controller
Date:   Sun, 29 Aug 2021 18:47:52 +0300
Message-Id: <20210829154757.784699-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sm8250 dispcc and videocc registers are powered up by the MMCX power
domain. Use runtime PM calls to make sure that required power domain is
powered on while we access clock controller's registers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 601c7c0ba483..108dd1249b6a 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
@@ -1226,13 +1227,31 @@ static const struct of_device_id disp_cc_sm8250_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
 
+static void disp_cc_sm8250_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 static int disp_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_add_action_or_reset(&pdev->dev, disp_cc_sm8250_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &disp_cc_sm8250_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	/* note: trion == lucid, except for the prepare() op */
 	BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
@@ -1257,7 +1276,11 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
 	/* DISP_CC_XO_CLK always-on */
 	regmap_update_bits(regmap, 0x605c, BIT(0), BIT(0));
 
-	return qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &disp_cc_sm8250_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver disp_cc_sm8250_driver = {
-- 
2.33.0

