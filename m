Return-Path: <linux-arm-msm+bounces-48929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9483A3F9BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386333A8024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0BB1F5424;
	Fri, 21 Feb 2025 15:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkftIhmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D761F03CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153132; cv=none; b=iURQxXfcrekZAotGQU1c6/rzvq70MacqgN8Npau44CT+6VB/gwLpLKmWJhFceHMiPTEP8K5DweBoTIgqTKVRI7qSo6KYSpr3v2GOCEp6k/Gxttct0+fENK/R5f/Wo7fklFenw6UcraMUm+tI5qvcHk0uCFi+rmU6kR4cz1B/bBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153132; c=relaxed/simple;
	bh=Pp5hOcnQELo/7BP6swQt7kdhd42O2Fh3+oi2amQIZUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpoQHo2U5NBdsPMlstig0yqxowSuDSaZWlt1zgtL4j62J4QbNTLed9XJX+5/ffDUgFcDt9dWiMMk0GdfKLb0+PiWgBvfseQ965lWRd5CrecmyGpn8OXjpRN5UiZ+rB7MTNA+ArwPOslVNYJYqEIeK2a0uCxAZhPxNl9/o0IUa0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkftIhmG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30737db1aa9so21712071fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153127; x=1740757927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUsxu7XwVBkro4/jQjmeTcO/Tqby4cEEewDXSAP2zrw=;
        b=zkftIhmGpMjr42Fyub9xB5wlPmqA3DOgChOzs2p9l8YAiZ4xJtnF1dovatqu4yIaso
         bsDc0SwVkvakgPlkLs0+pw2iYcUxMeIKLwE0uWxZgnkL/yna7V8pPUkEB1zQ5nfQbLJ4
         iUXMjH3ylWK2FsGwayA7NCnOrSugU9m9KdMg19HLKZiHPo8hV26meXGR6GDDIk7E7w/8
         tHGS+tqHig7IvWsSdzs97eAhJ1+CS0U1o8xvTK7eMCP6uhBUU2DLkjqDdOyj73eOJut5
         6S/z+6GKKtDGx9egHWs5DePkZaaDH5YR3CNVjan77Cfz+rQKty4fZ1SKPUimTZGmRQNw
         bDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153127; x=1740757927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUsxu7XwVBkro4/jQjmeTcO/Tqby4cEEewDXSAP2zrw=;
        b=IUSvo1QAuB3xvUI0EwBH1SAtnG8Ve7xrH2gCUv/KNSgdrx3MzRsutZmuCL5jCRrg6c
         fBOymLEe1kMxvs2KpmnTIvzmDl9wsO/3R64tG+WNeX72NFfZ/NUjYuy2tp93Qc/SilR5
         fWKmhh+PV8CfrrZDx4/54zweHezX/SMeaHeT/aX8xJQmYSKLmr8yy1a299lWPtTR6iaY
         47lnoFG3MuNgnXc1nmLQCm+ELcAqgnfpJDAzvJ8SMl9NyLr4de8A1l2FhxscRFvadjIu
         U/NZCaOdfK2z5Tt6DbC9n7UE2IYui1I1u+ulCpYSUkUIcj/C3F7dZPMBGIyHf3liot58
         oFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLvcWS8DBu6KjgQCAJKsvA31YcUeHHrXqR+OzUkTOW3sPOWUbYHZT2dgytk1HsgtMXcMpAmq5aAsyv6tk2@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0iGPAM+U88CsEl+tEb+qbu/eYhJR7drLHB6sC77rhTIsD84e
	9nBXutEKX0LZb8FDACxIKiTTYPVSRYGmuqXoF+0k/YE3U5iamEXJD5enH6jOE9Q=
X-Gm-Gg: ASbGncuMXDc9ErJvGGlflu2rPr4FD4XKfS9RHbJXmGvVwz4HaP6FK/TWudHFCXGIyRN
	aUX1xbAMe/oGrpRrzhP36zhhCVoD/miGAWAycLKfJdhxnmWgjOD1I35ba3k9f3/JDRXXifvfW82
	JRvKayNUGPlabOf1QILCU9W0RTQO/uEk2GNxGSyLUGU9qDixoYbuvdJwHW9Ieuz9TaOH20gzXgh
	ClPuletE5KaE1phVBXrWQFcUYmNVCTXbZ+dRxz46qm0lrjXvFSfENW7HyOFWEi7VP/l4sEjvurD
	wZtc/oL7QoKcQFawo6tGmsUhOC2PVhv1rABXbjoS7JKiDuBNkgW8nfXM0qrzVTiC/WXTcA==
X-Google-Smtp-Source: AGHT+IGbVXhSP5UnKTNs1AzGAXkyab1y6vlkVP6QSlAbcFcneg9hH8WOKVea8rwd143pyPVe/yWLfw==
X-Received: by 2002:a05:6512:3f11:b0:545:2df3:9a89 with SMTP id 2adb3069b0e04-54838ee8ec3mr1530858e87.17.1740153127565;
        Fri, 21 Feb 2025 07:52:07 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54816a55851sm287643e87.27.2025.02.21.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:52:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 17:52:02 +0200
