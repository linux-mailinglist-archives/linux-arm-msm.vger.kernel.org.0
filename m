Return-Path: <linux-arm-msm+bounces-79614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B8C1F277
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20224189E2C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7903C341648;
	Thu, 30 Oct 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LskEaLen"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67933F365
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814276; cv=none; b=bXe4+0j0HQRkmHnotguF2fVTdZUqisoMx03imv4k3oumCdizz1f6kwt215d3vrYAlinTyHCwt7j46hXo2iA9Ortq6DWfhwIDSvt0kY2HQlHOhe4jMDGCt26JvdoUcK147rrAZjQ0Y6MSD/pUmBN5wedC+i8Q8GBP/joTkgPHjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814276; c=relaxed/simple;
	bh=7Dm1cKJIxCD/PBcbNfHJdeVdCA4kz8qIU6RUWVYBUeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmqMiUQnmT9CgXwAkj48rdTEgerJyiLUL91JwEDSdaSxyp3P6pFiJCuGNUfERRSXsLvwpIWR4FNsa9F2VMjFmKu9qZVTph6CGSi0H0Squ/PQJw2OguFvncwTvdvQM0HsUGs3e7LQA+Y0Cof98TbruXoaoma/aJ43vwxgevB0Cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LskEaLen; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6dc4bba386so14036066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761814270; x=1762419070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGHA5HRjs4Btsu0mCkOEE3FkhLAuwhnBzyAkRkBijfk=;
        b=LskEaLenQUr71oE/pAxyg2eIBeJIJXICRFgrv5+zdoJoxVpBDFKY9djm5hZAcxEcpD
         6P2sPrrkIVo8KqgB8ISPixNXtN3zU7icqK/r6YxkaOwgurFSFvHl49LxDKb60nB6jgpm
         5DaHtbI5UtdPos10t1uhECy6dhIVa4mMvzCVdtHC6qeTASBUeDFI0c+tMB51UCYgmxNX
         SJxMtb7ZkCYLjGypoVnbaE5VcERM7xi8hjsqFtPA707ukRA8An8xN+9TADONiTZywImp
         XcpN1QutqsuWeVkWcKgPuoSTWCKQezp5KMSfra94Fj/azD4pcrQdD1LFmzT4R288I75Y
         k9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761814270; x=1762419070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGHA5HRjs4Btsu0mCkOEE3FkhLAuwhnBzyAkRkBijfk=;
        b=vp1o8ovCewqRTERDxi1q60Xo7effTD0A2jlcIXsBirw/4wZvyEMMtbU1mxXDcMJkiD
         iMXXLSBTewTgb7w75fbnuuzVQtuvNXR3Qw76CxkbMtU/l9R1x1jY6acUaW/Wuw7zSoJk
         yN8MqKI86S7O4qEUv/eTX9r69LP+Wl8GnBZz3iLr+ZgEu0gGKTlEeRPbsiVg2B0NIkPN
         0LDlw1oA1/i+NN290mxDD99Ufa/MU176C8LmNHsl3oa1XYGHWPxKosMktpVfyMZ0d5R7
         rhG4IsFqc09Yp7qYWE+/wD9e1U5Yx+Qh9x/MyiWW2g/F66Kw5ZkriHjkWUUQsZZFOY50
         cmTA==
X-Forwarded-Encrypted: i=1; AJvYcCXXdBSrA6Dy6G8xLe0O8pRPEaHhD8K2EC1UbKxai6GnJIc1ivJM4f0kYfITMwU9KSG9z8PM9qVOdVOvE9q1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9QzTOKMQmjRF5ZSxH3r7wT89M/TR5PIZ2uniFe9N/fCa0HGh
	3P3ZqMgFqKijS+1Qj6IM44TGX3ORIDaHM8xA5tutOAgqery8ORglq5JCFGr9Q0w9DBc=
