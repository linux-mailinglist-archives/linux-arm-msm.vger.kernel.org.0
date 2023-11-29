Return-Path: <linux-arm-msm+bounces-2370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB357FD0C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FC3F1C20C75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 08:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5278C12B72;
	Wed, 29 Nov 2023 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AsvC5fr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0273719B9;
	Wed, 29 Nov 2023 00:29:21 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4oxCQ019477;
	Wed, 29 Nov 2023 08:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=IOyf33US+gSCzelwMgTg6dIf2ThMvbvb70K94drusfs=;
 b=AsvC5fr62AVRUTkAqsoqLVV4m2yTjjuy3t4TNG0Rm52ebCXjfxx6dzWrzArcGA8rMzRx
 cF9CyiTZJO/0G8q3TiCXUo9BDfRZAC6j1ZJ5k2XAMiUC4rACdENM4jiDECffdTZOOmuC
 Lw2iM0566ciZpgt+Nt4sT+fARsYZzEkDRqyP/MLmYGIRO3Dv5QIQKwFyQfDGxhUxouxc
 fVF4q+epwRZBL1jN2BWkuNswoCNpRE/PNduEGrmZFARcV2Nshf/Ot7DedOYz7001vR2a
 k55BcRADQDjyqgK8aQqEiIkPQISWuNpQU0DrG3VoWe4z/3XsWI9fJS6lpbhpqQZVuR/S XA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unkent3e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:29:07 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AT8AdGQ032698;
	Wed, 29 Nov 2023 08:29:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3unmevpydm-1;
	Wed, 29 Nov 2023 08:29:07 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT8RJcZ024746;
	Wed, 29 Nov 2023 08:29:07 GMT
Received: from stor-dylan.qualcomm.com (stor-dylan.qualcomm.com [192.168.140.207])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3AT8T6Ac027817;
	Wed, 29 Nov 2023 08:29:06 +0000
Received: by stor-dylan.qualcomm.com (Postfix, from userid 359480)
	id 8EC7320A5D; Wed, 29 Nov 2023 00:29:06 -0800 (PST)
From: Can Guo <quic_cang@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        adrian.hunter@intel.com, cmd4@qualcomm.com, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 09/10] scsi: ufs: ufs-qcom: Check return value of phy_set_mode_ext()
Date: Wed, 29 Nov 2023 00:28:34 -0800
Message-Id: <1701246516-11626-10-git-send-email-quic_cang@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
References: <1701246516-11626-1-git-send-email-quic_cang@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zncicgKQdt9qvqwxTCiyHAJ8v8bSW5mj
X-Proofpoint-ORIG-GUID: zncicgKQdt9qvqwxTCiyHAJ8v8bSW5mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290062
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In ufs_qcom_power_up_sequence(), check return value of phy_set_mode_ext()
and stop proceeding if phy_set_mode_ext() fails.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 30f4ca6..9c0ebbc 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -475,7 +475,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		return ret;
 	}
 
-	phy_set_mode_ext(phy, mode, host->phy_gear);
+	ret = phy_set_mode_ext(phy, mode, host->phy_gear);
+	if (ret) {
+		dev_err(hba->dev, "%s: phy set mode failed, ret = %d\n",
+			__func__, ret);
+		goto out_disable_phy;
+	}
 
 	/* power on phy - start serdes and phy's power and clocks */
 	ret = phy_power_on(phy);
-- 
2.7.4


