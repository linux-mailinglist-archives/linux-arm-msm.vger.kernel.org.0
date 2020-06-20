Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACE3202451
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbgFTOsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgFTOsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:13 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0533EC06174E;
        Sat, 20 Jun 2020 07:48:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r15so11580851wmh.5;
        Sat, 20 Jun 2020 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97wbQO3HMusWpuHqKL79C/u+rKBTCTTZZ6SBIzBl9PE=;
        b=cMnpiBxZiDYDzw4uGKAoNZpkjuKVlc+D+GHXdon3uQV8Qoghompf9JQLyRN41iuqjR
         NcVInPRAxh7FdUp+p78swb6TrvaAQ9II9hvGmeMlL/VE23bILX6FelAm89u9dkv824jZ
         gk2AetPmd99Wym+1/IhCd0Y5EV5ijIAVNN7UsFMZpgw+yD4FwnCaHf00rImuwFFdOOF9
         M97vPvoXQP+cSkc+KGk68y7F5FUAup0qvdAXRxaXDhg9B409F7+zCVvYrDAvFmWTSZPj
         ivbtAkKrUrH+NqvIJD2aHwfeClEqQ411nm9EfgsNzjh8tsuRoQ7OrDDM/UoK/WuhHbSl
         zTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97wbQO3HMusWpuHqKL79C/u+rKBTCTTZZ6SBIzBl9PE=;
        b=M9tjWyWEjZWaXz3cXhGdQPWkFbjk7Mdv29+EPuJxb7C4T3KhFSPIWjkg62g8VY2X0D
         IfxPJWJ70cZR8ihOaa1JbWyNpqYBPZWm4Re2C19mPdFFTVRl7gIL9oUPKEwGy427H6pY
         BcIfe04Sm4Z64soDeL2en5BmlKSdO+yiWy1WmNW1RSFGmbRJhnpStdlGMHq3hIr+yadE
         rUvaHa7wR/zpoyv3CvRAUu/7GOhNeEnEcXI4R6jxliGgEJ44smEu79eS21YQrU1C4GTW
         A9w9WpBhNKOHFZeT7oqEOucVQQkFYHwppr4VWzb4FBl5JezTlHwnk9NbQygCwaBAbseM
         RHng==
X-Gm-Message-State: AOAM531Jzizx1R/oT2Y6nmCVvL/ErpoRudl20r5tHKtoFKtun0KNaTXi
        I4IqGD2WWo7zD+3HOPsrH+E=
X-Google-Smtp-Source: ABdhPJxPPCZTcP1X8Ly2/ULSqMN+F6lM5HwtTB42vjEXiLjnqa4XOjODJwCK1xhMUn7E8hd62oeRDg==
X-Received: by 2002:a1c:668b:: with SMTP id a133mr6490605wmc.10.1592664491798;
        Sat, 20 Jun 2020 07:48:11 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:11 -0700 (PDT)
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
Subject: [PATCH 06/21] arm64: dts: qcom: msm8994: Rename clock_gcc label to gcc
Date:   Sat, 20 Jun 2020 16:46:22 +0200
Message-Id: <20200620144639.335093-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the label to follow the style used in other device trees.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 5206605d3bad..0a6d637fbbba 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -237,8 +237,8 @@ blsp1_uart2: serial@f991e000 {
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 			clock-names = "core", "iface";
-			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
-				 <&clock_gcc GCC_BLSP1_AHB_CLK>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
 		};
 
 		spmi_bus: qcom,spmi@fc4c0000 {
@@ -262,7 +262,7 @@ tcsr_mutex_regs: syscon@fd484000 {
 			reg = <0xfd484000 0x2000>;
 		};
 
-		clock_gcc: clock-controller@fc400000 {
+		gcc: clock-controller@fc400000 {
 			compatible = "qcom,gcc-msm8994";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.27.0

