Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113A824D529
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 14:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgHUMj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 08:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgHUMjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 08:39:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BD3C06138B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so1687530ljc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fiy2iATlfEw3mL+m1CzukWRNox6olxQRmmk+sPk6mE=;
        b=aQMumDMPRzQYP3vRkeg1t4rGN6T3OxHuM/ysDz5qnn7EBiOIQng/rFlUeCuSSVgPFD
         dOiVBzmyL+o7iwoIUZiHv6fsR4WxKjy/62ijh/cLQoQIpqTnjD4Y203pCwJ8A8Mk2M4o
         ynKD/mQy9GoWlcEaKf9KU9gUONaIDu60Wf36HVjSf7J14MTyQiz1c+6ihifaggfyO/FF
         bn3G6P3vjGMMueSj8MshrH0ES4N1AInWhn/ET91lHZ8qvE89snmi6ffvFdsipM55DfAq
         m7dBtPnYCHx+fGSoghLhEvVQEACmq+z5j9If5NsoMxxSZwArztM4NkBEgB+OsyRynBlF
         Jmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fiy2iATlfEw3mL+m1CzukWRNox6olxQRmmk+sPk6mE=;
        b=rl1a0e5JXKVJTnHsv/iJkVflV3iGPB5eu73zOPfOExq7WawuwhKzFuy3TqG/UGGTKj
         RgqccSLMYUrb+QaPESWeM2D1TvVED3NDztXPCu7gUPb33RWZWWQ7rY0Jo+FjYQ+q6muL
         Z5o9UY56LzgWBkNbp+sUCdnCtVww30/Yelhx51+0FUlHmOVvt86dB1ilrVq76Ze8A5hT
         mm+jTm9YJC7oVKR4ep+gDnPaARLSZ2si66YTvEqxbnFVBfJJ0Irv96Bn+WgoCi4Rxw4A
         I6jyY8x6zEmpjo3f0og+U/uhVt8DPhW8PLfN86YpNJlss337toqstrIwORqVOrMLdAt3
         U5rg==
X-Gm-Message-State: AOAM532RQEQZevcuWunf5bY+BI80ZLaH8Xq2sJt2n4EAqQ9YN6uv8hpa
        FiUrlLQ6aaY3lYq+LCdGXwvSyQ==
X-Google-Smtp-Source: ABdhPJwHoB6Qvm8X4ahgf8Cm38C9BomSfZhulzQhRr3KnxEMm1hZ2hlhscnrVgADscF7OsA/RjELAg==
X-Received: by 2002:a2e:b619:: with SMTP id r25mr1577154ljn.220.1598013584317;
        Fri, 21 Aug 2020 05:39:44 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s4sm360782lja.124.2020.08.21.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:39:43 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] ARM: debug: Select flow control for all debug UARTs
Date:   Fri, 21 Aug 2020 14:39:35 +0200
Message-Id: <20200821123936.153793-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821123936.153793-1-linus.walleij@linaro.org>
References: <20200821123936.153793-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of a flow control selection mechanism specifically for
8250, make this available for all debug UARTs. If the debug
UART supports waiting for CTS to be asserted, then this code
can be activated for terminals that need it.

We keep the defaults for EBSA110, Footbridge, Gemini and RPC
so that this still works as expected for these older platforms:
they assume that flow control shall be enabled for debug
prints.

I switch the location of the check for
ifdef CONFIG_DEBUG_UART_FLOW_CONTROL from the actual debug
UART drivers: the code would get compiled-out for 8250 and
Tegra unless their custom config (or passing -DFLOW_CONTROL
in the Tegra case) was not set. Instead this is conditional
at the three places where we print debug messages. The idea
is that debug UARTs can be implemented without this ifdef
boilerplate so they look cleaner, alas the ifdef has to be
somewhere.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Spreading out the ifdef CONFIG_DEBUG_UART_FLOW_CONTROL is a
bit of a taste choice, if preferred I can keep it in each
UART driver as well. If many UART drivers implement this
it is likely better like this IMO but I can do it either way.
---
 arch/arm/Kconfig.debug           | 16 +++++++++++-----
 arch/arm/boot/compressed/debug.S |  2 ++
 arch/arm/include/debug/8250.S    |  2 --
 arch/arm/include/debug/tegra.S   |  2 --
 arch/arm/kernel/debug.S          |  7 ++++++-
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 80000a66a4e3..87912e5c2256 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1546,6 +1546,17 @@ config DEBUG_SIRFSOC_UART
 	bool
 	depends on ARCH_SIRF
 
