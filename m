Return-Path: <linux-arm-msm+bounces-71227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56519B3B545
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 339B63BC436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2722D2389;
	Fri, 29 Aug 2025 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU6zkGB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94472D130B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454305; cv=none; b=XFqoZls0GdRTbDairMkEd8iJ+bpIu0nFKC5UqU7Pk+ySCN7p91as3X0siYJ+aRA0t2QlQg/9xhniISTqOICNKXy1sH/Faqi/g1ljeS+NTARXHRtuHBjnKbTjdUr74q/DvJrwZ1PLZ7ap0GcLdiQnvSZwOy5CvpicMWy3S/9JKbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454305; c=relaxed/simple;
	bh=z9drRjXdTT0KA8t2VNi+iNMOxRn/Ma7SLpUA/tpJQcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cectun6iTPq7157Hc1WTJrSScaCQSx6jyCQC6Tkc85SelcSr2VD/Z9piiwaE/qz6rDTMORkphfJ5v+MGa64UChCO0ZQHHQJFs2laQQbvrtyApct/TYmGZDD6S9+V6IR85Zt/d4yw17waHQCPiY1nzFnHI6bTl6hfNzsgBH4ohH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU6zkGB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T5t1Xe002840
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tg0TadezHCZinWRaUOrMAwdmXaDSKwhZG9ok3+9UXoM=; b=eU6zkGB+GKqAa4gf
	GGY6VP76EZQkLEXK0s+MO2GmTH+pFdhWHO7rFZgb3e7zy9oR9rA4omnPos8Lfl7h
	+3pSRsBn4PDatZwsYmYvuHyPp6Arb2vmBFXTMcNIDKVPRVQN2L60TrpSr4fdHob9
	lVU4MAQ0gnu7Lh9IiIBjAsaBkVK/ueiWlh/lhmh6lOQ1i9ZG3zdeCKPJETwStN99
	e2V1rGf9AS4k82baaN2V538k99KrfbOG2q/9LB64KbhR0vPz3F4Hb+EDplhV5gBG
	wRlsdhLO3ZWagiyoKsePJRdZEdB8MxRy7Z808Vp+CFeSximG7wiUnW04BEJOTR0j
	zbcRSA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgn00t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 07:58:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4c746c020cso821129a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454301; x=1757059101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg0TadezHCZinWRaUOrMAwdmXaDSKwhZG9ok3+9UXoM=;
        b=tI+3EgOz2mOPWRZW+HHQBsl5uyAn/KBxMnmb/AG7aCbh98JNm3LBRI5fmZQHuqtLlL
         wDLIkogBQ7uiEBSxS7lXSfCHEyJXc9umD19xM+KvllMtAhaT9qrSI/BVwWPr5tIOOR/v
         8GFePkyVQ3zPwLDnhF+a9qd+YRNHCgbV4JivwOuBQID6jaVV/ey9xCEEFM0m3Q07kwvq
         CiALLOVkqIJAIAZvZU/j/ll+JxnoR0CLVHCH08gKWiVvu0nSyxpHtrBmSTUIj0Fe9FHx
         TaPoEeHTbA4Y/5g5DS4a6xqk4nD+6rXY/j3H+rIwpuf2qF1T15TYP7xnuCIAhQBgOeSR
         mxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUZ2iPz9Rorl7OWOzI3dPfZFqdbcDs5eTnSkUkT/Z7VGe0MPlBX8yXS17f0+nqpWBlSUshOqe+cppYIoJ3@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8Mwq5pENQnkb5SwoEO1iLEki9lI3rdA84wZ2l7vDVSUT6MTq
	AAsDn7+aqAsCvzoYzllBlrM4195/9GWrZYbDAVIG3tPp0GgeM0pFSnDdO4yeVwHyvW+At4dp/bI
	ELWbzmxhwtsOZg5rOe4oZjFP4gNXllw2tXPhcoxLoU7/oa77iTi+3MufLUHmE41jkLV7V
