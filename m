Return-Path: <linux-arm-msm+bounces-45628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC2A170A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 17:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A7E161144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D5C1E9B37;
	Mon, 20 Jan 2025 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0iUzlf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601171B87DB;
	Mon, 20 Jan 2025 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391653; cv=none; b=giRZmtvPOw26AhiQGpp16QRT59+RvPFgMhv/q7Ey59GcuHGDEr2QUGIn6O+ginXXfTNulA2PqS5Cj9Mh+onDbnknFWK368hMOPPn1VurYHlgZr4fqqZ7K2DmJqAvjBwkevEnan6j1+1jsn3jc8w2WZwPKtw4MLgNcHM85jr75lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391653; c=relaxed/simple;
	bh=rZh+QzEDIjS4nbaZP/konyHC/D7YdD8pbyxSoe3Rzog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6+HI46FE5Zu8cTlhSNqVO8+E0fTPdbFC5yfafBqh3t/DHPvZ2bofnBIT/jTlFXOJIDqoR33wZFBhz8CRKs2e57H3lLQnewX607rydehy+M0lhXO9BhQshiuwCLm6Xlf7esaKo2qYFXbSP6EDejRz6cv8LAgLP81KNHFY8klHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0iUzlf/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so6408647a91.3;
        Mon, 20 Jan 2025 08:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391651; x=1737996451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=h0iUzlf/oKwaHKs7EAqVR+OczpolUrJ+rn7Dcnk7kn+zP9aiqNmwgV7kj8ETmJzpy3
         YKbMZ2r3etAWLhbJ3RIRjniTFjgWOWvw/lrw6TDgDuRGtFKp7hKmvFXDQYnuxuaIfd9A
         kAPEDZ7N3J6VHiLEpDMQzUHAblFAYYWg0F/PnUywS12x5gBFiCLnZuct9EOhTLJDOWH6
         uTnzVwIImmaTjKWxOIgPsQHf7cyjF6rTgZG5awEeQ+Er6Ci8fbhfr4BRMKj3Qh6g1O+C
         WQ2WDNyw7QUABceT1Ocd7CYcpPo1DaGq7qFlUUuqp5cyargv9GVDPgwk3NnZDxhxjleg
         wC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391651; x=1737996451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I5PfH7lyhJXCal0r5rnqccmWCKV0ZFLU5somMGPkGo=;
        b=q+cAnojWO6C0wHruLQCFFIRUuypj7oaj8aeWfoF3vBtfdsidBfh1x4YPRcVbdQoA/3
         6RuZZFuk7PQk3Rx5KsWRtZydffgVSX0Q0SS4akTmPI2Fh1PFNhiCOqqu5zRLSex3Wxgc
         +e9f95omXYeM/G4DrlBMh1vFlUaoGY92TxynVp4eLNPv7/3KxWUGMEjwui5gpokkxu2i
         lnN0kWPfgzL6oXiMX534HrWosFyvPz8CVRkuY9X0fj0I8gymiLS5DdAc9KqUrlxaE88c
         y6n9mHDmBthrBeSnHdE9uW9m0hquOumMWz5msKYDBQ1z6qrFTmvijeWLBK6941Tgu4yR
         0fkA==
X-Forwarded-Encrypted: i=1; AJvYcCU8+IzlEFO4cO1wTv/3WBdP6XvLuUHmycZ0ZGk6LrZ6wRoIFWVDwg0zFfceYOUzIKNRREKqMej8K7KUReLT@vger.kernel.org, AJvYcCVJdVGp308pDBUlQVV/kyJ99NYMe6Fo6shQfcHu6RYT1/iv+1cI4osUFupCXtlIU36XGGq2zTQWx3PGXWWZ3xT9rE9sIg==@vger.kernel.org, AJvYcCX/pdVOnAR3EHTuwBgeuezAoOADKKq3yoavFFPetMM/pAfz5sWcM1z0CVKCn+jTd2tOwa82TumgGFcRfqw=@vger.kernel.org, AJvYcCXlpJjbcgkrCBUFmH/6yJ1sLEWNyOu4VO6xJ+1aWc0D9pwMNG9afELNg82Qbj9Qx5/IdA8LXYt0PLIz0BhI@vger.kernel.org
X-Gm-Message-State: AOJu0YygUZA9Et2LTKTPPDZyIEsTzRCsGyl5Hcl86d+32KT5UXiTgcUe
	GAvrluu4XS9mPWfz0e8+NIuza1b1qHgQjCds/8ACmDBODLVrixdU
X-Gm-Gg: ASbGncsJBHiD/IPlWrtP4ypcsI6dtbjslf4iUVuq/8SC+FbzzHLI8N7Y6pcOQtWQwUD
	YZwKRSc1Pr3ugJiCAnOWQybE97oXNs3eCXNsOxm0l5tPoO7QKb4uiARZIUQg+TU4q4V/L2IMjrJ
	fL1rFd3rHTp3Y/zaUhUfmQckGvZVQQeruMcILFNmDDNEvJMQmhneRftZNsYNqnYAbM+veDCCsES
	leI6faWuvb73kXLMmoEc+jOAvbCo1LuzhgY/YLjbSaQp0Trq7njyLg2fRmWOYQ25A/n1U8=
X-Google-Smtp-Source: AGHT+IEfmz5xQvOIcoFfXgE2ta94jUhp2Nud+tNtJsblukQdpX4X+TWDVoDBbFZmrMm5D+uZ6uCrIw==
X-Received: by 2002:a17:90b:53c7:b0:2ee:c4f2:a77d with SMTP id 98e67ed59e1d1-2f782c9d45fmr18148428a91.21.1737391651459;
        Mon, 20 Jan 2025 08:47:31 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a97dsm6017266a12.9.2025.01.20.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:47:30 -0800 (PST)
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
Subject: [PATCH RESEND v5 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Tue, 21 Jan 2025 00:46:59 +0800
Message-ID: <20250120164701.7918-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120164701.7918-1-mitltlatltl@gmail.com>
References: <20250120164701.7918-1-mitltlatltl@gmail.com>
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


