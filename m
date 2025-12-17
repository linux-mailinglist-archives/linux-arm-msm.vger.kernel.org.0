Return-Path: <linux-arm-msm+bounces-85563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB29CC8C15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2A12312AE4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE50734C80A;
	Wed, 17 Dec 2025 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fnAUHClV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuWTZbZB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12034B185
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988377; cv=none; b=pcg3ArVnlhU3mltRXu6OJnZkiUkKgW9qj8Dt1+tcnzhH6g22olv9F6RtfV4Ihurv1jAdGU8oKDU/m+AT58QyK5VlirAfKGYEZ//pvSvpl/1wnI8MZ8qlIUTg41leyKg6s+sNSmM8QMnLsCUoyM9wTBQh41vcgfh4wNYR5eZm6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988377; c=relaxed/simple;
	bh=hghuRyv+qT1MrjB2/JML4BsNG+rafMrXyz+UmrUiKwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsZnHvy7o5HdWDHvvzNilpAV/xPjjtjXr+RUUyeD2W6+IiSibHNuYLmW3F8ZWF32WTqxgvzd4iqRO6/oVhfh6hEON1iDXA4BxK9awCyeGrHLz8uvGMLiAypIqx8NWM06NmX37fp+WC+sm62RJcqa/j66sNWP0/3PqNSOXyb/VQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fnAUHClV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuWTZbZB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL5N22465595
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	se+gkmISsGZ11af5o3V+1DJwv7Z9tZaY7bPpyFED+k0=; b=fnAUHClVhxmCrrxo
	z7F0CB9WM1UrJfznus+m1ftVHM1tZOX/dfg7KFKPz16Pz0sTMbqmF8om8IDU5Hd0
	fENag+YOOG997ed9RnRTk8CRRAaeWMZiZCemKB9UBhJ2V4xS5pv7XDAkU/+uVRX5
	On5Rig77SgmFiUHcuYO7RsYRmZYl6eNzP206a3v+BAMyCm+/8nRyeHe7VsrKX7//
	Cg4sX7Qsc2Nk0fB//5q0DvNyPTj5D9RgIHWp34zGrK8egmu6+i59qDtZbsRjXlhT
	Ku0si6R5VGxfznfqMUv0xD1Bl8YgBJe/60j6dg/Pv5R6bWVa6lOLyEcUUar6zl0G
	iFTD/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2b66p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso128140971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988373; x=1766593173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=se+gkmISsGZ11af5o3V+1DJwv7Z9tZaY7bPpyFED+k0=;
        b=NuWTZbZB+gXbBPYg4WnV/rmc2PLlZjVpJW4Ktregfe/qS08eOP1BemJw69rwdF4dNh
         ZdJQol4cYI9XWKD6GTGHEjWpIzdWaczTIUkGoY2ny+RxyWORrYsifOJOl+16YFX/kFsj
         R4WBenM2fPGuY+bCCzdM9+Zu5zNCRe0IDhWiBdlTewZlTQ7kuTkFZP2DbSp79YwG3myH
         vdS9Ol7eT27LOfi662C41b3gQbuqDHCErRAZpGIqTf4zFqyndI54d7XEQIslNmei42iP
         pXyS3cjUS0f/MowHXNOg2WSe+2d3yd1FJ3NP3frkC3AkO0F2lqSPhfq+BDP5Iq/3aHeQ
         GWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988373; x=1766593173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=se+gkmISsGZ11af5o3V+1DJwv7Z9tZaY7bPpyFED+k0=;
        b=kK/3LpELnJiZlwZRBE2sBmumAJ0PxeF/yiphtNdn397wS2EeGOXaknRiuC39Ms1ibG
         oVO1Mc6JGmz62wnmql8hE9xnL8o1fJ+4eXaMX/iuzCkSe5/OgAGcyFoZUXSqbbF6luTI
         m27pk3sPgQiRSlJk7Fftka3GEsytWRqDIcuVZSsGYmoGiEB1KvDSECUfFPzIw7W3EPb8
         ZgSodX421s9AFbCRzg3PSvNEMSv1ygWUbqi1EGXxilstXOEhBNX5c40rSk/4qE0+L5Z/
         l9aqwdHLTVd8FdCBP/PN92+a6ytzgYcRIjl+xC/L7R6AXdtcjJPnR+OZM5DDRLin2dog
         OZUQ==
