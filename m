Return-Path: <linux-arm-msm+bounces-48903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA380A3F872
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE8E4209C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965C8211712;
	Fri, 21 Feb 2025 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVRynHTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FFB21146B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151495; cv=none; b=UG21qVLXxM1rwZmdNCEll7JC9cSSesS4pfdMLtB+2ZLYix32Colygp0fd46g6WuITPMQ1ZrWsNZ/LrDCSiumbAznUsX9bDDs5V4AdqtbXQh8APkSgVs7oFibRyX8ZtG1cDY7PVCgd544R0BXyRJgqCRWe75s9nuje2pIFUZx2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151495; c=relaxed/simple;
	bh=gC/FypNj+ZpUyniZ+8EtOmpEbEyuPuBTmn13DjMHXtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r6Lnh9itbXJwbNJbZkLBVIn5z6FPySfL26Pno5BGwYF1LdEHFLUyY9a5K7qyn+dteUDZX9v0+/xAmTrRRi24ZxCVmQtUbHI19D4b4x0cYLw8h1peN8RWgnQ92lctcjMmwOh/N9W9Y7KEuPpoRLfGomCgd7+1LTv3XYAgqwCPDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVRynHTT; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb88d2b67eso28360366b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151492; x=1740756292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cslAnLurx2uWkIblqnE5n5YBSWA6fYOjQz9w/DOA/I=;
        b=fVRynHTTPRQEq9g0narEEgjlR1X7C19n38VPJaVV8Fo/j2oCRhISVDkvnQerDRsdLg
         EfCE5ySaD36sY1ygBBJA/m6Trc/AXqwkguVqeY8xBwtFFYPVkHIQrBVw5mO7FhwjfLOn
         8OWXvy2rB46rUQW1MmPmjN+TYO2XyKU8CzR9JsQJJOrrHeyTEk3Nl96iYMAqgvrPTPo8
         TfOHBK3PT9bornHrDw9aJkTHBWb3HSeUVXn8bTzbh0a6H8z4qj+ydlg7Ilp1GAOL+TOz
         1DvkdGriGsL4wjs7z1ykDDvfZsqLyZmXiKOY6rbJBADnUWm6mbdv7H6O2K8kF83meNyH
         6fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151492; x=1740756292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cslAnLurx2uWkIblqnE5n5YBSWA6fYOjQz9w/DOA/I=;
        b=OO8NQZiCGEs9Q1zzEV36XGXtvBBYRuWEM9qr8uOgve3l10b4tNw0E9x94nxe6P2H1q
         UIiOpIkg/2s5wyc2hNRWRwlCAMgmYpEEaFI0iJHLPLGXSb+m//dEKy/v5UslwrRJ/za3
         J8kKvHHfXquJFPa/aQ8nrzcut5lFMb4PrwF5dZPI/5xUIQuoY1ohyBYSoTyNnGsJmPMs
         pH3o681kcZ9Q+lH8+ugoIGbcE8yonZeRJt+hwRR5OysB035e4ybgyKkhq7TR6l02mYM1
         mEbyNIs6lkszg4Ioxfd3Y2Vs2gYIbnA2bz67ES1WdYaIa4lI13KmJQptnwoHyeRpB9Zp
         Hw4w==
X-Gm-Message-State: AOJu0YxBBBDok1exD5pBNReFJxg6KnSK3RGvfiIxrB+dFQMq5UfbIeJE
	Eu8Hg7hRhbfA3hkc0uu7EaejKH0uQEF9b51e2iFKoh9suKMnOl0xYDn8FHsFs3o=
X-Gm-Gg: ASbGncupobd7fglvVTCZNa38VA7RK12dgx/jRxfK27w06igugPSWWDgfdfBgop3udrs
	XwKQfVLTRHvknQDdmTHIctlZHCOcQu3zdzW8Zr2w+9DDYiwLKyJWBydPzjP/BrLIY0KIPRZR5yR
	LZrk2ZBvPNRapwK0r6TcHItk6szVc0q0D65wmmO6f6bUHMmYXhcq9W5L3LZ/UZDqQGNeiGuAjzd
	kT41iXOy08M4wPGBIX0M1VribJsJ4F/St0csk5tsvRnMwnJ6lcnSd/uU8uLULvJgXE0zAGQXtD4
	jkoCitsBaSrvwCHYVecSTdF0MMXPXXSW+7AvUvjdaLlAltgWDWlr1b0xP3e2b8AcOVaDsO1r943
	C
X-Google-Smtp-Source: AGHT+IFKIQuk3xKeyN1ac8pfvFoGo1xm55r4yDfi0obbysI0RFch3oRgefyzIhmQ666lB2tFSSmLeg==
X-Received: by 2002:a17:907:7286:b0:aa6:9c29:86d1 with SMTP id a640c23a62f3a-abc099b8837mr122567366b.3.1740151491870;
        Fri, 21 Feb 2025 07:24:51 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:24:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:11 +0100
Subject: [PATCH v3 01/21] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-1-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
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
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3023;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gC/FypNj+ZpUyniZ+8EtOmpEbEyuPuBTmn13DjMHXtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqsgXbxiTLYqR/PSolFrAbqMkllUjvxoL/mo
 OOMU655pAqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarAAKCRDBN2bmhouD
 17YvD/wKGo6OfOEhuVfcMzmhFGgg37DWi/RIVXURAzYJ+joeU6L1inAafck7Qy+TNi6sa6k8YO1
 fBublLhM8E95wDVz2/WQV6PDZNKInMFryiQ8uIV9DGH4hqdtEMBp8ori6Rb1RTJICbSZWuTjEyp
 +9pggs6KDS6zo9nqtigeo3Tzcg98GlwsgEISJbA7N+ZfmNi/oNk7FEEdUxJ6FK3n61s9uoEgP3f
 fW1a/fSYE1ZGgoZ7R9UBXRDmddpNJwIYT32TWF3SJjr+tSXkLOnUKloaDf3FCpe/viuYqusz2f3
 muedbNjHozEOgPn3dpTvX6xCOBqgi605kIhmwJxme4fdw73jbYW3OBinFykeIAyosNeaHFwAt/9
 bZFl89wn8JGqzw1WpXJ+vPo0E4Y52PExXh8YYS9rSpaiAvZ/XPpoau6LFw2zAXFpuEpQlWK0fKN
 K81L05zXOa5dw8BFdJPaOXXqcVk08zwTqtxUeRWGP6dYYF8VPPhrdB4mLj56sNxguCHUR18pkW4
 HJ8UIhckPvigJQ4xaKWiwMOh1K4YIDf8UwejgyXirT3Xu00G4FBt/LnVt/MJsO6PtzGtbzY5pOj
 +Uk1USE2aNZrkUR6OusYZaTDOx4n5Vafs9/9NMO3ia2lXDdiWIDh9u7Yj8Hd4CI1Ev2GpyPwC1y
 kL6N46HexQeM2nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Several devices have the same clock inputs, thus they can be in the same
if:then: clause, making everything smaller.  No functional impact.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
 1 file changed, 5 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ffbd1dc9470e2091b477b0c88392d81802119f48..e496e5430918d54b2f07f1d5b64de85d29256951 100644
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


