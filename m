Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B86420A4D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404971AbgFYSWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390556AbgFYSV3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8479C08C5C1;
        Thu, 25 Jun 2020 11:21:28 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w6so6888024ejq.6;
        Thu, 25 Jun 2020 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+puFNw9Af4Mq8TedQJihgmoj5SF8nSnYlnfkgvsEedk=;
        b=lw/G9AZ0JhLp6mKFGbUXgOhKEJq6WIJ7cIQOw5MJE0Yux3vjHzXe8U0oR1NAWc0cLy
         La6AtEa19/sN5MXoc8F06zOdtlkueZ1HPwZiMD1IZ7WGO4X85dOvDSfc9cKkm+XjyQA6
         cwGTTnYWb3gvJkKgCCLpHpU2LNuKmOLac9/FW30w9TRTUP9FqQJMOcNva+kyU1R6vVAo
         B2+c2BEdIusCEVNGCdCJ/n9yP/LOkb/pjTXkh/9KYYCtJ3F2ppyZPc6p/8HLjj7xCoGf
         dfYoaV1xG/2/hRXH6FFX/BgM5EbFodVsVdE4abAdYm0Qh1Ujw/CKfPIoV6M56ENb3oOS
         zb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+puFNw9Af4Mq8TedQJihgmoj5SF8nSnYlnfkgvsEedk=;
        b=XjZqrUiFSrJtk5XBtNFjYNAaTIKBqMlOLYOpUwmNrjNhOkz85yRqAq7QVRktXd351p
         NQ+xYIc3hriLLOMFqVZoh4ECEuNA9Zf3khe9ekyVG+joKFRX1nlHegm8TkFMGZYHQR2a
         UawdaeZeFxk11Aix5OWG2bLDFFlpFJjfGBQ+RYD8H+jdG5UE1vipz7vPYIGZajQK5+CH
         ebQ/EgLWtoriS6o762VO694pqsTD3sEZ11I3I01KcreSaIQd32hLPVFmdAU2W/aWzf8/
         ME4qcvseDN/xGv4x33pmKI6hgn9IBMjISEwZs4j1jJJejN09EPNewDRUh/DpFebwZtpI
         9l7w==
X-Gm-Message-State: AOAM5329FJHIBCk9iM5M/MS2yIZN5xszhiVSLE/PRTNg29cP5Uu5uV6W
        NqbRUZU8aI7TYHNWYjS/LHA=
X-Google-Smtp-Source: ABdhPJwYbZsIVqcWEZ6FdDlOUbZjB+V3Gp3dC4XjE1TgMUPnOnF6TRL429WIWYcwe8CIBGAOyCkohA==
X-Received: by 2002:a17:906:3042:: with SMTP id d2mr9618978ejd.420.1593109287647;
        Thu, 25 Jun 2020 11:21:27 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:27 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] arm64: dts: qcom: msm8992: Fix SDHCI1
Date:   Thu, 25 Jun 2020 20:21:06 +0200
Message-Id: <20200625182118.131476-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit ensures the correct IRQ type is set
and disables the device by default.
The mmc-hs400-1_8v property is also moved to
Bullhead as it might not be present on all boards.

The node has been renamed to sdhci@ instead of mmc@
and the phandle was changed to sdhc_1 to comply with
the newer DTS style.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../boot/dts/qcom/msm8992-bullhead-rev-101.dts   |  6 ++++++
 arch/arm64/boot/dts/qcom/msm8992.dtsi            | 16 +++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index a2de69292d28..1061fd5404aa 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -271,3 +271,9 @@ pm8994_l32: l32 {
 		};
 	};
 };
+
+&sdhc_1 {
+	status = "okay";
+
+	mmc-hs400-1_8v;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 43b2e4cd26f0..8ef1cb8ba8ef 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -158,18 +158,19 @@ frame@f9028000 {
 			};
 		};
 
-		sdhci1: mmc@f9824900 {
+		sdhc_1: sdhci@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-			interrupts = <GIC_SPI 123 IRQ_TYPE_NONE>,
-					<GIC_SPI 138 IRQ_TYPE_NONE>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				<&gcc GCC_SDCC1_AHB_CLK>;
-			clock-names = "core", "iface";
+				<&gcc GCC_SDCC1_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "core", "iface", "xo";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on
@@ -179,8 +180,9 @@ sdhci1: mmc@f9824900 {
 
 			regulator-always-on;
 			bus-width = <8>;
-			mmc-hs400-1_8v;
-			status = "okay";
+			non-removable;
+
+			status = "disabled";
 		};
 
 		blsp1_uart2: serial@f991e000 {
-- 
2.27.0

