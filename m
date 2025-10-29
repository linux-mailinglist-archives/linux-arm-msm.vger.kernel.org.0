Return-Path: <linux-arm-msm+bounces-79500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D729FC1BDAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F87E646823
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B18C3446B5;
	Wed, 29 Oct 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ra/9fSiG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BCD33F39E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752467; cv=none; b=PCG/cciNYd6bXqp9nEYkYyzYcxuioPiPgRRQGNhGQlMwQR0Uq0NKWdErUGwiXxX4zra5OJ6CF+QOIYsnV8S2nUxwWi/ftidSQ/pkfY/84Yna0vsI7HwmT4ZUHG0Sm5W5crUq73R2w/vI6kJsijNZnaeTbITjz+O8xl0uR3+mZjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752467; c=relaxed/simple;
	bh=jmZDND6HgYX8EZDdUAJP/IquD3beTYD9OCZKg3gtY5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G3Vys7PKivF1ziDFX+6NxXPIXIqxqqyWpBxqpXcWgk5DL0Ud/FLmrOeDsC2WKUk0UVnpYb6C2mJfP10TTLUDwg5aV+H4U/xz+3Rigux2UPijzi8E4r9YKC5M98wQ/KlFcQ/3ZlGFuy1GHAcdJpX6GOdP3khzheLNPy7/6SxCM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ra/9fSiG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-40d0c517f90so630152f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752462; x=1762357262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxI90H/RvA6j+47WbvbjLy4lY2bQBr0L5l614wF2bwQ=;
        b=Ra/9fSiGcI7N2vrUAw+2qeKQ3MweoeRYW3rjZys/43icnJJfxWqeKQP0WSgZqQnLXc
         KGGHl0C8uDKEJ70aaztiAMkpsaHjl5wly7oLcVc8a5XMbHpqy8rXgPKuMIi6xqWXs4Uf
         UPKXNILrzwdHAwg/C/F34AFa6Rwqu7veTeaP3LdvEYb6nhuV1ztUT/Kn85nqK65JVpvg
         6dpt93NBjUVAoxYDEyhkxRkCZ6uUP+YQ+WiTPLQXE0srmkHCcmslTruCN4RFWNqGypdo
         +RQHCxRmupXylhYZ+lLIMBBkeUrxb78qe2NyCv0WVoaBeEgrAe9hhMMrFclrHb6n3p5V
         +fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752462; x=1762357262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxI90H/RvA6j+47WbvbjLy4lY2bQBr0L5l614wF2bwQ=;
        b=NQ8FF8lZVo5G9qSVTi3b63GRxoKQCquzOUAmyCpsInK6bTEUP2zx4QWdDcfaW2kDi2
         7YslMDQdc16wp8Uyjwr+YGpUziC5b9ZHTgjMc+7tzBQV9fMHVNVwGn3jE2UD7CsstLCs
         vJQmtwkr9IuE+WgDTJ8U209EkQIwM9QpbFuSnR1YJ2/Tv2YIJQohH0ORmWajAFMsf6M7
         1QX3l125iQDMq94QAoHHi6QJUEIsIYr/7RIi3Ge5Jwy27xvNrZyxd7z236DvUinFn3Mw
         +H1AwhfLPPSJAgIRxAx+XpLVXhsl0LgtLqpTB1umQB/SLiPH+IFsZ/jRuwCErfLDOfRu
         dbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuMJW3tNbBubybEQrEbQxpdfjsY2Owiw46jYcwCCjQzjNrLEFCXz46dPul3Hbt8lJh7hkADv7Ci/gQ/omh@vger.kernel.org
X-Gm-Message-State: AOJu0YyCobCB+ogMWJRSSbnN88ir5qQwetUplfkU8vuR1Hl6I8zHxsnV
	WruD6XbE6JEkD7Am1RI+Y5FBTURiDOGfcgNObM7EtRZN0lYS/+ET9nLOYlfg++KV5P0=
