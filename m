Return-Path: <linux-arm-msm+bounces-86618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E0CDDE51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 16:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EFF83019194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 15:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F7932BF2E;
	Thu, 25 Dec 2025 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bfQJ1M2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29132B99D;
	Thu, 25 Dec 2025 15:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766676117; cv=none; b=WfqC4Bs0JgFfL2vRxi0pm3dAAgAk+CRQirqTDw4SorcFRbeJUiMG5PSXhdV0/vr4ofvOKPlvnma7vZPQanbf7EuEQwc1gIWnXpBTG8WOZbk62NcgLBOXaMfA/Nz9ZmdzG8VT9j7JnkEsIq7sIAaLuGh9LUA0wNfdnFJ0YGe5ikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766676117; c=relaxed/simple;
	bh=KA5JhAhk06D2AbCVn9FVl+UbdO4f/9VLESSdoWdkaoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a3KmuYoTubkUymajwVFEw5j0oNig5QwNwlpM/mXABsxkeJXWnz6wSfqMS2TrbmbXZ/u3D1Uc1bVwATSCWHA3koNyu1dz/27MgnG0MRaZaGZZRCXrNLWLA3d/Bu+YMzQKvCqE1aqo+IyWHfPjljJcEqDhMyoRwGao3IKx+1UE8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bfQJ1M2W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPESpTU2772283;
	Thu, 25 Dec 2025 15:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5tH3D4dC2eX
	fs8eNsjRRgluFza3CpQ/HZyk7lgwhyCw=; b=bfQJ1M2WswPyRjXeKzfBcw0cQYF
	EgOsQ8BHtQbSQExRtyx2b2WzNdHhJBjCWXOgzx+ZjTI683u3IOjsmTKh8WsikjwE
	+sC5GLNrFhLzq0yS7DER8IpAsZQxXicWcrtkdVR2+4xMgdwN7VKigFFOmIYLDjM7
	/1rnmJY2Z6RRFGZ1kISVjrkFSsDHQbTkNEt2Mau8CeV/4dUuUTFVClk2k2SybodW
	aBGwFHQ7drRBvByKMxyYVygQL7HhMdONir2S2CRUF5/06tYV8u3mdEcywWDeqArX
	TDmn/iStdn8WDP2/wxBhZTBVFfiYSeDmHtB41hihBVdiR/o8UISTpNwD/IQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p491jpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BPFLbgM006280;
	Thu, 25 Dec 2025 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn0fw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BPFLahl006254;
	Thu, 25 Dec 2025 15:21:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BPFLa9G006246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 8C65F5A3; Thu, 25 Dec 2025 20:51:35 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v4 3/5] dt-bindings: display: msm: document DSI controller and phy on QCS8300
Date: Thu, 25 Dec 2025 20:51:32 +0530
Message-Id: <20251225152134.2577701-4-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rBsu1bQ5P4_Wx256VzSCZjNcBEoFvs4N
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694d5684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=1lCBw_x746PEtCWBGlsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDE0NyBTYWx0ZWRfX3ISrOG81lyn/
 KuNmUjp8LFmnqRLWmlzbdFVV3QRvmyMdRk2OJ8aJB7mCybGqOPCBydB2qO69SgUBsR8nlAsxb0j
 c0nq9EJWvlgq9+GNcuvU8iJIjrALaghbRXhF369JWl2UkqaGCyV9KMOLjEEjnAUADYpBQa3j08R
 LKEqENgJtxw9WN3HqjjgR5w1bL7JuyprEtA8F9G53DWtJwRXG8K8QGB7/uNnD6Aq/q2BfBHuv+b
 G69hfXIqcH4qqpVsHuSeZNTrf9Lo/+fCRsRoWuig1gbWN6fZz/VPNRi2G5lxks86IT/BRb/DKGo
 63KBb+2L0ANLS1JPy7BjyGBuwGfY6vfbPyQLki0JlTDRYbpdmRkI6qGCFONvyEGxzpc6OhpVW7m
 KD/LUcOkbzNjCIpquNOAiPKYtqhEFaoIes/HU4KDuylovrPOzAqVnLhK44aE61eigycu37V3SJk
 5zLENYF7Z4dParlAeaw==
X-Proofpoint-GUID: rBsu1bQ5P4_Wx256VzSCZjNcBEoFvs4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250147

Document DSI controller and phy on QCS8300 platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../display/msm/qcom,qcs8300-mdss.yaml        | 102 +++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
index e96baaae9ba9..c41a86203e78 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
@@ -53,13 +53,23 @@ patternProperties:
         contains:
           const: qcom,qcs8300-dp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,qcs8300-dsi-ctrl
+
   "^phy@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
       compatible:
         contains:
-          const: qcom,qcs8300-edp-phy
+          enum:
+            - qcom,qcs8300-dsi-phy-5nm
+            - qcom,qcs8300-edp-phy
 
 required:
   - compatible
@@ -71,6 +81,7 @@ examples:
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
     #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -142,6 +153,13 @@ examples:
                          remote-endpoint = <&mdss_dp0_in>;
                     };
                 };
+
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
             };
 
             mdp_opp_table: opp-table {
@@ -169,6 +187,88 @@ examples:
             };
         };
 
+        dsi@ae94000 {
+            compatible = "qcom,qcs8300-dsi-ctrl",
+                         "qcom,sa8775p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+            assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+            phys = <&mdss_dsi0_phy>;
+
+            operating-points-v2 = <&dsi0_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            vdda-supply = <&vreg_l5a>;
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
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,qcs8300-dsi-phy-5nm",
+                         "qcom,sa8775p-dsi-phy-5nm";
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
+            clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface", "ref";
+
+            vdds-supply = <&vreg_l4a>;
+        };
+
         mdss_dp0_phy: phy@aec2a00 {
             compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
 
-- 
2.34.1


