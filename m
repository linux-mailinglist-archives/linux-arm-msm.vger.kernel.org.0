Return-Path: <linux-arm-msm+bounces-84227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 70672C9F1F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 14:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15712346554
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 13:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764232F7ADA;
	Wed,  3 Dec 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YP+XQAqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJ6wWlCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB62F6916
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768426; cv=none; b=aFBoVuhzj8lPV1m6tA7I9N2wvFI6r7ug/L/pJDgXSVV322h/FLpZJvNMYUx4WrWWOJKkJsSQHwP0ooZdMVjbyazk0DUpl3Tted0IQN9bgUg3flCQorWA0WB5H2GtRZIj6ZDYuJNebx9BYnSetg69bxmy8O+dGT0nI6Wnj4fH0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768426; c=relaxed/simple;
	bh=NNc36LsdP5Sf/Sh+P4pWzTOufULJNwh9nH+aJTkV9xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aINOUyKFN1g9AIpP22Q2n98w5Qq6c2VMBJ9SKk9BVoNS2hFG/5evT871KGDDNIlYfSLghvMgrTNro611q/l1FxNDM4LvNp3iS2tHLOG2lRJjwrcP8XrIb+UXWiFF59bEPTqV6lI/e4qtEsrLlkz0QQUM8/8Prwq6N3fY1Vebkss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YP+XQAqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJ6wWlCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B399qZV806061
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 13:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uDy47w3xn9wW2ymSLV4Sfp6HrTahu+PFDgo9mndL1mY=; b=YP+XQAqvXEA1rH+j
	emM22xJOI4e56QeP6OcxQ50pf3fZCs9bw/4bbS2uQde+DcaMsOzz3lrTlDBBORu+
	AA9/hlsjvlkWwgzAJeZWdMAh/ZtMOmuCco2SP/M0qaVoRkuMDhjAy1aM2Pq1cbbF
	7XeBjBpIDnEonF4hermbf1+EhtrbGJuB4As5XuqBR88cMaracqMb1wfZyhsqrv1x
	QtaGzKr1cAjAXkPATbq1FUxjOJl81K9dmEUZg6DC9CWot8vXfLmsu+Wn3cD+kez8
	yvfedu06X4QQEOjXAIeqr6prF72Pr2G61W1AcxJ8g8gJJs5DwjbRNMU53Uj86xLh
	z888fw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmj2m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 13:27:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so11237046b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764768423; x=1765373223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDy47w3xn9wW2ymSLV4Sfp6HrTahu+PFDgo9mndL1mY=;
        b=GJ6wWlCWjJ5mvPwVRCWofDMHJKC+o6eef2XJSv0BJH/JLLv9JApo+IIaFg3i53Sj+9
         ETGk9NUpIxYzmrzI3v/AleP55T7010hV8iN1DrvpZY9yxvW1vMExHPrwQhZzu7Ql+DGs
         hXwW2saadCze8Se9BTm3gFZUC2glKRNCPFx+3D9WnJVFZq2wzNU3wRFameh8yRNTvDE7
         Dd04NWXpGbMOwO8yOU4Kf1er8KrOcrcCcfjQHGtiq3YgSgBSbjSpvsZJ8ca56u4hX7QU
         4KPUam7qUiPRnCCC7URNOrUQDxBgsZVTr+KZiFma2M7Pm26ravOQw3eICOHpTCZPMw8v
         XZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768423; x=1765373223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDy47w3xn9wW2ymSLV4Sfp6HrTahu+PFDgo9mndL1mY=;
        b=JULMGe36iHmFAKNM+8UnenFgv7sdaokqKLN1NBE28UishQO7Zw7OxSrUjKrtbXWXvp
         oRr8lvJhKTgwXBRQi/eWgCJTVFRowMAJn6GF2Z3/jkXzShDYK+HcNdqmkxdT5a6bv27y
         gxxXolslnjrXv45cK7REZ+wYwHe7r6ThEgbOrMXqd4lBllHeDjDBvd7Ed4SqQMXUf2lr
         FM+k1ZREf6RutCPh74CQOIrn0Bs5324DIUdJywAkbDzsShMQxTjX7QhWXCdmYDbwIaGo
         qUE9nJQlHa4HXEzrpNmDV8VenWIu4RU7+zmMd7ol2Z9cPIlofhcP6u6xtXIS9aSdFa5L
         UksQ==
X-Gm-Message-State: AOJu0YxB0mLPbD/juW8D3fyNuF0sGX9SUqXKwPlkeKdNjUYGuwaODdZQ
	3Lxxgj8o/U5EnuWw9Wjgy86DBVZNQRi8ThlhY2+1AyIYzg+7JVCCly1W28XscxEJWYQO60MCIf0
	c01RMGtKwo7gAQTnXncTcmKhdrLz113MYhWG5/U7SqvPwjeJ+tE5H3r+9sWYZi43ZGbqf
X-Gm-Gg: ASbGnctv9ttnUUXd/XJlSntNe7Yjkvq7fW6K5Yp8msyYs28KtwFMOWIo3rg3KTOYkcc
	d5vh6tfa8LdYimCCRPnpHQeYMLIHL0FIpz6d8SuH94i3Ict55PQR3dRTneXi8Pd7MgAaUokTrv6
	kjZBBGo0AM6KZ5JKdwuRN5YqDMQVQI8emhXSA3/7XWgHxeiEOkbk1PN0Bc16bxMx4+/es+VXTqO
	Vzy7TQS4ur5RscsLneNdsv0pDSAEFIQ6APIFVqIW5jnBtWWTXal3AonM/7eXRsXgECJUE4ZWrB/
	uOKURDX20djbr4eLlZdNGPI4/4l+ho+h+yautNfdkIgOl22kpyqOhPYuZx4sn7Re4kkhThK1eug
	gqXIbhRB3mTwSWyxraH7ZM6tQZ5pMqek4hhMqy7dikf0=
