Return-Path: <linux-arm-msm+bounces-41221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA49EA913
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 07:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3D518842AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216BE22CBE7;
	Tue, 10 Dec 2024 06:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nbQgBAeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7B22CBCE;
	Tue, 10 Dec 2024 06:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733813731; cv=none; b=pgC1aF8ExW2sRAgd5BFbYxvd/wMDNp1eeg4pgNH+MzBvDD2Yd/vGT9fztJSFs7EaCdUDLyBBc5YmExLtq9nvTQLR23VpyaNbaMLuDQU8mFC6TaxIf7Nk2b7ArDRBRF9fLrLqpKj1k5cXu4cutQkZxNrcfuUX3O0YSMGvdrOFc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733813731; c=relaxed/simple;
	bh=85PA5DIp2AwR4I9JoYC0vuUnFNx1q824edFnHSWXHFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iK4vZbnK0W4cyy6qbJ1Ll3WLQLZNkKUiKEoZx3GhTS6T1PQGGLR7BejMazQcCRPIEXuGwKKb6MrLjSo+LGBbqJLBHyV0C7f4Ut7u4v31JajxpzpZXjnOO/ZSH4/X70Gi+Pg4TQXcVkjt8Kz3h7F0x/QX5JhoUFJV5v23UqubKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nbQgBAeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9HTig5020616;
	Tue, 10 Dec 2024 06:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8US+SONMvEi3EIKNSKMYXZJcYxlUW2tLms8MtTTtg4=; b=nbQgBAeoDmH46l5T
	yhkdBqF+GeETpPEbrsf6YsABRI2LgY+iIMiV6SGYfvg4W/Bs4qX4UReg41UxDuYk
	VaTxpsgm8pP6z42mPo1Mzmmun0JdOUmjpXn5qO050rlPlxx0CKWlqJasMe3vQPcr
	+pqKYH8dtZrti685+yXxX65KYCKajOpWvf+4/ktv/I7NsuqQx8ShNEg5oZj4hAyR
	dmoDHBlZAgVYvReJFlz7EV6NRCtRbfrmDYFSukoUF3Jz9AorHgxo1iR2iRGSS4/S
	pHzEwbTVwBkR7COhopjm1QY1OQRw4ZiqIrFwszWUt88w1c685h8Uir3r3wZBqUPF
	ZGclrg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgqffk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:55:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA6tD4T021274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 06:55:14 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 22:55:07 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Tue, 10 Dec 2024 14:53:54 +0800
Subject: [PATCH v4 3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-add-display-support-for-qcs615-platform-v4-3-2d875a67602d@quicinc.com>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
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
        Fange Zhang <quic_fangez@quicinc.com>, Liu Li <quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733813686; l=11409;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=YJ0SeX71hLf9uhYJMEOhHzO1PC6NGN1x4orohi20NFM=;
 b=5geWEKTKQnQW9yUdfHrGTqm4aUVesp8GIrxMi9Y1m4zJ2sFGdTfJ7RcBzH1xhgEax9zXFmXhg
 Yeimu0yCmWHBGhqUd/9B+1qdSxGTLO8lhwyxmo22CzljVpaXM0lgvf9
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 808tXAHAfr1kVgd7PXlSZ3slhKA3XxE-
X-Proofpoint-ORIG-GUID: 808tXAHAfr1kVgd7PXlSZ3slhKA3XxE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100050

From: Li Liu <quic_lliu6@quicinc.com>

Document the MDSS and DPU hardware found on the Qualcomm SM6150 platform.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 108 +++++++++
 .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 245 +++++++++++++++++++++
 2 files changed, 353 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b4f4371722182e89f115c2add205b8a78ef2e9a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-dpu.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6150-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6150 Display DPU
+
+maintainers:
+  - Abhinav Kumar <quic_abhinavk@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm6150-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display ahb clock
+      - description: Display hf axi clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm6150-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&dispcc_mdss_mdp_clk>,
+                 <&dispcc_mdss_vsync_clk>;
+        clock-names = "iface", "bus", "core", "vsync";
+
+        assigned-clocks = <&dispcc_mdss_vsync_clk>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf0_out: endpoint {
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf1_out: endpoint {
+                  remote-endpoint = <&mdss_dsi0_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-19200000 {
+              opp-hz = /bits/ 64 <19200000>;
+              required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-25600000 {
+              opp-hz = /bits/ 64 <25600000>;
+              required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-307200000 {
+              opp-hz = /bits/ 64 <307200000>;
+              required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9ac24f99d3ada1c197c9654dc9babebccae972ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
@@ -0,0 +1,245 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm6150-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6150 Display MDSS
+
+maintainers:
+  - Abhinav Kumar <quic_abhinavk@quicinc.com>
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
+  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
+  bindings of MDSS are mentioned for SM6150 target.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm6150-mdss
+
+  clocks:
+    items:
+      - description: Display AHB clock from gcc
+      - description: Display hf axi clock
+      - description: Display core clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    maxItems: 2
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm6150-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        items:
+          - const: qcom,sm6150-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sm6150-dsi-phy-14nm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "qcom,sm6150-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        power-domains = <&dispcc_mdss_gdsc>;
+
+        clocks = <&dispcc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&dispcc_mdss_mdp_clk>;
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x800 0x0>;
+
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sm6150-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&dispcc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&dispcc_mdss_mdp_clk>,
+                     <&dispcc_mdss_vsync_clk>;
+            clock-names = "iface", "bus", "core", "vsync";
+
+            assigned-clocks = <&dispcc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_CX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  dpu_intf0_out: endpoint {
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+                  dpu_intf1_out: endpoint {
+                      remote-endpoint = <&mdss_dsi0_in>;
+                  };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-19200000 {
+                  opp-hz = /bits/ 64 <19200000>;
+                  required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-25600000 {
+                  opp-hz = /bits/ 64 <25600000>;
+                  required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-307200000 {
+                  opp-hz = /bits/ 64 <307200000>;
+                  required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sm6150-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc_mdss_byte0_clk>,
+                     <&dispcc_mdss_byte0_intf_clk>,
+                     <&dispcc_mdss_pclk0_clk>,
+                     <&dispcc_mdss_esc0_clk>,
+                     <&dispcc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_mdss_byte0_clk_src>,
+                              <&dispcc_mdss_pclk0_clk_src>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>,
+                                     <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi0_opp_table>;
+
+            phys = <&mdss_dsi0_phy>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi0_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-164000000 {
+                    opp-hz = /bits/ 64 <164000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sm6150-dsi-phy-14nm";
+            reg = <0x0ae94400 0x100>,
+                  <0x0ae94500 0x300>,
+                  <0x0ae94800 0x188>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.34.1


