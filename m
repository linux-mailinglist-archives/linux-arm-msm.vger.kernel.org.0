Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76FE28E3C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 17:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbgJNP6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 11:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729116AbgJNP6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 11:58:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3BBC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 08:58:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y14so24280pfp.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MKPVqt9nZ28XkBuHkl7IfJCFNBXzL2D6MJ4L8d/0r2o=;
        b=Dblwm5sLURfAjRk5ukv6aLUllKii/VCuBuaa147EWeGPGCmv4wLW08wD4ummGjXFp4
         TpXPGzb+RaxFW3U5ZnoaRz9ZOr8CiQ+wf6/IO74QDgYQPqTnCFfopSmpFlds4Ab9hzPI
         Xbqsc+WVtgwGdZG7T0iIGsssoNAncFBuz/5sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MKPVqt9nZ28XkBuHkl7IfJCFNBXzL2D6MJ4L8d/0r2o=;
        b=VL9j/DUz1BRwWDQvzc501+XsEbSut1Vp4blhy/1AMxDueGmcqHMainwV9B6WWRY1sG
         MDzZmjYxr1Qhb0nd3hUJqhNCmuO4/gD951e0Cvp4iy599w9U8Fcj/mRNYqc1ftXXDHj2
         M4A1qpx2xVDTw1F4hzFqFvNak3Dj8IPOSl+/jw5tdrDGCOLFlthQ8iXzzFDVUEXjT5Jx
         YSY5b9Y06rSdHb3d4jeer2vzYkN09Xts2cE3Vxws02tQSHc/cK7ccsQ6UtfXNCd0e5st
         yRkd+plsKDlJSH4ZNqzq5X+2Vn3ytrQ17dzQyPKYa/ycEwXR4n2kQ+lK+P6A7A9XfGUM
         o7pA==
X-Gm-Message-State: AOAM532qjbbId88bIAt/QUWrpVkvfrrssOoMpjzUJ0IU3Acdyy7HxPp8
        M0DjrqUVl6qQCm6/jp0ClqbQ7A==
X-Google-Smtp-Source: ABdhPJy8UzEFh/715lGO+bb/nVA3OaPMlDG3AT9U0V3cqUwJicweiz5qB4RiWSAkQTF/jwsY81Aq4A==
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad17 with SMTP id y17-20020aa79af10000b02901526101ad17mr2228pfp.25.1602691126765;
        Wed, 14 Oct 2020 08:58:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id h2sm80251pjv.4.2020.10.14.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:58:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-soc@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: lpasscc: Re-configure the PLL in case lost
Date:   Wed, 14 Oct 2020 08:58:24 -0700
Message-Id: <20201014085758.v2.1.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

In the case where the PLL configuration is lost, then the pm runtime
resume will reconfigure before usage.

Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I took the liberty of fixing my own nits that I had with Taniya's
patch, AKA:

https://lore.kernel.org/r/1602614008-2421-2-git-send-email-tdas@codeaurora.org

Changes in v2:
- Don't needlessly have a 2nd copy of dev_pm_ops and jam it in.
- Check the return value of pm_clk_resume()
- l_val should be unsigned int.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 228d08f5d26f..ee23eb5b9bf2 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -356,6 +356,25 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
 };
 
+static int lpass_core_cc_pm_clk_resume(struct device *dev)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	unsigned int l_val;
+	int ret;
+
+	ret = pm_clk_resume(dev);
+	if (ret)
+		return ret;
+
+	/* Read PLL_L_VAL */
+	regmap_read(regmap, 0x1004, &l_val);
+	if (!l_val)
+		clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+				&lpass_lpaaudio_dig_pll_config);
+
+	return 0;
+}
+
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
@@ -373,6 +392,8 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	dev_set_drvdata(&pdev->dev, regmap);
+
 	/*
 	 * Keep the CLK always-ON
 	 * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
@@ -449,7 +470,7 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
-	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, lpass_core_cc_pm_clk_resume, NULL)
 };
 
 static struct platform_driver lpass_core_cc_sc7180_driver = {
-- 
2.28.0.1011.ga647a8990f-goog

