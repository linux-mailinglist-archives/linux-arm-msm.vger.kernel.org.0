Return-Path: <linux-arm-msm+bounces-105513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNrOGrTP9GkYFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:07:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F14ADECA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5C6E3013875
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DF13DDDB4;
	Fri,  1 May 2026 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="d5TuYKoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F193D3007
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650897; cv=none; b=GBYqYFwa/YIH7uHNa2XL8gltpaFq2/x/p1uGfyFbBNQOQADAlahxbUp5oQqRoMmWyFgWJlVeVDm0d5+t6eNkZuZRkhVGKGDKxQyxNe8n7uIwlgXwFxuyWaBElluC5sAnwfokqlI4VF0SNvgFBRc1k5RN8/P9Y7oyFrOtJJiIFbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650897; c=relaxed/simple;
	bh=3EvigSq/dpN+56ACeHHTAxXSD8//ELNhyucmUDQBNOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzpuiOr4Y1HsstU+brdluRFiSDTszlX09kzj4xWhtwsY1V8UC2aAUeKaW0cfgYvX9IuqYFZMBWeQxLfvpxsXex2pD1Wtgb3Mt0pd84EV9hCPqIv0bJx3238mq4Kh6zyvjAlbF7d37zJcDNlHcxr21h+31hfo2NlcW/zkEBhETNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=d5TuYKoB; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso29459226d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650894; x=1778255694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=d5TuYKoB1iNsFXPzdfSOfPMA7JWzQQqwg6krbNhrtbUusGhP9e3jmHXdIhMEItlfKp
         5e45rfC8NWzOUeDXRI0CVnq4Q5HANPmxneXZplZQs1ZAwCmv7KgE1cGy8XtkXH6rkF6s
         AOYMX8J6uXur0xsiV1qplMsypsj2RpWYPeYNHxuhmghjJ4gX4+xQCoSBZ0GKMVq2zM+2
         Jr4TIKHd5ATzfGZzmD97JkTIW0COn7ywuWNuI+CXqIlJv2K8cEyh8lLtrETU+Jtijy7Z
         Cs/oNQOyD3GbSgLRnqDlFz+So/Y1++kWFvYjQVoKIsrQQ49LKujs+wep8QzqCRwqC9Dr
         WSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650894; x=1778255694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YQxIO0Y/h8byqARAs3DXDHZ5gcHRkK0ijPD4wFq7rUk=;
        b=tXc8zj4c2amojgvW6dDDSimJN4uLn+xVW0u7N7SeNdtJaZHBcygkuZVNXSjDZA0LNW
         wqFq1BCfMHJzilMez+8x1ney/EEcmMUPyfedlE87UmagMQ4i06E0P3bU4Fq4y8P2v7bO
         R9CFUkey7McZKMI9e3RWWgrjAngOkbXTZCCBZ1ZZFHoB09eZ8/Lo2+XXREHBumadZmeW
         lfKPGl2f3nQDvslHD/iQZYRgDDJh41ELmI+EfUSQPmaKR+IUfxsoFcUIbeIW8EPhngi+
         q1vTz7oRNNCZ6BppQYu2J0iA/uzHx5DJQgJF4h8iNFG39OaMSxIZpDvfa01+rcdE1PUE
         8Clw==
X-Forwarded-Encrypted: i=1; AFNElJ+9Tu/a4aNKX3TqoLyH/J5gnl6q8hWHpj2BGLM6XslQS2qJFDkf40OC+AZbGnGARp++n58QXpngjkJUa9vH@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2a9wquQ2q2W663ALsJakkH4vdtePCq8MdO9xyfVSyzGmaXAU
	Xod7oih/vfUUHTBS0j5u8qQcggMOyikZDaz5Lg6vk6/2px1Z/2JalG6F6jHFS9u5K4k=
