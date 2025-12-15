Return-Path: <linux-arm-msm+bounces-85202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB64CBD019
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7DFF303D6B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE8832860C;
	Mon, 15 Dec 2025 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goziGgG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsujSl21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CF2C08CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788026; cv=none; b=Ko1X5osWsdw0dOtLRmMSJGuJMxj9LT1RNJ3j3wVfBumYCmVFGJknSmSVqpcElfo91uyLlrYBUdVrDuQsilIai3x6dUhJKyq4B/FBqJwUlAC4MIhH9bqIcHFwtgUNIXwO0xw366J/4WjtZrDSBeir+IM6UOvkAETEfXoa/JC3sT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788026; c=relaxed/simple;
	bh=C/SRBt/7dSGnmJr1VczwjK56l7+Ma6+LmugqmP8ce6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJE578JgTA4rSyqfLL+/OJCDbVQ6ye/ndR60+NR+9baVvNubXGbJDYSC0NH3gznXwH21XV95mULwHKJwMydKK12QWi1lXt4zlmr5wI+elTNL+xe/LL0xKQ3r3BYiJ/CTKx5YlzM9cFkj+2xcTvSChjyDjBOD9PBzGbvDE216mSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goziGgG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsujSl21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEMr8I12233680
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ejOLCXs2H6V
	eH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=; b=goziGgG0IItSySQrlKxP+XsOHrT
	rlBOewv2PZTaQm0KiIlo3bo5kOdGTpybHsFpJrrm8A0l15YJBxbSS1YOsDz1fePc
	i4g0IfQAopF2jze9fIXBu8sL2ZinRDBVgCnYzhgezX1vbcpsfCY4k0Oxu8sGA8tC
	Hd6ndep0mXWt9vKRDIzqDGG6+LHw2jVYcgiSKLGXvHr4thW2d0rSRQWeIO0JPP2M
	56o1Nop0mJCcnZ9SkoSB0Qv8/InuPn+1xLjXW6F2xJJQmRlMkfMMgwLCAX9vJI29
	U/FIQmEkzNT/g6+LGu1VE83z4LfX2f4QPAUnFEEiBRZ8/BfIfIKaalNQ3Og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11afbu0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 08:40:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed782d4c7dso56936731cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 00:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765788021; x=1766392821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
        b=dsujSl219A/qvkEF33eZBe43ojIAbO9o+HZ8GUM+ViEv99ckWFe3m1N8XUFfOO6oeV
         lD8eG44CZ+x1VMI819Zq87m/KAuTSEYNqxXzqvd7fGFvrqZwsKscQDEryaYKSzNVYp4o
         2JvFXB2R0Wdf4V+AhPV42XWtyy4bcOObp2OAK4137hBzKinZbGBImcsU/6dv0PIm8Z3n
         GiXCLKW/tg8RbV9pNmQPMlchYwArlp1JUKbmRdnzvX5XLIg4FbCO0WDmIYHqaydSzO/F
         Su6uZcBpQv4l3704w1lmxlxNYfVXr+b6wWu9/oJ4k4cmlNplCUiott1IOsZr/mKi3zip
         rrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788021; x=1766392821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejOLCXs2H6VeH6zAgJDf6kqCLHfca0LQJWts7i4UWpM=;
        b=pj1tz1OtIBnzl8ErjW8Le3HufyTTstVAegmnMIUihHW/ZD8HfROIiHL+q/mB+lfnm7
         nNWfdgmb3QE01WKZTDDUlqRIi/FqM3Lg5sOySxwMHbEbixadZbf0UzfZQONoOo7iFiIr
         yL75v7HOLdI8H/qoCUo7Xw9KmmHWc0KnjYT/nPA1B2jqpxS/bXCBWWoi8yzQMfN6sFoW
         hYBqEQSlLHvuiboEZKZYLRuw3y03Rqe1ThTu9nYzQOolAXmMizt5UyQWblRnmdboMxXQ
         JlmeGW7JI1uY/Gvw01UhxWD/+P8lgAfKZQyll9Gsfd7MMEUbURy8awaeKRlfW1uYQIOF
         BgEA==
