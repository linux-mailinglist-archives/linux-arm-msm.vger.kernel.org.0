Return-Path: <linux-arm-msm+bounces-22399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76135904FCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77D21F25176
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985E916EBF6;
	Wed, 12 Jun 2024 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmrRb7l3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FF16DEDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186380; cv=none; b=T4R5wVqAPgjRIFYF2jnvhqukjw8bihTIzvpgv5GCUS7mBeAtazXL1YHKRhFI1vnvr+TX6uv+tQxaZyBNk6alw8LQBk8Pi+PpwQM5s0BlZWH7IjHsniE4wxVCU2/Xkr7zAYYucjPDj3ueiGaeI/J9dC1rZ8SFYlVmSpkYD2B9d6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186380; c=relaxed/simple;
	bh=lzuWmQsRHevIFSOU8fqsv8TO85dYE8vzaNEi5gArVS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IANQSBxduwTk+4Nr0/gzkGpzuKMq5f+SHp3FYvXOR6FrrFLgHNi7Vob2rZA1+YjtkzkIDsFrbY3CnLK/tEtENl7Pl5GUcgC8oO6qvLK9Tnjjb56HIShdiE/zfn7wJAkZlZ+Bo/aZkeA7e8XlFk7AgT3AB+JMzIFOfbmmu4LpF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmrRb7l3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5295e488248so7297039e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186375; x=1718791175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp42j2u8rigijiuxzVvZ7hagCwbbwAjC3ss3o2b1CDw=;
        b=kmrRb7l38KsZqpfWUJNIjU0ghLQhukEut0linJHuTc2BZgzppQmWsBLUBB85qU13ch
         twCNYCljVR5UMJ/8nshzJ3Li/Wu9OYrnwqbmrAxaO8hJtyYNXgsI1H6HAxjhsyT+F+bo
         l3qXsltUEIU62RHYwFfhd+7kUwrLjmfGA4dGkz4hu/jqbDNeEf1JSNlsbvr63mvuDZ+S
         BDoLksB4V/dk1h/En+2d16gCkMEUTXjNXjbuIcZUJ8qH46DEFc2YDtuTV9ZcF8D9vsH4
         xR36AfahTDiYpDhY0S2DqG/T0k+UTvu/D0+8NawRSuLNR7gT4ERwgpvqSfcyTkuV9iZZ
         5cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186375; x=1718791175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp42j2u8rigijiuxzVvZ7hagCwbbwAjC3ss3o2b1CDw=;
        b=MlasWQ6ZEjRaJXPHQ9SmueKcMRp6NrPs3I9+3HIZInJUKuhoTpnMpmKGMbMnWbIiwy
         R/vgsSFsf0LlNwsUKZyhbYJqRoZvVs9+3FDwNRw6PJcRUMbMuKrU4IR/SwADbnp0Gnb8
         D/Z4Wa0spc4rE1zCrv83Co2Ss8V5JxQSRMVJKIPk/NB+rPMBkIj23lRNqUXfvWeYuhL+
         KjlgEie4yg0vWSev/OOzZMR5zw5MJ+FyD4oZnFpx7XAHXB4XVtNjsdWWd/rEIDMmSSV/
         cmyIczBqUr7OHonbHsLs2JSLf7ClMs9Au67SKPkRvsvsJ7RJmloMp68Zwj4kS1EMgxvc
         quKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQHQzEjy4dJAPBjMB1ta7Fdlsi6NMG99ppPeuUS1mMMR1ZKlELBhOZkUww9zvaifypnnaZqxbFXGPH870FaWuogpL84VY4Pq1IzRcUwA==
X-Gm-Message-State: AOJu0YzUVXBD5HEvI4jGwYhirZasajXRrkdu63fJ9MaMYAZGfGJWD3i2
	EQy799j/x3bOdpv3azVguj7CEdtcGxsEEhZtTtEnfr6Z2FQvqzKfKFFZmhQkCpc=
X-Google-Smtp-Source: AGHT+IEDa7kb32fgkJfPo5ReIlwBIVgibQAKT4zkUPAxRXpdDcs3pt/afX/PBq3eBew4IroPkWM/5g==
X-Received: by 2002:a05:6512:3130:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-52c9a3b794bmr758824e87.14.1718186375541;
        Wed, 12 Jun 2024 02:59:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8907dae9sm1408095e87.129.2024.06.12.02.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:59:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 12:59:32 +0300
Subject: [PATCH v6 1/6] dt-bindings: platform: Add Lenovo Yoga C630 EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-yoga-ec-driver-v6-1-8e76ba060439@linaro.org>
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
In-Reply-To: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C9Lg3cE1aC1zyYeo+0Q2DO6EQOTcK4wvIXQyDKOKakY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaXGFPHjMU3q0TrL2Mx4I+pTs8YCISncfWVhKJ
 VlZnOacUO+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmlxhQAKCRCLPIo+Aiko
 1TEDB/0UqCtGC8LEtWypIkYCwbJtdw2FoYkGk7eXkL5c1Qm7XThJfAwsLhCZ5R0pVYfr2VSIyig
 WR3RjZAjC2Q3odxD+TPd/TdOZz4YPt3fSq8bzrMCjbs569sPjuDQtv+WWfrycY/el7xUedx8KOw
 umU6Sigj5gpc0meXgnVnK5ZXWDnWNkSiQc+AUSP1EVaXwEGNMi46g0j9UFs5zxx2e+nrkX1ML7o
 2dPSjf0LMgwJ/mu7KORHcBrD5Vc7pwRMOo0JjHTSG5/BmtmujPlmhhNoLMpL+jyBG0bPK/vejrj
 14AVhbi8/iSG3YxqGiRFPp0L3x1JYQzWFdirDaHuILXZOHXy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

Add binding for the Embedded Controller found in the Qualcomm
Snapdragon-based Lenovo Yoga C630.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/platform/lenovo,yoga-c630-ec.yaml     | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
new file mode 100644
index 000000000000..3180ce1a22d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/lenovo,yoga-c630-ec.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/lenovo,yoga-c630-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga C630 Embedded Controller.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
+  (EC) which handles things such as battery and USB Type-C. This binding
+  describes the interface, on an I2C bus, to this EC.
+
+properties:
+  compatible:
+    const: lenovo,yoga-c630-ec
+
+  reg:
+    const: 0x70
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c1 {
+        clock-frequency = <400000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-c630-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                power-role = "source";
+                data-role = "host";
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                power-role = "source";
+                data-role = "host";
+            };
+        };
+    };
+...

-- 
2.39.2


