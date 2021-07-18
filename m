Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570DA3CC88C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jul 2021 12:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhGRKwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jul 2021 06:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbhGRKwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jul 2021 06:52:11 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A025C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id e14so2741735ljo.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jul 2021 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JPnE4vurU9PkRVowEC7li0cxdIi4nYwl+uw77ku/+po=;
        b=djJXp5zRLDPGCdVtBXwbxLa9g+CRF8URjpJzVuHrCeN0dDkCiZoSerJVx6FFNQciyW
         VAMeVfkWR7+Yo5N5gu+go18RQAVzfzmfT1/RZDRTO2rr/BPrisQxjP8BXE/bHahdfdC0
         jfwy7LpLRmKF1NyPv7iGM5LyQ9d2BCwF0rtcpi2/SVkx60BAkLC//MHal2yPNSouAr4C
         02G5O1X+JBtxvwhE8aKYS/SvqVU/d9yP6gSm9klJtugOItiYZP106lGSKFcUW1mMMn3c
         Yt2dxCfEUQPTr08ofETmLVwAP+98wsSBJOAFbb4Js/JsSoa/U6r4Z5y3FgNneGsZQ25f
         dLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JPnE4vurU9PkRVowEC7li0cxdIi4nYwl+uw77ku/+po=;
        b=BJk24I30KH+bqvAAATzg//9t49bPsEPZ6wX0zGcuuKC+yljN3bg9LgKXWtW2H2glAC
         +cOZ29YO+eWF63Ad5ioPqYk3hgFUpCjL2lXrMmUiopRj9jiW0wKBJoS6nK3r0VYwXIY5
         i12nOVP0GbMbsCi707+ybvJOaLBlYtCWRNEJ4xe1JXuwjCjHD7b6ZnrJHaLNZKZRO2pk
         PbDWh907gkXTvZOBTwO3OorWCfEudmBPe3xyOPUODsyGntri6mMp6T46U0wYuPxV21ki
         QSDYBU2XBpbf3SdM1gDl5jh0/spnkIF3WYBy4D0zfxqfpK7HjPIQ81/KkJ7ZXr+OpHeW
         z0HQ==
X-Gm-Message-State: AOAM532YC39GSSIL6D95qQFlOQ7SfjyPTIAF1Mk7uHgBSAKPqqk1flt1
        V+/GDKAaPUL0jbz2FX3y8n/u7A==
X-Google-Smtp-Source: ABdhPJxDmsddJ5kwioWxb3qwVxtqYqdE27le2Bym+Zke6QOXYJCSkwJVfWJTrcyMEXJ5orKASBH9eQ==
X-Received: by 2002:a05:651c:3d0:: with SMTP id f16mr18057204ljp.169.1626605351527;
        Sun, 18 Jul 2021 03:49:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:11 -0700 (PDT)
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
Subject: [PATCH v5 5/9] clk: qcom: videocc-sm8250: use runtime PM for the clock controller
Date:   Sun, 18 Jul 2021 13:48:57 +0300
Message-Id: <20210718104901.454843-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
References: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..d996b76f4e30 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,videocc-sm8250.h>
@@ -367,10 +368,21 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8250_match_table);
 static int video_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &video_cc_sm8250_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
@@ -379,7 +391,11 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0xe58, BIT(0), BIT(0));
 	regmap_update_bits(regmap, 0xeec, BIT(0), BIT(0));
 
-	return qcom_cc_really_probe(pdev, &video_cc_sm8250_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &video_cc_sm8250_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver video_cc_sm8250_driver = {
-- 
2.30.2

