Return-Path: <linux-arm-msm+bounces-70140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A18B2F69F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E1D3A5468
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6632330DD3E;
	Thu, 21 Aug 2025 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HOlQqZjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11792153E7;
	Thu, 21 Aug 2025 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775504; cv=none; b=aOgPvdKpKBx9lLXYCDeiM7p0uv+u3ULYWhEnm1iDxV70VC3QFQKz3TEGeMLP5yzTnpRfFsPfXriK9RmnH5K8fypjbscdiB6ATkXyk1FN+CRZ/TEDRRZ4nEIq9xoTJRY+Kxd6jY5uIBVUuj0RlgmfK+ntCA7JFy+TFglJ7YQfisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775504; c=relaxed/simple;
	bh=kPfmGuwFf1kMfm7JGSdPsxEDOubFA6Jez1gBV82/D1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jlgtHBBhPmavoYv/7qO/iKlITQFMPGBtgA0Pjs21nt7dq9NRqm4WFO0dYCAdwpV1/zua/K2Y3mzY0ahGNrqrRwt6uQASqtVPzY/rVlt/nqe7iFQpMOrEHSMwZZsF2evd3PhqtiOJuP9W6r1piMgult6KujwCaPfO0e7MIE+y6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HOlQqZjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bD9u027108;
	Thu, 21 Aug 2025 11:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ncz350tN3idw0xFydFdh0X
	Ae81YIbOJSLboHqQlJXvo=; b=HOlQqZjn7C1L0MGgvqXQGAB+N2TpIunLTpv2d8
	ULao867HZQndlQU2NV+D/HVOknpXDHhl7zNt0mLczNG2cn2uSqyE3HAcUW2+Lsxu
	PLsGWnpNbTLKUVQdgdSsAaCor1BvTrWq66opzbMejTFRHEGY7PeVoxExBjJNyZmK
	7fP1wzCQFmA9ef3eAQc68l0SMlU/WqOTKjvxodOBWM6PR58s/ZKIKA/WV79yMmf/
	htz5IiVEzkzJ+ey4ymknPU4y/8Ms0yrPw4eTJruXZtO8ddq6BWYTziv2CvEbh9rn
	psuY5djDaBQw+WCJWWtTOWi98SrTT0qeXTWoLVZJjLUqLk6g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w6a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:24:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBOttu016594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:24:55 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 04:24:51 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [PATCH V3 0/5] Enable UFS MCQ support for SM8650 and SM8750
Date: Thu, 21 Aug 2025 16:53:58 +0530
Message-ID: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a70208 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=LEFlebn9EtuLqDGMg7kA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: jziUfZQRfARq2k3c0Od9rGlRFFEXNpSb
X-Proofpoint-ORIG-GUID: jziUfZQRfARq2k3c0Od9rGlRFFEXNpSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5eGjSVhDVxQb
 0Ve1aJmby4yB3pmsB9FAuEY15cfnyIlEY5n4oF7FH+nyO2S40FRJcUFnjUYl98gAT3/wq6Bo4XE
 pfTQKllXAQXOvfnGS+bkj5zVw0Wr56YwCH5CkxMn13DjnVEfi+n94RqpS7+g0W1vUGXI0Y+I8vv
 NVE2zsAke8g9Pc1yyBPlORL8L7E14Rbd3b0kXJG8kC1rBS0HYWZT07GIdCoC7HSOo4N1xE2KNBl
 gyqg2GmZ/udquJWEhVCPBL78tD3IOs7DbZKOwIP7Qfgs6DlPWAhtuHiEl7mGbInD8q1FcmdiTGc
 CWNruOo6zbHMlXToQyTj8M+sXeJYR/sxfz0vIkLfcs+b6zemylF+jDeFXYhtFJUJPOMbSFINmVX
 8sX8DmOksbQrR2SjKigA7XnAgF5Zeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

This patch series enables Multi-Circular Queue (MCQ) support for the UFS
host controller on Qualcomm SM8650 and SM8750 platforms. MCQ improves
performance and scalability by allowing multiple hardware queues.

The series streamlines MCQ resource mapping by using a single MCQ region
mapping instead of multiple separate resource regions, making the driver
more maintainable and less prone to resource mapping errors.

Patch 1 streamlines UFS MCQ resource mapping with a single MCQ region
mapping, simplifying the current approach that involved multiple resource
mappings and dynamic resource allocation.

Patch 2 refactors MCQ register dump logic to align with the new resource
mapping approach, updating function signatures and using direct base
addresses.

Patch 3 removes the unused ufshcd_res_info structure and associated enum
definitions that are no longer needed after the resource mapping refactor.

Patches 4 and 5 update the device trees for SM8650 and SM8750 respectively
to enable MCQ by adding the necessary register mappings and MSI parent.

Tested on SM8650 and SM8750.

Changes from v2:
1. Removed dt-bindings patch as existing binding supports required
   reg-names format.
2. Added patch to refactor MCQ register dump logic for new resource
   mapping.
3. Added patch to remove unused ufshcd_res_info structure from UFS core.
4. Changed reg-names from "ufs_mem" to "std" in device tree patches.
5. Reordered patches with driver changes first, then device tree changes.
6. Updated SM8750 MCQ region size from 0x2000 to 0x15000

Nitin Rawat (3):
  ufs: ufs-qcom: Streamline UFS MCQ resource mapping
  ufs: ufs-qcom: Refactor MCQ register dump logic
  scsi: ufs: core: Remove unused ufshcd_res_info structure

Palash Kambar (1):
  arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller

Ram Kumar Dwivedi (1):
  arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller

 arch/arm64/boot/dts/qcom/sm8650.dtsi |   7 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   8 +-
 drivers/ufs/host/ufs-qcom.c          | 180 +++++++++++----------------
 drivers/ufs/host/ufs-qcom.h          |  22 +++-
 include/ufs/ufshcd.h                 |  25 ----
 5 files changed, 104 insertions(+), 138 deletions(-)

-- 
2.50.1


