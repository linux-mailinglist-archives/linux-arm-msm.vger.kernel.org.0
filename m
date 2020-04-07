Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC421A0A3E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 11:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgDGJeA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 05:34:00 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53744 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbgDGJeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 05:34:00 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379Xooq042120;
        Tue, 7 Apr 2020 09:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=qcmA2k2UwC4imiuARVmbmTLIEvubWj//Z2k36MvdxtE=;
 b=ZeZ6N1Y1EEjkLRdUdneRzCv6B6vuAwBBvW2gzit89rzQpCkn7Dvb7tf8xOwCyY37/jZp
 ETym6Mo6eHnJjQ/Xg6iyUhCMSq16AhHYd0EMA/K5xIWUN6UDNiOjVGpan6YSyrFAkFYO
 MVUpXxc5OUqpvtOKZoWvq2KsQXPKrYGbmD1yIKJ9lDyO0BQRpuw+JoVE22TOJ8U35jMi
 FRHHyJglDo0oiX3hrv4agAHgVdls4bQ8KErxCR8EQO2tFPtLVxulxNFrn6EwldINmHBT
 3F83ZgeABH9jtuaadYZ3frt60pFt9mMxHGk8AVGksGXfBCVjOCFR42XPQTWS7It0AckJ ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 306j6mbrgn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:33:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RGdW041436;
        Tue, 7 Apr 2020 09:31:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3073qfgg4y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:31:43 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0379VfL9028581;
        Tue, 7 Apr 2020 09:31:42 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:31:41 -0700
Date:   Tue, 7 Apr 2020 12:31:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] bus: mhi: core: Fix a NULL vs IS_ERR check in
 mhi_create_devices()
Message-ID: <20200407093133.GM68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070081
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mhi_alloc_device() function never returns NULL, it returns error
pointers.

Fixes: da1c4f856924 ("bus: mhi: core: Add support for creating and destroying MHI devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/bus/mhi/core/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index eb4256b81406..55928feea0c9 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -294,7 +294,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
 		    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
 			continue;
 		mhi_dev = mhi_alloc_device(mhi_cntrl);
-		if (!mhi_dev)
+		if (IS_ERR(mhi_dev))
 			return;
 
 		mhi_dev->dev_type = MHI_DEVICE_XFER;
-- 
2.25.1

