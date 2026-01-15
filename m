Return-Path: <linux-arm-msm+bounces-89177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF62D23A30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B970C30A981D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1050335CB96;
	Thu, 15 Jan 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8n206Dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTPVX16V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8735BDD7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469324; cv=none; b=sYydGremNglfH5iMh0i8hR+uHvplt3iKrr8i/0Y8KBmRykX2Sxs+DK5zZVQTk1S2nwrqg8g8c5t66P77rbHu9nUCnpzGB2Ld/w7HodmxNoAuxrYFrh4KS22KywPFCPxNqOT9Sg2m2Fen59+nFtanPbEb7SJBVFw/lLM+FYQnqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469324; c=relaxed/simple;
	bh=tNQoNBsoM8uyRsc2L0d2J2aq5cF2cTHJYVdz78ZDCEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jel+y2KUm1Yfla9t+3Pq73dGes3e3j5b5c3ySG9MVaLA8OLgm9/hnbxLVDGxjwP3jM8dsY1GpXTB3ngIhRR8i0vyBeTmDM/IcATCWih3iEOYAksFkkA+8cPNR9dkYpFdA8vyIGoX5juiTL3fUa//h+g/WHH+Usvc5nvknUbVrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8n206Dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTPVX16V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flTm2074286
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uHFif/BS3PW
	PBJexCizq7O/EFeVP1u2QBncpGrCNcSI=; b=E8n206DtJZisfHXswSRdf7rq2wd
	xEJOTVjJh+0P971gTllR09ksReu4CfykgWZI9TXAGSG/mk97wIfEuDFWSagWdG2x
	neQf7l9x3ZGq99xn5IUQTKc0mKKv9wDZwPDtlysBgNWIR76uZy2ev5UzZw9NeEhQ
	5hIbyM1ircA35kE1pHG/JGqmPEhSKo+VcaVkFDx8v1IglVbs7BiphUvSSkzKXF9a
	DcAvOW8KZKOdBGdDECIZ2E5mrdQHST0bB0yRnSz8eOP9vnef1fKXfz1oPDMfM8SJ
	S3b+ORTOiK0QmiBES8t4xcQV77w4WLFdkUHnk86Sv/ssBUOr3Kf+hy6RJgA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9hy7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:28:42 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8888447ffebso19898496d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469321; x=1769074121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHFif/BS3PWPBJexCizq7O/EFeVP1u2QBncpGrCNcSI=;
        b=jTPVX16VY7OPT6YbjPx6RRNsHdYrG5BEsRtrOILVjPQFwuNp2iUYOpJFKYu4EU47Fg
         v1W3oz9H/MCkJbCesDJuLhvlU74lWAp8qlxC9yYmWizxA2Fdi/1FpAShojZ6LXbL1aJw
         UsoxMIfibeKlCzhlcSNkO2TkLTxrKYWlH6SfqTZVbKFQmqPzDa/SAfS8HNrxuYTUxNOm
         FQyNnMQaxnODm1g6cpAEyA/GNGV6R9U+7XsIwCX2wik66p6lF9/JQmLgeG8K9x+sDuCh
         c5rlcOzkbHi8ouzcuyjStmZkcne9d42CKrOFCZIOSCPtiTzbochNT8mKqAkPJXRSadza
         UWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469321; x=1769074121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHFif/BS3PWPBJexCizq7O/EFeVP1u2QBncpGrCNcSI=;
        b=mjxC0AkPcjI1l8LfjACrwSaeRcAOlUEuMJ9w6X87aq4BX1Uv0JGp1l/TOM9bSey+95
         JksKMOn1WJu0beW4wmQawwe/0T7Dfc04RnGOZ4oXD4H49TwkY3xbQ5jGAukOzleNXYbP
         TLbDHydjojHwvjIPhUeQtVLRToUpm/vK+wo0qimM7Gb7jEXqnNcEzheTY9Bj8gw0Z/X7
         W3ACy4S1MhmBBr63YFsNuAIpeVHViChUAe8bUCh/CGJ4Oj2lYBI4FkH25zNcT9iJuwqU
         uZtYQnKHW3vuzkLWSeUUmC88rWjl/zEZeBqatx/cZLCC3ypHMGJRwyqUqlBV4YC7F1xE
         JfGw==
X-Gm-Message-State: AOJu0Yy5hlJQwDANafpzlv7drMjcR/vyAHUw1Llsxkun5Q7J8/dJpZ5R
	g0mpu27emOsZm87Dma13HjyRpwgjUSPyV8nbMtiCkMMnDiYqa6lp/MWl2hxTfZdpO3uShLjTcY8
	mKvY6OpdNq5QN26P4Q44lTCWZ3TOxO65+zRKNR+yaYmITlh+M8tTHdNhyOp1LrQSyWIBP
X-Gm-Gg: AY/fxX7lzeNtVczEdCsAB23L2AmkgiOOQAzTnQLWVpx8hw0kvk3abah+9LkVBPA3WZs
	6/SXEsPpuIMVW/EDj6pEmeXC1XvXXrCvHv0cYapcm+Td9Etci9M8pjsg3tLJ5BPaMJHYlk7Thzp
	lqFKSfK7uqHs5RZC/2NxSp3EYDJWff8+IFEEgOH/DSwNkOVIKiJLgZ5wtsPQiemGUYLqaaS4sGz
	TxCDHvgTqGNSruvBwNYLuwI3zO9HstaNiq1LvzcdZbAvqWWwYLnxoTxhHy6CDn4oE5oOQzlUItr
	NysGPJ4c6i3OE3sX7gQqhH5zfa0Rz6B7Yw5+lD5Wqh+utNlIWKSouz5tg+GRngKgsNFL3Esuixe
	nMWljiSjbOWw8iw4gdS+MCUtHuvckZcAkMBvtqysGn6OiASVfTnDTY9Qs2P+crA4/418=
