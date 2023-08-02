Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880C276C316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 04:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjHBCvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 22:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjHBCvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 22:51:39 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B761FD6
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 19:51:38 -0700 (PDT)
Received: from dggpemm500018.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RFxJ57136zLnts;
        Wed,  2 Aug 2023 10:48:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 10:51:36 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 10:51:35 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-arm-msm@vger.kernel.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <luca@z3ntu.xyz>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] soc: qcom: ocmem: add missing clk_disable_unprepare() in ocmem_dev_probe()
Date:   Wed, 2 Aug 2023 10:48:55 +0800
Message-ID: <20230802024855.2521895-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add clk_disable_unprepare(core_clk) when enable iface_clk failed.

Fixes: a7e12e7bda08 ("soc: qcom: ocmem: make iface clock optional")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/soc/qcom/ocmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 6edc18b211aa..20f5461d46b9 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -341,12 +341,14 @@ static int ocmem_dev_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(ocmem->core_clk);
 	if (ret)
 		return dev_err_probe(ocmem->dev, ret, "Failed to enable core clock\n");
 
 	ret = clk_prepare_enable(ocmem->iface_clk);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(ocmem->core_clk);
 		return dev_err_probe(ocmem->dev, ret, "Failed to enable iface clock\n");
+	}
 
 	if (qcom_scm_restore_sec_cfg_available()) {
 		dev_dbg(dev, "configuring scm\n");
 		ret = qcom_scm_restore_sec_cfg(QCOM_SCM_OCMEM_DEV_ID, 0);
 		if (ret) {
-- 
2.25.1

