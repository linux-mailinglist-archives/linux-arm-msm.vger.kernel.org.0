Return-Path: <linux-arm-msm+bounces-14-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426497E34A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 05:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E94280F1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 04:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84342291F;
	Tue,  7 Nov 2023 04:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFP8WkIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26521FD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 04:47:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FB0135;
	Mon,  6 Nov 2023 20:47:03 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A72NHF1022765;
	Tue, 7 Nov 2023 04:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=4oCdX+o+C4WN1iHUVi8rtCosO3nRaCMx/0gq4hRLvCQ=;
 b=VFP8WkIjlnIipDHXS3XVkaVSdJ12NVldGSC6y7NVU2uOvaTrQi17EId6CDB3pu2Pjnis
 AJ4rXnO6iHHQwRz1iFrXG6F3PVS36X/QmpmcOl8OHj0/YuYi9GCrwCmlWhECcmXYJ0pm
 iK5YVivnh3bqvTYl8adj+A3RQlP/MulielL9hvprfa+tz+IwbvWb/BLK4LKc+smW/6nC
 Y0LTd9mtaGGewEi/hZHJHl7hF67cKToLm8OjhmoHJGmgqFjfG04hEwLGR7Xg0FQ5Ep10
 Ey+SBZZBhV0aZuFMk76xraRA7uLEZzyx4NNhKvscbZZE/o8v48zJpyzUms+zSHTJFS78 tw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u6xduabhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 04:46:50 +0000
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3A74kPdL024917;
	Tue, 7 Nov 2023 04:46:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3u78ha354x-1;
	Tue, 07 Nov 2023 04:46:49 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3A74gOJf018919;
	Tue, 7 Nov 2023 04:46:49 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3A74knbI025345;
	Tue, 07 Nov 2023 04:46:49 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 3902120A78; Mon,  6 Nov 2023 20:46:49 -0800 (PST)
From: Can Guo <cang@qti.qualcomm.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/7] scsi: ufs: ufs-qcom: Set initial PHY gear to max HS gear for HW ver 5 and newer
Date: Mon,  6 Nov 2023 20:46:11 -0800
Message-Id: <1699332374-9324-6-git-send-email-cang@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: trSbQ4TI09d3NRK9YNYXZEIhnRTw8tsi
X-Proofpoint-ORIG-GUID: trSbQ4TI09d3NRK9YNYXZEIhnRTw8tsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070038
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

From: Can Guo <quic_cang@quicinc.com>

Set the initial PHY gear to max HS gear for hosts with HW ver 5 and newer.

This patch is not changing any functionalities or logic but only a
preparation patch for the next patch in this series.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 55ee31d..94d34b5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1069,6 +1069,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 
 	/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
 	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
+	host->phy_gear = host_params->hs_tx_gear;
+
+	/*
+	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
+	 * Switching to max gear will be performed during reinit if supported.
+	 */
+	if (host->hw_ver.major < 0x5)
+		host->phy_gear = UFS_HS_G2;
 }
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
@@ -1313,12 +1321,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		dev_warn(dev, "%s: failed to configure the testbus %d\n",
 				__func__, err);
 
-	/*
-	 * Power up the PHY using the minimum supported gear (UFS_HS_G2).
-	 * Switching to max gear will be performed during reinit if supported.
-	 */
-	host->phy_gear = UFS_HS_G2;
-
 	return 0;
 
 out_variant_clear:
-- 
2.7.4