X-Gm-Message-State: AOJu0YwgdmAvGPFQ5I3ax2DBcWpMlh8uppX4O2j7ZVHsV+hszz4pXUnr
	2Tc+B8yNMahNFcEbINwJwrPJA/uXLmcJuGMysMRvJ18EajX8z0mLJmpaPuaQoP8fmAhIwwWm8wR
	wo0BgguciYx2cAWOekG3kAzANb0D0vVrvxffDakValOj+g/gaxWBVTv40jsbruuv0cKR6
X-Gm-Gg: AY/fxX5LFDXVpmqL+Qocf/JQj/K6263HT3/GxPMo/00xxgD+/28tpw96kQKpKK+Q09K
	4gy6IQ+yYlQrq1MIDPYDXlru2VXoD36x8nlnHBKhp+hjuufDaUnNyEIW65YvrwP3dRoZC07NI+r
	+DB8H6gOoHUl3/XDbmXwi42SViKTW69fjtBPkWgg229DVv1wS4IPhTUDPwnXXckewSDHXHjWH44
	Y5lhldMeHs0wzyGUSNLhOymvj3F3i3DPMAiTnrdDqXAhoFPXFQAFwEzPHe7QkYjh9oyX74m+XBv
	/8IQfFdEjM4gzM4cLEaW9X6d3mY3Xm/H8eFZAWyJbcKqRu8eDEuKSRaCCkfUhoUDs/5uSPC4mJU
	YmLulfexHWdaDIxB6iOY9WfE7Pq95PyvD
X-Received: by 2002:a05:622a:2c1:b0:4ee:18e7:c4de with SMTP id d75a77b69052e-4f1d0622d74mr277258751cf.78.1765988373129;
        Wed, 17 Dec 2025 08:19:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqNBqhvHkitHOSmA3vyIySleqco3hAkeYNgLczvWTVUlpVzofrDwaP9pkh8WovSqvYE2kbLg==
X-Received: by 2002:a05:622a:2c1:b0:4ee:18e7:c4de with SMTP id d75a77b69052e-4f1d0622d74mr277258141cf.78.1765988372569;
        Wed, 17 Dec 2025 08:19:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 17:19:12 +0100
Subject: [PATCH v2 06/12] dt-bindings: PCI: qcom,pcie-ipq6018: Move IPQ6018
 and IPQ8074 Gen3 to dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-pci-qcom-v2-6-873721599754@oss.qualcomm.com>
