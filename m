Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4083230972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 14:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgG1MBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 08:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbgG1MBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 08:01:07 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E6DC0619D4;
        Tue, 28 Jul 2020 05:01:06 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id d6so6532033ejr.5;
        Tue, 28 Jul 2020 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2q93FVdT16iSOi/3vPrG4ZH4MZNlbJkhzRjHUU4qvI=;
        b=DRnrQL2jiANg1LCEiHbcsMAemscesJxlF/BScJWltuEPtWJgaKFG+PVuGW9l0rqJsy
         E8CxWg5HAmLffJCYMTwu3R53mcEt7eAThyslDukHxhqQJaQCg9l2e77xM++LCPfI/PRa
         a+9EifrOoaLfBUPW9n176A0RbCbC2Esmr0yQ28XLlN8lureqJostUIVXq2i8iq9r+o4A
         s8IqRl0nIncUTgC3Wr+P96B85iqWJxtWJIE0ErLTwwCE5zTd2LLrl8f1z8PMquFy5Ger
         2QC4oF7hDe9kUiwO/I6AGWx9xt3ugCbPI+X3zakiZobmrle8YiJiINKCaxDAbU9CrlqB
         a6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2q93FVdT16iSOi/3vPrG4ZH4MZNlbJkhzRjHUU4qvI=;
        b=gAYlgul+qoGGwEP7VWwSaKFQz7Q/jfSWkJ0kmobcPHHbMefRCM8nYv/MttCo5TIvGp
         VpklOqnnmtih6GdkZioRlLD8hNNSB9YqO/7ABX7XTlo7s/Xh65RlAFpOUhG/NJYkB7Y5
         Q2ovNh77Z5e9V31biYwSxCVhJo4trEa+fJ9GKH6TifwYaCZeaw9SM9fl+mN13eg2k1cP
         UhtYEdt07vATsNxIhRx+HmevUdjfl47mc/kmRD90bN9l7XujIfagGycfCG2WeXTM2VEZ
         j98ge58002i7+mnAWVuxy2T/euVoJuB58b2iv3g2cNgGm3dZ0vnmn+HtHyLNxgAFvSyU
         nesA==
X-Gm-Message-State: AOAM533FuR8bJ8Hc3Wv6F3CwFT9UbqylFfDrxfxmoj2ufsqXMWvL8rik
        qaggfHiVcWABEjh1Wov1AJ8=
X-Google-Smtp-Source: ABdhPJwzGWglviFaa19/EAZZVusEB9PVJX6tezEMVsH20V9O0umhp+H6N0A8L8X4h48ZE69Gi09zBQ==
X-Received: by 2002:a17:906:b2d0:: with SMTP id cf16mr15708293ejb.514.1595937665567;
        Tue, 28 Jul 2020 05:01:05 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id m20sm9066959ejk.90.2020.07.28.05.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:01:05 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: qcom: msm8992: Add USB support
Date:   Tue, 28 Jul 2020 14:00:44 +0200
Message-Id: <20200728120049.90632-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728120049.90632-1-konradybcio@gmail.com>
References: <20200728120049.90632-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a very basic dwc3 configuration (no PHYs yet),
but it works.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 31 +++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index c7dc81311f6a..c9502fcf5d70 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -242,6 +242,37 @@ frame@f9028000 {
 			};
 		};
 
+		usb3: usb@f92f8800 {
+			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			reg = <0xf92f8800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clocks = <&gcc GCC_USB30_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
+				 <&gcc GCC_USB30_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
+			clock-names = "core", "iface", "sleep", "mock_utmi", "ref", "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <120000000>;
+
+			power-domains = <&gcc USB30_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
+
+			dwc3@f9200000 {
+				compatible = "snps,dwc3";
+				reg = <0xf9200000 0xcc00>;
+				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				maximum-speed = "high-speed";
+				dr_mode = "peripheral";
+			};
+		};
+
 		sdhc_1: sdhci@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
-- 
2.27.0

