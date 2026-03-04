Return-Path: <linux-arm-msm+bounces-95382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLEhIGZqqGnYuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:22:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C02205180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64A19300BE9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585D39021F;
	Wed,  4 Mar 2026 17:22:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D64385527;
	Wed,  4 Mar 2026 17:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644936; cv=none; b=DVWgyXtDuu+ET8RPoSgga3Nv3jPOywbWRaq68BocMWh6tvDLcOoaGU25R+ZNQhlgEOjN02uVGP+iZaT8ctttCS2wfvjbmy7JN72FPxTFWR/MucqIO0L5BpHLGE0bf+111GTGpGIUCyrd77E/g6eEhrLFVVpMx/C4AgZbJlt6/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644936; c=relaxed/simple;
	bh=RaZbaVpjVGmjvfDsydk1VCoQHjEZZ5YVAonjhJxrTxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdx2f5VokPsFygKiLin4kDe7v4C4RxoIDRAyrz63eGTqPrXWr/7EXb8xTo5bmd2CKeSyoLZMXWDgGbsIi52BI8h+Hw4ws5Ljk+7yQIlg/xL3/ps3D2x8a4mHBLpfAe4+A7uf1Ikwgu8vtLQJtgYFXHA95UehXrWQzxoqNNRNiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32E7C2BCB0;
	Wed,  4 Mar 2026 17:22:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: arm,gic: Document symbolic definitions
Date: Wed,  4 Mar 2026 18:21:56 +0100
Message-ID: <36c8fe02dc911141170ea6607034422410e0ddc2.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86C02205180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95382-lists,linux-arm-msm=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,broadcom.com,nxp.com,pengutronix.de,gmail.com,linaro.org,baylibre.com,googlemail.com,mediatek.com,thingy.jp,collabora.com,nvidia.com,ti.com,socionext.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.869];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2c200000:email,2c010000:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,e1101000:email,2cf00000:email,0.0.0.0:email,2c001000:email,glider.be:mid,glider.be:email]
X-Rspamd-Action: no action

Currently, the various GIC DT bindings document the magic GIC and
interrupt numbers used in interrupts properties, but omit any references
to the corresponding symbolic DT binding definitions.

Add references to these symbolic definitions, and convert the examples
to make use of them.  This improves readability, and makes the examples
more similar to what actual users look like.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/interrupt-controller/arm,gic-v3.yaml    | 12 +++++++++---
 .../interrupt-controller/arm,gic-v5-iwb.yaml         |  2 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml    |  2 ++
 .../bindings/interrupt-controller/arm,gic.yaml       | 11 +++++++++--
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index 360a0643a0b567a4..d1a4b36f06bc3bdb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -46,6 +46,7 @@ properties:
       The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
       interrupts, 2 for interrupts in the Extended SPI range, 3 for the
       Extended PPI range. Other values are reserved for future use.
+      See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987]. PPI interrupts are in the
@@ -56,6 +57,7 @@ properties:
       bits[3:0] trigger type and level flags.
         1 = edge triggered
         4 = level triggered
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
 
       The 4th cell is a phandle to a node describing a set of CPUs this
       interrupt is affine to. The interrupt must be a PPI, and the node
@@ -237,6 +239,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     gic: interrupt-controller@2cf00000 {
       compatible = "arm,gic-v3";
       #interrupt-cells = <3>;
@@ -249,7 +253,7 @@ examples:
             <0x2c000000 0x2000>,  // GICC
             <0x2c010000 0x2000>,  // GICH
             <0x2c020000 0x2000>;  // GICV
-      interrupts = <1 9 4>;
+      interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 
       msi-controller;
       mbi-ranges = <256 128>;
@@ -263,6 +267,8 @@ examples:
     };
 
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@2c010000 {
       compatible = "arm,gic-v3";
       #interrupt-cells = <4>;
@@ -278,7 +284,7 @@ examples:
             <0x2c040000 0x2000>,  // GICC
             <0x2c060000 0x2000>,  // GICH
             <0x2c080000 0x2000>;  // GICV
-      interrupts = <1 9 4 0>;
+      interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 
       msi-controller@2c200000 {
         compatible = "arm,gic-v3-its";
@@ -307,7 +313,7 @@ examples:
 
     device@0 {
       reg = <0 4>;
-      interrupts = <1 1 4 &part0>;
+      interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_HIGH &part0>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
index 99a266a62385a354..3103d314fdcae94c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5-iwb.yaml
@@ -46,6 +46,8 @@ properties:
       4 = active high level-sensitive
       8 = active low level-sensitive
 
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
+
     const: 2
 
   interrupt-controller: true
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
index 86ca7f3ac2810312..16c66b043210d815 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -57,6 +57,8 @@ properties:
         4 = active high level-sensitive
         8 = active low level-sensitive
 
+      See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
+
     const: 3
 
   interrupt-controller: true
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index ee4c77dac201ad8f..f05917d0071b5446 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -74,6 +74,7 @@ properties:
     description: |
       The 1st cell is the interrupt type; 0 for SPI interrupts, 1 for PPI
       interrupts.
+      See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
       The 2nd cell contains the interrupt number for the interrupt type.
       SPI interrupts are in the range [0-987].  PPI interrupts are in the
@@ -85,6 +86,7 @@ properties:
           2 = high-to-low edge triggered (invalid for SPIs)
           4 = active high level-sensitive
           8 = active low level-sensitive (invalid for SPIs).
+        See <dt-bindings/interrupt-controller/irq.h> for symbolic values.
         bits[15:8] PPI interrupt cpu mask.  Each bit corresponds to each of
         the 8 possible cpus attached to the GIC.  A bit set to '1' indicated
         the interrupt is wired to that CPU.  Only valid for PPI interrupts.
@@ -92,6 +94,7 @@ properties:
         DEFINED and as such not guaranteed to be present (most SoC available
         in 2014 seem to ignore the setting of this flag and use the hardware
         default value).
+        See <dt-bindings/interrupt-controller/arm-gic.h> for symbolic values.
 
   reg:
     description: |
@@ -201,6 +204,8 @@ examples:
 
   - |
     // GICv2
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@2c001000 {
       compatible = "arm,cortex-a15-gic";
       #interrupt-cells = <3>;
@@ -209,18 +214,20 @@ examples:
             <0x2c002000 0x2000>,
             <0x2c004000 0x2000>,
             <0x2c006000 0x2000>;
-      interrupts = <1 9 0xf04>;
+      interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
     };
 
   - |
     // GICv2m extension for MSI/MSI-x support
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     interrupt-controller@e1101000 {
       compatible = "arm,gic-400";
       #interrupt-cells = <3>;
       #address-cells = <1>;
       #size-cells = <1>;
       interrupt-controller;
-      interrupts = <1 8 0xf04>;
+      interrupts = <GIC_PPI 8 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
       ranges = <0 0xe1100000 0x100000>;
       reg = <0xe1110000 0x01000>,
             <0xe112f000 0x02000>,
-- 
2.43.0


