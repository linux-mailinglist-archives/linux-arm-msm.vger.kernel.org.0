Return-Path: <linux-arm-msm+bounces-30181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEA4965A12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8459DB22498
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BCD16D9C0;
	Fri, 30 Aug 2024 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcEj8kd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE3A16BE18
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006054; cv=none; b=a5jPy3TViVUtz82UNEMYmPSydr9F/3Kdcs/1v09DtPmfEdEH3y1Fzy6D64338KSUZeyBxePs41s151RD+mr1yfiR435fDk489rddPnKl01aLipakjLkoOuIqUNgvXe+ERF3B4KRoBKF6J9/UqkELwV1Wc10m03YDe4IWurqs9Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006054; c=relaxed/simple;
	bh=LfGF/Co2ZJ3EMAUZRj7r68zzJQIEdxPhr4ofALXrn2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGsDTnFqElgq25qD4AfIY9EWglTA9DRyXiOCOyN/Fz/XoiiuCk/w61Xo3VUXF2sUJrcpUi7R9plPUIrTyAlS4Om9tEB2ZUyhWRIOCwiOYiw7Z0ikgPZ1r6gdsUnomkhlaXCr5bL5mayVHoOWXMtLfGRnKaNE0lVBouaM48j6uuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcEj8kd/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53343bf5eddso1937695e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725006049; x=1725610849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NploNZbtHibi2ZJNMh06TTcB1PFBEXr824NaRwcdxH4=;
        b=pcEj8kd/ZjWnuHFgRfiVGWdQM5KQ4PXUHaVyvLbCB9tagwghrLljPDtFtZ25HRUeKd
         /ZXL+IptLqSna4b/mTH/OaIp/zGk3XBdCEHqd0oRe3kCiCkeFoH/ykFdZGPUtIuf2jgs
         1JifDA9ZzeyGwkBQRX4LRSie2zTqSJmvDFa39/GXEkjmxqL+H6+dFZet8mRXF/pGP29u
         ugRNXGtu4RHZQTiq2D+ul21eR1j0qtq7Bg+fO/BU+CyLbEcb/vWUtYCxdrX7wOCdnyM5
         E3+2bzps5E2suAorz8FjavjFkvRkw+xnYKCvhHRBqa3T7E4sl/hMmVrQV7Svs4yHp4//
         QEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725006049; x=1725610849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NploNZbtHibi2ZJNMh06TTcB1PFBEXr824NaRwcdxH4=;
        b=oYKR3XeaahrdCAwB0nGRWxkZG2ZLq6Nkg4eawjvlB7QHXgwCROKWZad70hASbA8lu3
         UdKQm0VbunDqbjJiS3zV7Si2DeoI7HpuzjdFlLrQ4ZE0VWJaBVOEJMImi+Y6X+j3I3AO
         8P9dEc0FUda/m9WOtAAOfm7Ozk/QRab7c2xql1YU3aRiGLFHwtW1jKGpykomI8hl9NFD
         +9SKMzgnAcezUsllyNmWgky+scfcuvckkU7Ku5utbeBtRGsmEwhJB235T7iMVudVhVSJ
         /TUfa6gi77deVKwgDHFQ8LAwR/iqPTTuhmP+saJedmaR7GmC0bqXqMxYcSqvJ5xkgVPp
         EUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVng0ZVn+P2KUjJ5Xg01N+N7y3P/ETNOOmPsJ6F7CM8Ai6tT8dZojCVmLqzEDpbrq120FOTC7+JBX4S3E2+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0I7uvPwaEDwbD/ANlAZks6raWFMaLFnDe3TbUHZADbOh3BIB9
	NAxTdQDYGsYLod6QsWPndm9vdWzJIfAHDIcGBeRLVStFzSuOporyuXWLxqHUGMn/RK0dNmQBklk
	0
X-Google-Smtp-Source: AGHT+IFjoXVe7FHll2U5M0piT4wcA911NawXP/5Kjk9sBE49dz+SZpVtOH1da/Ghu5j7P08Cy1gpAw==
X-Received: by 2002:a05:6512:b0b:b0:52e:fd84:cec0 with SMTP id 2adb3069b0e04-53546bc38cdmr988847e87.52.1725006048563;
        Fri, 30 Aug 2024 01:20:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084e00asm482623e87.271.2024.08.30.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:20:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 30 Aug 2024 11:20:45 +0300
Subject: [PATCH v2 1/2] dt-bindings: phy: add NXP PTN3222 eUSB2 to USB2
 redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-nxp-ptn3222-v2-1-4c6d8535cf6c@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
In-Reply-To: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LfGF/Co2ZJ3EMAUZRj7r68zzJQIEdxPhr4ofALXrn2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm0YDfXFp9G/36L62vW481XT0BRm68dKHQdFAsR
 zkKyC7wuKKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtGA3wAKCRCLPIo+Aiko
 1VyrCACHueN76NHtu8a869ncODgddH+cdhywW4JZQSPDYK7ZfowB3kQgVAHxG8CNd+CSFz5HWF1
 0BZcatkQY/H52lZKGemBtg0MFxKLLxWXHne1VUDINy4rEEW+SwO1jejRBZ0ZuCkH0/Fz6aAoCx7
 bPLauJCDdAqDbGS2tE4Sk6Cexo3yHW2uO3Mc5n7wbxH926MfGgiQEb8g9RGhH3+im5+0KNY3TCl
 NQEdcIUNJ0w6+RWyDabyK/ZlRBOsaJH22CgPR+CnbOVkWuVYm7pt6c9PmnOu53XOasuwa4yRZ6w
 O1O7m2w9JEFicIxStltOCVcjjOk2gUBaM4VV00KlrqAysmpI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
translation between eUSB2 and USB2 signalling schemes. It supports all
three data rates: Low Speed, Full Speed and High Speed.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/nxp,ptn3222.yaml       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml b/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml
new file mode 100644
index 000000000000..acec5bb2391d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/nxp,ptn3222.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/nxp,ptn3222.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PTN3222 1-port eUSB2 to USB2 redriver
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - nxp,ptn3222
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  vdd1v8-supply:
+    description: power supply (1.8V)
+
+  vdd3v3-supply:
+    description: power supply (3.3V)
+
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        redriver@4f {
+            compatible = "nxp,ptn3222";
+            reg = <0x4f>;
+            #phy-cells = <0>;
+            vdd3v3-supply = <&vreg_3p3>;
+            vdd1v8-supply = <&vreg_1p8>;
+            reset-gpios = <&gpio_reset GPIO_ACTIVE_LOW>;
+        };
+    };
+...

-- 
2.39.2


