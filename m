Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A721CBE96
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 09:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgEIHxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 03:53:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4371 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbgEIHxM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 03:53:12 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 9064E33347D0D4770EB6;
        Sat,  9 May 2020 15:53:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 15:52:57 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] bus: mhi: core: Fix some error return code
Date:   Sat, 9 May 2020 07:56:54 +0000
Message-ID: <20200509075654.175002-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix to return negative error code from the error handling case
instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().

Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bus/mhi/core/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb2ab058a01d..1f8c82603179 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Setup cmd context */
+	ret = -ENOMEM;
 	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
 						sizeof(*mhi_ctxt->cmd_ctxt) *
 						NR_OF_CMD_RINGS,
@@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
 		}
 	}
 
+	ret = -EINVAL;
 	if (dl_chan) {
 		/*
 		 * If channel supports LPM notifications then status_cb should



