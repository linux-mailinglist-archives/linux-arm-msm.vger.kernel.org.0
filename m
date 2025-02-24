Return-Path: <linux-arm-msm+bounces-49164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E85FA41E01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 12:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DE93B31B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788F0260A4C;
	Mon, 24 Feb 2025 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EdPuFMOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C721853;
	Mon, 24 Feb 2025 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740397089; cv=none; b=UPuqzo7SHSKZVeI2yZtKQ3N95EhIynYD3puj6GwsnYOKegWig9M+S3LFWKWKM+Ja2p9fHktcCENY7GwKjp8gNa52VkxwbBA8KV7io251KqKKXJWBV3v+1yDeqdpRdJhaVkj/l7fhsBPM/sXlDs72us7TZ7MvcHZVbvIBtCnn9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740397089; c=relaxed/simple;
	bh=wuSxXss6RzVtlocbNY5JSCCyDZrY88CylnzIBph0nzk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=elNn5+HT4jatj8/f3rmPDfAk1/+AjDi1am38USWjFEJRvhAVScj0S7LEDgCx51jGwK0lNQr6bhsS6j663ViiycPKmzh4xo4E7JoZe598IHxdqxJRn/SgycPh5DVEI8hViAmyzrnNZ+9/vF382eaf36sQf4+VD4z3+/W0CVAdUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EdPuFMOq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9uAr4026596;
	Mon, 24 Feb 2025 11:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LHIb8FddLo7UDs1+HrmkOE
	/59uJ/xNxlwNySJoYSKwg=; b=EdPuFMOqq6yIna11ZwdzIA3416w/i0r+9NKq+s
	23BtQD+uM/3LWkwHrrXvgvxhMXQ+cO/Qe02dxq2uBuFqrJ5t3D3pyQwoX8f9wdFi
	oOLersXfX5j3qSKAaSESx4RDNbZnlMSe2MmcT4XR8WXfJAL9rsOMsigSF3P7y5LK
	sMmztVbNbeuuffm2Bsa2guybXtftHPbo65mRxWneo+RqnzDo/2OWgnnKKJPGLAUs
	a4X0dBFmR6Xonru97DUcuQxXumgRfgz3BJqYPo1kCics5SnPRLrKKRQ9OankLKyu
	r5Swe/ZCPZVmgBFFDbuu/5NQVF+uHwYCk7jbSLphAFKBgrKg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntvxkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 11:38:03 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OBc2IQ017464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 11:38:02 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 03:38:00 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/3] Add SPI nand support in IPQ9574
Date: Mon, 24 Feb 2025 17:07:39 +0530
Message-ID: <20250224113742.2829545-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GuQjiFWROyIpJSHVCTRB5Qv22Bk_BjvD
X-Proofpoint-GUID: GuQjiFWROyIpJSHVCTRB5Qv22Bk_BjvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=595 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240085

* This was a part of 'Add QPIC SPI NAND driver' - [1]. Have split it out
  into a separate series based on the community feedback [2].
* Additionally, address comments. Please see individual patches for
  details
* The 'dt' and 'dtsi' portions of 'arm64: dts: qcom: ipq9574: Add SPI
  nand support' are split and posted as separate patches in this series. 

1 - https://lore.kernel.org/linux-arm-msm/20241120091507.1404368-1-quic_mdalam@quicinc.com/
2 - https://lore.kernel.org/linux-arm-msm/4c1fe789-5190-465d-bb41-3fe1534d2523@oss.qualcomm.com/

Md Sadre Alam (3):
  arm64: dts: qcom: ipq9574: Add SPI nand support
  arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
  arm64: dts: qcom: ipq9574: Remove eMMC node

 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 12 ------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 28 ++++++++++++
 3 files changed, 71 insertions(+), 12 deletions(-)


base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
prerequisite-patch-id: 4acad06926841baacc627f32d457f3a6c9e9de1d
prerequisite-patch-id: bc3b78dc0486b0effcc2e595dd55c316700095b7
-- 
2.34.1


