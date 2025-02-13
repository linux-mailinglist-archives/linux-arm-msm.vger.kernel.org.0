Return-Path: <linux-arm-msm+bounces-47860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19120A33977
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3BBD1884D27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01D920C02D;
	Thu, 13 Feb 2025 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oiCKRFZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2545E20C01C;
	Thu, 13 Feb 2025 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739433665; cv=none; b=sZpsxXqj9Auu1y20OIJ5hMMa7g/N7dTBsrg4vLqaqu4rlkVVgX6a19TeSMxmD/AKU3lffY8HYKEwf/Nod5JW2ozSZbtTvqpsdSfqpBrkI3oyLR60MMv24uLP5Hr1jKzBT56Z/GXlrC9TgmiihwUWBxYmbuTh1pAdpGIYQbS7Wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739433665; c=relaxed/simple;
	bh=gCN57/jTSoUH0XhKL9qEKtat1DoRg0b3LMMICaCEZVY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmfqWH/gGUkTpqadPhjvmeGUHpMbXxHZsyzrWsNPAMQgL3eYwmA/w36l/Fg9UTY4IPjtPp6fD3Q2kUQNjaVriUFlWCryak4XdJE3claXjz/R6/MwFPvrEWo1L34Ra7Nxfm14Io4a1HMnfrpRO7j2ty5cL7+i5dWQyZghE7dP2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oiCKRFZe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7H7fN032643;
	Thu, 13 Feb 2025 08:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tXT2Tdl8tHC
	SBF6LyibT2+rC984KsTYwA8JJDOPwrsE=; b=oiCKRFZeJYStUc+jYY05x6gljCt
	jcy3AgNsCECCeIL7HeTmWO/YGYnSlYQKH8JO80Ze4UzIzi6WVdxbYxc4HdyVdBgw
	r7VWpiFYGiGP0hiy9nhQNhDQH4H8uH22eSHB6qbO33LfQDgwSY78NJwxsNO3tmFj
	dEtIOc/SUayCPU3DT74yucSwOLHXobgfm8U6FdKXJacQPUG7qZ34TkHdGkUVFzVt
	OhoyQW7lklGxjZAj9bqPUfVFIZOKDWvoMAxzynqmMqLlVXhO7g4z9o7PEiJ5n8wS
	zTed4RU6j2WqDpq420ZYzgc/TL9m6ye7J1+6EV6PBGdyNUmuBd2J1JNqJ4w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc7b83ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:46 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51D80hAq031688;
	Thu, 13 Feb 2025 08:00:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkyaj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:44 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51D80ift031693;
	Thu, 13 Feb 2025 08:00:44 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51D80hSf031692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 08:00:44 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 170EB40C04; Thu, 13 Feb 2025 16:00:43 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        peter.wang@mediatek.com, quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
Date: Thu, 13 Feb 2025 16:00:04 +0800
Message-Id: <20250213080008.2984807-5-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: TbvPLulQfvTTBIHtZ5qIMB8DxEK2OpsO
X-Proofpoint-GUID: TbvPLulQfvTTBIHtZ5qIMB8DxEK2OpsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130060

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

v3 -> v4:
Change the data type of 'gear' from 'int' to 'u32'.
---
 drivers/ufs/host/ufs-qcom.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a1eb3cab45e4..3353acaaa2ae 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1804,6 +1804,36 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	return ret;
 }
 
+static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
+{
+	u32 gear = 0;
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
+		break;
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


