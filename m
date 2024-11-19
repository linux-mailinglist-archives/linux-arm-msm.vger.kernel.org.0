Return-Path: <linux-arm-msm+bounces-38375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E02A9D2DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F1E1B30F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F381D26F5;
	Tue, 19 Nov 2024 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OFzlGEAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D37C1D2223;
	Tue, 19 Nov 2024 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732038607; cv=none; b=T3g+lrF6+P3hVwi1mdDuO+i5F2NanNcP6ef4agnV2GyfuOQadUV8ubNjBm19mMv1toZy5VNAlA0UE//nLVYhOgNixWOL98APAOEFzzfrYux/OpVSc6j3jsQRB9IqofAtG7zLdKBFWvuyvrhJVHqWucvKKnwWU6aTZAe60kFg41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732038607; c=relaxed/simple;
	bh=qwc3wHa/nC5D3ytFiLfrQW50el14wIHK2k5Jv8Yp8+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFyGCF7XOAM/OwEu2UAmociL9CXSjr0aFombo/1+kJ2oX37epuuY+e0VojTVjD8gOuWG8qiuADAZphPLC3C+eky+GawG2WQhbc0mVTy/Z4qNZ6eWPPaUKeM7HIuRbyVeGGPXTTilupm3CwO9T4/oQZnLwECR0fwhFAQQZw6XzV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OFzlGEAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7XlYI030145;
	Tue, 19 Nov 2024 17:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lFzZwEo3JbDOX6WSbyrP/IX6NI1tQfO7eRy
	2XsygRpI=; b=OFzlGEADKTHDb4hUxIyGMDKwRYyQp5ZkB3YVAf0g80K7M2Pw2tw
	+rMK+13ISah5fu/qd7vZBIzlc+SbvIPDKyPNxMl9zNR3Rex/YdHBkyEzo0rlozgz
	3szFuLn6y7P/vvyaIskcEauUPzIYxoa1ZE9lnX4xnOBf8aMi1Ie+QQViAmqLLMaa
	rNmFF1lJ3RvmUBJjuGaybsQWH17M4/771bc2ULy30Mhe0T30/DfdIFk0gAYmS9ti
	IkG2XFP/I7nV3rjmNCQkBSIgCufZwqshxCmc2967bXPY1Gp86WuZ/bbnMF+o7zgL
	IBjg1Ze7GnIcRQBWGnu9zBHWSBOedKbDnAQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6bc06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:50:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJHnxpg007361;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42xmfm26rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AJHnxTM007333;
	Tue, 19 Nov 2024 17:49:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4AJHnwIn007325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:49:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id A9E1959A; Tue, 19 Nov 2024 23:19:57 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v3 0/5] arm64: qcom: Add support for QCS9075 boards
Date: Tue, 19 Nov 2024 23:19:49 +0530
Message-ID: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SDyhqKAq8mlA2i_0Ctb_2NZihe7lfuKz
X-Proofpoint-GUID: SDyhqKAq8mlA2i_0Ctb_2NZihe7lfuKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190132

This series:

Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.

QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
without safety monitorng feature of SAfetyIsLand subsystem.
This subsystem continues to supports other features like built-in
self-test, error-detection, reset-handling, etc.

Changelog:

v2:
  - Remove unused dp nodes & update commit for ride vs ride-r3.

v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/

Wasim Nazir (5):
  dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
  soc: qcom: socinfo: add QCS9075 SoC ID
  dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
  arm64: dts: qcom: Add support for QCS9075 RB8
  arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3

 .../devicetree/bindings/arm/qcom.yaml         |   9 +
 arch/arm64/boot/dts/qcom/Makefile             |   3 +
 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 281 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  12 +
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  12 +
 drivers/soc/qcom/socinfo.c                    |   1 +
 include/dt-bindings/arm/qcom,ids.h            |   1 +
 7 files changed, 319 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts


base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
--
2.47.0


