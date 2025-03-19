Return-Path: <linux-arm-msm+bounces-51895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5BA68512
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 07:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2225419C1F41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 06:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7694820D51D;
	Wed, 19 Mar 2025 06:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dHd3CcIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B4AD2C;
	Wed, 19 Mar 2025 06:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365863; cv=none; b=aQZ7o4Ivk5qrMd9vJXBa5mxydqZViGdX24aIaym+Kl5tVG0pZraAjdQCxyVHlIFpHsSiDN1A6VvFMTsLgxBiMPttJ4RNCaduaDM0Jc/4R7nA8WzMUq8VIGJE4dLkaYF74m43ayOGFo/g0oAXYgy3kyZXZuHzBL3+H3jwZ9PgzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365863; c=relaxed/simple;
	bh=o8FtnhkjSiKf9tj33nJ+uAh8qDllFoTD5Nmy8AoE/Xk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iv3nJdyMKbx4wv+BxN+09HkYFmIQvuZEP1W+tGLaKVhh1P8+kKFq5XQDg1t21N2YZkdmgncgd5NNMZhgh/VgSLSMxh0m7gplJaAxlbautnl05stIKiFFINOX7AhVG4fDyv5kGkxo+5ftTrOJasFdyQsCfb9C/QTr0uHjPCSOBII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dHd3CcIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lkxV026883;
	Wed, 19 Mar 2025 06:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=6WCacrtl+jr/9hwHUvnAzS6zMUUODCa3GIG0+hJHiwA=; b=dH
	d3CcITaCmotTt+Z0ae3nhjh7A87nHe8csdjwxMwTd8Q31BpZooUpvdLNMEIXwv17
	c2XfG2YLxoABqwUk1DSzpXmfJY9NTi2m74IVfiz5R0wf2Q2Gu48Io7asp7ue0txt
	AgEdYVRPwAdIHoNGa5NRjHEJF5C/VJGERoBBKnLyjjW3NQxjDueOAJslvBraA7kJ
	rE6evxDFxjtQCUCKRyDRL3woBWE2K4I5tyzmbBgzFO1OrM/gY4wNAYKl4qLxQtIJ
	au7TTrz+iE0nFnzqVVKPOBOD7SpD8rrRoVQdx5fLSmyarCVJBYcRWBy2kuNALEni
	4jsVlyqge1NHf0DUxObA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f91t2ett-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:30:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J6UuFt022522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 06:30:57 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 23:30:53 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V4 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus registers Dump
Date: Wed, 19 Mar 2025 12:00:40 +0530
Message-ID: <20250319063043.15236-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: C21fEU6qxQwgFdGediAR2MByOgrHLByP
X-Authority-Analysis: v=2.4 cv=Xrz6OUF9 c=1 sm=1 tr=0 ts=67da64a1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pyQEGUW01KN_hzJh80EA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C21fEU6qxQwgFdGediAR2MByOgrHLByP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=353 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190043

Adding support to enhance the debugging capabilities of the Qualcomm UFS
Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
testbus registers dump.
---
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
  scsi: ufs-qcom: Add support to dump MCQ registers

 drivers/ufs/host/ufs-qcom.c | 119 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 ++++
 2 files changed, 130 insertions(+)

-- 
2.17.1


