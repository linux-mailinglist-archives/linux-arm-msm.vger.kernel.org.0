Return-Path: <linux-arm-msm+bounces-29775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AEF9628E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5142B226CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673011862B3;
	Wed, 28 Aug 2024 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F/tFvnh1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAC156227;
	Wed, 28 Aug 2024 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852453; cv=none; b=p0V4YfuUvpJba+57G+D9KJYYjFyqx1/TyS7JQhyP7SN3dC1bq975zsagV9aadocoO8Ij/EeL4SG16fnLXistKhwaH9TZw6jrvLwlr0tOj9P7zYp0vnI2Y6SRdc41OK1lmQATFcKT5kcbIh5RVyj1lYvSAdZB7O77z6AxJTJnYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852453; c=relaxed/simple;
	bh=9ia+hb2SvOmyL2sZbASgauPi6jBNO9sEdYsizUcHXEk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3za3XGsbUNgL3oirLr1M6r73MKBgTMBFCTUEzraHIPkJuQBFbP/T1tl0lBxPMlBaq/AOkuC2zINZs6k6D6wPAI0EXDhRzFcjZLqG6r78GC4CbaiqccXSjbg2uV8+lo29lM1MwzZTvNblaFMc4s2sN/rtlv42FXsmadqOc3DS28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F/tFvnh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SAiQMr007454;
	Wed, 28 Aug 2024 13:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=/qD+CYxiwFKUSbRWOC9hCkJusOqv77aPFIoz8OaEOXw=; b=F/
	tFvnh1esHibCL3DiXH1OpIGdSYasiAh8yP9c1j4xM37GIzO4vUO307RMNzqsox/M
	PZ5bc61h6SLH5FKjNrSDzbRTcQopiqhpk5hr7ACjAgU+Au0fulcXabI9UHiOHMre
	um8U8nPEnnuzsp7ZtNjx3kefNU4PhJ7/q96lP/9V+NOXQ1ZUb7redh19xo8mynjN
	zx0A2YBK6lRp8wTYQgi8jYQIXvMlVCmbCwadGt7UkF9R71YcX6qu9m/mskcpxtEW
	6OAVitGaKm+YGNHhY8KQeBEbLAW9BuSYUdZkos4MoiWBfpftK7xsJX5aVbtEOr+9
	q8Dzc6byDcc1d80XCw7A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puv9wvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:40:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SDelpI011701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:40:47 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 06:40:43 -0700
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
Subject: [PATCH V2] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Date: Wed, 28 Aug 2024 19:10:32 +0530
Message-ID: <20240828134032.10663-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 30d14pmI4ZAXQHLU8_whrVRs3RQVGcht
X-Proofpoint-GUID: 30d14pmI4ZAXQHLU8_whrVRs3RQVGcht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=946 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280097

Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
vendor-specific device quirk table to add UFS device specific quirks
which are enabled only for specified UFS devices.

Micron and Skhynix UFS device needs DELAY_BEFORE_LPM quirk to have a
delay before VCC is powered off.

Toshiba UFS devices require delay after VCC power rail is turned-off
in QCOM platforms. Hence add Toshiba vendor ID and DELAY_AFTER_LPM
quirk for Toshiba UFS devices in QCOM platforms.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..9dbfbe643e5e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -834,6 +834,25 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	return err;
 }
 
+/* UFS device-specific quirks */
+static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
+	{ .wmanufacturerid = UFS_VENDOR_MICRON,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
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
@@ -1798,6 +1817,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
+	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
-- 
2.17.1


