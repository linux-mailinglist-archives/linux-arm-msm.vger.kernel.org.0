Return-Path: <linux-arm-msm+bounces-47013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D5A2A459
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC84B160129
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD87227569;
	Thu,  6 Feb 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWUcAFpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638C226885
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834136; cv=none; b=fr11N/dvSbIDkOC+DEQYr2EN32WEdlkwOjyUIwO0wJ/J3wxB0J6DE5pSmpdc2afeVThvMrpwP9e338GS2nGoERVD7MR80FinegYL+5SOur+2mniJrENxbc7SxuNSaweblM3tJ2HQ9l4jlBalGq4Iwq2Kah5ZoibBWR5hnLoPaII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834136; c=relaxed/simple;
	bh=Db9IPgdr4UJWOwsXhdYPmkZw1aikVYI16CNr5fEdc4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tolb6DDSKVpubUYrJ6k6VWPkDr8abUhatKoojzoO1VbNyVWI1ujXmr1/eQWTrh8CFLKgdbRav5AIUQw5b7YBV1kt11AuDJD1cvBm4rSHUvk0Tv3Ypw9Yy1j/KWVexytfoznp6ESOQbe/yW7PVmwu20WM/P8oT+IFRAc9LB7WF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWUcAFpc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f664af5so7290865e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834133; x=1739438933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzToK54bOjPeV3UfdH7y51nzU66OyC9zy6SRX7dU9iw=;
        b=MWUcAFpcs8wKg4cbqnGfOf4SztGAOPz/yywVXlnzReOgpBW5Ef7CpPY9QXlyzyirO5
         +9kORaoYzvZmI4RpHtFFLCXpHKrAREkIw4NUB1GvU1phmo1cKgVWraMh0Z855WbCXdrf
         guhu6pfKBMC1mpFC338NESCQiphoEgZSi75z8W3DpHPbzc/BekKBm2JVeDKZ5fP0qSQb
         T4gwc38PyxIOMdb4cGxv9bDeeOscXcwQ/GLI/hV5l5ubjwx0H5RLML2XEI8dQoazVJys
         h1i0goYnSp8ugl6jiUR+efPpXOI6mYFdD23x89lvV7Vb+URbqlXR/+THPrLLIZqiUMvp
         9ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834133; x=1739438933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzToK54bOjPeV3UfdH7y51nzU66OyC9zy6SRX7dU9iw=;
        b=EEq1Uu+XEqekHSvcNMKZ7wvt2Z64/QFcgAk/krKwki4LB2VlER1+iRJW2FQju5agF0
         duu463C1EIgrxKs4aU976wWAelsBHQAnCbdOcPhsd/HaV84Zc/y8NRfius7EWNMoP2/Y
         qKBumZehSlfnE4Pi2o5IiKvfSv/VYP+5EaPejWHAMvgEWXwpilWXY2vufasJjK50dJrR
         6wXsy/vQhd4byaZ/Hv8rM+xTqB5hXEBdgvnPRLysfECKRZplGnJ4OH1H5+QpaMmdl6az
         aKWbxBUNOM12ugWyXauZPYh2LBd1zIceDeNMq+CC4VoWg4oSSKdVRO9rNmY+sfusDAqc
         pixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsPzNSOIc0z+a0rvXdUSy2wZKPJABKErIRKTdCV2YljOLtqIGSt0nKb727zjd57ExhVq1wwXr0Xze7JTbr@vger.kernel.org
X-Gm-Message-State: AOJu0YwALNmakvFJ0t+Lvu5+u5S06yvOC23CugUooV7gAjRUhyGupBk6
	yLi48sOMh2FZh3mIv2kZJ91uOd/n522LQ6Z319lG2mnQxcmnxJoPzkbYStEh/rY=
X-Gm-Gg: ASbGncudV1iKJWZH1VH3Q1I7zfqlbXWtm1s8zL7cbUqCP7ClBbpRkza4ygQL8t4GDwI
	3c4mUGWR76sWoJ3yCvLTnnQkAPjkkK/eQG7qZkcPHaBVgxlRpDbNsC+V+ViWazUUqiuFuHBEgb0
	plw/JNkauCNt/vEqF3ECXQhLOaci3emWbV0mfZx53ZM6XMyKN3xzHJ9uu3aczpqae+3A6ODdpL3
	S27t2vcczQBMw3e6HX8Lqj5bc4hlCuCVwLBkx9ykqMqSdM8zCGCGf+Ir4BcoAuuccfJYnjXwECV
	KElYBWH0K3J3KGc=
