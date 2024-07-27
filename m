Return-Path: <linux-arm-msm+bounces-27129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CB93E076
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A307B21057
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 18:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D243B18785F;
	Sat, 27 Jul 2024 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW36FuRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A218784A;
	Sat, 27 Jul 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104458; cv=none; b=n6fjf9HbCfOOYnv7DxhLzy4OPh14tCErQcOUoADFO/d4QdRo7w6VtLO/YlDHsrPe17YEU8vqjkR3xN49LyBW1e1sYe60pJfXWn3XRDZZh9PcYzrdtKUdQVoR/LilALr0yOy6Qt4ry2tcJePgD19rEo9SL9PozQCEQ70HqHfVkJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104458; c=relaxed/simple;
	bh=cjVHMpBbBNVIROJODEIAMPhNoAE9dItU05+iUVuD1ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMypSTqHy0SLCRg6yrIXidMvsdtEDVuGuwYe9TdWtm+W+JPuvIG99OoQ8n3juE5ZrlHl9p391xQYS5LqehBBeQrH8vj+0r97wxHjFuNJlxSIh2QWW/XySMBOF6zWiZ5dP9VRBjxANDBWDYjL6eeBAODJUtKW03MAdfDBd7PZy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW36FuRw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so21873491fa.2;
        Sat, 27 Jul 2024 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104455; x=1722709255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=PW36FuRwvLOjLf13t2tVQOgYPOV5T71cNsTLP51bFMI465qAqQnxZ/aV9hP9ldboDR
         0N7jn0BxC5t+oqiWkcYFJJ32XFjfvpE2V6hHPQe8gXykJO8IL79dbV0efbg/n7/sgrPv
         PWC+V/GGJBQUdKsjlknGD2jPAxH3cTHQgglhRT7QnNzdPEG7XQ8I4l2Bcr5BWvlfTdXQ
         /4wg6ofCE5/cNZ6nXEQKrG5t8i1/nQj5tMvJFJTFl4ueE/Nttb+F+HWoFCJ5N+6QexFr
         jTiIaNBK/7zPtddx/EvzcBA9QrBQIdYF0mbWivaqU7kzTeegE4121NI/Q1Cv2V3aBRcP
         LBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104455; x=1722709255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=SMs/ujiFh2VArI6WNwIMvNqub1ghQsZyDKs5K29cYbm+CH3Ez2Bqn6Rxir4GG1E+3O
         Uu5gfH6HttnDZbLngJ/Pm2LML6jOfmxvxCWDxmM2Ylhxr3UjThinyut3aXDybeJkLFWE
         uSpIAyHNIVPXVsnUt54oPh31xID6p0+QwI6Mf25RnqVdt3twjtCGyo5utyegXewm/MI+
         ASHRWwPBM2Rg7MdMKwEG21mO620R868beUARdmfPf4/Vkt42EDOQ1KxnYBAgF/KLzGu6
         fDW7YKL2mRd6sFZE0mjykCGObzrRBGIZfvnRsv48ENs1z6MnG5hZnIw/CX0AfeANAC6/
         VN9w==
X-Forwarded-Encrypted: i=1; AJvYcCVmeABVhycDt9c7iF8y0TJwYgKxs0BxqcSwY20ZEEiQOmEG/NwlO1zcTmWXVKAO0bKp6/J33OZ48qrJ6XdviFNbhGmNWCYLthr6w0OCnLhnum8k4z8IXAhauAN7BD5Dp/Rl0pmkh65eLcVbinlw20ZCX37hEnsQchqKboNpe0XIcWkJ0NLy6CRr8knCud7SrW0WzjnXrBb2RH5AaC2RNitxzRFOYg==
X-Gm-Message-State: AOJu0YwTETUtH7lupInORD9RkM9afQI7VP4RGGQSRG86aRGuMdsCTPR8
	ZSA23kUVLMSDGrO8xVfAbf9CjT6/1DkkqX9uyV56ODKyrGi9QF6LUY28fw==
X-Google-Smtp-Source: AGHT+IFsHsOE9GFIml5SbGqV2PLpprs29PPSV7oR7rhgGyymm9vSuDoD90hrVIW/JyK4/9e8l+NdPg==
X-Received: by 2002:a2e:9609:0:b0:2ef:2a60:c1c1 with SMTP id 38308e7fff4ca-2f12ee1663bmr19475811fa.21.1722104454336;
        Sat, 27 Jul 2024 11:20:54 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:53 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/4] ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard
Date: Sat, 27 Jul 2024 20:20:26 +0200
Message-ID: <20240727182031.35069-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 ++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
index 6ad451549036..1706ce334d2f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -15,16 +15,16 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,msm8953-qdsp6-sndcard
+      - qcom,msm8976-qdsp6-sndcard
 
   reg:
-    items:
-      - description: Microphone I/O mux register address
-      - description: Speaker I/O mux register address
+    minItems: 2
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: mic-iomux
-      - const: spkr-iomux
+    minItems: 2
+    maxItems: 3
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -106,6 +106,45 @@ required:
   - reg-names
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-qdsp6-sndcard
+              - qcom,msm8976-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+            - description: Quinary Mi2S I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+            - const: quin-iomux
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


