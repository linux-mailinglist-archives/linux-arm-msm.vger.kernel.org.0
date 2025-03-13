Return-Path: <linux-arm-msm+bounces-51218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC21A5EAFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56AC33B9B20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 05:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391421F91C5;
	Thu, 13 Mar 2025 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WnLnQrEZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6DD23B0;
	Thu, 13 Mar 2025 05:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741843026; cv=none; b=T0RKSyVaa45N49ljBc5dVT4WfremUuscSIjFUknVy/HApSigS95+tv2tR4Pxvq5vVgG4OnUfGBPZy6mutbMpqVOp/zj2dbNAxIKm3KYT2D/Yyxjr6eOOVUuTTcIePztaYDzWbWuMzwhbyWFi1m3bpMh6UI3EuwAAUa41uWH+8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741843026; c=relaxed/simple;
	bh=wi0gBfT4PqEVtbqiQt3f/5StB/5R1LI5G4N5HAcMwS4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tE7eVDiQYn1YIVONqUxmOBDGr+MQnjFY5z5w6eIBjdnVKyMPKE0SnmRlzVZF17p5YQ+u+uklBIH2KnlwgXJ7zRkiuXjv/MUEnf4EVPu0ygwRJjYc/kKYFS3LT/t0+pQWnzkRn6siKjN3seAdUIRsHk7F0dSVKcIh9FXJnGdVHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WnLnQrEZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMNX1f030286;
	Thu, 13 Mar 2025 05:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=JQJMrURLBpfG8ul6ZMG9OwV6jKdP9WkwqRfJT1PxFP8=; b=Wn
	LnQrEZfPGUcyt+PxpvJhQMRX7FKwKwcUIWEd4vRNd1j595junDiVeujhs80ncRnf
	9CAHBJawwTu2BeHwD9R4L5+lY4LzTbOYgIaVQiJ1K/4gru3FvOsWYkR2nH7bzysS
	naLZvhhB5Npni0eKzJYyywjPP0ek7t8k4FHxW1e7ZmiovjF3vZ0Ghg21lLvITT0/
	1wYZgN7ROyUNzDgO61zWStrW8f32HLwEmsK/JNnv/TbsizHBG/DfMkN9CYPnI+7b
	AbzJfdA4wpXqpzHk/QM6UZA1XEhfRn7RJZqcKwpMpP22BrB6n0G49Habaf5JAyRR
	5Xh26p4L/ofKP1ZvF7ig==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qmmvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D5H0Dm016238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 05:17:00 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Mar 2025 22:16:57 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V3 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and Testbus Registers
Date: Thu, 13 Mar 2025 10:46:32 +0530
Message-ID: <20250313051635.22073-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: t-4qn32rB7VEzu31EtNWWl6cPx3LhMne
X-Proofpoint-GUID: t-4qn32rB7VEzu31EtNWWl6cPx3LhMne
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d26a4d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=69YKWZIfOJqdoCy3qJEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=404 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130038

Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
aid in diagnosing and resolving issues related to hardware and software operations.

---
Changes in v3:
- Addressed Bart's comments.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---
Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support for dumping MCQ registers
  scsi: ufs-qcom: Add support for testbus registers

 drivers/ufs/host/ufs-qcom.c | 129 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 +++
 2 files changed, 140 insertions(+)

-- 
2.17.1


