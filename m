Return-Path: <linux-arm-msm+bounces-543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6807E9849
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 09:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4E31C2084D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 08:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9FD18624;
	Mon, 13 Nov 2023 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="G8P8w7Fs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C518623
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 08:56:30 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116CB10D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:29 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso634429666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865787; x=1700470587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRhWkDdnGigvskQkUKrgh/oalrp9HqrPtGT3d3EYkwo=;
        b=G8P8w7FsfgnzZdy+JLVvAkYibjIwpbs9vfkmyoMM1UGh0RS8nfoZoYzA+Sarevjfpj
         Yl1EQq87fNbhdcg34gJU7t4LR6Zln5Kvtdc2S3GQFhmfpwYpZdlJHHRtHnxUOE0T3MnP
         RtIOqpTugnWk+IBJO5wyjDYARiGHgvUHBwBZ6sw4Gx3oc9iFOOsfPYSZLlPUS+lISpIm
         7DoqxK7yoeT8OHHgCIAhWByB6LwYSQEDaHB7Pa22o5ufvbfVKOnjVl44Q3mL/Qjhdbg7
         q1vYuyOh0qQG8b2Pifw94ndGaKIm0YIOLCTcw+00tSyG08eBuP46qMQzXOyXlnHpYtpi
         /hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865787; x=1700470587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRhWkDdnGigvskQkUKrgh/oalrp9HqrPtGT3d3EYkwo=;
        b=A/66JGTb7wgpLU0GDTe04Ku6rRdUbfzW6FZRuOtpKpF/CZA3jALwfbeawQp2/hwnT/
         VqdJrgJpkVJ/veh13VWxmrhnG/3KQkuU3WQwosLKa3velJEuw2XT1Z6IgQzbfYgNUioy
         PHmyDZEpvk3bWKZLjsupzjG/MQhXs9AD6cdAb0LBr4lhITiVGYgUo+Y1cIUp7r2SO15w
         OHv5F7jAk0OVUGPnlC9xXHVwc8kiWV6bNQFQ/EyjGSO+PZxIPHbPzSibXahKxrnbalUb
         Q1GdTwG2Vcoshhfh9EG0+U5Ckqh35MbASQWb/qlLIS3GOoClklKus2rwJmXjj9Zvj7Hg
         OX3g==
X-Gm-Message-State: AOJu0YyP02Jgl/vHRSErrQqRxTqJ/4HM7tNNLID29v63/VK/S9XQrIki
	c8Aq5jjqtwkSTJSJzeJpeYj9Hw==
X-Google-Smtp-Source: AGHT+IHIe8ed1PabKkxpijJl0eidO370nOLmjNTFG26Ovn6nKLHeEhDCEYK933B4GOH5lsn2/BoBGg==
X-Received: by 2002:a17:906:249b:b0:9dd:dd4a:d799 with SMTP id e27-20020a170906249b00b009dddd4ad799mr4322856ejb.22.1699865787503;
        Mon, 13 Nov 2023 00:56:27 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 13 Nov 2023 09:56:16 +0100
Subject: [PATCH v2 05/11] dt-bindings: remoteproc: qcom: sc7180-pas: Add
 SC7280 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-5-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the compatibles and constraints for the ADSP, CDSP and WPSS found on
the SC7280 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/remoteproc/qcom,sc7180-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index 6f0bd6fa5d26..c054b84fdcd5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -18,7 +18,10 @@ properties:
     enum:
       - qcom,sc7180-adsp-pas
       - qcom,sc7180-mpss-pas
+      - qcom,sc7280-adsp-pas
+      - qcom,sc7280-cdsp-pas
       - qcom,sc7280-mpss-pas
+      - qcom,sc7280-wpss-pas
 
   reg:
     maxItems: 1
@@ -75,6 +78,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7180-adsp-pas
+            - qcom,sc7280-adsp-pas
     then:
       properties:
         power-domains:
@@ -120,6 +124,23 @@ allOf:
             - const: cx
             - const: mss
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-cdsp-pas
+            - qcom,sc7280-wpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
 unevaluatedProperties: false
 
 examples:

-- 
2.42.1


