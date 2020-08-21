Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F99824D52C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 14:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgHUMkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 08:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgHUMju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 08:39:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEFFC061342
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y2so1699896ljc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2020 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BgadfB5krB76vfFemnEl7mqgct62PL+apkSnkJxl7rU=;
        b=ma7MklMjGebHXVITBxNbYWKvzeVCHEEv2w4uRwrCZWKJfCPo/Xohjc33bXMAFoZdZp
         Go2mliTpWUs1YKQsOazavcnLSoYEUB0nXNGKiOoFpMoA0S8Mb3Ppz/X1VDvRQoVr0+dB
         MYvzJJA6fv+pm/K4TXRGZV4efPJFJBTW896CgoLZNqsx2xpUCC0NEFAICsY5hwrJ/PdX
         D9r0Tpl81tj/65fnbK+GT6NITd3YgnIumqJliQZgXQxEDxgsVyYEJHMMW753jC1opnjy
         56257a68ZMZ9hToPyc6zP9NJwLq2suunXtQBSKJJsihQWJuvYFPKncDGVnmpIlfSN1GW
         /R4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BgadfB5krB76vfFemnEl7mqgct62PL+apkSnkJxl7rU=;
        b=cgUfNS6VHMnrMa3Du09RNdzW26sUHcodXXP6F1Gi/ZGNqV2r8EdzP5Ccdoe4D5IXfc
         maVn18BAt9Wlnk6IjCj+VRX7ws2BhzrBOZqPayqz04iwb6HzUNPjlLoyezRcWK0bv141
         rqeZAlLwaDgm4iU+Qf8nWOqtMamM2+5m2mR5eG1QN3wgJTQgj9S+pr8Qrv73EI4gZYhG
         TEYTxn3no9AYbpRHRwG6DhTLhPPW5ZHORUVZ9pJFnv89KiEwOvnMI3R1cEIBglQpvefz
         TR/xMoP6oPjsOufMCzIYkZCgJ/QPdshr8OOBwqkmrMNkTbAKVDB+nusYSqMERwMDAY5U
         jyjg==
X-Gm-Message-State: AOAM533EZH1RlT3DfVIDhKoF/WvtHaMV2j4/VEbjoO9pZiJuciCKXHMa
        2s0pRDTl51e9TgB7P0CFEWwERQ==
X-Google-Smtp-Source: ABdhPJwwRoyWuCA/jxRCW+gf7PjPRYF9nemTwDytYDgYNg5YWY4J4XWUmqB+xElYWYM3G+O6qRinEA==
X-Received: by 2002:a2e:9946:: with SMTP id r6mr1453104ljj.35.1598013586176;
        Fri, 21 Aug 2020 05:39:46 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s4sm360782lja.124.2020.08.21.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 05:39:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 3/3] ARM: uncompress: Wait for ready and busy in debug prints
Date:   Fri, 21 Aug 2020 14:39:36 +0200
Message-Id: <20200821123936.153793-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821123936.153793-1-linus.walleij@linaro.org>
References: <20200821123936.153793-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some platforms such as Qualcomm we need to wait for the
UART to be ready before writing characters to the UART
in the same manner as the macro in debug.S used with the
main "Uncompressing Linux ..." text. Pass an extra temporary
variable to writeb and make it call waituarttxrdy and
busyuart just like the other decomression messages.

Optionally it will also call waituartcts if and only if
CONFIG_DEBUG_UART_FLOW_CONTROL is selected.

After this the decompression debug messages work fine on
Qualcomm platforms if you compile head.S with -DDEBUG.

Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/compressed/head.S | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
index ba121eea9468..5c9c6fe590cb 100644
--- a/arch/arm/boot/compressed/head.S
+++ b/arch/arm/boot/compressed/head.S
@@ -28,19 +28,19 @@
 #if defined(CONFIG_CPU_V6) || defined(CONFIG_CPU_V6K) || defined(CONFIG_CPU_V7)
 		.macro	loadsp, rb, tmp1, tmp2
 		.endm
-		.macro	writeb, ch, rb
+		.macro	writeb, ch, rb, tmp
 		mcr	p14, 0, \ch, c0, c5, 0
 		.endm
 #elif defined(CONFIG_CPU_XSCALE)
 		.macro	loadsp, rb, tmp1, tmp2
 		.endm
-		.macro	writeb, ch, rb
+		.macro	writeb, ch, rb, tmp
 		mcr	p14, 0, \ch, c8, c0, 0
 		.endm
 #else
 		.macro	loadsp, rb, tmp1, tmp2
 		.endm
-		.macro	writeb, ch, rb
+		.macro	writeb, ch, rb, tmp
 		mcr	p14, 0, \ch, c1, c0, 0
 		.endm
 #endif
@@ -49,8 +49,13 @@
 
 #include CONFIG_DEBUG_LL_INCLUDE
 
-		.macro	writeb,	ch, rb
+		.macro	writeb,	ch, rb, tmp
+#ifdef CONFIG_DEBUG_UART_FLOW_CONTROL
+		waituartcts \tmp, \rb
+#endif
+		waituarttxrdy \tmp, \rb
 		senduart \ch, \rb
+		busyuart \tmp, \rb
 		.endm
 
 #if defined(CONFIG_ARCH_SA1100)
@@ -1326,7 +1331,7 @@ puts:		loadsp	r3, r2, r1
 1:		ldrb	r2, [r0], #1
 		teq	r2, #0
 		moveq	pc, lr
-2:		writeb	r2, r3
+2:		writeb	r2, r3, r1
 		mov	r1, #0x00020000
 3:		subs	r1, r1, #1
 		bne	3b
-- 
2.26.2

