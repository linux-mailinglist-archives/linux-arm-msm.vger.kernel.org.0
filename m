Return-Path: <linux-arm-msm+bounces-85559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97ECC8C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4EDC3066F2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8341C33C18C;
	Wed, 17 Dec 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VROU9UeB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUpTjqOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3B33F8DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988370; cv=none; b=unn5PxtwwTUGqlfr3WF2AKIgnLNSLes5F+FB7b65XWsx3DNxgkVlYVIpOXUOZ3eoGBx4yj6cpFSBGHwMmHzXmumdlpbkXFrWak+4nCfxlmAGVashJXRFzr1X6sl9JqBX+l8Lt4kAH4my7IrwEaIOrK3vw9ik3fAGIfM0EIMV04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988370; c=relaxed/simple;
	bh=LR/FQBATgMO/UVGWrdZY62ELBL/9ndTjPtSWv9hC0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gtAQxtNE8OUhTabGe0eT7XGbhxtFh8HGkiiwOULaURuU8mCZAI/xT6tZcO2ffafOvKTporqV/svP0GmR2bUqpemeT56jB04UjtqzqfdHjAjDOh7JmVntIpmuLDMcIW+qRgfKg2uqAzWenWghbtF2i9B6oeBvKN7QD/KNMRidPvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VROU9UeB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUpTjqOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKoux2465116
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oo36gjSASJj40XPbYdPCkJV7xFSUk3DQ3EwxnCWVDYA=; b=VROU9UeB877zk5rY
	i2WicvMeEc91UqTVujPREcAWEvB71toGkH4UPL5UAI/6a1zBVm7AXrPS2ZyExE0i
	zj/ASUyH67iMHAXdMTEdJcObeDTg65V/abdH5CifkcCG+7LKh2Py5VBi4xRC6ttS
	3Yl9NMU3HkBXSiWc3Xj0CZ/j3riLfM53TPC2pIkvSOyNpvrmlRUkMexUTlEOj1oy
	ZWVsYchwAqg/yQCmob2aIewqaH248HDSf0oVODY+LhMdV6jmkSkk/JBGydH7V3k5
	1Nw0Eqo+mnD99y4nCUUk9omHlgVwheiFMulekZAg3RQVMxFJ4TW4VD2ChIxARPYA
	3hwH2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2b669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b4f267ba01so189729385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988366; x=1766593166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oo36gjSASJj40XPbYdPCkJV7xFSUk3DQ3EwxnCWVDYA=;
        b=KUpTjqOD3/E0xFavd53UH8aB/tKIJ5nYyJh39SnsMohO8dHBhoG0FJvKAPSbDarBX8
         tTWzZ0UKeuwGJoF6O1hdDEav44oMeaxWVugJTlF+Xn2PsucZQNwFWYkFQCS1kM2KAlbX
         DHDi15PHDP7f+WyPUekqgQ7Z+G4Fm6+BtoK9zxkcS3ihgFWom0/WpJSvVZT9uNs2YyzX
         rKGNd6bVGC+3Aqe0RGrFdy0lL1ZMnKXS1HE8qpKP086gbG4MASNX4vKjzX0c89qpmOpL
         KjlZ68AkVv3Fy2zpBjOH/PjzYZPD3jIEIFVOPAncUOf2OWFGGxUIVCw2NWl7fvNu13Xc
         UWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988366; x=1766593166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oo36gjSASJj40XPbYdPCkJV7xFSUk3DQ3EwxnCWVDYA=;
        b=Dfi7S4xtzl+HQG4saEYSLgdv9r8Erh3sV2gsk2ABumT8H4KUKtGNbsL4X8cLpWUCo1
         XL6cXG/wLu5MX4DhAcRjaLmt12udfJ1PHNtOCFl5VmeXDsaSge+A1WjdJpM9goksk26u
         0cAraEKfJLCRK9GIywGtxZi76MHOTHHmcvkg9kEo3AEZw0D/DUGRHR9ebNQhDl9G2ioU
         1h3Qy21QYMnxNmclHKCYJGeJEkCj4KPGyjwdjui2v/uUZieIVXJ0V5cl9bTn2yxbwfB2
         bboEKJv4Q6f0vB0SWg2NqMYmp/+sK/tcqNuJklOYtjFRMI3k+/Ebwt9OSJ/ktlgCgQUr
         8SBA==
X-Gm-Message-State: AOJu0YyM6hPkc/3Jq1pm1V6hyAvvmvy4ptlR4WNrLEZAPcJ6lpnyGWFf
	4JvFZ3ayv+xKz8LcnCWOD07kv7MINLOkyT6DkG63rEbKvr+hqVGtBeEMxanr3SMZrxj0tVZqcIU
	9xjBmksBonNsQ7gPrkEE1LESbl/0XmUbxUI42RKTldZbFp2nBZH7rOPty9ZTmSZWMEzvp