X-Gm-Gg: ASbGnctc8Nf7xtecTadRqNiJ6GnEYEqkc7KA2rTNNEUsnPW7IZFmwuwNq3FHK9C5nyn
	xv3pMzO4/Ljh310lbkkpFAciJeKCivfQI43XRi251kfCElHm1rWabOMX2UUFQtTmbCWM/sketuE
	20yLLgm59QRlZxL0JstI93zqUsqr97ms5N4W05qQoJCRp2rR5ssTvgFnSHK768fnLIRg+j+hh6J
	jNN+9vq60Bav8O7iUA52l1pi5a6bx4LZZvR+FxA/wNU4WdlO1IuWcajeFLznNMkZIdUDdYl58YR
	z3EaeLb8KNY2LD1fyT82NA3jNXoz3WoWLVNQr25eWB2TXrkz35I/zktCw+U2+TRX
X-Received: by 2002:a05:6a20:9191:b0:243:a251:cf51 with SMTP id adf61e73a8af0-243a251d3eemr12213695637.54.1756454300439;
        Fri, 29 Aug 2025 00:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh6zQOpPVgv4227fwAgRWkPOqZi3+XUDXi949ObJPhcXPGNdm2RttgZhvvfTGIdNbP+4uPmQ==
X-Received: by 2002:a05:6a20:9191:b0:243:a251:cf51 with SMTP id adf61e73a8af0-243a251d3eemr12213663637.54.1756454299950;
        Fri, 29 Aug 2025 00:58:19 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bb5dasm1554416b3a.55.2025.08.29.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:58:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 13:28:03 +0530
Subject: [PATCH 1/2] dt-bindings: clock: Add DISPCC and reset controller
 for GLYMUR SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
In-Reply-To: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: n6LPiV-sUBRPoH2DMTgXejIamn3AveBd
X-Proofpoint-ORIG-GUID: n6LPiV-sUBRPoH2DMTgXejIamn3AveBd
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b15d9d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=vLIBROXKFhWHEpkJx9gA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX4RKAbuo8/jb1
 tVCkXeIOb3BrNIH+8Y96913I/lRoO9w3UykAlaTEVjsE8fEt/7bbaYkGja4XI0YWipw/ooZWuMA
 9l6u1+WBgjDecNeceIqRq25sd8B6rdzh9tPp+b1M/OuEiJPteo5h3dHcRbLSvmHbq6xDOi3WZGi
 5KKNVDLRJuWM0lWG454HcJQbF989f89Km281EGByFTaknSgR7+zzylUxt5IN7yGr/bw5FfPlt8h
 HjoYnhww/7iyfNVd8thRCtEMDpCJtsOOrXCU+yYJs8lt7OqZlHmqowgn157F9d+nzOnrwIeLFz7
 85NJEA8iDU74B9oh/hXOakJi82jNC89LhiX38OjSe2w/oMWHcfTT6ybsFawfynPDlxywHFR4dX8
 EhoYeB0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