References: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9759;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hghuRyv+qT1MrjB2/JML4BsNG+rafMrXyz+UmrUiKwE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtgBdu/bnYTRjILG4ha/+TQy6OQktxt0ptldU
 igePnh3Hq2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULYAQAKCRDBN2bmhouD
 17uJD/4pvyYNBOcwpu5cSHTMoHxrruquBdA1Nv/ZquBWdEQjQwpTNi0vgWHnTsptSmOZMlWhcQ6
 wJhoDqytsc9A4diimkHVq7IQbvrW6vfux7MVStjoIhpKRakNtk+8ap/2hkYDdXv/nQlBgrVQsRN
 S4I18UGkaBC/eF9E/dkSeim3WfHwhzqt5H1fv8nLCz/xzM+Mdq3T0Itwl0YORvWa98RC83m1f+q
 N2wOPe6FhsCD6k/FWd0UGc4sIPYBFd22BGg5xXYR70mdsXO4PhP4wYH/vzVh5ZkuW47xvVivO5P
 v9Y7dVeNrTXiUhY/lpVg8oURmLGbxATnkwWVaK7nI8VfrvInKbQPUbYPZMvuW+Eyf25xxU++L+w
 jhuc8P5fEdGsy6N2kE9vVccJ5ybyK05Lx/eiO04T0Ii8JNjrhzBTt+EQURLpI3YmmKhSdrGL20O
 iwShhnZ8kvh+Pny48iaQLeF6Ss+dthI2YkQfVK5zaHKerQ7oC8TviK9+e8UNhC5fjxW46fhcFxm
 K7Xl1a+AKzRUqpm+vi9Zk5cQRrfBaoZKCdnYFrx2+FD/U8LgGYdC8lUCWHRa5hYZPwDqYeRyLZA
 +Tg8r1wCZHPUOiwjnpKUhBbDeFRVzY+f3cvGZshK5hGZYIKUD9n+5jNBMnIa6xaTNup1n4Adain
 6QHT81USf1XTnlg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: SQquI5t22VypvEMWcwtpvpmO_eCVk1uK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfXz9bxqxPNN+ak
 keiLlEKYzmf5i8qTW2gGf44xUA0Wc1W8w8TTFmzKnUILnaKouCH9izw4huyf2U/3GPxNLpfF9Z0
 igF+yqw8yI7UOxbW96wE1NNRlG46I5TnUIERMvSwJRDgFfg5mXjRcCBPRjHKulLQOtD8pjTWm0w
 dKSFtwr8aLAAMAsWYdJq3YLiT5g+kfKTq2iStzaEJhbd1Hi1RFcgo4EwzY4FXF2laPLLTrskfLV
 0KPBcc8oo7ek6KuI50r9+aB9Dsn1W2T8JxG1a4Aet8rVBnU1ZrR9P0tmEY4TsCN3DSV+1VvrD76
 qMdsPj1TTnkwtoanH4IPsdrNtB1MS6mpWpGxvpprhoX4dzLL10uF1gH+PyFR/SJk3kPS3+piWlV
 /orTSFqkCqVsaE2RDogXIDEiE31DBw==
X-Proofpoint-ORIG-GUID: SQquI5t22VypvEMWcwtpvpmO_eCVk1uK
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942d816 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=d0cN-5R3_aeRheYbsGEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170128

Move IPQ6018 and IPQ8074 Gen3 (which is the same as in IPQ6018) PCIe
devices from qcom,pcie.yaml binding to a dedicated file to make
reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.
 - Disallow legacy/incomplete description with only one interrupt and
   expect exactly nine of them.
 - Do not require power domains on IPQ6018, because old binding already
   does not require them for IPQ8074 Gen3, devices are the same and
   in-tree DTS lacks power domains.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ipq6018.yaml | 179 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  40 -----
 2 files changed, 179 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq6018.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq6018.yaml
