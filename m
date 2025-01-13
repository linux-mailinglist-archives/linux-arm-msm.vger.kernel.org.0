Return-Path: <linux-arm-msm+bounces-44933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B3A0C41A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718151885DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5641D63D3;
	Mon, 13 Jan 2025 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zy1Ekw27"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF3D1CEEA0;
	Mon, 13 Jan 2025 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736805151; cv=none; b=I2PW7SrUa0jMaEUPOb83V7ocBT4DVZlop6v+d5qfkSHK07BP6hNs4m7YtDnR8aTz1bVqfM1zsclj7Rglp0QA7mZchfxk6ATvM1W+uHHTBSAZXaVGSa8Qh/eJNz9eKFKmKylvt4ruu2TWWZ1jxkVP5SMTGpZCor+GdPYgry0RpMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736805151; c=relaxed/simple;
	bh=9yBaQXiDZeh03gIlt6HNO/bkE/PQmksKg5pRplG5EhI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=cs0GaNP9gAfWhZDaLgdmOPOaykrUfkpWx1vwffNI6hXOBc/khbG5E1o7s78UNauqyvQzhH4URi9DnIKNp2hL3oZQOmWwFK+bW2mtbdMmQgCzWd9uotdmfmTq4Oi7qH3yL6Wwn3u6adl1gstfZ2l7/OlwGSsSQd0DInooK9IfP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zy1Ekw27; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DErdiY021698;
	Mon, 13 Jan 2025 21:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dv4IcBAjfmR+8HBRab6Bpc
	xMQm42RAKQVauGMIi29SI=; b=Zy1Ekw2712um8rh9fLkX/hg6lIwwYjsnqrNWjV
	nVZRT+Mw2lh1r4C20NX7/zFov1+WxbznyK7BYhz0tU8dJ0mxxlykkjwXB7A6gEE/
	noUwOqygHAetmtXzyFGTVSo7ZGGr82CNA/RE0x8/Ay/7N6Q7Xqx29pBKII1fldaU
	S0DB2JMdZqFw2nNo6zlmbRWFY+ud3Q2JuICodLsvXegUZf4HCopZWesh6NXvMWmW
	NBZeO6ruKZrOjHFPjmarrWl3U22Q3oBwIP6KsSdOmxMg6mgnYxZZnAvsrUrKvqvX
	OADDm/Gz6LEEDlnCjzK4UrpLbV+y+mXAEUurDrFN0jvGxgaQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44550agy5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLqGm2007327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:16 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:52:15 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/7] phy: qcom: Introduce USB support for SM8750
Date: Mon, 13 Jan 2025 13:52:06 -0800
Message-ID: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAaLhWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNj3eJcC3NTg/jS4qT43MTiktQi3TQj88TUFPM0sxQTAyWgvoKi1LT
 MCrCZ0bEQflFqYSnQ6BKoYG0tANI1Wr14AAAA
X-Change-ID: 20241223-sm8750_usb_master-f27aed7f6d40
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736805135; l=1558;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=9yBaQXiDZeh03gIlt6HNO/bkE/PQmksKg5pRplG5EhI=;
 b=xuMgWRgaCzMFnPtCOE1uIVMKz0zTJxnpSvsVo7wQdqAQ8QRca8m2ngKmEpetwypNUmW2nRpKN
 7JDJe+6I9+YCroZDfta4/4pR5kfZ891+49bGC/WQhjrQvlJwVFhQzIF
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ctpwBzOBrwmZZzf8Apdt_vlSGSkLeujJ
X-Proofpoint-GUID: ctpwBzOBrwmZZzf8Apdt_vlSGSkLeujJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=652 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130172

Add support for the PHYs and controllers used for USB on SM8750 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Wesley Cheng (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
      dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
      dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
      phy: qcom: qmp-combo: Add new PHY sequences for SM8750
      phy: qcom: Add M31 based eUSB2 PHY driver
      arm64: dts: qcom: sm8750: Add USB support to SM8750 platforms

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  84 +++++++
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 134 ++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/phy/qualcomm/Kconfig                       |  12 +-
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 269 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 198 +++++++++++++++
 11 files changed, 751 insertions(+), 1 deletion(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20241223-sm8750_usb_master-f27aed7f6d40

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


