Return-Path: <linux-arm-msm+bounces-29119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F4958728
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D94282088
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70F3190068;
	Tue, 20 Aug 2024 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQKwjiUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2629118FDC3;
	Tue, 20 Aug 2024 12:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157502; cv=none; b=obZmJekqbHiaK0BMv6N08Bxbb0od50r16JiESJRU9apVEJcUkII+9XUryrpWEgiTu6jLpnn3d+JtCIkgVqkgxSYwVfQa4XR4uVBLpFd7fozCOsqG+5TtICQ3I4Pt0aMER6jyOhpcqDEDpCBTieX98KZwhrFP+Kab9r7/jVx/J4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157502; c=relaxed/simple;
	bh=+Tk/AnT58xVJ5gfumpZqgnmU4jVnA7uNOd/5kvtUp3g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUHmbzr1ZuniEfPWtzctXcmyDMdS1DT17y90SkqVdjsylWiKuNPwb+eMci+kMRZOreI88E4SQgqkk/h+l9gCJH4Wwa3KKY2pSld/aOloXViGd4Zx3/mR+YrLZNX4EnupCrM/HM/kIkNSn9KMZFIn48nn4XBqHFasavuo6PVWUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQKwjiUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K72l8F022348;
	Tue, 20 Aug 2024 12:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6fevlzG37fYExVE6/DV+83zj
	DHL4BfyJuhSJoYlE2H0=; b=TQKwjiUAhLyZ8c3KZTXuwJcJRDCFlTd0AUnqYB5b
	9KUQbrJe7Llk9bDxsrrjhEoYq2vzO3yqfZCc7H7Fj7Yqavd6uNum/IEo7Sp12Jtk
	kQPrpJQ4v+VYbPL2AarsDQDlNhXd6p6RQDpFumq51o7izKTIvL9cTVBG5sK/KexO
	1CE0UsRiTwio8r4kkmWhJwCn8UZ6sVFtqEZ9aT/ruNlTjENX6vcTeW+YcCbJedTc
	w9rqr3aIhPISgObnndnsE3Jm6Y5yBT5QeJ+aQ1H6aDcoLV9V835FXvbcyV/jqtEP
	8F9LKikAkb2802TuAg+wfKqJQPP1d0tsYW+zn7gI8eIM2w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdm9039-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KCcEA1032204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:14 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 05:38:10 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>
Subject: [PATCH 1/3] scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
Date: Tue, 20 Aug 2024 18:07:54 +0530
Message-ID: <20240820123756.24590-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240820123756.24590-1-quic_mapa@quicinc.com>
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RSC8yvS0rkzSQM0PDCUZBl4UhTwQcLof
X-Proofpoint-ORIG-GUID: RSC8yvS0rkzSQM0PDCUZBl4UhTwQcLof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200093

Add fixup_dev_quirk vops in QCOM UFS platforms and provide an initial
vendor-specific device quirk table to add UFS device specific quirks
which are enabled only for specified UFS devices.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 810e637047d0..290558843ca5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -834,6 +834,16 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	return err;
 }
 
+static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
+	/* add UFS device specific quirks */
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
@@ -1798,6 +1808,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
+	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
 	.resume			= ufs_qcom_resume,
 	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
-- 
2.17.1


