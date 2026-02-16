Return-Path: <linux-arm-msm+bounces-92968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJP4Dwwok2kI2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:22:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F1144800
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 15:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FCD53001F97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 14:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6C3311C27;
	Mon, 16 Feb 2026 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUwMJhE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A63101BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251716; cv=none; b=ol7OW5tD6QpP+OUGEHBPwBH8zQIlSbZx48gu98dtLgmJxKb1gvCCMgI4ICuD/dCXHgRD6je3pDyHps3q3Rhx0ZofG8mS8fBeDia18aug+NbydNAwyzzY5JDzhMYNhfWT+kCAXMninG5PlMMAVBjxd3ccn01ahbd7IWnrISU1bww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251716; c=relaxed/simple;
	bh=K52g4ga2yw79eCXHygCVrwkICvYG5U0dxgjsIk3GGww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ii5lhP+yQCq2WHoW3paCdH3i/NMmtX9DLimdfZtjcAnxB5VhufnVVtwfbfkCqM+ug7m3eQ2TWPW+Hg2ndNC4vzRT83jJrTpBpmwX+3NEOQnDNl0JIaLgY697LSj7dTtnjlJoAjjZfDRrOi71vZNPJDrNIgVOr0natZfVe19N7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUwMJhE8; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48371119eacso29970495e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 06:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251713; x=1771856513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf39OMypbd2OZzaTG40QQZ37dkFwAr6bUYbA8Mqeigo=;
        b=mUwMJhE8kS+bxzJHkUQpwJ2b+s54uGNHhZkYlrHbJgQbY0QugewHk571bv4BoVzepd
         o2dmmcMLdx0oxZpY21VPLAx7edEvfsLuiNgP5FzkYX+weQXFvhmbXebESscXAG9j/zFN
         oFy8gaasvmTLwtpL7xhdWbLFU+zhlb0QUxxQpOjT/jUVsyAtXHqe6wZjJlq9M6W/OAEV
         I+v0gaQ65Vd5b+2516EG1GUz+RhupPRPrt633EqVaVrHb9cfP/OStjjWWktfCdzwyKH4
         Cnz9oHEteQpubw3q0WWPwImViZreayRHwOuWjblnYf4xz2M6yubYx6bf82TieZcxd3bN
         kaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251713; x=1771856513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lf39OMypbd2OZzaTG40QQZ37dkFwAr6bUYbA8Mqeigo=;
        b=JsA6lRxFmXxGlPT8YxlW21EVDLi7KrfQSJ81yrFF/xzCtFjHyI+4mN0d+BMsBIXueM
         qY76uww0oedGCQmsYR3HdmURE1sVimfxiCLbQZhhqxL54ayoIiBfSOgQSAcFkvx0sxRG
         i8vA5zv+AfhgAMzeWCnaqnAxSKoJKi4o/9Vsk73F1rQA7bRbD3TVDOXG6oGfof0gcdw9
         F/HSSl9QqFX107D9vzyUBEyhkUKyeispjaBWfvHomD+OibVzG/CoHwpY3VK5vthtG5X3
         aI8TskfL0w3MEXOP8lXIgCel89OkXBU8fJS2j3Sn5yD1zn0JoGFcYZxpQLMy5XOCJukC
         bsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZtefQppI/GiE9wi2atXANnyIj6Fp+YXmwsiyLT9gdFv8WRGl9WpsX4UKAbgQMrRy4Jbk+0QkEESuOUXgE@vger.kernel.org
X-Gm-Message-State: AOJu0YxkRBLVc90jqXEZG6VTKwCHDHROEkRH/ul2ibN3cavlDDIXp99B
	X13lvPgIK2Cm0ZzlPg0Mp5LXn+V75ldRGwtzZg/Q1cwXqQjptVUCMzEHI84bJQydIgA=
