Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE5727996D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgIZNCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729283AbgIZNCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:02:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634C0C0613D4;
        Sat, 26 Sep 2020 06:02:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c18so6841736wrm.9;
        Sat, 26 Sep 2020 06:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HpEmgpRstbvPk5HZ787DxMAHEXsitluxkapNdOdQuGY=;
        b=Nlcn1Iwa8oFRi+lp0q5zXVXNe3uCI0Y42L3uDMnvZQZSKXNcJNURhwooucNCi63d6X
         22s00t6oE40Re/0td3QRJRuoec179b+qSJo8Q9OEohsehMYKlOTDnsU/+RaPECV7pWpA
         UDuxrgOCCYjpCHMktg3dOUrH+7WTqkOM7jZ1W/f0AuSwlqms3u+upnm0ma9dxTT3kjJi
         o0ORRTScMSU1g+cl9XEhGcAjN6kKwYm/bhO/oZuuodZ6leUPXDu5Kd1wM5bXcrWogjAZ
         EeKzJ48Q2PUdksZAJQhAWhDR+0SqtxNaWZM/2Q+zWOVU3hmTfowFMoPJATevGdE3/1m7
         iacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpEmgpRstbvPk5HZ787DxMAHEXsitluxkapNdOdQuGY=;
        b=qUszXUoCAy9h6M2TQbI4P3dm4Xa/U1sWVRngmbSoiTbwm/uiQNNAk/RuIK/vwH0RvZ
         0v5OSRemQVILfUkD4RG/q0Tgne/oSYG+U4HK6fatle0PQiKcO84bEVLrNDMk6RjzZL0B
         tiYthzWVmVKmuO3jwSYbd3KYLlRVJhOcsxs+xIfUR2qnay4YRnMJv2cfSRcaEeaMh8xT
         /t+BzqOn7VaWb+UysMVISuSylU88kfSZ1SUymEjGDyIUS6a+UYrM/ZO9ppgty0yLtKH/
         THRiPb5iwsoFPbSYSOQgUmVAHMcoF2NbsvePN/4sMRI1fpx0cjOt/8jpKNjAn98zi1nk
         IJKA==
X-Gm-Message-State: AOAM533mQGQet6Rk+FkENogPkeyfTPYtcWbUcBkXJYnJ/tsP2WTTU27t
        +hr7B5xuhpbDxMKDhY1OE/8=
X-Google-Smtp-Source: ABdhPJzRHZiOE10jlxdIy8rKtn6kdKL2mAIv9uGUf8D/ODMDwd9RReVyOUqoDw9GN3P3HV+/pWMIXg==
X-Received: by 2002:adf:aadb:: with SMTP id i27mr9352561wrc.258.1601125352964;
        Sat, 26 Sep 2020 06:02:32 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id f14sm7137738wrt.53.2020.09.26.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:02:32 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] clk: qcom: mmcc-msm8996: Migrate gfx3d clock to clk_rcg2_gfx3d
Date:   Sat, 26 Sep 2020 15:02:25 +0200
Message-Id: <20200926130225.13733-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130225.13733-1-kholk11@gmail.com>
References: <20200926130225.13733-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In commit 8c5dc88b064d the gfx3d ping-pong ops (clk_gfx3d_ops)
were generalized in order to be able to reuse the same ops for
more than just one clock for one SoC: follow the change here in
the MSM8996 MMCC.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/clk/qcom/mmcc-msm8996.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3b3aac07fb2d..24843e4f2599 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -528,16 +528,23 @@ static struct clk_rcg2 maxi_clk_src = {
 	},
 };
 
-static struct clk_rcg2 gfx3d_clk_src = {
-	.cmd_rcgr = 0x4000,
-	.hid_width = 5,
-	.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gfx3d_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
-		.num_parents = 6,
-		.ops = &clk_gfx3d_ops,
-		.flags = CLK_SET_RATE_PARENT,
+static struct clk_rcg2_gfx3d gfx3d_clk_src = {
+	.rcg = {
+		.cmd_rcgr = 0x4000,
+		.hid_width = 5,
+		.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
+		.clkr.hw.init = &(struct clk_init_data){
+			.name = "gfx3d_clk_src",
+			.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
+			.num_parents = 6,
+			.ops = &clk_gfx3d_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+	.hws = (struct clk_hw*[]) {
+		&mmpll9.clkr.hw,
+		&mmpll2.clkr.hw,
+		&mmpll8.clkr.hw
 	},
 };
 
@@ -3089,7 +3096,7 @@ static struct clk_regmap *mmcc_msm8996_clocks[] = {
 	[AHB_CLK_SRC] = &ahb_clk_src.clkr,
 	[AXI_CLK_SRC] = &axi_clk_src.clkr,
 	[MAXI_CLK_SRC] = &maxi_clk_src.clkr,
-	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
 	[RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
 	[ISENSE_CLK_SRC] = &isense_clk_src.clkr,
 	[RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
-- 
2.28.0

