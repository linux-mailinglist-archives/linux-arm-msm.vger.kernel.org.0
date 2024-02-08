Return-Path: <linux-arm-msm+bounces-10140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A928684DA2B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE601F2331A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBE067E72;
	Thu,  8 Feb 2024 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BxDlLnbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0706567E61;
	Thu,  8 Feb 2024 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707373755; cv=none; b=V27OAcV5cUfMXk5bSrpa+NrJ2k2dzYfDLOmKJtj96pd3D1i577c3Re7g7v4steilG2D9efJMMQV7NSQdNYGExTqMEyI/JW5WBVj78XuCTYLgMY7xj2xD3Lxq46oelU9f1odiuzOsKw8uhdtt4z1FSQorL0vopPnIHd4GnJjIPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707373755; c=relaxed/simple;
	bh=VP+kt4un+Npwv130OUeqNC4/K4PHeK1uA/pVFjmW7ZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBl2Wc0cAAh26XT9S9upMUVdMJHtIbe9inaUyloR41sjLuuAAM3XEY47tAvbYtRk8Wdi3nlFJqrQp0ZrBFtjIhHtjpUpfdzJLghP8Kn8knX/qbmA6wckSGj8ppp01eKinWtbI1fjkE6w4yLoCs4mvzLJABf+vH3StLw0OC5FVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BxDlLnbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4185xfL8027641;
	Thu, 8 Feb 2024 06:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=zLtdOZGA2TuvAnHvnyh6
	uZUdKTmNwsolcBMKp1HBP+o=; b=BxDlLnbfgp2VT6qAODWqFYKGEZ5LutaszQ3S
	dskD8G7e9mCeK0uE51tHblryOdL0xKeDT0c8XqlC0N6oBV9ue2No7Fea/GDMBK1n
	Dq/fvD0IC9TBnBFdlf6aO8OHwG3CmjVkGCOsMeL2c3XHS0GslOnbaeQze1Sl15I2
	vn+01ChTqlJK81o7MtCr0mv2yNgE2Mu5lL/sfK2nx0sSLiKgQvqUlGG5FLBeVxse
	g/NjL+9dl6yuJ1M4J9mgunNhoZVVoPZmQRDIrFemmgpMUoLYA4VLIFVaKLPPsGjF
	7VQRvf9v/GdrRdH8sYykrjtvwj9yKFxq39P0piKdGND76HevZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w46r82g2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:29:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4186T9Mk012386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 06:29:09 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 7 Feb 2024 22:29:06 -0800
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for qcm6490 variants
Date: Thu, 8 Feb 2024 11:58:36 +0530
Message-ID: <20240208062836.19767-6-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240208062836.19767-1-quic_tdas@quicinc.com>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4wvxeMOOnOshP2AgLngQpAFrDsu7Rbvi
X-Proofpoint-ORIG-GUID: 4wvxeMOOnOshP2AgLngQpAFrDsu7Rbvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=838
 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080032

Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
thus require them to be marked protected.

Also disable the LPASS nodes which are not to be used.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 03e97e27d16d..425e4b87490b 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */

 /dts-v1/;
@@ -415,6 +415,58 @@
 	};
 };

+&gcc {
+	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
+			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
+			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
+			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
+			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
+			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
+			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
+			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
+			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
+			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
+			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
+			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
+			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
+			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
+			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
+			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
+};
+
+&lpasscc {
+	status = "disabled";
+};
+
+&lpass_audiocc {
+	qcom,adsp-skip-pll;
+	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
+		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
+		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
+		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
+		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
+		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
+		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
+	/delete-property/ power-domains;
+};
+
+&lpass_aon {
+	status = "disabled";
+};
+
+&lpass_core {
+	status = "disabled";
+};
+
+&lpass_hm {
+	status = "disabled";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 8bb7d13d85f6..1398b84634c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */

 /dts-v1/;
@@ -413,6 +413,54 @@
 	};
 };

+&gcc {
+	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
+			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
+			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
+			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
+			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
+			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
+			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
+			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
+			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
+			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
+			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
+			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
+};
+
+&lpasscc {
+	status = "disabled";
+};
+
+&lpass_audiocc {
+	qcom,adsp-skip-pll;
+	protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
+		<LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
+		<LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
+		<LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
+		<LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
+		<LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
+		<LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
+		<LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
+	/delete-property/ power-domains;
+};
+
+&lpass_aon {
+	status = "disabled";
+};
+
+&lpass_core {
+	status = "disabled";
+};
+
+&lpass_hm {
+	status = "disabled";
+};
+
+
 &qupv3_id_0 {
 	status = "okay";
 };
--
2.17.1


