Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DA079008A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Sep 2023 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244902AbjIAQLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Sep 2023 12:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242107AbjIAQLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Sep 2023 12:11:02 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1964CDD
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Sep 2023 09:10:59 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 381DS6FS012774;
        Fri, 1 Sep 2023 16:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rbQgj5LEVVXkXw9/KgGEXCJEbnqFKBagAU8tsnxvWO8=;
 b=a4w9esW13v8P6Jjb273ju/7+QuwPJ9loOY9yHRipa2H5Kfc/Wf3VkIKxWo/tUZqpbeIi
 Nx/OLvz+NU7T/6di5IQx7EBJ6RaIw0BWh+KUh/XV/MxqE5pokK8nLVcSC29gLCSsrz36
 DVSFWqyMaEr5LIMNxkCvAXtAd1XSZ7FCfFMustEn4ibzTRTUOarW0vdX2hAeQVyP4fSf
 yfJmtUaE9SpsrNKhTnKGUdh/x4hTPe8/9ZwvDBkqOGDe+CFCBUToH+kdM5TMAjMoZqQI
 hVApvvC+WNMe8aOc9yL0S+ClMfKwLomhZwginGh8x5OmaPIqL30BijRteGJvgIXEwtVG lw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3suc9k16tb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Sep 2023 16:10:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 381GArDu022448
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 1 Sep 2023 16:10:53 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 1 Sep 2023 09:10:52 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Register for PCI driver at the beginning of module init
Date:   Fri, 1 Sep 2023 10:10:37 -0600
Message-ID: <20230901161037.6124-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xvI_H7P9Q4SQFPEaKXDf7JTf013M2QKv
X-Proofpoint-ORIG-GUID: xvI_H7P9Q4SQFPEaKXDf7JTf013M2QKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_13,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309010150
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

As qaic drivers base device is connected to host via PCI framework, it
makes sense to register in PCI framework at the beginning of module
init.

Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index b5de82e6eb4d..49b5039f4cad 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -591,22 +591,22 @@ static int __init qaic_init(void)
 {
 	int ret;
 
-	ret = mhi_driver_register(&qaic_mhi_driver);
+	ret = pci_register_driver(&qaic_pci_driver);
 	if (ret) {
-		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
+		pr_debug("qaic: pci_register_driver failed %d\n", ret);
 		return ret;
 	}
 
-	ret = pci_register_driver(&qaic_pci_driver);
+	ret = mhi_driver_register(&qaic_mhi_driver);
 	if (ret) {
-		pr_debug("qaic: pci_register_driver failed %d\n", ret);
-		goto free_mhi;
+		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
+		goto free_pci;
 	}
 
 	return 0;
 
-free_mhi:
-	mhi_driver_unregister(&qaic_mhi_driver);
+free_pci:
+	pci_unregister_driver(&qaic_pci_driver);
 	return ret;
 }
 
@@ -628,8 +628,8 @@ static void __exit qaic_exit(void)
 	 * reinitializing the link_up state after the cleanup is done.
 	 */
 	link_up = true;
-	pci_unregister_driver(&qaic_pci_driver);
 	mhi_driver_unregister(&qaic_mhi_driver);
+	pci_unregister_driver(&qaic_pci_driver);
 }
 
 module_init(qaic_init);
-- 
2.40.1

