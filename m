Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E8E2C97CE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 08:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgLAHGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 02:06:02 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57868 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAHGC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 02:06:02 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B16xURN164535;
        Tue, 1 Dec 2020 07:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=lxQhznWrhqttBj2GenegIUeidXIBtS/QO68pBLdlh1k=;
 b=Y8a/OTslULivHgRs6t1k2yYCncddZtS16cudf69ceAh4O4dyJKBbfOvY0hFZa0T5omd6
 XdRrXGKLW7fqzpDcdd7kmlk8ndE3Dp8dlcyMRN/kRLQe1/dFSnLlmKeLPUN4ttkRmaz7
 MYFS46u2Kow98Cl7+/abFJTlSs5WdeAg3hcX9FIo6Yap+b9/xnWEW78BzZFjG17RzYWE
 7JTMYJvufS41GBSqRadVU2DQWGfcq0urS28uAIbvigkGmwTfCc5hkE/G01+M7KHCKGas
 xrHbV86lelAf2kQ4eKOL0MY8l0oqc16bkehC99QEc+5l4+qJY14IQuvMw2Hjw+N/ZorP ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 353dyqh03e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 01 Dec 2020 07:05:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1703wd040465;
        Tue, 1 Dec 2020 07:03:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 3540exjs8n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Dec 2020 07:03:14 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B173CXY006362;
        Tue, 1 Dec 2020 07:03:13 GMT
Received: from mwanda (/41.210.145.16)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Nov 2020 23:03:08 -0800
Date:   Tue, 1 Dec 2020 10:02:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: core: Fix error handling in
 mhi_register_controller()
Message-ID: <X8XqbtkPpEKSfFi2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=2 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010045
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=2 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010045
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are a few problems with the error handling in this function.  They
mostly center around the alloc_ordered_workqueue() allocation.
1) If that allocation fails or if the kcalloc() prior to it fails then
it leads to a NULL dereference when we call
destroy_workqueue(mhi_cntrl->hiprio_wq).
2) The error code is not set.
3) The "mhi_cntrl->mhi_cmd" allocation is not freed.

The error handling was slightly confusing and I re-ordered it to be in
the exact mirror/reverse order of how things were allocated.  I changed
the label names to say what the goto does instead of describing where
the goto comes from.

Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/bus/mhi/core/init.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 96cde9c0034c..f0697f433c2f 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 				     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
 	if (!mhi_cntrl->mhi_cmd) {
 		ret = -ENOMEM;
-		goto error_alloc_cmd;
+		goto err_free_event;
 	}
 
 	INIT_LIST_HEAD(&mhi_cntrl->transition_list);
@@ -886,7 +886,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
 	if (!mhi_cntrl->hiprio_wq) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
-		goto error_alloc_cmd;
+		ret = -ENOMEM;
+		goto err_free_cmd;
 	}
 
 	mhi_cmd = mhi_cntrl->mhi_cmd;
@@ -932,7 +933,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
 			   SOC_HW_VERSION_OFFS, &soc_info);
 	if (ret)
-		goto error_alloc_dev;
+		goto err_destroy_wq;
 
 	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
 					SOC_HW_VERSION_FAM_NUM_SHFT;
@@ -946,7 +947,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
 	if (mhi_cntrl->index < 0) {
 		ret = mhi_cntrl->index;
-		goto error_ida_alloc;
+		goto err_destroy_wq;
 	}
 
 	/* Register controller with MHI bus */
@@ -954,7 +955,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (IS_ERR(mhi_dev)) {
 		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate MHI device\n");
 		ret = PTR_ERR(mhi_dev);
-		goto error_alloc_dev;
+		goto err_ida_free;
 	}
 
 	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
@@ -967,7 +968,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	ret = device_add(&mhi_dev->dev);
 	if (ret)
-		goto error_add_dev;
+		goto err_release_dev;
 
 	mhi_cntrl->mhi_dev = mhi_dev;
 
@@ -975,19 +976,17 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	return 0;
 
-error_add_dev:
+err_release_dev:
 	put_device(&mhi_dev->dev);
-
-error_alloc_dev:
+err_ida_free:
 	ida_free(&mhi_controller_ida, mhi_cntrl->index);
-
-error_ida_alloc:
+err_destroy_wq:
+	destroy_workqueue(mhi_cntrl->hiprio_wq);
+err_free_cmd:
 	kfree(mhi_cntrl->mhi_cmd);
-
-error_alloc_cmd:
-	vfree(mhi_cntrl->mhi_chan);
+err_free_event:
 	kfree(mhi_cntrl->mhi_event);
-	destroy_workqueue(mhi_cntrl->hiprio_wq);
+	vfree(mhi_cntrl->mhi_chan);
 
 	return ret;
 }
-- 
2.29.2

