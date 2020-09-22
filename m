Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0BA274096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 13:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgIVLV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 07:21:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13821 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726513AbgIVLV0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 07:21:26 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 9B537D68EBE16DA17004;
        Tue, 22 Sep 2020 19:21:24 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 22 Sep 2020
 19:21:18 +0800
From:   Li Heng <liheng40@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] clk: qcom: Remove set but not used variable
Date:   Tue, 22 Sep 2020 19:21:18 +0800
Message-ID: <1600773678-46320-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This addresses the following gcc warning with "make W=1":

drivers/clk/qcom/gcc-sdm660.c:52:32:warning:
‘gcc_parent_map_xo_gpll0’ defined but not used [-Wunused-const-variable=]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index f0b47b7..db0fb7e 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -49,11 +49,6 @@ static const char * const gcc_parent_names_xo_gpll0_gpll0_early_div[] = {
 	"gpll0_early_div",
 };

-static const struct parent_map gcc_parent_map_xo_gpll0[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-};
-
 static const char * const gcc_parent_names_xo_gpll0[] = {
 	"xo",
 	"gpll0",
--
2.7.4

