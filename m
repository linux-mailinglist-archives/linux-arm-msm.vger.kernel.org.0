Return-Path: <linux-arm-msm+bounces-7215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9CD82CE7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32D211C210B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C151816427;
	Sat, 13 Jan 2024 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdscC8Le"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101ACE544
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e67e37661so10256149e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179355; x=1705784155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzrJM8QIfM/1QzKMEFRc6idiXrxZyO3gy6dlkw+D8i8=;
        b=HdscC8Le3XzGWBG0VVPpWeFHUUplq+Ovo5PQMP95PmOeLA2ChaBUh7QLrSA31KDNT9
         exQlmV8IFdJXvodteDlMk1tTfKWSsHsbCPyewpSRYHWLqFcaRaS+5YUTyB5XDBsqLhad
         u2Z6lo4fSHNsuMopMTeZF6Dw7YnjF23dXJ3Lf8XGxvKbyjyR5zsdUW+hda080RnjtNGx
         UGZHdkWZ9sIH+qqproVLw77GRk0gFcs/oWL9CGTUV6hJ7krylV/dV7NGdMUQoMNjJ/X6
         GkAwnImOlbeR2cG1tcvjsmOXhNnqNipY2y6ijRdjwC+UxjzLx1VJGF3Qr8alZYGyMjLW
         95mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179355; x=1705784155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzrJM8QIfM/1QzKMEFRc6idiXrxZyO3gy6dlkw+D8i8=;
        b=EmrjB1EGnN0FGYFcKuv5GxlOf4KGNfd81Oyirc4XvE+uqsD2Hd0dwzcYpLMp4eTWv2
         XjxHRoIjnhsMyU7NVjxeTisDXEqUNhpvN9vfxh6l0zwAlb/JeWd8UVvZvkK2UOWpIney
         oRxQkvzGXzCn13AMfmEIpJLPBjKtoBvb57Fg1+WvB6pfXdkyM6gZi4ASALQqR4tQXqHs
         gmG5ybskCjTL6VxzCDLAUYl43zYLp9O0X5yeCgVle1au8ATqSxT6fnnotVOp86Hs7Jol
         DOBSH1HNB5Dj3QOle5j65FzfHzRNH5SBd7FlVLvHc1VJT2mmaiH4Fby6PpK09v0M9028
         M0nA==
X-Gm-Message-State: AOJu0Yx1vDC9AGrIKQXbGGWTT8Zt0XvxS6OZgIzUM9QtuuHRfnxYNyca
	GP3PBlOtxcct++g+RkareHP87RoKYPDTUkihAXMSf3/e9J1Kr2/Y
X-Google-Smtp-Source: AGHT+IGrAU14qocjEcmgPrI6TVpKUOHXJ3b3LDWXmhi1dCMZHKMPkevCanuPU3qlQ2OinrXqeuFTwQ==
X-Received: by 2002:a19:5f18:0:b0:50e:7be7:8d75 with SMTP id t24-20020a195f18000000b0050e7be78d75mr1586553lfb.88.1705179355274;
        Sat, 13 Jan 2024 12:55:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:45 +0200
Subject: [PATCH v2 02/15] dt-bindings: usb: qcom,pmic-typec: add support
 for the PMI632 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-2-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=71F8jVd5iMgdX+Ru5jFbd+dpcbcyYwGu9AyNI4zYLro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjWHWJGIEWuyWFCPqYkzM6IzpKV8gOkx8Esq
 QsiBZqNKj6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1V7yB/9/aC+T00w8ryeVp6EZx+UEg7KhneVJxRzKWOYpLi3HfkqUHBsgUTekq/mqCdUcOJEYmy3
 I/BlFAsDsHkUWJzHruLomFa0fVRIeXAA0/QBuDsJ4Wj52WlvBO0NiEMOjCoWDX6RO3vfw8krun1
 fVvp/lyNQXQNifOqUhZBBSanj9C1pjGQ7KvrGHeWvm3YjwZ4YulhKiep0mcoPSdfNLqZ2ZSqdxu
 bTwuHhot8B9NzoVSIbtliKnmvf8p28qOY6B8JDJ72mx3Zf40Vtq5IQwhcEL7J6jxAEMebJ43kcv
 ElsYoKuvQBlLclxMb/TYbjBh8TZfjYa+B8ORP41Pdv4NDgpa
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The PMI632 PMIC has the same Type-C register block as the PM8150B.
However this PMIC doesn't support USB Power Delivery. As such it doesn't
have the second region used by the existing pm8150b bindings. Add if
clauses to handle the PMI632 usecase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 55df3129a0bc..e9f44750d580 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -15,6 +15,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,pmi632-typec
       - qcom,pm8150b-typec
 
   connector:
@@ -24,9 +25,11 @@ properties:
 
   reg:
     description: Type-C port and pdphy SPMI register base offsets
+    minItems: 1
     maxItems: 2
 
   interrupts:
+    minItems: 8
     items:
       - description: Type-C CC attach notification, VBUS error, tCCDebounce done
       - description: Type-C VCONN powered
@@ -46,6 +49,7 @@ properties:
       - description: Power Domain Fast Role Swap event
 
   interrupt-names:
+    minItems: 8
     items:
       - const: or-rid-detect-change
       - const: vpd-detect
@@ -81,7 +85,29 @@ required:
   - interrupts
   - interrupt-names
   - vdd-vbus-supply
-  - vdd-pdphy-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pmi632-typec
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+        interrupt-names:
+          maxItems: 8
+        vdd-pdphy-supply: false
+    else:
+      properties:
+        interrupts:
+          minItems: 16
+        interrupt-names:
+          maxItems: 16
+      required:
+        - vdd-pdphy-supply
 
 additionalProperties: false
 

-- 
2.39.2


