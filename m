Return-Path: <linux-arm-msm+bounces-44564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEEAA07698
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7975168329
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA94E218AAD;
	Thu,  9 Jan 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZ6YtotP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71402185A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428130; cv=none; b=PYap6U3gju0uiwyQQQhHuUcJVg2QoV+l2Ra9zBnpqDETxLwjwQmMKFrInC/Hq9IUUQOqrDGKyaCsQULi0J/VC/HnHxMUkpnBnTHexmtxTnTAqZVxICYWdDa8b4TJNAjzxGbhvmJ/j54M4zun9TXU4q7frQoa1fZlfy5h8AwQClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428130; c=relaxed/simple;
	bh=IfZcYabdsZFdNzsj0O/kJeMDTVSlCJN19MOBQa68Yvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ef3VG4zcLQ5jT79EZh0kXj55WNrAJz+6e/nsTN/C5E5XzOTUlntVj//+zH5gQDFkthOH1u+LkivujXyRXmpMKIJhetbnAjAp55Nt0axr2cZk5QA6iVGuoCQMTjfZF4mRgmumPsQHDdXyPz6MpKlQty7s+59mnInY5sN7bLm8GX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZ6YtotP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436381876e2so1360645e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428126; x=1737032926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHRWkFVUYJcbnQ4lEEkkpM4EW1jEFq6Ihd+cartFoEo=;
        b=JZ6YtotPi2pu5iCK+uIvmJw+5y0UQCMZf37ksfDPE05TvD9h1w8V0RmePON6fzqtrs
         TsdRmzNCT+DxRuLCeUVvvKPv5HOC5pOkC8s5CgYprPtPGpZgFLQOU+BDurs4ZVTQwGFs
         8lQbA4jDcsuYV4dy9OL9tWyviLPwQ5Cpa4u3ji/EyxcP74MEqjY9raUaUKbw6ymiaLjX
         28NtpNfF0EsAMR/vEBfxDervhWBgMNxnO7mM8DrzhmTJbvZ7M1E3F5/5tyu9swKBNbUd
         KtUwpdfMIQPgXxvwU+yikc7OXZT2ugFD/w1o/kq7Dip3ujVWusP2fuefpPLmaO67m5U0
         tWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428126; x=1737032926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHRWkFVUYJcbnQ4lEEkkpM4EW1jEFq6Ihd+cartFoEo=;
        b=dNaGq0QCg04vZzrPXxNScFcwTgVizuBNfiaY/JessRkmDwv+/JnoU0J1+NkG+fiZJa
         fcG+agGnXG/rmVmaP6Tq7va+1f5Bqqnb8/OvTWed53tTP8sZ/qPG4J5zJ51jwgzaZIq/
         ne7z64BLoZPJ3PLHP/ksjHVP6sN5xoXVMxcsGrazjJLiMEFHrlT+dCd+T++r8BM7Payp
         jw9tnNY9TFSrzmNz9oAnhXcLR9IJHwEVZ1QNUDyU5FG866PPFX/0dwsCkncdBpCwLdeb
         /3qt5O02Pbtc7WAJ9uc/3gmKNPTs5o+dFto5CKGMHejVDPats/Ohroz1fV61gOvaG6Pi
         85Xg==
X-Gm-Message-State: AOJu0YyMKTobeGHtFV1aDGWH4YTNY1TRbjXR6GgU+gOyI+XD7PHkCOUC
	mJ23CDUd6bIJFXqneXH0vMvJPdJOkaamJ6zl3T3oSsLeY04wWGMqm+WK/SUegbw=
X-Gm-Gg: ASbGncvM5b8T4L1hPHmaensS6SuZ7B7P3cDbRuG2TKSotW80Dl5DxoZ7gctZ7ZW164j
	PRZe7VMcj0TPBj5X57aJ2akMDfznKor442F5WFUhcfS3FEQGGwjJdfK3osB913i2Ia0YcqfSZFI
	sGanju9Nxwm1MsV1C+Asj4fp1e9X9zjK+jwibLRxzoqjR5EmqKNdOaiGd3Hh7KgNPXADdSSdazy
	3ZoYUAQPxuOFkCq31ywfXn3h5P7+RJZQeU3ier3X3BedjyurD7vWPCS7+poI+en0MXMHfkK
