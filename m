Return-Path: <linux-arm-msm+bounces-75682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCF0BB099A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 16:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD6C2174594
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 14:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7382F30275A;
	Wed,  1 Oct 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwhFhsDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040D301719
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327269; cv=none; b=E4M9Vq2+ZnDwT4+UAL9MCJHqZzTpPpLMzS7GWDGn5x6ryfdUWLJRgbEuf6EdCaX0xfxd+JfWdeZ2f+U0dY7bMSXGGbfJztuo+dBAT6JOacLvXVCFwAWeIIxkEvNgpNbbLi5pqYe1Zq/0n6dVN6SoLUeqtxpUfz6vu+lklpchJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327269; c=relaxed/simple;
	bh=hfGk7uQVjLThG3ECHgakMM62Hu2CceaDtMXfIaJebeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HL4ULLzw7JB8x5kTVw/q//FutISmIM+nQKTaVoxPSfc3rPnhD1amk4Q0D/nMqcvE5hQP9Z1/bN8jh08qMjhgMFvU199WKneO9OHNHd9jcAaX02VN5/isulOU7lL3oNR/6f0OcLRz2QDIoypiHOlbdhWDosOS3xEamY4rmWGowmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwhFhsDY; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-41174604d88so3780070f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759327265; x=1759932065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fsszsfqn6nKhuQ5ZGb0FQ/doPY/Ih/TU5I38riDkDPQ=;
        b=AwhFhsDY3JE1nCeRaJAIyzSDW63Nn4YFOdHobpmO0CU/DPyyTxysRzPzdabLgRNVy/
         oNR8NhgCC4YNJhbG6AJViizCULdW5qtPo2pqyg1vFTYzDD4PmRM9ptwg2ob4W14Eg51+
         0mN+X4Vimxnqm0fvtXxBGU+S2zvSyZiY66o/llf1qaplUxTMWGz2fu71bIV7F59s88zg
         /3k4oBhS8ao1Va22jZ5f+jvUMz3HqhCn8B2YuQcEKaeGOkwBsbsHLHIPO1GNNR8k1xlE
         4GGw85VCiG48elOOpMDh70l72k7Flq8LwK7OPLzh1tAVoXw22rLaNJIimNLwZdIEfHG/
         HTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327265; x=1759932065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fsszsfqn6nKhuQ5ZGb0FQ/doPY/Ih/TU5I38riDkDPQ=;
        b=WVfSlkUKSt+xrZY1DHqKWiSy8EWr4TO8mFiyn+BV2dfttjtT/GRVX/MiCRAMRm6kFz
         qrCNafUGO57b1lHJkZu9hkycMNuuvvH5GdTx0anIMtkWag59ykldHmRZcXD1Ly/BuP2O
         ipGTUpW2FL7tTVD8u6AMfn3dyqg1NUwOElGuoFzmr4B5hK3lWhgh5kkw0fS7Yj9PiR8F
         j51giP6sEOOVMUKcGNh6tjRdnf3MGOQFMR7O2m1gqUX1SdXC0fwALZ/MigPzWfrhtPpN
         WpdlWmgp3oJ8srUkzpMXpVO/k/ZE1xDsPYJc09s4aCfYIDcSrm9w0x4RvSju3rSwUtEn
         u5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUxZd3R4QMulXxrlt8Ov4xacGMg8HWt0SlDtuKlYWd7thRSuFEJTdkVNJJ1L2QAzbRSJR1FN7ufoRiwkQFb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0gCSGDpSyUzTI3BPZVDHewh7S1Y2mHjCrRyPmBVinQGnTeZEv
	cKilGltgWuYGHHlztFuuaLaElt6b0AB1xojn6kud1xRkCGprmDESUx6X
X-Gm-Gg: ASbGncv7yAN8lp5HyBQee+zv5azQJs4OxcW+4Haw0Cx/qExW9iCLAFiXVD0/4FvdutU
	0RHjNiO+esJwfIFcvCbX/5R1rFFQKPF24utsOoLeIdMfatvHCz49Dq+w+Ptm/Wpa0GKz//R+e80
	tMRF4WRhPAa45hksSM0REpgN/yAYE/WCC3XwU3ffTviTl06FruUcPd+8TZLylbZB0aPO531JB42
	lTjlbkn1d3AZFxgP4uL3ADqBoVWpPTmwM9cPMNU/EgBZUHhlgig49QzEjQKyY7kY35oGP763zKX
	FNS6F7GuPfFp3Gy8eCIRg4JY2MJin8GY5G6x+hpjAA/52dqLXaIlj4wFWKq6/HC5PN1RzjycaHb
	zmmZd4Y/ijXXso8b9d3RsMT877L2I9MusptkB22P+niCAYV7TXkcyXt5PJ0beoz9GxgbsNLtZrJ
	OLIfV7zwz2QLnFnO16oyp4xTNkcqf6yjYkHrzjAfc1nLaztMrs4vFCxg==
X-Google-Smtp-Source: AGHT+IGfdA3CFMOqzDfdHGv3iprZDyUerHzmhklMNsvWYGm9CmujeeYnsM2kSToIaaRJkR9fFhfaSg==
X-Received: by 2002:a05:6000:18a7:b0:3ee:154e:4f9 with SMTP id ffacd0b85a97d-425577f31e3mr2814568f8f.20.1759327264519;
        Wed, 01 Oct 2025 07:01:04 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:01:04 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: display: panel: Add Novatek NT36532
Date: Wed,  1 Oct 2025 21:59:12 +0800
Message-ID: <20251001135914.13754-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NT36532 is a driver IC used to drive MIPI-DSI panels. It is found
in OnePlus Pad 2 tablets with CSOT panels.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 .../display/panel/novatek,nt36532.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
new file mode 100644
index 000000000000..ca4b16459a72
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36532.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36532 based DSI display Panels
+
+maintainers:
+  - Junjie Cao <caojunjie650@gmail.com>
+
+description: |
+  The NT36532 IC from Novatek is a Driver IC used to drive MIPI-DSI panels.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - csot,ppc100hb1-1
+      - const: novatek,nt36532
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA
+
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "csot,ppc100hb1-1", "novatek,nt36532";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1


