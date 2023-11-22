Return-Path: <linux-arm-msm+bounces-1435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA17F3EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B46DAB21AAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 07:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610B818632;
	Wed, 22 Nov 2023 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BSnA2uFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E0290;
	Tue, 21 Nov 2023 23:11:37 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM63WSg022671;
	Wed, 22 Nov 2023 07:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=ZhwV3737hVFopoyIktTqMRJOFfXUF17oXq/72ZAucXQ=;
 b=BSnA2uFAGCZQmjWiIBtJkobRMAuEEc1HPB5ajG4iQ0ygwvbqUuUwYfu5Bbdk9pkkRsUu
 AYjpEOmPqfj4qNFzPuwfjWFHb9l657yGHO6Uf3Dj8tJ+dqua7wrnMlC9rKb2H87RK2es
 sm3pOLTf4IwuWdh1t38gdCX63uOs530wVQF92Te4uyO8eeUkPBd24t7NlqGv7AthtTrc
 CxCkH1R4+cC4fu/7bmhIR4dx6v6MTxqH3pw4i/Wt4rbwev5szDCXGOEjRgOppfFVt54H
 tB4XKR09aR22WwsJV0bzBOal4xIbPTFuyz8Y1k1C1c0EfThl+hjpj5u2i7bzKvy5E5lZ DA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu54avph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 07:11:05 +0000
Received: from pps.filterd (NASANPPMTA01.qualcomm.com [127.0.0.1])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AM6rxPd011128;
	Wed, 22 Nov 2023 07:11:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA01.qualcomm.com (PPS) with ESMTP id 3ughrm95xc-1;
	Wed, 22 Nov 2023 07:11:04 +0000
Received: from NASANPPMTA01.qualcomm.com (NASANPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AM78owE002034;
	Wed, 22 Nov 2023 07:11:04 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA01.qualcomm.com (PPS) with ESMTP id 3AM7B3ed007472;
	Wed, 22 Nov 2023 07:11:04 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 6F11E20A6B; Tue, 21 Nov 2023 23:11:03 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        stanley.chu@mediatek.com, adrian.hunter@intel.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-scsi@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 05/11] scsi: ufs: ufs-qcom: Allow the first init start with the maximum supported gear
Date: Tue, 21 Nov 2023 23:10:36 -0800
Message-Id: <1700637042-11104-6-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
References: <1700637042-11104-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6KsogeN2tgZJkhBkhn94DnEQTTf-vQNc
X-Proofpoint-ORIG-GUID: 6KsogeN2tgZJkhBkhn94DnEQTTf-vQNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_04,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220050
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

During host driver init, the phy_gear is set to the minimum supported gear
(HS_G2). Then, during the first power mode change, the negotiated gear, say
HS-G4, is updated to the phy_gear variable so that in the second init the
updated phy_gear can be used to program the PHY.

But the current code only allows update the phy_gear to a higher value. If
one wants to start the first init with the maximum support gear, say HS-G4,
the phy_gear is not updated to HS-G3 if the device only supports HS-G3.

The original check added there is intend to make sure the phy_gear won't be
updated when gear is scaled down (during clock scaling). Update the check
so that one can start the first init with the maximum support gear without
breaking the original fix by checking the ufshcd_state, that is, allow
update to phy_gear only if power mode change is invoked from
ufshcd_probe_hba().

This change is a preparation patch for the next patches in the same series.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index d4edf58..9613ad9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -916,16 +916,19 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		}
 
 		/*
-		 * Update phy_gear only when the gears are scaled to a higher value. This is
-		 * because, the PHY gear settings are backwards compatible and we only need to
-		 * change the PHY gear settings while scaling to higher gears.
+		 * During UFS driver probe, always update the PHY gear to match the negotiated
+		 * gear, so that, if quirk UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH is enabled,
+		 * the second init can program the optimal PHY settings. This allows one to start
+		 * the first init with either the minimum or the maximum support gear.
 		 */
-		if (dev_req_params->gear_tx > host->phy_gear) {
+		if (hba->ufshcd_state == UFSHCD_STATE_RESET) {
 			u32 old_phy_gear = host->phy_gear;
 
 			host->phy_gear = dev_req_params->gear_tx;
-			dev_req_params->gear_tx = old_phy_gear;
-			dev_req_params->gear_rx = old_phy_gear;
+			if (dev_req_params->gear_tx > old_phy_gear) {
+				dev_req_params->gear_tx = old_phy_gear;
+				dev_req_params->gear_rx = old_phy_gear;
+			}
 		}
 
 		/* enable the device ref clock before changing to HS mode */
-- 
2.7.4


