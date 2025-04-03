Return-Path: <linux-arm-msm+bounces-53089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A509A7A254
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9719016B60C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4C618DB10;
	Thu,  3 Apr 2025 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAbRRpA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DF24C097
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681802; cv=none; b=Vd8a+zfjmzYtCGz9Pf5a44BoX7MTPaPw0bGWEHbt9MetX5mJVDuab4B1XSTqHV0535PcaPEoI2zxm81T6Ooo6JXfIVpHFute8KXiBX1jdh5GqgFxXOvjPPItvC/oX3dMtzhSbTFmQr0NmzC09NSttD9T7Q23LL1/CJw0M0gutfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681802; c=relaxed/simple;
	bh=CuNNtXNX8Ujte1Pw254MtiPySjEYgDiFk45FGxQzfJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YXyq/4WHKXLPBeYfZBTgENAPJeibE6DxaMtN3BzEq93c99VcDpWZs9jNEGijF5wcmwDquBMOLbFjbeqmHywYCTa7+kXkC624+YClDZjLuCD080jaB7LyEQur0JFgINW2VFBROzpAvP3SrL3/9iNvPMYPjqFAKamWJboOYmd3YjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAbRRpA5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s9ld025687
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 12:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6vMICFpqti7
	YfwSiU8VfD3wkx+eGtBtOZvmrITsLn9M=; b=pAbRRpA5NSK6iIlHQzc6yG4BTTT
	C6mi0Xl+hKirQ95/kt9NmG6hU93GQt+9zaxcg+8nKftBQoH95iY/O+ep1h19mjO8
	ExB2uiH5yLCmrqTDJ1LKIYcv7AhqxH+VB8Ounbs8dq4weH09K/dsz97CerRE7EoV
	FX7XGPAXPHA7S2t1lw6My3/CDVrUByoSrHcy6hXs2eZ0YWW7F3P/UxybvdJ5Cgtg
	wSYrUzh2xPJCjF4YZF9QQ54afMYXeRkehHEqShSzreZ/FLDDrHhj623SG9519San
	boBOKPkgu823YRCPN4OScmzP0a2r5DqgyNrIWeC3hAPfSx4sGQYmHuRTofg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadvxxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 12:03:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af53a6bc0b6so430320a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681799; x=1744286599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vMICFpqti7YfwSiU8VfD3wkx+eGtBtOZvmrITsLn9M=;
        b=GdBly/qhDezkBX0NC3HMu+vGC3lQu1FK705GK9GlJ/gYV5jdF9hTNXnQ16AjE5hkUj
         PloDEqiOKdlYf5caBIGKHQqJrAvSQapyMeM4H7qEs4gIILRoYQkm5M0PUJRzCI2SoZGI
         5H9qOM8FTtQwbBCLS1GDMCDnxX9D2ODNahfTpYLBhrOJc17VzefIUuVtXLugSXB4CrIQ
         OgbwJtgd3504IOOrrslZiuN6nuLdfK9mdUSDm/Q/z4epz9+/WJotUQ/HSiDhGIMMkXjb
         NY7bRtSqDe6fZrdTEKC2msmfQTvJHemwdBx/9hNoxIwOj1uJczKmSitfgm/qnGN3ipqi
         6UFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/0JquQfjwBXeKyuXvfg7jnIdxef8/liE5kSP2w8Pl4VQUKj8vcV550Hz6wDyhLUO1ejqrFltwYS2PSfLB@vger.kernel.org
X-Gm-Message-State: AOJu0YxfHPrLF+gKJSMOoIWpBS6GwUcAhokgndA+bhaZwi4cMrM3SsjV
	3hEILoHzu7p5PbGHlDL1gScukuVSUlLLhVWUhmOrCU3PZbnoSukSprZyuCs74rfBNB5fMTDs6u0
	fem2nFMBemZSC6xPR5IpXPIMdo39v642dI3OX++fXT34cvwigADSjnXT+V53UW5Sk
