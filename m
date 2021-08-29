Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFE93FACD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 17:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhH2Ps7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 11:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbhH2Ps4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 11:48:56 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE95C061796
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:04 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q21so21226343ljj.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eOntGbmHjlIJIEAoFIo+0TbTE6MIwWPZGdnvY8XJV3s=;
        b=IkUY3h1xG3A+y7RAhDKQu4hw7zVPoB/Y9uMmKSvxKEzYPflze9VXSOnrp2VAR5/fbm
         437gJIgWPxHWKFzMeBPOIHNINUS0MDXWCAq5QJLs5Ger4NUKm1DqR/Mnuf0E0v0wkJ0V
         npCb/h+ck6AV2kSSm/H76uH3L5ExcfV+UvVndR5FJFYVPmpl7JfPAfFFylhjc+qA0KCp
         CDkVuaUX0aoqEjXMRovLOJeY8NKCd73rrHr4rJwaQDbYFIXuuAoWKG1gL8YNlPyItFKE
         HlEhMuVXhbJs/Kia12tCb7jJ1+Azoa1VciNfcI/btmYFHWLmRjsmjpDsk+Tqd0f/KjNd
         loXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eOntGbmHjlIJIEAoFIo+0TbTE6MIwWPZGdnvY8XJV3s=;
        b=OWGNPf1YwdFxPwldLTsWobFaSTAVQ/xzAKQH4NnhvUtA7T2h7KtkEXRAQPq31EcjgU
         dsOsUSR7h7fyyMvjES3HCZ2XboTGhqhQZvIRKz5FEs1laRFIyewNv399LUse22s621kM
         8ShjyuxGVX7Zf0d+Xk/FUhsv8NErEjLJLY9rIHgMCQqEWKoN9S0W/ZLevYEEQHSl3S26
         CZURFie8NedkfYV1XDZ8GyIUyfW1BRodUw0wCpTTdt5CphPTkRYGVJptjJ/UvzKq8jWD
         d+42FE0a6oL8TQNwoyeZ8yu+CxuLMuk+5yOHBM38bwOd2LgcuMrXPFCzW4RDHjv0ge4G
         hGPw==
X-Gm-Message-State: AOAM532zq/xjOOZHILJTR9FrcUgNOAABqHCsdCdCZxUoDJE96AUCO53L
        DyI8wLO1QuF0pMNbTFTMFEcUwA==
X-Google-Smtp-Source: ABdhPJyhkUCYxZEQqZAX55eEdpuUyApHu9wUx4tQwqOUVevrmTzuUQ2qY9cHfqxerTmtjkH5Cp3MTg==
X-Received: by 2002:a2e:b5dc:: with SMTP id g28mr16900490ljn.96.1630252082420;
        Sun, 29 Aug 2021 08:48:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5sm1481243ljd.38.2021.08.29.08.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:48:02 -0700 (PDT)
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
Subject: [PATCH v7 4/8] clk: qcom: videocc-sm8250: use runtime PM for the clock controller
Date:   Sun, 29 Aug 2021 18:47:53 +0300
Message-Id: <20210829154757.784699-5-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sm8250.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..8617454e4a77 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,videocc-sm8250.h>
@@ -364,13 +365,31 @@ static const struct of_device_id video_cc_sm8250_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8250_match_table);
 
+static void video_cc_sm8250_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 static int video_cc_sm8250_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_add_action_or_reset(&pdev->dev, video_cc_sm8250_pm_runtime_disable, &pdev->dev);
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
@@ -379,7 +398,11 @@ static int video_cc_sm8250_probe(struct platform_device *pdev)
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
2.33.0

