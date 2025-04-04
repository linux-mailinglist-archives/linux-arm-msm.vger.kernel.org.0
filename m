Return-Path: <linux-arm-msm+bounces-53255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E409A7C2D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 19:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF603BAE05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 17:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B3321B9C1;
	Fri,  4 Apr 2025 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5T7dJt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BDE22155D;
	Fri,  4 Apr 2025 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788811; cv=none; b=QXXcuKFqkhEAawl2HFkkHdyGVk3cUHP0JswJxD91pLeyK0SO1N1xXmO9itNL9YGMEy6dMqegi8koLZ57V4Sj5BTl06I7K/fnINmT4i4AuVSzTAvD5HhGEBx9Y0MUTZX+TZsqvAT2goHkAjVt5SeTsrwawO37AsN8YgHLN+q1Wm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788811; c=relaxed/simple;
	bh=QYDEzDBtrWi2feklS2uF0gUBH19bEMM1+rsd4MrUQxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AzImTnUs/WbESO9ukAYmjNfe7xC4o+ZPCe35qDmxBiqoYvNKavHfS/X8ZzwSVDMf8LWGBxe1AgdAHXDfgOIHGCB/BQ/qJxQ3exdVaCAK9MjbSKt+ORrRCmVNFVRJ/WGV7LPz2+iSvDAHP43QvUYmUqX5FQ6LzIIlwFBGxlqWePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5T7dJt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534Es507021505;
	Fri, 4 Apr 2025 17:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KO6u1yUjnNIwAaKQNunUyW3rJFQ08B0KZ+1JsBFWzhc=; b=S5T7dJt/Xm7wUAOc
	XqtuPbjf4fwjvRM4MY1XxyLiUDtVqPp7uzJ3jOsS43kVEXKuAWBfecdFwRopdMcl
	eaH4DJ5QKSUCcz3D6LoHOZKVy3VbKGM/hBjMnyfM9L5ivegk3ILaBDYKYpOsm2X1
	Z/XVV6O1OMdpCxnsTld2IglsgJlFi80yU/qj7Cn28Ge7pWYv4hGBTn4kJhzIz/IV
	NmDw6LUtGu0ifouMI8ikXB922gBlxeddQKnE2NGDAMhImD7vxujmfylALcZ7GWZq
	ui351IUQrODzzRMP5U8r2GfIvC+AuxkO8Xzu+ORoSPb2n3miPiiNn/yrluu2QVHh
	5R//zw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d42j72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 17:46:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 534HkSs0007716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 17:46:28 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Apr 2025 10:46:24 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 2/2] scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices
Date: Fri, 4 Apr 2025 23:15:39 +0530
Message-ID: <20250404174539.28707-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250404174539.28707-1-quic_mapa@quicinc.com>
References: <20250404174539.28707-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2SVCOrIdHG8KyIeRN-u9reIUIaWkuJp1
X-Authority-Analysis: v=2.4 cv=HrJ2G1TS c=1 sm=1 tr=0 ts=67f01af5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=m2_RP3qr77pTVs8TglMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2SVCOrIdHG8KyIeRN-u9reIUIaWkuJp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040123

Some UFS devices need additional time in hibern8 mode before exiting,
beyond the negotiated handshaking phase between the host and device.
Introduce a quirk to increase the PA_HIBERN8TIME parameter by 100 µs
to ensure proper hibernation process.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/core/ufshcd.c | 31 +++++++++++++++++++++++++++++++
 include/ufs/ufs_quirks.h  |  6 ++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 464f13da259a..2b8203fe7b8c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -278,6 +278,7 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
 		   UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE |
+		   UFS_DEVICE_QUIRK_PA_HIBER8TIME |
 		   UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS },
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = UFS_ANY_MODEL,
@@ -8384,6 +8385,33 @@ static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
 	return ret;
 }
 
+/**
+ * ufshcd_quirk_override_pa_h8time - Ensures proper adjustment of PA_HIBERN8TIME.
+ * @hba: per-adapter instance
+ *
+ * Some UFS devices require specific adjustments to the PA_HIBERN8TIME parameter
+ * to ensure proper hibernation timing. This function retrieves the current
+ * PA_HIBERN8TIME value and increments it by 100us.
+ */
+static void ufshcd_quirk_override_pa_h8time(struct ufs_hba *hba)
+{
+	u32 pa_h8time = 0;
+	int ret;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
+			&pa_h8time);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
+		return;
+	}
+
+	/* Increment by 1 to increase hibernation time by 100 µs */
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
+			pa_h8time + 1);
+	if (ret)
+		dev_err(hba->dev, "Failed updating PA_HIBERN8TIME: %d\n", ret);
+}
+
 static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
 {
 	ufshcd_vops_apply_dev_quirks(hba);
@@ -8394,6 +8422,9 @@ static void ufshcd_tune_unipro_params(struct ufs_hba *hba)
 
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE)
 		ufshcd_quirk_tune_host_pa_tactivate(hba);
+
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_HIBER8TIME)
+		ufshcd_quirk_override_pa_h8time(hba);
 }
 
 static void ufshcd_clear_dbg_ufs_stats(struct ufs_hba *hba)
diff --git a/include/ufs/ufs_quirks.h b/include/ufs/ufs_quirks.h
index 41ff44dfa1db..f52de5ed1b3b 100644
--- a/include/ufs/ufs_quirks.h
+++ b/include/ufs/ufs_quirks.h
@@ -107,4 +107,10 @@ struct ufs_dev_quirk {
  */
 #define UFS_DEVICE_QUIRK_DELAY_AFTER_LPM        (1 << 11)
 
+/*
+ * Some ufs devices may need more time to be in hibern8 before exiting.
+ * Enable this quirk to give it an additional 100us.
+ */
+#define UFS_DEVICE_QUIRK_PA_HIBER8TIME          (1 << 12)
+
 #endif /* UFS_QUIRKS_H_ */
-- 
2.17.1


