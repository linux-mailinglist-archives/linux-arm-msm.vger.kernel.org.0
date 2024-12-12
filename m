Return-Path: <linux-arm-msm+bounces-41621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4A9EDCBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E890616898B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A0514387B;
	Thu, 12 Dec 2024 00:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="By/vuAI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6FD152E02
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964471; cv=none; b=tiQlE4glggoHfTqA0VaciCnisWEnl74imFSg5S0U7MlzYbyeVZ6weOtpecPBxcg3xB/VdPEDKvrGSIhfmhKbkIz+0bL56lbdLUMeDAQakjoZHiafNizSjk9IBLAmJt6MYPo5nvB5Nw1JlU4/2sMhCBui4pQq3uG+IxjJBF9Drs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964471; c=relaxed/simple;
	bh=KxG2H3oHtPjIV+VhCiilLtiyhUfg1u1AKb3+JTgTrMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7aa3UxXQQyg8qu4oTViGYhCWXnbXIxJ3RolfW+2sqxnIy4BvO4V+M8Iqid26fmZVH3mp5LeIwlE6iJjlJ2BhgGoJGuAA5D8OvzichHnCq0WTnm5QYjSxIrTnpVIp+LfmDqIuAPpcK+jRDikkaUPBn54nYSs0TD4aEL5PWp+xew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=By/vuAI/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434e3953b65so276245e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964468; x=1734569268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFHKgaQUdzL/Q4nPVhlEMPI+GbJNKf55IgIGl/KzjWA=;
        b=By/vuAI/JvC4AssI7Y9TfppP+xN1c6D/OGqMvREbxE0HTIW3VGzWPXsfqybXwY0qhg
         V/mP7eODc10OJUo9zpNNoUl+44rKbSupxUO0Ku67HwGWo21Q2yPMmc3LONPoagnQsU5k
         NETlIEIWABQ6X3O1JwQ8SnpOKeIZBk/SoV9RL/3MwCf8oJD2YQgW1mGJcM3rMCaEdEVt
         4l5Qm663xU1pQGy9H/Cp0yht5efyziuKcO98Y7UFtFrvTYmekfGF/c4XkyHU8tdux3r6
         qmelpG04gYHlYq4EwHKliksPGGa4sT2xj6/GF3Mng3UNDbe53Zd1p6OtCTzBkARiD9NI
         uMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964468; x=1734569268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFHKgaQUdzL/Q4nPVhlEMPI+GbJNKf55IgIGl/KzjWA=;
        b=mqPagNnlkc+wCfznpxfKW5WYAak/ML3FTbJLUa1DZ+CP0qZjn0QfYiKJGHq3hHIjd/
         3YYpOCmebO/6UxDknhIc1UJUc3n1Wv19BHXnqc26vXNND12rvr06Z9Q/+lfvQdfT1oVr
         ip6aGzaZs3HDeEcJVBtJF2LNa8g6bl3lWTpDeqksDI69ecj8MV2JPIvo9MVdjujxDh7a
         ddDFfhuLtY5NXLBugTgXoXIVSDGhz/iabClb3cYmolwouOwbsbvQyiL1/0gJh9WwJ2ES
         O0bCM3pt0u93oEWRMUCq+hnhPvpZLj+as+b8cfy7OXKGSuSRIFMVSvfWMiNA6rhmoM6g
         rZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWBXqJtMEH4Gt5UTw61rYMGlJNIfDkNkR4UrwzQx9tbfCYO/qco0XZ3RS3d5TEzjyzpVICNX7vc/brpQn14@vger.kernel.org
X-Gm-Message-State: AOJu0YztrWVio3sTC/a+mXMJuxbu5AsoQHEtgH7Tq5wMueR9I+Lzbz8O
	amr5MEl7giBkCQgSNKl3/MQ027pqo6xeqT7dWCduIDe2Hf3XxLIPn6LClzS+giE=
X-Gm-Gg: ASbGncvQ1DRzDffASro5UqltbQeCnEUtpUbhN7o0XVHeHv97FzjvbYWZZYMzMP/DXze
	Dnlxot9aQtlKbEqFcjaNeZdciQcCy0Vz0lfMJfH8weFNLkhd+4cmdlB+Vko8uzg7vMV3r3iATLm
	PIw/zEkgY6mp4K95h5IJUlZQKskUKbBzHdHLIY919/WwSWjlRxu0SyQK8Y1S0rhVuMc8+5c2NgR
	AH6gDWpn0I4yT6pnnUQStjY9DKqHgJS8Zo6dkv4OVqtATIKt9lOzKpwehb2LnBxmZDOyT0w
X-Google-Smtp-Source: AGHT+IGqJQuuqk4Vhp5TZjFSvgTAdQ/xv2AVt/O10VN20Uow3Ku4n2wjK3uOgIBOBh22buJzPhpm7A==
X-Received: by 2002:a05:6000:1a85:b0:385:e1a8:e2a1 with SMTP id ffacd0b85a97d-3864ce86758mr3868050f8f.3.1733964468442;
        Wed, 11 Dec 2024 16:47:48 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:47 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend description to analog mode
Date: Thu, 12 Dec 2024 00:47:22 +0000
Message-ID: <20241212004727.2903846-10-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WSA881X also supports analog mode when device is configured via i2c
only. Document it, add properties, new compatibles and example.

While at this, also adjust quotes.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,wsa881x.yaml          | 75 +++++++++++++++++--
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
index ac03672ebf6d..e482d9dc0de2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
@@ -12,15 +12,17 @@ maintainers:
 description: |
   WSA8810 is a class-D smart speaker amplifier and WSA8815
   is a high-output power class-D smart speaker amplifier.
-  Their primary operating mode uses a SoundWire digital audio
-  interface. This binding is for SoundWire interface.
-
-allOf:
-  - $ref: dai-common.yaml#
+  This family of amplifiers support two operating modes:
+  SoundWire digital audio interface which is a primary mode
+  and analog mode when device is configured via i2c only.
+  This binding describes both modes.
 
 properties:
   compatible:
-    const: sdw10217201000
+    enum:
+      - qcom,wsa8810
+      - qcom,wsa8815
+      - sdw10217201000
 
   reg:
     maxItems: 1
@@ -35,17 +37,60 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  clocks:
+    maxItems: 1
+
+  mclk-gpios:
+    description: GPIO spec for mclk
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - powerdown-gpios
-  - "#thermal-sensor-cells"
-  - "#sound-dai-cells"
+  - '#thermal-sensor-cells'
+  - '#sound-dai-cells'
+
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wsa8810
+            const: qcom,wsa8815
+    then:
+      properties:
+        reg:
+          description:
+            In case of analog mode this should be I2C address of the digital
+            part of the device. The I2C address of analog part of an amplifier
+            is expected to be located at the fixed offset.
+          maxItems: 1
+          items:
+            minimum: 0x0e
+            maximum: 0x0f
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wsa8810
+            const: qcom,wsa8815
+    then:
+      required:
+        - clocks
+        - mclk-gpios
 
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     soundwire@c2d0000 {
         #address-cells = <2>;
         #size-cells = <0>;
@@ -68,4 +113,18 @@ examples:
         };
     };
 
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        amplifier@e {
+            compatible = "qcom,wsa8810";
+            reg = <0x0e>;
+            clocks = <&q6afecc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+            powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
+            mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
+            #sound-dai-cells = <0>;
+            #thermal-sensor-cells = <0>;
+       };
+    };
 ...
-- 
2.45.2


