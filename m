Return-Path: <linux-arm-msm+bounces-44568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B2A076B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACF1A188B6EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59992219A94;
	Thu,  9 Jan 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilnDMeLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE9219A69
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428137; cv=none; b=F61SWmAhCUMaxuV/BKJbjoXb/zsSrdoG8V98LwADsI+ME+/dZU32v2F7g4+jOu4fF0hj32C3vQFRRnFRFPQ3LO2SkOP0PR+Knz0yn4RUQiJlRBGIFGat/8EgGOPiMTEpX7k42uR9u+DevsiRzhzhL9aCCeI+MicVzysHy0O+m1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428137; c=relaxed/simple;
	bh=K/LvPsSs8jLRaKqgMy3wwlLWJHnMlL7FxoRoOu4sBqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5Y5kCPUdoVG9DDc657Q+mj/Kp28NlfWuDaEwfxLRDTi9RMHImIUvQH8EaSgPAS0o7ddOeJUQckQD90R/xxubeh+4dwAVTpvy8UEQ/kVqW8+xgPdJRoUlW1D/yzhcufU+V4hZA1Evaf/Q1RMaKb67ngr9re+4sS9IoblIJ7GwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilnDMeLK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385d851e7c3so31429f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428134; x=1737032934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
        b=ilnDMeLKK06YXWORjGMa708qv0K5BSOLlAeyM1fUtxsUIcwCbfFSlzUyXQGugEc0AF
         yZ5Nd1GWZdaE55pD8g6jpZfL7NMNfyK8nCQVsAttIEqwcFi2JNeYoJL7pW0hrZgvWn46
         fYqUcuSTMXq52v4WzyBlWN0jJPgpaWT8SHLitnEPyW4d1F6uPfZvWBKvwLlby/pNczar
         CvAN/GT3mNN3uE7KUMxwdcXzb855zpR/qBZYhW4bCU4AUTfnAFwfGGG7F3y1J6CzErdH
         HUzeplGLXWGccKcCyKGdo+qR736MJYRYb9boP7aJHFnrGm/unQBlHQyHxpG9wISuWHVq
         6kJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428134; x=1737032934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
        b=j22pKTt75YmCAihscjHFCSXixxToRQYUlhEBCmcBuCmlydMtS7xys0dsRzZOzeZJ/F
         Ml2LC5634/jjlRLGx9S4biAO1jIPUd9YOsJe9lhkfmZX4FcSEPdgWNHQDli/KoPd/GKR
         /JHJWPXAVvujPZghI9kRWFnd1X2waxzkCPwzHSzigcF3AQZb+yydz17v6qglCS+yLXW3
         gXimnXY8RFX0YFbp4gDVsDPYT3vT0WFel1inR/ZYOE2AzHAR0mtaeS3KDrJy8JvdyC+0
         ZKxoO7UgHMefrni4BIS+u8hlYXv4bxDBLweh/aKLZs1aP3koJlMQllGRV+SJT7OAiEa+
         uUoA==
X-Gm-Message-State: AOJu0YykYcrOeQ+lsDMmfklu2wEiQmUaKrBh0DkvpvQyoJ/vZAevIRor
	hNybVcxX2YfZov8dfDfjm8lOwhvMT7FRufhJMn+x8vTw+K/2O8QC/YmJh84x1jM=
X-Gm-Gg: ASbGncvsQdSoQXUuJTSZfUM/NTOpY32d9nJQnbgELEoZa8Ajbe1VDr2KO+VMJNe19Q/
	qg8rJNGrk3hOajESjdSCJMk0y+bnQhHhUx+nGq38V//SFxthGoivooLsV7bmtMfcRxzmFewTISK
	DuDKxbmmbkoTx6XeYQ8VXtquXXF3ydMvJAb5LhtrvOREAsMz/uk1V/zr3mAMNeT3a/KvPdLO8O5
	7kMnxkm2QHbr4yxyK2M5NiuU/byMA+6sT0xnkqmBexDMi6zjw1pc8fq2EHwplIUnI0Oy43Y
X-Google-Smtp-Source: AGHT+IFekAJfZ1r1j5ou01UtJ2pm9x8oWNHKGsEwHqG1dqXNL1gke6trAGeYBFEtMo/IFRDiYllmVg==
X-Received: by 2002:a05:6000:1f86:b0:38a:9118:c07f with SMTP id ffacd0b85a97d-38a9118c3b0mr622654f8f.13.1736428133846;
        Thu, 09 Jan 2025 05:08:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:32 +0100
Subject: [PATCH RFC 05/11] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-5-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pUHbntjy6x2AhvPYpgI1kBN9V7w7MEQiYl/
 rPb84qWlxmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KVAAKCRDBN2bmhouD
 17RqD/4hZXSqV0jNHcMfDu9r71R/0vF5qrxffDcSEPHA0ERcI+DSVBWXRRnXK8YURGPCUO/z1mr
 NZGDCnvKLrPaqgUsf9TnC9yXI8HsNj4lK+A4SVR7OveLYDXxrLrgiIjDmMWlfEAL21UAbanIdKk
 tTlINKr4K/C1l3uOebu+krY6mFnp+XDp1hTcjnGENBnSirRYdaSwDSq/V6mN1fHmH+S1iBPN5hC
 MVpP150qJRMT3UOpdg6CTuUXTt5x7qbIHiQuoLeaOiYNZ80q4p7q0Gx4hrdZektK6tpS2D0SRjG
 h95B0lCZ04NobyUfQLDAet3hLDfQFx4Juq+/FBkLZhu9iqjXyZwFV0RMMYuSTn/bG8adBb5vW+K
 Igj7hp2GDQ78csiMSqdxUGjE94J2UTxm/XyoJdgspSKUGOOLS9RqKgaXUb08whzFsz93x+KQ9Af
 RhLJr83uNjTs1x4WotcKgc0V4j/h76uinnsFlyAJmTg3TicgKliWvyDA35ys/VTmaGgv5P0Zrse
 loR0pchrIBTw+qahv2I43LUAQgRsCe1C9h1Um0xF8iohOISpH/MtHJZzE48eHUHfrmMNygOuBWv
 xJG36m7t6ZWZBJZ+0ZQ9PGRRJTEpKm/h8ivFzyLx+g5FBewmCsLpMcgJDqaZ0Uv1DkwDbId9jf5
 5Ah7CzGw5aHokLQ==
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


