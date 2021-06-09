Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573EE3A0C46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 08:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236711AbhFIGT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 02:19:59 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5459 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236699AbhFIGT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 02:19:59 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G0H016FFQzYnT5;
        Wed,  9 Jun 2021 14:15:13 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 14:18:03 +0800
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 14:18:02 +0800
From:   Pu Lehui <pulehui@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <pulehui@huawei.com>,
        <zhangjinhao2@huawei.com>
Subject: [PATCH -next] clk/qcom: Remove unused variables
Date:   Wed, 9 Jun 2021 14:18:48 +0800
Message-ID: <20210609061848.87415-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix gcc '-Wunused-const-variable' warnings:

  drivers/clk/qcom/gcc-mdm9607.c:122:37: warning: 'gcc_xo_gpll0_gpll1'
    defined but not used [-Wunused-const-variable=]
  drivers/clk/qcom/gcc-mdm9607.c:116:32: warning: 'gcc_xo_gpll0_gpll1_map'
    defined but not used [-Wunused-const-variable=]
  drivers/clk/qcom/gcc-mdm9607.c:42:37: warning: 'gcc_xo_sleep' defined
    but not used [-Wunused-const-variable=]
  drivers/clk/qcom/gcc-mdm9607.c:37:32: warning: 'gcc_xo_sleep_map'
    defined but not used [-Wunused-const-variable=]

Let's remove them.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 drivers/clk/qcom/gcc-mdm9607.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 5918dc51ffcd..4c9078e99bb3 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -34,16 +34,6 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static const struct parent_map gcc_xo_sleep_map[] = {
-	{ P_XO, 0 },
-	{ P_SLEEP_CLK, 6 }
-};
-
-static const struct clk_parent_data gcc_xo_sleep[] = {
-	{ .fw_name = "xo" },
-	{ .fw_name = "sleep_clk" },
-};
-
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x21000,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -113,19 +103,6 @@ static struct clk_regmap gpll1_vote = {
 	},
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1, 2 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_gpll1[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll1_vote.hw },
-};
-
-
 static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
-- 
2.17.1

