Return-Path: <linux-arm-msm+bounces-43491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB909FD354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 11:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C3AF1883943
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473851F1305;
	Fri, 27 Dec 2024 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VD8q0pAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA40C42A83;
	Fri, 27 Dec 2024 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297130; cv=none; b=pyrM5zxFZ8mv64Kp+Z0+OkGgz9PtumY2GSugOPQF7FqjprdV36EFxVVatrEffpqSR1qpy0a27T3SJrXqKV5Mnhz3oTkIq8YUIN/GIy5NI04Ce7pf6ZoPOSbxGOGOnmhWIqOvxcij+/QLjSFkAHZG/H/Iz8x/rhZptCfL1/7aysM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297130; c=relaxed/simple;
	bh=0WKxN11m5wKjf04sz/mUlG8NSsVaYJ8vW71JsvVsABI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C2pFOjix0w9XkmJTOFF42qvD0vtGsr+43Ha5ldpf0nxJpGjxSlU/+ER1QGtfNdqjYXvwSYlxLLVw51KBwiRWAOdaweWfvkdwCp14F9KlHLgD4PNnyFMULXsoGBRjLoTxvFSxRetAPfFtM/uNguJFR484lKtQc1wEaKoI5MF2nXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VD8q0pAv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR88XWs012440;
	Fri, 27 Dec 2024 10:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=cSW/VKDi+0SKFaGRRhAAKyh81bCqW5HvLw6Tvc7d7yw=; b=VD
	8q0pAvyaXiUKN7gPQZxC77amEvzQUvTz1Mcwb5W+mr/6PL0qHDfSCrWIf1lqBCFT
	MBCiulhUpD81f/vlPFNIvhONoZ3VJKKw/if6EktZXouMUIQURvFc8R5sE1G91bur
	0xoZ/c7L0IuKIBRl+GCQsh81Uj+HOM2AxY4KUsZPNsWOhCVYsjLC3CMpuMT5w9MK
	ZYRVqJn9chOWe/ireBpVtcEvRp3LUYx5VJel7srjGYuMskrWeC1CFiAdW/xWZHrZ
	bwbwAufMc/QI9yCwWas/mfLsbGVJCJQehyNco7uTnkGHuryMf8pOOMZQ2XsQIQcr
	HxRMEU5POXCl2ap8tUhw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43srffh07b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:58:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BRAwiHI019490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 10:58:44 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Dec 2024 02:58:41 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
To: <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Pratyush Brahma
	<quic_pbrahma@quicinc.com>
Subject: [PATCH v3 0/2] Add support for GPU SMMU on QCS8300
Date: Fri, 27 Dec 2024 16:28:16 +0530
Message-ID: <20241227105818.28516-1-quic_pbrahma@quicinc.com>
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
X-Proofpoint-ORIG-GUID: spcbC6DAy2TVhfpO79ByuKykRk8e5vtJ
X-Proofpoint-GUID: spcbC6DAy2TVhfpO79ByuKykRk8e5vtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=719 clxscore=1015 suspectscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270090

Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
for address translation in GPU device.

device tree dependency:
https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/

--
Changes since v2:
Corrected typo in cover letter to include QCS8300
Link to v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/

Changes since v1:
Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
Link to v1:
https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/

Pratyush Brahma (2):
  dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
  arm64: dts: qcom: qcs8300: Add device node for gfx_smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 37 +++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
-- 
2.17.1


