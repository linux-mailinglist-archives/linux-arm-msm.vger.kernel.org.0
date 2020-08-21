Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EA924D52B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 14:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgHUMkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 08:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727881AbgHUMjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 08:39:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82335C061386
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so1661005ljn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yt/LyldY66/pFwPDGeXJ8z0VFMR5hGFFUKYdFpYipWk=;
        b=XooIBxD9NpfvCnmLijRKkNkTkeMMIlnFg0kpeEhmSI1UCEyX/VnmJ9wgj8KDgf/bDo
         l2wiTaKka9AcdCyzjCBQVMz/s1hjeiGpewkXuNPAiMMkiVGPgBGDl3b3IqXwiVV2Izyo
         A8KGlQ5M2Aco7pYHvWVBZf4OsbStJTX8Pa0J5jswDhjubqTyl4/HFumi9Zz69qG48YLI
         HtB6DcCA47U5sMGvOWg7afVGm2hvf6teBF9OdMjt/jgTbLJrfht41Dfhb+8sWqMg01h4
         AXMLIsx67k4dzfD6gyhverK5NgV+fJ5MaYGApSojOQ4jsezK7r1V7WI7hbP7f+t/Bhyw
         hGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yt/LyldY66/pFwPDGeXJ8z0VFMR5hGFFUKYdFpYipWk=;
        b=k9+ACd3bVmXyHGg+gliJ/pc+GxBVBjTPI9Td5p6U5+Xgv+nQ4cH7ne1+XnKAODE51Q
         gAyT949xG2x3jfgB+klIeVIETPHf2Nk2JcqHaRYYj3zgk5xD674nDUiPyVups02nKXYK
         gV3WfPg2V7V9v7D9DPL4K6Zm1v0gLSQRwWIMRlMWqFTgwqLjccExGB7jt2FUXSnRvu7i
         YhVsuZEkQPVL9iE9YcVTgkTrTWmTwCGsWX5eoQUGC4zDObcQeLAjvZw2KKkVT8QIaA86
         8T0o6Bbh8RGVbkfndPOcdjlQwwR+rV303QaOg0HtFF41H+sqfCrexr6ULVaZmgrgUpAC
         NQEg==
X-Gm-Message-State: AOAM530XvevY4Ma1fFjES3HL0F8CSQQh3ATtsBK9xAssFAbHoaTAzfMs
        Y0IeHs3Rlya06HT+oRc0oUcuK57R3ApnTA==
X-Google-Smtp-Source: ABdhPJyDt/v7xH3SpO1d06gOE1qp2Y8xFQmdjLkpTxjqbUy9WJJPq+5fIWJm41oKIbBHxAZrAt+YxQ==
X-Received: by 2002:a2e:a58b:: with SMTP id m11mr1405008ljp.135.1598013582813;
        Fri, 21 Aug 2020 05:39:42 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s4sm360782lja.124.2020.08.21.05.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:39:42 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] ARM: debug: Split waituart to CTS and TXRDY
Date:   Fri, 21 Aug 2020 14:39:34 +0200
Message-Id: <20200821123936.153793-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821123936.153793-1-linus.walleij@linaro.org>
References: <20200821123936.153793-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch was triggered by a remark from Russell that
introducing a call to the waituart (needed to fix debug prints
on the Qualcomm platforms) was dangerous because in some cases
this will involve waiting for a modem CTS (clear to send)
signal, and debug messages would maybe not work on platforms
with no modem connected to the UART port: they will just
hang waiting for the modem to assert CTS and this might never
happen.

Looking through all UART debug drivers implementing the waituart
macro I discovered that all users except two actually use this
macro to check if the UART is ready for TX, let's call this
TXRDY.

Only two debug UART drivers actually check for CTS:
- arch/arm/include/debug/8250.S
- arch/arm/include/debug/tegra.S

The former is very significant since the 8250 is possibly
the most common UART on the planet.

