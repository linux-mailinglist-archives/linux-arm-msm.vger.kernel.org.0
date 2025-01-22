Return-Path: <linux-arm-msm+bounces-45794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0AA18F21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD3D3AA964
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A4E210F53;
	Wed, 22 Jan 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FM4TZyxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EBA1B4F3E;
	Wed, 22 Jan 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540260; cv=none; b=Fsrcl/E6R0Dp/Ebb4mfirqJQWsSupZBzs+nIoMauWetwy7a6MwjPOafYCUtY8YHAoeSvAaA54ydp2urtJ1lDcl/zSEFJYypUWwhIdBR5TV1F9NlxlrBaohFd1R8TIWjG9Yq7v0zDZ2EVlkGiohqvbnnu2yDh58meUTMzfo12F+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540260; c=relaxed/simple;
	bh=o9ZaON3YuKhGyg00Fh4YiyMOBNJ2AA6IGqv8pJLDAgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DZ4zFtDvtqDxTq60/LZWzbqc5cZdcuzChTfUgVDeR9sAPYtS3ADaLVIej5Zl8GRlS7e6i7GD6hMMycypyjBvL/TwedNnWwz2jive6iCwFXfwHq3mrVgrve/i3UIRPVvOIO8H0JlCp9LkkN7FbHS6e3jQCIuEYY8ci7fAYm2myUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FM4TZyxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9Cifd011223;
	Wed, 22 Jan 2025 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rw0urZwIeYg
	oFlAqZPdnbxx9EaxWoEVj/vq8F7gb8Qs=; b=FM4TZyxhTnhaisYx357eA1xW/zi
	RPX4ouKU1dHuGtWfJE+mE8nFDAYuDbt0hpYFlAVQ1JQRSwyauhlAM4DbEOh83cPi
	yv2qqRs9XHTkvPg7Sp16SqZcCBW3DADRNl9BliIIfOwJVARe1YQ0hykQ/IDjEOXN
	d6RakoTMQoOrTZB8m9ii9LtnAxyWSPBJbHcDubOZrkrpHSap5aVZHfy0kywK38/N
	z5U4uJuvX4THf82VmCcUrsvnab2CwgNe1JdilYS4QtI/bkDLXYSmVlzQdALlpa2Z
	X094SWtHR1VDlflwPUtf+NYSOMi+YwoidrOcAsUgJAmtucw5gMXS291WCKQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44awuh048m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:07 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA35oW006917;
	Wed, 22 Jan 2025 10:03:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:05 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA34jC006911;
	Wed, 22 Jan 2025 10:03:04 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA34IM006908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:03:04 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id A2EC040CE9; Wed, 22 Jan 2025 18:03:03 +0800 (CST)
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
Subject: [PATCH v2 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
Date: Wed, 22 Jan 2025 18:02:10 +0800
Message-Id: <20250122100214.489749-5-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-GUID: 29pHkI73CbAWJslPpCoBzTZmclWKynRU
X-Proofpoint-ORIG-GUID: 29pHkI73CbAWJslPpCoBzTZmclWKynRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073

From: Can Guo <quic_cang@quicinc.com>

Implement the freq_to_gear_speed() vops to map the unipro core clock
frequency to the corresponding maximum supported gear speed.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Print out freq and gear info as debugging message.
---
 drivers/ufs/host/ufs-qcom.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a1eb3cab45e4..77cc1b8019a9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1804,6 +1804,40 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	return ret;
 }
 
+static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
+{
+	int ret = 0;
+
+	switch (freq) {
+	case 403000000:
+		*gear = UFS_HS_G5;
+		break;
+	case 300000000:
+		*gear = UFS_HS_G4;
+		break;
+	case 201500000:
+		*gear = UFS_HS_G3;
+		break;
+	case 150000000:
+	case 100000000:
+		*gear = UFS_HS_G2;
+		break;
+	case 75000000:
+	case 37500000:
+		*gear = UFS_HS_G1;
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
+		break;
+	}
+
+	if (!ret)
+		dev_dbg(hba->dev, "%s: Freq %lu to Gear %u\n", __func__, freq, *gear);
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1834,6 +1868,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.op_runtime_config	= ufs_qcom_op_runtime_config,
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
+	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
 };
 
 /**
-- 
2.34.1


