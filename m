Return-Path: <linux-arm-msm+bounces-111291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SgziN8YiImrVSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:13:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 608676444EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 03:13:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=VBA0oiYL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111291-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111291-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 810DF310FC61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 01:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C21D3B0AF5;
	Fri,  5 Jun 2026 01:01:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C613644BE
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 01:01:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621286; cv=none; b=UuGHuRJCGyDPU/eVWGy0+shzw36U96XtMOgkZqr5rTE1GSXL9SXdBD43/+HHjGcFj/JPSVO03XTBP6vwr6mgIEbU/bb+bnHt8UVhuN1gkEOvVLLZbazRFzKjGywTOTYUu818mGqwMoboId2Vnq8GOX4Whh/bOXS73d1kM50You0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621286; c=relaxed/simple;
	bh=Q/ZNVyWH5+7aUXeLq9mlW50Vwgq0fqg1xk8VkFefUX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okRBhtGNC61VodgBmAbYDUzARZB4OMXAlnyhhQ1gtyH5VrH8tptHotbQeoa4QgkMC9/Kwvm+dy2VPKiYJm98yM04W+R740BJL1Uc4EYKDZeUh5gRQA0rIkPazwxMrYLFNbFPiKwj1fBpp8f/fZ+9RDg5eLCfyANW8vSKLzZhB+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=VBA0oiYL; arc=none smtp.client-ip=209.85.167.177
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-485ecc0f2dfso1164249b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 18:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621260; x=1781226060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
        b=VBA0oiYLEp5RT1MN3a1hVsJ8aRjH4SnEjm8N5ALMhxnEZFGvXRgXW34Zan/sKl+2x5
         deTqZHtZXgnm2dOSmEAm+PTuNrLpnF1OsuLx6ixjUnOyTcyesBZe5KEwogK+OY9HEu66
         rVMgEtkStXsK3Pj5d3ODn57cpdsvFOgeritiO7eAdpEbwCcRelRrDh38Av2IqceiEWlf
         594CitBmTaWgZU0eG+zjXP9rq9k++r7nyvZo3wJMZ3VfKBGJr/8Yn5uksoGqC/0LZcun
         PeQsD6SW9F3FTfxRr2T7e/Bo6u7mP9nOo1jfT+QxRPIk6VL7pqNDdqEVS5yk7//ZAhMQ
         9g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621260; x=1781226060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZIGHz/o3y+3ogj7r6nfssUl4myckUIIzkFFbrT9qoc=;
        b=Kmqh/i5DZhukPmiYvOzrTiCVAT5lfudiFLZocCY74Pc+T15/MeC6T5TZhN0H0b981f
         t4y4OERau0+/WdKrthJFgK/RcLIHyn5jcdbuwy0yV/G1B+M7O1JL3Kjdp7vw+w4sssj8
         VR3Yja8dLE/FcYNSdXRbCeDH6jMpmnK69bQDVgFqgwRlox4hFkpxvFysAbQ/N7rAH4Es
         Bg4x53PMWnEEu9sP0DwXaZliyiHDErFe1CJxnqmilyU4hIWVAF7sHlmIcRpm1ytK6RCh
         fJnKR6FUSCZcQAXwBEXp09sHCGQcnaY1hM6oZhpqAM2fn3abiPL/UTZPg4VXSCWAjV3j
         EFMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MSw30qMAdZusuGsrxreMTsQ0rEe61Z7l5QKWHbh6dsO/D+JF6TIK3B4pDVYBKF8oL04XKQjA3JGCXcOhk@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiMWgalelF+3eeD1ePE9ZVVqurtsFwQkq1Dr92/hZHMygdYoh
	tvi223OBXLcRqdBCmwF/l8dCm32aj4okoV0JmPWtCid0SyTzHhyQtr3ssT6pyjUCrdE=
X-Gm-Gg: Acq92OHkklrDaeC0fbKJmFDbs4cakYTg/zior+gkG3dfYE5FKCtRdxPfo++yGH4MDmP
	TU1ZktmtsJCSAaUcktUt9GvTywgARyPwncRruQDkObSuYCrMVphLFcYaJWTLO/myv9C0Yqnh+oO
	NheiS7hbDo+EM/3fv7NnhmRLSjhUcY1gPNBG2oGSbmhJXPbZOQMD6igh3+uXFXLbroHtFPTZI5t
	x6o27NToO3s+DKvrx8itzhyL2wsiaIXnivcJkwKXzcnjZbcBY14+r4g7vO9iv5R9B4lwufkUZQX
	0taJhnRQxQK0baXP4dNcXd5a9LLHsdljma8afV9kwjeZdYMbrDuSbZ+cKLIPOvBIMLhY4GQWzuO
	RhzFKFXhCM1P3PpcpWfaYg5YlclVpFJjkGtVt/ex/g3qCgeLm3S+4wLo1h6AdnQNEY/EldJ3txq
	c6l+E22Hd/TG+JbET7E5rfHrCdPwfabLvbrztfVg==
