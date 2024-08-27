Return-Path: <linux-arm-msm+bounces-29629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51E960ACC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451E41F23BE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372421BBBE9;
	Tue, 27 Aug 2024 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/146qm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6719CCE7;
	Tue, 27 Aug 2024 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762789; cv=none; b=ro/8Cxd5AMUgye0aOxP03iI9yual8mOUK8i35jHMrQhiS8TaP+oV0uPCQ8poAScrfk93e/EG/EVcY+lW7i0jsHkcz3zxrnQdDuO9qDdmu7FAggVY0xvG/kCeEc5osmgdtahnmktTk4lRKDY1wie+J15HiMhpWQ5j6RreyfD0o+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762789; c=relaxed/simple;
	bh=vgn8uX1N5zG+nayIOSO9znCgxojVnlywzQCSUueGkXk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=s+2po2v/C8X3Y3cnku+9XZU8WOLxlnLdBONM7ifyWXaN/ClQJ/9bmI3qHIBucvUe4vkjdaeEmMbBsWVgwipcHQ/WiWEH2LKoxSGisDpAvQZXYKwFVrctEsYoV5J82nwuk23HtVyBfkiMPRo31EpF7QEeVm9ScMYRvzt7oNLLFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/146qm1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R8Ljxb027921;
	Tue, 27 Aug 2024 12:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1NWakbH7hilxF70Y026R8y
	lbkAIcSwyIxHqUXroCl4U=; b=c/146qm1+mOHMx9YB87aGne/o++ioWfyV0fEWb
	U/8dnU63FOCtx9VzgwBcxLWFbvxt3luurCr4Bb8yFr9kOGz7jvdrfzE8NbUoea4I
	UzvvPc7xhEER26DJlMDYeXGCFDxABKD1S6obgxi8ckOSx5rDQbfhlaxFj1mOFih3
	xUHdN9uPBZi1tbzBt9ACie4wOj/NxZnIIl+D1ZhsFDLeCkoGGn2yvcC/C5Gy+VEu
	bPO1NeoTQ1JNOoRETpNrSWzf3MUc5//+1wda0yEuLE869eOM79iEfrQflbW0S1i4
	DBxMThCbEfBUOlQqAOneIvKzxR24Ff7UBGCS5QEaDEUSx+uw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41798exvcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RCkF3H019808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:15 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 05:46:10 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v3 0/4] Add CMN PLL clock controller driver for IPQ9574
Date: Tue, 27 Aug 2024 20:45:58 +0800
Message-ID: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIbKzWYC/3XNwQ6CMAyA4VchPTvTbSLTk+9hDJFtSBMYsOmiI
 by7g5PGePyb9usEwXqyAY7ZBN5GCtS7FHKTgW6u7mYZmdQgUOxQoWKj7ruShrHUnRvalhWac36
 oRI6ygHQ1eFvTcxXPl9QNhXvvX+uDyJfpfytyhqzCveRGV3Wh8tP4IE1Ob9MiLFoUH4LAX0GsA
 qIxUuZC4bcwz/Mbhz8oW/IAAAA=
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
	<quic_luoj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724762769; l=2792;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=vgn8uX1N5zG+nayIOSO9znCgxojVnlywzQCSUueGkXk=;
 b=16/ZCyzu/Dqhk0QPU0QlE98Ep+VbepBmFhIJBlVx7Dp3+Vo/rqbiYJ1ThOU1To2PmiztMokVs
 tZo9WGBlgRPAHvR4Hec2QjB+bPqAcuuPR2XFNDCL9j8zSVUyll+Tm6y
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ezc6HeO2vG4PYzlHHRhSuAAjTSvy9kYb
X-Proofpoint-ORIG-GUID: ezc6HeO2vG4PYzlHHRhSuAAjTSvy9kYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408270094

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
Changes in v3:
- Update description of dt-binding to explain scope of 'CMN' in CMN PLL.
- Collect Reviewed-by tags for dtbindings and defconfig patches.
- Enable PLL_LOCKED check for the stability of output clocks.
- Link to v2: https://lore.kernel.org/r/20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com

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

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  72 ++++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  17 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ipq-cmn-pll.c                 | 241 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  15 ++
 8 files changed, 361 insertions(+), 2 deletions(-)
---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240808-qcom_ipq_cmnpll-7c1119b25037

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


