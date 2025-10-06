Return-Path: <linux-arm-msm+bounces-76000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA31BBCF5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 03:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D2B18932F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 01:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1D41E25F2;
	Mon,  6 Oct 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RmfRqvt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B21A3160;
	Mon,  6 Oct 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759714789; cv=none; b=Deg7YZP3njoA4TEWHB+V54jMr5zuUHyH1mkI3MwDhsivOGPU+A+xGChRvqj6/RswP60NJRrszya2ng/rBi7NrVHH5MNtdKJUNjMUvZvqErpQ4b0GI/3bfj2ia6dNSg+JCLAu/ji8V5MRV569NDHCexRfaxH67VvBIUNiB0YugbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759714789; c=relaxed/simple;
	bh=KA5JhAhk06D2AbCVn9FVl+UbdO4f/9VLESSdoWdkaoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e/mf10/H1zk4b5vaK2Q0pS10/wK96a1Cv5vyeNSNVa34gImS0Nd4F/uczNBxUjWUAvr9IuTBuukTDPiBhuX6oQ1MBJ8Q47wv62yyK/udOi/ruOxa48rgnqcTAhLXWYYAxF/3cJ1De2qb8FqVp4XGJmfK478Nhn5X7WY6lRBFUwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RmfRqvt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NM5sK010692;
	Mon, 6 Oct 2025 01:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5tH3D4dC2eX
	fs8eNsjRRgluFza3CpQ/HZyk7lgwhyCw=; b=RmfRqvt/BczjHDnSSFb+4be2q5T
	pzcyDv6m5Dwjpz0ajvBuuwvEf6ZABMN7YUJN47lTE4ZUVCQJgI4fErxh8BDiMowu
	Pz4T7SsaaX1jfxY14WwkkZpIb2H3cFDFXEyPBUdjs2Z15SrxC4VBr6Rlwq6mIe8q
	/HrkmJwXIgfroUp3da8mIKFrz/QrBDcH4XY4iFkwpI/Uud1dAjang5dNMA1NtzPH
	/Xui4NHRs0R6PD/F/EvJ6jcVmkGAluU6rtG8nV2ffwpvG4dIwlf6yuXroUuWbe9P
	/PH0bGR1XFukLbxg9N2NKgC+6O0xgiLI+fK3sSj6zx4N7KAHFFu15Srs3YQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn302f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRpX003774;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dR2F003740;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dQLI003736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 4DBA759C; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
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
Subject: [PATCH v2 3/7] dt-bindings: display: msm: document DSI controller and phy on QCS8300
Date: Mon,  6 Oct 2025 07:09:20 +0530
Message-Id: <20251006013924.1114833-4-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX463kQrfQRsC0
 T6mLtaZy796O7S9a+yGyl6UZCqbxnCn011O0SBoxANWY4T54hadATfa0rRZCErnKqjEVjgUd/Yi
 K5uf9awjbP6dVo7+V5uG3NYVyvvZRUVMOalF4D7oe1FCjXP4iFOo+5G4hTIZapqkb2j2a+yn30M
 u9bIpC82yjSQn1nSp9gOWMKtn+uy0VApoTw28YKTI/bFbs7ku969Fen4ZY4CkCfPin+/XK61zW/
 XXJ+THS6TcFl8snTzO5GctxZm1beveVAhoLdaxKZgmQN/RXzf1r0tBnrdvfrrJigGi6jwrXxEVK
 dzDqkH8oRLUjB/7gS9clDnUd7hOHFFZ3O6OwFXwHH6GPhrzz5tGRXs+7h5g3cTFyg/f8PQRwnrh
 67eZY+Kjwq+l8rmsfnLHn7/c/DeJWw==
X-Proofpoint-GUID: 9oKx0IzBsjaBCTQCirDmp3UsYiQLXoyB
X-Proofpoint-ORIG-GUID: 9oKx0IzBsjaBCTQCirDmp3UsYiQLXoyB
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e31dd3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=1lCBw_x746PEtCWBGlsA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

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