+config DEBUG_UART_FLOW_CONTROL
+	bool "Enable flow control (CTS) for the debug UART"
+	depends on DEBUG_LL
+	default y if ARCH_EBSA110 || DEBUG_FOOTBRIDGE_COM1 || DEBUG_GEMINI || ARCH_RPC
+	help
+	  Some UART ports are connected to terminals that will use modem
+	  control signals to indicate whether they are ready to receive text.
+	  In practice this means that the terminal is asserting the special
+	  control signal CTS (Clear To Send). If your debug UART supports
+	  this and your debug terminal will require it, enable this option.
+
 config DEBUG_LL_INCLUDE
 	string
 	default "debug/sa1100.S" if DEBUG_SA1100
@@ -1893,11 +1904,6 @@ config DEBUG_UART_8250_PALMCHIP
 	  except for having a different register layout.  Say Y here if
 	  the debug UART is of this type.
 
-config DEBUG_UART_8250_FLOW_CONTROL
-	bool "Enable flow control for 8250 UART"
-	depends on DEBUG_LL_UART_8250 || DEBUG_UART_8250
-	default y if ARCH_EBSA110 || DEBUG_FOOTBRIDGE_COM1 || DEBUG_GEMINI || ARCH_RPC
-
 config DEBUG_UNCOMPRESS
 	bool "Enable decompressor debugging via DEBUG_LL output"
 	depends on ARCH_MULTIPLATFORM || PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
diff --git a/arch/arm/boot/compressed/debug.S b/arch/arm/boot/compressed/debug.S
index 97f4e74692e8..fac40a717fcf 100644
--- a/arch/arm/boot/compressed/debug.S
+++ b/arch/arm/boot/compressed/debug.S
@@ -8,7 +8,9 @@
 
 ENTRY(putc)
 	addruart r1, r2, r3
+#ifdef CONFIG_DEBUG_UART_FLOW_CONTROL
 	waituartcts r3, r1
+#endif
 	waituarttxrdy r3, r1
 	senduart r0, r1
 	busyuart r3, r1
diff --git a/arch/arm/include/debug/8250.S b/arch/arm/include/debug/8250.S
index 769246d87fff..e3692a37cede 100644
--- a/arch/arm/include/debug/8250.S
+++ b/arch/arm/include/debug/8250.S
@@ -49,9 +49,7 @@
 		.endm
 
 		.macro	waituartcts,rd,rx
-#ifdef CONFIG_DEBUG_UART_8250_FLOW_CONTROL
 1001:		load	\rd, [\rx, #UART_MSR << UART_SHIFT]
 		tst	\rd, #UART_MSR_CTS
 		beq	1001b
-#endif
 		.endm
diff --git a/arch/arm/include/debug/tegra.S b/arch/arm/include/debug/tegra.S
index 2bca6358cdd0..98daa7f48314 100644
--- a/arch/arm/include/debug/tegra.S
+++ b/arch/arm/include/debug/tegra.S
@@ -179,14 +179,12 @@
 		.endm
 
 		.macro	waituartcts, rd, rx
-#ifdef FLOW_CONTROL
 		cmp	\rx, #0
 		beq	1002f
 1001:		ldrb	\rd, [\rx, #UART_MSR << UART_SHIFT]
 		tst	\rd, #UART_MSR_CTS
 		beq	1001b
 1002:
-#endif
 		.endm
 
 		.macro	waituarttxrdy,rd,rx
diff --git a/arch/arm/kernel/debug.S b/arch/arm/kernel/debug.S
index e7c87522c176..d92f44bdf438 100644
--- a/arch/arm/kernel/debug.S
+++ b/arch/arm/kernel/debug.S
@@ -89,12 +89,17 @@ ENTRY(printascii)
 2:		teq     r1, #'\n'
 		bne	3f
 		mov	r1, #'\r'
+#ifdef CONFIG_DEBUG_UART_FLOW_CONTROL
 		waituartcts r2, r3
+#endif
 		waituarttxrdy r2, r3
 		senduart r1, r3
 		busyuart r2, r3
 		mov	r1, #'\n'
-3:		waituartcts r2, r3
+3:
+#ifdef CONFIG_DEBUG_UART_FLOW_CONTROL
+		waituartcts r2, r3
+#endif
 		waituarttxrdy r2, r3
 		senduart r1, r3
 		busyuart r2, r3
-- 
2.26.2

