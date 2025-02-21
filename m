Return-Path: <linux-arm-msm+bounces-49002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AAA40379
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CF9017CFDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 23:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C3C20AF8E;
	Fri, 21 Feb 2025 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WClf+/8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993EC2046A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180693; cv=none; b=P9pbSNNbAKC7QTeWOtZwQYRJ93hbJa6koBmsLHI435ddUL0PyYSLBny0Rw3OUiey/i+ADeVOnJc/dO2sDLXWb2119mJm4hW78AUhd9qsk+9wOXauKSZ/6s5RCFKGY7dQVGFjMzWLONoQus8WSTAcW/OYvoUkOroa5ovB7Ca4vf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180693; c=relaxed/simple;
	bh=LsqVGCjtMo5lMpVB8FHpQNoTpKeLzijmuixmRj5EbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnLyDAvS/fRfDTPnGnCAibu9IBOp5GhruZsnJxbo0BhUiE/uXYly4cb0NGMFXSW2gqf0lSh3aJckZ8AlIO9iDIezQINkYLGmAwWtqrLN3nDtfRAOrhwYFfURT8GfSQVxUiMTWaZnPzOwFAc5+tVBuviJ0/S0GixPcDK2aaU7Sc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WClf+/8W; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21c2f1b610dso76388205ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740180691; x=1740785491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=WClf+/8WYSrQFspbYRX+vspu61ttzC7AeBm4QmuPfA/8B2DJe9yxgKnNHysqd7MtRO
         dLc4EqrYjJ8NrRWaKVokMwRjX9qMkYa528v+Vrx2LlWp9UJSQuupGOq5UynOFvzNsJ2r
         wadoN46oOpKqZwirsU2HyRMCNsujyhsu3048Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740180691; x=1740785491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=rZ6/EGGZAkMCAtkmi6n/uP+aFgtuRfgN1xRSCaDRO4ySNub6M7ZiEcY2ZdK6rbOK3X
         X+xzEcZUQABkq7sganbOiWKAJJclq91ESTUBGPscxHdCjVgiN2g4tfXBil905K47SN63
         MSWD8ezEIhb0KNZem40grZ/ARYDzRwuwQufpwv5bI2HsxG212zSUmpVhn86i6Rxf3UnC
         fCtcaSE1ZpB4im8cWYnK8oMoa7gn/EfEDJEiu1pzfDWM2kSIbUdL5N2A+6eH0vAHmYsj
         m54zHrZu+S4gLmSQFz87XflJ4vU+YA2q1OkRC0G73RISz40j+gtcZj8QeV4bdgDVIgIc
         WxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX1BjQXxfS6Yp3iCtpENLJx3RbDN4Kwsjpdeu2c5X8ukj42N3ge5HLxCkXTUrLFi8CUrnNceaocLf0CpoA@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHLRvBvCtzEjImJNeI8S7ajqgdFQujspjQ4WIb8j3v3x4EQDC
	IH4GruFN2AaaA2i/ygp83qaWZw8jeFFvj4wvRHUgrXWKHnbbaGmFAGL6BAT75Q==
X-Gm-Gg: ASbGnctYroy2iM04l9793sFjD4eV5xCpfrrnkiY2ZKChETJ0xzzhbaRCrIgXO1M7FoA
	gjcYLGT9gtVuJZZM3nQTgQrx+RxMBM8yCo0325XVuRh9xKFdoBKOfSVqhjkd2kOQsRHE9PNTzUS
	vFUjQaWg8bLwzdl+sALUtKad/kOY/xCVtLEk4qrFQAcFLtHRpsGfI+0SMPikspw1gJzykGmWf49
	CplT1773rGawrsXAmot+AjYkCMd+HEcI7L3ftsAq1KV9UvGzJs79utxjixIAbOs8M3MzB7WDDOl
	FdYD8iD1DbmTuXEXNzVWfLn5ip6hE/WPyp5eKGsUupugCsKCYstREeJRDA4INHMySQ==
X-Google-Smtp-Source: AGHT+IHTYhgMmZwtQMesyuqCsfU3X/GUFToquzYJeUC27Q625wzMr9+Lzr+YQe6mF0JuZ2Y4qKGonQ==
X-Received: by 2002:a17:902:ce05:b0:21f:baa:80c1 with SMTP id d9443c01a7336-2219fff2c88mr84742995ad.53.1740180690972;
        Fri, 21 Feb 2025 15:31:30 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d55b6ab7sm141979245ad.132.2025.02.21.15.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:31:24 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v4 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Fri, 21 Feb 2025 15:31:14 -0800
Message-ID: <20250221233120.3596158-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
In-Reply-To: <20250221233120.3596158-1-swboyd@chromium.org>
References: <20250221233120.3596158-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the set of pins used to connect the detachable keyboard on
detachable ChromeOS devices. The set of pins is called the "pogo pins".
It's basically USB 2.0 with an extra pin for base detection. We expect
to find a keyboard on the other side of this connector with a specific
vid/pid, so describe that as a child device at the port of the usb
device connected upstream.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
new file mode 100644
index 000000000000..053c1cfed6d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google USB Pogo Pin Keyboard
+
+maintainers:
+  - Stephen Boyd <swboyd@chromium.org>
+
+description:
+  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
+  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
+  base detection. The detachable keyboard is a USB device that connects to the
+  four USB pogo pins.
+
+properties:
+  compatible:
+    const: google,usb-pogo-keyboard
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to USB2 port providing USB HS signals
+    required:
+      - endpoint
+
+patternProperties:
+  '^keyboard@[0-9a-f]{1,2}$':
+    description: The detachable keyboard
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+      compatible = "google,usb-pogo-keyboard";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@2 {
+        compatible = "usb18d1,504c";
+        reg = <2>;
+      };
+
+      port {
+        pogo_connector_in: endpoint {
+          remote-endpoint = <&usb_hub_dsp3_hs>;
+        };
+      };
+    };
+
+...
-- 
https://chromeos.dev


