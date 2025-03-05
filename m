Return-Path: <linux-arm-msm+bounces-50394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D765A50ADC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 021147AA4E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A52255222;
	Wed,  5 Mar 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvZoe0c8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D19253340
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 19:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201531; cv=none; b=Ff5iSID1tf/D9KsqFd9BdAhoUeHaXVJGnZis18KENJpTDex8nXw95hBt5KpQpLY2AduROC6QfUSgjkCdSAAaIUkdjiNzLvSUM06Gq9kwMG9nTIB/DdTSK2xraHfDOBEAssHbXCw9yni+8/hECM1idmIsRNyJ4Ex3O407TGMDOaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201531; c=relaxed/simple;
	bh=rZobr5wcTlhEiVAtYQB5i/HT1qKxwHEGG9fjtMu74sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=soeCIMbbAZ+ormoBlm4FAodo8bV70C0YRAUl4wyl0uJiIJJlNnv36Bb2xAzcrggxb0NV3sdRwmkwiMQ+3pYT6TSE7VHjhA/EO3arbpQTVnPK9S3cxtDSBaOeiMmYwwvJZmWY9wrobMaD+kfdvlN+g736boPAB+a7FN6kz5YG0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvZoe0c8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390ddf037ffso3904970f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 11:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201528; x=1741806328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kaj59JWv8fpvZKdwQhX3eEQ/lEkOt31+9Jk/t/r3z4Q=;
        b=gvZoe0c8RsT7zOofhJWQvqVUw5TFZVqW40QZ5gZiWfJoLrVuAOYYj78oaGLBbB7vEA
         2Qkuv1EjmcY9k3DjrBXFBNzt03W7J3x9RZOywUFdA4sIuyaY4c6RDDQI30S0mhXPye2T
         LTNVR8kJNvt2t+zybah8M4ovr4iyGpSeR+kbnuPyWiFZmp+M/ZAjN89dUSIv598Ny7Mw
         ICZWclpySgpc0TIIpfpRaA0OUCKm35GbbnHpkCafWCKXknHPNN+zW3znh/NWreTZn/tr
         SK96x4YdLTy9MU+x+YTlnclh/r/WjXvZrm/tdpe7CXYU5BWzdxTr5BXFpcrFWqytmYxR
         gCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201528; x=1741806328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kaj59JWv8fpvZKdwQhX3eEQ/lEkOt31+9Jk/t/r3z4Q=;
        b=DwDHqWH+MeBFXCKeDGQLGmEcXpW+9lUzJ5Ss8xp+yUiREW+HXkbdJxu+hTupqd+QQM
         /VuHpJmfeq3rPgaUL6IE11yY5aTfpOwZNKdajK1dRa2jGdLf3vh843EB9P9/QvrV+VgK
         wuuZSnPKjFR7Wr7jHyNGy7tt+RgBY4wxPab7VDVKZ7wB0hpT/u6hhD4FV/Ou/Va+KDPi
         i9RKqcqjXETFPA8T0ISjGskWiLVS3HbQQrRXeIhToIlBKEzNNYD1l8tPjjYDkH9ApWjU
         G+9kq2B0Rm4IHga1v8cjn/nnnsFSD2L9nY6jEdxi+GNNU1wblLdoCAssntjJJq/IFmB3
         FlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOjJKWhBDNWOmE1EWm7FNbEodUzd92QsaExCjc2hhZKd/FNLTIm3oFFj/07iKaT7Cq+EFH9ENxBbqpz4bA@vger.kernel.org
X-Gm-Message-State: AOJu0YxCef2PE3yZrn7H6qlXv5zOx0ljB076LkGW1TAf8j5Xq5t96Blb
	joqaWECZ4FK/bOYibVONz258KDqJUJz7T7dmzRrsLCtIcDQt1QuLVRtuReO39es=