X-Received: by 2002:a05:6a00:3997:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7e00d9f1159mr2905642b3a.18.1764768423095;
        Wed, 03 Dec 2025 05:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3XWwRERuATrIUZCSdcB+/sIIpWZxxTyj2tL66l6kLmoEFxK0f5zm0a6z6wxREpXe72xyS6Q==
X-Received: by 2002:a05:6a00:3997:b0:7ae:fea:e928 with SMTP id d2e1a72fcca58-7e00d9f1159mr2905595b3a.18.1764768422586;
        Wed, 03 Dec 2025 05:27:02 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6e06sm20287524b3a.43.2025.12.03.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 05:27:02 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Wed, 03 Dec 2025 18:56:47 +0530
Subject: [PATCH 1/2] dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document
 firmware managed PCIe endpoint
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-firmware_managed_ep-v1-1-295977600fa5@oss.qualcomm.com>
References: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
In-Reply-To: <20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764768410; l=3940;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=NNc36LsdP5Sf/Sh+P4pWzTOufULJNwh9nH+aJTkV9xI=;
 b=HiCJ3Fl8IFEM+UrqtTkUmEmPs9kOd1R/nCNE9OLGPFWL3jjEBxeLf5lQThy+R7ZRcRJF+nfon
 Dor8rwhGev1D/1cg2Z0p/PMG6QGxvOxQM8ZnIoqY0Z0HpVEDRyZursA
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-GUID: yoIcL5L6h3eCdWhu-ILcOtTMh4krqSQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwNyBTYWx0ZWRfX2Gs236vBFfkY
 tbZvufC8BjYc5L3t5kncGBHeJeSZm77g6Ak6t3g8kksOP5u9G4SAbri5C87u1xTUKnYeP3cQvVd
 /E3hCK9HLlycXjK5G353XLyL2mt7J0p3xRIWq5P4IVF3RccAdrhN2tNB9wAIpITk396+TTPPg5a
 PRg9WVtwwuiE2+ccZB+D8qpQmc1AnRkLkRV1788y/OQER3xUVgdjl56JY7hKJ0RDZ0GhpSUXTFK
 qMf5OIcbWWCQ9+ypRyk9/9tOFV6j3oMa2cI3QtlLceCQXsvs/9+fal2TORanVbrfRDYHaRRvEE4
 +B1V3cmt2LaddDgEPeGc1euQvOJDe+qIFp91TqcoK2yr41491nB7JMYhQfypYsW0awBpHxK0GQh
 qSPduykhaEvKlRh0joBTPWtOze6XFg==
X-Proofpoint-ORIG-GUID: yoIcL5L6h3eCdWhu-ILcOtTMh4krqSQF
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=69303aa8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=avnAaoOVoNrTWVjlPhgA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030107

Document the required configuration to enable the PCIe Endpoint controller
on SA8255p which is managed by firmware using power-domain based handling.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..970f65d46c8e2fa4c44665cb7a346dea1dc9e06a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep-sa8255p.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-ep-sa8255p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm firmware managed PCIe Endpoint Controller
+
+description:
+  Qualcomm SA8255p SoC PCIe endpoint controller is based on the Synopsys
+  DesignWare PCIe IP which is managed by firmware.
+
+maintainers:
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-pcie-ep
+
+  reg:
+    minItems: 6
+    items:
+      - description: Qualcomm-specific PARF configuration registers
+      - description: DesignWare PCIe registers
+      - description: External local bus interface registers
+      - description: Address Translation Unit (ATU) registers
+      - description: Memory region used to map remote RC address space
+      - description: BAR memory region
+      - description: DMA register space
+
+  reg-names:
+    minItems: 6
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: addr_space
+      - const: mmio
+      - const: dma
+
+  interrupts:
+    minItems: 2
+    items:
+      - description: PCIe Global interrupt
+      - description: PCIe Doorbell interrupt
+      - description: DMA interrupt
+
+  interrupt-names:
+    minItems: 2
+    items:
+      - const: global
+      - const: doorbell
+      - const: dma
+
+  iommus:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO used as PERST# input signal
+    maxItems: 1
+
+  wake-gpios:
+    description: GPIO used as WAKE# output signal
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  dma-coherent: true
+
+  num-lanes:
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - reset-gpios
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        pcie1_ep: pcie-ep@1c10000 {
+            compatible = "qcom,sa8255p-pcie-ep";
+            reg = <0x0 0x01c10000 0x0 0x3000>,
+                  <0x0 0x60000000 0x0 0xf20>,
+                  <0x0 0x60000f20 0x0 0xa8>,
+                  <0x0 0x60001000 0x0 0x4000>,
+                  <0x0 0x60200000 0x0 0x100000>,
+                  <0x0 0x01c13000 0x0 0x1000>,
+                  <0x0 0x60005000 0x0 0x2000>;
+            reg-names = "parf", "dbi", "elbi", "atu", "addr_space", "mmio", "dma";
+            interrupts = <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "global", "doorbell", "dma";
+            reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+            wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+            dma-coherent;
+            iommus = <&pcie_smmu 0x80 0x7f>;
+            power-domains = <&scmi6_pd 1>;
+            num-lanes = <4>;
+        };
+    };

-- 
2.25.1


