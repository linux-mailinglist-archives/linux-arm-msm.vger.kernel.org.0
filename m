Return-Path: <linux-arm-msm+bounces-93698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yE7/L8RjnGkoFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:27:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3290B177FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB2930AF595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E8F287246;
	Mon, 23 Feb 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB7KaY4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B928C037
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856655; cv=none; b=FbHtouvBCDA7AUBQdajSxgvZaRmeQBC6xkcq4Sib1qRfejivkmmEAPvr0EK4OuKV3pe8ljNfr6eBhUq6kHiaUsymWflYSsNvszu3h1M4bfPeo9hQgJLOnS9ymJo7vA7GVRTgZaF9ukWvTnQDCmdYpLQxKwgWj18eYAArMvDuWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856655; c=relaxed/simple;
	bh=V7fqUxwHPHnpclzLi48IhRpOeLBkH3gWfVtQ4pPChnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQAREU6E8lm9ukfAPEZbLRkSA84TeYjgVQ+SrWox3GJ6+FVLgztIbXWl3bUuyLnSqW99OJG4R/kwDVylkm+xHJICBJfKYRYv8wuprDCRwkqHUQaB6Qs0q4267mrYDX/HqHcnWZAQCkzbis5N9pKyJcRKyrX9jr94L1ftlnuha0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB7KaY4x; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48069a48629so45337065e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856653; x=1772461453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
        b=IB7KaY4xC9pa2OXcD6dE0fDzBLjuoHnMoUJrMHfaVEfip0P0fgmur92lA6p6pPAB/M
         ZOXniM5PL2QXsPlCDVIovCLlrE3RAuoxLVGorKuRBb4IKzNhK7s5tpSFjvI8EghM6Wro
         EdWc3iarv8Cn5EfhUwth1/HbMHRP8R5AMRHZX0uRqByV/Mc4XESTFfGIfmh3fsplqQCq
         Cncyl5eILItePU2ftm5LfjV0d7IhuCMpE2dcG3W5WRxJCBX/yb2trZ4tylJWOYh9nI8s
         TTldM3caFat5UlTNfgZ4/Tz2dmiod5FYijv0XPc5fAseYX802k1Dtyswqi5P1h21gyn0
         S/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856653; x=1772461453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
        b=QZKSSQCnpVl4eIfbPGkAuaRLqhN040Wa4vehgEIVz3NQzlvzSAYkA1wu6E8AN66YxV
         18OtdkVvJUrO0yj25QwWP83a8JovJf0mAXRQxDys7ZQFKwiO46DDEdSqRO3Faa2aqx0L
         grvEJ/BgimR6j4MAFddzeYJT36Iir0+eyFFG0sATah08o8s8/fPFJaKoOFiJKDhGSikG
         isBVX+xC55eDnwgUjvikaaUdkPUkJ94NjdcosteEzoJ8/GDIfg+TDbltFtAzyZwmAulo
         8pdGZWwLxSopSpGGzGPfRc53sbVJOtjIVZ+DsXpRd2SBG+zuF2hbg0j71Gr1iLmghgmI
         YadA==
X-Forwarded-Encrypted: i=1; AJvYcCUia9/X9X1xtoz4JthJGSgKVQ5hSNvhz2vZ8drzw4uzyJ6Pjc5CC3Mb04LqStupXuF7xjgHPREyNhHdescX@vger.kernel.org
X-Gm-Message-State: AOJu0YzmiJw2ByS4+bFgpRjktarIiuMOEIOprH3TutNxLOe3EOYQGbZp
	I5y9wHe5fJncL1Fjs0UbzmzqjXI+9cdKkB/Lf999XjeWHUNXrsvHsbXz
X-Gm-Gg: AZuq6aKtFA0v81ZhzdoyBJKN0hZL1+SZmq7d9I8t5f6AB+0eKxWpps+rOKsgiEZEjcn
	LMYVyoBJGXbZ+TEvEkkCxAtdEkQ4TgF80Mpsbkaef4Yls5nReJh15aGbceE3G5YT6Qc6iZt9FdC
	eAu2y4c4tIImA1UZQYbqLBrV8MCzGRuR7nZfHmFRlCWBNfmEt8g267G+LCRENeIBp0FEd3f5Wte
	TgsHKl3giOR84Mxa13zVT/M9jX80s4VNDyXNoWUgyv53R3bGy8/G975gAjDBSUnAXY5t+pQGWuS
	Jj9Nuil0p6roqLeij5aOqur28PRIGxV0sUzuR4QoRklEvR2N+1JAiUvwgmG4v5H9/Wxrf/XUmQf
	EbEmuqcovd+ey69TM5QqA6FD8le3Um3Q0kT362oheug12wSTNEtvvjJmqV+zBm+UvUw9J2VdzlD
	mMJxatvilYMh57oEahYV9/KLPezFKmVxeYKjUVxqxp33WWkFfIKzCeed88UUp4DXE=
X-Received: by 2002:a05:600c:3e05:b0:483:6fc6:1e20 with SMTP id 5b1f17b1804b1-483a95b5410mr153230345e9.9.1771856652458;
        Mon, 23 Feb 2026 06:24:12 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:24:12 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 16:24:02 +0200
Subject: [PATCH 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v1-1-7756209477f9@gmail.com>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
In-Reply-To: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=2810;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=V7fqUxwHPHnpclzLi48IhRpOeLBkH3gWfVtQ4pPChnA=;
 b=fhpsupwfISjwnsevZ8FXMVKuyp5OVx51389rFkscMCKeLRab4QAjsX/0UzAsG/ttvJZ2hmY7h
 7olplTnimlSAvMYFK235Tx3nXIkWlT8wpYniDss53zdUWUmF1RjWAfu
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
	TAGGED_FROM(0.00)[bounces-93698-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,ixit.cz:email,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,devicetree.org:url]
X-Rspamd-Queue-Id: 3290B177FC8
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


