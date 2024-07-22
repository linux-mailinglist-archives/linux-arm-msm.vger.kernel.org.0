Return-Path: <linux-arm-msm+bounces-26740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC95938BEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85DE2829F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D872169AD0;
	Mon, 22 Jul 2024 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWe5q6ZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6681607B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721639977; cv=none; b=iiM2UAM/tdmu2B5lJ4bTzUjliKeHLbGDZ+PnR32ghCkslwNMLosbpTCJKwOJEZeYZIMacuNHCa8CU05Joebbpd2+H4tpwfppwvjjKEj2eFAFgrtjrg4XCZ2F+haiAr94Kc7NF5mXheET14zWyGOeM69GTcNPsorDIVj4h3dnveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721639977; c=relaxed/simple;
	bh=KQQc/V15kavtbOUQ/Osta3RjY3Ph1hkx8TGV7hYTR/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FmAjCBPenn114HVLnkJ8h0sml83Y8yoND4fPUPxnnQVzx8qfcUkkqLehDOagbd58ffbgOVI4zW/nRFQBszn4wX/tfOgETZkVBONxoAJPpNtapv3dAiraWzqT68uFlqN1H6VLXWKvKSkgiRIK+LXbuYtnny+vn78uDODY7WfzWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWe5q6ZI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so28241595e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721639974; x=1722244774; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ2JcOv+3Hc90KpP1CpZ1KrnwMmaJ4lKBejoYuZUegM=;
        b=RWe5q6ZIK53kK5b2HAe6Tp3CPHydv9txy60KHWVY9oCnUyWehXCq49Q96IEj06xX88
         o69jQoeInqBA5fVYUDp5BQrIh3RkJlpOHHEsBKnc2qc584x3KgbECL5aXyYJvZ2gKDb5
         oUdofJNDcVXiiTHX/VS5Vj8kEzojNIvzp3T1+PMW95m73njO/HXFCAPUx2Jdacy/FeXL
         nGharNquRB7r8Q+0qbFtigwwo6pKfCk5+BxvRYMvDQuZIbnUF3HCmrUANqoWlw/NEqPI
         bGIWehGgp9KXDpzrBlEU888byWT9TKdGD1EKs+4sWZDi8QbArt+weZOMKxsKWMyU0d+g
         iOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639974; x=1722244774;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ2JcOv+3Hc90KpP1CpZ1KrnwMmaJ4lKBejoYuZUegM=;
        b=vdtqxQtNbbtdFFFFwf9u47FPHh/7McxkN8Z0JhWWDoDEkC+bC8RToPr4qK+XskryBe
         NLBzvRgoma1IcyrqTfZjdQkzN1drH6XxcosmYhWWDCyFgZ7CuMa5Y52NUJmnWVsUArZW
         eGdK8SIymUqCqPYJ44LP18Ss61wqqQ9kiuCK5aXyUDTsvHRJpv8GsGMdtINnlLnLE6Vd
         AbBi97V0d0UZMOcDjVvr3eA9gQZm9AsidOOVHke3OdF2EgDa2gKajVPYJ12RaMtLkbP8
         3wQfKqE4dp51NoGbj/PyVvwvAqQ6LxCWxpWKNsPs3zMZIVgBH/eMg57ZvvtEp5sLzQTd
         ybHg==
X-Gm-Message-State: AOJu0Yx1r4P2kOIZjNfeIx3LBqZUNflMX9RZASJt6IJt41J9/YOg959J
	F3xtIARQO8Givhvy9N+fUlQwTa98EXNKZWWUXQiOzEbcXH4n8pHUCy0bxP6V53g=
X-Google-Smtp-Source: AGHT+IHa+K5jBglXHDgmcZFBnP1SIoX2b7FKGiKfJStkxLJdYfpgwBo9c3BHLhAPziJ3ctD0bMqGFw==
X-Received: by 2002:a05:600c:83c8:b0:427:abf6:f0e6 with SMTP id 5b1f17b1804b1-427dc51f966mr44096065e9.9.1721639973877;
        Mon, 22 Jul 2024 02:19:33 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68fa493sm120765705e9.10.2024.07.22.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:19:33 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Mon, 22 Jul 2024 10:18:50 +0100
Subject: [PATCH v2] dt-bindings: PCI: qcom,pcie-sc7280: specify eight
 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-sc7280-pcie-interrupts-v2-1-a5414d3dbc64@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPkjnmYC/4WNQQ6DIBREr2L+ujSAKNZV79G4AET9SQPkY00b4
 91LvUCXbybzZofsCX2GvtqB/IYZYyggLxW4xYTZMxwLg+RScS06lp2WHWfJYanC6oleac2sHWv
 VNny8WSuhjBP5Cd+n+DEUXjCvkT7nzyZ+6V/lJphgkittJlPbxur7E4OheI00w3AcxxfbzXTHv
 QAAAA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=KQQc/V15kavtbOUQ/Osta3RjY3Ph1hkx8TGV7hYTR/M=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmqSjovdnZZn1q57FDmVsMzZIfBHbP8z+858uij9ZHb
 mRP0v8yo6OUhUGMi0FWTJHlcNOXNa+3Owld2V51CmYOKxPIEAYuTgGYyLPPjAzN3260xPi0339m
 ycVSMFvrVRK/5n35Ra+qNqkxJSc+LlFiZJjKpTxnxq3wZcuCXEp4TS/oOk/wqb7EdyRy8WZBMdd
 lszkA
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

In the previous commit to this binding,
commit 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to dedicated schema"),
the binding was changed to specify one interrupt, as the device tree at
that moment in time did not describe the hardware fully.

The device tree for sc7280 now specifies eight interrupts, due to
commit b8ba66b40da3 ("arm64: dts: qcom: sc7280: Add additional MSI interrupts").

As a result, change the bindings to reflect this.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
Changes in v2:
- Fixed formatting of commit message, added r-b tags
- Link to v1: https://lore.kernel.org/r/20240718-sc7280-pcie-interrupts-v1-1-2047afa3b5b7@linaro.org
---
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index 634da24ec3ed..5cf1f9165301 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -53,11 +53,19 @@ properties:
       - const: aggre1 # Aggre NoC PCIe1 AXI clock
 
   interrupts:
-    maxItems: 1
+    minItems: 8
+    maxItems: 8
 
   interrupt-names:
     items:
-      - const: msi
+      - const: msi0
+      - const: msi1
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
 
   resets:
     maxItems: 1
@@ -137,8 +145,16 @@ examples:
 
             dma-coherent;
 
-            interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-            interrupt-names = "msi";
+            interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi0", "msi1", "msi2", "msi3",
+                              "msi4", "msi5", "msi6", "msi7";
             #interrupt-cells = <1>;
             interrupt-map-mask = <0 0 0 0x7>;
             interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,

---
base-commit: 73399b58e5e5a1b28a04baf42e321cfcfc663c2f
change-id: 20240718-sc7280-pcie-interrupts-6d34650d9bb2

Best regards,
-- 
Rayyan Ansari <rayyan.ansari@linaro.org>