X-Gm-Message-State: AOJu0YwwJP8nmbHOXLjC/CaAZbdzNaMb7+13nPY3Tr4iJaPrJU7Ee7uA
	oJJ8eab4DABYlLqYiyiuuQIL8nWjv128W77iGKrxNIqB7bds9F3okeC9lPOqtduIz5q2/F13PpO
	tizg7mraaJek0fTcxZqiZzuGfGjUTVrx4HkrSzK5IsA54G3WUb0mFZpdeYCMQ+ZPxUbI5XVujn8
	/M
X-Gm-Gg: AY/fxX7zq3wl1xJbbE/usbXKeA2xghdOq+HobVDLDzMouqDj41P5v5qVdIvFdAZ/90o
	lzlf/J8T3ZgRPxxSpSHiXuCDrFLFY/lq+59gfcTGxwwqZIVLtxJdF/xPcgm6xcyPENYb23ad7kB
	AikXDtMdvxTrRLfBzHh+vQXepmuFjIKczHt5Mgdf8Tyh+Pug/gF18IqknrDxqzz5EKBRnAghAVh
	l8l3RxJgNOchfE2lCH+k+bRCSBohomf5p9zE3NXTOe2MVPjTZhKRtkK1SCzNQWai6X5Zv9MUXNb
	H5gw57GjmIUHBjhoLn4Fw5/2K8yhbql//I+RDwY89NPqzwpZYaZRkJCR7s89EpD7ji9uvMGMNtY
	V2yjnU/vp2fNmJ9Aa2XeZMeN6clezfcLQ9eQEut5oA6oOZUXQtjDynLWCIITQyta2cjs=
X-Received: by 2002:a05:622a:14:b0:4ee:739:149 with SMTP id d75a77b69052e-4f1d059e3a1mr136581781cf.46.1765788020592;
        Mon, 15 Dec 2025 00:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmxFdMKPIKbwVSnYQ41ff/1mZalKEXYhAjGYgahZJ4WpTfUfg/F8/VvJ6t7RoZzhLyp5YFjg==
X-Received: by 2002:a05:622a:14:b0:4ee:739:149 with SMTP id d75a77b69052e-4f1d059e3a1mr136581431cf.46.1765788020149;
        Mon, 15 Dec 2025 00:40:20 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:40:19 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
Date: Mon, 15 Dec 2025 16:38:47 +0800
Message-Id: <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TtDrRTXh c=1 sm=1 tr=0 ts=693fc976 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ttgK4pBlxCW4zpXUERAA:9
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfXxX44EogwgXbx
 LfPiiFhZqGMhd2D5Jlla+pXjpm3w84Z1bGEBWTyhFrUy7Oh2mLHIm+WW5wif83I8NC2gcyIIW6l
 Qpq5CZuKTZyJPnRgHzZGH132kvXpJBWQ6/BPZycbVH8ysk0mvhQIxIwPCtIdjwG4eMsI/Sg59TA
 NurkCQ0qOeR/wKfZvpZeNQS5T7zE66TJKc7sEFEe16Kz9Ot51ly5GtDxdqTBJGFO5yZCzCaIrKS
 E84ZZUZJBoBZrzKL2dDsZE5c2zAblrgjairOLm8zrQVkbsnQbZE8NqrTOuQbn3FlLQ1j7jc1Iib
 OI6JAenJ+J1tIu7p9hyVC8dpjsbSbd85EvjVP18y1ENzRj1h+UBoY3Zg4T/iGoxSohzlx7pSAgk
 caBvZGohdl3mGXa8jM7SEHV3+yEFGg==
X-Proofpoint-GUID: rtnqMB3pMWwRZtzLeZKwd1H4hMxyIlJO
X-Proofpoint-ORIG-GUID: rtnqMB3pMWwRZtzLeZKwd1H4hMxyIlJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
Kaanapali has significant register changes, making it incompatible
with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
new file mode 100644
index 000000000000..92293e2b4d94
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
+            reg = <0x0 0x09ac1000 0x0 0x1cc>,
+                  <0x0 0x09ac1200 0x0 0x80>,
+                  <0x0 0x09ac1500 0x0 0x400>;
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


