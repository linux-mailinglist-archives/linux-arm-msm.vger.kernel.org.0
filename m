Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB0E28EA12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 03:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbgJOBaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 21:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732270AbgJOB3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 21:29:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58932C002172
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:13:42 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c6so573277plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBFR7u8W8fPpDczYmcT6Q2hEHSshZFLSX2fbsmOIlpQ=;
        b=n/pQVtSFE+LJjmQRstcLPkZjAGTvZ7Sx7qtn5LnWRNUKysjkdlErRGmFk4phHthqy4
         JsAXYWX+8KG2JR/8WgZv7HJCvIJi9lPSguqFgnzMSCKDEKG+XQDgFRWxxO8DLT6yXKyJ
         yXvwlmlG14RP/HAdMdQfEmbUL1NivqyiE927o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hBFR7u8W8fPpDczYmcT6Q2hEHSshZFLSX2fbsmOIlpQ=;
        b=PZIbiZcAWUiEMGGO8zVePYpaN7FLeJy2YHnIpBM9IR6cB00TI5CgmuLvzVTBmsywdO
         Nes/aRpK0tyGnK/M5k/smWBfb2xUP5E5tViJP3bkzFikHdKDirm4oQ8mpAu4m8OSWrnZ
         KcvmGZ8DwBg1Z1vDJei/EDvUL7dfyHFueIsnqc+kHuXb4XVSD6UsBsNppKswJigFp4aI
         ACA7Zm0kOAvQVK2hCLLjI+IErXgKQ70AspA96puLehuzOrxJ8yua09wp06u7g7Ju4ctC
         VFoxPQEAWrcNGiuk5+8v34g2OEr7LK6EraX9oGhbqRdpnkcAamKWeecsScnSJ4C4Zpmt
         acYA==
X-Gm-Message-State: AOAM533WpyzfJugzs3l2vwymKhWv1ZGahV2HZAYcjFCtNyOuuyBD1DHc
        P1VhhMlgRjJVDIGLDZUXc7lD3w==
X-Google-Smtp-Source: ABdhPJwZKwgdYs33EhxkHoKhaR+nWFMYZa6zx28QW3oi0Ys5vVbHJembzqd3BtHXegYNTTaZZBelIg==
X-Received: by 2002:a17:90a:fa48:: with SMTP id dt8mr1641953pjb.108.1602720821925;
        Wed, 14 Oct 2020 17:13:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id r16sm726485pjo.19.2020.10.14.17.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 17:13:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-soc@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] clk: qcom: lpasscc-sc7810: Use devm in probe
Date:   Wed, 14 Oct 2020 17:13:27 -0700
Message-Id: <20201014171259.v4.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's convert the lpass clock control driver to use devm.  This is a
few more lines of code, but it will be useful in a later patch which
disentangles the two devices handled by this driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Fixed typo lapss => lpass
- Moved lpass_pm_runtime_disable() lpass_pm_clk_destroy() in file.

Changes in v3:
- ("clk: qcom: lpasscc-sc7810: Use devm in probe") new for v3.

 drivers/clk/qcom/lpasscorecc-sc7180.c | 38 +++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 228d08f5d26f..2d15e33ec837 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -356,6 +356,16 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
 };
 
+static void lpass_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void lpass_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
 static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
@@ -418,34 +428,28 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
 	ret = pm_clk_create(&pdev->dev);
 	if (ret)
-		goto disable_pm_runtime;
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
 
 	ret = pm_clk_add(&pdev->dev, "iface");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto destroy_pm_clk;
+		return ret;
 	}
 
-	ret = -EINVAL;
 	clk_probe = of_device_get_match_data(&pdev->dev);
 	if (!clk_probe)
-		goto destroy_pm_clk;
-
-	ret = clk_probe(pdev);
-	if (ret)
-		goto destroy_pm_clk;
-
-	return 0;
-
-destroy_pm_clk:
-	pm_clk_destroy(&pdev->dev);
-
-disable_pm_runtime:
-	pm_runtime_disable(&pdev->dev);
+		return -EINVAL;
 
-	return ret;
+	return clk_probe(pdev);
 }
 
 static const struct dev_pm_ops lpass_core_cc_pm_ops = {
-- 
2.28.0.1011.ga647a8990f-goog

