Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D82F725843
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 21:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfEUT2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 15:28:21 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36393 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfEUT2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 15:28:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so10132pgb.3;
        Tue, 21 May 2019 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=H6go7CcUBjX3mzKpRCwd0evI+2M4u0B9z6h4VcPCc1A=;
        b=qLGkbLDwWl0lVlk/adYib/b/sDlGbf+3aKNtAQ3O61E873sJulejk9R09Kh89wwLye
         ajPQnhV2iQKzg+8KBPhytmKKMghOjbek15ssXUAs6QGuTmFb3EzcjMd2Q28Xb+DSuE+7
         Saq5DMSYn9s2x02pMiob21ba7HglJEgfF9E3DcQ7ZzyhGZn+QmK746STqlkgAeAV1RVY
         MfMADVSvxPHkazzGDhPWH5FTTir7EHmDVKoImDsYSBI2/IrT5L0jGfZLtT+V0N2Zd4As
         w52Nb0c0IwjzByhvunK2xdC4CQ7HZdvyesHWuWn8VbSOlBW5sYDQfB2ONrCY101qtB+a
         yBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H6go7CcUBjX3mzKpRCwd0evI+2M4u0B9z6h4VcPCc1A=;
        b=t7H+Smxkl8zQ+SMF0rFxB7bMi4tiuHKFm0f+Xk7bnUjY0JI7UCEzwQ82XLXt+4UQRf
         Qgb6f/+PHeQaFVY4zalGICNoTiMBzj8IIFy+APx57h6JN+NfNjE0Vv9eAk1GyIaTbNqu
         wOX/KxFjclDkc6rvdw8eLax8rnmnvIMebZpT1fOH4RVFpqueqUt7sSLd/RgfaavjJpkM
         NHLpq0MdoRMYX5hSe5ZWaUfl2NeKPt3U8BbByEHErwsx8xbhEqdQ8ALPeorFIc+EdkIN
         e6vQZZhz63eiRdukcfPTTCqyqsEjfoK+PkHt4fMqVyNDokqz2hvKgshMilKOIxFE/kt4
         o67g==
X-Gm-Message-State: APjAAAWdHt3BPtqJOD8GrIa75fEtd9CwhSc1sLFp3w+539iKDD/2hiqM
        sHwaZMKGrsYJpBOGaJG2RV4=
X-Google-Smtp-Source: APXvYqyXddJUHTc2OzpreTHB+PQuLPhDAlw52ZnNU9kP+z7JjpLNUDOgkon9dSKxYcJcwywTMqSnIA==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr2874365pfa.251.1558466900256;
        Tue, 21 May 2019 12:28:20 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
        by smtp.gmail.com with ESMTPSA id c76sm41382743pfc.43.2019.05.21.12.28.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 12:28:19 -0700 (PDT)
From:   Kamal Dasu <kdasu.kdev@gmail.com>
To:     linux-mtd@lists.infradead.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt: bindings: mtd: replace references to nand.txt with nand-controller.yaml
Date:   Tue, 21 May 2019 15:27:57 -0400
Message-Id: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

nand-controller.yaml replaced nand.txt however the references to it were
not updated. This change updates these references wherever it appears in
bindings documentation.

Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 .../devicetree/bindings/mtd/amlogic,meson-nand.txt         |  2 +-
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt    |  6 +++---
 Documentation/devicetree/bindings/mtd/denali-nand.txt      |  6 +++---
 Documentation/devicetree/bindings/mtd/fsmc-nand.txt        |  6 +++---
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt        |  2 +-
 Documentation/devicetree/bindings/mtd/hisi504-nand.txt     |  2 +-
 Documentation/devicetree/bindings/mtd/marvell-nand.txt     | 14 +++++++-------
 Documentation/devicetree/bindings/mtd/mxc-nand.txt         |  6 +++---
 .../devicetree/bindings/mtd/nvidia-tegra20-nand.txt        |  6 +++---
 Documentation/devicetree/bindings/mtd/oxnas-nand.txt       |  2 +-
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt       |  4 ++--
 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt  |  6 +++---
 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt  |  6 +++---
 Documentation/devicetree/bindings/mtd/tango-nand.txt       |  2 +-
 Documentation/devicetree/bindings/mtd/vf610-nfc.txt        |  8 ++++----
 15 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
index 3983c11..5794ab11 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
@@ -24,7 +24,7 @@ Optional children nodes:
 Children nodes represent the available nand chips.
 
 Other properties:
-see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
+see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
 
 Example demonstrate on AXG SoC:
 
diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index bcda1df..0b7c373 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -101,12 +101,12 @@ Required properties:
                               number (e.g., 0, 1, 2, etc.)
 - #address-cells            : see partition.txt
 - #size-cells               : see partition.txt