X-Google-Smtp-Source: AGHT+IFuYhJ+Ju0ijNjkb9eWYZDruzL2Fqhpqr3ONRHrmCvP1gmVM9H2XumsdjPxUTZe5FnQ44dcJw==
X-Received: by 2002:a05:600c:1d1e:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-4390d574e09mr44278925e9.28.1738834132769;
        Thu, 06 Feb 2025 01:28:52 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm12827595e9.22.2025.02.06.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 06 Feb 2025 11:28:27 +0200
Subject: [PATCH v6 1/2] dt-bindings: usb: Add Parade PS8830 Type-C retimer
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-x1e80100-ps8830-v6-1-60b1e49cfa8d@linaro.org>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
In-Reply-To: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4311; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Db9IPgdr4UJWOwsXhdYPmkZw1aikVYI16CNr5fEdc4I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnpIDNSlpPXk2EZaPRtkRF/1eHuIyT2DCN08axW
 OZrFAMzcU2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6SAzQAKCRAbX0TJAJUV
 VgbcD/wK33HW+gYCYdq1Mk4SAy9kJIhLfAP+k7pSCiAj9M1VF/6ZFpx5TQF1WJ8nkklJkYXKqTI
 Tml2BvrcPVWYVxknC9itOyxR+sUX+HZrUrZ6iS6xMZUU8B0snYwcW0DgWt5mQ+u6k9h8Il892w7
 nztR+Gyac5i/VPpK/Ub+Q2HsTqJaFgL2MQTPoeIpP164U7Cm3skIIJBBqlYr4GDBkVkGqyp1wCt
 fzVBdKRJ647L20lNaNL9PpwNkdd5A+q4SwwbDr48keQDIO7HEo4/8+orH9HEElMQPPkfm9J72mi
 5SLiv6M/dJsEwW3egwXw4HnyiOD8aEW9T2tWyjguFfIef1FQc4K8DdlLi8tDoLVIDt+DeinqCJv
 iS36ywyE1XiG33sapg+UOrIRxJM+zMZvaK5dMk7qJBkmKA3C+jtdSD1uZ6DwyA/s/pRZu1pp11k
 GtRY+2lAP+68PmhstRv8G+bn/tkFFGwIPlGZMvfoEFU0P6R4cZOJNw9dMHph0OoENxLYHOscoKe
 sd0k3T6DuHR6BuXmONtaNgbtd4CwPmP4CsZu4jKzWSqzA5QdcYmqalVK+JW4npTLnwJ7pAOi3PE
 QAU7rdc1sNMYU3vp2/UGeuthqqnhub2dZV/epc4RmKGhcpl1WBF+GJU/duTC7Zxh1V0oHwBOixJ
 daJoE/gH+vu+cNA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
controlled over I2C. It usually sits between a USB/DisplayPort PHY and the
Type-C connector, and provides orientation and altmode handling.

Currently, it is found on all boards featuring the Qualcomm Snapdragon
X Elite SoCs.

Document bindings for its new driver. Future-proof the schema for the
PS8833 variant, which seems to be similar to PS8830.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/usb/parade,ps8830.yaml     | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..935d57f5d26fe597308f1200ace9559255bad1e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps8830.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS883x USB and DisplayPort Retimer
+
+maintainers:
+  - Abel Vesa <abel.vesa@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - parade,ps8830
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO Clock
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: power supply (1.07V)
+
+  vdd33-supply:
+    description: power supply (3.3V)
+
+  vdd33-cap-supply:
+    description: power supply (3.3V)
+
+  vddar-supply:
+    description: power supply (1.07V)
+
+  vddat-supply:
+    description: power supply (1.07V)
+
+  vddio-supply:
+    description: power supply (1.2V or 1.8V)
+
+  orientation-switch: true
+  retimer-switch: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - reset-gpios
+  - vdd-supply
+  - vdd33-supply
+  - vdd33-cap-supply
+  - vddat-supply
+  - vddio-supply
+  - orientation-switch
+  - retimer-switch
+
+allOf:
+  - $ref: usb-switch.yaml#
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
+        typec-mux@8 {
+            compatible = "parade,ps8830";
+            reg = <0x8>;
+
+            clocks = <&clk_rtmr_xo>;
+
+            vdd-supply = <&vreg_rtmr_1p15>;
+            vdd33-supply = <&vreg_rtmr_3p3>;
+            vdd33-cap-supply = <&vreg_rtmr_3p3>;
+            vddar-supply = <&vreg_rtmr_1p15>;
+            vddat-supply = <&vreg_rtmr_1p15>;
+            vddio-supply = <&vreg_rtmr_1p8>;
+
+            reset-gpios = <&tlmm 10 GPIO_ACTIVE_LOW>;
+
+            retimer-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&typec_dp_aux>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.34.1


