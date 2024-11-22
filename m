Return-Path: <linux-arm-msm+bounces-38814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8A9D5CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 11:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA33E1F2158A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36501DEFC0;
	Fri, 22 Nov 2024 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RKnxBQ7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7861DE4C6;
	Fri, 22 Nov 2024 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269595; cv=none; b=DbVaZ2z0wJJXnxl+Mw4JQnLxAI3FPMxJteX3AvPv2jDztg+VntWUxTdWu208uPDpUdUIdzU1Zbj44phA3kxErglR6l6aaqO5Z4jO6xGJNeCbtAxGWUU/lKNlyoSGjQdNZ9Kkcc1CHI7oBPR2nm2JjSFTGCsk93VbyzdgHlDrmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269595; c=relaxed/simple;
	bh=7zF71I+vPWK16ZO8yZURWpqdwb6MBDTEsIITkUVv15s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DjiAzx7T6iQryqe6r7hPlFL34d+tl0ZSeDf3K9P+IvU3jddKua1ZpSOEBpoQ3gopjCV7dUoWIDElII1rXIkydK+dyrsOIFemITbPAfHg1z6BmqhNOol0rfqK+xXe3S+CnlNgJgIJNGInOLVEKekvKHBYJbHzNzTuEp5upfN8Od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RKnxBQ7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM8bmJh019251;
	Fri, 22 Nov 2024 09:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdEsKUXNC9xKnIKNbWPVuAOZj+uieXeicvpsmZlOT+w=; b=RKnxBQ7LFTz4AAxR
	74vb2hq4ECKb8aZp5hFpH/knlESdMSPE4Fh3n9KlqL9OsNcpb+qZSLwmXfoTVwRg
	HV7pEAGxmRE2ARho/rPQGvQneHamw1DDBDJIPE5gIHjQ+4YOdc6PjogI+1k8E4Xl
	D4VvqRZbqJ0fK+AB7mFSjHtsSIbnz9jXYgxMbzLniUeQmMg237KuK2uP38G1T0wf
	ieuggHNtdc+AqDceioj/1E12EPXvwoH7LHW7/lrjIEMQetC+PDvLKKfkOAprAmnM
	2mQ7wH9iKIE04qEaK4W5ARj+8boiabR7+oZJPqerDnpfyvSrtxsu1+iBVdAJ8B1G
	lzYklw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hq1q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:59:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM9xbEZ008971
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:59:37 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 01:59:30 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Fri, 22 Nov 2024 17:56:51 +0800
Subject: [PATCH v3 8/9] arm64: dts: qcom: Add display support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732269515; l=6003;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=goOuI0D5rnWsGjXdv1dz9J+l2fipceNDBtnWw8v0G0o=;
 b=dFHjC2rXciGSfyWKE+NZlBXW4dFPWOBBfEf15Ypn/6sbIs8hyMWfRiL5FnZsjDjQPGIPAufdd
 D01g5hrSHtcDSwWfG0quLROPdU98f28oe5I6UgLf42wVTudJkPoNPyr
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7qMG-jzo_raPQgIZoAxvpeXNYfqGH_bn
X-Proofpoint-GUID: 7qMG-jzo_raPQgIZoAxvpeXNYfqGH_bn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220084

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615 platform.
QCS615 has a DP port, and DP support will be added in a later patch.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 186 ++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 57de1188ca2a34079578816c0c10825431d032bb..a9fb26dd27a0eb1f863707caca007f539422fc42 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1184,12 +1185,195 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm6150-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x800 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sm6150-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "iface", "bus", "core", "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
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
+						dpu_intf0_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
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
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy 0>,
+							 <&mdss_dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sm6150-dsi-phy-14nm";
+				reg = <0x0 0x0ae94400 0x0 0x100>,
+				      <0x0 0x0ae94500 0x0 0x300>,
+				      <0x0 0x0ae94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,qcs615-dispcc";
 			reg = <0 0xaf00000 0 0x20000>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy 1>,
+				 <0>,
+				 <0>,
+				 <0>;
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


