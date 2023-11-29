Return-Path: <linux-arm-msm+bounces-2434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D57FD5B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39A3F1C2111A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225FF1CF9B;
	Wed, 29 Nov 2023 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JP45zePN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510FCD7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bc8e37b5fso106638e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257420; x=1701862220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYN9xq94tv9j8O0C0oRrYF7EmY0bODI5JT1t6FcrN0o=;
        b=JP45zePNJkZA4UIvAVghMahnES8ezpou6+W3rNFxV/1Uur6eWmDnK9BIYsXmY8n+35
         0n6x1KlVCZknx9cDejr8h3a1y4fLpCtr5bKjdIk1PUGrUk0PcDEz940qkJn0rR9BLo+i
         LZxvyaa6aAT5rfj/jVKMLYg91Zp3ZTLUyAKbQRByQ6F+L2jQ0FSZ1I479k6I0X2g8+mU
         kobrJNACPEfJu5bBiwSiXpEi4hm5TfNVIMg1SVyDntbT6EvsQ5c4ZrILcimwU0GvoPZ4
         +GF0wJRsgmH7AKjmYzPDDB7EcEOHlC3ZqRQzS0z0zHA6tKOcl5+gPo9ytcuI8qYZat1Q
         /M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257420; x=1701862220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYN9xq94tv9j8O0C0oRrYF7EmY0bODI5JT1t6FcrN0o=;
        b=WtE7Qmxd9jpjbW9GAvlQf31jJ4t3j/Ozjme/zvVXh2OXM9IhK0IOfM3Q0lzf5uSEgo
         /5Zsaa+2ia+fCYE9Bd19XPreK+zNWvOR3jo6ZinfAFzB3TW5TL1u03BDUaCwcuB9SgBn
         jUMNwp/Qwohc4HtDLgGbFJMVcrhW3WVZvXKlTdEDNIds9dHloP3uJd4Z1HKK9fgAoaXT
         87VsoBZqJjejhFNJgh75JTKg29/f8PDZcF8bar03/wumZfVwd8O5yEqa2sPu+E7gbEu4
         iPSIK4TJpMzTNZ9kXv5N9uq6pWzYqVXm58LR55t1ixPatzFqaAGDhxoeDtUTkTHAeXAr
         +yXQ==
X-Gm-Message-State: AOJu0Yy5Ok1ghTkat6rptQEVKRs+T9LRTj80+Gjt6ZakRPvI3AoqNkkv
	ygP4OuFlkTfuvqUShQjKW/lgYA==
X-Google-Smtp-Source: AGHT+IGf+lYuB85sUBy5jbyCRa/bqNfCvJ7yJDrbtC4hGrUhQ8pWpqA2IgrGIJB3ZpyHP5KF9wLIMg==
X-Received: by 2002:a05:6512:3d1c:b0:50b:c630:13e7 with SMTP id d28-20020a0565123d1c00b0050bc63013e7mr1162086lfv.19.1701257420604;
        Wed, 29 Nov 2023 03:30:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650 LPASS TX
Date: Wed, 29 Nov 2023 12:30:12 +0100
Message-Id: <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) TX
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 962701e9eb42..cee79ac42a33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -11,13 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-tx-macro
-      - qcom,sm6115-lpass-tx-macro
-      - qcom,sm8250-lpass-tx-macro
-      - qcom,sm8450-lpass-tx-macro
-      - qcom,sm8550-lpass-tx-macro
-      - qcom,sc8280xp-lpass-tx-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-tx-macro
+          - qcom,sm6115-lpass-tx-macro
+          - qcom,sm8250-lpass-tx-macro
+          - qcom,sm8450-lpass-tx-macro
+          - qcom,sm8550-lpass-tx-macro
+          - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - const: qcom,sm8650-lpass-tx-macro
+          - const: qcom,sm8550-lpass-tx-macro
 
   reg:
     maxItems: 1
@@ -118,8 +122,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-tx-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-tx-macro
     then:
       properties:
         clocks:
-- 
2.34.1


