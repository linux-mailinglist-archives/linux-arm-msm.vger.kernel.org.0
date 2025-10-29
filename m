Return-Path: <linux-arm-msm+bounces-79499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C4C1BDAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC0BE5A7C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5348633B6DB;
	Wed, 29 Oct 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDlcXMK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896A33F361
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752465; cv=none; b=fk1Wbt+4nqzn05ZP9rEGZAUBMCrt7/atqjdPVJsVi6XdlcQvMX/RXlGubgzRw/E5x8XVskwnZOwbVrAvLUvyngusDjhvPTV901c45K42uZHeEBtodKI6mlrpKC7ta1pjLqIAYrvpazi9SmNqbn4uVNi0yY1bI3hT89+RnuQJoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752465; c=relaxed/simple;
	bh=gg3q0o/WXEClcVN1pmj4q5ZbEehzsr+ZhzU5VwT5XO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0/CB0neblNAyf/C28qshzq7zNl0oMRGmUXSGF9MVFK+H30D51nLDYMvFirYA+049xpHLAMquWROWgha4OQSaE/yT4JDohMXWzEaRkh95ZyNypeNVYQCzCJAxmFcYwXCBhVzbDMfnvLai4vH7hie5S6gNNUt8lDCFS66FktE6Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDlcXMK3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42992e68ea3so488467f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752461; x=1762357261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unvd6ZqORwHj8xRj6KdIfyizf9nQeBi6nqOhdj47oms=;
        b=pDlcXMK37c48JVAOfM+Tzy9bfqQqCst38M1EaLqefEfiYgTJaD/HvMLpKv9AR+tbpK
         fpHNLiauJc5f9tOmfnRRUn8hIQGbR+lgzBqAdBUcmOgRdpF1IjHbjhXHM5RgPrUKAroK
         QtoRPWram/VBR/X1hExuYqSAhSkwkp/YPdxsjpE9jS95vcvNwllWWF2myzLtROslsR4N
         VLFKmUiRmMm0rpRFxjX5O9dh2TJrULISWOr6Zm9zlyWDwARhzgRyPj3xA2k6jgg6Z0PR
         kwn9FBQBtaEohdAmiczK3+RKOHxoxYvPnz4xeJsAXrRpzYYTDZkQ1u9FP7ZiFIskff6E
         wqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752461; x=1762357261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Unvd6ZqORwHj8xRj6KdIfyizf9nQeBi6nqOhdj47oms=;
        b=HpL+RyiN2YXAXpqITiR4kKL2THahKEY7TnucBTYjZ9D+IoMt/tMKNxhMWvbh4Z31Bs
         izKirCI3Cktu9o0Y6wGYCO0Jlzau475L7wXsXW3G+hqOA2r+S+k5lxVQl4qqNPnKaVkW
         NYT43FZy9cFvLDiVNBdJ5VXGp78Y4/TklXVLCGAxexAV4YrSw2jWiTKu4cqyW1gWFNzD
         KE+tEf4kCiu+113ySnOHGdqOtI891o+xe39p1wg/Fn8YpL6Ene+hIWw19FDUwbmV78JO
         Rn0WE0cJd8R8Pmc6SDDfT7hBhRAI3+ku6hTqMarpjtRvys4uhvrJGhWjoHVjY+9OApql
         av9g==
X-Forwarded-Encrypted: i=1; AJvYcCX2sBLbmni7LzQHBeDpOJ4TT6u+1gOTTc/JOTlx78a0qX95P8s+Yf/ejlB/PPb6eQDJo6wTld4J95L5Xpjl@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1wRhzD5cKKSWQMHd81a/krkpMSeRvkTYt4y2E0jKd3H0p/94
	rWLHxLZsPC3ccIN9RwiDNY5U97ubbJjMkvVbYxQkl6korBG04VJUFtATpOpuSx+C9pE=
