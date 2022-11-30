Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AED63D484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbiK3L3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbiK3L3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:29:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DA710FFA
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:21 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id r26so21517778edc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hehlayLfD+VpoMaqp50JltEW9ZOkwoZi8i1XpqkJ+jY=;
        b=vhYCJaRMhkgAFkQWkWvK5OOYSJehqu9ffJamCBNus7OXFyt3b/N8eW2AyJITrAFlYr
         Eo3qwS6XXyJ31ZulZx8VJxbdIvLbrsJdYF4POSVdGzGOkaZ8GnthF7i/Cm0Jb/yHkzWA
         XcyxOIKDBVe/lXi8bAUCZIeU7bx2DgBQkdlXnridaRR6i8vJ5Uu7nTxfsnEpuNM8MC4d
         R0u0slKFikInN4QyQRlhPBp/7NXZYbtOmLpBdhnyWFOddxDaPbU0iJa4+J8i1ArZNhwS
         0IvYHAhcrMaqI2VP5vvoGC9gZB9TBjMtTNLhLW9X4EgEwVE5z76aztk3uGbx74clMC7L
         wFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hehlayLfD+VpoMaqp50JltEW9ZOkwoZi8i1XpqkJ+jY=;
        b=iw1JMhS4sVhDTy3i9k4nQNklJNJzKmCXjRF6bWs75xtgubzHo/6KcItnYzS/y7ZF2L
         ksI7J4XaTkvixiIClH0TV2xVcbYtjQmbXB5Wjr7+whCaQesv0/Gf2qeR60zUS1ONBYei
         vtj9al2T2E/5/UgmuxikpIAWn1xnK68mb663y2sjPTj44o2YxC0R1NTxkT4k4oBbZDKA
         6va3pBf2Dt1nJE19ErCxYI9jQDKwgtTDlSUFzkW2Ny3psBWVQ7F/66EjoytzP4+Do4o+
         tlY2W8s9PTFgM1kV5hVXrPrg0Dx5RNIQ8sjBqmSwXmy15Cksff99C4S8FFwfZyGfyIye
         8EjQ==
X-Gm-Message-State: ANoB5pm9hJgdwxzi3hXKN3lZg5BD5JUoa6MOQkEkdVUaE3Y0givD10yR
        5DW+uNctFJXN/YAMnAwTZXDj/g==
X-Google-Smtp-Source: AA0mqf7XVYo6lcf3HEZlw/qZtDbZcHH5i+D2F89xiI6jljmuk1BCZgGJPz0MsnHkk2t54o+iU3FMNQ==
X-Received: by 2002:a05:6402:3203:b0:467:b8c9:a7fa with SMTP id g3-20020a056402320300b00467b8c9a7famr40567500eda.25.1669807760403;
        Wed, 30 Nov 2022 03:29:20 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:19 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 4/9] clk: qcom: Add LUCID_OLE PLL type for SM8550
Date:   Wed, 30 Nov 2022 13:28:47 +0200
Message-Id: <20221130112852.2977816-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
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

Add a LUCID_OLE PLL type for SM8550 SoC from Qualcomm.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 16 ++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 1973d79c9465..f9e4cfd7261c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -155,6 +155,22 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x30,
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 	},
+	[CLK_ALPHA_PLL_TYPE_LUCID_OLE] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATE] = 0x08,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_ALPHA_VAL] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_USER_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+		[PLL_OFF_TEST_CTL_U1] = 0x34,
+		[PLL_OFF_TEST_CTL_U2] = 0x38,
+	},
 	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
 		[PLL_OFF_OPMODE] = 0x04,
 		[PLL_OFF_STATUS] = 0x0c,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index f9524b3fce6b..2bdae362c827 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -18,6 +18,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
+	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -38,6 +39,8 @@ enum {
 	PLL_OFF_TEST_CTL,
 	PLL_OFF_TEST_CTL_U,
 	PLL_OFF_TEST_CTL_U1,
+	PLL_OFF_TEST_CTL_U2,
+	PLL_OFF_STATE,
 	PLL_OFF_STATUS,
 	PLL_OFF_OPMODE,
 	PLL_OFF_FRAC,
@@ -160,7 +163,9 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
+#define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
+#define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
-- 
2.34.1

