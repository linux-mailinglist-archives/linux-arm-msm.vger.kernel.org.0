Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C320246A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbgFTOsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgFTOsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:30 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA03C06174E;
        Sat, 20 Jun 2020 07:48:29 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so12380781wru.0;
        Sat, 20 Jun 2020 07:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ho8WGeesIayM2NlnDUDPnPaLLkKqkwfwp2LqE68gM1k=;
        b=ZC0H/wpr8qoVxSxXLxGcEb+PLCzhXllaOQrlEy2RXB4DElNr7OBAN9DE+XZ4oH+ik3
         fXhxPl+mnogJ6Fa5OlgnEO1Ru98Jpv1YJp0WULe5UxyAED9ljC6w9jqpUpRj2Lctavkl
         pQ7Ckf1/rcmFnb1R2hyk1ZRUD/7Hlx3/ZV0Twf+jz2pPh7HuL+w3nezL4O6sxtjSOm1C
         3pk7NSoveG/6+cSc7I7FrxtkA/CrHG9GypjZL/Kk5U+vAwC8Tb5F/4T/CesquMhYx3fr
         iHiDfxsP7GY+VZWB08Fw0x6+FKZ2zjbE8RFEz97kC8SQH1cUsgzOTiFXHjujm1zxaztb
         ryzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ho8WGeesIayM2NlnDUDPnPaLLkKqkwfwp2LqE68gM1k=;
        b=A4fMsnyhomzySNrvnx1gK/waHApfiYcSlLsrILZbYAdfJardwa2saAv/l4VQz2WixM
         hozXcYyiy0IfpRXy+bLwXQ1C+X0S5gksVEfR6odmKhAq3dxaXuoZliRZjJBZ090g5qyY
         1u/Y25EPLJN933cmUViiRnLzJZpei3zK0mh9WUNjACxir5Kq0wAETXE4qY6rSsWnOOJU
         wYQhOrQ9sExqixE14afIMc60eTMteQdYX0zn6KDvC5YlouZOdoPWuWSRqGa9lBz4uUpU
         PMnMkGPUHKZgIKm77jTC2sVnaVKp99jS+szAaX5q+ncwc65d09uYLBpyDSx78e1r9j2I
         uxJA==
X-Gm-Message-State: AOAM530X0OqCSJvRuBQqnpPHroVaz7mENi+ADwN4WEyT3/hsUgrqbDkm
        RuAtWjwkqtO/8xKsMDOjdwc=
X-Google-Smtp-Source: ABdhPJzScjayvbKAEfUSpap8HH81R8sJgJBzohh9zVCCS57jAsB9WHniUrjwMWcIozkIvs+5E4UXag==
X-Received: by 2002:adf:f845:: with SMTP id d5mr9452842wrq.197.1592664508552;
        Sat, 20 Jun 2020 07:48:28 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:28 -0700 (PDT)
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
Subject: [PATCH 11/21] arm64: dts: qcom: msm8994: Add SDHCI1 node
Date:   Sat, 20 Jun 2020 16:46:27 +0200
Message-Id: <20200620144639.335093-12-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for SDHCI on msm8994-based devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f623f7e08994..f363b678c3b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -279,6 +279,33 @@ apcs: syscon@f900d000 {
 			compatible = "syscon";
 			reg = <0xf900d000 0x2000>;
 		};
+
+		sdhc1: sdhci@f9824900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				<&gcc GCC_SDCC1_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on
+							&sdc1_rclk_on>;
+			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off
+							&sdc1_rclk_off>;
+
+			regulator-always-on;
+			bus-width = <8>;
+			mmc-hs400-1_8v;
+			non-removable;
+			status = "disabled";
+		};
 	};
 
 	memory {
-- 
2.27.0

