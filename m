Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CE41E99A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgEaRrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgEaRrM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:47:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E5FC061A0E;
        Sun, 31 May 2020 10:47:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so9225476wrt.5;
        Sun, 31 May 2020 10:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Apb34Y5mhNacDrU1rx2psi6gaGwQEoz5vjWu7x/Ef0U=;
        b=XvoEGpZvtz3IzVo6WRsG6NhVjWsEda/DiQ8tQvn9fsQtEWp30Eego3WWXDT7fYiUsW
         yWzh3iSacIClmNBkScAFoPssDirtaNcnRB+I+jD/e5eSxtpA5ChlLZLUH0wWqdTdbjZX
         I4yk4C3rJBEMGU5jtoH3ceclWUQRCkgKfzLbjLxYJgk2ScTezE5QJsd+V79HCzgb6RKX
         mAB0DLYYAPnc2xmXzYHdn4qI83vFVAVW3Iw1Uw4Pfp3Ztkh+DNIqRFx05LP1tConFzYA
         EGGQbUbbST5wtNIwWSdgGuMPD6snXxMskNvI2YvwzNDuLlvkMigzkFSh3vWNCp3v81MT
         izfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Apb34Y5mhNacDrU1rx2psi6gaGwQEoz5vjWu7x/Ef0U=;
        b=eSb5dhqfeOyzYVnq+76XYcfPvjgfL90xJcGASvrIljxce0kr6zds100ZGHgLcTd2bo
         BBcl3/r9PLVd3V6bvetchP/G7kI5yU1bBG5FsjR00hu4Bl1dpkIrspSFFagaAY5HffZg
         6v6HmaDfY2g8LZsYTPeSvyBLrM/G2am2S4lY5TjKcFnLwrueoUuMiLt52HKk0pT0niGc
         Dfg7QX8E55jxqeCOwUcYCMe/O1OjLbaxo2fLexIcQXoo4pio2WWQ3A+VBETk5+5cklhP
         YCx+zRqMR+FVvVjvGY+WiFl0My1iVgMUuVXn/X9BqBYDLr3f/odK9UD7UFVAT1ogTpye
         x8rw==
X-Gm-Message-State: AOAM530exZdpy3SsfP8+msVHMdcn7cY6YO24v/XDxTR/uLAro7OvH9M3
        iGugcQfmTzTALeRYYy7JaIk=
X-Google-Smtp-Source: ABdhPJy7BTu6+E1X2iBW08zO8EHSyQ5TZYYjMhP0mvIpNLUd/3SJYLrLYyS/81TqOiUzrodh0a+POA==
X-Received: by 2002:a5d:4a8a:: with SMTP id o10mr18016677wrq.222.1590947230431;
        Sun, 31 May 2020 10:47:10 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id x186sm9716494wmg.8.2020.05.31.10.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:47:09 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: Adjust msm8992 DTS to use the correct GCC driver
Date:   Sun, 31 May 2020 19:46:09 +0200
Message-Id: <20200531174612.260113-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531174612.260113-1-konradybcio@gmail.com>
References: <20200531174612.260113-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds the necessary includes and corrects the
compatible string for the msm8992 GCC driver. It also
renames "clock_gcc" to "gcc" to follow the style used in
other device trees.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 81fed16fcee6..7f618f6183d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -3,7 +3,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/qcom,gcc-msm8994.h>
+#include <dt-bindings/clock/qcom,gcc-msm8992.h>
+#include <dt-bindings/reset/qcom,gcc-msm8992.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM 8992";
@@ -275,8 +276,8 @@ blsp1_uart2: serial@f991e000 {
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>;
 			status = "disabled";
 			clock-names = "core", "iface";
-			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
-				<&clock_gcc GCC_BLSP1_AHB_CLK>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
 		};
 
 		blsp2_uart2: serial@f995e000 {
@@ -289,8 +290,8 @@ blsp2_uart2: serial@f995e000 {
 				<&gcc GCC_BLSP2_AHB_CLK>;
 		};
 
-		clock_gcc: clock-controller@fc400000 {
-			compatible = "qcom,gcc-msm8994";
+		gcc: clock-controller@fc400000 {
+			compatible = "qcom,gcc-msm8992";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -306,8 +307,8 @@ sdhci1: mmc@f9824900 {
 					<GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
-			clocks = <&clock_gcc GCC_SDCC1_APPS_CLK>,
-				<&clock_gcc GCC_SDCC1_AHB_CLK>;
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				<&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
 
 			pinctrl-names = "default", "sleep";
-- 
2.26.2

