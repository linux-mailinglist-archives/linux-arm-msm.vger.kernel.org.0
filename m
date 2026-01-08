Return-Path: <linux-arm-msm+bounces-88028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A27B8D03CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90414302BF52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814136E492;
	Thu,  8 Jan 2026 08:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqaCtEoy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wf2cK6or"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011435F8CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862689; cv=none; b=GMjG/UOJLe4NDGq3QzspOerSwIMht6QAX5dvud7bZA7m4pK0bn842+kr+9bHPLiOcQuS1dSsy5+6sjDUvtMkmuP283YqqDdkHkg9KqQs/w6hlsrv5XKdn7+QCfsl7/zZEV/h5dB8ZYbDm/sX4lKQpEfspnsF4M3lWscjaqGf03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862689; c=relaxed/simple;
	bh=tNQoNBsoM8uyRsc2L0d2J2aq5cF2cTHJYVdz78ZDCEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gTSgwQ75ZIJbXrqyuX50dodEuwdzdaFqrGVzCWCVicuHtmPDfV+JsPDpkIlzifYFk9LjAYzEwYkdwFPXbGD5/DcU6+/Z0qafbZVW2wiGvlHVpNU0oLgYV+qBLWotT+e2M7E0r0XkY48okPpcvXvHZy0myOBPv3UHlaGuzWeY+BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqaCtEoy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wf2cK6or; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088hBIl4049342
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uHFif/BS3PW
	PBJexCizq7O/EFeVP1u2QBncpGrCNcSI=; b=BqaCtEoyrq4Whv8HnGpdjyKsBCZ
	hX8foeydJIS7DQCQO8jraWHpVVowmj9XA5lp/gWk2M3EcGfIRMcQROPzfgpAiV8O
	Gd1E9LILi8deD79fcRnyxpnXRcypfddQcISC02Qp8fT9b4k/L0GKVxfXyvNqszU/
	7qmg9uKQ6IEK7EHnSvUYQ44nK05BTCMTw7C8kByXVu4RTIcgbnOpWoFbMb7zP5p7
	RZjqm1FianpHzkI/lcG6nscX7B38aTshusS7ELnVq5SPc0X1bThnt+ndH5CVze0+
	s9lKvHiXMi5sUSkrtnnKZCDhcxX4duUY5KKIV9SHqXN2c09uvMU+k/GIGNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8haj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:57:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso492593885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862678; x=1768467478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHFif/BS3PWPBJexCizq7O/EFeVP1u2QBncpGrCNcSI=;
        b=Wf2cK6or3UiJMow1vY/1II70xU56vJQ3N15W8scF8A6mpQpExpQlgjfs8MkmO0Fmyw
         kY1HIpH7RybsdWaIlhPX4F+wglhdTD2eKupH4tadiRp/cfKrlNATgVjkCHHAyCEhnE2y
         QHazjg+JIZ0rSMdRjOy7WCRrH6FBLBWafJvSveBKajXMN/6/aKlkaAMHfbPfDdLZV5UV
         yb9U6rvM8+vGDax4mQnfsvSSquPLbTi3sq2VEeFzSNh8HWryA0zf3ixJWfvg40HrI6es
         hOr3EJj+LUG8Ik2W7rSnzFJEMWk60+5xCCNYQ0y7WFBo0waEu/nvQdIuEgKUrvRFUmNu
         IByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862678; x=1768467478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHFif/BS3PWPBJexCizq7O/EFeVP1u2QBncpGrCNcSI=;
        b=EQVHAQSk/wtBznLsmZffrzxkg5fd9MqRIl8PvrgHG/2vjTPUTerJpaI46NFUd9A7o5
         6CNKXjtzyKe7Tn7BV0ygEXall2BNPrpU3JFt/d9sBefYG6JvewthHQJRsEsmKUX3/X0B
         WYO50BjAzgcFxBcqDAl1ynlaYgXJHa0f8kQNZgGL0zbZcINqThKXxJ1DWrSsEzD66OIc
         iAwqTvO/thmQqivPcFs03cLL+MVJ/F7ZKMGPCerT0KGgiuL6UdZB7nVVZ7e0D7hIng+Z
         YPwl2ZyuEyY8W2sq8N4/GDFhQTbYNxEf4kaxcSs4k5/M4i7SnuUC9M26n6FRoz9DfhQb
         L4SA==