X-Google-Smtp-Source: AGHT+IEF9iEco/3jygfFz2+wsWwY9iuB08FDT1mjl5kd6+TgpEtqRc7b7CFjp+6LWzrgMy9hb42Jlw==
X-Received: by 2002:a05:600c:5027:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-436e26ff752mr25586615e9.5.1736428126203;
        Thu, 09 Jan 2025 05:08:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:28 +0100
Subject: [PATCH RFC 01/11] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-1-b3f15faf4c97@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IfZcYabdsZFdNzsj0O/kJeMDTVSlCJN19MOBQa68Yvo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pRvAVm7n8iqcOs0PLBF+zrL6Wo3H3RqAvMO
 PB74U/ANkqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUQAKCRDBN2bmhouD
 16wsEACVeHta1watLdItGSKKdsZJrWq+PIVjOq7NatwSmdBQ2MNeaHRvqntEMifiX9j0PKHUQBu
 u3lc/mq9QInohThDto7mc++GeuSCAy/U0911WnxWo4anPLdEnY+byETdnnR1mkRY3pqgArBSNmG
 RzbuOMZfKryR8gcSsrVhtweagmQTCVReR/Akx58KYimbd4cJI9zKzhxkzI3jBGYaFbeA2S+39IE
 VcUzWQn77+s1V/13WwPfbaMoMH+4hgoSIF/2R3EGVHS+1Aq4jj8NzD3Cdzl208hS7xde/a1/a7X
 cIyLitYR3k98kCbIwBekUjJWjU5b2fWVl7pNoq+VXi/kMyFv6r7AQsow0byPQoTzDTSSWr7+l9U
 dii1lywm7opZdmJqKkFx3ERN/vJdHFhqUDe0NPKt3e4zNxVFsjEtG2109ZWbldhCmzUuxO68q9L
 lIK92rDrn9kkh4bbbeKh/FBYXvtQy5Q2nkZFVVW1lEbTAX4Dmnfx2fqQ7G6r010qr0mV9wvFSlD
 zfpXzfhPhD8uS3JmS1nCYdvUtrgMftvXH3fSj+vBNXQ42/yIgmnOahqZ0s8JONl+xF2WvJTZEt/
 hiIAhRJfk9sdZ8DyZQvzmvq/TDvS7WCCmAjnBOQdJV7ut6HLgmStFWEPR8okSkmpAsvdl9kk/Sk
 HaoE/75ZdBL+zNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a9636b76854d0f781923e06b90503dec11b25763..a90255f60d9e31c9c7ed94816284fa8f0d71d392 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -248,24 +248,6 @@ allOf:
           contains:
             enum:
               - qcom,msm8916-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: mdp_core
-            - const: iface
-            - const: bus
-            - const: byte
-            - const: pixel
-            - const: core
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,msm8953-dsi-ctrl
               - qcom,msm8976-dsi-ctrl
     then:
@@ -328,28 +310,13 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
-              - qcom,sm6125-dsi-ctrl
-              - qcom,sm6350-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
+              - qcom,sm6125-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
+              - qcom,sm6375-dsi-ctrl
               - qcom,sm6150-dsi-ctrl
               - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
@@ -393,27 +360,6 @@ allOf:
             - const: pixel
             - const: core
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,sdm845-dsi-ctrl
-              - qcom,sm6115-dsi-ctrl
-              - qcom,sm6375-dsi-ctrl
-    then:
-      properties:
-        clocks:
-          maxItems: 6
-        clock-names:
-          items:
-            - const: byte
-            - const: byte_intf
-            - const: pixel
-            - const: core
-            - const: iface
-            - const: bus
-
 unevaluatedProperties: false
 
 examples:

-- 
2.43.0


