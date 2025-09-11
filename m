Return-Path: <linux-arm-msm+bounces-73143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A112CB53613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E0423B3770
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65595343D94;
	Thu, 11 Sep 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyUkSf5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8463A342C9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757601947; cv=none; b=ljwlNWJnKJgdrvTc/bqM/Qnnuqr1bPSKHihg+lg7ejVn/bey0x0KuykZZIXB+b3WiLv0kng0h2dFrOVxa1YIP99pyyPyWEiSPXompr3tJGGeOzUMn9tWoi6K+ZpoeqRxyCM95uHVyont1aF/fuXPZn8DRuHge+fMDYsFzBucCAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757601947; c=relaxed/simple;
	bh=03YskNZLKf8OhvkKpOjLnPHFdGEAsbxR+ROwyIo2lLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGiA9aKpmrpkNHpPJT6w0QDeernpRhI+ZoeXEcG/5OEmIJ17WDBHKAKV8U8YlJWE3pCy7pvWXiKJw9OtdGFlHmPzC+1QxvYD7cjvRSDL84XLNS/6nAi9vbRdMtMwcirBrIaghZxrukRxDbdpqLzNJ96P3WCW04UMqvvLJs0e78Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyUkSf5y; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b047f28a83dso154579466b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757601944; x=1758206744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmaovmcheFOmFnp07VWNh+ByfgZPGvN3Mt5j2vCPIc0=;
        b=HyUkSf5yzHGNNcQr2xsccSOQygQc4M3hiB3CygSqa+LzQJo1ScEa6EVlso+kkRs4Hs
         YoqKGwqKtr127x1KU+pRKtHwGRjZjKNZxZKJIRw+OnjcoiWl40/zjwEa321h27GdAklS
         o+ZVKf5CgVP4360f4fNnFqBGdgNdCzDznaXLXBVGO1wEcWKNw1yUQYLpD14epanv2+8J
         UFmWLFWbOQNlFDjfiR4B7FbkRe70XbHVg9AHqNVfHlFk29pdjvj4OkQKURJRunUVMKe2
         9lOInqAPNoVsnDGXWp4NxdqJl8Ocb4mPmYSlEqv2VX+aJjfHm55aTPyMt1agTiiENwm8
         2nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757601944; x=1758206744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmaovmcheFOmFnp07VWNh+ByfgZPGvN3Mt5j2vCPIc0=;
        b=dphxkFtqO6XQoKCG2gGBmEJFr9Ei1Zuf97LT0EfvibGOGXaGv9dxt3oL/81LQWYBUr
         7XiDmVy7M9+LQfwAj2vHwJuizdBCqj1uHk82BcWggyJuJ781CydJvuuzjA57F9T9nD/H
         Q2jeDcqjzgGjjbmmhEOvorlrLA7gMkpzKr3h+rUdx1QQ7mhKJwkNmMReCT3m9D7tmoiT
         k9gpq3DB6Gn3XmZ5r453WPEohoDDmRLFfPtdzzuF0s7/6eCyGR6ll7GX+9kzSBqiiVKR
         xC5iFCxo+CFvYKtziLgtDI4UrqY1YvSrDHsvhYAq4hp0NoXVvRbfsnGjrL0DyOPXbHHL
         ps8g==
X-Forwarded-Encrypted: i=1; AJvYcCW3aIhpUsBnD3BwnoPHcs/pIeaBawDCjHuGMBaiKlwnmPS595X+Lyu54YnjXQmsCmXx3wEfnaewsshaQhcW@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOY+pUIXhVA3HfDrnyfyinCXWjcT6hoRLw0+hfSUSsWxCF5r5
	YvGJpkiQx5fxDcGPwjVmgBliA996PPpzvfDIhoxqpeUkHq7Hv0pPQKyNXLzSv2lvBQU=
