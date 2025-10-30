Return-Path: <linux-arm-msm+bounces-79618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C4C1F29B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B06351A20024
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490073451CD;
	Thu, 30 Oct 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPIkGlWi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735AB33F39D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814281; cv=none; b=IUjXSGDfjq3HipYT5TEWGdvIlbpml+YSsnxn21B0rMviKy3Uq/9Exzzrpn2uiojuMmaKMIvNfso1Hz63JfePRtOlB5/rTb4sVoMmhPAr6RwS/ckWh4LBuE+/BksaqXcKnz0p7c+OLCAchqFLQKcA2vl6TiZhid24/nHgHS5acX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814281; c=relaxed/simple;
	bh=tOFcZ+EoVU36Gcas8ByUgbu9yWXwAq4SdMIRPuEe4Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCuzDRbconhzyeSKx3/y/ISMcIuL89DAz4KhVZEXzh77fVxhvhuSJc3WAZwqy6cE7i+JPOT3/ULx7OzM9v6V6Psxb96Eg00/8zyRCbnAvTDnuAZaPhKzCdffK5xrlI4//SBLXJDQSLM26Wh4/mvRLQH69AZkVsm6EvmXLnSDYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPIkGlWi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d4e877915so11197166b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 01:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761814276; x=1762419076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyElttd76tnImw2rKaTu1EJufTIHlBuUN2ebZk19A2A=;
        b=cPIkGlWiSTS1/VqEYMoYSjKQfquhSglZBwF7gLOA7bC1NPWjitE/G+llnML65KsspP
         Cnzbdn6BIkJZRIt1co3jvHW74XGWoeTzYPVxn21qUyMScMcjR/J59L9RUZJOtf5umskU
         5Fl+l7tckf8wzE2010yAlNh+DMsLgeptATmNz+Y9gN8TdKDK7f8Ji12Dema3ohiZIOlI
         5KIMw8p+NcT2Qd+HrAeJk2xIcSLlfad7NGWgoDdkrhFJ3S6MdTPNo2CZ9vaJH6AQ0SIe
         P5N642L6/iPRCtNG51pNcK9rjYOulop8gHJ5nlL4CzSQABJrEHyc0rrV91g7VMLlak8p
         56BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814276; x=1762419076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyElttd76tnImw2rKaTu1EJufTIHlBuUN2ebZk19A2A=;
        b=HTW6u0B+r89HMFie/ZX8InHqqzOQUC88zXl6s8jBYXBEEkrEedDG+Za17lx03UncxQ
         I/tM+CmAvpepTeTClEplLqSObK9KApANF3q5h9lD5jLOXqkbdGtdMdysRlprsPVAYrBA
         ZtA7RbtN2wr2xGmtfseya6jwnJKQNe0iNxbnFa1gJ3pqRgcz+Sy0BPYvq2uwZvrGldTU
         SHDlZQJ2sJSEftNss5/2X2aNN/W2cmOohhzUHAwraxXY63aIrA4FaJq8j8a2re9nPWxT
         iGOLDzFxMaN6aOiADSmQGxb3fIGjCcBGuOLE+AeusMcCpFGWmFqDR84idURotm6UjbG6
         K5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4pgI4RSsByLAIZ1x9uLnjNC4CiFj/4aY6D+KiR95Ntctum5NahEYxBFsE2OwtBUuImVSYU6tp1WJR6Lka@vger.kernel.org
X-Gm-Message-State: AOJu0YwPup8WR+uczIFAIfiYj/R6Y9vaN9qsctQQDqhLVd1GyapZxmIt
	S9mHIgWdgGszW4QzsSp14MSup0gta7O/vzc4cQE6A4f2EMWYzmavaGZhz5rvbVErWRk=
