Return-Path: <linux-arm-msm+bounces-1645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CD7F5A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 09:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0231C20B13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DAA1173B;
	Thu, 23 Nov 2023 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fat7bHaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162B71BF;
	Thu, 23 Nov 2023 00:42:03 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN4Qi9P026630;
	Thu, 23 Nov 2023 08:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=zN12TslWlABlp9K+YRCFNUDSGb7EOJnrGrpMh/GCmsY=;
 b=fat7bHaOZMMG91e+v5yLQvVYSkXg+qByzUltkUa2GZUQmPZCduawzAjiRTDvN2mKYt+O
 c2DIs2Y1JQOmRbV/5wQCH8K4Kjm48Vyracxl1zx6X7QoSI+WnDo1kiIrYrEVUhhVKr8J
 STvXlBfcZ8i7iE64ElJKggdW+WDCNhVDyFQ9/7fsJ2uit169bo1Zm8Owc1c6pwox6DH6
 6VB4wr9LL7jdfQbL0xOxXGORaupLJJPeNc9bJ2mbdcvd0QjvacXTLrlrVbOflFcEqsrR
 RlCNOVJUJ1tLTbYrneHsr57g+ENqOOiXWm3CcgDQH3fyUzDcX3W4ISbql6ghkTTMBzi7 AQ== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhf6ktt56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 08:36:34 +0000
Received: from pps.filterd (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AN82gH6026378;
	Thu, 23 Nov 2023 08:36:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3uhcusvqnb-1;
	Thu, 23 Nov 2023 08:36:33 +0000
Received: from NASANPPMTA05.qualcomm.com (NASANPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AN8UVqm000883;
	Thu, 23 Nov 2023 08:36:32 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA05.qualcomm.com (PPS) with ESMTP id 3AN8aW7Q008193;
	Thu, 23 Nov 2023 08:36:32 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 93AFE20A68; Thu, 23 Nov 2023 00:36:32 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
        junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 04/10] scsi: ufs: ufs-qcom: Limit negotiated gear to selected PHY gear
Date: Thu, 23 Nov 2023 00:36:10 -0800
Message-Id: <1700728577-14729-5-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700728577-14729-1-git-send-email-quic_cang@quicinc.com>
References: <1700728577-14729-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s-nIfaNkyhM6Vv8dE2LwZhgYrw8yU_kI
X-Proofpoint-ORIG-GUID: s-nIfaNkyhM6Vv8dE2LwZhgYrw8yU_kI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311230060
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In the dual init scenario, the initial PHY gear is set to HS-G2, and the
first Power Mode Change (PMC) is meant to find the best matching PHY gear
for the 2nd init. However, for the first PMC, if the negotiated gear (say
HS-G4) is higher than the initial PHY gear, we cannot go ahead let PMC to
the negotiated gear happen, because the programmed UFS PHY settings may not
support the negotiated gear. Fix it by overwriting the negotiated gear with
the PHY gear.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cc0eb37..d4edf58 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -920,8 +920,13 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		 * because, the PHY gear settings are backwards compatible and we only need to
 		 * change the PHY gear settings while scaling to higher gears.
 		 */
-		if (dev_req_params->gear_tx > host->phy_gear)
+		if (dev_req_params->gear_tx > host->phy_gear) {
+			u32 old_phy_gear = host->phy_gear;
+
 			host->phy_gear = dev_req_params->gear_tx;
+			dev_req_params->gear_tx = old_phy_gear;
+			dev_req_params->gear_rx = old_phy_gear;
+		}
 
 		/* enable the device ref clock before changing to HS mode */
 		if (!ufshcd_is_hs_mode(&hba->pwr_info) &&
-- 
2.7.4


