Return-Path: <linux-arm-msm+bounces-54015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A2A85CC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980661BA05A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AC3298CBF;
	Fri, 11 Apr 2025 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j5NsmEMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A87929AB14;
	Fri, 11 Apr 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373655; cv=none; b=O9mNJcEnRpIwiufSarb+uKuYS4VXRmmT+ATkPTEqAmw+LpAGa7mXTnoTzKlx4zEvdOCDL7iBOPHBqgqqw3lfuM8kBIWzrUYn/mvRiKt1a8I7FEOlJ/T2PFmmlYdi/hNfK3d4y8dGXAE/ltC+2uxNn1qsc57KmWU80pwRCxAMDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373655; c=relaxed/simple;
	bh=1Qojd4VrIH22QCV6yTzM5lRwwuuzjVfepwBQ5m07vD0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tu77Z3mZpkkxkEizzZA3HuCUkIPvNff3Icez8gyGbmo2vCxBO17YOk0DSmE84uvRsTjDdCAHdt9fT75GWn5rgSXxFAJj6fpmnR3YrfCyvaw3PKYDgNYD9516lAzPsP4x3GdJ9oO1zEZu/dbOPdbVsi2ZnlAn5GIbH4tvLgLP1GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j5NsmEMM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6TXKq030616;
	Fri, 11 Apr 2025 12:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=0fm06JT9bdlgENB+cHgfv+ZfN/fahku6OrdO25SPrtI=; b=j5
	NsmEMMmG8gDsyKexq9oWI/4boTHfiICrsABX1ct9w9IlwFGbUJ/V4GCe9pxZBSPl
	592wVbGHbWrnQCYk9VCuhpg3pbJ/letbbfL5Fd17b0NQV25bOfo0pevrooAGB0G/
	PALt2Hd/PyJsryCwLqHbNx76nWsF0+XToJqobUtgzJ7fMmMeO4Dho5v+GUqCUK7R
	NqQVH2VXbJTTPrgxmcWuSl/1EU0Q40a2YI80STQrzmpA0gpb2byvUvBWhiyFVBsH
	3nbBftr+Rl0Yvfne5Tg5BDSBoOjwMy1DmhWEp/CaCkEULn8eLaFANH7E8bK9juZE
	Ozw1etJ7/0pbK9LKs4tg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftt3up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCE7cu020147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:14:07 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:14:04 -0700
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
Subject: [PATCH V7 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus registers Dump
Date: Fri, 11 Apr 2025 17:43:42 +0530
Message-ID: <20250411121345.16859-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f90790 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pyQEGUW01KN_hzJh80EA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6e4zPkR2dzcHPl2BlT2YlZyUcHYon81B
X-Proofpoint-ORIG-GUID: 6e4zPkR2dzcHPl2BlT2YlZyUcHYon81B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=298
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Adding support to enhance the debugging capabilities of the Qualcomm UFS
Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
testbus registers dump.
---
Changes in v7:
- Addressed Bart's comment and used table-based approach to for ufs_qcom_dump_regs().
Changes in v6:
- Added ufs_qcom_dump_regs() API for MCQ dump due, as SoC vendors explicitly
  allocate MCQ resource.
Changes in v5:
- Addressed Mani's comment and used cond_resched() instead of usleep().
Changes in v4:
- Addressed Mani's comment and used kmalloc_array() for testbus mem allocation.
- Removed usleep_range from ufs_qcom_dump_testbus.
- Updated commit text.
Changes in v3:
- Addressed Bart's comment and Annotated the 'testbus' declaration with __free.
- Converted the switch-statements into an array lookup.
- Introduced struct testbus_info{} for handling testbus switch-statements to an array lookup.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---

Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support to dump MCQ registers
  scsi: ufs-qcom: Add support to dump testbus registers

 drivers/ufs/host/ufs-qcom.c | 124 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 ++++
 2 files changed, 135 insertions(+)

-- 
2.17.1


