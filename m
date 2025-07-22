Return-Path: <linux-arm-msm+bounces-65995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 675E1B0D2BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AED0D17A4AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F4C2BEC45;
	Tue, 22 Jul 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mf4mkhjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454622BFC9B
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168961; cv=none; b=KPXUH4CzcmnAav7j+fSMKbbC8OdBkL8RMxgkqOFKCXnrlra3z1EAhVH9FEKdX7OEk93LTE5owLH4uHorMb3MLutqIOJaoYDeb/NcMlG3G0ZMYjDZZsRg3HXc1DixD9T6Qz7+5G6DVFIBRLUsBisQcTTgXTB5NXg4rhj5Qe+TEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168961; c=relaxed/simple;
	bh=UDTnjCmveSMGSp/9NQ1xFqa1/QflcdbQxJ1GccXnTeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0ya9aCBwsDzEsj3jiJcYhdm+a1caniLfbunNkVX+uWcgOVKuahvzw8uZGHjLVhut0bJ0V1R7tjtWdJyU7WtuqoIhTSx0rbWaidkADP154CB9unpxMRQbPi8umwmSAsJNTl7aySH7wN4GUeuS6qDX/E+UodNIRemI48CKDuMQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mf4mkhjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7Hh4m015402
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahrBulyU4QSMtpu0KlTx4RsdzzFchdneJBpLgEVdzls=; b=Mf4mkhjWYpBhxUp7
	a1GWkk/1Sv2f1IR7Iijvav/IbpXYD7zl+Jo8OcvO0tyel+KNhiQ93U2InnQPtfIk
	CuN5YjbpkNKHoUWfof85UgROFs90SHnTP/3XKJIxvtbwZPglGERQHUUU9KJ+2RC+
	nauv7A1M/O5JwyDto5zKuniSqra7m3bSubptfQCXzBZTXz9n9zk1c+/TCcdD+HUi
	+R1jueB7H/QyPTZi36qft4zopumh/helhl1mUJRJZyW1UDvjhzMiMYIbPO7JDoqK
	8U2PsC4hGIXjWnXnXdVmQYhA+gsYaQ0bG3DGISeIbbg17Rg4H1yxwpQbRH6iQniM
	0g18qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w1ksn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:22:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-318eed27daaso1203080a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168958; x=1753773758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahrBulyU4QSMtpu0KlTx4RsdzzFchdneJBpLgEVdzls=;
        b=EaripHS5ZVIWqri+IIgv2qZjzUYf/eq+PT5gtn0OnmpoQaCH+1bCuN28pU+veoIlQK
         UXVOQZ/cabp9P+UyW6Y2Z1VfmIQuXqCke819K2NFtiBE1Szw5TX09gjGs+5WIGGx19t2
         6acwE2B1g4pvXpY6pCtprx5y3AK6vNS8vBmNJTzxk5lNrcG5lJ1oCUnMSTU33yS4amr5
         sslxj4B95xdQG3m+uIL/ieaSKy77uwR5aW5bNyFSwnheHRHci2Oym8Cd34CpBOw8PR8k
         r04NY/Mlxwt1j1Bmlz1PqrgxFETo5r7TOboBTTyKTFIWW6FWiDRW5qJlauZ60mjOQFQJ
         iJaw==
X-Gm-Message-State: AOJu0Yyynrul6tcfw6QSxtDzFrikaEeIge5SOm7SeK3OCtnBAmlVbmHL
	LPK8HSmb07bLZ5yxcIlk8nZfb9GCBZHiJ60gVAN5LzQhY0x+eu6zgLRP0HweAj/431P9KPbAUBv
	L93MSrarBo7pkgxjq03ouv7rRZpJmJ46fBPB4dXvtteoXAd3PrZMbrqTh6nidzkYy9UT4
X-Gm-Gg: ASbGncs7v32qyP5bpzsurlLL8aqNm6UC3kj70pXT3iS7WtS4FANvAb7PqvD4NDmgTb7
	40iB7YdCWSkqkVavOrsRugb3YwPQMnxRjMki09tUco67ojOE3iQnoG1zWbIDVGMHr5dI14NECu2
	uwMzwQSBN+f8mFpP4AX/rZ2pKPQp8U5CHFTXyCl2w/20/nMfhjZIFkjU7xvgsTX6VGl2Y8erseC
	2j/tj3rEC2Ro35fpPIJDUvfdZjzZIIReoUZ94ZvshziQxyMpYKxEazvb1nu+P6fFORokvct4aqh
	hg+hc/ogBwe8lu1a9Zqlqd3mwNNujpwQMT6dI1BD00PuiIW0rDMI2OyAkrXVkIMHTBQ0nT/lgyj
	nprvIfGUduyusHlkO4aUmdZKAJlKSjRcXLs7MOI6SJghXzJtVsaWgBlD3
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id 98e67ed59e1d1-31c9e7767fbmr13067019a91.5.1753168958329;
        Tue, 22 Jul 2025 00:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWj61R7/p9w0dDf3iRKZ2LE3OM4e0kwtzjTJU0dUunJEF/B4dIihVqiHHAlGGrq42tM3d51g==
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id 98e67ed59e1d1-31c9e7767fbmr13066994a91.5.1753168957893;
        Tue, 22 Jul 2025 00:22:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:22:37 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:03 +0800