new file mode 100644
index 000000000000..6843570eb051
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq6018.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-ipq6018.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ6018 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-ipq6018
+      - qcom,pcie-ipq8074-gen3
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: parf
+      - const: config
+      - const: mhi
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: iface # PCIe to SysNOC BIU clock
+      - const: axi_m # AXI Master clock
+      - const: axi_s # AXI Slave clock
+      - const: axi_bridge
+      - const: rchng
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: global
+
+  resets:
+    maxItems: 8
+
+  reset-names:
+    items:
+      - const: pipe
+      - const: sleep
+      - const: sticky # Core sticky reset
+      - const: axi_m # AXI master reset
+      - const: axi_s # AXI slave reset
+      - const: ahb
+      - const: axi_m_sticky # AXI master sticky reset
+      - const: axi_s_sticky # AXI slave sticky reset
+
+required:
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,gcc-ipq6018.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@20000000 {
+            compatible = "qcom,pcie-ipq6018";
+            reg = <0x0 0x20000000 0x0 0xf1d>,
+                  <0x0 0x20000f20 0x0 0xa8>,
+                  <0x0 0x20001000 0x0 0x1000>,
+                  <0x0 0x80000 0x0 0x4000>,
+                  <0x0 0x20100000 0x0 0x1000>;
+            reg-names = "dbi", "elbi", "atu", "parf", "config";
+            ranges = <0x81000000 0x0 0x00000000 0x0 0x20200000 0x0 0x10000>,
+                     <0x82000000 0x0 0x20220000 0x0 0x20220000 0x0 0xfde0000>;
+
+            device_type = "pci";
+            linux,pci-domain = <0>;
+            bus-range = <0x00 0xff>;
+            num-lanes = <1>;
+            max-link-speed = <3>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
+                     <&gcc GCC_PCIE0_AXI_M_CLK>,
+                     <&gcc GCC_PCIE0_AXI_S_CLK>,
+                     <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+                     <&gcc PCIE0_RCHNG_CLK>;
+            clock-names = "iface",
+                          "axi_m",
+                          "axi_s",
+                          "axi_bridge",
+                          "rchng";
+
+            interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0",
+                              "msi1",
+                              "msi2",
+                              "msi3",
+                              "msi4",
+                              "msi5",
+                              "msi6",
+                              "msi7",
+                              "global";
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                            <0 0 0 2 &intc 0 0 GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                            <0 0 0 3 &intc 0 0 GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                            <0 0 0 4 &intc 0 0 GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+            phys = <&pcie_phy>;
+            phy-names = "pciephy";
+
+            resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+                     <&gcc GCC_PCIE0_SLEEP_ARES>,
+                     <&gcc GCC_PCIE0_CORE_STICKY_ARES>,
+                     <&gcc GCC_PCIE0_AXI_MASTER_ARES>,
+                     <&gcc GCC_PCIE0_AXI_SLAVE_ARES>,
+                     <&gcc GCC_PCIE0_AHB_ARES>,
+                     <&gcc GCC_PCIE0_AXI_MASTER_STICKY_ARES>,
+                     <&gcc GCC_PCIE0_AXI_SLAVE_STICKY_ARES>;
+            reset-names = "pipe",
+                          "sleep",
+                          "sticky",
+                          "axi_m",
+                          "axi_s",
+                          "ahb",
+                          "axi_m_sticky",
+                          "axi_s_sticky";
+
+            pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index b448b8f07f55..780a77f35b34 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -21,11 +21,9 @@ properties:
           - qcom,pcie-apq8064
           - qcom,pcie-apq8084
           - qcom,pcie-ipq4019
-          - qcom,pcie-ipq6018
           - qcom,pcie-ipq8064
           - qcom,pcie-ipq8064-v2
           - qcom,pcie-ipq8074
-          - qcom,pcie-ipq8074-gen3
           - qcom,pcie-ipq9574
           - qcom,pcie-msm8996
       - items:
@@ -164,8 +162,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-ipq6018
-              - qcom,pcie-ipq8074-gen3
               - qcom,pcie-ipq9574
     then:
       properties:
@@ -350,39 +346,6 @@ allOf:
             - const: ahb # AHB Reset
             - const: axi_m_sticky # AXI Master Sticky reset
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-ipq6018
-              - qcom,pcie-ipq8074-gen3
-    then:
-      properties:
-        clocks:
-          minItems: 5
-          maxItems: 5
-        clock-names:
-          items:
-            - const: iface # PCIe to SysNOC BIU clock
-            - const: axi_m # AXI Master clock
-            - const: axi_s # AXI Slave clock
-            - const: axi_bridge # AXI bridge clock
-            - const: rchng
-        resets:
-          minItems: 8
-          maxItems: 8
-        reset-names:
-          items:
-            - const: pipe # PIPE reset
-            - const: sleep # Sleep reset
-            - const: sticky # Core Sticky reset
-            - const: axi_m # AXI Master reset
-            - const: axi_s # AXI Slave reset
-            - const: ahb # AHB Reset
-            - const: axi_m_sticky # AXI Master Sticky reset
-            - const: axi_s_sticky # AXI Slave Sticky reset
-
   - if:
       properties:
         compatible:
@@ -443,7 +406,6 @@ allOf:
                 - qcom,pcie-ipq8064
                 - qcom,pcie-ipq8064v2
                 - qcom,pcie-ipq8074
-                - qcom,pcie-ipq8074-gen3
                 - qcom,pcie-ipq9574
     then:
       required:
@@ -466,9 +428,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-ipq6018
               - qcom,pcie-ipq8074
-              - qcom,pcie-ipq8074-gen3
               - qcom,pcie-msm8996
               - qcom,pcie-msm8998
     then:

-- 
2.51.0


