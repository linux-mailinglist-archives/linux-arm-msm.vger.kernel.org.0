Return-Path: <linux-arm-msm+bounces-14027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871787B084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 19:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0786F1F24C39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 18:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAEB140397;
	Wed, 13 Mar 2024 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJBlkGRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70513F45A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710352438; cv=none; b=XdNNOlx/W6CFWFKMzv6Bf/90pnUMsXzyyCICnL2jDlngLGtSr3r/NTzTWyN6m4NckY3Ymhei/RzOQ9ghWAU60D0BvJgFhP8fsCCk+OtieGQ2KhjfTttYcpJDXKv8pW9uG/UP4doWo+HxcZrU/oVHr6Qm85wjhJKD0sFzODAgo/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710352438; c=relaxed/simple;
	bh=pMkcGiMy0q3S9WZlbdBLqLkUokhQo4RSjeHCoPtjS+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrsLplH9hk9PUERtMklPCOSGLn0346y0EvTa7MxAH5NwgHP5SHyqGcYgF1Y69dyAsm5UXFW5pdPP+W6RRpzvCsJzYVOnes2AAwQChUfPAUEP6SK6kOU0Rav17/AmPDQ1Yam/vmI/EpaKP+SlQ4tEToWfkGVocLIPe2nbMd6WNfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJBlkGRW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413eede49dbso890205e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710352435; x=1710957235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SmKMGXF81mfKkNpF0CZGS/Z1f9uS1wllHcEDjQ1fhE=;
        b=DJBlkGRWSiD7QFyrsaGqXsMR3t3z0qRmckakG6buVJCy/giXoMbyPvwEQqmxsrIAlF
         xWDcmE6fKevJwqlpzSyb0yCDkuNxJ+SiYZuup9akIjb3CMjBnH+Xebr8sJMO9JxE7PeS
         3nk2crXbimGFk/NiDLXd0UA4xuwobIw9UtQrbwjbcBYGvuU7kvpDc+vzqbczddcOSuc+
         nQNtZkmP6nuVU0ILDAbXntUc/Jdk4Y+V095HQBfeTKytSqk9DuMqdHFHAbrH+0BzgK0m
         gpUinji35sgHaGZAWRco8CJRxhPmBAS367STjTYzWKULPQ1HiI7Poc1LP738Dt6MP2QO
         FVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710352435; x=1710957235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SmKMGXF81mfKkNpF0CZGS/Z1f9uS1wllHcEDjQ1fhE=;
        b=SICrMl7tOzCYhsRD89QEOROvHsTe87FOX7BUZoEHpFF23B3Tn/B7W0Hae0r4LgO4Kr
         zNxj2mTNmich6qGh3jMTRuGBs7zVPzxGGNzN4dqEAMjifg6bOj0CjtE9JUKp73WV5JQ/
         iIV4M5mCCxce31OICcyXPPyeejNl9bekqEgrcwfhPqPYQsnFjjfcYh71BqfQwqBtLpVR
         V0swoZ8GMQqLsEKnpG1fvAfxZ52DpsAbQCFDG7fe+kdVM0aL87oNTvM1MY0WVZc7o/fQ
         2oTMx6q8xFpll1c1nEawEafVHXDEPNoHf6VMkmimnJAOUmZjOjoD34G2Ch0a/gC5DkAy
         +vpw==
X-Gm-Message-State: AOJu0Yyb5cKUzIzTYAQjL/Bj1ufXYsLiDBxgyJXWyqho4NtJw4vhPG2U
	OpU2eFzzptv9blxi0OPRvSmQ/6Uj9izf75zzwn8viI9Ql8cWaDelB060PABa+Nc=
X-Google-Smtp-Source: AGHT+IGpjXdcVcW+OWgvTuMi+NTYup3ENVDM08ZLJnKTDwsM761kmPBqDIF23JsP73xz3/jHXijD5g==
X-Received: by 2002:a05:600c:470f:b0:412:e3aa:8f69 with SMTP id v15-20020a05600c470f00b00412e3aa8f69mr534360wmo.30.1710352435024;
        Wed, 13 Mar 2024 10:53:55 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id u12-20020a5d6acc000000b0033e7a499deasm9914482wrw.109.2024.03.13.10.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:53:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 13 Mar 2024 17:53:52 +0000
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Fix x1e80100 camcc
 power-domain declaration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-linux-next-camcc-fixes-v2-1-9426da94ae37@linaro.org>
References: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
In-Reply-To: <20240313-linux-next-camcc-fixes-v2-0-9426da94ae37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

camcc on x1e80100 requires two power domains MXC and MMCX. Define those as
part of the schema.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          | 37 ++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index fa0e5b6b02b81..1f62139426845 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -19,9 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
-allOf:
-  - $ref: qcom,gcc.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,9 +35,8 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
+    minItems: 1
+    maxItems: 2
 
   required-opps:
     maxItems: 1
@@ -50,6 +46,35 @@ properties:
   reg:
     maxItems: 1
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-camcc
+              - qcom,sm8450-camcc
+              - qcom,sm8550-camcc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: MMCX power domain.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-camcc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: MXC power domain.
+            - description: MMCX power domain.
+
 required:
   - compatible
   - clocks

-- 
2.44.0


