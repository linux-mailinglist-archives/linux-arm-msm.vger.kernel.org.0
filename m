Return-Path: <linux-arm-msm+bounces-50348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0570A4FE24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 13:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD08188CFDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 12:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A751B23370F;
	Wed,  5 Mar 2025 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jGBTeKRN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089051FDA73;
	Wed,  5 Mar 2025 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176269; cv=none; b=KRP891mcmpOBh55M04B4SYzRlPL8ifYWXmlGFUXNnJf92jPC0wMN8pnKi3tGIaKwXw7+ZuwPnEH4I08+YXMU9Nxfs/yXvaXAUhI6uIDQnL8qLnfgO4KW0y2iLabXiwKEZH2ABcW0F8C+tShSdwhvd9F6k20KqndGzmX5xQf3E4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176269; c=relaxed/simple;
	bh=YxX1kLlAmnj7QheTf/wp+gxdusqvo7Nm6UCoPrEByyU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a7AcWGhINdWpY/O9ci/ydnhu/WVS+chVsGW5TgIj1g7mqnK4679fyPGFB7Mzp7/ToUUY1F1DvJdCJk68+u77C9qBUKfKc8S2OypR6GvKDDrbNV57DRw/5XsFLNjNt4BsT3ZhA6ZHEAG7pSCQt8EE4CVH3J27TbHLxYgS4FmU1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jGBTeKRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525ArRte007314;
	Wed, 5 Mar 2025 12:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=gkrIteuJTa6ah3nIKIENGLYDdUbhvP+CsBeWo2NAZ7Q=; b=jG
	BTeKRNA6fPL20tRYubx4sRP7K1yjY7BD6BAgLfQrO9+qAns4HDNcKu6JZcTpG/EV
	LYMeg/49J1jpjP49udP+XCA5huZdBFJz3yO8PlTxNHf/qpDaxEx0H/eyUNiksgxD
	q3OshAv7ItOPnDY7SjQL7aNE45OrMJhGA1hMakFA99/azVDgUvHpof+TzwgaVVwb
	flX0r4gpO5iSmQFz2xpYkUBSZMkZ7QbhHbyxuTGxccDG1qPlrCJtNUpcSfh9OtDg
	sD6ClRKs/56vpxtEqnAuoICS+78V4usyCkCDrDXZ2ty4RzxK8zXczZ0fDtJxVbfS
	C+6tIl+pFpEmFyGe7YBw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6un6er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 12:04:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525C4MCP032639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 12:04:22 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 04:04:19 -0800
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and Testbus Registers
Date: Wed, 5 Mar 2025 17:33:52 +0530
Message-ID: <20250305120355.16834-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: Xda4qdj4D0qMw5xIheHw1wIi2SD8m0R1
X-Authority-Analysis: v=2.4 cv=H40hw/Yi c=1 sm=1 tr=0 ts=67c83dc7 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=69YKWZIfOJqdoCy3qJEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Xda4qdj4D0qMw5xIheHw1wIi2SD8m0R1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=349
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050097

Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
aid in diagnosing and resolving issues related to hardware and software operations.

---
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---
Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support for dumping MCQ registers
  scsi: ufs-qcom: Add support for testbus registers

 drivers/ufs/host/ufs-qcom.c | 141 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 +++
 2 files changed, 152 insertions(+)

-- 
2.17.1


