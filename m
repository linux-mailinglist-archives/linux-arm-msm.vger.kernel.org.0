Return-Path: <linux-arm-msm+bounces-79501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88ECC1BF4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C80664754D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8FE4345CBE;
	Wed, 29 Oct 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEXx2Iv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B55343D7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752467; cv=none; b=vDXs1JcRUzffbn4C7HD20e06uFt6UXVgASOkLInsKnoxi0yAb+HFv5AA+pPYNUhYfTDo/yAp9upQh4/EqOd/nS5IP8wuF06cnHww7B4cBcirAna++Dc3Qjm+mwY5r5Q8C5P0fZy265nwbnGfbK46nXg3K1gxECg7BZTNH1Ca2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752467; c=relaxed/simple;
	bh=jcD/muh/yg3HFerxyFZxTqkuolBzxrZADlEk8jQbDjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i7HEHQytapfTIgpNLY2lOjv3TA8Odh56x5CJx3uLUXKlu2c7KTwvUO4GazBX5zDOeOr2opIR4wDr6TiwEPxY2UaEfmrcHZUQLzjZMIULHXSKoLxHhpT3k3Yv8thdnpXo7ZlBKzFKePDapEnuQgMJ5dqIxdJnUQHQ7NqBC/HCiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEXx2Iv7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47107a9928cso4434485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752464; x=1762357264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IB4XYlUY2JZQ36hrOiaGPtBE9KxSOxOkBTNgx+iHCVg=;
        b=CEXx2Iv7dLxz/Adf0kZlWhXsl9klwAKaYYcCA2TXyTnO9SYTQupcnYVoe1I5bngy6t
         KI4KlzKshBUr4tGptunz0Bb3G7avRHiH6OINZ2WF+iS4jei8P16Kqke2OQhlqMa6H0Kn
         KS3VDc35pRA6QnYzH8OHmbGHphQsRSbq92sGNdhQdZO35m8MYO02RzzSUcVdNP6M+AEU
         h3x96OUrZzt9ftR7vhGmmfMBN9T4OzL5sWeingZG7ZFtfC9Z+VxBDoIEE7RDHWWCXiKQ
         xYBZNpA604RjM1JWJC5U5YJL3h3uNAq0/G8pDuXedk6q57ByLD73/u+Wp3J5VXudb2td
         w13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752464; x=1762357264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IB4XYlUY2JZQ36hrOiaGPtBE9KxSOxOkBTNgx+iHCVg=;
        b=a80Bu0jLWdbCz3dT+2gviBJbrkBZtC2fh63EztaN8EWvVTa+MK5xCsNW67eRcpu4Rc
         SmFHuVf/p9LuCT16tYPjGVBPaJJiWo3g1GpM5m1U9L+XPzKvGLsqWFH9yQSCoYPmToZ1
         zVOjpHdHT3aELxnw4rsMScj+mnbv4kB8O+J/IhG/X5Ai9/7ZbCSR7MpM7XsCx39KTirZ
         2dmt8qUPYfathyeGOqwaRRIRrQ/GY9v/W7yxH8aaCKkAeAfN6rKiQaAsHVHhVYOYRbM1
         i0FA5o3Z/L6t2KMGrafgx6XLmodaPE3sy/1ebNNx69Pa5ZGdxwGpAugF6+aA5Y2yX2Tn
         Aw3A==
X-Forwarded-Encrypted: i=1; AJvYcCV6AxNQxszHYNv5JvTodU82ztx6OCx06fJ+JKy5UK4N7anEy7SVHqOkwxZTFHGmaMXTT+SiC0QNAa2AhbvE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ipB9kAgZatEnWxV3NWXl5MeRAWwoIGOVgg17wzc2fUsThJCo
	1nPuYetoblXS8W7nbxDELahavHuZITj3395jKXLwoHdex/ouv1hz4mW0/LQvM8IE0Pc=
