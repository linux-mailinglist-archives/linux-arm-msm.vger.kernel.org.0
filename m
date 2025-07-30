Return-Path: <linux-arm-msm+bounces-67064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC81AB15A6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2BB4E180A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D92A2512DE;
	Wed, 30 Jul 2025 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDTMmcJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1828B1B0F0A;
	Wed, 30 Jul 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863785; cv=none; b=BR8PlmUAUCPfwueylILON1DKtORzRJ2sUgPMR+cc56Ke4JTOJRAEyGDoQCLo3FiWCttO27Ie4BbXfpnFQXossEz/Vs2yb20aTdweeXqIEPh0m5EEhV2ozfHilWfUzi+VyvIt1bQAU1WienCwG+SfjDalUShGPlRQg2Wdtvs74JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863785; c=relaxed/simple;
	bh=8gyL7MYu/JzPDd8rjFBT7qS6pFlxZSqptARxEYz0i84=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TLrDUEaNNmDZ3OvFKGlKJ2/uNjjFwAmCvRtCaeN6L5bzCpyG57E7eDa1rFIy0vLcBjkkade6SAjyhXJTmIcjYzAP0kpGA7Yb9uh96Bmdlq6WXFVKCji6Ty2MMnQNeNJcC0P/SIc+6WFJKf0lsQ173Meq0gcle7Gh9FaRgyeD92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDTMmcJm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U766DX028204;
	Wed, 30 Jul 2025 08:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CNds7FahsWob/e53U7acBB
	xmgatYTUwfWW4rKcpYeXk=; b=hDTMmcJmfEddV/IJNoJBCz033Hq9Icpi1ddgcF
	lcKg0gW3nfzUqnoLuu8nf02+2Sw2zvUOHZ7AYpf40QEocsP5IacJNtsb+tZ7GE+Z
	Qx/knLmOF8XHvRCZsk0cX4CJuH+CwXLcYkY10xCVzcU6fYKRW1o0VfQfDfPMOki/
	z4Y8sNcgFuZoNMqkn5ET+3BzFfK5oOfwbPX4Gux8/uph/XUL2XV/6Wn0IZ3QleoL
	FehO4QxP/lAexPih2VKrlVivYoSDSKDpD1YsIIBs6u0wYH0q4vfrqwPoTpk3TS4p
	uRCtNdoJPap9jCNnLJ5tYmiDMmT5HQ28N+HY0lF7k1yjY/UA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda2va8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:22:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U8MqjU002868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:22:52 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 01:22:47 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 0/3] Enable UFS MCQ support for SM8650 and SM8750
Date: Wed, 30 Jul 2025 13:52:26 +0530
Message-ID: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hJu9X8pP4MCjQ8iT6rDEZnHjNURrhgUF
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=6889d65d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=dnzSO1FTSQS5A_PjxWcA:9
X-Proofpoint-GUID: hJu9X8pP4MCjQ8iT6rDEZnHjNURrhgUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NSBTYWx0ZWRfX+lzWKLEfJOrz
 wU/v7d3Xk5vl5hSYpfroF5aUP3yrWkBHZqLbx8T3KZXWlpGyaYXF03UnNE0Hk5RVNg6vHS1RjLr
 fPDes1kbfmrb/hMrMuvyfN+rCYjFdHy45xdCK1po1LvtJ1hnMa+EsFYsNADIVwbG8/PU7t6KgEp
 vAJOlPRABZNCu/+OBNMFiZqpkOoZRAByS/WHS4gxieDr/dEGlnzsSPoy8zcxysiyphS1MCovXFZ
 xq3InYr52qxBuxMLGhXFSb5XaPm22bi/tPDWR88UVuZypf/jzDtK6nRcbkLASK9laCV2vYrq7VD
 pUeh3pyytsTTfZgJCwY7ovanFdlNxgKu5X10USEK3YeE90uab9grzxOBChhx61dUtC3054YOcsr
 hxTKXWUds8/UV9wWSKJSUnATo7u/xVuCZijzBhu8y2KVa7u7F2d9Rf0RY2fTJphmF/sWQIzP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=864 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300055

This patch series enables Multi-Circular Queue (MCQ) support for the UFS
host controller on Qualcomm SM8650 and SM8750 platforms. MCQ is a modern
queuing model that improves performance and scalability by allowing
multiple hardware queues.

Although MCQ support has been present in the UFS driver for several years,
this is the first time it is being enabled via Device Tree for these
platforms.

Patch 1 updates the device tree bindings to allow the additional register
regions and reg-names required for MCQ operation.

Patches 2 and 3 update the device trees for SM8650 and SM8750 respectively
to enable MCQ by adding the necessary register mappings and MSI parent.

Tested on internal hardware for both platforms.

Palash Kambar (1):
  arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller

Ram Kumar Dwivedi (2):
  dt-bindings: ufs: qcom: Add MCQ support to reg and reg-names
  arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller

 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 21 ++++++++++++-------
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  9 +++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 10 +++++++--
 3 files changed, 29 insertions(+), 11 deletions(-)

-- 
2.50.1