Subject: [PATCH v3 4/8] dt-bindings: PCI: qcom-ep: consolidate DMA vs
 non-DMA usecases
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v3-4-61a0fdfb75b4@linaro.org>
References: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pp5hOcnQELo/7BP6swQt7kdhd42O2Fh3+oi2amQIZUo=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnuKEhHJ1TqFNOe7eulw139OCEgkWNIiKGlnInN
 X9/GQ8LmL+JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ihIQAKCRAU23LtvoBl
 uCcUD/9H0IgRM+zSwNHmZCcQJigeaYI55ziJD07JMvZen0e96pYfnj98zfCD8euF/PgyB7VZPii
 59xIl3qovvlqXqrmk2OwuZUQ8ohM9WI80hNe3hEkR8bH0v3tVvQYxsuHS4G8vkvd03ZtWbUY5eq
 68XRmAtsIhpJ/dz37Fd8BLOoUkydn9WryuL1TtYboVY1yc45ZQCtCOu7tMfnN9vqJVxY63EiT09
 Elt514HqtGwCHFoG+M7tpAUD4M0EnkWMK9ux1mzoRGYOhUZHIL9HcMe8K3tuVeWLG5gSMFUqYf0
 5fDI+M4yscUfzFue2cXhAf4uYxY547LUEtq+NvYz012Zi1BTW0vZunyVZnqF6zFqs640rHh6G4w
 /+At0kS3edzhHaAwiSkxLToS3xg8dzUZHL1ZBbUvq1y327j0VhA3K2J8JGRBtmwlK3KnzvWLuNB
 z7SmsQ2PxNI8CyAuwopscbnN/bWuFsRbDKcBlLwMAS+4WsaiVtHHor1cZvsTSIM7KVNWzIdAx8K
 ckWEpeyO2dNDwd8g5b9Z3fITohtdHEzvEoAjhsKJV4lLabeAV93XmlmluluGH7DOSVT74XOuMLf
 13p/nojb1bACLrpwV0/OPP1Lj4exsPeI8figYZpfG+TJJrsl5DM010erunnEwy6S4qcVmPKdvXw
 INDNsGIpZsw6tSw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On Qualcomm platforms here are two major kinds of PCIe EP controllers:
ones which use eDMA and IOMMU and the ones which do not (like SDX55 /
SDX65). It doesn't make sense to c&p similar properties all over the
place. Merge these two usecases into a single conditional clause.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 68 +++++++++++-----------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index d22022ff2760c5aa84d31e3c719dd4b63adbb4cf..2c1918ca30dcfa8decea684ff6bfe11c602bbc7e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -131,6 +131,7 @@ required:
 
 allOf:
   - $ref: pci-ep.yaml#
+
   - if:
       properties:
         compatible:
@@ -140,9 +141,43 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 6
           maxItems: 6
         reg-names:
+          minItems: 6
           maxItems: 6
+        interrupts:
+          minItems: 2
+          maxItems: 2
+        interrupt-names:
+          minItems: 2
+          maxItems: 2
+        iommus: false
+    else:
+      properties:
+        reg:
+          minItems: 7
+          maxItems: 7
+        reg-names:
+          minItems: 7
+          maxItems: 7
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdx55-pcie-ep
+    then:
+      properties:
         clocks:
           items:
             - description: PCIe Auxiliary clock
@@ -161,11 +196,6 @@ allOf:
             - const: slave_q2a
             - const: sleep
             - const: ref
-        interrupts:
-          maxItems: 2
-        interrupt-names:
-          maxItems: 2
-        iommus: false
 
   - if:
       properties:
@@ -175,12 +205,6 @@ allOf:
               - qcom,sm8450-pcie-ep
     then:
       properties:
-        reg:
-          minItems: 7
-          maxItems: 7
-        reg-names:
-          minItems: 7
-          maxItems: 7
         clocks:
           items:
             - description: PCIe Auxiliary clock
@@ -201,14 +225,6 @@ allOf:
             - const: ref
             - const: ddrss_sf_tbu
             - const: aggre_noc_axi
-        interrupts:
-          minItems: 3
-          maxItems: 3
-        interrupt-names:
-          minItems: 3
-          maxItems: 3
-      required:
-        - iommus
 
   - if:
       properties:
@@ -218,12 +234,6 @@ allOf:
               - qcom,sa8775p-pcie-ep
     then:
       properties:
-        reg:
-          minItems: 7
-          maxItems: 7
-        reg-names:
-          minItems: 7
-          maxItems: 7
         clocks:
           items:
             - description: PCIe Auxiliary clock
@@ -238,14 +248,6 @@ allOf:
             - const: bus_master
             - const: bus_slave
             - const: slave_q2a
-        interrupts:
-          minItems: 3
-          maxItems: 3
-        interrupt-names:
-          minItems: 3
-          maxItems: 3
-      required:
-        - iommus
 
 unevaluatedProperties: false
 

-- 
2.39.5