X-Gm-Gg: ASbGnctEumS/eONfJePGt4G5Vs103cjITCyk0wWi9Q5o+S8g0xgLjeLf+G/1tgiFFjY
	buIma3hNRRqC35yiwcWZlAtp9ASJxnXcfPqQb+R49U3+oiw+ohRhUFXfRKaEWY+I2VdGRzyic4C
	xbgTPmUIeq0T7KMvIGyS0oe51gcIixM9MpWFVhf9Q4HYFqJz8CEAvD8bmGR3nNLyPbbGLkvVYio
	hf73Nvj0BWORF/4ARQxzvqaFSf2PXnsWDwjICUkOUWuQWGVJab4nRxeJ4/75PNm/rFmGDMNuU6d
	p+yp2J5XAG097diZ0V3GM2qFnJQYG/aS3vpXoFbFtYXAaDMVS5qMdfEdghNU1UV5J315om7fLoP
	wlmf7cAkdmsl/w1KqQsFrufE5/0XATyE769mQ9kWBFBhTqgNcYBryJx7Kt2L0EaSkmQ/smfVy1v
	fSzM5S7gUJTT55VmJD
X-Google-Smtp-Source: AGHT+IG9DjbF0EUlFUTGru5YaWEbzqZRQ5rKxmL+Dczniu/qZ8YVLMUMQrhXAGjSZsPLoQbulsBrFg==
X-Received: by 2002:a05:600c:4ecf:b0:471:152a:e574 with SMTP id 5b1f17b1804b1-4771e16e538mr17553815e9.2.1761752463973;
        Wed, 29 Oct 2025 08:41:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:41:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 16:40:42 +0100
Subject: [PATCH 5/9] dt-bindings: PCI: qcom,pcie-sm8250: Add missing
 required power-domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-5-da7ac2c477f4@linaro.org>
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
 bh=jcD/muh/yg3HFerxyFZxTqkuolBzxrZADlEk8jQbDjE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjWCdRkgSj+crNTt0ZPf5p7k3sOTszyclpDbU
 1o3zeCn0G+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1ggAKCRDBN2bmhouD
 13d6D/9i2r5Li5azvJiuPvOaq5bhZqUycmZaxUdiWiryjuPm7d3LEylVeO0glrT3h1lLvjxc66v
 2W9bOdT5RWb69wU6RRyFm7l7/pOmNC79C/zTHVypzzUIKbV1R48cbGg0MdZGqvyjcwKNgIiwNJI
 jjUfhRCJIfG0snC5pDqO5KNYUhH0B6IpC116cuoMLto5wr9wq0ADXkkXp8nBq175ACmXY0/s7aI
 Ht4DbFEmBtNwNq59/bqWeYHw6V9R9jsmLOBXv9ted9vsuULuuIW6JvQ71EVHQR/K/SuDlElL2z4
 eahFimBL9xGOnkwhizjnYmxWTFcNz8ZUYikS64Z3IZjs/d2sq4yhOU2aVMs/IcqHNgKe2byTbiB
 kl+TUgFUH+X6Hu/CUrqf/5nx5Z4IBCo5OPTSd//JIey0eaUSyBkeZAM0eBdt0UVBKRkH4rzX5Qk
 w/u58DwGiKInGkZzIuQBIOaKLZrPyZRr8kw8zLGQ6cvgezmPyq9biYlM7s3I81qEsx3YKcjN3Tv
 FA1Q4eCrJHNR0aPL2j5P+XdbUDyNUQXh45ngocNiXvkreTV5t4vm8BNYGBGS/aGrMEpnl6lBLI4
 JgF+IsBygKmMunPMjGg2z0SfP+wQSdzePL4iQEQbvVa0DYqZh3aFLRouuDyYXMl4PNkrDz2m1pQ
 THb2JVzFbi89lEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 4891b66185c1 ("dt-bindings: PCI: qcom,pcie-sm8250: Move SM8250 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 4891b66185c1 ("dt-bindings: PCI: qcom,pcie-sm8250: Move SM8250 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml
index af4dae68d508..2ad538019998 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8250.yaml
@@ -83,6 +83,9 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


