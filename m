Return-Path: <linux-arm-msm+bounces-47396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8E9A2E87D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C057A3FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F2E1C9B97;
	Mon, 10 Feb 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JEYx3rSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5AE1CCB4B;
	Mon, 10 Feb 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181771; cv=none; b=cZcK4KHexs90GMUjpSKTGv+EeLfUQ7T5kDGGG+NTo1DNTLPcS1lLr2/BQVJXoHg6Y8BqcncibO7UYUpad5JQZkfhjYX4xqMFcKg+zuRf6sKc6zYkNxtBTnrzrCpHWQxBE14/6KXWq3g0zL45yf9nuWpXd6e4ub2HGbtuKosO0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181771; c=relaxed/simple;
	bh=ZAnDVm4wCGS20UnWarMrGOhafRsDckpD0qxRseHc/DU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O285D3/ypAaJEc0i3BriEHRewhYHXcQ6OimN1Zc6E52Dv860K9uhfp+/B5P2ts6sdR0DD2+yypjHDHHm2aWru4l9R4iVvOG8vllZ2FFWhf9ZEdauD5zYbTf6X53NWgI9n11/tG3nv/L48k1fZq58aN70nKsUnxbm0V69XYy5JT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JEYx3rSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A768Q2010369;
	Mon, 10 Feb 2025 10:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vOq6+0pkdm6
	VjUyU5z5REtrlTM0xiSgNV8Zp2oK+VjE=; b=JEYx3rSNbLfp9Abx9ZkY2sb5Gqs
	1dK67ThsZFDdk1Z6V6oUOp8/DkclHIQMe5ThqqdA+ZpYezgL1N1GTIdq6gX08MT5
	mKilsUygfhsmiKmOY5HAPRR6AE4KOCklfmYXEppSKhu6TtkHoULBVLvWZLtfcq/A
	kvyt8YeqeNLFvQ8v8KzQTutI/nLDCDVW/XxMi3TwfJgQ1nBoSNTWBfAuoI5aRx+j
	Zng6EjhRU0Ipc4pkngFPzO7sBcR4gC/dGMz0kx2H0H8mjuu4noWQ2mdzovJkVwJX
	eSi4NHdBchmO8G3J62XsMpCoDsMAr+bEinSvFFgspOK07k5j5Dm/N6mVRxA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs58j2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2WfZ011667;
	Mon, 10 Feb 2025 10:02:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkj1gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:32 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2WM4011661;
	Mon, 10 Feb 2025 10:02:32 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51AA2WPR011660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:32 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 4F81140BFE; Mon, 10 Feb 2025 18:02:31 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
Date: Mon, 10 Feb 2025 18:02:07 +0800
Message-Id: <20250210100212.855127-5-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: qU4BuDNPTVEgmtZWv3XBgh0MFAQJbN9h
X-Proofpoint-GUID: qU4BuDNPTVEgmtZWv3XBgh0MFAQJbN9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100084

From: Can Guo <quic_cang@quicinc.com>

Implement the freq_to_gear_speed() vop to map the unipro core clock
frequency to the corresponding maximum supported gear speed.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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


