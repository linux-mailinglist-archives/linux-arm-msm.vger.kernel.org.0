Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD50D2656BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 03:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgIKBiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 21:38:15 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35746 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725280AbgIKBiN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 21:38:13 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 66BCEDB7CBFD16C28D5E;
        Fri, 11 Sep 2020 09:38:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 09:38:01 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] clk: qcom: gcc-msm8939: remove defined but not used variables
Date:   Fri, 11 Sep 2020 09:37:22 +0800
Message-ID: <20200911013722.1459387-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This addresses the following gcc warning with "make W=1":

drivers/clk/qcom/gcc-msm8939.c:610:32: warning:
‘gcc_xo_gpll6_gpll0a_map’ defined but not used
[-Wunused-const-variable=]
 static const struct parent_map gcc_xo_gpll6_gpll0a_map[] = {
                                ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/qcom/gcc-msm8939.c:598:32: warning: ‘gcc_xo_gpll6_gpll0_map’
defined but not used [-Wunused-const-variable=]
 static const struct parent_map gcc_xo_gpll6_gpll0_map[] = {
                                ^~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 778354f82b1e..39ebb443ae3d 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -595,24 +595,12 @@ static const struct clk_parent_data gcc_xo_gpll1_emclk_sleep_parent_data[] = {
 	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
-static const struct parent_map gcc_xo_gpll6_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL6, 1 },
-	{ P_GPLL0, 2 },
-};
-
 static const struct clk_parent_data gcc_xo_gpll6_gpll0_parent_data[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll6_vote.hw },
 	{ .hw = &gpll0_vote.hw },
 };
 
-static const struct parent_map gcc_xo_gpll6_gpll0a_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL6, 1 },
-	{ P_GPLL0_AUX, 2 },
-};
-
 static const struct clk_parent_data gcc_xo_gpll6_gpll0a_parent_data[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll6_vote.hw },
-- 
2.25.4

