Return-Path: <linux-arm-msm+bounces-46709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5434A25408
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83E1C18819CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C172080CC;
	Mon,  3 Feb 2025 08:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ep2EpJCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241C207E16;
	Mon,  3 Feb 2025 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570377; cv=none; b=n+EcAPFKqa+W+iwbfUaanqWtYmCFaLPcoIewiJVRbzbBwPpO542Ha7qPBHdmrZyZw6QLjdVp835BsER5j7i5xB2fmQnzcFjqyle3pwocBSusDB/unNHV2WZZDa0M9ccHueJtsEbaBEqfoBl0M7gUorLlC5VfyUHpaR6fTqpWgLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570377; c=relaxed/simple;
	bh=oVhQCIO+3PWmLbP7r2A8P/03dvkczsQd3Dbi5fVQxaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TOymlThpeLcyW6nwUxxLRrZEyV4m6wF0ulmdG1KMJCCBQ32lHgRqWk2PPlwF6CXdWssRi5P4CjBx8bchQOuthNYrVGDVx38mf88CKIzpZ6AKX/WSCuZk7hVkng9R7HUDlhgdtRV+JNfALInr0hBUzm6x6bDjoDohz4mJ9nk/BxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ep2EpJCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5132b7wK017423;
	Mon, 3 Feb 2025 08:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RVGlbzbKUdI
	W8WNIeRYxCamaAmSOH8/nLE+mX0u43uU=; b=ep2EpJCx3frYJYCzlcjnop6/Itf
	Ujo93lWhPQBsvuE3lWqPXyMlptCAgfTopdFE7+iD7VWtawLmdK6n8hT/EUeR/27Y
	oUUmr67vC4KnguoXmamx9v/9u4Ab7yAOztjItUpsz6a+xpIqa3dBpnx8xUcCYx/t
	WZD2HRb16dJ6Q322RQ8rsesmT4ZNKDMOlZ8y8UXJMwRkNK2jXA1naD/TOtI5c/LP
	hOnkbuXHvBnOpkSepMlfOS4fOAtg8FZ/AxFiBS/12EwEigdu4MP7/R7XnFAlpM+J
	i0cLVnkd3XGxgzAi8PFUstLKZjevs79aaMyPR23eMaxZArPVihRsKu2MD6Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jn5vgjjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BejK026413;
	Mon, 3 Feb 2025 08:11:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:40 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BWDi026222;
	Mon, 3 Feb 2025 08:11:40 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138Bdae026406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:40 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0CE4240BFE; Mon,  3 Feb 2025 16:11:39 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
Date: Mon,  3 Feb 2025 16:11:05 +0800
Message-Id: <20250203081109.1614395-5-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: IwgNzOcEM5q5F9SXLc-GHU6_iG4zSwml
X-Proofpoint-GUID: IwgNzOcEM5q5F9SXLc-GHU6_iG4zSwml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065

From: Can Guo <quic_cang@quicinc.com>

Implement the freq_to_gear_speed() vop to map the unipro core clock
frequency to the corresponding maximum supported gear speed.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Print out freq and gear info as debugging message.

v2 -> v3:
1. Change "vops" to "vop" in commit message.
2. Removed variable 'ret' in function ufs_qcom_freq_to_gear_speed().
3. Removed parameters '*gear' and use gear value as return value for
   funtion ufs_qcom_freq_to_gear_speed().
---
 drivers/ufs/host/ufs-qcom.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a1eb3cab45e4..47c3077705d9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1804,6 +1804,36 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	return ret;
 }
 
+static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
+{
+	int gear = 0;
+
+	switch (freq) {
+	case 403000000:
+		gear = UFS_HS_G5;
+		break;
+	case 300000000:
+		gear = UFS_HS_G4;
+		break;
+	case 201500000:
+		gear = UFS_HS_G3;
+		break;
+	case 150000000:
+	case 100000000:
+		gear = UFS_HS_G2;
+		break;
+	case 75000000:
+	case 37500000:
+		gear = UFS_HS_G1;
+		break;
+	default:
+		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
+		return -EINVAL;
+	}
+
+	return gear;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1834,6 +1864,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.op_runtime_config	= ufs_qcom_op_runtime_config,
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
+	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 };
 
 /**
-- 
2.34.1