X-Gm-Gg: AY/fxX4joNms3LPRJuVjbvBv45a6HQYWkuOgk4H+nBUC3NhlSUc2yr0mxk4OxQuSJ6z
	Fbtohzk29QMR0HkouuLx04FTDA6et4WblchOBO9OM5t3uHNeq7Yt5t8Re7VJN972Ry5dR6ELDKv
	wgS05aCkdjzxBwcQH38QgxSNDuUwktCEWLtOIWsMrnADrsMmwLOjkF2YSaAtttUKCDwTkfIAsgH
	3kchzOjf6ydkJK/QTgJy5IFKoZJY+C8RY55fjD/nXykOjs7fMn7nV+cKDstP02BRqw9KrRtQ4Kw
	RWQajx7NgtwvSye2rmbb4oQBqgTFPEo12wWpOZq2AnI8Y5y2IwCZtJMPzYQTGLebqxSRgPi37dC
	4Ve3BOZfLJtofRzMLWdV7HQO4FFjyI6Mb
X-Received: by 2002:a05:622a:11cc:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4f1bfc35dd4mr273369131cf.27.1765988366107;
        Wed, 17 Dec 2025 08:19:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi5Q6v0Of6oxuKw7JGP1L9W6cQeMCi6gPvpY6QygOeseGy/G9ty0aJw19CZfZGaFSY3fkhAw==
X-Received: by 2002:a05:622a:11cc:b0:4ee:17d8:b583 with SMTP id d75a77b69052e-4f1bfc35dd4mr273368131cf.27.1765988365172;
        Wed, 17 Dec 2025 08:19:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 17:19:08 +0100
Subject: [PATCH v2 02/12] dt-bindings: PCI: qcom,pcie-sdx55: Move SDX55 to
 dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-pci-qcom-v2-2-873721599754@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8236;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LR/FQBATgMO/UVGWrdZY62ELBL/9ndTjPtSWv9hC0M0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtf9UxFrHLm34w5JiPynQKo56li1qMd9Cg6gB
 APkTZb5xcaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULX/QAKCRDBN2bmhouD
 1+MID/4qYAsckrU+C5CJ1iQNSHs+A8Ic5MktGFqKW7HteJ+9AtEKsa1LtPqWog0Zr3gJfYZ/Q0k
 gCH3SIvchyNQ4lp9U4HhdC7zZ3TBOPESr6qrVtmhUCZw4WOMYvuXRK6x/375zNxkvfJMcvrX5Bx
 zeisiFJJYXEfyfm+/dLhOIkDDlPnZnsiIiCPVuvoe/JqMOGrYVJBu3512fpAujhfj/shUPtYipH
 1lm+lfVi6htbcqNBIjmBgaIUapADuH1ZXVMpSA68BU/mHncxD43RvwRqcjmnIPK0iwBKleTjE0T
 Q+E4/kea4UTT5OHV3YQcB+GKYSkTySbizDlkdDPX2hcU+t11uhB9/cK2vxxSmjDNlFQn/bJ1GvE
 1TH1M2DoNl0xfbTuyOE5miF0WNj6Ay995z1aW8FMl38X/1sc1Brn1qsqa6oRNK0LenA6ZGTlwhn
 HUDFfUMfiJIS2W4f4dfM82w7LXlhezO6tFwSkRTl1GJBdFO4eQLOwu/TlO8mTQNhPH5r+PRaphe
 s6Ayt3H/btHBexKQlaifLb02QEsqsvfV3MbyvsN2sYqUAbP9+ecNogMk1EFiDRGOfF0AHvQjNEg
 nhrWHzaQcVFP84JFYCUFqWDui/Cxt9O5gwxL15XpZDliVs+xZO6682/DI7HBQjUJghetqwC/Bxf
 dWUIM3QF3mcS/Dg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: wrqQStvTF1KPpUhbLrClw8kfGh_q41Z7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfX+GIahLwcCpm6
 orvTMR1MiShA4BhW3hw6l2mEELOHyNVTN7iDaBqF6aOFAyX/r7nU0V0be4jRf9p7KzjsL+rmx++
 WkpTije5oDkROnh1sgmC37s2sHifISudaxWA1R2tny1VRCpH58oqpSvQKP3t+ED7bJ45aOe2tFK
 py6rLVhluMuzcRs6wGNs4fP0+lwOuYFxX54cT6JtFOm3E+VVc3JcQVCTzCmHkUA4fJyu+ikCiXg
 JtbvKMtVZOh7s+DVh59wPRPk8eNAvI49ZS/DvOaC7d422zgGTLxJrguhoZboTJTAi5X6+nx5fhy
 /U5FrWLdIzXJZtpkc6EvB+qRG+WEQwH1CY6e90/1rmva5TIaSrylWOv7LJ81eWpjKNPrGwOWlXL
 E/8QFu+PJ+AY20PG2vali7+D3J20hQ==