X-Gm-Gg: AZuq6aKY0M9Bs8ogDrxfnrazn2SmTswNVtIVEoFSG/6sdOH1HQosSghvB1/FHMzufln
	9cph9Ab7Sx7KfuoJ8hIxIFQQwhfMWPfj5cwSbzfy8cNVFPJpqj4JlDYeLsIyeXTLtpbBgbm3UQa
	DDNbICHHpHgtyIm2ng8lGRa22iDbh0ynzIVKLdSjN44JaBqZvObLIcT9ZyHVpyZ83sDnoKHP7DO
	b5pgxA+o6P7rU7YsdotNuALJLEPwTLtZ5/MW8IGOny6BLG4rneqjFXmgW67uS04ZceXabZ3G5aE
	aA1W0r3r53WyrkeFNH4n7rqWWjUJXmSLrbLYbinZt8UtYe8sZ/XN8IXz0YilRfkaDK9GFFeqv6H
	0QqqvIrYsSCCJTLRi7H//8HgmPCOcRXpHkfm+17LZXT7RXG3rzYS4921aoDMeAVweS4z8KArOrh
	0HE6Om+YjzUOKvP2dbXw8aMtDQUhYq3CIsM3Qfv9v6bmjy
X-Received: by 2002:a05:600c:348c:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-48373a5ba0dmr158418145e9.19.1771251712899;
        Mon, 16 Feb 2026 06:21:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:45 +0100
Subject: [PATCH v4 1/9] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-1-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=K52g4ga2yw79eCXHygCVrwkICvYG5U0dxgjsIk3GGww=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf6sQAlg/F7g2tr2IfRrZV7X4OKv0IkWw8a7hig
 y2ec8zeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn+gAKCRB33NvayMhJ0QeNEA
 CW8AEXMYzR2dPqJ3oq/9XQEhpaal97JNQmm5YqPW2b5FZwfBBnflm74bDM4pjZu+wNffYL5qXfC42k
 CwyNoK/2CLR2vTs5jj7RAzHbvjOpymTxn5HHdU4vzgDHwTCrvAhHqvFGhlZdH+mid54I2wZ2P3rKrN
 surlTiHkc9C5pmMinmkJx5M7pGYXuX5IfzWvOw4O+gNYK3SYYcDvTd89QrX+hwI+mXq40dkoYPEB9J
 JV7IK3K5FJEuEi/hpEyglwM3LNeWDcUKnL2pwdtC458uxaql0YvbucjjEvwH5S3rw2tDAY0i08u24e
 cL7Svp4nuXS5ee32oQR+1U2uel2qsQgfdLukPaxGDv64cMlJZ5tQfUJSMJ/I93ulODjTSsvjAXgV36
 aWOE77aHm60fs3SWkQF5Q26hig+RCpu3OA+lrYwfRT0WN/79hhoD52lYN7F8VtSRJ/9tp5j8rNNd88
 2W+X6VJSxgKmEYc9qwKMdeVPBLuVvQZIEXK03yTSN3InTk/2lEl2B/I5HyPHUq3OWld/D3u3J5oXhB
 3R5viMBoMkbp5Y+eVww8Sbj0/FmUML8Pbwh2Wp1fs3mx90MsXpytVzJ0OcoL28tVBl+RNYFy5uZTZR
 SfBiMAXfoXr7hhvCU5FbjJRYw2QCzXKOhexG+SFvejJwUG85XsjW+FkAlhug==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92968-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,devicetree.org:url]
X-Rspamd-Queue-Id: B13F1144800
X-Rspamd-Action: no action

Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
which connects over PCIe and requires specific power supplies to
start up.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/usb/renesas,upd720201-pci.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
new file mode 100644
index 000000000000..8b8be572c930
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
+  The UPD720202 supports up to two downstream ports, while UPD720201
+  supports up to four downstream USB 3.0 rev1.0 ports.
+
+properties:
+  compatible:
+    const: pci1912,0014
+
+  reg:
+    maxItems: 1
+
+  avdd33-supply:
+    description: +3.3 V power supply for analog circuit
+
+  vdd10-supply:
+    description: +1.05 V power supply
+
+  vdd33-supply:
+    description: +3.3 V power supply
+
+required:
+  - compatible
+  - reg
+  - avdd33-supply
+  - vdd10-supply
+  - vdd33-supply
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+additionalProperties: true
+
+examples:
+  - |
+    pcie@0 {
+        reg = <0x0 0x1000>;
+        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+
+        usb-controller@0 {
+            compatible = "pci1912,0014";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            avdd33-supply = <&avdd33_reg>;
+            vdd10-supply = <&vdd10_reg>;
+            vdd33-supply = <&vdd33_reg>;
+        };
+    };

-- 
2.34.1


