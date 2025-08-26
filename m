Return-Path: <linux-arm-msm+bounces-70878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA2B35A71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1153A6D5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 10:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591683090D7;
	Tue, 26 Aug 2025 10:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F28SewCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47C2BE7D7;
	Tue, 26 Aug 2025 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205637; cv=none; b=LNnZDVDqp+oFpQuBSL31/Bw7gSQbyIOD/LIswv+SVZtX1Yrea+8aaJ8JsJIOPdTObzkOzz4yuwbxnKzUBBYxDjMA4JG/hRvPWpR4OcG0Dpb1zfWy0tE966XTtGROZX5hQoGkEc/7SKrEIQY5JaRHTXDz0Cw62qpM3h30WEqC8O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205637; c=relaxed/simple;
	bh=sVR8U/5C0T2k/jJnlMKm7zxw9W5M2usItqJN3D7Dxgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E2CVhONIvPZt6WBKMVG0R4s2+kj6xE8LaG4T0PIXobHdVWHK7MNv4H2VWZeGJHD1Bol8QieavLE/8DU0VQAJEXtioLbAVmswGk/oSmy4e4DkNqsoyvIHKr6XBpL8MpDsrEzxBSBmC/MIOAxPgUlhxe/hpdZDaBIm2EMZ1wp+GLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F28SewCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8Y8ji027644;
	Tue, 26 Aug 2025 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GvjayCNXoqrrDZFT9AYAem28YvcTXs9yfk/OB9kP5B8=; b=F28SewCoHu3FEszi
	wIpUClOSSLpf5vTq9ypdi0P81rBLC9PhqXSPbS8TB4WT5QWzCMSJPjjxTY9cqJHq
	DHaBhzg+uDVMToftQGjyDCOFpa/oSFCboXr3dBk69yralR1o+1nIdRWBJmMM0wFD
	SD1DAlQ+AH1+y0lErRsaNNBkUzBxBCNWS3nQWb9nuOGrK1769Mll4nV7w/awcbY/
	c2PVX4WLa+NW/numwUkIGpnt6Tc4JU8jcpZFTtqJuNnWHXG+TkIlipbcJY13Huf8
	kMAM5PLCRjHBLgwJ8Rq7Pk8ZGTuatex3qDQ1jkgKBaFL1Kck6+QmsXkr0VBcLoYg
	dOc6dw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpetutc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QArpn4007282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 10:53:51 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 03:53:48 -0700
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 26 Aug 2025 16:23:38 +0530
Subject: [PATCH v9 1/2] arm64: dts: qcom: sm6150: add venus node to
 devicetree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250826-enable-venus-for-sm6150-v9-1-486d167639a1@quicinc.com>
References: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
In-Reply-To: <20250826-enable-venus-for-sm6150-v9-0-486d167639a1@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756205625; l=3287;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=sVR8U/5C0T2k/jJnlMKm7zxw9W5M2usItqJN3D7Dxgg=;
 b=j57Uyyxnv5WkbLxX3H9nMFHib9vd9t5Hf0DiAAc3mxJ8U0sy1RpsY5Q8rCuYohsQ7zEIVkSnF
 pP+PNb7mRcRAREsEezTk74r4d1mK4le9DFP++pk1NmwnVu0qycUMu4N
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _k_hUL4s7bt_FGaRPM7tbgJjWvyBpdak
X-Proofpoint-ORIG-GUID: _k_hUL4s7bt_FGaRPM7tbgJjWvyBpdak
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68ad9240 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ldKJulfZhrW0N6UdVmkA:9 a=Z9g7eUKczRYP4Lds:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX+lxTabq8F9im
 2nznI22dGrndr4eeHNZd3aLQnsGVTy0qd1DqaiOh+otnVeHITyJY0cHMlWdBz568rE1Mgey1+dt
 GCXgQW1JVao9GnMw+KlnN9CkyAp1koWP1WRVTvOfAetiEt0Jyf6aoH6gW5SDoaakRM3lXJfiAuh
 WvW11rXEG1yZRI6b+O6LDQWdLnYR2aab17qVHnvtKG70PPeNF/9hulk1YoKrtpxMebGpwYH9827
 pGQVICjoV094125ZMduKE85loTWBISmPLSRVSxlr7MPx3xUMR71BEGnx0cKNbTf60r2rUS8rVUe
 PE0rW5Qsaygzxg4F/uNZPe1uRgpRzraYU5+ONjvVuIgvdmn110Xy2bru6Aq7t4lTDNcUUjgvMuQ
 PCyGqX1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Add the venus node to the devicetree for the sm6150 platform to enable
video functionality. The sm6150 platform currently lacks video
functionality due to the absence of the venus node. Fallback to sc7180 due
to the same video core.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 53496241479a05fec7bffa893b96b2d12b2d7614..8757e05015915c17062f2066f5812100b57c1cbb 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -494,6 +494,11 @@ smem_region: smem@86000000 {
 			hwlocks = <&tcsr_mutex 3>;
 		};
 
+		pil_video_mem: pil-video@93400000 {
+			reg = <0x0 0x93400000 0x0 0x500000>;
+			no-map;
+		};
+
 		rproc_cdsp_mem: rproc-cdsp@93b00000 {
 			reg = <0x0 0x93b00000 0x0 0x1e00000>;
 			no-map;
@@ -3556,6 +3561,79 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,qcs615-venus", "qcom,sc7180-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+
+			operating-points-v2 = <&venus_opp_table>;
+
+			interconnects = <&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0xe60 0x20>;
+
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-380000000 {
+					opp-hz = /bits/ 64 <380000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+				};
+
+				opp-460000000 {
+					opp-hz = /bits/ 64 <460000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,qcs615-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;

-- 
2.34.1


