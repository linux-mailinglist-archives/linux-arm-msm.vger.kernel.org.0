Return-Path: <linux-arm-msm+bounces-41248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3879EAB87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F0E91676CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE27231CB7;
	Tue, 10 Dec 2024 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DRwaRAwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C17231CB8;
	Tue, 10 Dec 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821911; cv=none; b=ENl3XnLiQfuYTruNSWo+yGV2eH9r6u0H35D//Pb5AGjTUt3oEnQzHXacwu2zaN96HT8/C0Uk5px3WcQmPfPOQya0WIaiKSN8G89rqIqEipn29Ow8tVe1uLPVyaUOMj57CyXP9W2wq5+Csves4/mUpRrjpRoZyTVZtZR9ZU/K2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821911; c=relaxed/simple;
	bh=pmTpre1oIdDkG6TzN01qtfBZWsNEegsDMGTD4b2mIFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eZOIQfGxRpVemcddwLYWDoRt2CaR5QWLBVqQz69J5UruDMwqxekPvtSToQHVL2ZUcwUHPw9b7E0OkeIHVn70hcyXzxOrsSpUD2ztYKN0PeOmMHyatRQjxbcoPNI4hXF2SxE5pxyzHWDXGr67vhFhlxBNdKXdgrDDctoNMXoBAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DRwaRAwN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9NpKaU018749;
	Tue, 10 Dec 2024 09:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tvH+ImI1xF27OGI/Pn3kq9HVKe9GFzbLX1Qz2LbuGbE=; b=DRwaRAwNA8cqu9jA
	SDuNFT9mtSgBv+gVyKQfe1L6G1xZCTHTv/iVqdWxg64RVpKqbfIUysi18x1+Or09
	I1pvi8Z4JZNvT/yCUdfuFsqOuwjZuQ32GKQ9iFVuEp0z+YWIwJU77QZFXrcEuMhw
	xU2I6LrdbZzSwuvGCWhl74TLf1jGYZvlZzRrLXFjzip5etfJVBx8cn1GM69pvJp7
	0jwCEW7uYe8toLQCikDyet7ZvsrNcpaZo1xQDSnhGTHggNu+y+YMSlIN/W5yjIVP
	6Ke3XGUM30VXcoaLtNc+TPa2cdXZSk0cE+G3flmo5UAI77bOD+A9db64TWs2VV+L
	4DjFyg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eak398se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA9Bih3018567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 09:11:44 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 01:11:41 -0800
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Date: Tue, 10 Dec 2024 17:11:05 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: Add DisplayPort support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-add-displayport-support-to-qcs615-devicetree-v1-1-02f84a92c44b@quicinc.com>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
In-Reply-To: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fange Zhang
	<quic_fangez@quicinc.com>,
        Li Liu <quic_lliu6@quicinc.com>,
        Xiangxu Yin
	<quic_xiangxuy@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733821897; l=3994;
 i=quic_xiangxuy@quicinc.com; s=20241125; h=from:subject:message-id;
 bh=pmTpre1oIdDkG6TzN01qtfBZWsNEegsDMGTD4b2mIFM=;
 b=7PmNaDsPZU+2rrg/9U0HaR/M/H9BF2t9BCLLP+82wBnABriw8XCTJF9tG3MzdBiWzqUuX9sxB
 fZHnMBqKuqCBnP9WvHSTVfDVQkC4dcmWiOBLybXH0LrPCPhAbWpDpjd
X-Developer-Key: i=quic_xiangxuy@quicinc.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wSYETfDY4wNKvL7OXiMHp--hVJuuY_NM
X-Proofpoint-GUID: wSYETfDY4wNKvL7OXiMHp--hVJuuY_NM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100068

Add DisplayPort controller and phy configuration for QCS615 platform.

Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 107 ++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 0a629c44e960e38891f48a8a021b86a6c1dadea1..dbd6eae267d7470d9b9a6c303eac03b64c3df3fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2889,6 +2890,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 
@@ -3002,6 +3004,107 @@ mdss_dsi0_phy: phy@ae94400 {
 
 				status = "disabled";
 			};
+
+			mdss_dp0: displayport-controller@ae90000 {
+				compatible = "qcom,sm6150-dp";
+
+				reg = <0x0 0xae90000 0x0 0x200>,
+				      <0x0 0xae90200 0x0 0x200>,
+				      <0x0 0xae90400 0x0 0x600>,
+				      <0x0 0xae90a00 0x0 0x600>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
+							 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&mdss_dp_phy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
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
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dp0_out: endpoint {
+						};
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
+				};
+			};
+
+			mdss_dp_phy: phy@88e9000 {
+				compatible = "qcom,qcs615-qmp-dp-phy";
+
+				reg = <0x0 0x88e9000 0x0 0x200>,
+				      <0x0 0x88e9400 0x0 0x10c>,
+				      <0x0 0x88e9800 0x0 0x10c>,
+				      <0x0 0x88e9c00 0x0 0x200>;
+
+				clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+					 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+				clock-names = "cfg_ahb",
+					      "ref";
+				clock-output-names = "dp_phy_link_clk",
+						     "dp_phy_vco_div_clk";
+
+				resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+				reset-names = "phy";
+
+				qcom,tcsr-reg = <&tcsr 0xb24c>;
+
+				#clock-cells = <1>;
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -3013,8 +3116,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi0_phy 1>,
 				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
+				 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.34.1