-- nand-ecc-strength         : see nand.txt
-- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
+- nand-ecc-strength         : see nand-controller.yaml
+- nand-ecc-step-size        : must be 512 or 1024. See nand-controller.yaml
 
 Optional properties:
 - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
-                              chip-select. See nand.txt
+                              chip-select. See nand-controller.yaml
 - brcm,nand-oob-sector-size : integer, to denote the spare area sector size
                               expected for the ECC layout in use. This size, in
                               addition to the strength and step-size,
diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b14b675..b32aed1 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -22,16 +22,16 @@ Sub-nodes:
       select is connected.
 
   Optional properties:
-    - nand-ecc-step-size: see nand.txt for details.
+    - nand-ecc-step-size: see nand-controller.yaml for details.
       If present, the value must be
         512        for "altr,socfpga-denali-nand"
         1024       for "socionext,uniphier-denali-nand-v5a"
         1024       for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-strength: see nand.txt for details. Valid values are:
+    - nand-ecc-strength: see nand-controller.yaml for details. Valid values are:
         8, 15      for "altr,socfpga-denali-nand"
         8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
         8, 16      for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-maximize: see nand.txt for details
+    - nand-ecc-maximize: see nand-controller.yaml for details
 
 The chip nodes may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index 32636eb..6762d3c 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -30,9 +30,9 @@ Optional properties:
                  command is asserted. Zero means one cycle, 255 means 256
                  cycles.
 - bank: default NAND bank to use (0-3 are valid, 0 is the default).
-- nand-ecc-mode      : see nand.txt
-- nand-ecc-strength  : see nand.txt
-- nand-ecc-step-size : see nand.txt
+- nand-ecc-mode      : see nand-controller.yaml
+- nand-ecc-strength  : see nand-controller.yaml
+- nand-ecc-step-size : see nand-controller.yaml
 
 Can support 1-bit HW ECC (default) or if stronger correction is required,
 software-based BCH.
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index c059ab7..44919d4 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -8,7 +8,7 @@ explained in a separate documents - please refer to
 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 For NAND specific properties such as ECC modes or bus width, please refer to
-Documentation/devicetree/bindings/mtd/nand.txt
+Documentation/devicetree/bindings/mtd/nand-controller.yaml
 
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
index 2e35f06..8963983 100644
--- a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
@@ -7,7 +7,7 @@ Required properties:
                        NAND controller's registers. The second contains base
                        physical address and size of NAND controller's buffer.
 - interrupts:          Interrupt number for nfc.
-- nand-bus-width:      See nand.txt.
+- nand-bus-width:      See nand-controller.yaml.
 - nand-ecc-mode:       Support none and hw ecc mode.
 - #address-cells:      Partition address, should be set 1.
 - #size-cells:         Partition size, should be set 1.
diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
index e0c7907..a2d9a0f 100644
--- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
@@ -36,29 +36,29 @@ Children nodes represent the available NAND chips.
 
 Required properties:
 - reg: shall contain the native Chip Select ids (0-3).
-- nand-rb: see nand.txt (0-1).
+- nand-rb: see nand-controller.yaml (0-1).
 
 Optional properties:
 - marvell,nand-keep-config: orders the driver not to take the timings
   from the core and leaving them completely untouched. Bootloader
   timings will then be used.
 - label: MTD name.
-- nand-on-flash-bbt: see nand.txt.
-- nand-ecc-mode: see nand.txt. Will use hardware ECC if not specified.
-- nand-ecc-algo: see nand.txt. This property is essentially useful when
+- nand-on-flash-bbt: see nand-controller.yaml.
+- nand-ecc-mode: see nand-controller.yaml. Will use hardware ECC if not specified.
+- nand-ecc-algo: see nand-controller.yaml. This property is essentially useful when
   not using hardware ECC. Howerver, it may be added when using hardware
   ECC for clarification but will be ignored by the driver because ECC
   mode is chosen depending on the page size and the strength required by
   the NAND chip. This value may be overwritten with nand-ecc-strength
   property.
-- nand-ecc-strength: see nand.txt.
-- nand-ecc-step-size: see nand.txt. Marvell's NAND flash controller does
+- nand-ecc-strength: see nand-controller.yaml.
+- nand-ecc-step-size: see nand-controller.yaml. Marvell's NAND flash controller does
   use fixed strength (1-bit for Hamming, 16-bit for BCH), so the actual
   step size will shrink or grow in order to fit the required strength.
   Step sizes are not completely random for all and follow certain
   patterns described in AN-379, "Marvell SoC NFC ECC".
 
-See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
 generic bindings.
 
 
diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.txt b/Documentation/devicetree/bindings/mtd/mxc-nand.txt
index b5833d1..2857c62 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.txt
@@ -4,9 +4,9 @@ Required properties:
 - compatible: "fsl,imxXX-nand"
 - reg: address range of the nfc block
 - interrupts: irq to be used
