Return-Path: <linux-arm-msm+bounces-1636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8C7F5A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 09:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57EC92817DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 08:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36A618C3F;
	Thu, 23 Nov 2023 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mlN8icQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578A2D41;
	Thu, 23 Nov 2023 00:36:45 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AN5VaqD014987;
	Thu, 23 Nov 2023 08:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=mP3Zh3ghe1QobYCFwkdhcpkOdhL0iT2Q9aPGVoVes/U=;
 b=mlN8icQW1SBwkV11Nv/PpT3023DZumixwDZwnctBAtcEZXKbIesFQ3efR1eTS7T5OzcW
 F5UxLwPli9dET/LIdJWk7FIrELPgE3/r9VuGc39RwRGpVq6XVssXgWu4mTFJa80rjS/f
 Jw2xS1w1mIg6GEUwTJzcsTYNwW7cfyNk3VBwIs5SxNa3lUsSrpS7H3tg8dk4Cojn2kX2
 ZYbptRRxFw/VICAPhJnplpgt8uhatl4oIGxv5sUk65/kNLTIdMVcSMu0ULBTgaAseobw
 zC8iHGaDpK3zhI/GAXcNpUsQa/2+St4bcQ9na1bDRm+IA4EmhgAPRp2y0tKghP4NFMjI Bw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhkfnt4ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 08:36:32 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AN8L3v5005972;
	Thu, 23 Nov 2023 08:36:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3uj1yvrv66-1;
	Thu, 23 Nov 2023 08:36:31 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AN8Z82A024683;
	Thu, 23 Nov 2023 08:36:31 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3AN8aUoV025933;
	Thu, 23 Nov 2023 08:36:30 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id B9F1220A68; Thu, 23 Nov 2023 00:36:30 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, beanhuo@micron.com, avri.altman@wdc.com,
        junwoo80.lee@samsung.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/10] scsi: ufs: ufs-qcom: No need to set hs_rate after ufshcd_init_host_param()
Date: Thu, 23 Nov 2023 00:36:08 -0800
Message-Id: <1700728577-14729-3-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700728577-14729-1-git-send-email-quic_cang@quicinc.com>
References: <1700728577-14729-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zMRIhwht2_57gNLlgbHZ9SVAuWn2ukGa
X-Proofpoint-ORIG-GUID: zMRIhwht2_57gNLlgbHZ9SVAuWn2ukGa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_06,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230060
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In ufs_qcom_pwr_change_notify(), host_params.hs_rate has been set to
PA_HS_MODE_B by ufshcd_init_host_param(), hence remove the duplicated line
of work. Meanwhile, removed the macro UFS_QCOM_LIMIT_HS_RATE as it is only
used here.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 1 -
 drivers/ufs/host/ufs-qcom.h | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index aee66a3..cc30ad9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -909,7 +909,6 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 	switch (status) {
 	case PRE_CHANGE:
 		ufshcd_init_host_param(&host_params);
-		host_params.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
 
 		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
 		host_params.hs_tx_gear = host_params.hs_rx_gear = ufs_qcom_get_hs_gear(hba);
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 9950a00..82cd143 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -27,8 +27,6 @@
 #define SLOW 1
 #define FAST 2
 
-#define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B
-
 /* QCOM UFS host controller vendor specific registers */
 enum {
 	REG_UFS_SYS1CLK_1US                 = 0xC0,
-- 
2.7.4


