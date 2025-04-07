Return-Path: <linux-arm-msm+bounces-53379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E418BA7E11E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 16:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2E2D1885CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD961D90B6;
	Mon,  7 Apr 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Va6QM7fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D61DDC34;
	Mon,  7 Apr 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035695; cv=none; b=teFjKhsD/QuyBPADIA41mK8KOmqH3X8TfxuCSTRe4edW9xU7Act64SFrBpaXkhOoH1Tye7F0B+e8zXxzRdfwUZE8g7Zqia7H7k/eWosXpSkhzMefYUqDBno/dSdSpvjbUtXfAxSY6rD04S98GI7/7oZpWTH5b4x6Eu+f3GcfBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035695; c=relaxed/simple;
	bh=gEXi04EPNpkT5BEJ8ixQZuuJwmF6liNW2QDLEZ33VO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CTnjvCGaoWKEPksWM3oysxkTq4NXbe3rp2Re8P5aZ1MM/oLLbMqNVgH8r9Hu92ePfye9wsm5SZxBAuBpR3H0YQIVzdds/K+0mTz0Xr3i/GpYDo5dL4CaULpf9HrykD48nZrs5w/AkJyGr07uk1P4bmgKmW6wj/Z8fg8Sd4WKgAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Va6QM7fG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dlPR010400;
	Mon, 7 Apr 2025 14:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wqPdJPHGiZ2qys1OLictC8wN
	wjqsmX1OBFCSSTZhGGU=; b=Va6QM7fGWLJn4eEA+zigPNtMvxmJlAw2dF20KO+t
	S7K8SRgrAU+mF3wUa3kRFvP0yLGPix0k4DEllS8fJb9WKMA1klJ8r81PCT/X65zJ
	IPAdg1Q36OdUNC/KuH451rsflEdcVKKpIh1guqcX0hnPqmVy5OusE/yk5QgsBbv6
	bOLZzEsP912H/GppBsn6471klyCOy4OcxIikV+iOjh4aTrS5hPiYt2Wc33nqKHEo
	i9EiCfrvIUGZDlfHrjaMoa6SN/Z/uXM2MsyPO8fUGc3GNkYtgzi81ttOArvsWAhd
	Yi8RbaI6/FhhTjtMpCS9vJ57S8+ylPt2IWvVBPa64es8EQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2mgqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 14:21:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537ELRle026279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 14:21:27 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 07:21:23 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V6 1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
Date: Mon, 7 Apr 2025 19:51:08 +0530
Message-ID: <20250407142110.16925-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250407142110.16925-1-quic_mapa@quicinc.com>
References: <20250407142110.16925-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fNqGfBugh2oCxduP7dWkE3hHCm2xeAid
X-Proofpoint-GUID: fNqGfBugh2oCxduP7dWkE3hHCm2xeAid
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f3df68 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NJo2GNobTQd3EOrCF8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=940 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070101

Add support to dump HW and SW hibern8 enter and exit counts to
enhance the debugging of hibern8 state transitions.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 +++++++++
 drivers/ufs/host/ufs-qcom.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6efa047..028833acb3db 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1549,6 +1549,15 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
 	host = ufshcd_get_variant(hba);
 
+	dev_err(hba->dev, "HW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_ENTER_CNT));
+	dev_err(hba->dev, "HW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_HW_H8_EXIT_CNT));
+
+	dev_err(hba->dev, "SW_H8_ENTER_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_ENTER_CNT));
+	dev_err(hba->dev, "SW_H8_EXIT_CNT=%d\n", ufshcd_readl(hba, REG_UFS_SW_H8_EXIT_CNT));
+
+	dev_err(hba->dev, "SW_AFTER_HW_H8_ENTER_CNT=%d\n",
+			ufshcd_readl(hba, REG_UFS_SW_AFTER_HW_H8_ENTER_CNT));
+
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 919f53682beb..a5bf1282ddbe 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -72,6 +72,15 @@ enum {
 	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
 };
 
+/* QCOM UFS HC vendor specific Hibern8 count registers */
+enum {
+	REG_UFS_HW_H8_ENTER_CNT			= 0x2700,
+	REG_UFS_SW_H8_ENTER_CNT			= 0x2704,
+	REG_UFS_SW_AFTER_HW_H8_ENTER_CNT	= 0x2708,
+	REG_UFS_HW_H8_EXIT_CNT			= 0x270C,
+	REG_UFS_SW_H8_EXIT_CNT			= 0x2710,
+};
+
 enum {
 	UFS_MEM_CQIS_VS		= 0x8,
 };
-- 
2.17.1


