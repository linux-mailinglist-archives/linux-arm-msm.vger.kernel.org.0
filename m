Return-Path: <linux-arm-msm+bounces-48928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863FA3F9B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8284B864721
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD83C1F1913;
	Fri, 21 Feb 2025 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDcsZoZh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14191E7C0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153130; cv=none; b=boQKER756cY2pCVUMNC90giK2gaWlJI7j8I5x5DYH91Fo6zi6sEsiDY3H9Z1yWbVhFQZxBF2EIy0JIreqqFfKtg3PU7eHPYOLs2VpFwKlCS0sYmy5DFvJTO5JU6AJeCGvUVwY8iWHhmrYohJbFkXJN8olGaZ2rCs1/4ps+S22ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153130; c=relaxed/simple;
	bh=PqoH6wcUbVCg+bqzkwcAIFED7tpYhlfF1LvH1T0LlxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaBRkeMQ8HUJGxScSijNqdxtHYvwIqb+Sfr8L4jOg+hgJCIB9xU/S8u8nfFgZuzHqsFdXT0tmLfMMK3FCRLJ9XhG44BsOaMdcN+oARmXOvu8slrhaArQPL4CaW7MDRMVOJYYMSXgzYLrhBXm1+uZ0RnFk808LLkJnXuOGbJrMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDcsZoZh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54626a71b40so2187768e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153127; x=1740757927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oaD81AileLAazDqpE265bLHpNvWu1Ruwv82L/foeI4=;
        b=yDcsZoZh5dFezQwp4WJdmGjEOQrzNY0xkW58GYpYTzf0t7cNH/yr1RKXICGdD2/3vk
         P3PnsVJq/zU2HomkJCOx21i0XVae7UtNLGsn5AJLMm8H6kCHHznx45AtWPf7A2yim0xy
         an0QbaI+1SCZ1LvqBNu33tDnnQHZGsCIOm5r7MlZe/O3YgaMrJatNZxGHW/JclErbpK1
         V8t0PjQqtdALzqO04RX+m1EAYLDZJ5NWBqDwAaGUv+LiKaZ8CGRs9D7Hljx5KrDr1CGJ
         ozY6+X335Kbmh2h9hAsFb1y+AQXWop106HZe1L7QnuAC28mw0KzMdsD6+42ZZeyt6uFS
         upGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153127; x=1740757927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oaD81AileLAazDqpE265bLHpNvWu1Ruwv82L/foeI4=;
        b=l7Iub2oiT4LxcniXYx6OIExFPpaU+mtbKKyYGsSYdo4ePx1rTJRAaKimLmF88JK9FI
         gUU0vr+yVyeVIWkpCYZUMoLOI5HeNR/9BFQTu3NIMCGZs68R2Dviu9zF5Nvv4/IlkDNq
         Flxa8CzPjwtrETMP5Z3fHYgyemYLQnaMcXKXGYkuKKVCACeF2NRVko4gD9PhzIkNPY9d
         LHSit3S8Pr3bDOBbf0hABPkVsoUQ0TI57n+diWEgNNNivMVQM+g1aWlXlkSHbJwi/uNv
         M5V/mlmAli4WB74uKcduq7FPxBYzU4PKUkaVxGwoCCdGUvdM1gsp1NyL4tr4VlfPRH1L
         RKvw==
X-Forwarded-Encrypted: i=1; AJvYcCVQwtmzanQd/+WxgXYkvRMXvUQGzYM6R1ymxdC8BnjjAfAS/KdMUiQR3mODC+AY1oP0vhILwu4ypEpdFjjJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V/Vhd/7TRt+hyZiUdaPwc5xK0HLFEb6/VJV8QZY0xxLsapqN
	zGNX0otonFVqm4DFm1doRW/YHlVnTKg11zuVcIn5zUMgh/Hdw4Kdr66zly+JZ1Q=
X-Gm-Gg: ASbGncvV7aJCkAMfKwhreIo6wVgUzDgy3DOa/WXHx8cxAdO0U7Xj0C3uY/8sDM3Cs7h
	NCOBiEkBD/PAHZmWD9cQXUkRq+xMH3VRj88oPPdaTvdSAzBud9yXmVx64s5cpVc8ZzYzPk2Z1UL
	AiKwGshC+9XNZu76FkZ7uNRgRYDBKlPBKR+XU3JlYz6ILDXXPvYbOLtoSalQAUSJsSiFp1NQf56
	UZVdWFwuPp8c0uUIfohqKvICAxh/SKbZTHfq1mrcMXRd25VYxigFq3NSqp9G+fdXMavfn8wDhT8
	jOOgZk+AzqPILLiqJzbLsIu7q9UZdEZbROO8ERkl4tdhHL5NzP9tQZBPaeVmbFeVt3VCTA==
