Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC8647A75B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Dec 2021 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhLTJmn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 04:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhLTJmn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 04:42:43 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4FCC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 01:42:43 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id a203-20020a1c7fd4000000b003457874263aso6851382wmd.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 01:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9bqIGUJ89rKDZC/eTYZbjZiz5eFlGe0m26Fge/0NV6k=;
        b=Il0XRkfBYTC2xur5wtkI7mUWtKmaXL3z6JBkL4Y1rG5awb321rlckps+pcsA92+Cp1
         IIQzeWOvbCQcwiuFVsG8yrsWBSfNEUBseaBobe2MMr9Z5453apV/txW0KUJAjMSSu6XY
         FB6br7YzOJK7whcnTSHmvgSHVJiPG5ZR0t1HZs7SOJYruToS26sTWLRXdqWLKdcA8SCK
         pZyn13/aXj9TC2EDWUYdd8uusoGAzGAjFEmWzEkacGVtsDmNsZI+Y27rWYhTUYfbCtEb
         Sg+ChOrEh29uEZuCd7QKtSExIzjrE2r8cJDOMx2oZBnIevSCBLQtiFDVEDHuHVinhKtW
         0AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9bqIGUJ89rKDZC/eTYZbjZiz5eFlGe0m26Fge/0NV6k=;
        b=63K6kfNNJqbm+5T1Vm/f7OdPGThAF2LZ5WXpbtJF4AcAlTRQlBiLeHjKaJGkBWMPkv
         6eLCjDv0tN3vvfUkpDESSQLbVEU0dUO7bDXnOZPlX/alb53Ke6cZkHmfgKEuzqfMVBiV
         bbTFQbE5KRaQ4iWv1PeDS9XFEcqNq5lpSQiyfiSJO3/cifQBPKpOHvjQl+LyL56MAhF6
         wMxM8z+U6RSgITwIRajq6NZPPQ2w4zs09Zs/BXXVhGvHr3U3W+gfpjmyekuBIEXGCoti
         H1Hx/Vnx5kEWWYiXykJ2of4apoLHEqQ1YSc8h3zRd5FjhJfQG3StKhheuZmtBA2Ns8If
         M7Ow==
X-Gm-Message-State: AOAM530TES/2g1+IuevgpNEKVo9/jmffZlvzh0efiSAYwHdmA6kdEu8H
        MQP1lbkEN7cWSfwQ0M+RMPDu6A==
X-Google-Smtp-Source: ABdhPJy1VSCixEZ/6qalV/IvMk4jDt6ZwwGhU7h3yACvIA3SqzhxOWwZ0Rfci66Rmtg7CZRB3FKfRg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr13165067wmj.117.1639993361655;
        Mon, 20 Dec 2021 01:42:41 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id p18sm5611332wmq.0.2021.12.20.01.42.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Dec 2021 01:42:41 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     sboyd@kernel.org, shawn.guo@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] clk: qcom: gcc-qcm2290: CLK_OPS_PARENT_ENABLE flag for rcg2 clocks
Date:   Mon, 20 Dec 2021 10:54:44 +0100
Message-Id: <1639994084-25447-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a rcg2 clock migrates to a new parent, both the old and new
parent clocks must be enabled to complete the transition. This can
be automatically performed by the clock core when a clock is flagged
with CLK_OPS_PARENT_ENABLE.

Without this, we may hit rate update failures:
gcc_sdcc2_apps_clk_src: rcg didn't update its configuration.
WARNING: CPU: 1 PID: 82 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xe0/0xf0

Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/clk/qcom/gcc-qcm2290.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index b6fa7b8..9e1d88e 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -674,6 +674,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parents_0,
 		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -710,6 +711,7 @@ static struct clk_rcg2 gcc_camss_axi_clk_src = {
 		.name = "gcc_camss_axi_clk_src",
 		.parent_data = gcc_parents_4,
 		.num_parents = ARRAY_SIZE(gcc_parents_4),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -730,6 +732,7 @@ static struct clk_rcg2 gcc_camss_cci_clk_src = {
 		.name = "gcc_camss_cci_clk_src",
 		.parent_data = gcc_parents_9,
 		.num_parents = ARRAY_SIZE(gcc_parents_9),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -752,6 +755,7 @@ static struct clk_rcg2 gcc_camss_csi0phytimer_clk_src = {
 		.name = "gcc_camss_csi0phytimer_clk_src",
 		.parent_data = gcc_parents_5,
 		.num_parents = ARRAY_SIZE(gcc_parents_5),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -766,6 +770,7 @@ static struct clk_rcg2 gcc_camss_csi1phytimer_clk_src = {
 		.name = "gcc_camss_csi1phytimer_clk_src",
 		.parent_data = gcc_parents_5,
 		.num_parents = ARRAY_SIZE(gcc_parents_5),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -854,6 +859,7 @@ static struct clk_rcg2 gcc_camss_ope_ahb_clk_src = {
 		.name = "gcc_camss_ope_ahb_clk_src",
 		.parent_data = gcc_parents_6,
 		.num_parents = ARRAY_SIZE(gcc_parents_6),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -912,6 +918,7 @@ static struct clk_rcg2 gcc_camss_tfe_0_clk_src = {
 		.name = "gcc_camss_tfe_0_clk_src",
 		.parent_data = gcc_parents_7,
 		.num_parents = ARRAY_SIZE(gcc_parents_7),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -936,6 +943,7 @@ static struct clk_rcg2 gcc_camss_tfe_0_csid_clk_src = {
 		.name = "gcc_camss_tfe_0_csid_clk_src",
 		.parent_data = gcc_parents_8,
 		.num_parents = ARRAY_SIZE(gcc_parents_8),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -950,6 +958,7 @@ static struct clk_rcg2 gcc_camss_tfe_1_clk_src = {
 		.name = "gcc_camss_tfe_1_clk_src",
 		.parent_data = gcc_parents_7,
 		.num_parents = ARRAY_SIZE(gcc_parents_7),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -964,6 +973,7 @@ static struct clk_rcg2 gcc_camss_tfe_1_csid_clk_src = {
 		.name = "gcc_camss_tfe_1_csid_clk_src",
 		.parent_data = gcc_parents_8,
 		.num_parents = ARRAY_SIZE(gcc_parents_8),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1008,6 +1018,7 @@ static struct clk_rcg2 gcc_camss_top_ahb_clk_src = {
 		.name = "gcc_camss_top_ahb_clk_src",
 		.parent_data = gcc_parents_4,
 		.num_parents = ARRAY_SIZE(gcc_parents_4),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1030,6 +1041,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parents_2,
 		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1044,6 +1056,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parents_2,
 		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1058,6 +1071,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parents_2,
 		.num_parents = ARRAY_SIZE(gcc_parents_2),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1078,6 +1092,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parents_0,
 		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1220,6 +1235,7 @@ static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
 		.name = "gcc_sdcc1_apps_clk_src",
 		.parent_data = gcc_parents_1,
 		.num_parents = ARRAY_SIZE(gcc_parents_1),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1243,6 +1259,7 @@ static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
 		.name = "gcc_sdcc1_ice_core_clk_src",
 		.parent_data = gcc_parents_0,
 		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1267,6 +1284,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parents_12,
 		.num_parents = ARRAY_SIZE(gcc_parents_12),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1289,6 +1307,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parents_0,
 		.num_parents = ARRAY_SIZE(gcc_parents_0),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1303,6 +1322,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parents_13,
 		.num_parents = ARRAY_SIZE(gcc_parents_13),
+		.flags = CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.7.4

