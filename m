Return-Path: <linux-arm-msm+bounces-87344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F813CF1052
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 14:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 797D9300295B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 13:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4D630E827;
	Sun,  4 Jan 2026 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AjMWXtzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0382E7F0A;
	Sun,  4 Jan 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534316; cv=none; b=T00adJcHUNg0RXjL6byYhv4gB8CwYAe0+nLpny/UF7Q9ybkvB5qDimYedtg17Cm6umUuXSHrvQRVrdjJCTOeLrEjyIV//2QWC+dtI0eaGgVuDaUJWA/7KRMXMHz3DclSbhrFiCn9N61P2pa5Ab5V2p1EecQpQ4rXopSdgitdn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534316; c=relaxed/simple;
	bh=xNziMoiW2Ji2BcUOnYJl7fssXyppUIWYYnxE5bSyIMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SmklF4rVJ7OqiesKCx9nG+ptmg51qKFhTgyA2NK6t+KH1brbhr1Om7hccnm2DHJSa0NFn5cX/l1tEebvUAhdBiSi7ASy8OSUYmj5XR4dQexmldKsQoO+u3xlc2Tr1F4tTthej2PZePZh4F4VxttbypNb7g5cVZdLrSFQeh6LyL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AjMWXtzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6040igun2741463;
	Sun, 4 Jan 2026 13:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iBt9H1Dn4cH
	MOA2a4Vwc0OGg3c6COUtqEx7X4/tgLN0=; b=AjMWXtzdVNV2IIUgnKHZAYNMMnA
	lkM2oWCXgAAYq2dGjYRHBDR4nGmKUchOSe2vPFFjRq3SICM87j8QT5cyGR6jwkYX
	pqc67GaOulRQTvY5xDGrirejbzz7bzLKmiDO+1TfevXYcXHGhnEAlobCXB34n9hM
	xqUo9mSxkWSYMBcmw5pBOMHI7GW9RjEexf8i/VjJOlIRXAyUh7Ue3ChDe7pJwS0N
	5XZ3vJIrxUkzIXcOpnvIw5Iz8x+yM9Hr2/qvvzgqYjoehM7CD6nlkw8F/gPhxbJ8
	kI2hTZTQRY7bT/7tn8/S4qi3byvlBRLKW2EvGLqB9YD3S6lGV4cqYvsT7bg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9ha0ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 604DilfY017232;
	Sun, 4 Jan 2026 13:44:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kkx3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 604DilKt017207;
	Sun, 4 Jan 2026 13:44:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 604DilHg017197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 920155A3; Sun,  4 Jan 2026 19:14:46 +0530 (+0530)
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
        quic_vproddut@quicinc.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/5] dt-bindings: display: msm: document DSI controller and phy on QCS8300
Date: Sun,  4 Jan 2026 19:14:40 +0530
Message-Id: <20260104134442.732876-4-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260104134442.732876-1-quic_amakhija@quicinc.com>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDEyNiBTYWx0ZWRfX3krp3hQj98v3
 Bub6omyySLwsAyaN/njMMuKM3Zzu+lN6iuFYT3GmO5nr60KPdHLINH3BjDYg8Go/TpdHqRjC9N+
 aBP7uih/e3KPGKLVTf0b7etxisBsYmrA/keUJAvI8o/uLG+Sqy6KqIzIPAYrxNiYRADdcAz3Mou
 u7wnfcAxC7yj2Gz6JTXL8ztSxzJkpo5QKIrxWx9kBtGhALF59oZe5bfyVTfKfysuAKFwNQhP85h
 e1FFJc5Byhnt98q+LFRqK9A96SqnaWsSbSCPm41oyFWmERoCxZkB9bDUNjNkLmWVVzwa9+SAHaf
 TrlwxNEQujtPJy5l7AgQrPUaRr2svVO2Wk7aejTMQX1++aAh6Wh1n1jFwYFyulAwwud5uYaDMcc
 9f+XuDszw6jXhqKfdeSZ3T0BzZH3PnMO0F5VpfVCV+ljf4KmGle50jIcXtzL0SbQVacFIPRiw67
 5Whn2n6eYpkl27IuTqw==
X-Proofpoint-GUID: uMXVJOBLy397SkyAzl5FI7w1JzjLaJBg
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695a6ed3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1lCBw_x746PEtCWBGlsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uMXVJOBLy397SkyAzl5FI7w1JzjLaJBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040126

Document DSI controller and phy on QCS8300 platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


