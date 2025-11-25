Return-Path: <linux-arm-msm+bounces-83233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D50AC849A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EA63434F25A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 10:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B013161B8;
	Tue, 25 Nov 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E51MO4mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C96314D34;
	Tue, 25 Nov 2025 10:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764068212; cv=none; b=nMs1npZSo/W9n5JzMZ5hjke60u8J4BUUzvKs08JIwP+20WVW3AuNcgSP2neyTreZ4jKB2A6+fdYO4ADmQzw9TotSFsFKAPWiET84fH99QtZ5zaHfTv/eWm+zX7t520gUUdx8plegDs9h9kTFIt6NlSgfSOWAjqXm9UUNPiqQohA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764068212; c=relaxed/simple;
	bh=OKftlkzczeTpcZeuJj/i8lM/+5aswCLJam0ouFI1UcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NDAILGTuxJcFL/LYdUIUivq8qfGfl1GUJGfowYFzpu4P2DH86KapcjOUKKgQVs/98SEIcmiACciRJc+dHDsxl/Ng1C1UdQSiAS8bP//Pqrf7qhDp/94brmIwFSzL0/b19wYBAVbU9vJLffBog85buXrcuIc4VKfN4XGC13bCjaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E51MO4mh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xDC32650394;
	Tue, 25 Nov 2025 10:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PZ4BuRiiT+l
	J7nonsdTCUBpTObre8rCRK4B92fnEpBs=; b=E51MO4mhB4iDQk4HxPPpUuUW0pi
	3ORji1IQ2LsGztUijDgTsWEivFUBWszmsDh8TnpxF/kYxIQVTAY9OEo6jbtYu/OB
	PB0c4U0nvEDGR/hVtyH3QMUHteSc+4Tm/PjR6rFPIy9kp/mwdE8ayFDmlBQU/8HN
	WL5KkCGBBjI2XJ/ohv6TEDwRpImX5weD7ayTsw8WVm96iGY7ufr4cwylGn87kPXt
	5Qja5orFaW18nZnT8yoxvdgu9Ksurw72Lqv66h18FXZrBJUQ5gRc+XpHiHXnCjcS
	dZBDOR5xUzBYcq88nBxxk/WIBQx/3EzNPHgrysYjbjWbCeA8uR5032G01vg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabr4va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5APAuSqm009131;
	Tue, 25 Nov 2025 10:56:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68n435p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5APAuRvM009100;
	Tue, 25 Nov 2025 10:56:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5APAuR97009094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id D81EC588; Tue, 25 Nov 2025 16:26:26 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device nodes
Date: Tue, 25 Nov 2025 16:26:21 +0530
Message-Id: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=69258b5f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=TLed4gVWyGG0VdZkAU8A:9 a=CMlloVamYqqzhPaX:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XypMNWyF4y1M0Kgdj87zKcH_k2q6_HN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4OSBTYWx0ZWRfX7lkJR5i1+7ka
 t6hPySaC+KDBbJyqVUX1DpZEtN0ITbEhofpJi1D56qP2TldR08RorvZUI7Rr9e2UlVfSiHojyJI
 cr4S1PlgXgxOjrLKy0N8A8PLjDHq7F172tCjfiIq9TY/Vuf942fDZJt+mtejj9FwGY2gTn3kz5D
 z+qTm5+eTb3CXd+qMMFC4frM+kmIZxub/yY7Qqfqln1rNThB7X5dUkxpepvtvsgMeBhTy9EQCri
 8nYTxgK8pqWL85VpFF+j7vSE5LcGF5/zkODtSkKSkza3Z2ZijjDzhy05F+DQmrP6KrHn2PVNgPt
 CX69S0j/Ewme9w1fbFXD+HJXkUWa6xoBMET9HCc4FkGrG8QvotRCTdhUULXoY94qXdhKRef1OUX
 DmLqZvLEksTh0X9FfFsKcEhy21GDxg==
X-Proofpoint-GUID: XypMNWyF4y1M0Kgdj87zKcH_k2q6_HN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250089

Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
on the Qualcomm Lemans platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 338 ++++++++++++++++++++++++++-
 1 file changed, 336 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index f56ca4052c56..110189071cf1 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6792,6 +6792,340 @@ compute-cb@3 {
 			};
 		};
 
+		mdss1: display-subsystem@22000000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x22000000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP1_HF_AXI_CLK>,
+				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1800 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			display-controller@22001000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x22001000 0x0 0x8f000>,
+				      <0x0 0x220b0000 0x0 0x3000>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss1_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+
+				mdss1_mdp_opp_table: opp-table {
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
+			mdss1_dp0_phy: phy@220c2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x220c2a00 0x0 0x200>,
+				      <0x0 0x220c2200 0x0 0xd0>,
+				      <0x0 0x220c2600 0x0 0xd0>,
+				      <0x0 0x220c2000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp1_phy: phy@220c5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0x220c5a00 0x0 0x200>,
+				      <0x0 0x220c5200 0x0 0xd0>,
+				      <0x0 0x220c5600 0x0 0xd0>,
+				      <0x0 0x220c5000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp0: displayport-controller@22154000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0x22154000 0x0 0x104>,
+				      <0x0 0x22154200 0x0 0x0c0>,
+				      <0x0 0x22155000 0x0 0x770>,
+				      <0x0 0x22156000 0x0 0x09c>,
+				      <0x0 0x22157000 0x0 0x09c>,
+				      <0x0 0x22158000 0x0 0x09c>,
+				      <0x0 0x22159000 0x0 0x09c>,
+				      <0x0 0x2215a000 0x0 0x23c>,
+				      <0x0 0x2215b000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <12>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
+				phys = <&mdss1_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&mdss1_dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
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
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp0_out: endpoint { };
+					};
+				};
+
+				mdss1_dp_opp_table: opp-table {
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
+
+			mdss1_dp1: displayport-controller@2215c000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0x2215c000 0x0 0x104>,
+				      <0x0 0x2215c200 0x0 0x0c0>,
+				      <0x0 0x2215d000 0x0 0x770>,
+				      <0x0 0x2215e000 0x0 0x09c>,
+				      <0x0 0x2215f000 0x0 0x09c>,
+				      <0x0 0x22160000 0x0 0x09c>,
+				      <0x0 0x22161000 0x0 0x09c>,
+				      <0x0 0x22162000 0x0 0x23c>,
+				      <0x0 0x22163000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <13>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
+				phys = <&mdss1_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&mdss1_dp1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
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
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dp1_out: endpoint { };
+					};
+				};
+
+				mdss1_dp1_opp_table: opp-table {
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
 		dispcc1: clock-controller@22100000 {
 			compatible = "qcom,sa8775p-dispcc1";
 			reg = <0x0 0x22100000 0x0 0x20000>;
@@ -6799,13 +7133,13 @@ dispcc1: clock-controller@22100000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			status = "disabled";
 		};
 
 		ethernet1: ethernet@23000000 {
-- 
2.34.1


