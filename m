Return-Path: <linux-arm-msm+bounces-54783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F1A941B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 07:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3875019E7C1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 05:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B817A2E7;
	Sat, 19 Apr 2025 05:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwgxfDsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B59C17A2E8
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745039984; cv=none; b=RDEmlgpT4KltKNsnRWTfxdH5SSGQA6KQWj/wOcwAuh21i+QUYLPFpvUpLC/JklhnZZkjC7/1eyQnTXoRkiJf/kaYCUjTb47SkQmPwolMSfg/ZT2WGXe3SoG/D2CwM7Hox4sn8bJZnS5XAQPulSxFNSaSpm/xabgl9X9fZcedwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745039984; c=relaxed/simple;
	bh=nE7IjJhMRhNyIuWq7+m22BFxM13wxFoka3TTlw1/Y/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJxiRairWQOyTE0IZRyyrvjJ54tpdC/EACVH3W45FEuqZy7wpS/OmHAlqfNu2bZgNdIro9KZLq40TSzsvmKYv9yK9NM6+/f6nxl6u9w2k02/ReDcIYdbE7srCbdGWQtqZzr5k5VhIkSOg9aNAsAnhXSYsjySmzkmfH8jIdgcLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwgxfDsz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53J2B3JP003202
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLU2POU7c4DnlLOSszh8lb+fHxRv3wzsnmbCELHaQdQ=; b=mwgxfDszGfEHRJIf
	pnfSqi5wrdTEfQWeEygI7ml0EnIx2eRlt1bd3MAdJw/HqCrdiW/cfAoS1yCe+TyC
	s2uXGNyCt9vFfQsqf7H3HQ8EaVu6CT/B1KoYGWtCVxjb3LBQvrVkpdCviIKp9iEC
	LH/xaflb5JuzGkh/Du1nqX9P8qVmCmTK377AdDp0WMO/ibYDJp49SwWB/osres7m
	Jgho3RC7JfMobT5w2gZmB/VExW8y/mVYfULNxySjrgNiB17X7U7viSP9hzHiBens
	Jo+bmcJWg+/+l6YAVyqGjK3prv+TT0nzL74ypp3wgOHqjLSR/bR5/zWpOiFPDvZw
	qTdDlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642sv85qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Apr 2025 05:19:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2265a09dbfcso36214185ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 22:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745039980; x=1745644780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLU2POU7c4DnlLOSszh8lb+fHxRv3wzsnmbCELHaQdQ=;
        b=xO0M3m9BVCIam9s8wRE1mo21qfc8FOETtH1MsQN2Yg+DtWB6xNhvTL6xC4IVOJc5q1
         l1CHjy5tGMAvaEHzMbyIYdUaLoo78Iyedl0qoLRy0szA0riEow9a2O3Ht47Eg9RyAXYi
         4kIqA1P10+wANVX+W10t+dZNJ6zR73EGDUs3m1UiprPG5bI4lWMf1dk8qUF2lprCUwc9
         /wGxp5KId13ghZxYE6kXKk8bwZ7iw46LZCpdYfL3VAveAGQS3BnAaTi6u6Gh+2k/4e1N
         m3rYQq/SZp9kf4DACBafvTXsw+whcrPw4yPRdbgAPXCVVI8VuAFyUPaPdDhMatRDFjbp
         jrPQ==
X-Gm-Message-State: AOJu0YwLzcpQUeFtLvEX44o/GJRb9AJfh8+S5c4QYMVYdoDc32MZCXR3
	Sl5PAf/LNMXQvvPC2R02Nb4NdxA01b+/1P4KjbafOM4eK2UmoI+37a1/JNqpoAdjVBqdu0jrYnN
	mXqG0bpMCv8NlukpbrAwVaZ+vyMGHGrXn+keTumQTOeE9johgVlygR2MQQ4g2nogN
X-Gm-Gg: ASbGnctWVW9MSlk4+jKg5e384s20nPj9g3av/NmtJWcYkYTM/Sm4Cv90yncmev2WUM7
	JzMfoKrUHkVLgVatVmALqSjCRxGNVG5FBgrHd3SovwQFcLRKzssbr22aGOP13A/IAc9PsjAwJCW
	XTaLjhHunyx6BszXvuzuEVCxQ3PK/WOgoq9yUx+Ky35aqHgSUvdio0vhw2DcIdVsOcdLx5CO4OH
	EPs91j+W6p6YjtolE1jC4zkrdsjy51MeIJbeGk2ZZS/hOJVVBBWaMdNheWnp7dYOeq6XxUdoukr
	uk5c33mz5a6oX/xaA+TKhIFKyF3thMj5HJhbjP3IEtde9ks=
