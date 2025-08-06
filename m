Return-Path: <linux-arm-msm+bounces-67851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EBB1C079
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 08:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97E0E188872D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9456314885D;
	Wed,  6 Aug 2025 06:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y4m/aDlS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DCD273FE;
	Wed,  6 Aug 2025 06:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754462085; cv=none; b=KVR6971L2FcZehJfsdON6mXwV3jOD54SA1aqG60vL4k4qRK3UywTtVf9d+XRVjz5M7owHiBidL0RQRkhNoXcmEe13tv3YgKChh+I5tnoiS26OnQIQHfnMUxRpOvZHknIKzQLOIpYLlw2P4V76Sf/HCiO8dxrGsbIUCymYJusHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754462085; c=relaxed/simple;
	bh=qUdYCIIdKr7SEvpooMFVGs4pXzUkgFe/nb9ErgZWh+o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gaHnbBQAXXUJPkwtuTTkAFRvzu7qfntA5Mzpwd4oCA2oLtVvjl1BLEkM8tCkMOT36qtAWakoG2xf7RXYt/FhGf6O5aoSIlBFNRQumW2qxK+zX1JcgokW8RXdjc2ARubHX+sNyWyfKtudC8+S78d7e0gM75KV84RiDEeaMyvrR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y4m/aDlS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765j2k9028558;
	Wed, 6 Aug 2025 06:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAPrrDQdkT6XUkpWNAW0D1
	gBeoZRHRhvK9v8/gEvPEw=; b=Y4m/aDlSWM+GZFieih61xc4/uR8TUm3gIJG2tj
	21PP/auuLCwbG0af1kr7cH7AJRQalq1NqjrYlT90ixiSVeJagSbWitzYclJulJ+Z
	o/w6pnLnQKjw6whnIJY4MMB18tcNPgH749Sk4vme5AXMMG6EHUUAwKoNz2aq0ip6
	0PzVbNSwahnw5RQTTIlKg0wB17xEP0IrLFScpvSmFlPRX25Zw3qLSP2X+iFLilPC
	nBXUjdkvm84W6T/k+i3ku1M0FDeBDmFZ43Pf3bAKzXp6bX2JZQbIYyrnvCq8AQT6
	CSTI+/NxftW+u+uu7K0rR7ahzTjeiz+V0JzDt5JrJ8XV9tvQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxsrm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 06:34:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5766YbGh023669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 06:34:37 GMT
Received: from hu-pkambar-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 Aug 2025 23:34:34 -0700
From: Palash Kambar <quic_pkambar@quicinc.com>
To: <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        Palash Kambar
	<quic_pkambar@quicinc.com>
Subject: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared ICE for  UFS controller v5
Date: Wed, 6 Aug 2025 12:04:09 +0530
Message-ID: <20250806063409.21206-1-quic_pkambar@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXz+QM59+XXiBP
 9xgppuGyr93vWHtP54JhBhXID7awFJi/EUjrO1GQ4EozX4lR2PRcTXDWsmnzn1hEUPwKee6ggwD
 mpZvHhScji6K01wn0U3j/+JovLkD51gynQ+VdC6Dx51DYPo96f2rP0mAu1k+W7lN1Vm67JT0z1W
 wNk/LX5iUkXkC7jeGC/Ts0lGQkpBPJwaVu6SqJT4p6R2OypFuVt4wkq0a8UuXBSlwL+UxdGuI5Q
 GQk2+cAK/HOvU7NyAEgtEaaPQAsvbSHVRmwYopCiz4P178JHFyUy5ZV/C+WW52Mhv2LYdXbkfFo
 KxlD7CGytqlIEaxyZFNKrEqYf+xMToVzM/sGiRK56I02acPsbZsW1LmA0Tm2lPJJe53NNEFh/rs
 YbNBak3q
X-Proofpoint-ORIG-GUID: sMjgbZXqMsGQlQzn9qrpjY67KwZaWKi_
X-Proofpoint-GUID: sMjgbZXqMsGQlQzn9qrpjY67KwZaWKi_
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=6892f77e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=-znHbD6HCO9yz4AjyS4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

Disable of AES core in Shared ICE is not supported during power
collapse for UFS Host Controller V5.0.

Hence follow below steps to reset the ICE upon exiting power collapse
and align with Hw programming guide.

a. Write 0x18 to UFS_MEM_ICE_CFG
b. Write 0x0 to UFS_MEM_ICE_CFG

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 444a09265ded..2744614bbc32 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufs_qcom_is_link_off(hba) && host->device_reset)
 		ufs_qcom_device_reset_ctrl(hba, true);
 
+	host->vdd_hba_pc = true;
+
 	return ufs_qcom_ice_suspend(host);
 }
 
@@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return ufs_qcom_ice_resume(host);
 }
 
+static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
+				    enum uic_cmd_dme uic_cmd,
+				    enum ufs_notify_change_status status)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	/* Apply shared ICE WA */
+	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
+	    status == POST_CHANGE &&
+	    host->hw_ver.major == 0x5 &&
+	    host->hw_ver.minor == 0x0 &&
+	    host->hw_ver.step == 0x0 &&
+	    host->vdd_hba_pc) {
+		host->vdd_hba_pc = false;
+		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
+		ufshcd_readl(hba, UFS_MEM_ICE);
+	}
+}
+
 static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
 {
 	if (host->dev_ref_clk_ctrl_mmio &&
@@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
 	.link_startup_notify    = ufs_qcom_link_startup_notify,
 	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
+	.hibern8_notify		= ufs_qcom_hibern8_notify,
 	.apply_dev_quirks	= ufs_qcom_apply_dev_quirks,
 	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
 	.suspend		= ufs_qcom_suspend,
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 6840b7526cf5..8a8bd44a8e22 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -60,6 +60,7 @@ enum {
 	UFS_AH8_CFG				= 0xFC,
 
 	UFS_RD_REG_MCQ				= 0xD00,
+	UFS_MEM_ICE				= 0x2600,
 
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
@@ -290,6 +291,7 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+	bool vdd_hba_pc;
 	unsigned long active_cmds;
 };
 
-- 
2.34.1