X-Gm-Gg: ASbGncukq/QddIpZKFGo2t1/t8a/Pkcsp0+Fj5IkhsUU3mA4k0d2chteDHg77l3b/Ny
	Y0tGqSd8a/fw6fTcPf7+5WQ5M6NUryns7SY2anDd+cBvCqR9sPhF+zclMoEikL7B8hSTgq6Tbic
	9TZLqYdUvWMJ1FVGZAbEwZrGgqblCUQtxdE5bK6KQZON9ZfuCBF+BaD3qTu7jgAeXUNXeDRU20a
	S3fu6q5+uD3tiw7FGVlKSXI4myMOYP3hun5g7Ca6DdRA916Nr8gt+A+hLgOWd66hhosrbQgAzKT
	CVe7hJw/LMACkhO5RaR4fd8qNlMtF78qkPfx9HaAmw/t0Y5tQcqvSiBKZ4A+QD0f+ZoX47EzyBI
	vqHzpcDmhkpC6p+UpGwiolFGJPRTIsplfUUS4UXXx+ktMt1YXR0sMwOzcPSRPbJqga2nfvjTjJQ
	hniSVXAmyYPvMzutvC
X-Google-Smtp-Source: AGHT+IFQVdw8/tPXlVf5rqd+6iy/3RoBW5tavJDgwS71+TwJTiu7nX0lLlocIq3NyDrw50g8MOfctQ==
X-Received: by 2002:a17:907:d88:b0:b38:7f08:8478 with SMTP id a640c23a62f3a-b703d06512fmr354167266b.0.1761814276487;
        Thu, 30 Oct 2025 01:51:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85ba3798sm1691789366b.39.2025.10.30.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:51:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 30 Oct 2025 09:50:52 +0100
Subject: [PATCH v2 9/9] dt-bindings: PCI: qcom,pcie-x1e80100: Add missing
 required power-domains and resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-9-28c1f11599fe@linaro.org>
References: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
In-Reply-To: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-0-28c1f11599fe@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tOFcZ+EoVU36Gcas8ByUgbu9yWXwAq4SdMIRPuEe4Hw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAyb1rCWm0in41RGHAdfE4Lvka2FoeFs/clIRk
 ZoaP88Ig9uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQMm9QAKCRDBN2bmhouD
 1x4pEACVJrEw54/5DQoRujMfwdvo23l7nZ6vMLdhg1RXGPqYk+73XH+lCnIRfHgpNEJqgRZ0mbY
 I5e5+Xq9n8s7veUbg3QrpRrUU3xiK3u3s8jJsu7ftW15VfiK/P9ZMITmOd0Xlc6Be22uWadVLZf
 JFPwNNZO1AjNx5i8bEw+qIlTE0qk1hxFg6Pmd9DAIma/MuyCD4zPjI3Sy0aBT28j3SgHBJHNsrN
 +LztllD/ZpueKn221+PPIeCh/saDbqYcMvqjBBUHuoC0K5p17FT23LmsoEeBn50/krzGN72+gfM
 n0XzHYRrlhNXoYdFr6nCLzd6kRkBPXz8QEI/kX268mzmxShzvru5VbxhSAPuhv6v4lmTbWXKHdC
 DWW0eicXLN6JJXEa2CMJgc/ht0WLmWA35/LS9ntgICyTePgMuc3TUVWH0+BeRfzS8VxreXWCWSv
 FLr0hnpuLghg2O814EtOUv0pPIL0+5GNgLaDiCLsmY7nwSepKF6frj4N7I39dbQVCeEqgkt+f9a
 x+tOrJesH3stJtOYT+XV83vpW4FGHdCqsgaWFG8RWj5QfNYkS/kZdorC+DRwLOoOEq60RJo3YYG
 xLMdrPsZTToeWPl69nLxP3/vzUQ++yV2EV5MbISbVY797NVnErl6f39LCnMVI+GrVJFEp9qXI29
 P+q9qVJGbBVpkkg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Power domains and resets should be required for PCI, so the proper SoC
supplies are turned on.

Fixes: 692eadd51698 ("dt-bindings: PCI: qcom: Document the X1E80100 PCIe Controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 61581ffbfb24..83e35543b233 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -73,6 +73,11 @@ properties:
       - const: pci # PCIe core reset
       - const: link_down # PCIe link down reset
 
+required:
+  - power-domains
+  - resets
+  - reset-names
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


