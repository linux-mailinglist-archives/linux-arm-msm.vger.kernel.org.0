Return-Path: <linux-arm-msm+bounces-46-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185A7E38A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D07D8B20C1F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E971E13AE1;
	Tue,  7 Nov 2023 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hm/XMT7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573710A0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:16:19 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8C6F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:16:17 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50797cf5b69so7179984e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699352175; x=1699956975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95vD72c+bC2P8X8C/IdsTMXs0cKxT+IRop924lJhGj8=;
        b=hm/XMT7SZKzjyj8Ebsm372Kt5mKKn0eOerShTN0y4EaqYFGyT2nkRO7v1MDHjaBH6l
         FvyoRJZ4orOeOHCNBqBcU0vlncqIvAPJUkDvRc1/RR+rYmToBFrxwSr1RRjP0GD7skPk
         jggaO0Eox2MG8CPXzvNfK6L1hiZ8m8Klm2kLmsE1mOAXysg/79hDSUX80k1BCT57D991
         oguSIftO5JTQ+9YbqGhtyxUahhWNyKCUuu/n2RUuDmskDNZOenjvotUrPPDvSyIzJutK
         9KCKOhb8PCi5z5ByEpipK91gmSZcdHntPZyRrYeKuZn/d1omLndnW4rGvH2hyuNwH+Lb
         2OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352175; x=1699956975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95vD72c+bC2P8X8C/IdsTMXs0cKxT+IRop924lJhGj8=;
        b=niJo18H8Fh4MZYF1XkSY92AaxtIbRoETJglaZbJoPOHxS1DT8j/KjfOK/8VbrCR3Sn
         Mi24QJHe7S8iSBFevWR+3M1ckswmShDiO3cMFOT9ViPvVjhP71e6KO++ICtrF5UDjL8B
         i0f3YDLjMZvx8AvrPa461gqRVU3sfDw8NJbz3Cz45woQGInLWSMZbfuv47Lvatcdjx+5
         hWgTl55fIw0C7owrLZTk/GPAonHxcVtw80V1/tyLYGt0y3yoVFlGRic4IH2+0damMTzO
         pZlr1BPbRiot+qC78DOD1Bouoj1rfUbz/8P9b1VZF7i2bpSThiKwLVg6Djxrafyoma4V
         evmw==
X-Gm-Message-State: AOJu0YyqbjDxWb4wR3w0rRo1LihNjyrQ2UTD4QBBnNbK22OcnGSLm7Z8
	Pteo/gynvQgbiOkOiTSGbTMW4g==
X-Google-Smtp-Source: AGHT+IGJuO6mk0T3Wt1edO/lmNN8eTn2eGwaG7+JJc/a3UervFShShCwhOClqq8GfMz5fuLE3zkgEA==
X-Received: by 2002:ac2:546e:0:b0:507:9855:bc68 with SMTP id e14-20020ac2546e000000b005079855bc68mr23509396lfn.37.1699352175531;
        Tue, 07 Nov 2023 02:16:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003fc0505be19sm15249922wmq.37.2023.11.07.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:16:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ryan Lee <ryans.lee@analog.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: use "soundwire" as controller's node name in examples
Date: Tue,  7 Nov 2023 11:16:10 +0100
Message-Id: <20231107101610.13728-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soundwire Devicetree bindings expect the Soundwire controller device
node to be named just "soundwire".  Correct examples, so the incorrect
code will not be re-used.

Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/adi,max98363.yaml | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
index a844b63f3930..c388cda56011 100644
--- a/Documentation/devicetree/bindings/sound/adi,max98363.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -39,7 +39,7 @@ unevaluatedProperties: false
 
 examples:
   - |
-    soundwire-controller@3250000 {
+    soundwire@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
         reg = <0x3250000 0x2000>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index ba572a7f4f3c..8e462cdf0018 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -52,7 +52,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    soundwire-controller@3250000 {
+    soundwire@3250000 {
         #address-cells = <2>;
         #size-cells = <0>;
         reg = <0x3250000 0x2000>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index e6723c9e312a..d717017b0fdb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -48,7 +48,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-    soundwire-controller {
+    soundwire {
         #address-cells = <2>;
         #size-cells = <0>;
 
-- 
2.34.1


