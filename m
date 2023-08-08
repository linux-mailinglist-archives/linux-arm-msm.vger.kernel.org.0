Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD777773664
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 04:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjHHCPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 22:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjHHCPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 22:15:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACFB1705
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 19:15:13 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RKcDG2syRzVkJF;
        Tue,  8 Aug 2023 10:13:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 10:15:11 +0800
From:   Li Zetao <lizetao1@huawei.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>
CC:     <lizetao1@huawei.com>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH -next] soc: qcom: wcnss_ctrl: Remove redundant initialization owner in wcnss_ctrl_driver
Date:   Tue, 8 Aug 2023 10:14:46 +0800
Message-ID: <20230808021446.2975843-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The module_rpmsg_driver() will set "THIS_MODULE" to driver.owner when
register a rpmsg_driver driver, so it is redundant initialization to set
driver.owner in the statement. Remove it for clean code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/soc/qcom/wcnss_ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index ad9942412c58..2894e214cacf 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -355,7 +355,6 @@ static struct rpmsg_driver wcnss_ctrl_driver = {
 	.callback = wcnss_ctrl_smd_callback,
 	.drv  = {
 		.name  = "qcom_wcnss_ctrl",
-		.owner = THIS_MODULE,
 		.of_match_table = wcnss_ctrl_of_match,
 	},
 };
-- 
2.34.1

