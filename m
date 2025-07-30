Return-Path: <linux-arm-msm+bounces-67103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C052B15D46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C0318C501B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5117F2951C8;
	Wed, 30 Jul 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YEoSNtBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946EF274666;
	Wed, 30 Jul 2025 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869073; cv=none; b=Zsuv73cZ4cLmjs4QTQyGHcsKkksu5vcixAI1v65R2a4+F8ec0vGEQ8Gk5vqZDEIQtoe3AL90mJE8mjYauMJle8Wrmm+C6cSmWbMUremRTbTyXemqaJ4z/f/NU/zGf0tMLljPgP2CArqNWNxRn6Tdt02IR2iOs9m8eyQQGyoI6I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869073; c=relaxed/simple;
	bh=nRLdXcFsXvPxzriouvUKnRvSGQm1qAHUrnTo6J66HGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TxMtt25nKiNLFyJip2fWj8LNnSStctzyBSSGKf9/rcZPUZIXplbumJoybcahg/G8ekrXz/+pYXoa/bie9pvlIbEYC2qbWbYNN1SCr84oYZUE4oAykS/sVKrTPnDXJs5jr0zXYBAA3chSB9EeTVv87dQluDbI6cNJJfCmlBBRH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YEoSNtBw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4wpOk014622;
	Wed, 30 Jul 2025 09:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DqgjetU40lkJ2NoD1qheKFS6ed69Ao7CosoRyUbGxnY=; b=YEoSNtBwoE0V6NmA
	My39hvWKaHiLNIcv87xL6sMeUcGT/AzPsRM/L0meFrhUvBVzFoAjCbhGFZeRsH6n
	yZC79mrWfLAvTVqk/CFcFsPrDhLXo4axrZPvyyGuuY7GiFE/UD+ENKvNj6Jo/U+J
	542flbyQdC+djj9QHwv7umVqcmp5I+xPvQYO0KceZd0AA2hLonrQF/0QZ5e9U7E0
	qiQrsgH9Zd9aBK+1GdjmNytwPGX12JpP71cXIJgWEqGleIUP95vb2Xzj1Dzm7JeX
	cG6bU6noYcfVN3dt4ZY71Nx0Bwjfyil7/cVPQD0tvxqMelrVYIpfzyLEZoFn48JY
	eH5jkg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xu7qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U9p6Zf018019
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 09:51:06 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 02:50:08 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Wed, 30 Jul 2025 17:49:45 +0800
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add display dt nodes for
 MDSS, DPU, DisplayPort and eDP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
In-Reply-To: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753869004; l=7000;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=nRLdXcFsXvPxzriouvUKnRvSGQm1qAHUrnTo6J66HGw=;
 b=gmwLHoIQsCb/TqPm+R6LJ/z45YRjRi6IzhAFYnQSqxxK+O7KYHH8JwVCdNBAD5DHHMOI74LDI
 GnGUr+3MuR0D6V9fvxZi+xwXEI3+FGOWZeS81wUA+1Cx1fCjB/5FER7
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889eb0b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=k9CZhLnHGQvBtwWlxu8A:9 a=z1yF2VQjIG_L1ZrU:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MhzFlAuN7f9fxZQeCbiXHpjU92zc2_5t
X-Proofpoint-GUID: MhzFlAuN7f9fxZQeCbiXHpjU92zc2_5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2OCBTYWx0ZWRfX9ZMchpJKrGvL
 YTmUDsE08DYdsAtFK5Q8b+N0TR7cuW+44gwHgj6jpkExlPD05/1R+7t21gYsb21pj33xMwmAjrY
 QojajGDBkjMADXUO9A1gQOSWzGwV4eBbHHGZCcPL5i+dp+3sOYr0AFO4jOeXXdhQBHTIOk4hLG2
 5Ms3HIiI1euBUVxrCZZz0vBf34YYy08M18rVYgJg4caNFw8MsH9qtr4BQ9rkOtht6x7xibXbDp/
 ipVAhPhYKM14iykLVMoljZGP+wmku6waXylVbzoABSYni0nthNPzfm7iwKbGMOorYwM7snp99/6
 1EhnV407+aK3N6CIC29UwgukgML6atnTgmUmd6nHk2e6ZzahiUPCez40ED5at9n5CeUtVbjcarj
 pzzAM36u1VN7jVypCN/FR7qFueSPXcM6gVZrq3QeyRJMdb/2hyKVNs5Ik2NmA1kt/cPxBnC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300068

Add devicetree changes to enable MDSS display-subsystem,
display-controller(DPU), DisplayPort controller and eDP PHY for
Qualcomm QCS8300 platform.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 216 +++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1f2d0488a3fd1be603887c64bf4f9..93797696c72a2001dc0564454da281745f0a7433 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -4308,6 +4308,218 @@ camcc: clock-controller@ade0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,qcs8300-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1000 0x402>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,qcs8300-dpu", "qcom,sa8775p-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+
+			mdss_dp0_phy: phy@aec2a00 {
+				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x0aec2a00 0x0 0x19c>,
+				      <0x0 0x0aec2200 0x0 0xec>,
+				      <0x0 0x0aec2600 0x0 0xec>,
+				      <0x0 0x0aec2000 0x0 0x1c8>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				power-domains = <&rpmhpd RPMHPD_MX>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,qcs8300-dp";
+
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp0_phy 0>,
+							 <&mdss_dp0_phy 1>,
+							 <&mdss_dp0_phy 1>,
+							 <&mdss_dp0_phy 1>;
+				phys = <&mdss_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint { };
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sa8775p-dispcc0";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
@@ -4315,7 +4527,9 @@ dispcc: clock-controller@af00000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss_dp0_phy 0>,
+				 <&mdss_dp0_phy 1>,
+				 <0>, <0>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			#clock-cells = <1>;

-- 
2.34.1


