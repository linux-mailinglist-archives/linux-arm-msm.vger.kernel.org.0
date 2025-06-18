Return-Path: <linux-arm-msm+bounces-61736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7BBADEF9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38627176A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B722ECD07;
	Wed, 18 Jun 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyzw8/+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9722EBDCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257201; cv=none; b=Hq+DzSvEgSjvDthTmukde55zelFMwdvddNKHeUehASmMaZa4m7Y025uJTjsJ0UmF7f7B2nI1jKGzp/yv+hcHYGIYrwROn74IN/P+3lSPJY6C9o87sTOnuSze+SKyYrESuOn4Edl+OFWBi7P52WKWK8mr1Eqrq021oVORG5zyknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257201; c=relaxed/simple;
	bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CTMfIKzpGYq9flUh2qW68oXpkSCeI90la5204MAKXKNdJT1KcMp0gLZeXGu4M27L9rmWY2gNeJh8dzmt/ng0RAOe+IP0We56JmW98mW2H7zNAwXKvWHfJK5AdgF3buW1TV95jrUKdlphGjd0k9wgTBxSZVpzMR46Qq+GE0WOay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyzw8/+k; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad5767b448aso87524466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257196; x=1750861996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=eyzw8/+kfFdltOdKbFjBBhwXFn5p7gJm9M6SKiGQTmzUIeh/fARS/ZbUMt0jQhDcz0
         2xpweql7xQitV1YveBM81souZmj1L3qjrU0sw3QcNSK2cuQyc2fmdCuB9ko81EDIQS0r
         l/pQONAUpAZnClZPLIttcZuGBQeQOEdNSihvGvFr2AOdsY3zXEpEr1LpG6LzUXNl2p90
         T5QFhGGZOiz3xH/RwpK66QfQ++sF+hmTQo+WOfGES6acVhOg/Q9zGfNq05zo+N7hWud1
         tr83fe0z2yjuB9JnaXxHMwTRLrGeYlfT2Qya2UWuuNrKM+NOFm0YXWbN2tmgnZlBymu+
         gfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257196; x=1750861996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=okYWiRrxuEbIqbPmASxGabxGoQ+8RT3AFkD8rbtLf7i4g262T4ppJj9UwuPPeIPzRI
         7mQ+3TykcGzcVa87korEMBKJH4MUnkXWqy5KRAy9qzc+Dmj3DqsNjBHwCHAo/djMoB8m
         JaBQ9NOfKDKPPwXctyqsmVOu8Pg8NxAHZH1AQmSUHxIYzYqknyFuHWBKsXbC/566cxRx
         iJf3Qy0G74nbJ4nWIOVHk9OwaoN6WYRigHKHbYaGMdj75KvhPxAUx09Ze4P/NFmxUQ7g
         vy3FlwAVtfF5Zi2UUIfa03YeykLDoxodGzy2H2lsGPcq3XcUF3Zu39kpSoLlnfdxrrIV
         55Kg==
X-Gm-Message-State: AOJu0Yz+q+QQpy5NyJJ09nev/LnScUC+/LLYN5jvwsEH5Hthg/Ovgmui
	m179WIil02N5EAWZnVvg9u5zL05EvSvcT0zXi8scWTwJ5Tx068ZCmLoUHQfhebywFdw=
X-Gm-Gg: ASbGncvxoIEZ/U0hpUJtJhNmS8tnIg5zvd+/6zf5OgZJpsksviKpQXHWXSnvRgdLInI
	npCpuN9eUCFcVMuDihC5Zm/GJBrzYHk1CZ79SSp77yb1okwteFYNbz9eviLzavGy8afbCQFxUuH
	LZtmXxhqjyPyncN7loN3edSudnELfFxJ6qhib8cvQeAe+lyIva5g/CUyUdc7WHHbMTTbHxE5Z2A
	hAKGxiEeLWD3hdADoGzHrgKjHo85nXq8MxuYa4hJScFI+bGCwQZl0IXSIjVE1y4l6WScHKFq/Ca
	afhLzX7ZOR/41N9MKzkRMS5SQvolf50srwAyvNS4H3pwPwG9OFd9DFCd1Hdhaus/dQUtrYarduA
	EVrBBfAc=
X-Google-Smtp-Source: AGHT+IHXnKRDR3Ql5qmBBMwJv0NM899ZSndO0MgBPTy1nfGVrxEeMqChlf9unxqDA9c2qxWrRaa+yw==
X-Received: by 2002:a17:907:86ab:b0:ade:9b52:4d84 with SMTP id a640c23a62f3a-adfad5230b8mr605074766b.15.1750257196488;
        Wed, 18 Jun 2025 07:33:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:30 +0200
Subject: [PATCH v7 01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-1-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4a7XDxGu9sj2aHu21RSAfhGgELU/Bw0aAYI
 wskTgq5XP2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOGgAKCRDBN2bmhouD
 19AgEACYoVeVBbfztNRqMn55p6VM0unzlIT/zvVGJPIR60HXWSs8IAfhOiu1ULWx3FCuSzyN5s3
 r7BHv1Qa1j5NYR2ckxCaTDjrNMtXMgJpihVNV+3y5kpgS9yMh6JOcxDqPKW0mTTUq6TVcH2u0Ad
 FcjOY46mcxEJeFs/U47eBlLhmniBp4/xUmCTmyFXbCkblkcLrbft8bmU6igMAwAuEtw37bdUIXk
 AzMq3+g9IHbEG4GTSyGvXMltaLTVp7A1jBHGmBBCte3cHlYwaML4H4B5LQz11y/U5AKMbAzd9zz
 4ZP6u5/qTCXt6V8oi8XKE78bpLwBexSdP3igQKKqXYt90rNOTHBUiMMqrdwbwK1yAE3KbN0Uj8y
 mdje9ZrKQsEzF2uVWDUL7FJr2C8B7aMSZSPEbHuWs0rc43xl5FSURBDr/i4ilKhbgHiaQDDyMJh
 g4wqepd/deZRbWir8IWaFaAa6lYN9wX+hF5KO9GMu+h2txpBKn3WCajyOntr/8Wys/AQXePcZTs
 q3SFC7JNPnJHFCOpboTihoiAx+5uPT7qEf9ghpZo7UJ9Byl89c8AOAH0ibzdaOza6QwbgQQ14s+
 DpYSk/mNy7t5Nzzvm7H/wh0OUw/WBFzvpKNTDJnFpxU9KH9hXreA8sPn+PxRqNoLjiJTYOphUUe
 31VaPalhhNu7/kg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 3c75ff42999a59183d5c6f9ad164023d6361ac07..1ca820a500b725233e161f53cbbbd59406326876 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2