X-Gm-Gg: ASbGncuD47fHBUcDdAgEracd5iwwIRzpB4DSlctEhPSukDDacpWXuHSGHABJQ/IdjHZ
	t6XyZIcvkBbzNVpwq0azpZR0R25qqPGm4LwYIn3gB1br+9Go/qYLHc9yoNOjb5/2lCt9SAdDykt
	4yy/gwJYYnPxmbTVSo1B9pE82O/bv0wJgsywn1vgiRbqJdaE6m607QePYqCMhZWbbg1SWgyaOrK
	n4ISBtX55aBLmZVXvAnm5NKyq/0Sj09mA/ismc8+ZXEZUqWm8wB/MRzLon4P1AyNsdY4/fXNluW
	gWk6uXviM6S65YbB9qEScoIejqa+sSQlPzq7Nro90r7oh7ffWAaqVJKm6vm5NorBug==
X-Google-Smtp-Source: AGHT+IGYzLJwg7FBqRTXK9nhI85AB7AnaQrWmA3XgEVM55LrF/Z0j81U0P3KALYF+4LnaMMQwwwR/w==
X-Received: by 2002:a05:6000:1a8f:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-3911f72620bmr3691438f8f.2.1741201528087;
        Wed, 05 Mar 2025 11:05:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm2045218f8f.21.2025.03.05.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:05:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:05:19 +0100
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,sm8550-iris: document
 SM8650 IRIS accelerator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rZobr5wcTlhEiVAtYQB5i/HT1qKxwHEGG9fjtMu74sg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyKBzX2B8GunSD/h8MttPoHNqZCC8beKHLKN6H4g+
 /9k4IX6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8igcwAKCRB33NvayMhJ0dm2D/
 9l1E6q5hnNYFNeNDJkFPsawIuLbkj8YEq7esKn2iKvhTk8M/b5stZ3fzE+OktKI55B1UUij98yEdbb
 YJ66Fa8FLBam+o32FZ2x3gVeYRGnbdadhl+cgO50mQ5+qA35n1bNC6B89vZZ83aB2ZBg5dhVZ0kFHx
 lw+7LptRZcRqq3RzW0MBeTK1Y2nBPqquSj/Wrpq6XxRlu1Fz8e+SDgPBh/tjxm8WoWK8jf8K0Ffg1f
 VLvEXF6VaKdePLD4Q2H4A4bcwM1L4U5UMkHYxzGZHVCmawCNfiYCF9O3PV/0ke8E05vwJxQFjl8Vjh
 VlTgeGnTc1EyuGqr3yT3ILchssu7xkqxJ7UBZZs+61GVErLZCXYhRFzg95YjHWykDHtEBukY3EJFC6
 Mq3XGOqJ/8sS4bTHr5x5kZVtvDolyN1vCHaCGaDPM1Z5oP8tWKZNfX28JgaU8axuDHsPOqaECevPWm
 nIK0H8W7PXizIJSEOGHmLKtbP6wH9fTF1mEpT8r7rcIGUN5Vkpo17BmbB2vcuC4LiqwXyjt0FSJWDi
 e228qbMnIF8L4tLt65C3Sjt1KPx208Ef8Tmx57uSn4t64yfU7sADJCUOnJmttwzNBqYEmufLo+DV83
 MVOwYuaB6TMr4h4bMFDN6NTdImmTtRJzJrUc23EKBET4Gtd60OvrEwsWDccA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the IRIS video decoder and encoder accelerator found in the
SM8650 platform, it requires 2 more reset lines in addition to the
properties required for the SM8550 platform.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 33 ++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3df964196e599a57 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -14,12 +14,11 @@ description:
   The iris video processing unit is a video encode and decode accelerator
   present on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
-    const: qcom,sm8550-iris
+    enum:
+      - qcom,sm8550-iris
+      - qcom,sm8650-iris
 
   power-domains:
     maxItems: 4
@@ -49,11 +48,15 @@ properties:
       - const: video-mem
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   reset-names:
+    minItems: 1
     items:
       - const: bus
+      - const: xo
+      - const: core
 
   iommus:
     maxItems: 2
@@ -75,6 +78,26 @@ required:
   - iommus
   - dma-coherent
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8650-iris
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