X-Gm-Message-State: AOJu0YxmZKHUEYgp14y4Dw+694fjy4FYOk6wmGxtFY5dbzamMyk5K3Cq
	39awhZEirYTmYZQuuNBRPbNUny/MCySLF4WF/mljtND6cWPXPCNBDEUzZGuQiHG2T/25ehg6pz1
	pAOIflTywfGtMRzJfCBNlIxkLsRnKCBJ5HuLaAuNiNN0xOBru9re7GCjcNIsTlFjQciLg
X-Gm-Gg: AY/fxX6nWTi2xadSJl5LOM8GWm09sU6foj2nM1h4JrQuRp1O/rfcLwnSRkdnXvv8hMK
	VRdylidpw5j7awN+UxdTkkrAflPDxoasqSDNCZBL00b/4UpHPPm9tXONwAm7eX+nCi4jg5MF04n
	g6k4LS1/MW1uteK4V7B8e5TFwctl0qk7/Dn5PGJvhB+Rz9imdRKAbzy26pK1cdPOdCJ0gftjGGt
	2FhbOr7F8DAUTQDV54GbMt66ytWnvUaE1fxtS3R3fTPxc4a/z1l4GKbWjWqpIOnty1l/uLpyjPI
	z8q9sA2L91KOCOFkJHOwvKYS/Y9IfxmBsM3i6oxhFUtaxkUYVhY5PAK3eVf7xZgaLbTdxMlJasC
	hfssiTSdjQM/qr2/nwZ+DO5YglI07vriiB77iP0UXD1YK+GYcA/5qQAI80kV8idCpmg8=
X-Received: by 2002:a05:622a:134e:b0:4f1:c601:3ca4 with SMTP id d75a77b69052e-4ffa8516047mr118434011cf.32.1767862677970;
        Thu, 08 Jan 2026 00:57:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8n6tr0tEJKg3fbs9xmUJgfvvFyGnd16463LuIorZEH7FhDhRZR89OH8zZUINyswvV0uCQZg==
X-Received: by 2002:a05:622a:134e:b0:4f1:c601:3ca4 with SMTP id d75a77b69052e-4ffa8516047mr118433801cf.32.1767862677483;
        Thu, 08 Jan 2026 00:57:57 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:57:57 -0800 (PST)
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
Subject: [PATCH v5 04/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
Date: Thu,  8 Jan 2026 16:56:51 +0800
Message-Id: <20260108085659.790-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f7197 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: SkfYAXyHqvHOACbM6zyJ_HBrdVSISf37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX3l0pP1SJpW0J
 sy37eqhitFgLt+gJ1LLc6+/qz/5ZxsxQtHMZH1vvgZPWE9ex02ZsqMcbr0xaygvjoYqq+UpYW/T
 EGz7EDTy+CsHxc78nEplkXRhhvsgbpoHA0b80E1K+SD4CiBnajPN6c5JWuQ67YAXDKAtY3hiwuB
 YIPYmhG7fZzj8aSEJtinZG758pUBoZs1YUN0J5g/kqMnNtVWO6dXy6Q5iVjBpbaOMlFnvifnFx1
 SLyTXUYudfTHY8Fr7JLIzxutgSnfNr3p01reyN4gdygFn64CXXbz7v1wtNu6I+kbkvbAU6uiabv
 jp1Sz/1QxxH0ioPWjhHdeqH+trSLWsqdWXabL8g2OfuV+0ufVX6HDfFzl36sFHT3ZyygpbPRBot
 U3Yvp3nDXrXwxm5UGBTrYjBk2FSWP3cIw1TPwA6bYEoar6a/JW/NqSOj5Q3IeOTxttJ8KZNNFj9
 nLmuGVm1jhLumSM43IQ==
X-Proofpoint-GUID: SkfYAXyHqvHOACbM6zyJ_HBrdVSISf37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059

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


