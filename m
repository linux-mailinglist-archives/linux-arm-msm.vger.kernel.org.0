Return-Path: <linux-arm-msm+bounces-37214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E579F9C0170
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A151F23923
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBA71E8825;
	Thu,  7 Nov 2024 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a7I5uQGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477241D90D9;
	Thu,  7 Nov 2024 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973066; cv=none; b=MI1h1Rh7MrmZ4mzWBrPHE/cHGsnBlR5mISjXMBFbNI6IijGgrmXg3SBot6H3Aa3jsQqi71O4h7m0Frr4cKjWeWW/NZTDUxLW50guZQ/zSUgXNvMi0Uw6Xhj0VCA0ck790wlqJJOcKLcuhaqBvCgZHtYbVAThJ1eOctfdHHXmdlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973066; c=relaxed/simple;
	bh=5kbzNcbAZj8QpGrrA3FC5qDCk10gOd175RlJc6GjLqg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=PU7EJXSJRMIqqSoqPJwJlUdj6/k3s9Jl9S/gaZAG63nabvkfzzx+iqmTXMP7Jqalb5Ea6uCcV5Ug7FTUMoeP3EGiQJazBVAN59in8g7k2D/+7ST57/EDRY8Eaz0LZLgAGL0k9Amucqr0PXCLCk/VN/KiQFdeyxpvQwe10xBwYZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a7I5uQGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A71m6mw009985;
	Thu, 7 Nov 2024 09:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ykczVAQCVn8icr6q7ZxvKn
	SQiBxYxtgjmMGkJhg/1Vs=; b=a7I5uQGf7aQVOiz74aCI10vHYDZvEOUDtgWhhH
	aXmRAQpmVPxBoXXCv4xud0QrMchu0MRwUhBpTRUaIjIsqNCEg21R0CjotvO505AL
	taetKe5R2YdqHNlqITIJ7B+ej9aOXXOqjw9gDbajVJLsWn1+yCqIZHyrfSQYJlQ/
	N5J8xz11kgF/cX5PwFA892g+bHSFVnQPtVQ8G9SZssTlVBlTbjNgNSIp1gfcanbu
	Qbge2PLQa4+9x5I0S7TChQyOrGD68GrEGrMG6N9HRdn0GWRYbkcjvwudijl8l74A
	aXZQpEf/rongAot7QwPwWO7vTdRspiHnz9bfOvJb+Zg/AXcQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42rm6vs31j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 09:50:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A79oY3R016527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 09:50:34 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 01:50:28 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v6 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Thu, 7 Nov 2024 17:50:21 +0800
Message-ID: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6NLGcC/2XOyw6CQAwF0F8hs3ZM5wWDK//DGCJDkSYwvJRoC
 P/uwMJoWN6m97QzG3EgHNkpmtmAE43U+hDiQ8RcdfN35FSEzCRILUBo3ru2yajrM9f4rq55XiD
 EypZaiJiFVjdgSa9NvFxDrmh8tMN7OzCpdbpZYGWysybFgVsESB06tLk8909y5N0xLLJVm/RXC
 N+YvaCDIBMrkjJHZcDsBfMjSLsXTBCUStNU56CsLf6FZVk+56daOTQBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730973028; l=3999;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=5kbzNcbAZj8QpGrrA3FC5qDCk10gOd175RlJc6GjLqg=;
 b=3urSDtRT7g4SdrvgORhCM4ArdGJgVzCxwebKPreZTJpr51L1kuMtS8tFnup9pAMevNMICd9zZ
 RWYM2Z2X7pUBeyFHkuoiSrUs+Jfxp/Jk1UG9lnRuqjQbASkFGvd3qsX
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rXOIJdV284SSKKHlU89NGD4oRGNw1dHR
X-Proofpoint-GUID: rXOIJdV284SSKKHlU89NGD4oRGNw1dHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070075

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
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  23 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  27 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
 8 files changed, 601 insertions(+), 3 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241014-qcom_ipq_cmnpll-bde0638f4116

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


