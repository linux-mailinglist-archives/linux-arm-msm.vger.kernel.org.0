Return-Path: <linux-arm-msm+bounces-48250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514AA389CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95BDB163C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DDB22654B;
	Mon, 17 Feb 2025 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QR8BUiPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC56226196
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810517; cv=none; b=Umc0nYrYT9sMLDUpBZF0uo2Zjkzy6w5GdIPkj/6BgvS+zm7fmSRTOLGpjR73Bs4LN0J4sk9rIkqw4HLidflCmrIxDVVodAC57lLklCa+KMYefLcBKuY4e6+3SQgEAl8IAm6VUdeafZRGMS2oMk1vBquJkTVz9gZPxOf1ETNBvbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810517; c=relaxed/simple;
	bh=K/LvPsSs8jLRaKqgMy3wwlLWJHnMlL7FxoRoOu4sBqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHKE9OSmcnIFkhYs305RzZegs7+Dcs87LWkx+pM6S+L/9/jEZ2j2sbfbdA0DgWnnRPtrtww7J9gmNtsDo5syLLcM0lU4yFGTEGC+nmnq5dgAwXaF9FeQodD6LRTK0uuCj2e+RSRx5MhYIiWzWKjuFmEiURqtOkEc9A8slk3Xi28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QR8BUiPM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de8e26f69fso694238a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810513; x=1740415313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
        b=QR8BUiPMrzRxYT+0ix/ZmPy27o+VvDXGa//26oeGO/JPengT+ZZwCzghwxnFmPN21+
         T1AB5U5FR/SswxEpl1azdDpYDQVwe+c+x8l5GdpdvmCYc8omcyxSNaPs7fOJwjHvXLjn
         H5J8lWoa2Ahh5FN8SKH+deVTqnBU3rFJ2sTGvy3GirQzvqp7aFGWPdidJMvGqQkJRS5p
         x88pOYwqf5zD4qoKE5s35rTbOxC0Nta8rujoAnSbBvt9kIPsJSc+YHybYjlJ5WIrWd4Z
         WHQ5W6kTHShYZt/guHbVH1OHLTSV1OrkUXKnjz+XJlyMPtWHqLcQ+Y4e4/JCDS7AxRLX
         nfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810513; x=1740415313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
        b=vPSBmjZ28J6c7f8Sx0Y4crz0AcyxJ26hK//zAuCvOePRVO+v220mZ2KfcjjXr7uoD6
         A1r+1ZBndGBYZ0aXe3uomfzgeb/WRd1BHpc20VK1jGRLGzKqikFloQbdyAgi4gFmkhy6
         RQUtBxRm2ZChKzmh1yf+4Hqqx0K1hHpjO4tMIaEn2tz+cpgjkk/5goG1pJZUDRRh4bvi
         7ALk2cBksuz+Lprno6Wxe/4CDN1bsclLBqFofdn3jE2EK7TUSVC6YDHJtwYLQ3flr/yo
         xcL0XcAjbbbevDK74sDirz5jnIwQ2dNX70Gv4LdX4Kw7OmjY3isUrwTctzU4eSRn722S
         KFyQ==
X-Gm-Message-State: AOJu0YzNuSUAz2mW46qSBMZa4suF7Yh7RiZ3ctXED6hfIRZgcKvmtdp8
	ghJNFoIaMQYn/MnLkZpBWrUZYRWr29AitzsmOsUXNT8wQiuz45FYIP+nJOaA9tc=
X-Gm-Gg: ASbGncvrDZhOtdZpP/8HcsxNk/8WqLYaZsol+B3CG7qHJBlmFX7o5Ec3c+cuV5MI8Al
	nVLY26/WzM8D4TIgcrVsc7tLRJdWVm6JkA4YI/sA/hTR5sR/UtOdHAA8UFGiwh2ggKPxxzsPqir
	oQwUpcAEh/+zyAH1u7mwwIHXrE9rt7o+TV/xH6DIgsdLzRebUJA2JRrOy+WSycpn9wVmScyKY6F
	Okz4gQaqBhu2mcXf1QObmj6YwizI/GqTPHqIocGWzj3b2pxCVtxvUG5bmtzpT/kbo83r7uqN4wY
	tQXcy5yMYLOJXoc125jnV5TQkrvF2ag=
X-Google-Smtp-Source: AGHT+IHwt9rKtdqVpWvlWMU9opivZ7B6UiCBuR01NuzfOowAfznEVo3RY7QMrNt1GQOd6t23b+mNaA==
X-Received: by 2002:a17:907:c1f:b0:ab6:db64:b040 with SMTP id a640c23a62f3a-abb70dad1e7mr357653066b.12.1739810513000;
        Mon, 17 Feb 2025 08:41:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:26 +0100
Subject: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K/LvPsSs8jLRaKqgMy3wwlLWJHnMlL7FxoRoOu4sBqA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a78Jl/FGD655nQ2ck6lMnvuiIvLFc2KWABe
 cxYdI+PBHCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuwAKCRDBN2bmhouD
 19SAD/47HAphtGjTesMY+DDBLPGVDxs9LvcNhaL12xOwXoKX9nzrjNxyunuPfjSnCSMX6P+7WvR
 WOE0v45WZ/wAuJSaUZmryLvApkkf1UCY9+KEXnglMErTefMJW5nA1ZANRAQ7oVJuZe08MJq6UZ2
 6FcW/BuA7wkxKcZ4+jf4/z2GJgBl2B8zrWxAA7vW4AAoF/nwM8f2g3+3cFiEzCEyiCOKFUl+51S
 1/NYFYzfTa8qebl4rQr/QBmTPe+8qoP6eFrwusxrsXJezjXMpAG0kB8Wto/YxxtWfLAEgWE8H7U
 v6FG6CT8MTIMY9YAML0nRz4pcGnsfq2Mjv8zN+LurTsu4WVrr9Y50URiIvm9ufKAe0OQIHBrRmt
 fSt/MfvWHwBdOv8ivzJBjOQZKcVTXFRg1t4Z2ovrdDxNL6yvFzcSMvHKHOYOImeo4JKRRWHX2xS
 lcNVc0pJsEGBPFz1eeYZPiMXBklL2KZGlRXHTKQU3qqOMDdogSf2k37eOf3Qi3zGEUF27X3o80W
 1n9sHksn6pT9ZLoemO+9GDmyV+3j+eKrZRX28sta+LIFpua0998IQwIQ7F1KRFTcwtJYfm9GuGm
 TMXIcJ2EKF7scPlkiwVXAYTHa6K2Tg9KRqnxHO1m5Y9LrSctkxV/vuc7R1+zQuk+0BB6JwUMgxV
 iWuep+VjxioDxXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.43.0