X-Gm-Gg: AeBDiesuw38qT+zVrbPsf7TNdWoLZeI5vyuILxkDYvw+PxXX7epjQI/rRmw0mLt+eme
	HWGS9OdMVk/+MD2BBM9vtJDk6+XCC8mLUkjnuvd+NRFRD0dcRODUQyrk/ELu5T6fLe1qgHnJPxj
	cgGFK9ZsD47w/HXa5CT5UQ6R5ZR7+4QyNexc5o0GSNIx5y7ItZFmMPJE4RwJouUkxGkoGKva+Dl
	uzTB3lAIG0aklhVNTcDbkttvylBwEgDB4t3++zuwqRhP3XmLmVtuVegDsbhACFA70jkVkjJGjYu
	5+dPEHdO48d/IFJH9OftRRLeeFfqCDi5N368yGo0muFE8TCbWTTqyDxNb7KxmkmfkwqVR5Dsgw1
	8qRdmNFjyZi7qTPBAChZEww/G+OCVUidQ+fW7eF3UyTIBBR88D1n4uQO5yAu1syXW0SyP7Q4U+G
	dhwd5E5qIg4/vZArJSzEWdf4fyrbvrgX7+3yBaFtaFjbJ+3wlI5WsY7PaQjTeCpW7yF/+7AWVB+
	FfZTg==
X-Received: by 2002:a05:6214:54c9:b0:8a6:f065:3ef9 with SMTP id 6a1803df08f44-8b6664fcf69mr1373226d6.15.1777650894371;
        Fri, 01 May 2026 08:54:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:53 -0700 (PDT)
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
	matthew.gerlach@altera.com,
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
Subject: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac: add TC956x Ethernet bridge
Date: Fri,  1 May 2026 10:54:16 -0500
Message-ID: <20260501155421.3329862-9-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 082F14ADECA
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.44 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[bounces-105513-lists,linux-arm-msm=lfdr.de];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_SPAM(0.00)[0.648];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,1c:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,0.0.0.0:email,devicetree.org:url]
X-Spam: Yes

From: Daniel Thompson <daniel@riscstar.com>

Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
bridges.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
new file mode 100644
index 0000000000000..d95d22a3761da
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC956x Ethernet-AVB/TSN Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  This node provides properties for configuring the Ethernet PCI functions
+  that are attached to the internal downstream port of the TC956x's PCIe
+  switch.
+
+  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PCIe
+  switch together with a number of Ethernet controllers. These bindings
+  cover only the Ethernet functions of these devices.
+
+allOf:
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+  - $ref: /schemas/pci/pci-device.yaml#
+
+unevaluatedProperties: false
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  # We can't allOf reference Ethernet-controller.yaml because we end up with
+  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily only a
+  # small number of the properties are useful on TC956x so we can just reference
+  # what we need.
+  phy-connection-type:
+    $ref: ethernet-controller.yaml#/properties/phy-connection-type
+
+  phy-handle:
+    $ref: ethernet-controller.yaml#/properties/phy-handle
+
+  phy-mode:
+    $ref: ethernet-controller.yaml#/properties/phy-mode
+
+  mdio:
+    $ref: snps,dwmac.yaml#/properties/mdio
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    pcie {
+      #address-cells = <3>;
+      #size-cells = <2>;
+
+      tc956x_emac0: pci@0,0 {
+        compatible = "pci1179,0220";
+        reg = <0x50000 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        phy-mode = "10gbase-r";
+        phy-handle = <&tc956x_emac0_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac0_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id311c.1c12";
+            reg = <0x1c>;
+          };
+        };
+      };
+      pci@0,1 {
+        compatible = "pci1179,0220";
+        reg = <0x50100 0x0 0x0 0x0 0x0>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        ranges;
+
+        phy-mode = "sgmii";
+        phy-handle = <&tc956x_emac1_phy>;
+
+        mdio {
+          compatible = "snps,dwmac-mdio";
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          tc956x_emac1_phy: ethernet-phy@1c {
+            compatible = "ethernet-phy-id004d.d101";
+            reg = <0x1c>;
+          };
+        };
+      };
+    };
-- 
2.51.0


