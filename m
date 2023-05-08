Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 261E66FB3E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 17:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjEHPd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 11:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjEHPd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 11:33:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925FB8A50
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 08:33:22 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f14ec4efb0so3130316e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683560001; x=1686152001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JN0718Ijf0M8e5M4RHFLxUvS5jCN6cHoZ+1J4Zo+39Q=;
        b=QTAI+QeH2IytZzpIW3YFpxyjExDJuWCTc2IxRar4kGuqfqRg7J5qL8EOjK/Zg4HpXg
         6nC5Fmn/Kfi1W7+6g4pAnY8HBYf4s/p0k5JrF5eAtPgptds94knTDuv7Lg4JUVmYkuid
         DxgkAuVv4g5TWTMwn6qLYR4RJZAofqR7VTJZq7VlgCTv11znqnKI+CR+jofFIEevWiIv
         EpNLOpeRXREW0iSwJjSdMi8ZG9/Xzb3/B8FwUAKo32WwOPFOqxs8PhsYd/KQMq8h0kDq
         wdL7ToXSGL4z3bSe5oKACupRfWvQlFM/elf8VwQV/v+LZZydQHBMGRkVtT52FnTh0JPI
         b80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683560001; x=1686152001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN0718Ijf0M8e5M4RHFLxUvS5jCN6cHoZ+1J4Zo+39Q=;
        b=VAl5Fwnt9UOpUo/yblHJxTJEqYUqoZSlMmIdB5Q/+sk3A7F/wkI9UEW/IcnrlG+M3K
         Ma+sQYAuiKgpGcrpEJq8LO+mJHHaMgGAmnRq+rkaZBPIQjfkRdqJuMR4/vrfh4H3WpLb
         7zFYOB9co0+KkXlJbVlK1wBrT5icRwCrj5d6RKO/5IvwU0Gde/nyJdZmGofFi5Iw1pQi
         iTiUV1ehyTkqx56dV5w0kFwKWkb8cdj0/IdwNd00IBch70ox2HqLrW2PyIgBQiCZ5+NI
         m8iRYohdyQRMT9K3RXnl4WZTXn3/fjs8a9hVHGvRbkq8m4cEKTIE9596iDD14ucxpBYi
         ug2Q==
X-Gm-Message-State: AC+VfDzCYyoqv+jBoT1wUe+4EgIQTYYmipZh/uXeZmV4Uf5liPYiyq4p
        SWopAW0QN9okC1ycLfmfwwNPMA==
X-Google-Smtp-Source: ACHHUZ51jtBedf/4Ly0u2A7Cr0CAmGLtF6X3iM4jqyXZ+SvM4TZfs1nhabZO7A1q2cVrWvPx7XMUGw==
X-Received: by 2002:ac2:55a5:0:b0:4ed:b15d:467d with SMTP id y5-20020ac255a5000000b004edb15d467dmr2895247lfg.53.1683560000828;
        Mon, 08 May 2023 08:33:20 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id o17-20020a056512051100b004eff70e321bsm21865lfb.237.2023.05.08.08.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 08:33:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
Date:   Mon,  8 May 2023 18:33:19 +0300
Message-Id: <20230508153319.2371645-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the internal discussions, it looks like this clock is managed by
RPM itself. Linux kernel should not touch it on its own, as this causes
disagreement with RPM. Shutting down this clock causes the OCMEM<->GPU
interface to stop working, resulting in GPU hangchecks/timeouts.

Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 277ef0065aae..82f6bad144a9 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2204,23 +2204,6 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
 	},
 };
 
-static struct clk_branch oxili_ocmemgx_clk = {
-	.halt_reg = 0x402c,
-	.clkr = {
-		.enable_reg = 0x402c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "oxili_ocmemgx_clk",
-			.parent_data = (const struct clk_parent_data[]){
-				{ .fw_name = "gfx3d_clk_src", .name = "gfx3d_clk_src" },
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ocmemnoc_clk = {
 	.halt_reg = 0x50b4,
 	.clkr = {
@@ -2512,7 +2495,6 @@ static struct clk_regmap *mmcc_msm8226_clocks[] = {
 	[MMSS_MMSSNOC_AXI_CLK] = &mmss_mmssnoc_axi_clk.clkr,
 	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
 	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
-	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
 	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
 	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
 	[OXILICX_AXI_CLK] = &oxilicx_axi_clk.clkr,
@@ -2670,7 +2652,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
 	[MMSS_S0_AXI_CLK] = &mmss_s0_axi_clk.clkr,
 	[OCMEMCX_AHB_CLK] = &ocmemcx_ahb_clk.clkr,
 	[OCMEMCX_OCMEMNOC_CLK] = &ocmemcx_ocmemnoc_clk.clkr,
-	[OXILI_OCMEMGX_CLK] = &oxili_ocmemgx_clk.clkr,
 	[OCMEMNOC_CLK] = &ocmemnoc_clk.clkr,
 	[OXILI_GFX3D_CLK] = &oxili_gfx3d_clk.clkr,
 	[OXILICX_AHB_CLK] = &oxilicx_ahb_clk.clkr,
-- 
2.39.2