X-Received: by 2002:a05:6808:11cb:b0:467:de0e:feb6 with SMTP id 5614622812f47-4868dc583f1mr883548b6e.11.1780621259486;
        Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/14] dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
Date: Thu,  4 Jun 2026 20:00:17 -0500
Message-ID: <20260605010022.968612-11-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111291-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:elder@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@k
 ernel.org,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,riscstar.com:mid,riscstar.com:from_mime,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 608676444EF

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

The TC9564 contains a PCIe switch with one upstream and three downstream
PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
endpoint, and that endpoint implements two PCIe functions.  Each internal
PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
operation.

The TC9564 also implements an embedded GPIO controller, which exposes
10 lines externally.  Some platforms use these GPIO lines, so this
GPIO controller is managed by a separate driver.  Other embedded
peripherals (like a microcontroller, SRAM, and UART) are currently
unused.

The GPIO controller is managed by registers accessed via MMIO on an
internal PCIe function's registers.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
new file mode 100644
index 0000000000000..6e7a63dfcf86a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc9564-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 (and more generally, TC956x) incorporates a PCIe
+  gen 3 switch with one upstream and three downstream ports.  The first
+  two downstream ports are exposed externally, while the third is used
+  by an internal PCIe endpoint.  The PCIe endpoint implements two PCIe
+  functions, and attached to each of these is a 10 Gbps capable Synopsys
+  Ethernet controller.
+
+  The TC956x additionally implements other internal IP blocks, and in
+  particular it implements a GPIO controller.  Ten of the 35 GPIO lines
+  implemented are exposed externally and are usable by the platform.
+  It is platform-dependent whether the GPIO function must be exposed,
+  and if it is, PCIe function 0 supplies it.
+
+              ----------------------------------
+              |              Host              |
+              ------+...+----------+........+---
+                    |i2c|          |  PCIe  |
+    ----------------+...+----------+........+------
+    | TC956x        |I2C|          |upstream|     |
+    |               -----        --+--------+---  |
+    |  -----  ------  -------    | PCIe switch |  |
+    |  |SPI|  |GPIO|  |reset|    |             |  |
+    |  -----  ------  |clock|    | DS3 DS2 DS1 |  |
+    |                 -------    ---++--++--++--  |
+    |  -----  ------     downstream//    \\  \\   |  downstream
+    |  |MCU|  |SRAM|    /==========/      \\  \===== PCIe port 1
+    |  -----  ------   //PCIe port 3       \\     |
+    |                  ||                   \======= downstream
+    |  ----+-----------++-----------+----         |  PCIe port 2
+    |  | M | internal PCIe endpoint | M |         |
+    |  | S |------------------------| S |  ------ |
+    |  | I |   PCIe   |  |   PCIe   | I |  |UART| |
+    |  | G |function 0|  |function 1| G |  ------ |
+    |  | E |----++----|  |----++----| E |         |
+    |  | N |  eMAC 0  |  |  eMAC 1  | N |         |
+    --------+.......+------+.....+-----------------
+            |USXGMII|      |SGMII|
+          --+.......+--  --+.....+--
+          |  ARQ113C  |  | QEP8121 |
+          |    PHY    |  |   PHY   |
+          -------------  -----------
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  gpio:
+    type: object
+    description: Embedded GPIO controller
+    $ref: /schemas/gpio/gpio.yaml#
+
+  ethernet:
+    type: object
+    description: XGMAC Ethernet controller
+    $ref: /schemas/net/ethernet-controller.yaml#
+    properties:
+      mdio:
+        $ref: snps,dwmac.yaml#/properties/mdio
+    required:
+      - mdio
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/pci/pci-device.yaml#
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pci@0,0 {
+            compatible = "pci1179,0220";
+            reg = <0x50000 0x0 0x0 0x0 0x0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges;
+
+            gpio {
+                  gpio-controller;
+                  #gpio-cells = <2>;
+            };
+
+            ethernet {
+                phy-mode = "10gbase-r";
+                phy-handle = <&tc9564_emac0_phy>;
+
+                mdio {
+                  compatible = "snps,dwmac-mdio";
+                  #address-cells = <1>;
+                  #size-cells = <0>;
+
+                  tc9564_emac0_phy: ethernet-phy@1c {
+                      compatible = "ethernet-phy-id311c.1c12";
+                      reg = <0x1c>;
+                  };
+              };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 2aa6ea012c848..f976c9fa9d9c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27052,6 +27052,12 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC956X/QUALCOMM QPS615 DWMAC ETHERNET DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.51.0