X-Proofpoint-ORIG-GUID: wrqQStvTF1KPpUhbLrClw8kfGh_q41Z7
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942d80f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=klm9TE13DJW_JFRMJakA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170128

Move SDX55 PCIe devices from qcom,pcie.yaml binding to a dedicated file
to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.
 - Adding interrupts based on the DTS, which were missing in the
   all-in-one binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-sdx55.yaml   | 172 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         |  48 ------
 2 files changed, 172 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml
new file mode 100644
index 000000000000..7f6fd81e7ed0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sdx55.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-sdx55.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDX55 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-sdx55
+
+  reg:
+    minItems: 5
+    maxItems: 6
+
+  reg-names:
+    minItems: 5
+    items:
+      - const: parf
+      - const: dbi
+      - const: elbi
+      - const: atu
+      - const: config
+      - const: mhi
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    items:
+      - const: pipe
+      - const: aux
+      - const: cfg
+      - const: bus_master # Master AXI clock
+      - const: bus_slave # Slave AXI clock
+      - const: slave_q2a
+      - const: sleep
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: msi8
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: pci
+
+required:
+  - power-domains
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
+    #include <dt-bindings/clock/qcom,gcc-sdx55.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@1c00000 {
+        compatible = "qcom,pcie-sdx55";
+        reg = <0x01c00000 0x3000>,
+              <0x40000000 0xf1d>,
+              <0x40000f20 0xc8>,
+              <0x40001000 0x1000>,
+              <0x40100000 0x100000>;
+        reg-names = "parf",
+                    "dbi",
+                    "elbi",
+                    "atu",
+                    "config";
+        ranges = <0x01000000 0x0 0x00000000 0x40200000 0x0 0x100000>,
+                 <0x02000000 0x0 0x40300000 0x40300000 0x0 0x3fd00000>;
+
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <1>;
+
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi",
+                          "msi2",
+                          "msi3",
+                          "msi4",
+                          "msi5",
+                          "msi6",
+                          "msi7",
+                          "msi8";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                        <0 0 0 2 &intc GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                        <0 0 0 3 &intc GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                        <0 0 0 4 &intc GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+        clocks = <&gcc GCC_PCIE_PIPE_CLK>,
+                 <&gcc GCC_PCIE_AUX_CLK>,
+                 <&gcc GCC_PCIE_CFG_AHB_CLK>,
+                 <&gcc GCC_PCIE_MSTR_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLV_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
+                 <&gcc GCC_PCIE_SLEEP_CLK>;
+        clock-names = "pipe",
+                      "aux",
+                      "cfg",
+                      "bus_master",
+                      "bus_slave",
+                      "slave_q2a",
+                      "sleep";
+
+        assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        iommu-map = <0x0 &apps_smmu 0x0200 0x1>,
+                    <0x100 &apps_smmu 0x0201 0x1>,
+                    <0x200 &apps_smmu 0x0202 0x1>,
+                    <0x300 &apps_smmu 0x0203 0x1>,
+                    <0x400 &apps_smmu 0x0204 0x1>;
+
+        power-domains = <&gcc PCIE_GDSC>;
+
+        phys = <&pcie_phy>;
+        phy-names = "pciephy";
+
+        resets = <&gcc GCC_PCIE_BCR>;
+        reset-names = "pci";
+
+        perst-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+        wake-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index c61930441be0..0e6d11791eec 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -31,7 +31,6 @@ properties:
           - qcom,pcie-msm8996
           - qcom,pcie-qcs404
           - qcom,pcie-sdm845
-          - qcom,pcie-sdx55
       - items:
           - enum:
               - qcom,pcie-ipq5332
@@ -210,27 +209,6 @@ allOf:
             - const: config # PCIe configuration space
             - const: mhi # MHI registers
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sdx55
-    then:
-      properties:
-        reg:
-          minItems: 5
-          maxItems: 6
-        reg-names:
-          minItems: 5
-          items:
-            - const: parf # Qualcomm specific registers
-            - const: dbi # DesignWare PCIe registers
-            - const: elbi # External local bus interface registers
-            - const: atu # ATU address space
-            - const: config # PCIe configuration space
-            - const: mhi # MHI registers
-
   - if:
       properties:
         compatible:
@@ -579,32 +557,6 @@ allOf:
           items:
             - const: pci # PCIe core reset
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-sdx55
-    then:
-      properties:
-        clocks:
-          minItems: 7
-          maxItems: 7
-        clock-names:
-          items:
-            - const: pipe # PIPE clock
-            - const: aux # Auxiliary clock
-            - const: cfg # Configuration clock
-            - const: bus_master # Master AXI clock
-            - const: bus_slave # Slave AXI clock
-            - const: slave_q2a # Slave Q2A clock
-            - const: sleep # PCIe Sleep clock
-        resets:
-          maxItems: 1
-        reset-names:
-          items:
-            - const: pci # PCIe core reset
-
   - if:
       not:
         properties:

-- 
2.51.0


