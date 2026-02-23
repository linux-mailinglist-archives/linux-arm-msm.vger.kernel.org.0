Return-Path: <linux-arm-msm+bounces-93810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKFaJyO4nGkqKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:27:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6817CE3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37F6630D0249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2588377559;
	Mon, 23 Feb 2026 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCR2Qpqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9B377561
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878408; cv=none; b=KbCDc4SjcWeg6hntFvF7FR9PjhsNQbN/rbJBEpp7pDkqHT7CkWlNtIUsBH3XtuNEtcIIfhFDKHP7rqCBoKPfs9wkA4eECr3hGb6Ug4P5XkozdO+cC4FT22MBb0ALv6yiOz+oj9E7dXM3GxqKykjBdOH0zqKOLboQ999Sk+QZ3iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878408; c=relaxed/simple;
	bh=V7fqUxwHPHnpclzLi48IhRpOeLBkH3gWfVtQ4pPChnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IqwXFIZFTJdHhYn8r+O6v28S9uI8s7NxLgrgwiyYJEr3+9NTWFxpZ5Cb1JLN9r8Pk//Y7QMXWFwK01h7D8k2xFDnSKieYirPT8M96aJvU8SL75aAj5MuNGu34ckxMao5arXIrFH2wrSdKXDZLO2664P6eRfDqb1llCKW0cUSXlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCR2Qpqg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso38396605e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771878405; x=1772483205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
        b=mCR2QpqgX/9NubaPgZ9WbsauhYRdSMBrzJJBIiE1HsiOCOGBxUfvmKXMQlZFDeJOGA
         C8odO1sBXru5lVnpFefIO2af+1HN0+Hypy5cxM3eWvMcSn5GGkLY3J4ByvrdLCrp3uxB
         IPS/ds5ocuiIsQ8wcGcfYC0lyNX9AiWzj2G1R9Psv8XS2kjQ4IQG1QYKlZkeVqrpuWUI
         oEXAE7LnXMWishydiyyR1aUqmhUNsX8ZKYInFE1V3aa57OIYcye93y03lwgFYsYf1jZ4
         2Gux5azgmaW2pgK2GOO3Sf6dF2wRjQp3BpUP3IkGYiuxsZKHWeru1QM4ux2U4c4Imqsv
         ixPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771878405; x=1772483205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
        b=ZxDh/A8O/2ICAsqWtzqFgyhBTjol4AN5HbpPzROb6U7kjiZr/S6YKNWZ99H2gdIDBf
         /qUhdPXU2CIwhOo7gikVfTdcJZZoiyDqMEB4ACxk7HaPhycBs0Ey9in0SqPGihbct1nl
         QJNIdGNS8ZYr1fuPL4uCKwwNwHsSBG+ZHIzS85CoA7AoXeE/TOc5vh8ZHyGqR1RZakcU
         ubFx55GlDIKfYyevUoFnDt7tEALa7dWIHq3+UcYiKNjYgTJuiQKdRgBAFqN4dcWk2r+5
         tAaE3+6sx1C+5hIHRM4Z8kMQwoO6c6BRTpyaDlbfp8nOOMMb034koWg3DzFUZRDd4Yx5
         O9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo/y4KSo6ObpJdXfXupzQdZ55LXy6W6BHqTjolWjOHr1O9mHyhRSFkOrSRXy6IaHM4tpFF6J7/2OrxhHzq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw29bsDP0YgJ8zR4L6WWrkH0moWFfypdRn7MV4+ds93h89eOk/1
	aKp+JcgNvbrIajUhwb/DG6F+zmlTZ+m2hvamgmFL89b/iW+MA8lSRkdO
X-Gm-Gg: ATEYQzyKVMwqW1JNmd8logVPX2qwXVvbfKz3n4e7vvK0ddW3uNMV6mgolqWUWOijemn
	SI7AgtEv9TOUdSo5OisQjXwlTucfwAFFEQVrl2ejymMPE4FizRkughhjAJ5SY4DmcFpApNqFFtK
	Ikkgj9Ac102F5/XmPj3fiLF9ei7q0jmecDZhJGBYU4Ql1HfbYln+1eCnFv6BaJdVVn6MWAIwPl9
	7ICjuBEFaVGPEwnTFvGpQtD42pNvTr4vSxjYuh+xiaQC7jIKgmS1X5MwDkkl92tg5pCww4U3g5c
	SCDt82u4ERNeZX6OxIe9BLKkwDCGlwebQrZRGe+8YFf0fdDGy0kNhJwnR95rtQXXZgsGc2mZ4f8
	x8cgI83cw8txEIE4sZm/EipQh4SmYOB6zrkvHxyBw1OWp8jxK7CdHOmDVXgJALg3hzSQR4rpRX4
	F6/FKUJESgMiYzO2ktAsLYhkv5dMWUUhkgPSbIGHRr7gNZbI/UEYTFqXf2YnHbo7s=
X-Received: by 2002:a05:6000:2004:b0:437:6c07:998f with SMTP id ffacd0b85a97d-4396f1812a0mr18928065f8f.45.1771878405247;
        Mon, 23 Feb 2026 12:26:45 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:26:44 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:26:20 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=2810;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=V7fqUxwHPHnpclzLi48IhRpOeLBkH3gWfVtQ4pPChnA=;
 b=CkxTItGSw02vnP3BgtaVJvQ2rlHgubEMYaZKNbuiwz6iA/OQZlH0fTnnql52+Pl+7wtgAgeLN
 TRBcEu/AcxoBOShrpzZ4yqizrtoi8Kp/TG0itJDVeQTbxYrnNZAmCCF
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93810-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,ixit.cz:email,linaro.org:email]
X-Rspamd-Queue-Id: 28E6817CE3D
X-Rspamd-Action: no action

Document Samsung S6E8FCO 6.09" 720x1560 panel
found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../bindings/display/panel/samsung,s6e8fco.yaml    | 64 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8c042ce5f65bf317df48e109d88ebdc87ef5d5ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8FCO AMOLED Panel
+
+maintainers:
+  - Yedaya Katsman <yedaya.ka@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8fco
+
+  reg:
+    maxItems: 1
+
+  vddio-supply: true
+  ldo-supply: true
+  iovcc-supply: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - ldo-supply
+  - iovcc-supply
+  - port
+  - reset-gpios
+
+additionalProperties: false
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
+            compatible = "samsung,s6e8fco";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l9a>;
+            ldo-supply = <&panel_ldo_supply>;
+            iovcc-supply = <&panel_iovcc_supply>;
+
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..545d4cf68b9ac27765c7981e668e32cfecf3366b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>

-- 
2.53.0


