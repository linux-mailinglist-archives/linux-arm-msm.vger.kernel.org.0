Return-Path: <linux-arm-msm+bounces-59075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB3AC1252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67BD81BC8446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B481A315D;
	Thu, 22 May 2025 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Muqhb8Ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472619DF61
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935659; cv=none; b=WSgoVmjYsCe3kHMgmCMoqlUwRtDzj01V0FGbdfZ9qIW0IWGZJlN6QPSAlCQYd0pgcNPQt5yqTn51yWmnI5H/98QsJv//4yXThb6TqNVFXKGbDT0cUVpSRcvEx5zucbIsre79ln8NtN7VqQBj7+d0BlIT++JGArZ0jVlsNqLJlPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935659; c=relaxed/simple;
	bh=BA1jWJVLID2R9S0NjaKb06T2AIwSrYnas/chmrTU1rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IswB6GLD1l70877orEc2FsS9GKKpLZwwOoYk76cyr5iu8PmmJccJ8tU/pQC+ystXtnbi9210m8qrSYOb64LUK2Xnsu/uQhhGA6sBYhBANimPumiEf5sFa2SO4MI6j7zAJWhCINZa0Luy/Fsz2mBiKoAjNeUM0Mx9hMSD0ItBrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Muqhb8Ad; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so51352715e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935655; x=1748540455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=Muqhb8AddjGNLkck7BnH5XbhAgpOCaWKnfp5eRoGrgnqceHhL1k+JhcCTQmY8MXG0G
         5YRqM891x9LpkCoWXv6+4A3FAJtbp38jUxW4oJXsg/o2pn/hg5GHU5fuTJ3Ab5IcSWWR
         kAnBaGPgkDwtBY3nl1+nDstvgH9N9AXs/SMXBrVyQQUW/ABAvlw/g7nAt6B0vjor1Pxv
         hMkHhZdNKzMCb9KOO5IgVOYmuuos30Uhf/cwUHnIhctfqew19UqrfbBAAK1k6CR6w7FA
         pF1zbvmFPYnKfhftZzKDsrRvKCfzYyGcwmMZ+jSSdyI8Cf7XZoLAMvAmXR9eOClRleOb
         64yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935655; x=1748540455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=RIDhjQcOT1BIEMeUqewcJt8EVCbT7/1lj4NxqFZdNZKaswYCUwRMGpGRboX6wlEkuJ
         xgDPI4ZJ5/CprzJo4opfaK/GigQaA6+MxFnrkM3ttaVmYuxZB5uIChM315dhs9uGGsT0
         D6mdCFeOn7EeAzEMdflxy6kQ6ERLqRzU9G2nsAMswBnf8Bsz0PwNIKTWb7KnFQnvHWr2
         fmKgxXc39gDT+wTjeDPPOZZU4Z75v58pXZfbYZ7joOWC6jtIVUg22MYK2Mt1R6rwYvNh
         24eCET1Sr6rYPkblIT/nNtqwxWb088+HwHyYMpyGNfF48LDi6JOC2fplxr9AkxeUOZe/
         j10g==
X-Forwarded-Encrypted: i=1; AJvYcCV7bAYBstggtV+PIwl8yZI6T6PoiJCsTHCdWwE5Q5Ke5E1ooyIZshncaPrdji+hd1l4m7YJEUfBqSZcwop2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8v7A0MbwZoPmRlY/FccAKv6MP3dEbfU5JdKnxbzEp/3rOv9KA
	gO6UcELzMYx96C70Hncy2YbRkDtNYlRx0MwJnYfAgy5ExO+aWpllzHpv8uFDCy3b0e8=
X-Gm-Gg: ASbGncueQ9bl32cZGaW9yeFNMNDVuHoLoVp67oqAwomRcuUOY46SH6yQtL8NLOTpio1
	Q/R82TmxXcgAXRKtYjT0VUIDjfXszbhEu5d62DQyizhBRrETJcs0lipMYbpwJCZPeIyuy1VVfwY
	wnlM4O5OrpsEHEwnDt1vOa45T0VEth2SLQ1dURY14T1/ysWGAA2f+baXhq/jJ3MxKHIXPXpSQyJ
	bk0wn83R/nqrjUxfYw40FrkpKAJU2ej1ejN/EAkfMm6LVZCVi7yjPDGDovpiYAgWQBg55Xe+uso
	16DNJP9pKJRPlZmPt5dggK9GED1akM1wDys7zs/diKE8Ui8nfjKSULUvpy8=
X-Google-Smtp-Source: AGHT+IHIlbYVvYafpeIO81i57615R3Scfy/N8bbFiofLBN4IPVuaPtS1SroaRCpdNZVnFOjNX4w3Fw==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr269251575e9.27.1747935655391;
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:51 +0100
Subject: [PATCH v3 01/12] ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro
 and vamacro codecs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-1-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Document compatibles for Qualcomm SM6115 SoC digital RX and
VA (voice activation) macro codecs and their clocks.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 92f95eb74b1928fde11ad86ab6344f274bdf7790..697c5591ae7cb82633ff0159fb31d08b57c11b97 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -80,6 +81,24 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df57c8186acf4cd7bb99e38dbf89f0..a70c0f36389269756b724889c335c1b0bae157d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,10 +14,15 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-va-macro
+          - const: qcom,sm8450-lpass-va-macro
       - items:
           - enum:
               - qcom,sm8650-lpass-va-macro
@@ -109,14 +114,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: npl
+          oneOf:
+            - items:
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: npl
+            - items:
+                - const: mclk
+                - const: dcodec
+                - const: npl
 
   - if:
       properties:

-- 
2.47.2


