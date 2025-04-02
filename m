Return-Path: <linux-arm-msm+bounces-53033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC4A78DB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 14:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76D73B4578
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A91B238D53;
	Wed,  2 Apr 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aMsbhJpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE0D23875A;
	Wed,  2 Apr 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595192; cv=none; b=rugi/VjybTTlCzjIdFOl0pSx1rskGcXfRPHLO2LYqWsIqJcq3X7GOehswwkl4/DsaJsiefijx5C2riFqmdeiHo0fPRyIe6hiZYmVmmqsCflWPZSn9z2RmBzrf0TYjcHuFnv4/wwwfRuEHIe2Gu1b1Eac3KwW5HagJI8TYuniLhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595192; c=relaxed/simple;
	bh=gEXi04EPNpkT5BEJ8ixQZuuJwmF6liNW2QDLEZ33VO4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=My+1eTsiCAp5SyLdF/s31d6FvgMyTXtf/kZt/vU1Ip1/cQZ5IMGL5a0xPnGNdNr7Cj9iCxNTkh3xaDUXZj6Xj92X18X6hBUj65U+53iBhlEgQM9ev0gKPIg++U9k+4JK90sIrhVlSsGHVZdHvSwD3XS8nUuA/0znEihtpYAM7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aMsbhJpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532BERRF007242;
	Wed, 2 Apr 2025 11:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wqPdJPHGiZ2qys1OLictC8wN
	wjqsmX1OBFCSSTZhGGU=; b=aMsbhJpmUxwveehVc3w6KFNH+L6uNsvMseEymQeQ
	tBJq3uOxeBeVGhJHReFAHSRwVIIojQCAKLvuB7ex6oHVM8N/ixv2BBXYN+Kpmu57
	OOK5fEWpATh0+v9uqbWX3rXGQxJ9vlYcOCbAi+1uoZO50fLLY8+V3Nr1ZVxNiBlU
	FifItvXEOEhccNY4D+wtzXtkSoDH/4XA7Ov+i/NbdK11nWjQ4R479+bgeTNthmnK
	3XDUlCtBP5ar20flHPJDUVt5izm+29vnBccsxAJOmLbSoR0HZ1hsiZp03pU1dlhR
	yANp1Q1QtUqVk/Sm1aSIbCeJXEs+UIHMbIXqEhDRI3k0ag==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7yk6kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:59:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532Bxk9T029346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 11:59:46 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 04:59:42 -0700
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
Subject: [PATCH V5 1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
Date: Wed, 2 Apr 2025 17:29:20 +0530
Message-ID: <20250402115922.27874-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250402115922.27874-1-quic_mapa@quicinc.com>
References: <20250402115922.27874-1-quic_mapa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ed26b3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NJo2GNobTQd3EOrCF8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FQCs8qVTI94tLmX0Oau2EW0WEV7QG883
X-Proofpoint-ORIG-GUID: FQCs8qVTI94tLmX0Oau2EW0WEV7QG883
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=943
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020075

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


