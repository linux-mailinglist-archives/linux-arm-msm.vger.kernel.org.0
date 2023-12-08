Return-Path: <linux-arm-msm+bounces-4020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8479680A926
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3D01F2112F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F6F38F8B;
	Fri,  8 Dec 2023 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IWNIFGqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083EF1BFF
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:35:28 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8D84Uu018144;
	Fri, 8 Dec 2023 16:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=EhBPLRXAVT8dz4lUf2csStvIIJnjazv9rWYO/ERwUdo=;
 b=IWNIFGqivzaMPsaYZ8jdcSazRAZfcXZUIlA3712eii6+dtwN8x6k13UKCrnHQZupWdYk
 taWiv2hewusMPcEpfw7MmvBQjTLiWz6RYfTmRdHGM0o9MPF56epi9x3KmHoMgNJAHRrk
 r2qfXioLQYfUnaTRQfxGVgwNbZs78dtzSElACESM9UNsy4bnPVeQl0z7a0tyB839U/tp
 W005Q1ak0WZSRJAj7Xh+JoxPRpF2yoayjJxsPKPmbjsDATD6ZVVkxpzDjIWnSJS3Ulrs
 BgWhvBEDnEIWNjHErpYSJY8XRLrBwxP/4uU5H9EvfWXF9M+oCqUYj78Kg3WkfauH1tNz Hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu928magb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:35:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZN6F019990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:35:23 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:22 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 7/7] accel/qaic: Order pci_remove() operations in reverse of probe()
Date: Fri, 8 Dec 2023 09:34:57 -0700
Message-ID: <20231208163457.1295993-8-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hbszwyWOGpeOPX6ROzlTd1PAPf9w3Jwy
X-Proofpoint-GUID: hbszwyWOGpeOPX6ROzlTd1PAPf9w3Jwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080136

In probe() we create the drm_device, and then register the MHI controller.
In remove(), we should unregister the controller first, then remove the
drm_device.  Update the remove() operations to match.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 10a43d02844f..d1a632dbaec6 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -550,8 +550,8 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 		return;
 
 	qaic_dev_reset_clean_local_state(qdev);
-	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
+	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 }
 
 static void qaic_pci_shutdown(struct pci_dev *pdev)
-- 
2.34.1


