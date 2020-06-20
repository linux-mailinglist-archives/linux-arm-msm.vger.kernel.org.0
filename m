Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF3E202463
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgFTOsE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgFTOr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:47:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69347C06174E;
        Sat, 20 Jun 2020 07:47:59 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so591617wrw.5;
        Sat, 20 Jun 2020 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6EAQ6tORJeX422uHNof4Jb9RszLP3lU6aCec7l6C9d8=;
        b=m6+MsgykPt4hV9DOJMKJmXUysPxC+K/pfsVB5Qwv3Ra2KiJSXqaOzgPeaFOzM/MmH2
         z2Ud63r6QT/RFwLxcoZalePnvnkIYOUxMiJR18JxGyzbtCtPYJWyBR8pB880ePOhsOcl
         D2vMqLsDPiGLgAja+u03FhDhHC9RsdeGDgD+yJadiaJkW14NUQ/eG57bPD/trFNc9ryz
         bk/TD4gvKjhoOjp34BaiMWKf1kaEcDyVIMw+m6U2SVnw/pQTolOZoSxaLeyeqiL/JOpP
         UTAPifTGoyqmmBc7Z52lhLEvw7x83rUIW9g+C2BifDv6mW+PoSdCzBrLWTUDGEoVY8VA
         Iw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EAQ6tORJeX422uHNof4Jb9RszLP3lU6aCec7l6C9d8=;
        b=T2RQtJ+Fs7bEKtmqM2Tqev2E/oTmJ3v2TFjSJeyHozkHTu07Owkd0dPLpwSNzpdmfT
         mJujsF8ox++7N98nPaI0p4wKyARONLf5of8kyssLsxQQW+j7Xbv4Y0TVmJCblZfZv39L
         kalIxNT4qe+4O8aDxVMOL0XmA/vd82yFG+aK5TaE4JtUFedX2f6nX6JcXsGG2WEvCZ/o
         UMPNGoSEt/j9L3AMSjP6j6dx5rY+gB9V5Sgr/xPokSBfDGiBzY42FfK6nPUqk2CwW5Te
         sS703TQMqX2Kmx1U16CgLTbbdvfXpE5kXQPU2wZTLe7uYzu+641+pJuqeN9+zJQt+Y65
         ZOmQ==
X-Gm-Message-State: AOAM5306EHz2jGBmbFXKw5ilzOcf4JiE3qf+0ckpNR5SJhdMltk+jUNq
        qrQ0TP4hLaBmYViY3p2lftU=
X-Google-Smtp-Source: ABdhPJy6WTMlZWx+MUOouAVeHLYOjq8hnjxakBL7WQCDPu5ftYWTBXeskNu6oy7GYlGXNWnN8L/Hjg==
X-Received: by 2002:adf:e648:: with SMTP id b8mr9750158wrn.386.1592664478170;
        Sat, 20 Jun 2020 07:47:58 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:47:57 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] arm64: dts: qcom: msm8994: Add SPMI PMIC arbiter device
Date:   Sat, 20 Jun 2020 16:46:18 +0200
Message-Id: <20200620144639.335093-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SPMI PMIC arbiter device to communicate with PMICs
attached to SPMI bus.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index b1c2d7d6a0f2..f10c8b34bd08 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -149,6 +149,22 @@ blsp1_uart2: serial@f991e000 {
 				 <&clock_gcc GCC_BLSP1_AHB_CLK>;
 		};
 
+		spmi_bus: qcom,spmi@fc4c0000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0xfc4cf000 0x1000>,
+			      <0xfc4cb000 0x1000>,
+			      <0xfc4ca000 0x1000>;
+			reg-names = "core", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
 		tcsr_mutex_regs: syscon@fd484000 {
 			compatible = "syscon";
 			reg = <0xfd484000 0x2000>;
-- 
2.27.0

