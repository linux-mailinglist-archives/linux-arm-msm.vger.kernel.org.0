Return-Path: <linux-arm-msm+bounces-79498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A6C1BD21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC5F75C3753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FFE33F8AD;
	Wed, 29 Oct 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VI0p/V9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849133B6DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752464; cv=none; b=HYVzo0ZnqN3yhEVpneDX7MclSmvCkB0vBHwE2sXaHXau9LNJBXDe4bH5ctGdJewnOTONjj4wcbhx/z5uw0rpWmDFC900yBnSF1POtPfI+4aVLSGdE0RjQPiazjccE1b4xtm17QTRsCPKa9jVqkJ2lePn19JJxNTepJVjeX0oFx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752464; c=relaxed/simple;
	bh=C5fheZMBlXveADhbIuGHjBBUwZi8+svZZb3r9XyaFgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIECM0G/xjpO9qn+H3xK15/RRpisP1asBEqEK4OZ02lk6+DKaulyrv1Tw68a7mgw1ki8WBdVQcoA2QxkRZl1o7Fjmbt0flzGoBWLSbdbu8dfv942DqFVc4owFI8RkvwILVDiSwyUVjH6Bl6vskek2zWKRX9zPjpTCf2L+dZe+L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VI0p/V9v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4271234b49cso958076f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752460; x=1762357260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHf+cMn6Kxy6WzhI5tfMdwjUbyEZvfJl3wRfjjKCl04=;
        b=VI0p/V9v98EGZn5H6JHrfUHp4apdEKgO8ZGVJkNihExh/sX15+MILGJ5We1GvfDypc
         6FAb42QN6fz1TnvsWHArPl7/0WgpgkUvqiBdOQ4rW/D0KOgCcvRFqQnEnuJvtuMIhjX+
         wa3OiQ4ZUgv9pXdCG6pcY1vgAqMC7bzPRbaM0QbqLwiTofwhZRKjnrCHQV4kA8dFbuqW
         UrjTa8d1yzQJyzCMo2V831Ah3+s7q79foba9FOPxUmwcy11cGTvCtmeugswZn4YSC2Ay
         X2Plc0HbfoRRqss9lxsbQGrWbHLmFAvJrCBjt+UoyTqErUaGG03H4fhSVUg0pi7w54Ei
         Btwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752460; x=1762357260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHf+cMn6Kxy6WzhI5tfMdwjUbyEZvfJl3wRfjjKCl04=;
        b=TUbmR98ai7d18vrncMLQSLMG+NgJ+p8VDx8FjfWFi/h9RQwZ7hc0OI60vSTO/s76gT
         bGFCRlmyQCjmmLE8quNCIrGHj0BuNSoFem0E41TBDUL4TpfSMI0q0NA9Cr7DxJ9r90W6
         iMFyWghFY3yeDJaJ8QUaqllgcgaLG+IMHDWVPWSbAhsgBE4daXNMe/nOvZ6LuFh4F+p9
         XpSEOGNKMmSXvHV5981nVsBPGmQXo8hUhDV1OOoSTcpspA77k9H75FRxKnYCoQMcHmZ7
         BHLQal5gz8wDkxrjp0GUhw0Q4au78zsW8Gu91OVZFWW620MZE9OjQhApr3GoymQmQR24
         Xk7A==
X-Forwarded-Encrypted: i=1; AJvYcCU551WNYV5DpCoQnsacWSqMhOanjt4nDgXM2RU64ICfy5sYBaR1hAUPi39HeE0PlZ8lsnvN5G4yRcTWA3y6@vger.kernel.org
X-Gm-Message-State: AOJu0YxlD/75KKzJ3Z28KpXWIzSxvLJxa47tjM5y7D/h/MN16XRtVpvu
	Z0Yz8nLaXyRxHg/OsAmUodU/UqvdSf9Gy3nSuLDWNOb+LVmSpFUhnSwTDt2zBmkYLx4=
