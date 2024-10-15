Return-Path: <linux-arm-msm+bounces-34453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C03EA99EF17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 16:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4821F24ADB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06CE157A72;
	Tue, 15 Oct 2024 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ao4/tEzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385031FC7EC;
	Tue, 15 Oct 2024 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001849; cv=none; b=LrAssONeEIZHv1QhKMVRwEfs4tJp+RMkY19FeHvyPiFyWMKIRwOtA1Bb8NUFjFQJPZpfyuQ55eCd4JKHoSoPO9qv1igmNPBs67rH+N/qgQ5FTjYfS5GR6b5/fabMM1cGPhc0m5Hn+SBznckgloj8mwptngQ8UNZItSQwYUi9B8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001849; c=relaxed/simple;
	bh=i79zFnY40N7dlPsjPAz9d5dpzSdeqjeY7NKpv/37xmQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=NCrQGNci2zc3A14jTj+6G5aAHXDFg4dtUnLED1624hqi7s6dazGBmP9vFPFDR0in2Bwx1yJf7EGmRPe5PtspEYRPok1jIkTG2qWoNkuPmtK1njKJ/SWb11l7coomWLc33qJv9FfgR64QHsYAS/Ts4KZuCqgjPuyPMX/BhVFHqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ao4/tEzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FDkcMB011547;
	Tue, 15 Oct 2024 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X2800jNXRP4KCOfju7R0AF
	htw657g+Ji8Oi8jJZsgT4=; b=Ao4/tEzYXAvomDo6YhTL/ZiqTrarKWriduo3ZZ
	B4KlXzw7RmurVeYogkqcVbT1YRCdHuzPOpbzDdEvNURwTD7moD4893JrRLyBChDL
	Ne109I5GofnIERsmQhPP5IIV9B6wj3/+gk0WBzg/jqXq9ady9vmk4vNJIU16BV4e
	hFBc/RLmGULZX9An5/yn/Qp2gsHy0wnBx0GqmStYcS/jS6163Euwh9R1jpvGijYN
	XKhWLvD7avOPX8S5eCExhbsyf+uuVoNOACMSgDlrBy1a9Oo4Hkr6lCHF5/q5lAuh
	iLQ59WTMPPFIsPIZatoM5AsOXRVqPb4/dn6gxhK2nIazQTGQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429m0f91w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FEHBCs010205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:11 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 07:17:06 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v4 0/4] Add CMN PLL clock controller driver for IPQ9574
Date: Tue, 15 Oct 2024 22:16:50 +0800
Message-ID: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFN5DmcC/2WNwQ6CMBBEf4Xs2ZptabB68j8MIbIssgkUaJVoC
 P9u5erxTWberBA5CEe4ZCsEXiTK6BPYQwbU3f2DlTSJwaCxGrVVM41DJdNc0eCnvld1w1jkrrV
 aF5BWU+BW3rvxVibuJD7H8NkPlvyX7i505vTnWnKFyjHimZjY1eY6v4TE0zEVody27QvG0YrOs
 AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729001826; l=3348;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=i79zFnY40N7dlPsjPAz9d5dpzSdeqjeY7NKpv/37xmQ=;
 b=9HlT4acMtPNAANdi7F86wtCsiCzbfVHptKoJc5go2VEMDvqhBHbbCESYy+5RyO0BpMxJgIO+m
 272AizGKokYCzjEpf352W9sRikQll/UBQNmiszZi0HonykmYKV8SYFO
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HDbjAiUeYah5u9OUAzSMOYGn6JuEhSau
X-Proofpoint-ORIG-GUID: HDbjAiUeYah5u9OUAzSMOYGn6JuEhSau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 phishscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150098

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
Luo Jie (4):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  85 +++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  20 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 411 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
 8 files changed, 554 insertions(+), 2 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241014-qcom_ipq_cmnpll-bde0638f4116

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