X-Gm-Gg: ASbGnctJP5YqPPm+O6RYciTglxYk3kRY0V6t0uzt1wjUjd8VV6eATvEwoGpEfU5QBTC
	4emEMf0rILhm5CHClWT/XknIolc/HXwUZYDLEYCY8c+sVyAljiR9ccePDpiTcgpOEtEW+CpY7I5
	Uexea/i5BtH+rfvEcvWlwzB7IXcCspxq6gmOT4mQsNdhj+pKTvTj7fGKiUbhp5nyIsWw5KCS/gl
	DzLzoE9FMgXOZYgPLOh1CEVJ8GHLICbOaJGn9fUqhTrmYB/j1t9fUrTsu5EP4skt3cyQrXcA80j
	GDGdQOB+8+vRG0qdG8FWIC+mdjos7rUQ2zbLFY6nrPzSY2zfVF4AANXHlyD166yJWy80MmLpvNt
	NYH34dbrAKQ1mIixn3i3F0m4zrBb/RONaApu9zC+SmXP5Jb9JVh0+AbthU3CxLVheYvEGE58rnT
	oL7O66Rg+ea1fR5Cv3
X-Google-Smtp-Source: AGHT+IHPRSkNKh8UTSCquSYHU+ryiQh0IUQEPrOt3eFcqubId9xEJVdpihA/qY7Z6iymfz+tTp29oA==
X-Received: by 2002:a05:6000:1446:b0:427:529:5e48 with SMTP id ffacd0b85a97d-429aefb1366mr1638664f8f.5.1761752461185;
        Wed, 29 Oct 2025 08:41:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:41:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 16:40:40 +0100
Subject: [PATCH 3/9] dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing
 required power-domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-3-da7ac2c477f4@linaro.org>
References: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org>
In-Reply-To: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-0-da7ac2c477f4@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gg3q0o/WXEClcVN1pmj4q5ZbEehzsr+ZhzU5VwT5XO4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjWBhNMxrFdUkWBpBDmSXSET5t7bmT9rgM7Ts
 10CG58cmXGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1gQAKCRDBN2bmhouD
 1+klEACLorNk91cdSBxZPpSrA/EF4/gQZHhVVXpMDUJLwmgru6/G7eg6x8LC7Ajc+mx/1ABkjgU
 TarRKOx4xLz9IgQDmCHJvggAFdRVptXxSHq8/zPBxM6Me9pxH15t275G+mjC926LIcOZf8/VyaO
 ofDVmH5cnoKQXOZRHKq+vhsdwaio5VybcWpX5VFLzwfNiCRyNgz1ED8u94+TeUB6MOPA0188Svr
 ClFLcPDrzeE6NCSTRj+H4TS35EHu2Xlx24USqFTvue62ZyJkwr2yvyn4eFBSJF7ugIZB8tmGQOq
 s0t+MLEhlHxVjk9qBg69/ZEVRDkSWYdL+iL+4l1jKyqKeUswC2lWHaS24aGs/VyLGbalGnWjejE
 J4aI4pcxAuAp7pmBkeifowiW/uRiunV/bewx4pRWHTzPzjrKEgnzFRZiEqCEWkINS3dOL7oZTB3
 7yHq+TpXYt/3uzH1n8M7+TIgyk9ZRqWaBMEPclG0Zz/3Sm0HDVlcV6iEo9Y1PKlxqSNZl6oPTJx
 rkKMFdvedfFurc1GLukgGcg50otNYQ25JQK+hdhcKOw6OGulYOj8sya+wLVoDlJeCRrQ2xzwDSf
 e4hx6xfFCjwzBqwb/bVchqG+XnEE+bN2nhrd44bo/L3Pi/1GvhGXuW4ibJE1ycMoNpBRZbjv+wq
 Gv5Ct7DlRLw8KFw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit c007a5505504 ("dt-bindings: PCI: qcom,pcie-sc8280xp: Move
SC8280XP to dedicated schema") move the device schema to separate file,
but it missed a "if:not:...then:" clause in the original binding which
was requiring power-domains for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: c007a5505504 ("dt-bindings: PCI: qcom,pcie-sc8280xp: Move SC8280XP to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml
index 15ba2385eb73..29f9a412c5ea 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8280xp.yaml
@@ -61,6 +61,7 @@ properties:
 required:
   - interconnects
   - interconnect-names
+  - power-domains
 
 allOf:
   - $ref: qcom,pcie-common.yaml#

-- 
2.48.1