Add the device tree bindings for the display clock controller which are
required on Qualcomm Glymur SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-dispcc.yaml         |  99 ++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-dispcc.h     | 114 +++++++++++++++++++++
 2 files changed, 213 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..063da2416dbaed764b8579a090bc5fc0531ab60d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on GLYMUR
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm display clock control module which supports the clocks, resets and
+  power domains for the MDSS instances on GLYMUR SoC.
+
+  See also:
+    include/dt-bindings/clock/qcom,dispcc-glymur.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-dispcc
+
+  clocks:
+    items:
+      - description: Board CXO clock
+      - description: Board sleep clock
+      - description: DisplayPort 0 link clock
+      - description: DisplayPort 0 VCO div clock
+      - description: DisplayPort 1 link clock
+      - description: DisplayPort 1 VCO div clock
+      - description: DisplayPort 2 link clock
+      - description: DisplayPort 2 VCO div clock
+      - description: DisplayPort 3 link clock
+      - description: DisplayPort 3 VCO div clock
+      - description: DSI 0 PLL byte clock
+      - description: DSI 0 PLL DSI clock
+      - description: DSI 1 PLL byte clock
+      - description: DSI 1 PLL DSI clock
+      - description: Standalone PHY 0 PLL link clock
+      - description: Standalone PHY 0 VCO div clock
+      - description: Standalone PHY 1 PLL link clock
+      - description: Standalone PHY 1 VCO div clock
+
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-dispcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    clock-controller@af00000 {
+      compatible = "qcom,glymur-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>,
+               <&mdss_dp_phy0 0>,
+               <&mdss_dp_phy0 1>,
+               <&mdss_dp_phy1 0>,
+               <&mdss_dp_phy1 1>,
+               <&mdss_dp_phy2 0>,
+               <&mdss_dp_phy2 1>,
+               <&mdss_dp_phy3 0>,
+               <&mdss_dp_phy3 1>,
+               <&mdss_dsi0_phy 0>,
+               <&mdss_dsi0_phy 1>,
+               <&mdss_dsi1_phy 0>,
+               <&mdss_dsi1_phy 1>,
+               <&mdss_phy0_link 0>,
+               <&mdss_phy0_vco_div 0>,
+               <&mdss_phy1_link 1>,
+               <&mdss_phy1_vco_div 1>;
+      power-domains = <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-dispcc.h b/include/dt-bindings/clock/qcom,glymur-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..a845d76defe282d953e82e8b595433c5f9cd364a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-dispcc.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_GLYMUR_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_CLK					8
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				9
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				11
+#define DISP_CC_MDSS_BYTE1_CLK					12
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				14
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				15
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				16
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				17
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				18
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				19
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			20
+#define DISP_CC_MDSS_DPTX0_LINK_DPIN_CLK			21
+#define DISP_CC_MDSS_DPTX0_LINK_DPIN_DIV_CLK_SRC		22
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			23
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				24
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			25
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				26
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			27
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		28
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				29
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				30
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				31
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			33
+#define DISP_CC_MDSS_DPTX1_LINK_DPIN_CLK			34
+#define DISP_CC_MDSS_DPTX1_LINK_DPIN_DIV_CLK_SRC		35
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			36
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			40
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		41
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				43
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				44
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				45
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			46
+#define DISP_CC_MDSS_DPTX2_LINK_DPIN_CLK			47
+#define DISP_CC_MDSS_DPTX2_LINK_DPIN_DIV_CLK_SRC		48
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				50
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				52
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			53
+#define DISP_CC_MDSS_DPTX2_USB_ROUTER_LINK_INTF_CLK		54
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				55
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				57
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				58
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			59
+#define DISP_CC_MDSS_DPTX3_LINK_DPIN_CLK			60
+#define DISP_CC_MDSS_DPTX3_LINK_DPIN_DIV_CLK_SRC		61
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			62
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				63
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			64
+#define DISP_CC_MDSS_ESC0_CLK					65
+#define DISP_CC_MDSS_ESC0_CLK_SRC				66
+#define DISP_CC_MDSS_ESC1_CLK					67
+#define DISP_CC_MDSS_ESC1_CLK_SRC				68
+#define DISP_CC_MDSS_MDP1_CLK					69
+#define DISP_CC_MDSS_MDP_CLK					70
+#define DISP_CC_MDSS_MDP_CLK_SRC				71
+#define DISP_CC_MDSS_MDP_LUT1_CLK				72
+#define DISP_CC_MDSS_MDP_LUT_CLK				73
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				74
+#define DISP_CC_MDSS_PCLK0_CLK					75
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				76
+#define DISP_CC_MDSS_PCLK1_CLK					77
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				78
+#define DISP_CC_MDSS_PCLK2_CLK					79
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				80
+#define DISP_CC_MDSS_RSCC_AHB_CLK				81
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				82
+#define DISP_CC_MDSS_VSYNC1_CLK					83
+#define DISP_CC_MDSS_VSYNC_CLK					84
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				85
+#define DISP_CC_OSC_CLK						86
+#define DISP_CC_OSC_CLK_SRC					87
+#define DISP_CC_PLL0						88
+#define DISP_CC_PLL1						89
+#define DISP_CC_SLEEP_CLK					90
+#define DISP_CC_SLEEP_CLK_SRC					91
+#define DISP_CC_XO_CLK						92
+#define DISP_CC_XO_CLK_SRC					93
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+#endif

-- 
2.34.1


