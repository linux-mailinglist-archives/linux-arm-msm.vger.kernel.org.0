Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6293BFDE10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfKOMji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:39:38 -0500
Received: from onstation.org ([52.200.56.107]:60038 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727272AbfKOMji (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:39:38 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 5A85E3E994;
        Fri, 15 Nov 2019 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573821577;
        bh=x+6iGqh9RtO4/K9K4kVD36kgoj2To8VG5KWEkRGOHjs=;
        h=From:To:Cc:Subject:Date:From;
        b=EPQNCoavDDp1ZYL8V+UaMqP3MzPcLOFz9ZCdNFT29BgjiA31e3rLRm2Fa9lWALqS7
         BCuWynp/HGLrSzrcjt1s45lNMGS8LQBeVXpm/Xp0CoeBn93xg0c4cFBI9QGRNx14eg
         OKOtv9MoPmjGE3vPw/5sTEkvEspLY2QTAerbYv6Q=
From:   Brian Masney <masneyb@onstation.org>
To:     sboyd@kernel.org
Cc:     mturquette@baylibre.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        jonathan@marek.ca
Subject: [PATCH] clk: qcom: mmcc8974: move gfx3d_clk_src from the mmcc to rpm
Date:   Fri, 15 Nov 2019 07:39:31 -0500
Message-Id: <20191115123931.18919-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gfx3d_clk_src for msm8974 was introduced into the MMCC by
commit d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia
clock controller (MMCC)") to ensure that all of the clocks for
this platform are documented upstream. This clock actually belongs
on the RPM. Since then, commit 685dc94b7d8f ("clk: qcom: smd-rpmcc:
Add msm8974 clocks") was introduced, which contains the proper
definition for gfx3d_clk_src. Let's drop the definition from the
mmcc and register the clock with the rpm instead.

This change was tested on a Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/clk/qcom/clk-smd-rpm.c  |  2 ++
 drivers/clk/qcom/mmcc-msm8974.c | 13 -------------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 60aae7543608..2db31dbe47e9 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -486,6 +486,8 @@ static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_MMSSNOC_AHB_CLK]	= &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK]	= &msm8974_mmssnoc_ahb_a_clk,
 	[RPM_SMD_BIMC_CLK]		= &msm8974_bimc_clk,
+	[RPM_SMD_GFX3D_CLK_SRC]		= &msm8974_gfx3d_clk_src,
+	[RPM_SMD_GFX3D_A_CLK_SRC]	= &msm8974_gfx3d_a_clk_src,
 	[RPM_SMD_BIMC_A_CLK]		= &msm8974_bimc_a_clk,
 	[RPM_SMD_OCMEMGX_CLK]		= &msm8974_ocmemgx_clk,
 	[RPM_SMD_OCMEMGX_A_CLK]		= &msm8974_ocmemgx_a_clk,
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index bcb0a397ef91..015426262d08 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -452,18 +452,6 @@ static struct clk_rcg2 mdp_clk_src = {
 	},
 };
 
-static struct clk_rcg2 gfx3d_clk_src = {
-	.cmd_rcgr = 0x4000,
-	.hid_width = 5,
-	.parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gfx3d_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
-		.num_parents = 5,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static struct freq_tbl ftbl_camss_jpeg_jpeg0_2_clk[] = {
 	F(75000000, P_GPLL0, 8, 0, 0),
 	F(133330000, P_GPLL0, 4.5, 0, 0),
@@ -2411,7 +2399,6 @@ static struct clk_regmap *mmcc_msm8974_clocks[] = {
 	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
 	[VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
 	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
-	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
 	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
 	[JPEG1_CLK_SRC] = &jpeg1_clk_src.clkr,
 	[JPEG2_CLK_SRC] = &jpeg2_clk_src.clkr,
-- 
2.21.0

