Return-Path: <linux-arm-msm+bounces-97195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDxLBv6psmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:56:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA22715B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56C6F30F8415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C9D382F26;
	Thu, 12 Mar 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOKTGBUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819B38C2BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316518; cv=none; b=LFcNa2MKGJdzqNwL9LOcuAjzUrr32WJ4V8XpFGREFcFLdXRImAhA6A0MKggyGhUUxjeLATWu3wrBI3YtYEDQzRtzPkRrjT4GjqBBZAWJyIfqJjOTm9UB/Jljbj4uURYOHUjyztpxRTiHM0YYYGZwjJIXIILaexRE+CALJ30V9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316518; c=relaxed/simple;
	bh=uByAyEgww3agiRACJzADzQxPrUayRMLsCPUXIA0Shko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCVU11mrwhMiqItFbeMrza6AsKIYi4Wd8LhkIP6/H9/e4EpnBjNFVWvwbxuXecLoJTaO4Oc3BODoPcCS+BuW4ksR06JW/PJWnpG6hJRuUGU2m6+QdX3+3b3zc4TA3dAJbk5MVpFwjKBCiX1Kcnmcoe/VhPoyayx6KeKIxo/BVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOKTGBUX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b9b190easo687256f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316515; x=1773921315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVqRQazqZj73V1QdHVCmtLSa+TH69dLCr3cJ3xiZ210=;
        b=mOKTGBUXcLVR/KV9n0oCvlIxcLFCW+76/NOpeZb3EPaZHlynnEBJNEq3K+ar4+B/2h
         XcarNjHzW4gu8Lp8K2CisLfOWqhglPli5UbPzrROLgEStIvWjIigvbjMzjdeyeZmxAYJ
         reGmpLlfISnmoC8Pumrb6vkMht/hXCeCDbNYizXmhgdiLxrwxOspjIuS4z9RfCFr2w08
         i5FElY6d9Glfi7gOYkF3HF7gtGTylIA8R7k3SfuFdXNXqyei64eTI3hwCFwTl+xmz0C/
         vhWgPM4eS+uxHTRee8rXui2BKhAa4AdkCpx1SdRl5SUfQDsXgtKsB4m2xLlnzHCjmsny
         3Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316515; x=1773921315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVqRQazqZj73V1QdHVCmtLSa+TH69dLCr3cJ3xiZ210=;
        b=YfgLrMFErRjV4RiuANvtvEyDktbxo5RJZd0K5ilO/E6414Lxdgk4hq/PMDQY/xHZx9
         6q9ytOcyonkOOGRWOnkOSISBK4Ss80KvnMOtrDiZGZPuoC/Kb3DIcJ4A7Wn9VwBd0lG+
         OPlxvVCgREqaB0Vl/MYUrHM9j8J5AZ7pYsXZCEN46UZCPnA4rd3jjFhzmOkeJJYvEMVN
         K1L4wnYKz8NQP0dcTgoYI3l4WxQvJ1KE86lMxJ8xHFeKbvvCKzJLHL+K8SzEEgqJjHU7
         rSxHoH7eRRWJGwNTLal2GbRyCiiRPTLIm3DlJjyyrKMrf0ja2V3+jQk9IN9jFOHY4T8z
         1bOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJgztJhtvfLv5n2Knc872i81gNlfemwM5zh/lKRGrCrfYjcdE2lgGyPrJB7pX6KQLiK+hBUO5KY9VaU8nk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxi8PPo+Wasc/RITY+jUDO0GdZIppJzWzpvR6mZRMRaEf/k9UC
	a7bMY1I5O+mgisaLxXI8UTuA5QAMVzpZf3wInFbrJiL64e0wvT21mFM2
X-Gm-Gg: ATEYQzxwJO6dTMVS+RbYVGjUvK5/z/4XlOlXhIaaBRcE4QPvkYwSNfN2Z/om9IoeHN+
	40zLTKuJ0vVQvjeAUHBgF3Bu5BtPrQmExcKRzpxE7GOXf6mzMsnvbDNl0mkCFUFeQh0KCy4XucI
	Y/HtySPeIRGwv5hoGgOSLAs415zmw/wqsY+yD4jnQZGW1o8/Bux6dKbQ2CJhOWHmlyofxTycwfw
	NhM7G9RqKhfBfyj/z73fd2dcqhmlSikQ/2UwC9jQ7ov0NrIkuau7fTYPeCAg0ha8A8fSkuOfnxK
	avCJ01fEa+tc5X8hkb9MZ1oEN1mPXF0jX5I/daudvM4EFhyYQ201ch0iPT+vI615xUXSV1CERmi
	dnwHU6NcHBHPgnF9kyPb36L54lYjfd1WlNwQiFIdGaJKU0gPMJ11u+NbHviz5GRxF5ceEBGskAc
	pD3cn/KG0JkcSIY9TPSf/+VvRQdgWXY90FTNctI3dGXS6k77Th8eEr7U31zcG9SWfvuWVTAIe9M
	A==
X-Received: by 2002:a05:6000:2404:b0:439:aa1d:be0d with SMTP id ffacd0b85a97d-439f843c5e0mr11750141f8f.50.1773316514846;
        Thu, 12 Mar 2026 04:55:14 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:14 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 13:55:08 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FCO-M1906F9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-panel-patches-v3-1-6ed8c006d0be@gmail.com>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
In-Reply-To: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
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
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=2891;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=uByAyEgww3agiRACJzADzQxPrUayRMLsCPUXIA0Shko=;
 b=VQU7g4QQ/Atsa34lKMyddc/HL+xKZzUSD6FVv6UFY6eEteEgcM249RuupxeJgVzwWBq0hOR3G
 ZFbRjiEeqEOAlVsljXTbxBNbbJUlE6cBR9WrBqWuPNJ8LKKBe4Kct86
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,protonmail.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ixit.cz:email]
X-Rspamd-Queue-Id: 71BA22715B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Samsung S6E8FCO DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../display/panel/samsung,s6e8fco-m1906f9.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..927d170793dcd49c19ebe353268980710ad4b5b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco-m1906f9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8FCO DSI for the Samsung M1906F9 AMOLED Panel
+
+maintainers:
+  - Yedaya Katsman <yedaya.ka@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8fco-m1906f9
+
+  reg:
+    maxItems: 1
+
+  vddi-supply:
+    description: VDDI regulator
+  vci-supply:
+    description: VCI regulator
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vci-supply
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
+            compatible = "samsung,s6e8fco-m1906f9";
+            reg = <0>;
+
+            vddi-supply = <&panel_vddi_1p8>;
+            vci-supply = <&panel_vci_3p0>;
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
index e087673237636268346979ddc270f8cf0905c722..d7aee8dab903cd42c245fea3cf8971dcd99b2196 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>

-- 
2.53.0


