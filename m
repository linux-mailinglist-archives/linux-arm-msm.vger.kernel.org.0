Return-Path: <linux-arm-msm+bounces-45407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C81A15128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8C61163829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C2B1FF5F7;
	Fri, 17 Jan 2025 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMuiXVFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F33D530;
	Fri, 17 Jan 2025 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122738; cv=none; b=c8wPXxkYjWbpov6xc6tZ4gDwIfIrFBpjv1e+wnSsS2sBXtw/t9e6AZTxrzP6lYfBwRTfuDNfERyNJeQuEli9fYUwsxKYbNIrCIF5gs2NhmFvHYvcBb8IdTtaQuYSlOg0H4OF07OIUqX0P8vzDjVPzzG/4v+vHdlCDy0aEjR/apE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122738; c=relaxed/simple;
	bh=aS2et3sdTcDv6c0Pc/Jkbrw2ogfMwC7cpOQktzXYM0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQUCBJ5NNGc/Sv4wsSkblBe9rXS3Lu1wd4jQrL4nUZrq/RybfF5W9gvz4hHKYhc4oYodd3Wq5ATCF5F9kLs3d1HlQCwKvjrxZtTgzmYwfgoWsFkEW9Ie2KjhJy8DJOj2ZvIA0a0f59IwTerLhW0zfI+mY4ttZbhv4l+Mu21YZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMuiXVFf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166f1e589cso53605405ad.3;
        Fri, 17 Jan 2025 06:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737122736; x=1737727536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=kMuiXVFfRUvgijH8gSHzlUAXRZHqjOO7ct3O09u0axaWACgUaOfOhdI5KkMUQKh/EW
         5JiGSzYEz/Nh7/ih9c2U52yodJKkmUdCLusHeN7YgyUumI/IlulDTCXfc16ltSv4c+nx
         6sz1PCqveVopgpa/LXxfMCjtkHzHe+/biayDW2KvXAdqYtFp3WeKQqRahd29bDoTU0Se
         eDZa4nLHsqwZ9Rc6Gu62G3Zb1EZI0xk6Ae5mvvnxLqJgZyUiStm3eCBwMVYQWVERfcIt
         0QLVbAP2ghe7KdUlDgsLo3AD0ZdGdJrtcJ1oIdn9YCr5XlMwLLdCjiul2MeOeqdVm8o4
         D/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122736; x=1737727536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=Xo7sUY2cUSpLNAVSRKTuRfJSFEPzZZnv6hSbDR5uhZOoNtTQx3VfhtWl+L4x5LnfEC
         x7rW78oKVYWF/lT55HshLLsLBkoREZeq37oyPx6Nc7gWwW+eH808XSRM+qvYnumFeeQA
         3M9P4Ll3d6Yaq2EMHXcS6rFJknn2yLR1h4o4QF6lTdFxyHkxiqK8hnJjjd4nEeNq9nd6
         N7rmJUErZRD2PsctWNMpPkOWZJyyJv0JLw7UpolVrSMlMhi8X+mBlQuQS1UPJfpc6EDE
         Cm9KSbmEtncNqMfwSgaixSnIT1pds5Ifade1MPFzFj95vbx9D/+h+oAmn2BbjHT9lcDI
         wB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUX9Wn0t0eQ5TFsHFGH21hB3iz392T8hnU+e1S/tt3vuzHsKIEi36++FTIkZpcMdCahsVEG4kVtL+JmYp+K@vger.kernel.org, AJvYcCVBSKq/ZAUKNCsz7MyUn6ZQUObzkmhTko/nX6kWgMA3EyzRg/OeqljZ3kNpGm/WdifNo7a+SFBAfT0uL+oi@vger.kernel.org, AJvYcCVoLmKyh4wZ66a7LKHJkyskyncXE596HoAIBSzyew4817ObTOUK3d0QH+UUpfW0kZJlSVNwem0qbQL5GrnKnz1gz9Foqw==@vger.kernel.org, AJvYcCVvfPV/zuu6c0XYv7v+91o75Hr+TrYpvVpyKRva/TSdSOUTsjNwgFE/rrqz5680S5NuhSXaXA62FrBElOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyydGD0oQALHxs8kxLolVglK6mq34S6xYnRHwJjclvaTCSB20rT
	260v1qrdIjoGQ5EVtSkSEKSncEAkMeGLWRXwjptNOVnxmPk6nfZ1
X-Gm-Gg: ASbGncuGkDoHOdsM1DiYmbYLK3tyDALSZWIsfhScZ8QALxbCXPGPYdTvAPqe7ws9mio
	H/An62m0m6Ss4OnakaXy+YY184f5IuZpEUJ65PqBpds2LmFuJAdc29b2x317BpfcrECHxpbbeNF
	cHCOCkjsCkl/sDcZSKWKeMxkcQJMyFsARPMaVjf0YU37CTOlklT65MzIf2vYczJrNIcesJzdO3K
	mTX8yAXQPhS9ha5xTnPzB3UyL0KEBo/cgYkEMPZFPb8Q+ZUfP/9KEo=
X-Google-Smtp-Source: AGHT+IFRMZ+O2h3mab78AOMsqJBmuqdIXxAD8PBxJotPbzYxVxGypkQp0/JD3Iz/Wu3We6DLgdIx3Q==
X-Received: by 2002:a17:902:d4cd:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21c357a617dmr46919825ad.49.1737122735712;
        Fri, 17 Jan 2025 06:05:35 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a8822sm16178375ad.140.2025.01.17.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:05:35 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: [PATCH v5 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Fri, 17 Jan 2025 22:03:46 +0800
Message-ID: <20250117140348.180681-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117140348.180681-1-mitltlatltl@gmail.com>
References: <20250117140348.180681-1-mitltlatltl@gmail.com>
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
2.48.1