X-Google-Smtp-Source: AGHT+IHxm3N45IVfBfGIzLC6Faod278XegLTfJfcTvzqKtK1atXf77g6WvKoYe7ZdGWd/kD/iP4keA==
X-Received: by 2002:a05:6512:3d8e:b0:545:2f9f:5f6a with SMTP id 2adb3069b0e04-5483913f9a7mr1381513e87.14.1740153126698;
        Fri, 21 Feb 2025 07:52:06 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54816a55851sm287643e87.27.2025.02.21.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:52:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 17:52:01 +0200
Subject: [PATCH v3 3/8] dt-bindings: PCI: qcom-ep: enable DMA for SM8450
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v3-3-61a0fdfb75b4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PqoH6wcUbVCg+bqzkwcAIFED7tpYhlfF1LvH1T0LlxE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnuKEhZTF1AOa+8fcBJRBvG2FOggKSKq/3RmrUC
 ZLIaKWYzQOJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ihIQAKCRAU23LtvoBl
 uMKxD/9VrC4yim5nVDujzoNMhKiYeP1R8iLZvoq5ZbIQS0oqpAVFb2hoTdU8vkEXYATnahH1Xge
 0UvkbmaXVQmFeQwACbnLB5UnlaBFRC5rBhYjbNepja1lo2/FmO4KtQIdDaqL1uOFTOo95mxhp5+
 VwO9rocB59AVUnaj3RNyg8qS4jJjX1ryASHxLm57OkQYVjUwC3cPnxAf2EGKo5HevAGBC71SZjm
 2ur7zuSvT9OQ8igt+FPRSX9ynsQaRoHKgZmE1iCzuk664PIjx28qwEbBojwqd6SZ0eChmODylPI
 d5OP/Fiz2VBCh7r8Yehm3X8MK/p8pxx+iSSN4a+n4whq1fAmCxjsEeqneaNooDEYibsAT3HZw+a
 cu5WE+T1Fm8zANkGaRgW6k5VjC3eyedJdKWV+exATCyEg6wBlzC4XoZQcyuFo4d719uSkUsTd+z
 hJX82WzEQF0jrC1IrKYRjaYle+iUvSKSOW/jjwQfCJpUFyEVRM31aKLnRazWdEd0dbT3foXJLZp
 VKkcJ9AhYx3vuYZuQgsbb0Fn947GJWn3g0fU7eTrJ9xirK1rncgUFOc6qnGomT4G3EFoenjw8z1
 nk5GcI5Dit0MxJLaxQGg1G67jaKt0BXLqHx3SFUqLoVzfnUJRRme3Q65S9rfF2myobVtVg9o6SJ
 kAzf3o1sFrizXVw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm SM8450 platform can (and should) be using DMA for the PCIe EP
transfers. Extend the MMIO regions and interrupts in order to acommodate
for the DMA resources, mark iommus property as required for the
platform.

Upstream DT doesn't provide support for the EP mode of the PCIe
controller, so while this is an ABI break, it doesn't break any of the
supported platforms.

Fixes: 63e445b746aa ("dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 6075361348352bb8d607acecc76189e28b03dc5b..d22022ff2760c5aa84d31e3c719dd4b63adbb4cf 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -176,9 +176,11 @@ allOf:
     then:
       properties:
         reg:
-          maxItems: 6
+          minItems: 7
+          maxItems: 7
         reg-names:
-          maxItems: 6
+          minItems: 7
+          maxItems: 7
         clocks:
           items:
             - description: PCIe Auxiliary clock
@@ -200,9 +202,13 @@ allOf:
             - const: ddrss_sf_tbu
             - const: aggre_noc_axi
         interrupts:
-          maxItems: 2
+          minItems: 3
+          maxItems: 3
         interrupt-names:
-          maxItems: 2
+          minItems: 3
+          maxItems: 3
+      required:
+        - iommus
 
   - if:
       properties:

-- 
2.39.5


