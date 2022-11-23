Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E352636166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 15:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbiKWOUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 09:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbiKWOUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 09:20:33 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7FB65E48
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id t4so13145669wmj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oo2ZK3AM2iQWnSIEMV5C2nrt+bywo8WT8cL0P8W1RY=;
        b=JJUrcWLT59HEdSLBOcfqScs/cAXc4SqMuF0B8FnCe/S26rrUs+UOprN7N05GDxw9XA
         pviSjWSwGSNACropUReBnsY2ZcLotiXfonzjF/lgCIkbezjZoeyayqtrAsI03x22IOpY
         TjkBmQ+sApzBjxngRK6M1WPpktHPfFCRBb0nn5qCQZvWasA4dcHeogOfEIlCU/TUJl/C
         B5kV/kaAF0pzUmFlOywIbMKonGz/4e6a89bnGsfYvwVZmBiNZQ/Tyie+L5x/cVk75ZWB
         vEUMzj4VrY4leFLcCrkKwJHjro0G8x3COBscIRa7p9IH6BYbsmSvZHB2MQyJiqrrOi/y
         1Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oo2ZK3AM2iQWnSIEMV5C2nrt+bywo8WT8cL0P8W1RY=;
        b=LKmHFllY3qkZxJcsWicc+IW3CwIVmcuUuuAaLEc5pDFPwb8sxNUBdYC9EoRH1ZawJ3
         EAHivT/0s6/nps5oUY+UR7OGybnKRDnw6aGE0g8NoJM6YvNmW6jfHJHiVcqxJFRB9our
         FTQ7OTK0n1+kMLjb7FxH8GsRe0JJ1u/k8iaVMX4RrlrQOwGlRJMYh4498Cb1dlrfgEUS
         AK3ga1ac3+sEBwRaI3vqAYDt3YXNB8q8E97Iw3lPhZx3ZGMcb2ft15jwzyIh+GKjVTEe
         FnyliDMbxbRam7j5dmYfw68SGMQChOki0IzdhaN2FUqAp84N0AttEJzScDQXYUuscR9H
         +E2A==
X-Gm-Message-State: ANoB5pkRNQ6F5bRoYzAESEtdOD6/1Ls7o3v7FAhJLGDDxTwgZLkNJY/k
        Wbkqaj1hHOUAspOGcWyjhR24MAhQkndYPg==
X-Google-Smtp-Source: AA0mqf5EFTIP2KsezGbCbyiQlJUTUDodBHCPOQJiBoejiL9Wo1VTMeCxyYvHKxk5qfiU+vz1soqqlg==
X-Received: by 2002:a7b:c011:0:b0:3cf:633e:bf6a with SMTP id c17-20020a7bc011000000b003cf633ebf6amr9221623wmb.63.1669213225617;
        Wed, 23 Nov 2022 06:20:25 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:25 -0800 (PST)
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
Subject: [PATCH v2 4/9] clk: qcom: Add LUCID_OLE PLL type for SM8550
Date:   Wed, 23 Nov 2022 16:20:04 +0200
Message-Id: <20221123142009.594781-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123142009.594781-1-abel.vesa@linaro.org>
References: <20221123142009.594781-1-abel.vesa@linaro.org>
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

Add a LUCID_OLE PLL type for SM8550 SoC from Qualcomm.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

Changes since v1:
 * Added Konrad's R-b tag

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

