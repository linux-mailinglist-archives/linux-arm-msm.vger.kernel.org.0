Return-Path: <linux-arm-msm+bounces-50961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94FBA5C117
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 13:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3ED16EC14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EABC257421;
	Tue, 11 Mar 2025 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Paaieuz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E3253B46;
	Tue, 11 Mar 2025 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695917; cv=none; b=XjWg5p5hp0yXytn5RwKTpf2GI8poZFFwWRFEBxZTHnD6zL3VuR5bmosFLbh1cLpQ/Z8Bim/tfzLskSXtGchqRGTMi+RKCWPO1hk0ScPrl1x5+Zpq35fZuLWvnn8BuoFFLE6amV9btmnj+a4CpXfqGzjMf+6x+51QkyGVM1z5Ylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695917; c=relaxed/simple;
	bh=LQr+cksbrQ+Jjn6R2CqhblLUzvS86rGKQUj0qjIqyEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bLg8Aool5spU7xBc3HJjUnSRpP//710QQHXfgSap3Qs5ZJzZmEWvDtVScSw8NBWpGce/xfDN9mKrU0nNRr5Yy8Jj1kLder1Ak+uD2EYJFP5Dj/sWry/oj3BnaYKxwOjydyG6408gFIKHt8D6nEicfKVjZN1g0joNjbUPzW9MLPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Paaieuz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B8KH6H012249;
	Tue, 11 Mar 2025 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yUnlFX/Kkhs
	8IjZRDOpBpuwdBA1C6hYbMl6rzg7Maas=; b=Paaieuz7im1fcVngUNLCyLTXPiz
	oO4Fi7Jth2ecgmZziJUDeQ7A6MIWKmP/+IxvVQ2BOS/LsTS2hmb7h4ABsUvHwEku
	XKFsSs5oNIrirXOfx1X0+k7/Nw0ZhWse+p7ZDpey5HLWBbePrLGCsNd2VKD9hy10
	M407QxKCwYRhh3i/d3bleVAPzGC46PYvJ+vpPs4Os9OkBdlVi0obUXYl2P029iyG
	R4TTt30M2Ir64BX5UJJl7wOzO/s9FanL80YKTnk48ji2UlasJcJ4RVDWYXqRtcOJ
	e+UiQYx0VdS14WSSDBWam9eC3CB9HtsLaum4vx0VjHopWMbRFB/wFuN39tw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyugh5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BCOnhk008104;
	Tue, 11 Mar 2025 12:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn373vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:49 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52BCOnxd008073;
	Tue, 11 Mar 2025 12:24:49 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52BCOm6s008065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:49 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 2B62A592; Tue, 11 Mar 2025 17:54:48 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH v2 03/10] dt-bindings: display: msm: document DSI controller and phy on SA8775P
Date: Tue, 11 Mar 2025 17:54:38 +0530
Message-Id: <20250311122445.3597100-4-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67d02b95 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=1_X3neIigW5RjHwRquYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aNslmdGZ5MSzm8GOIw-Ej6nvY9N31sXX
X-Proofpoint-GUID: aNslmdGZ5MSzm8GOIw-Ej6nvY9N31sXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110080

Document DSI controller and phy on SA8775P platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index a90a8b3f1a9e..628ca68871f4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -52,6 +52,26 @@ patternProperties:
         items:
           - const: qcom,sa8775p-dp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        items:
+          - const: qcom,sa8775p-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - qcom,sa8775p-dsi-phy-5nm
+          - qcom,sa8775p-edp-phy
+
 required:
   - compatible
 
@@ -131,6 +151,20 @@ examples:
                         remote-endpoint = <&mdss0_dp0_in>;
                     };
                 };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi1_in>;
+                    };
+                };
             };
 
             mdss0_mdp_opp_table: opp-table {
@@ -158,6 +192,160 @@ examples:
             };
         };
 
+        dsi@ae94000 {
+            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispc_byte_clk>,
+                     <&dispcc_intf_clk>,
+                     <&dispcc_pclk>,
+                     <&dispcc_esc_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&gcc_bus_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc_byte_clk>,
+                              <&dispcc_pclk>;
+            assigned-clock-parents = <&mdss0_dsi0_phy 0>, <&mdss0_dsi0_phy 1>;
+            phys = <&mdss0_dsi0_phy>;
+
+            operating-points-v2 = <&dsi0_opp_table>;
+            power-domains = <&rpmhpd SA8775P_MMCX>;
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
+                    mdss0_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss0_dsi0_out: endpoint { };
+                };
+            };
+
+            dsi0_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss0_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sa8775p-dsi-phy-5nm";
+            reg = <0x0ae94400 0x200>,
+                  <0x0ae94600 0x280>,
+                  <0x0ae94900 0x27c>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_iface_clk>,
+                     <&rpmhcc_ref_clk>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&vreg_dsi_supply>;
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispc_byte_clk>,
+                     <&dispcc_intf_clk>,
+                     <&dispcc_pclk>,
+                     <&dispcc_esc_clk>,
+                     <&dispcc_ahb_clk>,
+                     <&gcc_bus_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc_byte_clk>,
+                              <&dispcc_pclk>;
+            assigned-clock-parents = <&mdss0_dsi1_phy 0>, <&mdss0_dsi1_phy 1>;
+            phys = <&mdss0_dsi1_phy>;
+
+            operating-points-v2 = <&dsi1_opp_table>;
+            power-domains = <&rpmhpd SA8775P_MMCX>;
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
+                    mdss0_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss0_dsi1_out: endpoint { };
+                };
+            };
+
+            dsi1_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss0_dsi1_phy: phy@ae96400 {
+            compatible = "qcom,sa8775p-dsi-phy-5nm";
+            reg = <0x0ae96400 0x200>,
+                  <0x0ae96600 0x280>,
+                  <0x0ae96900 0x27c>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_iface_clk>,
+                     <&rpmhcc_ref_clk>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&vreg_dsi_supply>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,sa8775p-dp";
 
-- 
2.34.1


