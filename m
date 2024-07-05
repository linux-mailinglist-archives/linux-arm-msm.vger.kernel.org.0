Return-Path: <linux-arm-msm+bounces-25352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C89285BF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32A5D1F221D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A135A14A60F;
	Fri,  5 Jul 2024 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cr3Frtnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F814A084
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173129; cv=none; b=RKXUcQqCa5TSpm1p9HmNU7lcSxG+VNze6MgF5S0P4uwZ7a5LMJdk44e6S0RfufGoRHBElrSAJDOiPpDy4hfdrPCM6XjiJjZISWt7oiZEHyNPg1jhEkq7wz+NfAim+gWiRDN/hjIfaTwVQ1mlssF7m5um+JOehmbfBc+xs5RaLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173129; c=relaxed/simple;
	bh=1bbcFoZawiRI3PTpjc/TywnxafuLlCzcm0nRv9laj54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhXWWCcjKtUYmN0CRPMsjiJmbHR3x6hef1usTUOsWJwB74pbk+O7Bdr5gi12U2h18cpL6uvjuwlP7u372QL13jz928meA7yCcDFWQllXTPKffyCIKA4rKF0mKk8fePB3fL6vokQy2C3/boFTpzOaTDCxlRctDwpSPe6zZof2Cc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cr3Frtnp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so15572011fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173125; x=1720777925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmpbV0/ZWJ0x/mBhq1FFt4dl1nyPYdFZuwuFwMvEasg=;
        b=cr3FrtnpVkQDk7H2zYF5f1CPA+YEeHRwi/TXDamfdthmJvqxGzJOFpfi/Yk725stIN
         5FfwkO/xOP7h8rPTrTC5P2NBhE1vHWcsJxSHWGLahSBdJsrb8rnbJ+mo+zurvVmMgQf+
         Eb+f9Fd8uARsqAWbC4sJUL+bgYbjA8ZHRE10IG/GzEbmheEqQ1fv8UypMZvNJG+HFLqC
         t69qWqE1k9/s92S5cqVvfwC+qcpQUJaJv9s+RGuPrBtH6tQjHqFi0YOzquOvFMZW/MFO
         UBXzfhINQzbDzXDEFZr+LcMxj7qu0tj3j79Sv+AFq7l+kuKViWkO18HVR3q0RY+cH8W9
         hXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173125; x=1720777925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmpbV0/ZWJ0x/mBhq1FFt4dl1nyPYdFZuwuFwMvEasg=;
        b=mgdtLOWCiYNJhZlbIxECoFLIzPLemOL1tJKg+W5jOB467Gx5VmLbhPDM0mAMUDRyWd
         olDBYUrV0xIMdrg05/IGhmEqNCG3hUCrXxM7cPz6V2Vgv0DukswcgbRNhM2vu4mHrNp0
         Hi1z4Q9DU2bKOK+1CXd6nfMMY+jnlBeHTSfYhvThpnwdesCeZQL07r15R/6UbbyqL6Ix
         llpQNs6DZWYTH/kJjNvn/nt/sh3VHwtmjPsJqCATyreAs/tg2X1lZAJHEV/ssAWoOgFh
         MJjiqEtbBgeRVsvr+6CsH9wORQmRx4QdbuiCjZBP/PBCqDrapu+EEsE/+UeiSoJr4E3O
         +ONw==
X-Forwarded-Encrypted: i=1; AJvYcCVpk4qCZIe+q9PodeLNe1oT2K6Xa3EDSyABLPlUUVQWfSwLg9ioQ57tvdLXQdMyfF8B/ERXwTwf/bsvExY6WDawXaBlWN7Z6Ubdlz+I2g==
X-Gm-Message-State: AOJu0YznCBjBNbTfbOYP1/s3sByNral30lU0vmgw4BJIF+O9hCkGSJTO
	pSlFG/soSTp0F0L2GvBZ5f2ezGgh6b1lATCVAmyIzz61ejAJHtWdOwxRVTc4kIo=
X-Google-Smtp-Source: AGHT+IEpqP44PEtuiMOJUICfTSDO5lXW2ZxFDUW8E+Je8DvVTL2T8cLWYD7JILaux30NxHiYb+oJdQ==
X-Received: by 2002:a2e:98c6:0:b0:2ec:5518:9550 with SMTP id 38308e7fff4ca-2ee8ed22bf7mr30865751fa.10.1720173125430;
        Fri, 05 Jul 2024 02:52:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:25 +0200
Subject: [PATCH RESEND 06/22] dt-bindings: thermal: imx8mm: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-6-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1bbcFoZawiRI3PTpjc/TywnxafuLlCzcm0nRv9laj54=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8Io5kvm9KrEwxcJ9HK5qRnuUiNymhkzm9fx3
 WgLUnw9XniJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKAAKCRDBN2bmhouD
 1yz4D/4tI/vqIR29JXqECCf/ScDfrDbFYvT4/1nVCINT7RnMUeFyspoZvY9DCANaxBZYS8fRUC2
 pzdHZzhRspgzh+Mj8pjZr5c9G+6Pk6XOhutyKQob4OlSXhs7VLx5QRpWHfDJwjemu0r1hvKr9bo
 QCYRcjDFVKbFEzV/mclKMLIHVVmT+DlO0TpupsHg+ULMN2q/unoqNb6lBMRGk9gIOUujC807y/k
 /t3uiAVzovcsfbD0r7Ihfejd+XsN/Zceay9rINcK+1t58tBvlCP/287I+O96kOlu3Nrdd4zmzIN
 tHmyLEPkf0/6OgsxCSDx9rdLU/qAAqgWG1HoGxrqjqJDEJDL2yjNbcG+BIrfG17dQoxXg7PxYB5
 NO/oIrEPzFciYSixja/c1vPje77bCSneOK+KtC7q/Gc3ic72n4KgzFVgCEIhbEv8JjOJhYqsCfu
 wM6vVURJ0bknpx8T6pqafNucZndq/iADceye9FLZj1gjop67tOMGYLX5ecHHDnlcq8koeOabEhB
 0KqVMfX50wh2G2h3JB6RyzMJsRVzUG5O337HcFAR3RqJKEJnA0FIxYrNrHdy6ZzO+GeZphlEsji
 fvQ3K5/0MqNOFXYvoZ8xTa0cnCWkTGXCqRDfq+yf8DS00yG5md5c9OeufzaVo4LSdVmwNH5Enco
 sDH6CdVNBV0J96g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index 42e2317a00f5..bef0e95e7416 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -18,6 +18,8 @@ description: |
   for i.MX8MM which has ONLY 1 sensor, v2 is for i.MX8MP which has
   2 sensors.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -53,9 +55,8 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


