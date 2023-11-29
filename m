Return-Path: <linux-arm-msm+bounces-2433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310097FD5AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA9C62821C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B535F1C2AB;
	Wed, 29 Nov 2023 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrTQqLkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC9CD47
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:20 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54af0eca12dso7287296a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257418; x=1701862218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PpRWp/0m/xWdvHLqY46oTCz3fciQWVaXGN2a0hf71o=;
        b=vrTQqLkq9GIJjeMjvMqQalD5JXGAktojeGarlr9GHvHdtkiXOs3A4xENcSOH0Eaqwj
         7Eysfr3O4xeB0fljYIs3P9Z3Jnmny2PsWo3W6nQqbsWZMEWsGLjtv3661kMl4pUkaW+e
         B5oxEKWqlyFRAky4g7slRN4kgaADg6QwhkUEmjJps9zbb4qAUoV+wm4+P8wCehOCr9FF
         NrLtey8IRJG0JQB7XOsWPBZ4s0Jyuel/WNKlYgHX/7tnFXRcHOS3iflrYMG+Qxg5zW/y
         mvXt3CjV6NSL/exPiFVQ1EAIqa/dk97xZ1E3OucMTh44oE911ab2QZULnl4sOd3FIE0b
         Ru4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257418; x=1701862218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PpRWp/0m/xWdvHLqY46oTCz3fciQWVaXGN2a0hf71o=;
        b=ReqOB92qUsVqBb1z2aamiWPvywfsDTobajU134j6A5mg87yP1dl3kc/nz6BA94bFy8
         Xlv6RRCSw5hcnt2HZQpg15vIxoOgrCN16MAm4ufW6yV+2MWM6SvrOH4x132A24nWNnxv
         u7ioj38VVQFJ5QYfey755omRR54hDhq72A+h6aNaI1abElBQcfpVowxaqhBNOX+bXq4M
         fXjF6yvCeLn2bE5RxeK44QdaMegzwh2VHJ+0BX6YM5f7YbRud+1jPyMPszFkkkRWtK4f
         cx1ysY5VVNk04sHoQJWRWXsNe4PftblIwglMpnHdiypbzXA9ZJj3nTj2Giec73Gie1Dr
         juYw==
X-Gm-Message-State: AOJu0YymSEn9fYFtSmiWV2kya069+NHCZG/7lfwoIPtxjQLOdBPKO0NN
	qYzJyuANMKSbQLkW5Wq/9fVQ1g==
X-Google-Smtp-Source: AGHT+IGbP5HyFHFVjrl6/DXNoynkgfMp56NuMHTtlRoK03FAheE2R3knt3zZS32ZUham4wZO8PA/lg==
X-Received: by 2002:a50:9994:0:b0:54b:3457:a656 with SMTP id m20-20020a509994000000b0054b3457a656mr9592023edb.25.1701257418541;
        Wed, 29 Nov 2023 03:30:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:17 -0800 (PST)
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
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650 LPASS RX
Date: Wed, 29 Nov 2023 12:30:11 +0100
Message-Id: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index ec4b0ac8ad68..cbc36646100f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-rx-macro
-      - qcom,sm8250-lpass-rx-macro
-      - qcom,sm8450-lpass-rx-macro
-      - qcom,sm8550-lpass-rx-macro
-      - qcom,sc8280xp-lpass-rx-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-rx-macro
+          - qcom,sm8250-lpass-rx-macro
+          - qcom,sm8450-lpass-rx-macro
+          - qcom,sm8550-lpass-rx-macro
+          - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - const: qcom,sm8650-lpass-rx-macro
+          - const: qcom,sm8550-lpass-rx-macro
 
   reg:
     maxItems: 1
@@ -96,8 +100,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-rx-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-rx-macro
     then:
       properties:
         clocks:
-- 
2.34.1


