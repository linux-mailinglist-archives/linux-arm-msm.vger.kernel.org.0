Return-Path: <linux-arm-msm+bounces-43832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79077A00502
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 08:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFBCC16297E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFC31CB9EA;
	Fri,  3 Jan 2025 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pTC90Zlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F3E1C9B97;
	Fri,  3 Jan 2025 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889523; cv=none; b=T2hGC3moPqULlA6xYKTAF5KvYqinF0z6eHBSt7VAj1x45bw9YcAQuReuNIHeQ9ktokIVKoKW5IdxOk7XIecgMkv+i8UsY0wPdqBr7YlJ9kC4tIo+EiqAHOtbybsdN++Pdx4HDm3yakMDMliczJtRj28bhnGh3N+1MBwob36ABg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889523; c=relaxed/simple;
	bh=DQM0t+vzMJ5j6bK+pWEwHeL2X0Sa0djN/8nuybecroI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ad+cDNTXGIHKAau5ccis/yDAbL5YUs2xjZwYNDamlZiREdJz7N4594D9nrCGTRPXlRuRbs/9+st+4G8ONV1zvLUMHuWc2q852HRXrD7awEnPd5tXcWM24CuAZ76lRhPYb9EmqGXw9EldyGwBAtMAnhRskajHnnhtfV5qEWeRUqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pTC90Zlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502GvglJ006584;
	Fri, 3 Jan 2025 07:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HQp6l6SbStegfvGnmp96j2
	Bflld3pCunRDiRUrj+V54=; b=pTC90Zlu8t+Qtn6yCeRgnjAn8OtsCHE4TV97Rb
	DL8GY5i7XaxzrXKqHqA1qUDvJH0e4glGJtaF76blVlFj0GD7Mi1dUR/iL7+ZGDeu
	+i998vTV2ZK7tB8Mvt8wyEv5O7j+O4bpw5b1uM+s7K8YtPLxkhJnTjv6aeQraS3i
	nE1klx4l+RVFcc0GKWIr5TBVr2Sp4wQj00Ovru0fhAZVpGLOM5mSfCXyhAY14phA
	JjUDv/S1jgT+cdWkWHspWXAp7DfVqgImWEzryip8hDviuUT5BUSDwq30WS/s1ecG
	9e2a/Io1kYgPsnVG1FHW2H5z78pkfYPeMDi5tlK0CG1ssGag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wxse9jdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 07:31:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5037Vivq031651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 07:31:44 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 23:31:38 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Subject: [PATCH v8 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Fri, 3 Jan 2025 15:31:33 +0800
Message-ID: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWSd2cC/2WOzQ6CMBCEX4X07JpSSul68j2MIXQpsgnyq0RDe
 HcLnozHb5L5ZhYx+ZH9JE7RIkY/88RdG8AeIkF10d48cBlYKKl0rGIDA3X3nPshp3vbNw1UKVm
 dKV06LEVo9aOv+LUbL9fANU+PbnzvA7PZUqFSEyNKBJSkQMvCAnqNYJPCKeMMVRmehycTt3QMc
 2LzzNm3u/9Q8u/HnIEEndgidik5tP7XsK7rBzlPxnfsAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735889498; l=4523;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=DQM0t+vzMJ5j6bK+pWEwHeL2X0Sa0djN/8nuybecroI=;
 b=2lguyrqtZ22u++Oq+ko+e4TMg3YboVMs4dPW9yBzxCom2mRuuMBPtOoZtwOQ9PLqel09gMOTN
 gOjwdmJHWmbAOwCTmwmsrO3ZmaPajlEMLOaE/dCN4ach3ueuyBqDqt1
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GJf1h38eGKRdQMdbqpqi9a8efm4ezd6-
X-Proofpoint-GUID: GJf1h38eGKRdQMdbqpqi9a8efm4ezd6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030063

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
Changes in v8:
- Remove assigned-clocks and assigned-clock-rates-u64 from dtbinding file.
- Remove the reviewed-by tag from dtbinding file.
- Link to v7: https://lore.kernel.org/r/20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com

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

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  77 ++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  24 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  27 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     | 435 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |  22 ++
 8 files changed, 593 insertions(+), 3 deletions(-)
---
base-commit: e25c8d66f6786300b680866c0e0139981273feba
change-id: 20241216-qcom_ipq_cmnpll-f5c84724db9d

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


