Return-Path: <linux-arm-msm+bounces-46591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CDA23B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 10:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E88716497C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 09:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8113C19E7D3;
	Fri, 31 Jan 2025 09:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWgSWiNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC831E885;
	Fri, 31 Jan 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315321; cv=none; b=bAeZbmid4KnSffeEocDtHEoABrlErLEPomgbGq7OD+BmNsYxpvE03OCK22VU9bcF/abd091WIw2ZkdfRsZ7Dghy1pLHirRSQyvIW3cr1FqBF4lFR30Ua6cDEPaST3KWV3iysNqnsvkYmY8v1eqZcgVIwIjsmbHhaQAqfa44AcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315321; c=relaxed/simple;
	bh=rZh+QzEDIjS4nbaZP/konyHC/D7YdD8pbyxSoe3Rzog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCEqIVzn7BZZenMUVy0Yk+kjrGnniPhZ/lRFeWXeGElrpdYTemQE0Aq841H7lMTvuZQo/l0nLhVnjTi84Amig/7cEKBjpEAjuUyzR+EuZlWTDtZHLN1dm03x13DlwLbl0yby1Tv6cgTotzDwjegUBdDOapIodx7FeG0YMOuEh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWgSWiNk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so2298732a91.2;
        Fri, 31 Jan 2025 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738315319; x=1738920119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=SWgSWiNkYTb/iCImGKArbXhiW4MfTJgTAPcqHZBrtae4ylvPkvdHTHSsP9L40irZpg
         HztYj2y9AzeoILyCo4zazT1qWUo76eeKHHBqkFYSANX/7R4WjnYDZZn/ZRLS0NE8mrBD
         LCWkbQqhEbDdRjDGxmtQ86R+hlmpFXyh3ENV9hOGYwDQ59TlUj8CcHeRKxLUHFd9EGj7
         9cL+zYeF2jTWvxJdciOlYEJ+Pd1FZASgK+65nnGnXSd14TuGbTfLz74zAxyxTR8NyB1H
         qK6RGbapUkoCO/wVbgQR5A+JWmA7KZ7y0uLDsBzdrc/q7G/pR5Y6iyQS17Y2Dndt3gSg
         ooiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315319; x=1738920119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=PpwXLy7fuuFix+PdwyKU62UOu6MT7q/G0kSqFHsBKYHfZOLL3WqqSsZTzXfDZExXAz
         3JdgRfPf+EFdcHp5tf2Gupxtsi9wvMszCSMvtyS/aO85iM6U66lry2eRKueE/YfqEBXS
         YXTL7rmInsuUy3EIyojA6gj48HuE3MsZTBs+8vpRKHhsUH0ALJAKizeVxGCKJ1xwI4rj
         E5bCsGINezTZ8f5VcjJaR3DO+NUBaRlwBvn7iBSj8CXOE52/LunPA6J5GUAUkF7HmHqP
         QYBV1i8jxtFhiQ0Vwx2arw3kddewAH8G9WEVx/67N+D/PFgW5cHtDGX5uNr+7NaX3VpW
         Vg9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjQI+EtcmzTVcynm1Yhnr3oi2SZvC5h5S12c0YvoyshJfQ80ssmaToQgL6FqRbWSVZAXb8PwV/AqKRlnY=@vger.kernel.org, AJvYcCUm4xxzTiSICwmjOVH/wCT0MyOgT3hm8/k8ibcLxGsoXvnAMAtOCNMiqHPt0ietImGxipq7u4O38iuAe9nFGA53GlB7fQ==@vger.kernel.org, AJvYcCUxmtZkiasLNEZfud1Qq6dnPnlHxXvXaHopBBWSgfw0dudTs8isvW/KZCrqQ3mIHDREAW9ZgiSX0tHtTGXY@vger.kernel.org, AJvYcCXJLTWdO34OihIOj/jDdDJRf1kkY/et/0VBElLE+wpjwpsyDGK5a9VqWialAdZ8W1BBBV7yXg1CemTDRUWb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8E/2bFqUv3INbRpVVUDcoXGfJbeWe7twg2BlXE+lxNC797duf
	TLYHrxAUt7NLxx/OO8NclC6yqmFdHODps8+0/2xw/UUD3tfPgbpI
X-Gm-Gg: ASbGncvbYDcuHRdN0a9fNLZv9rwSxcrlOrwDrcVszR+QzOFMGqVAxILvrZrpgYcxql8
	gqm/o2jrQtLX7S29fLIKWO2AnQwF4iQ9XPN59e0TIwLdbH5B7Fb2NOIeFoaX/zEbs3IqcnhxmAE
	aX+Sown1+33VrS3dgXDWizNCg3+6rghLYgWnh4iO9lRNGoTLTMu3mRKFWQbR7gaYA/Vluaci7gQ
	ALxfrMdXj0DTPnY0T4tRBVxnL+gD6REwdC9YQcsUKiR2T8Wcd8krbuQe5UaafQxkiYvondKytCh
	3pW5c8zv1u5DYmgO
X-Google-Smtp-Source: AGHT+IFaym3aaMQyoUYwtBO9sT9trKLkxwmkcny9TqmOAWh1QOzFqnDY81Cu5n7pCbPRXLdiFMW9SA==
X-Received: by 2002:a17:90a:dfc5:b0:2ee:9d65:65a7 with SMTP id 98e67ed59e1d1-2f83ac86a84mr15250175a91.29.1738315319094;
        Fri, 31 Jan 2025 01:21:59 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93ef3sm5366629a91.30.2025.01.31.01.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 01:21:58 -0800 (PST)
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
Subject: [PATCH RESEND v6 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Fri, 31 Jan 2025 17:21:37 +0800
Message-ID: <20250131092139.6065-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131092139.6065-1-mitltlatltl@gmail.com>
References: <20250131092139.6065-1-mitltlatltl@gmail.com>
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


