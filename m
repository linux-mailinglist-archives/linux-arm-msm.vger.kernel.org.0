Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4363A46CACD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 03:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239190AbhLHCZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 21:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbhLHCZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 21:25:45 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DA3C061756
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 18:22:14 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u3so2597726lfl.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 18:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1a4m//jcHm9bXmQJv93T+Eh8JOyyleVyEicNCyPcu8g=;
        b=sKUZjAdmpswBivm1UmYB4c0A8g2OI7GxPooXbm6K/xYwXWQyt4s/6H+v7ttwq2uuym
         uQDQmw/JW/b/WMPGUkYtC39BC2DX2DL7gWrDC9ESFD00hgDxHvr/ihFFxHynOeTr2x3o
         1nt/bLMYN9X2RfQQifaXvsCdRlwWcinPv2qZRyLPq/lfuYLvM/ELLsrH+3vre4YKAvX/
         kSsYre2+KUmFaRfU5XQRYiCd50dlWsCpoeCULGhIcyoHD4R3V7RUCMe/qB9Rtd1o0lcQ
         yPBpN8chTUKWimHtjJf8AwtxLY8ERls6aF0cJWGAuvxasK68i6RxdsdSeRYSzOyO+ChB
         WFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1a4m//jcHm9bXmQJv93T+Eh8JOyyleVyEicNCyPcu8g=;
        b=rMDoSCM+lEctyWTzuFznFql+w/umJ6VAFHptw6pBe5SddrWudvZ+CpOeW8CLGE9C77
         1Q6+kEtE1dXSx9El+34YMcuxuDbEAhLMawlXsnjYdYVkR2Tm3TDiCyqzDysuMJTnkAbw
         WoanBChWKv7oKi76wxAjCdJZbJJnJcC7Y0ld9VZ90G51Fj7F4Vo5mgW8ViQ8oBCz65hc
         6sicQ8NnHyARCa43tXusZG4I35F1dpj2D2HexCEFT6raF2SxkoVtLyuvRCtsRXGMeb+i
         76GzOqsEUQM3pA0+QJ6TCvkgl/ejNYLoz9MoHgZnSLd3mRTrzjiRb709ROL4M5IL4xEi
         w9RA==
X-Gm-Message-State: AOAM530y8DAWgFIM2RK8QcPo/y+iDwM0d7n5k3+lKZogOc7W0Fu7wwY9
        OuUDJG3Sdn/DqO1Il4WwOSB5pQ==
X-Google-Smtp-Source: ABdhPJx8n0KeBKiIUofsoTxyoWKSDDh3dgYjXmpikZ+iu81E6wTMj/HwAVV/F7WNuzic4aitKq9joA==
X-Received: by 2002:a05:6512:1510:: with SMTP id bq16mr42731740lfb.628.1638930132824;
        Tue, 07 Dec 2021 18:22:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22sm114111lfu.274.2021.12.07.18.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:22:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: add API to safely park RCG2 sources
Date:   Wed,  8 Dec 2021 05:22:09 +0300
Message-Id: <20211208022210.1300773-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some of RCG2 clocks can become stuck during the boot process, when
device drivers are enabling and disabling the RCG2's parent clocks.
To prevernt such outcome of driver probe sequences, add API to park
clocks to the safe clock source (typically TCXO).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  2 ++
 drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 99efcc7f8d88..9708b8799b01 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -172,6 +172,8 @@ extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
 extern const struct clk_ops clk_dp_ops;
 
+int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int safe_src);
+
 struct clk_rcg_dfs_data {
 	struct clk_rcg2 *rcg;
 	struct clk_init_data *init;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e1b1b426fae4..230b04a7427c 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1036,6 +1036,40 @@ static void clk_rcg2_shared_disable(struct clk_hw *hw)
 	regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
 }
 
+int clk_rcg2_park_safely(struct regmap *regmap, u32 offset, unsigned int safe_src)
+{
+	unsigned int val, ret, count;
+
+	ret = regmap_read(regmap, offset + CFG_REG, &val);
+	if (ret)
+		return ret;
+
+	/* assume safe source is 0 */
+	if ((val & CFG_SRC_SEL_MASK) == (safe_src << CFG_SRC_SEL_SHIFT))
+		return 0;
+
+	regmap_write(regmap, offset + CFG_REG, safe_src << CFG_SRC_SEL_SHIFT);
+
+	ret = regmap_update_bits(regmap, offset + CMD_REG,
+				 CMD_UPDATE, CMD_UPDATE);
+	if (ret)
+		return ret;
+
+	/* Wait for update to take effect */
+	for (count = 500; count > 0; count--) {
+		ret = regmap_read(regmap, offset + CMD_REG, &val);
+		if (ret)
+			return ret;
+		if (!(val & CMD_UPDATE))
+			return 0;
+		udelay(1);
+	}
+
+	WARN(1, "the rcg didn't update its configuration.");
+	return -EBUSY;
+}
+EXPORT_SYMBOL_GPL(clk_rcg2_park_safely);
+
 const struct clk_ops clk_rcg2_shared_ops = {
 	.enable = clk_rcg2_shared_enable,
 	.disable = clk_rcg2_shared_disable,
-- 
2.33.0

