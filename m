Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA903596B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 09:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhDIHrW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Fri, 9 Apr 2021 03:47:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16857 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhDIHrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 03:47:22 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGqsf11HKz9xcq;
        Fri,  9 Apr 2021 15:44:54 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 15:46:57 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] scsi: ufs-qcom: Remove redundant dev_err call in ufs_qcom_init()
Date:   Fri, 9 Apr 2021 15:55:22 +0800
Message-ID: <20210409075522.2111083-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/scsi/ufs/ufs-qcom.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9b711d6aac54..2a3dd21da6a6 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1071,13 +1071,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		if (res) {
 			host->dev_ref_clk_ctrl_mmio =
 					devm_ioremap_resource(dev, res);
-			if (IS_ERR(host->dev_ref_clk_ctrl_mmio)) {
-				dev_warn(dev,
-					"%s: could not map dev_ref_clk_ctrl_mmio, err %ld\n",
-					__func__,
-					PTR_ERR(host->dev_ref_clk_ctrl_mmio));
+			if (IS_ERR(host->dev_ref_clk_ctrl_mmio))
 				host->dev_ref_clk_ctrl_mmio = NULL;
-			}
 			host->dev_ref_clk_en_mask = BIT(5);
 		}
 	}

