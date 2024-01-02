Return-Path: <linux-arm-msm+bounces-6200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0419B821722
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E181F21A16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E380F23D1;
	Tue,  2 Jan 2024 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPqY0I5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEF823CD
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e67f70f34so7753443e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172649; x=1704777449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcDgKhTpVkiCZ87wc3ZDfeVZRYJIopeLPG2L1KNJt/s=;
        b=qPqY0I5dGI+QHcqYux/sI9gRyK5nuKbHNfaaKgJjuBZliRkZrhOqoUZR5Wwg4e2Zuo
         ZKubO6K4PzdzHxdMYQrIoMqKoYiO4GgQRpBgJ5EzB1+031FmG3+cSu5JYowGl3gJA/sj
         MB3XvWi91SFIMsPrGfZ+1B2muNxSDTC8TWDaxjBEDtAWP1f5LxYQ4yUQQIGiM4MWCIdh
         /c7SmSXjNGsaCOhaHAVIJKJ6GC60y7lFYntosqHWl3+FCtv/pPV2tMkotrPQg14cJAA8
         MOAHjgPQO6ikKhflBU71BxGwthLOZ+RLHddZ1Uim+BWaZDbzhh/mBoQrKZtVg8FOwzEq
         mV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172649; x=1704777449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcDgKhTpVkiCZ87wc3ZDfeVZRYJIopeLPG2L1KNJt/s=;
        b=ATxGH2myqU04ZYEwJ/o6tF1H5HzLRGJNda9Yanet2E8I/qYY2ha+PSIU2tejB8LwvN
         vXxdvpdKUwBalP1Z/LZ6yQfY+fMTGxis/6dWHXvenlnzgc8csp2VlIVNxuiQmuGRVZ10
         xzeM9v7aFOCWQSAdrTjoKsJXB447hyU4on5VitpUeXHQP7heLhPlWOlZlM1q0DY1bOHA
         Dls3niW0tXmkaVyIMhsSpUDQRb+wancxTNa0seLrocy4o3a1UWPATuYM6IUFwbpJvFtf
         tV8msrV1iM5v4IHqXTZA1diGIO82uFT7INuMICKtTCnIQ+H8xoADT/zN0CXJFUXp+Aad
         k6hQ==
X-Gm-Message-State: AOJu0YyTTjoqTdnYonyc9U+aqrxg7paoGeig90qpZTNhvxzbeP5vP3TU
	L2W7syHWtzDLH7bnZcQxLKsfYYiFvYKt1Uk19EB4vF1iBdq4jQ==
X-Google-Smtp-Source: AGHT+IGWpii5q0CDWRw5W6To67fLPwN+WWV9B/IZRNCNaN80gH6uNf4SAQMxzMnYmf8TjZRTGQTZzQ==
X-Received: by 2002:a05:6512:3131:b0:50e:8ed1:cf10 with SMTP id p17-20020a056512313100b0050e8ed1cf10mr2458643lfd.42.1704172649757;
        Mon, 01 Jan 2024 21:17:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:23 +0200
Subject: [PATCH v7 03/22] dt-bindings: soc: qcom: qcom,saw2: define
 optional regulator node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-3-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J9nNZuFfwnbU/JQ2vIl1k7NuQXRwdpcziIbn5fTYJBw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rkOckPJZZMe8m66WrMRc3JVWYBtToP3e3LvpQs8HU6c
 zdH4BlnJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYvOe/b9/evQnp1NaQr9K
 FWtOlS+7xieW+869333997Bfn6fv/N/dZ1LUu/2I9kVG6ZX+TPYbzWdXSh66mZrGy9x/L39Janm
 OYG8Qs6Bb+LQkw7I9ley3pNaaf14q1eFnVBW0fGn3uRlTZwvUlPZXuK/yLm54+ql+3oe6romx3j
 enS+YdDT1oHqT9a57EzqeO/hvEz30R83BaYs+m5ePCNz3C7PmPk4UR5tHx0/1mHKmfqudiWf2zN
 eHtPNbjM+/1xs2ZrtcwcWvy4ygtDqsJiRrGBY6trVlFx/cHysto7LwV/G6hfp5FnkmBxKPm7KYG
 20QdqVdvbDZ+Ndi59j17pfi2WU63goWUzCo9WsXDgjgA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAW2 device can optionally provide a voltage regulator supplying the
CPU core, cluster or L2 cache. Change the boolean 'regulator' property
into a proper regulator description. This breaks schema compatibility
for the sake of properly describing the regulator.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 2178fea37b8c..f9306f2a6e99 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -53,7 +53,7 @@ properties:
     minItems: 1
 
   regulator:
-    type: boolean
+    $ref: /schemas/regulator/regulator.yaml#
     description: Indicates that this SPM device acts as a regulator device
       device for the core (CPU or Cache) the SPM is attached to.
 
@@ -102,4 +102,17 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    /*
+     * Example 3: SAW2 with the bundled regulator definition.
+     */
+    power-manager@2089000 {
+        compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
+        reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
+
+        regulator {
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1300000>;
+        };
+    };
 ...

-- 
2.39.2


