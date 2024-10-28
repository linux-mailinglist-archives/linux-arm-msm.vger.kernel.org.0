Return-Path: <linux-arm-msm+bounces-36176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05F9B3279
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 15:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5647B221CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FD71DD549;
	Mon, 28 Oct 2024 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dEMivi0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F61DC734;
	Mon, 28 Oct 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124282; cv=none; b=uxILt3eMa9PQxSS5FjDVv9gtBNROEkX3U9pR6j2d6jJ7GxlcJ3P0flvGG23E/Mb2gX/x9QhkkXr6L7RBUVwSAqjeSZK2PD2Mk1zsRv/WLU6W/pnmkqARyPDLIrx5JtHEOyYBVsOwypGIBS5LeQ93aa0HAWTT1L2gCSEjb+gXIIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124282; c=relaxed/simple;
	bh=SOIvPyJRmfJFGhYZ/LtCwoJ8ea6QC7C8lqnI5ohpZWU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=SKXTKm7vlb8bLEBLgSUrQBR5CsJqw4O33nlnOGlF6qegt3+aO0OetvteQqnEXVLkOQf7Y0PwgQh/vwZc1v+WO8HKfQFqIMhYQhY4Nq0CdRcMQJQ1CADisxWuDdjftmRGOyADF/SXQ6jAZ1sn5wE4mNjObFiHJxQKa5u7XAZsxGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dEMivi0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAVqHE027014;
	Mon, 28 Oct 2024 14:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fT/8CN3uQM667asE4FC0BJ
	2VmDl+BTDbxH6qSb3j5Z8=; b=dEMivi0jn1DGZLGVHbcVPNt+azsZ6V0zLJj4yW
	xImooj4pC67Zt/+znx+szQtEaiHA0CIkdlniz0VMim4WNubLwnFFIG7dEteTI7yu
	zj3HTByer2ymH9JwFfk0xLCUHMuUmOmDuc50zJwFLOE4bTF0UHuWcSdkUPU+2wa0
	uWEi6aIBDHRt6f2rYCMg4iGREJ975dRb4hyz1qGVW/qJwlK/HyKZR8NEduDSBu2p
	gV5JmSzc1OGh85Tt2Xo6Szs/MXl/oWYJDQQOWzoKOKYjMmpDKxwyf0ETU7ggjeud
	EIZ05/o0hanovngYlrB+kBx/XZDxEik4KwyaX42IhDzedLGA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgn6hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:04:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SE4NTL009681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:04:23 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 07:04:18 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v5 0/4] Add CMN PLL clock controller driver for IPQ9574
Date: Mon, 28 Oct 2024 22:04:07 +0800
Message-ID: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeZH2cC/2XOTQ6CMBAF4KuQrq3pL1RX3sMYImWQSaBAq42Gc
 HcLCxPD8k3mfTMzCeARAjlnM/EQMeDgUtCHjNj27h5AsU6ZCCYUZ1zRyQ59ieNU2t6NXUerGlg
 uTaM4z0lqjR4afG/i9ZZyi+E5+M92IMp1ulnMiGJnRUkZNcDYyYIFU4nL9EKLzh7TIlm1qH5C+
 kbvBZUEURheNBVIzfS/sCzLF1ou0X7yAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730124258; l=3680;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=SOIvPyJRmfJFGhYZ/LtCwoJ8ea6QC7C8lqnI5ohpZWU=;
 b=Q8ogq98h7xQnI1EwFgrxsiytJ6hwx2Fa+PSz1A+TvIrhXe4q7BKMsvKnee2EvHG+6+QF+5Uuh
 g9v/6br40RhCxsASFJLuUM/JLP14rokvxXw9va/c39P7GFIvTXhYvP3
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: htoyhtuBrr-Vrd1PcZnwdTSInhPjOI-S
X-Proofpoint-GUID: htoyhtuBrr-Vrd1PcZnwdTSInhPjOI-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280113

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
Luo Jie (4):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  85 ++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  16 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  26 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 436 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
 8 files changed, 594 insertions(+), 2 deletions(-)
---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241014-qcom_ipq_cmnpll-bde0638f4116

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