X-Gm-Gg: ASbGncuTgkCnYE/wxt891KCQoyBnLKMU+I2XPVeJHyay3codsdMAwBwETamBAKjfcmi
	SVCHl6yMdqLqzwZ1mIh8QjhCGUyPqB6JOSXxRW8cRNhUbgLYFtmaTwKlnzrfvYGKl1sgOlsTxDs
	YnnpNf9UxD27c8GQ4OS4ccMgUICIaVNfbTa7k3t9rF/jwfmmAJj7W4LOC8cAsFYPPqFEzY4Ff0Y
	v9vXAhsO+HXTejTMS+tat12STjx+dNqlmMqU0mhki+9kdKWggBXIXpvOBrwa+TyFzlaNLbCpWEQ
	ERJM7Xwhm9dIAmc68XvjETks7Aq7VqL4GaoZJyu8Xb7QhCkQOZdynreOQrFJ/OlwUOogZOKaJOc
	3RSQ+4bWSmg03+2kMM0cToBkQ7nyb6hc4ywYZiWE=
X-Received: by 2002:a17:90b:520f:b0:2ee:8430:b831 with SMTP id 98e67ed59e1d1-3056ee1803bmr8748341a91.2.1743681798865;
        Thu, 03 Apr 2025 05:03:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjN6zOqbL2wmy3/LbQUgOcDCyebEPRKPRLuXLTjUTL3KLebzRiqQhK+9SP9WAI3g8oVfM+A==
X-Received: by 2002:a17:90b:520f:b0:2ee:8430:b831 with SMTP id 98e67ed59e1d1-3056ee1803bmr8748270a91.2.1743681798369;
        Thu, 03 Apr 2025 05:03:18 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:18 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 2/8] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Thu,  3 Apr 2025 17:32:58 +0530
Message-Id: <20250403120304.2345677-3-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ee7907 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pS1mFShvCYhk9e5rTeIA:9
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1XDPnk00pMFi3_TmmcJ9F-p97XMBT3tX
X-Proofpoint-GUID: 1XDPnk00pMFi3_TmmcJ9F-p97XMBT3tX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL.
All IPQ SoCs use secure PIL.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..d427470f20fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq5424-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    items:
+      - description: Firmware name for the Hexagon core
+      - description: Firmware name for the Hexagon devicetree
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    items:
+      - description: sleep clock
+
+  clock-names:
+    items:
+      - const: sleep
+
+  mboxes:
+    maxItems: 1
+    description: A phandle for the TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    minItems: 1
+    items:
+      - description: Q6 reserved region
+      - description: Q6 dtb reserved region
+
+  qcom,q6-dtb-info:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to TCSR hardware block
+          - description: TCSR offset to write lower-order 32-bit physical address of dtb
+          - description: TCSR offset to write higher-order 32-bit physical address of dtb
+          - description: TCSR offset to write board machid
+    description: Q6 device-tree information
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
+    remoteproc@d100000 {
+      compatible = "qcom,ipq5332-wcss-sec-pil";
+      reg = <0xd100000 0x4040>;
+      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw.mbn",
+                      "ath12k/IPQ5332/hw1.0/qdsp6sw_dtb.mbn";
+      interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+      interrupt-names = "wdog",
+                        "fatal",
+                        "ready",
+                        "handover",
+                        "stop-ack";
+
+      clocks = <&gcc GCC_IM_SLEEP_CLK>;
+      clock-names = "sleep";
+
+      mboxes = <&tmel_qmp 0>;
+      qcom,smem-states = <&wcss_smp2p_out 1>,
+                         <&wcss_smp2p_out 0>;
+      qcom,smem-state-names = "stop",
+                              "shutdown";
+
+      memory-region = <&q6_region>, <&q6_dtb_region>;
+      qcom,q6-dtb-info = <&tcsr 0x1f004 0x1f008 0x1f00c>;
+
+      glink-edge {
+        interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+        label = "rtr";
+        qcom,remote-pid = <1>;
+        mboxes = <&apcs_glb 8>;
+      };
+    };
-- 
2.34.1