X-Gm-Gg: ASbGncs/wYeS8WFJhodZ4CQQ4MPWbYZPPMjSv77zgfmT+4UYZVS0mypobcnyLHmqnEY
	vvPPWItcr9gPrQDcSKJ7TecSt9O7Tx/qFykW2BKxeh28vUko989hdI9AmppSREMW9T+wvMkGa23
	ZZr8+xeb6kXirxUAMmTC2SOSxwkbeoJoPab/YQch8xsv2wfbWDmnUAopSMTPEYjA/3Kl2MRlref
	ClfOOuy2canzEB0CHCw9yKIVq60/87ZwGpg/sij+u/b4o6iqt5Gd1adJCnNrbqhNxyw4qFGEr0R
	en1Zl62o+GOI9JQYFB+KR/ognsAwXcqSulgUX83qZNmDPheyj7yIMTlAUq8CaWz8WmIwqQrim41
	DQm5i7RKWyAgECh8RGLHsIbAJLyB5gEqZhk+03+aUrpTDdR4vD18yzRpgwCMpo9JGTj6DDQ4tvg
	7RlbcdrW472qPC3iMd7n/nD1YyaGg=
X-Google-Smtp-Source: AGHT+IH/mWz4gaa43V4G0cLGkKq4gXdzHfDKioNJx2ktWDSidm7FFl89ySot8I+Qn9jHh97wmOXpzw==
X-Received: by 2002:a17:906:7947:b0:b6d:6d44:d255 with SMTP id a640c23a62f3a-b703d2c6e4bmr378066566b.1.1761814269434;
        Thu, 30 Oct 2025 01:51:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85ba3798sm1691789366b.39.2025.10.30.01.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:51:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 30 Oct 2025 09:50:47 +0100
Subject: [PATCH v2 4/9] dt-bindings: PCI: qcom,pcie-sm8150: Add missing
 required power-domains and resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-dt-bindings-pci-qcom-fixes-power-domains-v2-4-28c1f11599fe@linaro.org>
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7Dm1cKJIxCD/PBcbNfHJdeVdCA4kz8qIU6RUWVYBUeE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAybwIxU4aL729+DPoEzPQca7M7DtoSMVu4Fqa
 NrAKeo5OfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQMm8AAKCRDBN2bmhouD
 15H3D/9drszJ1UWA+Vdu3l7QRe1xSGR4muez4M4jyPfT0Yv27pT9BfhQWdOAZYN/6QhgUq25rAu
 WbrTsdgq9yks8ef6W4h21oC8S/ul4nEecWjtCBAEllIyK8Jxih2P25XXi+1tvAGo++fczy7HjEb
 +sDTzjfj6V6RoU32ZAhPUVBq+depD5CJ7nZIY+mg1ZzkwOHcWmVZgcS6d8zDZD7oKW1hGSLtiyZ
 AioejUePVauqySfOpepPEqTe8XovBws4kyD29Zq0/Tw7qDmN2H4JD6tMDWe80SQx0tJG7K/sXpp
 mf6RRpwqh1/xFv3sdFjBKaUWttYVrcSmE0ewcGJMXDKaLfZynomh9wk2oeGhkPaAwvm4wbTsq6Y
 dZ7RLYTTqWYY1Dtb3jfw4HkM9ZoOn1vvGHIVRWlB3db2I5ZoI8t2IFJXpTYfeZ0vz0BKuxo4Ux0
 a+crlci/mQ3sLxlX0bO9R8B8HEm8tQdACckHMrtRcBhraM7yCZu3zVsfwQbtYldEdmySUkOAqfc
 3m+3ibYng8lbui9ZN+o9zdhwwv5CgoirBpf95FkDW+EDNhreXnKl7+zTzc5DX4skdYB7vveU7b2
 D61rRP7tRFNJDrUHeBoEhhO9zeF/y0CDigralwqkcx9poY25ndzPWmZMgNtPXwr5Ipt2+WuvhA2
 W89Q4QIsbhmODPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 51bc04d5b49d ("dt-bindings: PCI: qcom,pcie-sm8150: Move SM8150 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains and resets for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 51bc04d5b49d ("dt-bindings: PCI: qcom,pcie-sm8150: Move SM8150 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
index 26b247a41785..17c0d58af37c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
@@ -74,6 +74,11 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+  - resets
+  - reset-names
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


