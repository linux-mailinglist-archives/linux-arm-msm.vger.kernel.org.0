Return-Path: <linux-arm-msm+bounces-50349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73987A4FE28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518FF16ECC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D035242939;
	Wed,  5 Mar 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="as9OuqIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53724291C;
	Wed,  5 Mar 2025 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176272; cv=none; b=aLolEpjd1ZpbNSZaip6ESIA+niWJhJGcqFYsGIb4y0+XZGiZ8mwZma+Ca8llEFX8T+WKNpoCfFZdLONL2/SnJ9Izb/RWMPbaahav+eK8A74nQx+dMz+1e5hSnQauaHMumPBsikeKjIEFJcQOWSxwMxHnwOiMdKYDbxJEg8c+Q+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176272; c=relaxed/simple;
	bh=sMnUF4P+QvolmJ6Mu/3KsiP8NQWgHD1+6HkW5E1Q3eU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEUeKNXjkYMSn8hxv9tp0qob20XtHiUytxATFiGJAO69p4RTV9Poi1rRGC54B5j/pB8s5jzyjb41mAHW1AzIH8pkXztpQFwepjUhOQHMCV+JboqmgyFE2k5Ekh6fddpEI8Qi0ThOmvaX2kyBzcUcPpg8CBOT+RQFWMTBCMrLkTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=as9OuqIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525APJFD031267;
	Wed, 5 Mar 2025 12:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6X2FD+cgZIjMAfXzsNR5UvkK
	ZOy5HIgnUT7umMaDOtg=; b=as9OuqIgelT2O08hUvSAUc+NyE2sAYluD1eLmFB8
	MNJtHibbloqRMzYTeS4pOyMrcN7APYYsI9/PMverVTe7oYI5ZzJ3s5Q1w0x021/4
	PkfYOSmMBVgwLtfEkRDztxavXodUyFFdJWP53QRLFYjRQ1ikKqLvNTvCUrLaCIAO
	fDhbe0aLXEd5l6garzLIWtlAjd1HdZlijP9AzzpVLqNo5G8j5jOyBX66pBStayfP
	E9c/nZ0UPj6ButjctOoe/OwfVhw880JT+tw3jCw4VBvRYG7ZsJXFnTN193gCIoeb
	D6R3f5HC2eyOE5dYQDEVV1jkialC6EABjaBAVDMS+/Bcsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t589f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:04:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525C4PBf027973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:04:25 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 04:04:22 -0800
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 1/3] scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
Date: Wed, 5 Mar 2025 17:33:53 +0530
Message-ID: <20250305120355.16834-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250305120355.16834-1-quic_mapa@quicinc.com>
References: <20250305120355.16834-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: 6QUuo-LvhO8EhEJpbEagIcnoVgjcRa_D
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c83dca cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=MS9SOmDhS3Yx0VQUj3wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6QUuo-LvhO8EhEJpbEagIcnoVgjcRa_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=802 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050097

This patch adds functionality to dump both hardware and software
hibern8 enter counts. This enhancement will aid in monitoring and
debugging hibern8 state transitions by providing detailed count
information.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 +++++++++
 drivers/ufs/host/ufs-qcom.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b37449fbffc..f5181773c0e5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1573,6 +1573,15 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 
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
index d0e6ec9128e7..a41db017009f 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -75,6 +75,15 @@ enum {
 	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
 };
 
+/* Vendor-specific Hibern8 count registers for the QCOM UFS host controller. */
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