X-Received: by 2002:a17:903:2451:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22c5358123dmr75029265ad.12.1745039979628;
        Fri, 18 Apr 2025 22:19:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3X5l3b/pEi4aT+9a3cQflRBBkyCuwkE36I24LsP/TkO2/xmEsZO4B/kwr/OjIaYdZeHRTzw==
X-Received: by 2002:a17:903:2451:b0:224:1c41:a4bc with SMTP id d9443c01a7336-22c5358123dmr75029035ad.12.1745039979247;
        Fri, 18 Apr 2025 22:19:39 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaac258sm2607932b3a.144.2025.04.18.22.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:19:38 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 19 Apr 2025 10:49:24 +0530
Subject: [PATCH v3 1/3] dt-bindings: PCI: qcom: Move phy, wake & reset
 gpio's to root port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-perst-v3-1-1afec3c4ea62@oss.qualcomm.com>
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
In-Reply-To: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745039969; l=4358;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nE7IjJhMRhNyIuWq7+m22BFxM13wxFoka3TTlw1/Y/k=;
 b=H82j7c4p3tWE1YGpV61jcSCWDogj71ruiOk3nh6IgF8P6eYre6j3+90AWZbZlKyDSvE9X3NIi
 2CwtEJJGPpwCXp1dSqc+ai57Dibvly8Wh+w5g2jJ9m3Dm9mwPGOHBz5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: g6H6gmw17H3geBSq8J7NeddhW018ifyK
X-Proofpoint-ORIG-GUID: g6H6gmw17H3geBSq8J7NeddhW018ifyK
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6803326c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zZdbXEcupTeRExCOI60A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-19_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504190040

Move the phy, phy-names, wake-gpio's to the pcie root port node instead of
the bridge node, as agreed upon in multiple places one instance is[1].

Update the qcom,pcie-common.yaml to include the phy, phy-names, and
wake-gpios properties in the root port node. There is already reset-gpios
defined for PERST# in pci-bus-common.yaml, start using that property
instead of perst-gpio.

For backward compatibility, do not remove any existing properties in the
bridge node.

[1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-common.yaml  | 36 ++++++++++++++++++++--
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  | 16 +++++++---
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
index 0480c58f7d998adbac4c6de20cdaec945b3bab21..e5f60faa18ad68a29900a66fbfcba3d4f8e88e7b 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
@@ -51,10 +51,18 @@ properties:
 
   phys:
     maxItems: 1
+    deprecated: true
+    description:
+      This property is deprecated, instead of referencing this property from
+      the controller node, use the property from the PCIe root port node.
 
   phy-names:
     items:
       - const: pciephy
+    deprecated: true
+    description:
+      Phandle to the register map node. This property is deprecated, and not
+      required to add in the root port also, as the root port has only one phy.
 
   power-domains:
     maxItems: 1
@@ -71,12 +79,18 @@ properties:
     maxItems: 12
 
   perst-gpios:
-    description: GPIO controlled connection to PERST# signal
+    description: GPIO controlled connection to PERST# signal. This property is
+      deprecated, instead of referencing this property from the controller node,
+      use the reset-gpios property from the root port node.
     maxItems: 1
+    deprecated: true
 
   wake-gpios:
-    description: GPIO controlled connection to WAKE# signal
+    description: GPIO controlled connection to WAKE# signal. This property is
+      deprecated, instead of referencing this property from the controller node,
+      use the property from the PCIe root port node.
     maxItems: 1
+    deprecated: true
 
   vddpe-3v3-supply:
     description: PCIe endpoint power supply
@@ -85,6 +99,24 @@ properties:
   opp-table:
     type: object
 
+patternProperties:
+  "^pcie@":
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+      wake-gpios:
+        description: GPIO controlled connection to WAKE# signal
+        maxItems: 1
+
+    unevaluatedProperties: false
+
 required:
   - reg
   - reg-names
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index 76cb9fbfd476fb0412217c68bd8db44a51c7d236..eb70cc6b6618af43fb03e124db20e2ade26a95ae 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -162,9 +162,6 @@ examples:
             iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
                         <0x100 &apps_smmu 0x1c81 0x1>;
 
-            phys = <&pcie1_phy>;
-            phy-names = "pciephy";
-
             pinctrl-names = "default";
             pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -173,7 +170,18 @@ examples:
             resets = <&gcc GCC_PCIE_1_BCR>;
             reset-names = "pci";
 
-            perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
             vddpe-3v3-supply = <&pp3300_ssd>;
+            pcie1_port0: pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+                phys = <&pcie1_phy>;
+
+                reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+            };
         };
     };

-- 
2.34.1