X-Gm-Gg: ASbGnctBd/L6xtZv16/ahslprqW1tVtn5x/7QE64htTDBZGfZIUJxuybMF/IgwhtKqm
	RkRa4tnGSWuHPSDl53VAutjbWLx5GV9bl8EjB569ju0Pm7Pgkc/xDdvsnux32UjOVfHyK+rCc38
	ihtCYuD6w8zIp5Ib8b/vf3wHccF3WW1my54wD4Zw2eMNnTVRU2/zJVrrWkrps+bqZgAurh+9lLF
	GFeWAO8G5knRth4jA+qDib9SOv7LB0C3xE9PO44TnDTz2AS9rrLbL6hWyWGcN1YQoBqSqca3L4b
	L0vULvFBI4urdtJiJ1E7u8nr9Vq5GOdJ9wb2un/3ownwadXg8TBjryUBWkRRMA1Bcx5DeZlJTKo
	fZT4xFM6u0YAAhlNPaA8d0ryXlW1uL31BLsyzlsynxJmDnvLXU9s5W4YJpFhT1FGRq4NJ+bKA1u
	ydUInLg9cbJ2jjtsoq
X-Google-Smtp-Source: AGHT+IH0MTxj4KideKlmnNCTWGRH1FJc2DdwXawsfzS+YbdnXfbjerZ4hGirRpqlsBnBP95NVvOT1w==
X-Received: by 2002:a05:6000:2088:b0:3ee:1125:fb68 with SMTP id ffacd0b85a97d-429aef70b89mr1611585f8f.2.1761752462598;
        Wed, 29 Oct 2025 08:41:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm27006875f8f.41.2025.10.29.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:41:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 16:40:41 +0100
Subject: [PATCH 4/9] dt-bindings: PCI: qcom,pcie-sm8150: Add missing
 required power-domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-pci-qcom-fixes-power-domains-v1-4-da7ac2c477f4@linaro.org>
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
 bh=jmZDND6HgYX8EZDdUAJP/IquD3beTYD9OCZKg3gtY5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAjWBmcy4XgYDlp4xPS0l52FU7QL68VmVi3wFH
 JptIegewAGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQI1gQAKCRDBN2bmhouD
 198pD/9wZok/UWTRqJu0zO4NrX3NW/CSMcltjXyHSXz9f1CNq4CDhov3GAq2fPqNYAwFbGZg4eg
 RmW4EAElTFoutWfp5ht3GhccOCMM5nsiQE44AhZaDeLujUn8kcnNS48fpVjnkFgnYumkvmcBeQN
 51PHrVGSPgTW26Sex0ZDJTwPt//BZ9o74QJ3Ief+fJQtN6ACsJTEIM7sewm4dJw3Y5dsNeijb92
 yjYNeQNfFD6NIb7PZFUgi1yVT0r3IBWtKYFp755iK3Agjfm/XrrHwqI3DidgoHYEs4HsHk13Xxp
 rIvGsG3SMJ5LYSavdm37X5/ENlkLpj5NjC+dmBArbBkLbjQjs7/1C9kqM6fCG/5Tc24aqb5hILX
 Av6B9bUNOaeUuR8YdSfhVtWQZy4i1venuSxvdFskZavcp//gfwW9TzODZOSu76kC7ZYRgcwaxHQ
 cnNu1+HoLlP8JvKl4i/o/U108JORS4vsPO4uXxasvgGhumQaA2c22t3KltmJ//0Sod88rwonAe/
 wd3soqsovOfNnLqFv4oTgT9TBdr2NTbuVxybhlnHRAh89YuK18KHuv4kP/UJNDOMyxvF/ZerH63
 QZpA98YSVZSkCk9mrQvkpKlXcEYhTxEaB7RhJW5TbUB5mj2Gc0zHAgO1nzBk+xy7haa7Tg0TkaT
 WXCe62oV/PbTsTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit 51bc04d5b49d ("dt-bindings: PCI: qcom,pcie-sm8150: Move SM8150 to
dedicated schema") move the device schema to separate file, but it
missed a "if:not:...then:" clause in the original binding which was
requiring power-domains for this particular chip.

Cc: <stable@vger.kernel.org>
Fixes: 51bc04d5b49d ("dt-bindings: PCI: qcom,pcie-sm8150: Move SM8150 to dedicated schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
index 26b247a41785..ceec5baedcd8 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8150.yaml
@@ -74,6 +74,9 @@ properties:
     items:
       - const: pci
 
+required:
+  - power-domains
+
 allOf:
   - $ref: qcom,pcie-common.yaml#
 

-- 
2.48.1


