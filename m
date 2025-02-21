Return-Path: <linux-arm-msm+bounces-48783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C2A3EAFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6316422A20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E294E1D86E8;
	Fri, 21 Feb 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6E/Mzni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FE1D5CC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107171; cv=none; b=Z9dBt4w6KD20W1D1HdfnDHT7Ydl0B66XlU44ZxNHYG4KrrVakdhICzwFAzH1O1oYKI7LDnuV9yPJVvGy2e7QFvaOnezuVtXesmejlnnrs0+diS5+t3yF7m/lVwa5MFPo0SwTaJg1gKurcjTiC1kzFbYtEdyEsNtdplyQM4cRIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107171; c=relaxed/simple;
	bh=h41p5OP+JGUWnkefKPRuMJP7onFPK2xv7UsIeCTWeA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PeC7V7vO8+Jn9DEjq8UOMbcmz3FLNfkUFBCWz9n0tk2ZhY2ANOWYhAtEw4d9Sg4GsVaLDJvhXw5QSEsoAgJmJHE1crCbFloR0CSrjSLW+0cxzkharbDF4Fu6qdJcchrHl68JFY3D1YGWx4YBR8QxxibDraajrw7uNeFwWvLiKOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6E/Mzni; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3098088c630so14549651fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 19:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740107168; x=1740711968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyvOysAyejlDc0UdTyWb1kJow3RGjM7zTB/5Ujh2Ar4=;
        b=g6E/Mznia5NgZ/dRv95RNoasGG64Wh6J0SvVoLJemIkH/1egFqcQLg+IWBpln0XfTG
         5BzgHuYyLEmd5aMc+9pavME55kcWyURaJegVrqWQLlftz9bvtvgcQa3XchviY5JG68XI
         +ZAiSUTjrQDlu3LgOtYWXcMWOyw1shLaHrYcdKUZSEFI6/Fpx4v9nHa5YMk0tg8EujOq
         bgFonzroie5dQyGcCHib5ufPytsAIYL4WDRVrAKTM6pf9lNG0RIV2wiQ80jbIz06tjQC
         11oyhZcIxNcJGKgnv7FYUmkZ2TK0vv6FEoWvz6pe4LpRYpQCRR4h3AW6PI7nO7ah9ho+
         sc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740107168; x=1740711968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyvOysAyejlDc0UdTyWb1kJow3RGjM7zTB/5Ujh2Ar4=;
        b=CgG6YAZ322xivseWj/qpSfIJjysCpyLN2uoF7vt0C/Q55Rk/NE8HtxNnVC1eFONxpM
         Aa2tAWxfpBJ8qIGVFDwAb4xJ/OHMxdUHw3IQf+KMrMOt4ooIb470fq6htj/Ks/MP2Y4E
         YzdI8eFqDnr5vwMGlcmooGpip4R3MojFZ1PGNmiVzSzQejHGn30/wdqlhxBIaYg7gI2g
         nt9AUNMXpKyFUeEzA06AzCgABpkWi8NoSH0BaHCj9sKfh/doG0IExJaQfi/KsVWzY2Ow
         E4vLhK1MdokxBaKZIELlC2v0GONu94tAadHA6ejEwfHKGEqA6viX0nKnW/mFmk/+D6Mz
         vAOA==
X-Forwarded-Encrypted: i=1; AJvYcCVqZ10A1UXPcRlXg2QA6qoDtdncUaGpN4em9N+lO96/RrnENXPFnlyFFLYeukmAyvBLvp0d1697qlRq/G+g@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcti91k8m1RmsFk6z91TrRebWWesGBoidOXFbC06TeWMjnpis
	TNJ6kpRBnpP01nGPvqvHF65lF+P8aFdCNwXnUsUdkN+9gll6Alb63F1rFgElLYY=