We have the following problem: the semantics of waituart are
ambiguous making it dangerous to introduce the macro to debug
code fixing debug prints for Qualcomm. To start to pry this
problem apart, this patch does the following:

- Convert all debug UART drivers to define two macros:

  - waituartcts with the clear semantic to wait for CTS
    to be asserted

  - waituarttxrdy with the clear semantic to wait for the TX
    capability of the UART to be ready

- When doing this take care to assign the right function to
  each drivers macro, so they now do exactly the above.

- Update the three sites in the kernel invoking the waituart
  macro to call waituartcts/waituarttxrdy in sequence, so that
  the functional impact on the kernel should be zero.

After this we can start to change the code sites using this
code to do the right thing.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/compressed/debug.S      |  3 ++-
 arch/arm/include/debug/8250.S         |  5 ++++-
 arch/arm/include/debug/asm9260.S      |  5 ++++-
 arch/arm/include/debug/at91.S         |  5 ++++-
 arch/arm/include/debug/bcm63xx.S      |  5 ++++-
 arch/arm/include/debug/brcmstb.S      |  5 ++++-
 arch/arm/include/debug/clps711x.S     |  5 ++++-
 arch/arm/include/debug/dc21285.S      |  5 ++++-
 arch/arm/include/debug/digicolor.S    |  5 ++++-
 arch/arm/include/debug/efm32.S        |  5 ++++-
 arch/arm/include/debug/icedcc.S       | 15 ++++++++++++---
 arch/arm/include/debug/imx.S          |  5 ++++-
 arch/arm/include/debug/meson.S        |  5 ++++-
 arch/arm/include/debug/msm.S          |  5 ++++-
 arch/arm/include/debug/omap2plus.S    |  5 ++++-
 arch/arm/include/debug/pl01x.S        |  5 ++++-
 arch/arm/include/debug/renesas-scif.S |  5 ++++-
 arch/arm/include/debug/sa1100.S       |  5 ++++-
 arch/arm/include/debug/samsung.S      |  5 ++++-
 arch/arm/include/debug/sirf.S         |  5 ++++-
 arch/arm/include/debug/sti.S          |  5 ++++-
 arch/arm/include/debug/stm32.S        |  5 ++++-
 arch/arm/include/debug/tegra.S        |  5 ++++-
 arch/arm/include/debug/vf.S           |  5 ++++-
 arch/arm/include/debug/vt8500.S       |  5 ++++-
 arch/arm/include/debug/zynq.S         |  5 ++++-
 arch/arm/kernel/debug.S               |  6 ++++--
 27 files changed, 114 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/compressed/debug.S b/arch/arm/boot/compressed/debug.S
index 6bf2917a4621..97f4e74692e8 100644
--- a/arch/arm/boot/compressed/debug.S
+++ b/arch/arm/boot/compressed/debug.S
@@ -8,7 +8,8 @@
 
 ENTRY(putc)
 	addruart r1, r2, r3
-	waituart r3, r1
+	waituartcts r3, r1
+	waituarttxrdy r3, r1
 	senduart r0, r1
 	busyuart r3, r1
 	mov	 pc, lr
