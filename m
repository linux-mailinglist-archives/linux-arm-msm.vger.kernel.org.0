Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3CA60D9C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 05:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbiJZD1C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 23:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbiJZD0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 23:26:47 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0890E75FCF;
        Tue, 25 Oct 2022 20:26:45 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q35AKi032475;
        Wed, 26 Oct 2022 03:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=jOi2zehc+JJuP6Py11pfvjsODO4s6ym2ltZ6IDLp8Tc=;
 b=m/flBsG3dbCz46urrYWpUpqujZja1/P420CKNn6Qu3MEGumfyYMxoC93PhyGxvAJxb7n
 LdcRsoiFBJg+ro+2PDULDndpMByzB/Ox23X5kQZJ+2I9XAthWQv8TweX4JFESF9ojnEb
 96xCxpPe4t2T83xZED1zaZThnm8vBtzQvC04fjzUwj5UgamFCRMLQNkdyd7Vek5GKev2
 jkGIzo5yx/gjdIkKBDuUpBuyWHPIg/AwaVkNoaiNiQz0++yGbGehnCb1d/SEz9WCfY+d
 q0sdRVuK/p44ST8MCZXgc27BSUCCUzh0TBcHI+rAVTfzaCKDDn3548GnCG/egwJhXlFx qA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3keaf0j8mf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:26:39 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3Qckr011488
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:26:38 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 20:26:37 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kuogee Hsieh" <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/12] arm64: dts: qcom: sa8295-adp: Enable DP instances
Date:   Tue, 25 Oct 2022 20:26:24 -0700
Message-ID: <20221026032624.30871-13-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026032624.30871-1-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x0d2j7CJgWoU20mixnET3TDtJWa0uk_h
X-Proofpoint-ORIG-GUID: x0d2j7CJgWoU20mixnET3TDtJWa0uk_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=886
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260016
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The SA8295P ADP has, among other interfaces, six MiniDP connectors which
are connected to MDSS0 DP2 and DP3, and MDSS1 DP0 through DP3.

Enable Display Clock controllers, MDSS instanced, MDPs, DP controllers,
DP PHYs and link them all together.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v2:
- New patch on list

 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 244 ++++++++++++++++++++++-
 1 file changed, 242 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 2c62ba6a49c5..f35345115c85 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -23,6 +23,90 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "DP2";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_phy_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "DP3";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_phy_out>;
+			};
+		};
+	};
+
+	edp0-connector {
+		compatible = "dp-connector";
+		label = "EDP0";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp2_phy_out>;
+			};
+		};
+	};
+
+	edp1-connector {
+		compatible = "dp-connector";
+		label = "EDP1";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp3_phy_out>;
+			};
+		};
+	};
+
+	edp2-connector {
+		compatible = "dp-connector";
+		label = "EDP2";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp2_phy_out>;
+			};
+		};
+	};
+
+	edp3-connector {
+		compatible = "dp-connector";
+		label = "EDP3";
+		type = "mini";
+
+		hpd-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+		port {
+			edp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp3_phy_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -156,13 +240,169 @@ vreg_l7g: ldo7 {
 
 		vreg_l8g: ldo8 {
 			regulator-name = "vreg_l8g";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l11g: ldo11 {
+			regulator-name = "vreg_l11g";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
 };
 
+&dispcc0 {
+	status = "okay";
+};
+
+&dispcc1 {
+	status = "okay";
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp2 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss0_dp2_phy_out: endpoint {
+				remote-endpoint = <&edp0_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss0_dp2_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l8g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss0_dp3 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss0_dp3_phy_out: endpoint {
+				remote-endpoint = <&edp1_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss0_dp3_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l8g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp0_phy_out: endpoint {
+				remote-endpoint = <&dp2_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp1 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp1_phy_out: endpoint {
+				remote-endpoint = <&dp3_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp2 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp2_phy_out: endpoint {
+				remote-endpoint = <&edp2_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp2_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
+&mdss1_dp3 {
+	status = "okay";
+
+	data-lanes = <0 1 2 3>;
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss1_dp3_phy_out: endpoint {
+				remote-endpoint = <&edp3_connector_in>;
+			};
+		};
+	};
+};
+
+&mdss1_dp3_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l11g>;
+	vdda-pll-supply = <&vreg_l3g>;
+};
+
 &qup2 {
 	status = "okay";
 };
-- 
2.37.3

