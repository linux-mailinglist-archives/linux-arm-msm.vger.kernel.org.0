Return-Path: <linux-arm-msm+bounces-54641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB74A91CC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6A7519E675C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1243424886A;
	Thu, 17 Apr 2025 12:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+MTvQ+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B44245017;
	Thu, 17 Apr 2025 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894041; cv=none; b=qinaQuehdcM4aNbWMco/kVf8UC+ABjwQvqCyJDJekrRsOF6TXFbfykROFLuR3fU6mvmcaYwptPDES5wcCU6SKdbmk3Zl1icPBsYvDkQkU+Jhc5r8p1UEJYqmkjvzKQmYSsNDiepSFJQxArJZCV6RvFwKKko2U0Z42BmclqciJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894041; c=relaxed/simple;
	bh=LiuE/7Hvqxov9Zq2+v/0W2sw6XtF+cZL6hiw0yCmTVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5MqFYzJdSc1+TjqbHcGi50jNjSlrgXZQBD/9nLpa+mWWQ3B+hgcm55GPsXm6mbRBOgDi6bRf+W6tXd9oA2cPqxV9kPc/H6NmNdXOtM4YNj3aGiJ+R1PS3zhrB+ISSIUHjHY1CBim+dI+MIf0SA4RmGgOm3OXixs5s+OGUuZ/k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+MTvQ+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCHvA7025144;
	Thu, 17 Apr 2025 12:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MhYB+fQY5/H
	wxFMNmLwlVkIaxwQ//b1WEkAR46glzpg=; b=U+MTvQ+swe05UvI1FOT5ziXxG/K
	d2ZukcPHhQJTvI4WAQ2SaZ2DUJ9wygPbO66/wLVawewy8hX3tq3uzgTJbKNkTP0n
	QGAQ/GSxm29P+SGkcLrOSiRYM7tX+Z/1Xk0T9sPeb0neoR0VHVSsU4fS8Tomh3ld
	8TrWv5ulg0zZxnFT5TSpvZGQrs1dzVtmI6geKLsuBbnafS+PzuqMYZwAjino9P69
	6UKV5PW3sZXB4Ecl3CD44zqd2UUbszGlumpaMz0+VFoK038VkrPSYtkBYM9/uQMK
	oLEIcOVJWHCOtIqHtmtq4MdWMifylqg0ea7YI3Frw3KBrUzY5/7qBddCsCQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6q18n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 12:46:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCknrb017631;
	Thu, 17 Apr 2025 12:46:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 462f5drtts-1;
	Thu, 17 Apr 2025 12:46:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53HCkorw017649;
	Thu, 17 Apr 2025 12:46:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 53HCkoi1017648;
	Thu, 17 Apr 2025 12:46:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id AF97C501598; Thu, 17 Apr 2025 18:16:49 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        krzk+dt@kernel.org, robh@kernel.org, mani@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, beanhuo@micron.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM Feature
Date: Thu, 17 Apr 2025 18:16:45 +0530
Message-ID: <20250417124645.24456-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i_G93qBxi1AmiFQD0O3d6ZfPKPuSg1vY
X-Proofpoint-GUID: i_G93qBxi1AmiFQD0O3d6ZfPKPuSg1vY
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=6800f83e cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TfDKAR2Pkyhr9upUyPUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170095

There are emulation FPGA platforms or other platforms where UFS low
power mode is either unsupported or power efficiency is not a critical
requirement.

Disable all low power mode UFS feature based on the "disable-lpm" device
tree property parsed in platform driver.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b37449fbffc..1024edf36b68 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)

 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
-	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
-	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
-	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
-	hba->caps |= UFSHCD_CAP_WB_EN;
-	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
-	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
-
+	if (!hba->disable_lpm) {
+		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
+		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
+		hba->caps |= UFSHCD_CAP_WB_EN;
+		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
+		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
+	}
 	ufs_qcom_set_host_caps(hba);
 }

--
2.48.1


