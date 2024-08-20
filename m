Return-Path: <linux-arm-msm+bounces-29126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49D95886E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 16:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73F8A1C20E36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A181917F0;
	Tue, 20 Aug 2024 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GbRX5UBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4C18CBEF;
	Tue, 20 Aug 2024 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724162618; cv=none; b=tnJwcpZMoKryMp9WOsNDC9ysf1h53cIiSGFFJX8IttfPIp7zJ3xrFEsHr9j79jSeQztL1B0SSXwcMqmYvLAC/J5RIhui2piKHTo9OPP/LSS/aNcxOE1yVWS01X8ASMlgZylrkUDettBgUFBO1TNtRx/2KGOCqF4s35PVPRbir4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724162618; c=relaxed/simple;
	bh=jQGdfxXTbGQZfGa+WoKEiVUem9j6PKBwEzejObXRoao=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=LhQ25U2K19+/vNFE0WP2wfAXh22ugO01Wx/gmqK46j0wIZV3Vgp/iOZo3Q//3aaEAstyaVCRCtlchYgSWfmGptwBQ5kX52GfWTVTyt/7755hsy/6kncnHHO8oLXQbACPHuvssYOsJmv81OVXf8Yk2JGiCQiYendyBeAMHPPvrBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GbRX5UBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K72t3L024590;
	Tue, 20 Aug 2024 14:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q5qobbkC9viyAMfapqJr7C
	RkzyUJZ7gLLOYj+uaqwms=; b=GbRX5UBWLsT6gXpI96ikUKYAyuIatCMRj+abhy
	8outY0P0nSYN7TtYFOYxtHqRczrDaygjOq+wJldohsvTXOYFiMp/0+KYfiPJ5M/D
	xRfPOx7qyi+k/voSVOI+LXQPTcmaJ6Mj+nb6Xf/TZdGmdh4AmAM+L64lNWr11MFA
	9nof7s7y77wvHVtk6kbmCBrfiXZTgSwfLo2QqAwrBTRBwGlDGFyOdhCNW1npZQmf
	NTKbmtWz9Aa7DEkZWXRfMG4t398phV7wPHJpFzzmqiq7537XIMdslbPYjc0ZesG1
	QZ+GmQthfY5Ta0E1iTxIoWP43d0KBn456zqOUCoFVQuiVRiA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdms80x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 14:03:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KE3Goi012697
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 14:03:16 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 07:03:12 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v2 0/4] Add CMN PLL clock controller driver for IPQ9574
Date: Tue, 20 Aug 2024 22:02:41 +0800
Message-ID: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGixGYC/3WNQQ6CMBREr0L+2pq2iEVW3sMQYj9FfgItbZVoS
 O9uZe/yTWbebBBNIBOhKTYIZqVIzmaQhwJwvNuHYdRnBsnlide8Zh7d3NHiO5ztMk1MoRDiomX
 FSwV5tQQz0Hs33trMI8WnC5/9YBW/9L9rFYwzzc+l6FEPqq6u/kVIFo+5CG1K6QsFiUZ+sAAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724162591; l=2478;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=jQGdfxXTbGQZfGa+WoKEiVUem9j6PKBwEzejObXRoao=;
 b=lEPNUl97QlQEaQ5swcjGTJntTFMhDASyrJ0ey+/CL1GGdBooepo9u+7G6st647gxJYLfH1N16
 dcM2bxLIIb3BHuP2r/NEJLTlrPlH0YsWL1o0ZV1dVP1XUQ+dM3kq31x
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ErsyDwS0fwk0zEprdCbN2HIwE956-Wu
X-Proofpoint-GUID: -ErsyDwS0fwk0zEprdCbN2HIwE956-Wu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200104

The CMN PLL clock controller in Qualcomm IPQ chipsets provides
the clocks to the networking hardware blocks that are internal or
external to the SoC. This driver configures the CMN PLL clock
controller to enable the output clocks to such networking hardware
blocks. These networking blocks include the internal PPE (Packet
Process Engine), external connected Ethernet PHY, or external switch.
 
The controller expects the input reference clock from the internal
Wi-Fi block acting as the clock source. The output clocks supplied
by the controller are fixed rate clocks.

The CMN PLL hardware block does not include any other function other
than enabling the clocks to the networking hardware blocks.

The driver is being enabled to support IPQ9574 SoC initially, and
will be extended for other SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v2:
- Rename the dt-binding file with the compatible.
- Remove property 'clock-output-names' from dt-bindings and define
  names in the driver. Add qcom,ipq-cmn-pll.h to export the output
  clock specifier.
- Alphanumeric ordering of 'cmn_pll_ref_clk' node in DTS.
- Fix allmodconfig error reported by test robot.
- Replace usage of "common" to "CMN" to match the name with the
  hardware specification.
- Clarify in commit message on scope of CMN PLL function.

- Link to v1: https://lore.kernel.org/r/20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com

---
Luo Jie (4):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  70 +++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  17 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ipq-cmn-pll.c                 | 227 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  15 ++
 8 files changed, 345 insertions(+), 2 deletions(-)
---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240808-qcom_ipq_cmnpll-7c1119b25037

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


