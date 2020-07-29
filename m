Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5FB231DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgG2MBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726888AbgG2MBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:15 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DBFC061794;
        Wed, 29 Jul 2020 05:01:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g8so2484297wmk.3;
        Wed, 29 Jul 2020 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I2q93FVdT16iSOi/3vPrG4ZH4MZNlbJkhzRjHUU4qvI=;
        b=b9TFoTsy5WXyrr/4GhmwT96zN48h+XJG6F8OrMNjFWNeMe/HOvVWCFkHeSkj/kIQl2
         Pr/dWwnILpoINmDTSdN02ewi3UNuDF1s0VZqe4zNVb3WjXw4Hw+sl2ewSn26HpYmVRmB
         M0tZJDdsud0237DTVTelevbP7UWcqpJ2vTi2GjJ+ggFQVdp3WZwuJXxPj9FS70VnLl4G
         2ajr1a4tyIe85/K93HSyC1jhw95rL/8Y7WAbW23ZEN3+/fCBXGkUYV4SXa7GYJz35ze3
         tafHHWNdQTHGwsR9iG8EkEbY8xXugd40+0AgcLeUIxj3FYwo5ixyRkfIn0GF4J9HSc8b
         itvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I2q93FVdT16iSOi/3vPrG4ZH4MZNlbJkhzRjHUU4qvI=;
        b=XzaSoENyLUm1hhUlTBkcN1/O/dLL+2+x3IWSM/e9ygDxwHo5XbxgW0vMKmvdSpy8Hs
         5kAcKf040o5LP4iIpwNDEIgQpOUF1zE4fDg/b/H5RKAwCn00yjjLEhK21WIUhdv1/tI0
         zAmKWK6QLO9fwj81Bcdiz4LWc+c5GYU4nvGTtsZVhFCWbX1wJuR4LChl4Z0TAXhPTo11
         +Xkih+3lB1kENqORWfU46WR9bvhbGisqg+x2TsKEsxN7TexR0nZEw/cR1nkO7w7vI1aI
         Y+1IyvZFodflWzJGIDTY6IgM+8ExFgydixP1q33DBS7UbcqG+rq1nyGVzvglfba1nL/M
         uOSg==
X-Gm-Message-State: AOAM530uieB5q9S2oTSNTpoQr7peZmKkI+1JmAbt821TIuW53Ew3cJsB
        F2iy1nh1SyCHIONXOQH17xM=
X-Google-Smtp-Source: ABdhPJyfxcR9YmQV9N7S17bl7YsXVxAlaWJ/ZgsO97ePfr+8SUvMXE69Or24N6Y3lWOHMERiaRv8hg==
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr8311399wmi.139.1596024073983;
        Wed, 29 Jul 2020 05:01:13 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:13 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 05/10] arm64: dts: qcom: msm8992: Add USB support
Date:   Wed, 29 Jul 2020 14:00:51 +0200
Message-Id: <20200729120057.35079-6-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
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

