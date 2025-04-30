Return-Path: <linux-arm-msm+bounces-56271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3DAA4C9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AC96501A04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7CF261568;
	Wed, 30 Apr 2025 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3L1+3TW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17552609EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018079; cv=none; b=oOf6H0yczZPxly159kGwPg04qHPkl99NrKNeF9B5b5uDrtOKISDTNIFVBQrcHSbqrTFUS0MYYAxCWprnJN3+yaos5raKC5JXAYxSIWFNqiSUiuGOIQJjMuJobRZkc0YpVJ8ABsLxiHBgD4XSlDmSIHehVISMFKVIASxKtWVaWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018079; c=relaxed/simple;
	bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0+EizvA2Rc/BLZ0esU2Pwh5EBrvKyH3n5jdO/mSdAF6VITzOzyaPfFAdsAt8dphaFxjWL8JcA+fLNJcRxXl0n9fzO3TKpVphg1yDY6+hqxDtYrwWUEJXvCO/pQqVTcXyQXwY93C0VT7TJmHEDAg3BbEg3Nrti9L7nHRbcVj3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a3L1+3TW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39d94327297so784480f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018076; x=1746622876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=a3L1+3TWUpMkSqLEUFabb2MsDGpeLsNCMu/Ci+6CLKF2K9OJjpK1zKkcWVjc0kl5k4
         zjGoxR4XQis75lYNlWnCnl58t4x4vxzabR+0HxRSThNSbwbkUnIqfkTxGjZAhD6uvAI3
         3l9oS8509P24cXPNE7XlMlA+cYB3vWE10MWv+rmGwLz2728j6j3sJmxhupA5WAsNBuE0
         f/XNukPaqu5oZCK+D40/sIlPMRVjnlhNKtJeGx3mv12wATD+UVfZ9Pgx4kiG0m3UffAM
         ssyW7AeGa+ZtsCUdT/FVrr/aMCmP5BOJnmqI1Mu5rUmPJaklMCwVZP3GzU+8YrjJjvi3
         fnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018076; x=1746622876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=ZAw/fq8ATQonu8kGS1jbp83iImBQ6NaU5uOt1dEj3cBuHxBL34ZFVzXTg39IX6Iz/x
         o7KUve5NTIu0p27buVGFxm7CEOpffjvghrvD+vQIoMjBfUdBtTsKUhqn5X/PHuDm6VZD
         Xeqs1c2Jl0A2Qk905lup82m6KLECqbZ2d46fO9KR2bhde+TfsvRUMgXhHdrtYId962mb
         DFLQucLbtNoZGOG6Ie978pyAsnqOWpPmyXsRJiNWJzWseP+Gc2B6ZmhFVhoAv+nVOEs5
         zAHqKrVosgn9Vv0iMN12yqWhl/t5oR4crk68urxoiWvxL8lIuNtCFnlcq7EiTplT7cYJ
         j5CQ==
X-Gm-Message-State: AOJu0YywJVEZ5YUna7POQfv5GQTw52X7e7XXBv9daIegkpNruCGlRV56
	MItTFeWGyAKou8e5WfqFr9mLin7ObnnxYSYUSq/T8z7SCyLqmR43klCzHBbcrSs=
X-Gm-Gg: ASbGncs0vm3VV4gyBaThHi2oxBTzjh16QfSeU/Sb3B56rKvXyg3PvGNr2DQ2oMGQDAL
	bmauqXCCG6/aSkk2NDyiZZfc3I+czH23MM1ClnrBMEjbDKHtSnKQJhhuxTJHm+4uZJRp+Is/6kL
	WJTdDVf/2Aegq0TIlL61ZQTjyMcs1HzRqvWxCR5dk/dVTjTzobqldl1FSPnIa8/Lh7nhUPDLZ9w
	DHtzLBCRgLmJn3e5LbChxe1ZrjR7W+eXzdxORaAlR0EzBF8+S9EpNwgoDWKO3b3TNj6FNN54AaA
	eA1RUTYPL5pwyGiBCW9o+gexXZqxfKGG5eDsSuYfW0VpM+pzOzoOkiwW3T8=
X-Google-Smtp-Source: AGHT+IE18JTYANDILCbq/VvMcef+4LOGatEO297qJkCdJ+51jnqFQMRJCyhHvokQM2QNs9XBMo3gwg==
X-Received: by 2002:a5d:5c84:0:b0:39f:6e2:f846 with SMTP id ffacd0b85a97d-3a09007e389mr808544f8f.11.1746018075739;
        Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:34 +0200
Subject: [PATCH v5 04/24] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-4-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh72FpXr2OvUJMdqZsONrKoHxF92CtBzOH/+I
 WqrcPyAtRmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9gAKCRDBN2bmhouD
 1+MZD/9OF5Hp81jdBQTywFeOv8VerfYbTkQjgvr569Zvd6mUXMgHttCIYZ4RrBdqh5+U2LjGd9o
 yA6suSThzxkiMb7b9X5JAtwcXrNXHTwFyodBiUN3IWd7i8Iom7/LZaHbJ3XWcyiHjFPLXmZ4iAC
 f+W5hqAcKjZRLkTjQOG4XRbVmnZnuhx5K9UKomzZ3MseyCdJgv/4qeiXVRj3vTco/eqCPh4x2Hn
 +fsXYNuJU8tGelCxGIZgQ5uOV8X6YiNZ3dRjQjaajPNbtL10FcLOJyjo5EHhhGCSrg/QIepbrT0
 3hfYRzQaef8mX1/7r9Da8S01UUw3lcVDEbxAFPRUdj9tHr3sn1Ym4tlCWlXprGysGMn+E30fyCX
 J0nXHFAH1HaAbsevaDzc3I0Nq3LAIn0+NMHbxdoAmgwtN8OS8d2x2udAbugBFLZtV3lJK9Zf+pN
 20XKakZvuzlqs7iLROykPYv14kRuBHe/RpUJblAVD6nlO5bbSL2uX/KJ6P8PbOzz9Ji+e2gu++t
 niXHUk1YPckv1HqkSVyI1djubaN8W6cxm9W0uoQdcWcsH3Tx9jkrecK5fZd6vtPyn7K724vnsVU
 mbgSnEGQu7KZ2NsTbNxJ1YC4lWx/ihyAP2i54eCqpvPpz+KA1HD/SB2XFW3CGlBWy+lm8Pk9f7q
 zot22z/xMwkT4wA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2


