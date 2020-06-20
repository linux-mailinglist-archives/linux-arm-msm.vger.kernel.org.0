Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322B9202498
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgFTOtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgFTOsD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:03 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D47C0613EE;
        Sat, 20 Jun 2020 07:48:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g18so3285814wrm.2;
        Sat, 20 Jun 2020 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrlkwV285XuTdyl/PIHuoBUtm4YgGtLa2zYtiTLuxck=;
        b=Zy74E0+6f7pH5/r0ZNokuvL9FU2uTCe1MiNprcXQXDz79+AlECWmpNy7JxNaM5UTJZ
         jElyasxE4Pov/dzIvah9UVTLGRNQli0aPKRBjsxkwj3gSnjC+3rxTZ7JKgdY6ygCH9T/
         tVWBxDX8Xv0QMK3pzc7hpw4d+s9TVXGOgNRLRDF1WtCjBVsi+acJrCiBqar4gtLueb2A
         o+AtTwrHWQDYiP+ubvA3SYO+wxLEJ+slRuIegtSGWitmA8jN7tNfWZNEUEUmDJnq6gVp
         knZaAeTIZJYWuF+9XAsuyvxBIXtt5ewKr2ISAOOTtpBksgQPwDGRVvnj/61H+GA8hDgF
         CLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrlkwV285XuTdyl/PIHuoBUtm4YgGtLa2zYtiTLuxck=;
        b=PPToyj5iOccfS8N6ZN36EVuzn76LEOnzCvbmz+uKjK8jXXJDXobsDg+GdZPMpkxBDg
         TaWgkTVxYNRwwEAA0SGwcn/fb6UWcPMjzyYNQoc6vrJHhCWALfqrAccLAmTAXkIkbPy4
         45yMJDxndZPtW6DxFE2/FOdvF5+H2ulhiFnjYyp7yVj9vCeshew3mBApV/BKoYBjud05
         TEIdU+uSCDpavAX3SGiD97lFlexh3oQGrz362fiPkuHTbMBCJ7ejgu7rmOPhqCoI4tt9
         Dp5s7DRDmruy56oMEDEIuXf3r2JC0k1Xrzhg8G5ckzxokEf456yokFdm3ux3LKGoDPcr
         YbQA==
X-Gm-Message-State: AOAM530UeKCl8y7SlZ1snMAh+gqbVgy1Kp5TQAxgrGGYdVTQR9dLjuat
        AXBpQ0hc4+b3FSlPxA7yLMI=
X-Google-Smtp-Source: ABdhPJx0v7q+wiETpU3p5StWy8f5tDVwmoyKyi6TR9jiyqY96GXfs+mks17mnzD7dtX+pfWd6WY/xg==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr1183722wrm.379.1592664481536;
        Sat, 20 Jun 2020 07:48:01 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:01 -0700 (PDT)
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
Subject: [PATCH 03/21] arm64: dts: qcom: msm8994: Add a proper CPU map
Date:   Sat, 20 Jun 2020 16:46:19 +0200
Message-Id: <20200620144639.335093-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a proper CPU map to enable the use of all 8 cores.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 100 ++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f10c8b34bd08..ebb6a0630604 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -20,26 +20,118 @@ / {
 	chosen { };
 
 	cpus {
-		#address-cells = <1>;
+		#address-cells = <2>;
 		#size-cells = <0>;
+
 		cpu-map {
 			cluster0 {
 				core0 {
 					cpu = <&CPU0>;
 				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 { 
+					cpu = <&CPU7>;
+				};
 			};
 		};
 
 		CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
-			reg = <0x0>;
+			reg = <0x0 0x0>;
 			next-level-cache = <&L2_0>;
+			enable-method = "psci";
 			L2_0: l2-cache {
-			      compatible = "cache";
-			      cache-level = <2>;
+				compatible = "cache";
+				cache-level = <2>;
 			};
 		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x2>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x3>;
+			next-level-cache = <&L2_0>;
+			enable-method = "psci";
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x100>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+			L2_1: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x101>;
+			next-level-cache = <&L2_1>;
+			enable-method = "psci";
+		};
 	};
 
 	timer {
-- 
2.27.0

