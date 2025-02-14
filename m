Return-Path: <linux-arm-msm+bounces-48066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ACAA3653C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 19:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61D177A21FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 18:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E90B268C54;
	Fri, 14 Feb 2025 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgW3NX+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDFA2641FC;
	Fri, 14 Feb 2025 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739556442; cv=none; b=VnArLOjEd6FwUtY4bUsUVA3yni4ubv8VpyCxai49oLhutMkkLWJQn5pqYrs1B8l29BP48049IRDOoRoAUN9JEgWF8aLb8f9PDIErwCnK9l9NfHOE8HZ+YH3smMqwXLsZ1+bJSnvj9z59u76ZE4+TAYPlHwlLOBUsbXolN+ro0qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739556442; c=relaxed/simple;
	bh=aS2et3sdTcDv6c0Pc/Jkbrw2ogfMwC7cpOQktzXYM0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYT3K+jNzjTiBOMDQUXDU0imDdOePqiAg/x2Apx7Kvt38WJZ9RHzulz9v026jpX8aj79I/HdPRVKou0ZH5vnZ2zvR8tz1/8DfYlUI6joc7a4Tz48C6EMpzO8Mf1BQg/7oNqy+NGUesyEfRCP5AyP2JYffrSAYh45NwgqIzwZEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgW3NX+r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f5660c2fdso49263715ad.2;
        Fri, 14 Feb 2025 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739556439; x=1740161239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=XgW3NX+rmK0VYHyVEQuUOK1u4uyVBWKIT90GkwFgfrEurFCM32taha5Up/j5d3A380
         HSgnkZ3SyGMl3HXtg2pi1odV51xr+EtP2a5umTSDwmu0ecJzB/zGofeG8K3BRKpFLCec
         JagUQjJuwqqN1BHUSE8PxtYnU804lzaDK3qHuTf2kTjXHAoyIfkrMXA9wQDp2Y6Kurit
         j+vLsrupPWb9eRclMAzIyyjFuoOImKVL5B5L75aag3gSeQnXQ2V499mTzV944mO0vFJj
         qd7Uaot7pvUyvYwzYL9R6BAT+eVYSldA9ynlpKXIIMJeqdbRILA761JKheRUjI6eOIpe
         dJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556439; x=1740161239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=rikl2KUGoalFsFzdoL6VxugfAQUoB6+fDzXP00eqVQF1uf8LcfU2GSkbIRWVoXBJP+
         CWM097yqK71lqp51hvyK134qH+idPBb7l5ReKbsEqp67haHG7lrpOyzkAcR5/wtu0Eov
         KUkpfMnGe85+t08e4xoSpfRDYpZcFkmecYwZnJupZ/u+DNp8Sna7zyhVLy28UsHQl2XV
         xk+E057iZRVQ39yB/jHljN+PvgcIWZ1HFw7kLG3XjFu6CSR/xU0LLoLCXpS0Mdv2CWDM
         9VpLZv0dFX6maDR+2jCl6+4caWhCoI8gIpahbajLRcfjxc/4Y6gufXKqkUaGTFXg277G
         xXOw==
X-Forwarded-Encrypted: i=1; AJvYcCUl5PgkSpVTyQ3W0fskgJW5AOXl1b1sh6B1KcXcYedX53u4C75yk/9KOJVyNSMxDa0dLkPNLnm95y3ERTY=@vger.kernel.org, AJvYcCUyrIicq+NgD7MprBpN7xamPLc6zY582CxvO58gJ3dBgur0g9zLyIRoU3w4Ibq0wKqBp3tCKQk1Rqfh/ttT@vger.kernel.org, AJvYcCXDw85QsSBHPPmgZyBOo5wNNGQyQqbn5HLFspTW1aeXOwJadtNo2cwsxQIFSjg10t5XC7Xo6ywSe7tdO3zS@vger.kernel.org, AJvYcCXvhWdziqDc4Yo0uQSQz91NyTLw3OuMaPl+JEqg2H2Lpg2jTS4XYkPOSYV+OH1pkOVWABeeAp1MWp2SEpMbKtFEiM//zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrT40mSHVWI4pxSFgSu1OwKn+2kmu7gSwmuaouXcynh2mUZlNl
	sbm9lMxnHDPwb2BlhfXFK1rYE+CPODzE4Xoztds/4oyWtNEeUdQf
X-Gm-Gg: ASbGnctthtxHHveZEvgJUiDaftoWQl2B5twexhnTDZ6KYLN1UpYgYfpnqw2+VL4LGSP
	g+ZYkQsUK9+Nv+SJNLUfdE9HzsSpwog5BM07aRqt2x1eZVNWV4WKou6ilv8R9Vigxoh5XzUv26d
	cKAWZMXbKScbLmQalK53hjD+xLqDU79E9YyCDTv1GZzlMzOkL0rk9qZk0+83trzWb2/21wuvt3d
	Jk88G2MyIlnJt+2JmP/afThLmLRGoukCW27P8BQ/J//F4b4GKPqUXYaMo8S+mPnFsA1I8640lBb
	zCFQamiNG4nhDYw1
X-Google-Smtp-Source: AGHT+IGs41aiJggp97Bmkp4S1uTDDS4feFVYSFFs01IVlRm+VFP0cL7WBeL6u2o0Ft7QBTawpzUI/g==
X-Received: by 2002:a17:902:e841:b0:215:9470:7e82 with SMTP id d9443c01a7336-22103efebeemr3388145ad.4.1739556438806;
        Fri, 14 Feb 2025 10:07:18 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d051sm31599105ad.108.2025.02.14.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:07:18 -0800 (PST)
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
Subject: [PATCH v7 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Sat, 15 Feb 2025 02:06:54 +0800
Message-ID: <20250214180656.28599-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214180656.28599-1-mitltlatltl@gmail.com>
References: <20250214180656.28599-1-mitltlatltl@gmail.com>
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