diff --git a/arch/arm/include/debug/8250.S b/arch/arm/include/debug/8250.S
index e4a036f082c2..769246d87fff 100644
--- a/arch/arm/include/debug/8250.S
+++ b/arch/arm/include/debug/8250.S
@@ -45,7 +45,10 @@
 		bne	1002b
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituarttxrdy,rd,rx
+		.endm
+
+		.macro	waituartcts,rd,rx
 #ifdef CONFIG_DEBUG_UART_8250_FLOW_CONTROL
 1001:		load	\rd, [\rx, #UART_MSR << UART_SHIFT]
 		tst	\rd, #UART_MSR_CTS
diff --git a/arch/arm/include/debug/asm9260.S b/arch/arm/include/debug/asm9260.S
index 0da1eb625331..5a0ce145c44a 100644
--- a/arch/arm/include/debug/asm9260.S
+++ b/arch/arm/include/debug/asm9260.S
@@ -11,7 +11,10 @@
 		ldr	\rv, = CONFIG_DEBUG_UART_VIRT
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituarttxrdy,rd,rx
+		.endm
+
+		.macro	waituartcts,rd,rx
 		.endm
 
 		.macro	senduart,rd,rx
diff --git a/arch/arm/include/debug/at91.S b/arch/arm/include/debug/at91.S
index 6c91cbaaa20b..17722824e2f2 100644
--- a/arch/arm/include/debug/at91.S
+++ b/arch/arm/include/debug/at91.S
@@ -19,12 +19,15 @@
 	strb	\rd, [\rx, #(AT91_DBGU_THR)]		@ Write to Transmitter Holding Register
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituarttxrdy,rd,rx
 1001:	ldr	\rd, [\rx, #(AT91_DBGU_SR)]		@ Read Status Register
 	tst	\rd, #AT91_DBGU_TXRDY			@ DBGU_TXRDY = 1 when ready to transmit
 	beq	1001b
 	.endm
 
+	.macro	waituartcts,rd,rx
+	.endm
+
 	.macro	busyuart,rd,rx
 1001:	ldr	\rd, [\rx, #(AT91_DBGU_SR)]		@ Read Status Register
 	tst	\rd, #AT91_DBGU_TXEMPTY			@ DBGU_TXEMPTY = 1 when transmission complete
diff --git a/arch/arm/include/debug/bcm63xx.S b/arch/arm/include/debug/bcm63xx.S
index 06a896227396..da65abb6738d 100644
--- a/arch/arm/include/debug/bcm63xx.S
+++ b/arch/arm/include/debug/bcm63xx.S
@@ -17,12 +17,15 @@
 	strb	\rd, [\rx, #UART_FIFO_REG]
 	.endm
 
-	.macro	waituart, rd, rx
+	.macro	waituarttxrdy, rd, rx
 1001:	ldr	\rd, [\rx, #UART_IR_REG]
 	tst	\rd, #(1 << UART_IR_TXEMPTY)
 	beq	1001b
 	.endm
 
+	.macro	waituartcts, rd, rx
+	.endm
+
 	.macro	busyuart, rd, rx
 1002:	ldr	\rd, [\rx, #UART_IR_REG]
 	tst	\rd, #(1 << UART_IR_TXTRESH)
diff --git a/arch/arm/include/debug/brcmstb.S b/arch/arm/include/debug/brcmstb.S
index 132a20c4a676..7ffe66993029 100644
--- a/arch/arm/include/debug/brcmstb.S
+++ b/arch/arm/include/debug/brcmstb.S
@@ -142,7 +142,10 @@ ARM_BE8(	rev	\rd, \rd )
 		bne	1002b
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituarttxrdy,rd,rx
+		.endm
+
+		.macro	waituartcts,rd,rx
 		.endm
 
 /*
diff --git a/arch/arm/include/debug/clps711x.S b/arch/arm/include/debug/clps711x.S
index 774a67ac3877..a983d12a6515 100644
--- a/arch/arm/include/debug/clps711x.S
+++ b/arch/arm/include/debug/clps711x.S
@@ -20,7 +20,10 @@
 	ldr	\rp, =CLPS711X_UART_PADDR
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 	.endm
 
 	.macro	senduart,rd,rx
diff --git a/arch/arm/include/debug/dc21285.S b/arch/arm/include/debug/dc21285.S
index d7e8c71706ab..4ec0e5e31704 100644
--- a/arch/arm/include/debug/dc21285.S
+++ b/arch/arm/include/debug/dc21285.S
@@ -34,5 +34,8 @@
 		bne	1001b
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 		.endm
diff --git a/arch/arm/include/debug/digicolor.S b/arch/arm/include/debug/digicolor.S
index 256f5f4da275..443674cad76a 100644
--- a/arch/arm/include/debug/digicolor.S
+++ b/arch/arm/include/debug/digicolor.S
@@ -21,7 +21,10 @@
 		strb	\rd, [\rx, #UA0_EMI_REC]
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 		.endm
 
 	.macro	busyuart,rd,rx
diff --git a/arch/arm/include/debug/efm32.S b/arch/arm/include/debug/efm32.S
index 5ed5028306f4..b0083d6e31e8 100644
--- a/arch/arm/include/debug/efm32.S
+++ b/arch/arm/include/debug/efm32.S
@@ -29,7 +29,10 @@
 		strb	\rd, [\rx, #UARTn_TXDATA]
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 1001:		ldr	\rd, [\rx, #UARTn_STATUS]
 		tst	\rd, #UARTn_STATUS_TXBL
 		beq	1001b
diff --git a/arch/arm/include/debug/icedcc.S b/arch/arm/include/debug/icedcc.S
index 74a0dd036a17..d5e65da8a687 100644
--- a/arch/arm/include/debug/icedcc.S
+++ b/arch/arm/include/debug/icedcc.S
@@ -23,7 +23,10 @@
 		beq	1001b
 		.endm
 
-		.macro	waituart, rd, rx
+		.macro	waituartcts, rd, rx
+		.endm
+
+		.macro	waituarttxrdy, rd, rx
 		mov	\rd, #0x2000000
 1001:
 		subs	\rd, \rd, #1
@@ -47,7 +50,10 @@
 		beq	1001b
 		.endm
 
-		.macro	waituart, rd, rx
+		.macro	waituartcts, rd, rx
+		.endm
+
+		.macro	waituarttxrdy, rd, rx
 		mov	\rd, #0x10000000
 1001:
 		subs	\rd, \rd, #1
@@ -72,7 +78,10 @@
 
 		.endm
 
-		.macro	waituart, rd, rx
+		.macro	waituartcts, rd, rx
+		.endm
+
+		.macro	waituarttxrdy, rd, rx
 		mov	\rd, #0x2000000
 1001:
 		subs	\rd, \rd, #1
diff --git a/arch/arm/include/debug/imx.S b/arch/arm/include/debug/imx.S
index 1c1b9d1da4c8..bb7b9550580c 100644
--- a/arch/arm/include/debug/imx.S
+++ b/arch/arm/include/debug/imx.S
@@ -35,7 +35,10 @@
 		str	\rd, [\rx, #0x40]	@ TXDATA
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 		.endm
 
 		.macro	busyuart,rd,rx
diff --git a/arch/arm/include/debug/meson.S b/arch/arm/include/debug/meson.S
index 1e501a0054ae..7b60e4401225 100644
--- a/arch/arm/include/debug/meson.S
+++ b/arch/arm/include/debug/meson.S
@@ -25,7 +25,10 @@
 	beq	1002b
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 1001:	ldr	\rd, [\rx, #MESON_AO_UART_STATUS]
 	tst	\rd, #MESON_AO_UART_TX_FIFO_FULL
 	bne	1001b
diff --git a/arch/arm/include/debug/msm.S b/arch/arm/include/debug/msm.S
index 9405b71461da..530edc74f9a3 100644
--- a/arch/arm/include/debug/msm.S
+++ b/arch/arm/include/debug/msm.S
@@ -17,7 +17,10 @@ ARM_BE8(rev	\rd, \rd )
 	str	\rd, [\rx, #0x70]
 	.endm
 
-	.macro	waituart, rd, rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy, rd, rx
 	@ check for TX_EMT in UARTDM_SR
 	ldr	\rd, [\rx, #0x08]
 ARM_BE8(rev     \rd, \rd )
diff --git a/arch/arm/include/debug/omap2plus.S b/arch/arm/include/debug/omap2plus.S
index b5696a33ba0f..0680be6c79d3 100644
--- a/arch/arm/include/debug/omap2plus.S
+++ b/arch/arm/include/debug/omap2plus.S
@@ -75,5 +75,8 @@ omap_uart_lsr:	.word	0
 		bne	1001b
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 		.endm
diff --git a/arch/arm/include/debug/pl01x.S b/arch/arm/include/debug/pl01x.S
index a2a553afe7b8..0c7bfa4c10db 100644
--- a/arch/arm/include/debug/pl01x.S
+++ b/arch/arm/include/debug/pl01x.S
@@ -26,7 +26,10 @@
 		strb	\rd, [\rx, #UART01x_DR]
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 1001:		ldr	\rd, [\rx, #UART01x_FR]
  ARM_BE8(	rev	\rd, \rd )
 		tst	\rd, #UART01x_FR_TXFF
diff --git a/arch/arm/include/debug/renesas-scif.S b/arch/arm/include/debug/renesas-scif.S
index 25f06663a9a4..8e433e981bbe 100644
--- a/arch/arm/include/debug/renesas-scif.S
+++ b/arch/arm/include/debug/renesas-scif.S
@@ -33,7 +33,10 @@
 	ldr	\rv, =SCIF_VIRT
 	.endm
 
-	.macro	waituart, rd, rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy, rd, rx
 1001:	ldrh	\rd, [\rx, #FSR]
 	tst	\rd, #TDFE
 	beq	1001b
diff --git a/arch/arm/include/debug/sa1100.S b/arch/arm/include/debug/sa1100.S
index 6109e6058e5b..7968ea52df3d 100644
--- a/arch/arm/include/debug/sa1100.S
+++ b/arch/arm/include/debug/sa1100.S
@@ -51,7 +51,10 @@
 		str	\rd, [\rx, #UTDR]
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 1001:		ldr	\rd, [\rx, #UTSR1]
 		tst	\rd, #UTSR1_TNF
 		beq	1001b
diff --git a/arch/arm/include/debug/samsung.S b/arch/arm/include/debug/samsung.S
index 69201d7fb48f..ab474d564a90 100644
--- a/arch/arm/include/debug/samsung.S
+++ b/arch/arm/include/debug/samsung.S
@@ -69,7 +69,10 @@ ARM_BE8(rev \rd, \rd)
 1002:		@ exit busyuart
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 		ldr	\rd, [\rx, # S3C2410_UFCON]
 ARM_BE8(rev \rd, \rd)
 		tst	\rd, #S3C2410_UFCON_FIFOMODE	@ fifo enabled?
diff --git a/arch/arm/include/debug/sirf.S b/arch/arm/include/debug/sirf.S
index e73e4de0a015..3612c7b9cbe7 100644
--- a/arch/arm/include/debug/sirf.S
+++ b/arch/arm/include/debug/sirf.S
@@ -29,7 +29,10 @@
 	.macro	busyuart,rd,rx
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 1001:	ldr	\rd, [\rx, #SIRF_LLUART_TXFIFO_STATUS]
 	tst	\rd, #SIRF_LLUART_TXFIFO_EMPTY
 	beq	1001b
diff --git a/arch/arm/include/debug/sti.S b/arch/arm/include/debug/sti.S
index 6b42c91f217d..72d052511890 100644
--- a/arch/arm/include/debug/sti.S
+++ b/arch/arm/include/debug/sti.S
@@ -45,7 +45,10 @@
                 strb    \rd, [\rx, #ASC_TX_BUF_OFF]
                 .endm
 
-                .macro  waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+                .macro  waituarttxrdy,rd,rx
 1001:           ldr     \rd, [\rx, #ASC_STA_OFF]
                 tst     \rd, #ASC_STA_TX_FULL
                 bne     1001b
diff --git a/arch/arm/include/debug/stm32.S b/arch/arm/include/debug/stm32.S
index f3c4a37210ed..b6d9df30e37d 100644
--- a/arch/arm/include/debug/stm32.S
+++ b/arch/arm/include/debug/stm32.S
@@ -27,7 +27,10 @@
 	strb    \rd, [\rx, #STM32_USART_TDR_OFF]
 .endm
 
-.macro  waituart,rd,rx
+.macro	waituartcts,rd,rx
+.endm
+
+.macro  waituarttxrdy,rd,rx
 1001:	ldr	\rd, [\rx, #(STM32_USART_SR_OFF)]	@ Read Status Register
 	tst	\rd, #STM32_USART_TXE			@ TXE = 1 = tx empty
 	beq	1001b
diff --git a/arch/arm/include/debug/tegra.S b/arch/arm/include/debug/tegra.S
index 2148d0f88591..2bca6358cdd0 100644
--- a/arch/arm/include/debug/tegra.S
+++ b/arch/arm/include/debug/tegra.S
@@ -178,7 +178,7 @@
 1002:
 		.endm
 
-		.macro	waituart, rd, rx
+		.macro	waituartcts, rd, rx
 #ifdef FLOW_CONTROL
 		cmp	\rx, #0
 		beq	1002f
@@ -189,6 +189,9 @@
 #endif
 		.endm
 
+		.macro	waituarttxrdy,rd,rx
+		.endm
+
 /*
  * Storage for the state maintained by the macros above.
  *
diff --git a/arch/arm/include/debug/vf.S b/arch/arm/include/debug/vf.S
index 854d9bd82770..035bcbf117ab 100644
--- a/arch/arm/include/debug/vf.S
+++ b/arch/arm/include/debug/vf.S
@@ -29,5 +29,8 @@
 	beq	1001b			@ wait until transmit done
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 	.endm
diff --git a/arch/arm/include/debug/vt8500.S b/arch/arm/include/debug/vt8500.S
index 8dc1df2d91b8..d01094fdbc8c 100644
--- a/arch/arm/include/debug/vt8500.S
+++ b/arch/arm/include/debug/vt8500.S
@@ -28,7 +28,10 @@
 	bne	1001b
 	.endm
 
-	.macro	waituart,rd,rx
+	.macro	waituartcts,rd,rx
+	.endm
+
+	.macro	waituarttxrdy,rd,rx
 	.endm
 
 #endif
diff --git a/arch/arm/include/debug/zynq.S b/arch/arm/include/debug/zynq.S
index 58d77c972fd6..5d42cc35ecf3 100644
--- a/arch/arm/include/debug/zynq.S
+++ b/arch/arm/include/debug/zynq.S
@@ -33,7 +33,10 @@
 		strb	\rd, [\rx, #UART_FIFO_OFFSET]	@ TXDATA
 		.endm
 
-		.macro	waituart,rd,rx
+		.macro	waituartcts,rd,rx
+		.endm
+
+		.macro	waituarttxrdy,rd,rx
 1001:		ldr	\rd, [\rx, #UART_SR_OFFSET]
 ARM_BE8(	rev	\rd, \rd )
 		tst	\rd, #UART_SR_TXEMPTY
diff --git a/arch/arm/kernel/debug.S b/arch/arm/kernel/debug.S
index e112072b579d..e7c87522c176 100644
--- a/arch/arm/kernel/debug.S
+++ b/arch/arm/kernel/debug.S
@@ -89,11 +89,13 @@ ENTRY(printascii)
 2:		teq     r1, #'\n'
 		bne	3f
 		mov	r1, #'\r'
-		waituart r2, r3
+		waituartcts r2, r3
+		waituarttxrdy r2, r3
 		senduart r1, r3
 		busyuart r2, r3
 		mov	r1, #'\n'
-3:		waituart r2, r3
+3:		waituartcts r2, r3
+		waituarttxrdy r2, r3
 		senduart r1, r3
 		busyuart r2, r3
 		b	1b
-- 
2.26.2

