Return-Path: <linux-arm-msm+bounces-42983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E49F9304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 14:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F869166C1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FB02153EE;
	Fri, 20 Dec 2024 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LYay0/A3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E732046A3;
	Fri, 20 Dec 2024 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734701007; cv=none; b=lHP2AUK28uluKAMu4LHqw560eZ+ic0NGrq1JWD1/YT6vWV2r7N3nFpDCHaMWqUEGd1oJUyIlZ//Scc3/oymkrt+B7koYuAlvlATLWkqVV9lPVexvcWvKZdq6vMEfmWm5PxraZ2k+V0vOOEeGAvQwGIHRcVtTTmqBkzEc0PbYqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734701007; c=relaxed/simple;
	bh=uLSgQV8DwTUD0/vY1qsGmb/xX0ql53RpMCD1BEW+4u0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ba7V/xFgTlGt/Y/zEVwS+LTRq4F9qfjXrzaciWwM4zF+0tWLadA4HZgYotmx0bq++hTL/P2r3q3FA5muGlSzLC8eCFoJCsoSjlbLlNYTEtogfQI6PBHNWH5G6l4tIVK9q6AG5CTDITVHlYkjZfVOTcSUiI/8NNJFCgd14nCgy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LYay0/A3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCicfb012737;
	Fri, 20 Dec 2024 13:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5CxdEYtfuAGbkvKFILymcZ
	slrCUQSfWtQGLMzjFQYkA=; b=LYay0/A3oAkSy/Ipbch7b74s82twC1Ej7H/n9A
	PPINlc7zvtIOKCQ7bRuvn1J0oXEWK2C7XN2rcbdkyK2BZq/pw76HLnZHm+fCAZtG
	Gt3EANwUugrU97QaRBo2Qk98/wcHipG13l/xOdjxoTAES1Fnxll8l5DPJ2HFq27m
	YNdWB28VZd1JNHNddwxYSQz0zIVYzAsA/YPpJp5e12mNNPxzOXhpH/y/3yq7SPhF
	Oolw4pUZVLBOK939GcyEgBjspPlU4C157GB1ORcp2o2ZMggXd8EfbQnM/3F8DNF2
	1mlCb8hRXG190W5rX92g3xcZnolkN8uNbrxEofPxdD5OjFgg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8uvg32c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:23:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKDNFmQ006872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:23:15 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 05:23:09 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v7 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Fri, 20 Dec 2024 21:22:41 +0800
Message-ID: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFvZWcC/x2NQQ6CMBBFr0JmbU2ppTCsvIchBIYik0CBVomGc
 Hcry/eT/94OwXq2AcpkB283Djy7CPklARoa97SCu8igpNKpSo1YaZ5qXtaaJreMo+gzKnSudNd
 iB/G1eNvz5zQ+qsgDh9fsv2dgM/8VVGZSRIkCJSmhZVMItBpFcWtaZVpDfY739c3Ejq4xB9VxH
 D9pPYnzqgAAAA==
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
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734700989; l=4282;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=uLSgQV8DwTUD0/vY1qsGmb/xX0ql53RpMCD1BEW+4u0=;
 b=wmbLGrny8lc11y7/cCzP+gFLhVOtG5Sx5++jPxBI/ItmJk7MzQoZZ7ixrfBoaC8SEkoN3cEed
 /R50J98sYCzDTQmWIXDrGU2adUsmF7iX3U6/1zuGjkGNohKyC8UKRri
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1UChyD-PZHXZrebBz-8-FMY05f1sQZ3-
X-Proofpoint-ORIG-GUID: 1UChyD-PZHXZrebBz-8-FMY05f1sQZ3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200110

The CMN PLL clock controller in Qualcomm IPQ chipsets provides
the clocks to the networking hardware blocks that are internal
or external to the SoC, and to the GCC. This driver configures
the CMN PLL clock controller to enable the output clocks. The
networking blocks include the internal blocks such as PPE
(Packet Process Engine) and PCS blocks, and external hardware
such as Ethernet PHY or switch. The CMN PLL block also outputs
fixed rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ
as sleep clock supplied to GCC.

The controller expects the input reference clock from the internal
Wi-Fi block acting as the clock source. The output clocks supplied
by the controller are fixed rate clocks.

The CMN PLL hardware block does not include any other function
other than enabling the clocks to the networking hardware blocks
and GCC.

The driver is being enabled to support IPQ9574 SoC initially, and
will be extended for other SoCs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
Changes in v7:
- Update to use API regmap_set and clear_bits.
- Update comment of CMN PLL reference clock to mention .xo could be
  48 MHZ or 96 MHZ on different IPQ9574 RDP board.
- Link to v6: https://lore.kernel.org/r/20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com

Changes in v6:
- Rename the reference clock of CMN PLL to ref_48mhz_clk.
- Add the patch to update xo_board_clk to use fixed factor clock.
- Link to v5: https://lore.kernel.org/r/20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com

Changes in v5:
- Move the hardware configurations into set_rate() from determine_rate().
- Remove the dependency on IPQ_GCC_9574.
- Correct the header files included.
- Update reference clock of CMN PLL to use fixed factor clock.
- Link to v4: https://lore.kernel.org/r/20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com

Changes in v4:
- Rename driver file to ipq-cmn-pll.c
- Register CMN PLL as a 12 GHZ clock.
- Configure CMN PLL input ref clock using clk_ops::determine_rate().
  Add the additional output clocks to GCC and PCS.
- Update the same information in dtbindings.
- Use PM clock APIs for input clock enablement.
- Link to v3: https://lore.kernel.org/r/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com

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
Luo Jie (5):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
      arm64: dts: qcom: Update IPQ9574 xo_board_clk to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  85 ++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  24 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  27 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 435 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
 8 files changed, 601 insertions(+), 3 deletions(-)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241216-qcom_ipq_cmnpll-f5c84724db9d

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


