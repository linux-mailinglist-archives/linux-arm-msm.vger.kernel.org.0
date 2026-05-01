Return-Path: <linux-arm-msm+bounces-105476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMvwCy6y9GnVDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 16:01:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F314ACFCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 16:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56DCC3026C0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671AC3BF667;
	Fri,  1 May 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IDKmatDa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB73B8D4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643577; cv=none; b=UJLe6a28TGCo9IwFeCkBOhzm0u3qQ9ThqCV/jtMbxCWMcdUH9vWVY4Czpz48UeyjMexlTIzB8zXZkRXF1kQGn1v/nxIolTYJYx+ZCfGBLGbYZbvstviELjCiOEzkbxVkZKFcy8FgroblSVirpfczoIXDCP1b5KEfQLqK0NKgx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643577; c=relaxed/simple;
	bh=RTl7Y1O8e+RJXuxSn/M/jl/nMzqeTvQ7RKDRGde9pMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLKwZjjG5VGUVck/Cq9rkf1rSNt8mePcBx3B1p3VJ1FdUBzxwNvn36wfyW8aXmPKamy6PipziAU+VqmhBVeRAiQGDjTs/dF1yRYNtCHvR8GDPzThcFgeeovRAX25qMyCbfOFZLAP1kwZumVLngGBiYhucTwTgbQaleSl51qUy18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IDKmatDa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so1176161f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643574; x=1778248374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4a0NufHsK0XpXOY+2VZGRubm4xGOIO41KwE6sxp9fdQ=;
        b=IDKmatDa3BKv4dy9mgpNXGwdbFSzHZUVGHAqQX3DFrhMTJ9BSFtLN8SwcDC4ntaDU5
         MKpn0kX7E5nngg/gg6sSqcQw0nNHqZAsCU0Pf2+2pS3PU68GKDauuriraanrIroFAKl+
         mhlK5YqAGW9WxtqsnIgozoGe27r8FsCSXRFIO/0lCsCSqfWGLnWho5UsxViwf0EJEbVl
         RmaSzH1EFd7rl6RLq7Yna62JU/Zb1dxwIkuVmHc18KAA3TJ7iF1RLw2zl0dnaTYPNzCL
         5XXoZWMmFWggHLmq6laEKp21+tw9JD0DH3Ra2sNuNFOlHmbtoRa4YJ+EmCaSLrS64rCp
         StKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643574; x=1778248374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4a0NufHsK0XpXOY+2VZGRubm4xGOIO41KwE6sxp9fdQ=;
        b=Xao6qjG6eXjZPwjNFUIn9E0bo6syovTRzGI7COBNOxOgo+9+om93MiAXp7WsAp7mTY
         eTuxCciLgzC9ZWLSMO6WMnlISoPqiQE1ns/LzFLIA7MH+hl5t4RYSUx6OGe3xhCTSnie
         sgNpbS7Z1QSh9gD3tjjbYlKcu+J5oP6bmUc/xdTPuA5FpI2ZZi7mC55RSEuBlIaAUoy+
         lbibdF+Wi8rSQuAzVNUxWxtROcCL42VOYY7VRrwwrPe90fuR8hh6YenAQ0MYJwcibBIE
         EVXqZKj1lip+QqhNtKvgPI5Mdm1SDng5VXTF7ZipIy3oonoei/NpJp8FT06mMBaQtPJa
         nGAw==
X-Forwarded-Encrypted: i=1; AFNElJ9/qR0Hb4un5jgT0QkG18mTRWK1C9LIwHFkoHo7mIZ3JpG09JxnQuPYEirNxehbI+jQEFt2wIfbWkCt+X8e@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkyZE4/pwBMPVVB4aWqHt7SUTcwEMKhmwLUrj6e+aWOrhRAP4
	4zm70GHz/gERbqxy3dqN0yT2lBGqWV4DEEetETZGNs734mvZOSEL/JwY6luw3cphjPo=
X-Gm-Gg: AeBDievK8p6tPrtcJT4yBX9PVsybAPwee7znxSfyKoPCK3lvfZfZxURq/z+B3IP8W0c
	LV41HRpKhas8MllZBXaF2uCdda9Gxte00gsY/2IsZvUb8VdP7y6E76aFhWmRcea8VVlg2m9opAQ
	ChpJB/vkw5kfgKl1+AkJrm0xGdb3tUt/W9vAr61ArvZxL1HCXKwQh9IQwZRZXcCJyxhpCGmfUNh
	okdrnNefu75IPLsgjxQV2OdyBdBR4EeBPNXcldHfWJlP7ib6Ghrora56I1h10GokPZpYrO+MCS6
	ke2Lbkk2Ss2aAskpsVXDB7Vmj7sRmAeZ4qRiQNieRxKKd7bZ2j5eYR9hgIoGj3CaMsrVNxtc+CX
	mNuVn7ETJVH2cbXtOeF4tb0rTtPj302SnA4HYErkowpi/jZGu9KdM0ybrNJ9bJcOINY8iwBtyT5
	IPzsqrRczmSeOscSE4w+fPEB3KqkCPxecEKP3jUOE9gBJ8iuy8X4qFtreMJaDt2TGMsaawMSQhM
	OuyC034
X-Received: by 2002:a05:600c:698c:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48a8447b63amr127933675e9.23.1777643573958;
        Fri, 01 May 2026 06:52:53 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:45 +0200
Subject: [PATCH 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-1-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2217;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RTl7Y1O8e+RJXuxSn/M/jl/nMzqeTvQ7RKDRGde9pMk=;
 b=YFQI6GCHBOcdRW0vNjaOfwbl27MEuOcdgabIHkYmiIZtih2yy1DW7qHpPr0Pq0sQlyUKJURh5
 g7DyT2wAbuIClh+j4KMIB37E2sRxHmf+79I3mIe8y3lMfOkFVEP0dlw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 91F314ACFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105476-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[fairphone.com,quarantine];
	R_DKIM_ALLOW(0.00)[fairphone.com:s=fair];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.752];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..1c796599f6fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    contains:
+      const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
+  - port
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
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.54.0


