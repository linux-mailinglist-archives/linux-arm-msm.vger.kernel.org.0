Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D775786B61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 11:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240617AbjHXJRe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 05:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbjHXJRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 05:17:14 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54427198E
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 02:17:12 -0700 (PDT)
Received: from dggpemm100018.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RWcnq1CpTzNmtN;
        Thu, 24 Aug 2023 17:13:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100018.china.huawei.com (7.185.36.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 17:17:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 17:17:09 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-phy@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
CC:     <quic_varada@quicinc.com>, <andersson@kernel.org>,
        <vkoul@kernel.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] phy: qcom: phy-qcom-m31: fix wrong pointer pass to PTR_ERR()
Date:   Thu, 24 Aug 2023 17:13:45 +0800
Message-ID: <20230824091345.1072650-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

It should be 'qphy->vreg' passed to PTR_ERR() when devm_regulator_get() fails.

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-m31.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index ed08072ca032..99d570f4142a 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -256,7 +256,7 @@ static int m31usb_phy_probe(struct platform_device *pdev)
 
 	qphy->vreg = devm_regulator_get(dev, "vdda-phy");
 	if (IS_ERR(qphy->vreg))
-		return dev_err_probe(dev, PTR_ERR(qphy->phy),
+		return dev_err_probe(dev, PTR_ERR(qphy->vreg),
 						"failed to get vreg\n");
 
 	phy_set_drvdata(qphy->phy, qphy);
-- 
2.25.1

