Return-Path: <linux-arm-msm+bounces-37421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A59C32DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 15:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3AA21F2129E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 14:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA6F29422;
	Sun, 10 Nov 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWWXv4LO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3D38FA6;
	Sun, 10 Nov 2024 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731250430; cv=none; b=g1WZYh31rWhXti/A53KwRvJOOE8x4LK0fCulouwpjDN346P1uHACxp/PWcXNvfRVdBAAWgoOjRTR+KGCeSUUu+E3E89xpm7y+mg05NPdLnOtVCkJ5EMFDG0aZVX84IDFWiwymU+wRdpoH1y/Y2jQuPLzbjCW2KtUDw5CkyvIw/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731250430; c=relaxed/simple;
	bh=zXXL8XVOJGtbLtlHPbbrscaKQpSAYJGhNwBcF722BSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PctsWjPSyBum/HSCwQn2uSqq9mthYSWKcxMzL/MuGQVseE6Wo2izFSBxVNNLuk8w2GGoEx9V2eyQQnI07UhQo6K6FevZj3D5su8aMkt8+/LKn+ooF90t3sddlLBNxW6tWC7dXMcKRmEtrWm5UNQvuw7qRziz9VEMFwaZw/8jya0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kWWXv4LO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAB0IB7017950;
	Sun, 10 Nov 2024 14:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eE7bsU9ESG+Cpm+/7T6tUKiYCpbk5f8YzIk
	XxWNXxb8=; b=kWWXv4LOChYGX423oSVXbrUv+yO1vg6JQNeKSBq2sn5QI2hqrex
	CD/a/w1UKbrJyx60T907DSRf08b00hqbbYK3bDd1tvTsHKXxmjtI4zPHSGheqYzU
	qrWEEErZ0DsoMcp37kY65FJJLRb/xEPEG1TQ7uTrzECd5EpYeu1TLwZMdA9QCTWd
	APSMGsMOhvLGuEDiwrrGamLb241+a5E46d9oT4AUAP86Xk4ywMao/gkXXdcAUf44
	W5tCk2/PCA0Daaya7gWQd8gxPaxbBUInuXP39gkMO3VuZ2/IdwUk5XhAUwvygJy7
	ZEDJNMT95v0USPXdiWwvuKMKJ4MgNdYqcLA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqaaby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAErhEo019252;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42t0tkewh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AAErhqi019227;
	Sun, 10 Nov 2024 14:53:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AAErhgU019220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Nov 2024 14:53:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 388FF59E; Sun, 10 Nov 2024 20:23:41 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 0/5] arm64: qcom: Add support for QCS9075 boards
Date: Sun, 10 Nov 2024 20:23:34 +0530
Message-ID: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kAMYBO1ZEBIJKdMVacPhych1t1TOGq2G
X-Proofpoint-ORIG-GUID: kAMYBO1ZEBIJKdMVacPhych1t1TOGq2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100133

Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
without safety monitorng feature of SAfetyIsLand subsystem.
This subsystem continues to supports other features like built-in
self-test, error-detection, reset-handling, etc.

Wasim Nazir (5):
  dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
  soc: qcom: socinfo: add QCS9075 SoC ID
  dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
  arm64: dts: qcom: Add support for QCS9075 RB8
  arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3

 .../devicetree/bindings/arm/qcom.yaml         |   9 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 287 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  12 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  12 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 7 files changed, 325 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts


base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
--
2.47.0


