Return-Path: <linux-arm-msm+bounces-31569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB2A976263
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D7B21F25037
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 07:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1203C18C90C;
	Thu, 12 Sep 2024 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iNHc0X2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C530189521;
	Thu, 12 Sep 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726125318; cv=none; b=AhrgWojscvarJgdR62XQQV31b9FE8wEe95ZmA0SDFjQJwAtDsLhtxJjMsu7t2C2Jfo1pOGMk2PFHqnMHix3wvWFwz05ZflIeLZIa2FKA6g/8uObvkhhSUdP5KvPJybUOKd//DSmvy/ANgOHSiS5uvCE0APL++53wSXnmf4g1XJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726125318; c=relaxed/simple;
	bh=QdByvg5luyGEWz0ZfUU4mgb8jetuD7enBuvpPvUBPhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W5lpJaogPAZLuLR0W74sA/yRTNEHjSPSirR55bZpKjmBr/Y33sb/CEXiFbA9IKQ00hqugJ30F0JBtCrnR/fWPw/MR4y59CsgyExMZIZYcZ/cDYqg68Q1EqoYWkopgMijTpiZoy2xGIU/PXHZpPraB21YkbGWxAGkQJOrdlqGUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iNHc0X2l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2KsZ5017077;
	Thu, 12 Sep 2024 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y9al72HJjUA
	zi5jV0xCf6DQhmdF7yIdnpgbkkUoQJ3k=; b=iNHc0X2lnX3lX7xyxwq8GFjthf7
	3aHFTiSf4SHDWfCbHrDQuI5ZjteuGdSdIg/Mi1cpvb4XmCv0LcqOt/+1KT36w7He
	whh8Su+/qsl0o5OvNhmyDgPna0KMzeWuFxBb1rraBXEYFl/ssBkuTpQmVlek0zly
	wKZbl9KjipRjTMaIHlOR1FIxMwnVDEAfOYC5C42AVjgiHqDV+DM0EnJWiNO+e0R7
	Lelykb7r23OabDk70tYRHWERx1As6QNJDU0DjnVxpBcc5rqD6nAvcXie8i1mV2C6
	eC4XJcysB0vo618hxG1b0L3TzYIM7DfAFQORUlHqJ2ydBgEEqK2Ro2X7xkA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6svbgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:15:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C7EtNs000427;
	Thu, 12 Sep 2024 07:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168ypm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:14:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48C7Etsi000396;
	Thu, 12 Sep 2024 07:14:55 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com [10.213.96.84])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48C7Esr4000390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 07:14:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
	id 5E5035B4; Thu, 12 Sep 2024 12:44:53 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
        danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
        mailingradian@gmail.com, quic_jesszhan@quicinc.com,
        andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
        quic_vpolimer@quicinc.com
Subject: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Date: Thu, 12 Sep 2024 12:44:33 +0530
Message-Id: <20240912071437.1708969-2-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912071437.1708969-1-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
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
X-Proofpoint-GUID: 9m5km63bENxXlkMPPxd5mrW5pA-0xdOu
X-Proofpoint-ORIG-GUID: 9m5km63bENxXlkMPPxd5mrW5pA-0xdOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120049

Document the MDSS hardware found on the Qualcomm SA8775P platform.

Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++++++++++++
 1 file changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
new file mode 100644
index 000000000000..85da693f1f6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -0,0 +1,225 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SA87755P Display MDSS
+
+maintainers:
+  - Mahadevan <quic_mahap@quicinc.com>
+
+description:
+  SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DP interfaces and EDP etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8775p-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    maxItems: 3
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        const: qcom,sa8775p-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        items:
+          - const: qcom,sa8775p-dp
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
+    #include <dt-bindings/clock/qcom,gcc-sa8775p.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sa8775p.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    mdss0: display-subsystem@ae00000 {
+        compatible = "qcom,sa8775p-mdss";
+        reg = <0 0x0ae00000 0 0x1000>;
+        reg-names = "mdss";
+
+        /* same path used twice */
+        interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
+                        <&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                        &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "mdp1-mem",
+                             "cpu-cfg";
+
+        power-domains = <&dispcc0 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+        clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1000 0x402>;
+
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        status = "disabled";
+
+        mdss_mdp: display-controller@ae01000 {
+            compatible = "qcom,sa8775p-dpu";
+            reg = <0 0x0ae01000 0 0x8f000>,
+                  <0 0x0aeb0000 0 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+            operating-points-v2 = <&mdss0_mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss0>;
+            interrupts = <0>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    dpu_intf0_out: endpoint {
+                         remote-endpoint = <&mdss0_dp0_in>;
+                    };
+                };
+            };
+
+            mdss0_mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-500000000 {
+                    opp-hz = /bits/ 64 <500000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-575000000 {
+                    opp-hz = /bits/ 64 <575000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo_l1>;
+                };
+            };
+        };
+
+        mdss0_dp0: displayport-controller@af54000 {
+            compatible = "qcom,sa8775p-dp";
+
+            pinctrl-0 = <&dp_hot_plug_det>;
+            pinctrl-names = "default";
+
+            reg = <0 0xaf54000 0 0x104>,
+                <0 0xaf54200 0 0x0c0>,
+                <0 0xaf55000 0 0x770>,
+                <0 0xaf56000 0 0x09c>;
+
+            interrupt-parent = <&mdss0>;
+            interrupts = <12>;
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+                <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+            clock-names = "core_iface",
+                "core_aux",
+                "ctrl_link",
+                "ctrl_link_iface",
+                "stream_pixel";
+            assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+                 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
+            phys = <&mdss0_edp_phy>;
+            phy-names = "dp";
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd SA8775P_MMCX>;
+            #sound-dai-cells = <0>;
+            status = "disabled";
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    mdss0_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+                port@1 {
+                   reg = <1>;
+                   mdss0_dp_out: endpoint { };
+                };
+            };
+            dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+                opp-160000000 {
+                    opp-hz = /bits/ 64 <160000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+                opp-270000000 {
+                     opp-hz = /bits/ 64 <270000000>;
+                     required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+
+    };
+...
-- 
2.34.1