X-Gm-Gg: ASbGncsIrZ+QfHeh1AgNEqFFuJmM/ThauO4jm7Di6MHYZFzyG/MXPxkBw4w5nm60WZw
	Z3QO9MdFZ3aB59/Dy2GoAusLFZig5M4rjHr8lNu+2GqFKgYplWFKAR+8ZhHJE3plKyZzA1jarWI
	u/yo6JsVuoijqIVcdmKjS/LwWx9R3tlC+TtgDxahjHYpmbwSgG2p5C0oK+YNS/II2/VpeR5gsAU
	aNjjGLBmGOnK0IVDljmY68SPMEHh+WP3hGfK9WBmZgL40MoFUYrrzsNqsi5A6AzmFiUOBTnnKtW
	UBOs9ypppVI3yL38n+4N7eTsY+yXPMclxykkAKEkJWqEqajsXswOESnl5Ia2+l0AB+09fA==
X-Google-Smtp-Source: AGHT+IHEXimMAaKjnDfHOBm5Bk1IPHIUFn0oxeZQN8nmbgxih0yKLiTInO1+aDy5zxoHfxt0KERGLQ==
X-Received: by 2002:a05:651c:226:b0:304:588a:99ce with SMTP id 38308e7fff4ca-30a5976e4d0mr4176401fa.0.1740107167957;
        Thu, 20 Feb 2025 19:06:07 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a2be45876sm16021071fa.68.2025.02.20.19.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 19:06:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 05:06:00 +0200
Subject: [PATCH v2 1/6] dt-bindings: PCI: qcom-ep: describe optional IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v2-1-cc87590ffbeb@linaro.org>
References: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h41p5OP+JGUWnkefKPRuMJP7onFPK2xv7UsIeCTWeA0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnt+2ZJ1d2rnD4QvueIoK3bZoOBqEM3ytwcD+Rk
 feHNpdrg/mJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ftmQAKCRAU23LtvoBl
 uPghD/9cbfOizPzPViaH53MjmsJG+AMwDka8bh0Ol5Ah/3WZi3m2G9pb/VIEW2UfXCCI5vOq2J1
 FlrsOGw0sgnjgDQZDptaXxutCri2EHVAl7OoXIT1Ghg/OoMgyCrAlEEJDNJjIzVdHMm2wX1Dpel
 dRK453wZiEbTV11pThtkcZTGU0A139G/AqeaHfEM1kyBqNG4o0jCKFq3ORSEl/j+b004CQh60sf
 pXc9AbjPGMB0RycngkK9txFg/MHNAWFsK4YUyodcnIgmOegqAt279r4fiUup5UnQ7+a0ASNn0cQ
 ALI429oQB4G6KO2oNJz5E6hmBigdlklfHG2E8TQbPK/hYW9H8lEG34qtPozt7fWbJUJq5Ll+u6y
 lb5LLTF5YQaredQemJjlY2usB52eEcEdvlZ3KwGc5rQyl0M7hXEB16DvgaLWlDPJf03m8ygR9MK
 jq66RRblrrTyovlWlMAcihjL16u1vFQ33hdJ2plQ3tPt7EHwn8J/lbqqFuXuBf4b0obMkKzRXgc
 KDRBMc8L7kO1Ac2H3au80EkiXZBGDO00Zv9a0dcsqqh5bXashm1b4ZREUdTmtBnPuGyeNi05eJk
 fQcgKnJTEkpL9VO4FHyCyM9MoU5mxT3nz8bkrAnYg3U1OFFeUYV1D70/89CyKeMTSH0QVURgH5W
 saFTFxbhjkq6bDA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some of Qualcomm platforms have an IOMMU unit between the PCIe IP and
DDR. Changethe schema in order to allow specifying the IOMMU.

Fixes: 9d3d5e75f31c ("dt-bindings: PCI: qcom-ep: Add support for SA8775P SoC")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 1226ee5d08d1ae909b07b0d78014618c4c74e9a8..800accdf5947e7178ad80f0759cf53111be1a814 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -75,6 +75,9 @@ properties:
       - const: doorbell
       - const: dma
 
+  iommus:
+    maxItems: 1
+
   reset-gpios:
     description: GPIO used as PERST# input signal
     maxItems: 1
@@ -233,6 +236,20 @@ allOf:
           minItems: 3
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sdx55-pcie-ep
+    then:
+      properties:
+        iommus:
+          false
+
+    else:
+      required:
+        - iommus
+
 unevaluatedProperties: false
 
 examples:

-- 
2.39.5