Subject: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=3578;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=UDTnjCmveSMGSp/9NQ1xFqa1/QflcdbQxJ1GccXnTeo=;
 b=YoL+Xx1wzPD3/qIMkTLFdtwm8HNMkESmMYELfdTMUCrTewkhorshB/5RAVcHRq4SwdOiu3BPo
 lXKaRSJmwq6BcU6iUavW+f2u7KPzXVqQYTEjJo8QVt0uEvrlQAZKJks
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=687f3c3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=vvfQ0qTNUOrexlX-OJMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX+5rC1GKRmoWn
 W6bTM5qL5A2XjA27CAJL38sfOWc9TPdCFdir4eP7I6LahVL/TEVWSJDjM4gOeM4CKIy6fxLmWqs
 sNDJDjKkzK04TjNOzg1vvd8HxD9Yjtd7+m3Ju6TT3btO/afIZkP+H/oq7xmWw5LBjOJbvIFWisa
 Hb4JD6SMapdbmBRIqxVDEWvUBMLPCstz+k9KBfsbsAKZEZZJlX6i1WARFk5VCM9VcVjBZoniJ9s
 SLtAKjp8UcEgzXpHPFipc4iWQHiqenB0d+jiJW7de4NpkQxm1vVza0GiBwCWAOQQLGEwRJhHRk5
 CuCinRCkrXK4bGzoEC2tOuiu5qWvx8y0GzXG2llq3ASyTXmHAsKb2tFjZSe0lBopxwoNMpbaXGM
 ChIE61xMVoPZoiqUCqZNeGJ1oJAo1NGTkzJIKMAWGrrR8Pwnantaj2HmegpZP29Rf1tDP28t
X-Proofpoint-ORIG-GUID: gCTJItPY77zWhze0pL4qScL3RpwWJnn9
X-Proofpoint-GUID: gCTJItPY77zWhze0pL4qScL3RpwWJnn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059

Introduce device tree binding documentation for the Qualcomm QMP DP PHY
on QCS615 SoCs. This PHY supports DisplayPort functionality and is
designed to operate independently from the USB3 PHY.

Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
standalone and does not support USB/DP multiplexing. The binding
describes the required clocks, resets, TCSR configuration, and clock/PHY
cells for proper integration.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-dp-phy.yaml       | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..17e37c1df7b61dc2f7aa35ee106fd94ee2829c5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-dp-phy.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,qcs615-qmp-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PHY controller (DP, QCS615)
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description:
+  The QMP DP PHY controller supports DisplayPort physical layer functionality
+  on Qualcomm QCS615 SoCs. This PHY is independent from USB3 PHY and does not
+  support combo mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs615-qmp-dp-phy
+
+  reg:
+    maxItems: 4
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: cfg_ahb
+      - const: ref
+
+  clock-output-names:
+    maxItems: 2
+    description:
+      Names of the clocks provided by the PHY.
+
+  qcom,tcsr-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: offset of the DP PHY moode register
+    description:
+      DP PHY moode register present in the TCSR
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: phy
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  "#clock-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+  "#phy-cells":
+    const: 1
+    description:
+      See include/dt-bindings/phy/phy-qcom-qmp.h
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - qcom,tcsr-reg
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - "#clock-cells"
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    phy@88e9000 {
+      compatible = "qcom,qcs615-qmp-dp-phy";
+      reg = <0x088e9000 0x200>,
+            <0x088e9400 0x10c>,
+            <0x088e9800 0x10c>,
+            <0x088e9c00 0x200>;
+
+      clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
+               <&gcc GCC_USB3_SEC_CLKREF_CLK>;
+      clock-names = "cfg_ahb", "ref";
+      clock-output-names = "dp_phy_link_clk", "dp_phy_vco_div_clk";
+
+      qcom,tcsr-reg = <&tcsr 0xb24c>;
+
+      resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+      reset-names = "phy";
+
+      vdda-phy-supply = <&vreg_l11a>;
+      vdda-pll-supply = <&vreg_l5a>;
+
+      #clock-cells = <1>;
+      #phy-cells = <1>;
+    };

-- 
2.34.1


