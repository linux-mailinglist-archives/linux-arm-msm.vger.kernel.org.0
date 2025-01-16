Return-Path: <linux-arm-msm+bounces-45261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C7A138B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EDF1162662
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727A11DE4C9;
	Thu, 16 Jan 2025 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCXelOeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD251DE3CB;
	Thu, 16 Jan 2025 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026254; cv=none; b=T/0ZtNJ0mTPle0Fl9YExSdIRBE44b9p7pvc16MJvNL7Nxj/KCQolKf+894o7J+zrwdY4YfQCbz3y3XtvzEJYxONq44ryPMSQ5vj+5wse3WneJVJzNPV5EnUJzkG8evUKc5iEd4eEb7wq4c+ZxJ/2Z2NP8gPCTXcan1Cwldeb6sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026254; c=relaxed/simple;
	bh=aS2et3sdTcDv6c0Pc/Jkbrw2ogfMwC7cpOQktzXYM0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmyLAqRUUDjjvmisLZYqDCghE6SoxBs93eY7Pz+N8BGb4S8QWaRCgQ/8jfo4OuQE3NcO/mI9byiKkd/CRzOwmk/952R5xbn425Nkb5TKqkHV8Wk0Hy+Kbdo589GcNDHpmeuHq85CYzPMwxzks0db8xzt+m3Gm1UEbbgqPqteVBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCXelOeI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216281bc30fso17665825ad.0;
        Thu, 16 Jan 2025 03:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737026252; x=1737631052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=OCXelOeI/DGyOGA9NRsqlbWDLKjb8T+1JwuKcwRLEkt1Gk0NDEuo26DX4aDk5Mw5ep
         dT3/Bp0MZ+lucwyzRiDenSbiZFawMRxD3V7hGBTBirG198MVh0BcqoPgRO/VPBjAKVaP
         je5FYvFF+tdOChqHCjk0CdktsCp+MzZ4AojbmYsMsqqOxkWU8uaPf8mnvPaCZoOMp3Dw
         eMzXdI1r1cSieHZWsguZZ52qnJMNJyFvSCBuW5FwR+jZGtP5DfgmuH7aUOxwd9AgKhSJ
         RoycN3XYOo0kjugpY4kly11PfkspKtu9U5Jv+JI9Om0/OAewdJmuUQQCV/fCM1+H0oAt
         X3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737026252; x=1737631052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfkth+47eeKTd8VKQPOUJFH4ytd9GsqpmcPtCYPL/YY=;
        b=hYRJxwy7hOdkfc+9edccKmtNd2qiEUP2WeBBONGm6EE0WRO3koGBCa1uVPeJvNNzaT
         zc3xNdvAcT4uI5ZADwNbCnirEz88dk89mnHMGbDv297LwGX6qjgifx9dhxFf8AZzfNCp
         ntMVAitOOJmjFPk4iCFbAYnU1DX3YECSk++QNkhESC/9QBYetWmHqohVOQSjnxeR7y05
         OQr0oQevBBEs1TBem3pOPoWmIR9Lu8myQsfhPrzH4iiWvs5y4zY2bbktiPsIImOK1qZ7
         LFYge+NM9uqY3TQD7vrYj3CgLDbh0vfEfHe4qF5108Eil1bF9ZwSE/1COKVQL39V3Gsr
         Fiig==
X-Forwarded-Encrypted: i=1; AJvYcCU7MyLHnkur2aAW6O2RS1EkpIW7SedrZQCShGgmZsrEitSd+nb2KoJbNEtICTNVA5IGIPNsymR83FTQOAYG@vger.kernel.org, AJvYcCVGMaUCJ+JK7L83/khsquNpPOKPcfszNPKIwcfPfgApH0P1Wk3Ltq4zYF5NSrMNLAgLR9H8bP47qy1ygqbBw+Q0SByPVA==@vger.kernel.org, AJvYcCVTaY2zPVmHzCwafcQHt/4VSPn4WdUvmte1GVjw8yhg8spFsmVtimM30MnoPJBKlxVKRuxHPOHpAWExjzPy@vger.kernel.org, AJvYcCXzcZnrHQVldrlWKCw6qqimmT+eZKDcKdVOaD+F7Sqbi01SQVwDdyVJlZsqnPQsrEcN0D9t9wFpSW4jsdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPq8iv62FFoRn4Z1aSeiycx9FbDxv30+Y83zvL6GDtxedGMa0A
	dDyT0YfZ5XWv/RWNYzAANgRcGXvYek2/y/i86MUNJL+gR2FxOe58
X-Gm-Gg: ASbGncutGiQ1LjI/eZmqZjvhGvZG1tIX1GcvlgxLV15fneA/PBCNUchC/jdm+wEZ9Z2
	YDSy2dXh338In9J45z85mUVLDiSIp0XgvA8rPAIj9vgZJ7JQjEoelV8BgN7lyc8XXp0I9aLfGny
	l0OAG/DdOmMvJVrKBDXfjBFb+qUt5JvhhwdCrowt3AoHZW+JCPXTVhUAQmLMJl0XWyECGzo9DnE
	hcKwEmOzL7sxYNE3OiYUC0GrXgq0v4/mOe5L4oLKjhoT5pODuPnvZU=
X-Google-Smtp-Source: AGHT+IFkO+4yOHKMxGjxnvOKq4qXgW0u2cYPscPBOzWKiIpmH7tgw0xJstuKYdLhxwq1c9LaB9zMhQ==
X-Received: by 2002:a17:903:2301:b0:211:3275:3fe with SMTP id d9443c01a7336-21a83f5243cmr283451195ad.17.1737026251932;
        Thu, 16 Jan 2025 03:17:31 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c156b9esm3091585a91.4.2025.01.16.03.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:17:31 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: platform: Add Huawei Matebook E Go EC
Date: Thu, 16 Jan 2025 19:15:57 +0800
Message-ID: <20250116111559.83641-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250116111559.83641-1-mitltlatltl@gmail.com>
References: <20250116111559.83641-1-mitltlatltl@gmail.com>
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


