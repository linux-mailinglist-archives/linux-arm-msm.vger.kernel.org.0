Return-Path: <linux-arm-msm+bounces-54595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D61A912D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 07:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90FFA44228A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 05:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB661FA14E;
	Thu, 17 Apr 2025 05:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFegqenT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A18F1D5CD6;
	Thu, 17 Apr 2025 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868384; cv=none; b=QZb0nSi2/QXcWN3oy70YPtpo7Be5pWbm98mjZt3A6k/W6XU4H3BiatsfPN7iyKUnmUePDz96jGFJlLHgCSVKlwALGqoRo7ZmYsE1YJkoBb0Nbfxia8eKotoHYPGjDj8+trj+kmNy4tzbWfmXb+Cgbi+G4LdgE7g9QSkt2ORhDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868384; c=relaxed/simple;
	bh=uyzdrN5eT8ElouY2vsNo5MwI9HmdefURBiolF1twyyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uhh/Eu3tgAxTvRMItcSnccBwmVb2UMKaSX3ywEPkQzQVi+O5T6I+Pk9QAKS1zNaZH7nJvvtyo6RZ4kFV4Szjfk8LCyWTOSHEFzx7Dn3KeU11PV6v3ZYsHtjf36GEtmO2PxWhWxuWKq5XfIVqdxStXl2pVf+sGqqNbtHXLZ+2MQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFegqenT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GNB8gf029862;
	Thu, 17 Apr 2025 05:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gx1s5fwKUyD
	1ozSjfLwGKf/tz6tYUmV6wpsz4SvWKaQ=; b=HFegqenTQEHECe6F9OIZlwXMVvv
	OLCiDqMwP/4bharhNGKuC2HjarjHoKxVl8IVsn+vqKhwiOofaEoBUKMx6UZgimTb
	fXgxIr8mwsg6swKwM1w5jbaxM9dpS9QW+tLsVX2XBEzcibS4lsIgqLKFNwM38oOS
	VgFF+E3uu7utDvAuWySKlE5W01DCfO1Ybr0tf16Tk843cxLnfQTBHbUCqQmNxyvL
	7wFOBg94WuVVJ+m0QJqDVwkJKx62Q0TlIQIbJCWmjZYweTRmV+qzBN2NJXCNzcO4
	TSJd9ju0hUsXos03XPwNIP9vUylA3gMlyDIEppD2NTn+brqquoxjBGTRvhg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5nkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5YLcV019725;
	Thu, 17 Apr 2025 05:39:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 462f5dnug9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53H5dE8c023909;
	Thu, 17 Apr 2025 05:39:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53H5dEUa023905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:14 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id A612F596; Thu, 17 Apr 2025 11:09:13 +0530 (+0530)
From: Ayushi Makhija <amakhija@qti.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH v4 03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
Date: Thu, 17 Apr 2025 11:09:01 +0530
Message-Id: <20250417053909.1051416-4-amakhija@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68009407 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=MZXi4iItCOKKXX8d79QA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H9HGb48QPiARaRBQeP18MIIUb8eTwDlR
X-Proofpoint-ORIG-GUID: H9HGb48QPiARaRBQeP18MIIUb8eTwDlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170042

From: Ayushi Makhija <quic_amakhija@quicinc.com>

Document DSI controller and phy on SA8775P platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 181 +++++++++++++++++-
 1 file changed, 180 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 5fac3e266703..1053b3bc4908 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -52,12 +52,23 @@ patternProperties:
         items:
           - const: qcom,sa8775p-dp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sa8775p-dsi-ctrl
+
   "^phy@[0-9a-f]+$":
     type: object
     additionalProperties: true
     properties:
       compatible:
-        const: qcom,sa8775p-edp-phy
+        contains:
+          enum:
+            - qcom,sa8775p-dsi-phy-5nm
+            - qcom,sa8775p-edp-phy
 
 required:
   - compatible
@@ -139,6 +150,20 @@ examples:
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
@@ -186,6 +211,160 @@ examples:
             vdda-pll-supply = <&vreg_l4a>;
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