-- nand-bus-width: see nand.txt
-- nand-ecc-mode: see nand.txt
-- nand-on-flash-bbt: see nand.txt
+- nand-bus-width: see nand-controller.yaml
+- nand-ecc-mode: see nand-controller.yaml
+- nand-on-flash-bbt: see nand-controller.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
index b2f2ca1..e737e5b 100644
--- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
@@ -26,14 +26,14 @@ Optional children node properties:
 		 "hw" is supported.
 - nand-ecc-algo: string, algorithm of NAND ECC.
 		 Supported values with "hw" ECC mode are: "rs", "bch".
-- nand-bus-width : See nand.txt
-- nand-on-flash-bbt: See nand.txt
+- nand-bus-width : See nand-controller.yaml
+- nand-on-flash-bbt: See nand-controller.yaml
 - nand-ecc-strength: integer representing the number of bits to correct
 		     per ECC step (always 512). Supported strength using HW ECC
 		     modes are:
 		     - RS: 4, 6, 8
 		     - BCH: 4, 8, 14, 16
-- nand-ecc-maximize: See nand.txt
+- nand-ecc-maximize: See nand-controller.yaml
 - nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
 		       are chosen.
 - wp-gpios: GPIO specifier for the write protect pin.
diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
index 56d5c19d..2ba07fc 100644
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
@@ -1,6 +1,6 @@
 * Oxford Semiconductor OXNAS NAND Controller
 
-Please refer to nand.txt for generic information regarding MTD NAND bindings.
+Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
 
 Required properties:
  - compatible: "oxsemi,ox820-nand"
diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 1123cc6..5c2fba4 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -47,8 +47,8 @@ Required properties:
 - #size-cells:		see partition.txt
 
 Optional properties:
-- nand-bus-width:	see nand.txt
-- nand-ecc-strength:	see nand.txt. If not specified, then ECC strength will
+- nand-bus-width:	see nand-controller.yaml
+- nand-ecc-strength:	see nand-controller.yaml. If not specified, then ECC strength will
 			be used according to chip requirement and available
 			OOB size.
 
diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
index 0040eb8..09815c4 100644
--- a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
+++ b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
@@ -6,7 +6,7 @@ Required properties:
 	"samsung,s3c2412-nand"
 	"samsung,s3c2440-nand"
 - reg : register's location and length.
-- #address-cells, #size-cells : see nand.txt
+- #address-cells, #size-cells : see nand-controller.yaml
 - clocks : phandle to the nand controller clock
 - clock-names : must contain "nand"
 
@@ -14,8 +14,8 @@ Optional child nodes:
 Child nodes representing the available nand chips.
 
 Optional child properties:
-- nand-ecc-mode : see nand.txt
-- nand-on-flash-bbt : see nand.txt
+- nand-ecc-mode : see nand-controller.yaml
+- nand-on-flash-bbt : see nand-controller.yaml
 
 Each child device node may optionally contain a 'partitions' sub-node,
 which further contains sub-nodes describing the flash partition mapping.
diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
index ad2bef8..e55895e 100644
--- a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
@@ -24,9 +24,9 @@ Required properties:
 - reg: describes the CS lines assigned to the NAND device.
 
 Optional properties:
-- nand-on-flash-bbt: see nand.txt
-- nand-ecc-strength: see nand.txt
-- nand-ecc-step-size: see nand.txt
+- nand-on-flash-bbt: see nand-controller.yaml
+- nand-ecc-strength: see nand-controller.yaml
+- nand-ecc-step-size: see nand-controller.yaml
 
 The following ECC strength and step size are currently supported:
  - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
index cd1bf2a..91c8420 100644
--- a/Documentation/devicetree/bindings/mtd/tango-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
@@ -11,7 +11,7 @@ Required properties:
 - #size-cells: <0>
 
 Children nodes represent the available NAND chips.
-See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
index c96eeb6..7db5e6e 100644
--- a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
+++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
@@ -25,14 +25,14 @@ only handle one NAND chip.
 
 Required properties:
 - compatible: Should be set to "fsl,vf610-nfc-cs".
-- nand-bus-width: see nand.txt
-- nand-ecc-mode: see nand.txt
+- nand-bus-width: see nand-controller.yaml
+- nand-ecc-mode: see nand-controller.yaml
 
 Required properties for hardware ECC:
-- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand.txt)
+- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand-controller.yaml)
 - nand-ecc-step-size: step size equals page size, currently only 2k pages are
     supported
-- nand-on-flash-bbt: see nand.txt
+- nand-on-flash-bbt: see nand-controller.yaml
 
 Example:
 
-- 
1.9.0.138.g2de3478

