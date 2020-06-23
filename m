Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F55620678D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388820AbgFWWsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388802AbgFWWsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:33 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42DBC061795;
        Tue, 23 Jun 2020 15:48:31 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 22so367592wmg.1;
        Tue, 23 Jun 2020 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+UkIiMblS01IMwb5y3ipLuBGNtaAPNK5vyux2DsnPk=;
        b=QTrwmaqOMYmujEUYDg7CnB40Wu7Yb9oW4YCDsa22Wgr76i5W6SwdocPBj5nrohXxlP
         xhdviq5SU1Q1xRsdKKen05F1gkYiL1PE3MhjX/43RoQX6xx8F8ox+YZMjZLx6kQYHKL9
         8WaoyAhaMOivNKNiUOGXJdkSsTeOuGal5RNxZfWs8658r79P4SBVke07pUR1Zk9sponr
         7VzmpH61N9wuENSss9/04tbIxSf2lefzvl8RMZfBBqggkw+aRFL6hc5XQCelHU6rM7pF
         WVexAcsj8JmtkZpuWMCun8GBSUmcWUf1hX7C5ZuJfDRgNbTdI+nfvhp6PUp5pC3Vcfab
         YhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+UkIiMblS01IMwb5y3ipLuBGNtaAPNK5vyux2DsnPk=;
        b=MQIlKa0XhmyUAf6+Nm+UkP0czgkpDAPKjR5bgnFRz+Eu4QFk5zJogUcW6mkcDS2Vfq
         W3Y95wDoeMA6m7hdd9jsQEsc3KdeOnODhY+c9BvSFjSSOWWCV9t6BFQxP1mTVmmEtsiw
         YAsekqVfTsfrMiWtS27AQqzq6S0OFRxsi3rjqAuf+6MHL78FyyvlCtvlACkVDLahq8Sn
         ucKqEKq/A7mfIwEzO/TiuVftbVEeu7ZTt0kHEm6CKwu1+9aib9u815nsxEtanKoAVhDD
         Y9KQLQB0kuUxvOuT2beT7/NklHE14KJkRs5/XEJBohRLrtfwzwBebU0r/Oc4rSvUL4zj
         bCJg==
X-Gm-Message-State: AOAM530IqxljUANp0OYW4tSlAzHTVG0wSKoP83vlZuTbhXwWkZuI+4+t
        DxcFCKst7YaUczIqFzZIknE=
X-Google-Smtp-Source: ABdhPJynS9R+pOY4HaB81OMmHgdv10zpzRkEYAbOkj/URZUT/3AVdcTiKRMjRbHmPFy0UbBzYcgueg==
X-Received: by 2002:a1c:b6c3:: with SMTP id g186mr10513857wmf.135.1592952510579;
        Tue, 23 Jun 2020 15:48:30 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:30 -0700 (PDT)
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
Subject: [PATCH v2 05/12] arm64: dts: qcom: msm8994: Add SDHCI1 node
Date:   Wed, 24 Jun 2020 00:48:04 +0200
Message-Id: <20200623224813.297077-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for SDHCI on msm8994-based devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index a4edc3be7024..f989530ffa90 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -334,6 +334,31 @@ frame@f9028000 {
 			};
 		};
 
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
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
-- 
2.27.0