X-Received: by 2002:ad4:5c48:0:b0:889:d7f3:3a5f with SMTP id 6a1803df08f44-89275ae050cmr63618176d6.6.1768469320860;
        Thu, 15 Jan 2026 01:28:40 -0800 (PST)
X-Received: by 2002:ad4:5c48:0:b0:889:d7f3:3a5f with SMTP id 6a1803df08f44-89275ae050cmr63617826d6.6.1768469320399;
        Thu, 15 Jan 2026 01:28:40 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:28:40 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 04/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
Date: Thu, 15 Jan 2026 17:27:41 +0800
Message-Id: <20260115092749.533-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: L9l4LZ1bPSUh1jHmc_3x2B8-DShWpcr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX4iWiiIT5GnZ4
 mdy6udqkpY47+2qTA4LNYfVIw/Lc8M5gq2mt5W0CDdNPCMLsqki37DJE2pQiyjrIyhlZc0qStqX
 NyNk0nQpaGZeQhkgvvolypHhzJxapz4Kbyqg6ZajgVAobHNpQPI/MrEiS6CovRLahhO4CUmDZuw
 ZdP0/B2BUi8ecGRi0XJjDvQ99m7O886f4OonLRekOhtyf7roMzfrBnlUSCX5tAZo5/MaedvPA21
 hdq/eN3u/INtbTf3pHfshcQoYPHRO3RmBSy4LXxQd0iNgr0ji5sGddd8yFA85j8NqrqIgSIGmip
 v935y7BBq8NLvetFf09Zp9CFGngdpZnsZXOmEhli0HijME/98f4teAaefVUPnicy0Fgx5nCdKDu
 SdlNimtB75zA+gOSrg2gXbSi32b0YO2Ik1JyrrD5WqCMTHIiM9BIXSBZJxiZakOLNwrt2RCnLJl
 CedmdztUWmhBvL6ZocQ==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968b34a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: L9l4LZ1bPSUh1jHmc_3x2B8-DShWpcr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
Kaanapali has significant register changes, making it incompatible
with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
new file mode 100644
index 000000000000..9f935defd6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -0,0 +1,297 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,kaanapali-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Display MDSS
+
+maintainers:
+  - Yongxing Mou <yongxing.mou@oss.qualcomm.com>
+  - Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
+
+description:
+  Kaanapali MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks
+  like DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kaanapali-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+      - description: Display AHB SWI
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dpu
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,kaanapali-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dsi-phy-3nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@9800000 {
+        compatible = "qcom,kaanapali-mdss";
+        reg = <0x09800000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&disp_cc_mdss_ahb_clk>,
+                 <&gcc_disp_hf_axi_clk>,
+                 <&disp_cc_mdss_mdp_clk>,
+                 <&disp_cc_mdss_ahb_swi_clk>;
+        resets = <&disp_cc_mdss_core_bcr>;
+
+        power-domains = <&mdss_gdsc>;
+
+        iommus = <&apps_smmu 0x800 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@9801000 {
+            compatible = "qcom,kaanapali-dpu";
+            reg = <0x09801000 0x1c8000>,
+                  <0x09b16000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc_disp_hf_axi_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&disp_cc_mdss_mdp_lut_clk>,
+                     <&disp_cc_mdss_mdp_clk>,
+                     <&disp_cc_mdss_vsync_clk>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-156000000 {
+                    opp-hz = /bits/ 64 <156000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-207000000 {
+                    opp-hz = /bits/ 64 <207000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-337000000 {
+                    opp-hz = /bits/ 64 <337000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-417000000 {
+                    opp-hz = /bits/ 64 <417000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-532000000 {
+                    opp-hz = /bits/ 64 <532000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-650000000 {
+                    opp-hz = /bits/ 64 <650000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@9ac0000 {
+            compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x09ac0000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&disp_cc_mdss_byte0_clk>,
+                     <&disp_cc_mdss_byte0_intf_clk>,
+                     <&disp_cc_mdss_pclk0_clk>,
+                     <&disp_cc_mdss_esc0_clk>,
+                     <&disp_cc_mdss_ahb_clk>,
+                     <&gcc_disp_hf_axi_clk>,
+                     <&mdss_dsi0_phy 1>,
+                     <&mdss_dsi0_phy 0>,
+                     <&disp_cc_esync0_clk>,
+                     <&disp_cc_osc_clk>,
+                     <&disp_cc_mdss_byte0_clk_src>,
+                     <&disp_cc_mdss_pclk0_clk_src>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus",
+                          "dsi_pll_pixel",
+                          "dsi_pll_byte",
+                          "esync",
+                          "osc",
+                          "byte_src",
+                          "pixel_src";
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
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
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                        remote-endpoint = <&panel0_in>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-250000000 {
+                    opp-hz = /bits/ 64 <250000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-312500000 {
+                    opp-hz = /bits/ 64 <312500000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@9ac1000 {
+            compatible = "qcom,kaanapali-dsi-phy-3nm";
+            reg = <0x09ac1000 0x1cc>,
+                  <0x09ac1200 0x80>,
+                  <0x09ac1500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
-- 
2.34.1