X-Gm-Gg: ASbGncsvaGbkmp2EfZcC7lUgMZn+vlq76LIHVH59yaNNKKBjpE1TgRdOwmOgzHzWwaY
	vWV7erotW6uVxvV+a7iyJIlX/GkGWW6+sNuO3Ki9Hf/PX9ns8k5HSuVLkL5do7juIFh0TAcCfoJ
	dhEWlbxW2UEJjD7vlX+01vSwGdODKdxZl8yUkcn55Z1BJwwAkzpvVdzoXaniUoVtPw4600NRfA7
	bC0K0nd6qlSvXyeFMeAdZyn+H3coc1jl33XLfrpxvd0RdN0w1SqX1zPffgJUjwKR007GwDeQT7n
	+bpbW03dX+3d+8KvteFqwAvci1hzw9pg5WnYrqKKQ4b+KDK3NQdu/HNVJimDae5E2a43m0jCB/L
	CVcWDBlmQcl80R/lSLmqCMYlzVlGkCs7IspW2f/EwM5oiWEYyHkPzJZwfwaVB6ndVqzDaLasdQ9
	cLsOGvi7s/ygTCtuOh
X-Google-Smtp-Source: AGHT+IHwTcSdwYOPG6r0415Zk++YfUcU5yMqIL3/VKwOKYxZYrAgJvqhz956H0VjSJ5yRA+kTI4Y/g==
X-Received: by 2002:a05:6000:2891:b0:425:6794:f19b with SMTP id ffacd0b85a97d-429aef80d97mr1719532f8f.2.1761752459735;
        Wed, 29 Oct 2025 08:40:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:40:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 16:40:39 +0100
Subject: [PATCH 2/9] dt-bindings: PCI: qcom,pcie-sc7280: Add missing
 required power-domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-2-da7ac2c477f4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=C5fheZMBlXveADhbIuGHjBBUwZi8+svZZb3r9XyaFgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjWAt2He8JZrv/2UagbsLKx6hiqQ2Hf2ne8uq
 b8GbzFp+LGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1gAAKCRDBN2bmhouD
 19jkD/9Y7Yud/iWVjUfcttWhamndLFmOnwuyiuZymgw1con27IkeBHVSMvkIBdLuyikpuwWc1uW
 +Ec/O5v7B16bPf0jNppNGhvRq84rLdPVWIH66HBXdEhZ+WGrOPLWjbnR7gBu4z2ZNFJvb4sAENE
 Ceu2rWZ8Xqxusv1uPK7vgQdOyfh31QZ11tfdgb0vMnvJDX3bTNzW/yDhH1KUKMSGk+8sYtaMkiB
 p1a4+FLqpui7RYHuNhW+TShdrGEJNDoxzvTgfDKMq0jh+2VZcpgdRNY/u9f2HwvdGdz387YFUbj
 Cb9Baykvgu1ObF8OOCsX47JP/2jpbISUcqLcPXZIl+kbT+mCBo+P+SkpIjA1YFXJCmVN+JRQVGn
 ItnuHF64n2Y34BTJHGmd0BL6TkgBCftyiOvvac+k6tvcmwZljxTtZ2s0So3wqNHZlla7wgZQIHe
 NZc35CvS0VMLAfC5P/Pgd2XNo1F5V6kF7hgCmZYZhvMuBm1nY0vmJLG2R7aO43J2zXVh1AxnMOf
 HiuypfkdNcN66zEdM4SvtqATrEsym3Nr2RWO7AbQRkKmy2z0+N5lybQBPhq4iDkLl1MGtfVWNIA
 UOj7R7uIgkUvPlthOzxRVr2QqZnDynsibJjYcWKElIw/h7494pUE8qoXrN6V13ggDhqdKiL99jX
 9nDVLsO4TpIJJmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 756485bfbb85 ("dt-bindings: PCI: qcom,pcie-sc7280: Move SC7280 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index 4d0a91556603..a2e5755855aa 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -76,6 +76,9 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