X-Gm-Gg: ASbGncsSxXH6iTbNQHZ5z07C4WRe/W8TypAzpA2PCjtLzwQmLzgYR5iOP/eQBzoIWcM
	M4Pa3pGBxoFMf0LMn2MSLGc85xcotK4s9YIczcdVYPja9PTzyEcBtU8vHX/QnpM6yTpBAGaQrqf
	vt7tj5BJdCfvkd5Di8AaA1HUl7f/qQEIUYNZwg2SPimWjSAskzW12eChDlQOs6xTgmEQWI3sEGm
	N3kH0HvTeZOFgEewZUJhR4cHZpIbJwNC2mItQiWZ9cODeM+WvWF7B+UWw3NHZ6gzyLMVpQV5Z2/
	SglkpZNtOAcEzol4jowH4hxAf8dGgsE5mIZovpazNaFcXyNk/l+4YER0+wcQklQBm+t546qnmrf
	UxFeHwYEWZyCH/uZ2vc4w8f4a00/O9mt+FU4erMUDcceO
X-Google-Smtp-Source: AGHT+IEMGu3GJ/3a4WGqg/zWMK0hDQtQmJ6Iryn3J3JjlXUMGe4FLDan/R6dvlN1OT4FB+YPOlnyAA==
X-Received: by 2002:a17:907:c921:b0:b07:8894:35 with SMTP id a640c23a62f3a-b078894027amr514662266b.27.1757601943851;
        Thu, 11 Sep 2025 07:45:43 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31282e7sm147196266b.23.2025.09.11.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:45:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 11 Sep 2025 17:45:22 +0300
Subject: [PATCH v3 1/4] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-phy-qcom-edp-add-glymur-support-v3-1-1c8514313a16@linaro.org>
References: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
In-Reply-To: <20250911-phy-qcom-edp-add-glymur-support-v3-0-1c8514313a16@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=03YskNZLKf8OhvkKpOjLnPHFdGEAsbxR+ROwyIo2lLQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowuCPnspwHKIZuOZw7Vc7dqO/VRg7HNsBadaLS
 qe4sALclxiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLgjwAKCRAbX0TJAJUV
 VpOkEACEGvJeUaLnixFnmTZWS2Ex+hDrx0G1njopKGtlFM+swtrbL9z9C8aHLYwt3nkiYXPzccC
 KslQ6dBsuW+6pEVYHKKTehDjjfSIlVF/KZIB1M10pY8iuA9lnZpUbGBggnFHsBRdB+VmxxkBXzX
 U9eCcuGiA0myD42WScdZoEhmnyfeWACSURsWJFm35IsHtYbYSZAzPeYO6E0wxrwUaqLlQ5fYQ+V
 SQFrgaJIczJOWymcybAgOG+fiD9JvPVwiyVHOeKwAe/dQ8Kcy3dpyUHNBqel9lCVUn2O6VLzwRR
 eKdWt7g23lrqxmR1V1XFRvnVrrOVG7nWZBVbrEeOVDwDqbBL/cNdoCaOS1qsQC5/5LNC/X2whpQ
 9i6eYETZvZ4hnWCq0lmZZ54z3cyFD0yxxmUt+Gl03HffHOO14H5TEG2oyXf9v1DAkOHq7QfuSis
 tRs9a/7pjs+NW7DjXFUIKsf89EjIjDlqO5r9G6xmcowKWipR7RCEB5LLYrhyPZ6OYXY0W09KA1+
 OSeugCXy9dFO+ClUKaZ9dKcHn+t0v8y8YSF15A4tlv1+yzxeO5b9BZ+nMmFI7l6Jx6gDILrKWK6
 mXj2LcOHAp+TdAUSmbJ7M7qd0cKeUPB4r3uVrLQd5Jp4Ok3yzdwsrBo7hLBbON6Al9Ge0MFRSeI
 WiuQxRrlECuGOGA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur platform is the first one to use the eDP PHY version 8.
This makes it incompatible with any of the earlier platforms and therefore
requires a dedicated compatible. So document it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff9e31981fe602478f28320545e52b..4a1daae3d8d47ca5f08d97a1864cfd615dcf108d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -72,6 +73,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-dp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:

-- 
2.45.2


