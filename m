Return-Path: <linux-arm-msm+bounces-52621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1AA72D58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 11:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5840F1890D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1B721019A;
	Thu, 27 Mar 2025 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWBVyzsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD38B20D4E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070010; cv=none; b=avmKDiNajFCDhtPA2wDhcj1SF/73bFm6sweyYfQPw9s9BHVPFDpmyA/UhCnt8tdfnm/SicJqN4aOR9PV/2qc/JMw9Am/rYYGhI8WFuXwC++f85rIDNSuIY9fXup52L0wOmAI5MJ7uC98vK/I4oWO5qJE8Zd3rihRdYGvv1yIG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070010; c=relaxed/simple;
	bh=SaEurHg9my0SgGDfooWj4uP1HnHehhMQjbSphU85xtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvAtmDDJY18vHCcmZApym5gU69MdZ7G2eZq77HxJ4eiz+zmcdJ7vJ30Re9rcS9TwMcVFIqwysqNDRy81jAFCgnR0iC0Cq98Vd+Iy2ad4BBsyv9M39rI+Jx0KRf/pxZ2VT2q5MiNi+lyFBdjwjDfxczAAv2JVRRbq5lpTEKImceg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWBVyzsp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso5364065e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070007; x=1743674807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=RWBVyzspIITBF/LjZQR+Ys1DXVagbLEMWe1WSqXfw+PjeeLjzB0V1iYx9024fzEmPu
         GHnGSnBh0P+wq4bHZsiRqdXi6puKwbbQB4tFB0VMfZmgWrMIsYl8uyK7QiVsr21OVD77
         2MUyzL0R/LTuN9GdRKChM7x1mkqw8PSm0HghOhmRoLXpyUn5Dh5BJT4y7w/nrnn54oQB
         o/pYDl0VNO1cubYikwqdI4Nw+3Ci9JLb3rlKzzuIJCE2MoltToKkZ3jvCqjrAJTmsJ03
         CBbnYIVNiqpQuoXvH9pYXy0KOHehBGZKhBmzLgBoXOqPFheC8Qy6G+D9Gs1nBL4vgju8
         6pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070007; x=1743674807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=go8kKm4E9NXgH2RTgCIsL9h9fhqiYGu1lZRGkggdT0IDv7fH6yvUcna7wfDnc+IdD0
         +pCOTe05Z1hYKgMAjnIzMjKCGq8Rm1MPwOaOzPL7bpvc3VfXejxX/cMQcTz+MIf/hYe2
         R0SFNKtB/UDBNF568t04q+tepnuwuG3c6l4beldIEZ0PpidN+TwIfxn+VxTTPsrt8Xs5
         AXWYVbCnWJkQfdurqpPit7Xmeyzw7ow77aH8u2aJxMhz2AXPcr69B1KSi6s+rGLc3tEz
         dWrIjx/aTw7jZFCXzSfjy4adruAc5Kdi56RK803BQIYMAnPxUNaV1/TjE+djHEK1nSsI
         gnqA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZnm9XmY8TXlWdLKQCjfoVNIy7kyteuesTBBGMTFMk229swS4cGyjXuUEprkcMmoXT8tQDFzA2SG1JxIT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3o9zayXZYLMMZ2tycm42Vx3BK5sgQ6CjxRBGe84u/8LOlH24
	YgsrBIkSfiZk8Rgp+R0OeYHPUQ5hjBeqkQeeLrHhBup/Y4YcBIqQ93SAiqYB4WU=
X-Gm-Gg: ASbGncuyhFSZkmMZgXl9WQ/iZ1kJWni82HDl7UJHQvmGq4FCICC8VZ2UNxp43hjbGee
	vZwVPVG7oEf7cHZHsRmTysO6/pm/7Qjnk/SFnT2lBPig8Zs+YjiJVZJ1zFgNDgwSoBfmKyWzQ4D
	RD6RhM7PjXfZbN9GI+HSEEx68qTLUruaNBK4B14QJlhS7Odu1Q06KNliAx57DZlcmgjJQgYZTqx
	X19RhnjvnQzUebvzPJzW5eXy0BMbxHbrg+pHHRDeFTXQbon1ELeD+ChVBnchCiasnrbuJ//C3Ba
	7KxpsctDtdDxrGJAZ7zHSua6txCwyOS/MpGQnNYTmfc/ibSi2TwE9KWA9N4sPrPYkjyrzMfMz1/
	OEVO9
X-Google-Smtp-Source: AGHT+IHjrGVJ6opjaRJWbDSpA1taDVutESVaqvXu4Xk53ocP4KRa0hpwUBXOt4Nk9M3e5Zr5W844zw==
X-Received: by 2002:a05:600c:4e05:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-43d84f5e5bcmr31621435e9.5.1743070007164;
        Thu, 27 Mar 2025 03:06:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ac3ce3dd1sm10843204f8f.88.2025.03.27.03.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:06:45 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Thu, 27 Mar 2025 10:06:31 +0000
Message-Id: <20250327100633.11530-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

Move to using mux-controls so that both the gpio and regulators can be
driven correctly, rather than adding regulator handing in the codec.

This patch adds required bindings to add such mux controls.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..ab1c6285dbf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,9 +23,15 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+    maxItems: 1
+
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
+    deprecated: true
 
 required:
   - compatible
-- 
2.39.5


