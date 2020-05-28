Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA001E63B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 16:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390958AbgE1OWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 10:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391035AbgE1OWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 10:22:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100D2C05BD1E;
        Thu, 28 May 2020 07:22:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id n15so3166621pjt.4;
        Thu, 28 May 2020 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wWwF/bnn9ZcbJfYK+03lCeXiM0oqQHMOv1ojVW5AqE4=;
        b=t8tJG5mvH1xzHtWy9lfolS8Z5SK+IeWq2bqqiIG8Uc9CJCBKzXghkXX8/p4F5WEHDV
         PlHaJz7KxOcxKPrJvCSdFRqhx9pImpYNt6lYdpOuwTzrF0iOfTDJzDzgITmRwFhFoeOg
         VtnQLhWm8iPr+UEc64Bdw6tTVfN04K/uAjk3Wdrf79rUiODGo1q+6mIl7xfPEPngc7RP
         3/WxyUHz7rjkK+v937kOWyYXQzqFPYvddtoc8W577qoE5TEZd5hNSFu+45O3hesI/JUO
         1I6toFDX3x3RytZqiPQSc9rfPHWKdSFAeMti4faxVlH1LwOLaTUOQ7KlTEaoWSjwF7Ou
         6Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wWwF/bnn9ZcbJfYK+03lCeXiM0oqQHMOv1ojVW5AqE4=;
        b=oSZjDTuT19/UNXvHvjzDao7dnNT4tqI5mEbpJnK9qLmwrMgzTjeliqfB9hPb20qPVA
         nZrtEa7CT62ufkmRGLGCj/nV6x0kaJ1wxQJC+qfiE8Kfu1XWfbtS1mtQ0odSmlkJOa9I
         EA2PxlKJ3DLw3D7887FxXtpj7q/hlas48nUnIU/x5SPsERtcxfTj2lSJcgsnNlWqCECg
         tw3Z/VK2kBZmGytg99zQ3IF1XMt9FxRqLRdzzzCAvKdUqx1/2JkDmFVxiuZ/f8SyxB5O
         wB2PwV6B09jw49U9VpQCzM2hF2+phJxDcgmB+24MWdl5IlLYkx8Otywt1a93qZFhpiA8
         EDxg==
X-Gm-Message-State: AOAM532sZAfF9nneqBtZLfZjR3rAoKIk7jgXumPkESvK73tl8cDGWcYg
        L0ZoTrix+1Ekua+N6/BZr/O36/lJ
X-Google-Smtp-Source: ABdhPJzdi2KceMqeO7E/63+tTlQhot38qwIjBd3zpxPWOZm2KCHm3nr1Tu8bVrtUl2/OVu534jXuHw==
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr3803290plr.138.1590675730628;
        Thu, 28 May 2020 07:22:10 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id w4sm2188394pfq.57.2020.05.28.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:22:10 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     sboyd@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: Add missing msm8998 ufs_unipro_core_clk_src
Date:   Thu, 28 May 2020 07:22:05 -0700
Message-Id: <20200528142205.44003-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ufs_unipro_core_clk_src is required to allow UFS to clock scale for power
savings.

Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/gcc-msm8998.c               | 27 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index df1d7056436c..9d7016bcd680 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1110,6 +1110,27 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	},
 };
 
+static const struct freq_tbl ftbl_ufs_unipro_core_clk_src[] = {
+	F(37500000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(150000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ufs_unipro_core_clk_src = {
+	.cmd_rcgr = 0x76028,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_0,
+	.freq_tbl = ftbl_ufs_unipro_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ufs_unipro_core_clk_src",
+		.parent_names = gcc_parent_names_0,
+		.num_parents = 4,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_usb30_master_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(60000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
@@ -2549,6 +2570,11 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_unipro_core_clk",
+			.parent_names = (const char *[]){
+				"ufs_unipro_core_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2904,6 +2930,7 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[SDCC4_APPS_CLK_SRC] = &sdcc4_apps_clk_src.clkr,
 	[TSIF_REF_CLK_SRC] = &tsif_ref_clk_src.clkr,
 	[UFS_AXI_CLK_SRC] = &ufs_axi_clk_src.clkr,
+	[UFS_UNIPRO_CORE_CLK_SRC] = &ufs_unipro_core_clk_src.clkr,
 	[USB30_MASTER_CLK_SRC] = &usb30_master_clk_src.clkr,
 	[USB30_MOCK_UTMI_CLK_SRC] = &usb30_mock_utmi_clk_src.clkr,
 	[USB3_PHY_AUX_CLK_SRC] = &usb3_phy_aux_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 63e02dc32a0b..6a73a174f049 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -183,6 +183,7 @@
 #define GCC_MSS_SNOC_AXI_CLK					174
 #define GCC_MSS_MNOC_BIMC_AXI_CLK				175
 #define GCC_BIMC_GFX_CLK					176
+#define UFS_UNIPRO_CORE_CLK_SRC					177
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
-- 
2.17.1

