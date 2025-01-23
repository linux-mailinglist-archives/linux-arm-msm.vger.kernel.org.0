Return-Path: <linux-arm-msm+bounces-45997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D2A1A701
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 16:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC6A93AA4E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B49421322E;
	Thu, 23 Jan 2025 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3UpqhIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E89212FA2;
	Thu, 23 Jan 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646007; cv=none; b=IhYDuFmp26Ma349VqT4QgxFVJ/tiS/O8MRRr3ZhJ8IIzohfKORtPGEQMHDEXz1SipxYduqU55PyjVwGJOpTkZI4JIKecbHsLBR/w4+ao3AgRNJsy5oPQzLraGduzVf1MZi3jQYLPhr3/1p3vdwTnc7Qs7b9Fi4Vy6h64dphqNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646007; c=relaxed/simple;
	bh=rZh+QzEDIjS4nbaZP/konyHC/D7YdD8pbyxSoe3Rzog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxSh5tU6R0HGKbt+t/PUuI30ay/Z8ruHf/I2duNTibbuorl0zFDGRWGk6n8cQp3ZjjgLGzoonqFSN+r91ZbtK7bzIk8DY78Zq4o5tDPU8oEpSpXi7l13IgkC1k7ct6d3qDo4dNnIJV9NR3sKCjfGB1EyiSN/NLHSsBM8nIVM0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3UpqhIZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216395e151bso14837805ad.0;
        Thu, 23 Jan 2025 07:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737646006; x=1738250806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=R3UpqhIZUNt9B51VIUbAnt82+A5OfZbBvvIC1u+iwNiBy4wsB1WGWvl6fqm+bSTT2K
         5z7S+GLS8m14rQZ9OObvAKYACEklTuys6Det0yU0Yd4VBgXdRgTcIq9BDmFNkXlTtx1K
         sYtfvy8lUjT5mdcVWmVcIHGn1SI0HVBlOw1BtcEs6waaljwFesChrJt2cz5iUbq79sYH
         8CV0Z88QxZ5e1VeffeX5PT+2t7sVjuNEdfFbHboWDoag2s7Lxx7Ao/WhwXac7VZjGjih
         nnL+DEXDMcJoZ2hNY/4mGi8aaJbEfjpGnK6c+pj7pSma672B1ysgV+1iPMnCS925tUf6
         4PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646006; x=1738250806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=h/v+MTW2fzlHDOBz35wv9CopVZntKw9yJtc37uHCXJQU1oJZGfK/7wchK8FO1Gdhkc
         m8r2acA21ZB16EkrZOqsMxuZehB8p0RF04IYCI8ZGboiZ4L3IapNvbv4F5zQ5MxpL+eD
         qgaxeERmdm49Rcc11MDUUfpBQQYI6QereILgcL8vtmm70F18seIkr6DWLQMbTb2yhmDG
         mcliBNenzxOAoj8L/LRUhGPOcJTnaC37qR2b7nBQVDzqlqnFpVv2LbXrmyAJfpd4x0Qw
         /i2cx4NGm5nY1nrsbHcvNnSip3E+O4fV8HeNRKpgC1M3fbAJC+HfdfB4pdkvwEwZ3Nm8
         4h2g==
X-Forwarded-Encrypted: i=1; AJvYcCUNp4ywiDczrdT8+eKCqoAgkOEG7slZqTBM8To/s35rxmVOXfQoWqbmQcmYVF7CdTW53CcOo5Ldl9gAPEVC@vger.kernel.org, AJvYcCVvAuDdRd4EhGSgudbHf1nZ6dAgx7lquqDbr9c6sejmK4w0WkuCbch6bcscw0IVwzQ3+j8Se1QxDJIUAHU=@vger.kernel.org, AJvYcCXize8noxSS8z6D90UqqJZr1WKBpFWIQOMSUygzjr6h8aUNU1URxwbIpLeuPj5mBw9WH///Guy73L+yqyuhQtM/89XT0A==@vger.kernel.org, AJvYcCXmMpjblGdHVtUME8uKEodNCevoq70gm/GSElU6/w5bx5u0ZW3ZWmoHZx+nYy+m8rjY5EnWODThyDs+7FNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6ZImH/7sMIu19CfUtjDLtVwagc4XuYfszVdLoI+CViy1RwTo
	jmY5yXPY5g+RhcviJch8hKwI+yRJXrfBe+vl09mdyeGf8vK/FHhW
X-Gm-Gg: ASbGncvvI/gj2+Pih0v9RhXGztKH+jkuUCRSjyw6s1HMyf3wmWM29RisX8oLz+7MotM
	azijQkzxbKDD/U0NUHqDJ96rKaNEaJKx2R9rZJGUcN2dRoPIT6NttyKLHwmW0eQ0fhcTViXgzs8
	fvNWkQlzTlKn1Wwu0NeMfKoyTXyH8IvJucW23STSUyyaq0nDVunG7eg9S8FDrZ9So6IltYbXDfr
	SOqU2zh9QvWacM1Ut4BBqS4pf2oZh3b5B92PlyXwetlJ/SQ4Hmj1VapGPRc/Bff+VjQyMIzUdIb
	IAQR/g==
X-Google-Smtp-Source: AGHT+IHN5fBd/ba9iIJHzif5Q53wd4bqKbweNk8JViTjE8AfBx72Fffcsg/wCDTWfpoJwjh6eU7++A==
X-Received: by 2002:a17:903:2409:b0:216:14fb:d277 with SMTP id d9443c01a7336-21d993ca17cmr62644035ad.22.1737646005691;
        Thu, 23 Jan 2025 07:26:45 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf707dsm11247915a12.32.2025.01.23.07.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:26:45 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Thu, 23 Jan 2025 23:25:57 +0800
Message-ID: <20250123152559.52449-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123152559.52449-1-mitltlatltl@gmail.com>
References: <20250123152559.52449-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the EC found in the Huawei Matebook E Go and
Huawei Matebook E Go LTE 2-in-1 tablets, the former one is a QS sc8280xp
based tablet, the latter one is a QS sc8180x based tablet.

This series has a codename, gaokun. More information about gaokun, please
check https://bugzilla.kernel.org/show_bug.cgi?id=219645

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/platform/huawei,gaokun-ec.yaml   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml

diff --git a/Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml b/Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
new file mode 100644
index 000000000..4a03b0ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/huawei,gaokun-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Huawei Matebook E Go Embedded Controller
+
+maintainers:
+  - Pengyu Luo <mitltlatltl@gmail.com>
+
+description:
+  Different from other Qualcomm Snapdragon sc8180x and sc8280xp-based
+  machines, the Huawei Matebook E Go tablets use embedded controllers
+  while others use a system called PMIC GLink which handles battery,
+  UCSI, USB Type-C DP Alt Mode. In addition, Huawei's implementation
+  also handles additional features, such as charging thresholds, FN
+  lock, smart charging, tablet lid status, thermal sensors, and more.
+
+properties:
+  compatible:
+    enum:
+      - huawei,gaokun3-ec
+
+  reg:
+    const: 0x38
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
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@38 {
+            compatible = "huawei,gaokun3-ec";
+            reg = <0x38>;
+
+            interrupts-extended = <&tlmm 107 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        ucsi0_ss_in: endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        ucsi0_sbu: endpoint {
+                            remote-endpoint = <&usb0_sbu_mux>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        ucsi1_ss_in: endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_out>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        ucsi1_sbu: endpoint {
+                            remote-endpoint = <&usb1_sbu_mux>;
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.47.1


