Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DADDA77DB9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 10:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbjHPIEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 04:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242631AbjHPIEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 04:04:33 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C72109;
        Wed, 16 Aug 2023 01:04:32 -0700 (PDT)
Received: from dggpemm500017.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RQgbH1PRfzVjsK;
        Wed, 16 Aug 2023 16:02:19 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500017.china.huawei.com (7.185.36.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 16 Aug 2023 16:04:24 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 16:04:23 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-clk@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <agross@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_gokulsri@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next] clk: qcom: gcc-ipq5018: change some variable static
Date:   Wed, 16 Aug 2023 16:01:13 +0800
Message-ID: <20230816080113.1222352-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpass_axim_clk_src and lpass_sway_clk_src are only
used in gcc-ipq5018.c now, change them to static.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 313ff2281ca7..19dc2b71cacf 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -826,7 +826,7 @@ static const struct freq_tbl ftbl_lpass_axim_clk_src[] = {
 	{ }
 };
 
-struct clk_rcg2 lpass_axim_clk_src = {
+static struct clk_rcg2 lpass_axim_clk_src = {
 	.cmd_rcgr = 0x2e028,
 	.freq_tbl = ftbl_lpass_axim_clk_src,
 	.hid_width = 5,
@@ -844,7 +844,7 @@ static const struct freq_tbl ftbl_lpass_sway_clk_src[] = {
 	{ }
 };
 
-struct clk_rcg2 lpass_sway_clk_src = {
+static struct clk_rcg2 lpass_sway_clk_src = {
 	.cmd_rcgr = 0x2e040,
 	.freq_tbl = ftbl_lpass_sway_clk_src,
 	.hid_width = 5,
-- 
2.25.1

