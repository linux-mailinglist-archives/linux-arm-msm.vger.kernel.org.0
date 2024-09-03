Return-Path: <linux-arm-msm+bounces-30528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A295969ED4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 15:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 846F61C236EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BD11A42B0;
	Tue,  3 Sep 2024 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="akrUNPzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA931CA690;
	Tue,  3 Sep 2024 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369379; cv=none; b=CubX3OkdmRu5h6zFWc5SjWZMrDSjlDAQGxVofQTCKenAoLyqjiJV8wOL1Mi6cLIvYDGl1PeTFK20J25+1cV5wa26woiSFUUZmtJUh1L2DLsx1noZ/f3T746wSBRVLbTJFCMe9cXzzV54wSRgBXkdXGWNrSZwrG1FPJrndW5e3to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369379; c=relaxed/simple;
	bh=2wylCZzQZoERHmW0BE6K450tbtOCUXlx0/9468PKJoQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hiaFzWrRekohkQwbJx12qeqO0ve9EZwAu++yQ/uDKT+IvVC7s7b0VZ6vwqQYrpI53yCwF4fuv1zcxZFcYF/Uoo4wYD8DiVXBv+epw9x3KUXPYY6iNfF/Jba4kCdhv6O2+XlfOO+UbepDVR4pRHaNqG2zi2a2ObhW+IVgpH7SNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=akrUNPzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483B4LmI017369;
	Tue, 3 Sep 2024 13:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tsSkskuu1Vx19ME7wUH9iS
	oXZNd0hNpPHzLC5EVUjiM=; b=akrUNPzUKAByW4KnSsPqmH04BAllTqBIrp5tsb
	GrOv2mCOi15whqlAO6kCEC3UYJW0UfyQrU8CtPnjj4duqze/bieG18a+tgX4cusd
	QUAiHL4JydvHW4ZJn/C4V7XkPe+g1jOJ7PNiU1OZL0V8KQn68mt7ld27Os6VHBNg
	dchJYQckDlPqvda8+9e5CJvksQBP7FzuOKH3XzaIvYTg2plASjyw4L2IXi+wl4cp
	uVy0BYiRnJmSitH2tmtIBSEpY8wiP7xe8g0zRlwu8SDTTR4qMjV5baDPKJ+3GuGn
	03/6agMCpz/Vb39XNTynheYdPBA3C5BaUQz2y6haL5dFVSzw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brveyjw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 13:16:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483DGCGr028664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 13:16:12 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 06:16:09 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V3] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Date: Tue, 3 Sep 2024 18:45:46 +0530
Message-ID: <20240903131546.1141-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DlNM6Q1gEVOqq7jf0xqCzy8nPl_sU4Hg
X-Proofpoint-ORIG-GUID: DlNM6Q1gEVOqq7jf0xqCzy8nPl_sU4Hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=986 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030107

Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
vendor-specific device quirk table to add UFS device specific quirks
which are enabled only for specified UFS devices.

- Add DELAY_BEFORE_LPM quirk for Skhynix UFS devices to introduce a
  delay before VCC is powered off in QCOM platforms.
- Add DELAY_AFTER_LPM quirk for Toshiba UFS devices to introduce a
  delay after the VCC power rail is turned off in QCOM platforms.
- Move UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE quirk from
  ufs_qcom_apply_dev_quirks to ufs_qcom_dev_fixups.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---

Changes from v2:
- Addressed Mani's comments.
- Moved quirk for WDC to ufs_qcom_dev_fixups.

Changes from v2:
- Integrated Bart’s feedback and consolidated the patches into one.
---
 drivers/ufs/host/ufs-qcom.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c87fdc849c62..6a715373d81c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -828,12 +828,28 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME)
 		err = ufs_qcom_quirk_host_pa_saveconfigtime(hba);
 
-	if (hba->dev_info.wmanufacturerid == UFS_VENDOR_WDC)
-		hba->dev_quirks |= UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
-
 	return err;
 }
 
+/* UFS device-specific quirks */
+static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
+	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_WDC,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE },
+	{}
+};
+
+static void ufs_qcom_fixup_dev_quirks(struct ufs_hba *hba)
+{
+	ufshcd_fixup_dev_quirks(hba, ufs_qcom_dev_fixups);
+}
+
 static u32 ufs_qcom_get_ufs_hci_version(struct ufs_hba *hba)
 {
 	return ufshci_version(2, 0);
@@ -1801,6 +1817,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
+	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
-- 
2.17.1


