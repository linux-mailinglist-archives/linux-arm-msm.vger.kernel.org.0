Return-Path: <linux-arm-msm+bounces-23784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 137BC913DE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C470F281463
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F65185E45;
	Sun, 23 Jun 2024 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSG+YYBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FEE18308E
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719173011; cv=none; b=lgGyBVplTqcxkekIRJA6CZnDTtUo7Gg+6r1BPWDvGKlxV5MLRc0WpGTpqcj2Cafv7LSK3jN6vrazot/MbcOetGnX3DAV2gr75293o1aKvQwpH7z/REuEm0eCYkW3hG4LIjLgSgzNBGf37AFbeQ6UPkAKDKMkXdaqAiJ2IpIZumE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719173011; c=relaxed/simple;
	bh=JAgl9N70T7nBjWq6sfG0RrGjlyZ1vYMXOKdaL4AiRxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5vK2R2wDVEt8HA/ZpSyUgqQHkX8/w3BbD+xOVf8mYhhsd5AumLl3rEqjxntQzZ3uAxbXPwSyGjVJ1bjVaAvlSD5FqmtAgHTxC3S09J59ONSsYaNojTvsG+M0JZN3AzA5ZfY6/Bbg8vXah6RxRYdxUFvLH/kbdUGHSalfqN197U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TSG+YYBG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217990f997so26885765e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719173008; x=1719777808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xw3d8h1KtA4Bw9HNT33Bp9fAotcAbqf6CP/+FNxfG4=;
        b=TSG+YYBGzk7qoIT3XlKJoxzmgWFeXwkEfILDhzEvPC4ToA5WQ79OR037hCAru1keMa
         4wdVqHB0nuZBhdvlXHoJcPLOF61fI/KFTXY4bvGFpOyW/4XtkiYZgTSzs1L1m+8NSitv
         RDW4J6cjE9dy/p0eVO8VC57r/HVGHqfmPApMwIlKtfX30uZ0F4Qg1WNMVohTKWrJzr1Y
         kJgZSh5Ki235P1xjbwTNGWMIQDVNryj9d81lR2MS6kX/s+jVaXJPWAqrG0I0tNxYCvYU
         OwBmobJ7QBh36Zku/f+V6NsYNi4PGbkLRsGFPjfDHmXk0pGCIFFHA5YSQWSi/bOpzkSv
         ixGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719173008; x=1719777808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xw3d8h1KtA4Bw9HNT33Bp9fAotcAbqf6CP/+FNxfG4=;
        b=dUcB5GWGz3rjHePSAsW6JZn+i6riox0DMNUsIMhxXOPRb9eGoRw178qn9zqftQqP7n
         wIptXmvhrlBfeamjFi/xXzEHjJRDF6my0DCa9QJfG0wTFIxt/3Mjab69aRkxXaDaUbgg
         8/JRRkNsHNg0CvJEaeJXTBgNEVXBmEdJq8i+c/xA19IOldiEZVhcQPbuwqBR0AedytIQ
         EsuU9kl4qOBDvedTmVhcEoq1Xxm8ipl4u0BfNwKKd9PxlEdAzkXVI7b28dh5v1t8TkBL
         /5+mPFVjP28Tm2TvZRRpbppgyeUblY/jLLmro8WolN0F3dBipbLSdH784ji3nsZ/dqzm
         cTEg==
X-Gm-Message-State: AOJu0YwnxKbBaRmSox1cMeNuP5SEp7oGaCYBHJwJsR67NUQq3Al0KZmt
	SXDaBVLREJRkLlqtgiO9s5jucWNN2D1XMCcyvbU4jHopUN5ODx2dwWoA68nwUkc=
X-Google-Smtp-Source: AGHT+IHe+47qKRRfSwrj79ONMz16tzlLcTL5okV4sa+DoIkXOUUXKXA75900ckiItgh0XPvu+g9aIQ==
X-Received: by 2002:a05:600c:1c02:b0:424:8e37:f4bd with SMTP id 5b1f17b1804b1-4248e37f5fcmr13985735e9.7.1719173007957;
        Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:03:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 23 Jun 2024 22:03:01 +0200
Subject: [PATCH v2 2/4] dt-bindings: display/msm/gpu: define reg-names in
 top-level
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-2-9496410de992@linaro.org>
References: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
In-Reply-To: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JAgl9N70T7nBjWq6sfG0RrGjlyZ1vYMXOKdaL4AiRxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+HKVRaplObRNxhgegl2aew/fV0tzsAie8BX
 7Qgmsz2c86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/hwAKCRDBN2bmhouD
 15M9D/4rFV3sFT+G51uJJNM74lvKwiFFLUuu6qyMY6Pn6XV51y5H7sSrgp7UqVzWmTsNEy4TAVL
 zh0cQUl1FTpnBwyCrkailFQMuMU3sbpUjECCFUkAjkOHkQ221wRccVFQCofbbAQfLVb3ipDhqWG
 hDa5+cSZa13fakg9gOFD0Iy7UknBSpncDRpPiO0yNXW1ocHU1EjYr2+Da9V4LPIWOKwxTLpE/Pf
 RGFIEuHmCpMRtyFDAjC6mwSZo3g0iAuhYe2SbyhjrvK506zVZ8NLGN0y57ErKA78BzlIlBcWTgx
 F8tOb8VEv1VQRIaqlqVt4oZ1U++Xm/TlHX1ILDk3fJGsTID/Sgj7+ozSHiRH5MHjY4G+0Wk78sC
 YYfmdY7UoJuYbFCLb02FuyWfm3TcKu1QbqPd/fYQlA+eT8Pd5w87htvIVjavUJ6SmiHqU5JFjO9
 DdUSQupa1kWFnF3meplTgyCuBRyNX3kApnP1qSF+vwYiXINHCHftcG+WKq5Tq8pROFKxKdeEO+V
 q2FbmpsWNs9twhn3OArE2Xa6U8MyZMRGqWYxmZMakqY96Zgcl9rLxjbrmyHsEaTNy4RmOyBkjH8
 PmNVAidrjBDFEk2KnxpsWplocLPx+s48I7HHtCV7VC/Mlqe9yio5hUZv6Q5SQB5/3+d117brxE3
 Oqjr5j50S6Obb6g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

All devices should (and actually do) have same order of entries, if
possible.  That's the case for reg/reg-names, so define the reg-names in
top-level to enforce that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 253e68d92779..baea1946c65d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -46,7 +46,10 @@ properties:
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
 
   interrupts:
     maxItems: 1

-- 
2.43.0


