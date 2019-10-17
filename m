Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2BEDB99E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 00:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395550AbfJQWTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 18:19:06 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41304 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388926AbfJQWTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 18:19:06 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so2510391pfh.8;
        Thu, 17 Oct 2019 15:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WcbMapS+KrTS1M+NWMTFZVWwBbbwGn9pH0cgzENlrX0=;
        b=OOdEH5qDLq8CO8vzYQJp0MxR+ODWFBIGrhmUavVV0CXMyHgedtVmVdXwQXZLVJEILI
         7Z77pjVDhW3k5JzgNG6dNnE2+rsqN4qwub2/5SiBh3UF+Eepjvcd8a52yOUMfBCAHJDW
         eUUjd3kwj8jDyLdTQvlvn8vad55FWS0hMeicWRrFYYrJjs6gPKDsYfr0gPXBBxFM/w2O
         +NFXhzLOZKbZxV89OQFHDvkDCDH/jh5JmwkZtnlWUXtJJz/gDiYhO/p7mLPfucyFYTLA
         ZpVdLigqbL7Rb14aLL22Mdza92aMe6A1vBml7VWMOJv7v74mQtipcqPgY/aMRLWUqHKD
         Plxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WcbMapS+KrTS1M+NWMTFZVWwBbbwGn9pH0cgzENlrX0=;
        b=jDFK/jThDTQtcIxX1+MutTxQpiYvyyFlKuNYAXSzfW6ZMQF+ahhj4/yb618/wLWKWA
         OsENkwBvIKVBQnqzrZ4uiBh9P0hx1RJENE218/qC32tUxdpUWsk1lnuDmZSKqOHRQQvu
         PPkR3GpuC8Cky6GWvLzsSDsFVBjkcYibrMfbkeySjMOPRiOj3ZPMLPG+W6d7r7wPuaLz
         oEhwYLprv5jId9/XNwdht+JMzH9pAdez91yuyA/T62M271MQtZeCREiwH3z5QKYZB9Qf
         KDppkhzystJ/YGE++qti2iduIJqghVOzxaxmueo2x5oOUNu8ov4ozdHgzS5AY+26X11X
         Gx0Q==
X-Gm-Message-State: APjAAAUgnasx6FTOQqZ5rw/Sw2Lw01LAGiB8Ocms+3Duc1q2A75W6iBj
        nh85VsFIimgC7atkxWRcRyNWr96B
X-Google-Smtp-Source: APXvYqwidTys3QOgscLTaEym1p5xGetQ3abS83Gte+Fn0KDOJL1CWbawWPGARzIfKbSRdWklkOrKgg==
X-Received: by 2002:aa7:8a97:: with SMTP id a23mr2713310pfc.76.1571350743966;
        Thu, 17 Oct 2019 15:19:03 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a8sm3441912pff.5.2019.10.17.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 15:19:03 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [RFC PATCH 2/4] arm64: dts: qcom: msm8998: Add blsp1_uart3
Date:   Thu, 17 Oct 2019 15:18:41 -0700
Message-Id: <20191017221843.8130-3-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
References: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The blsp1_uart3 peripheral appears to be commonly used for interfacing with
other SoCs on a platform, such as a wcn3990 to provide bluetooth.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
index 6db70acd38ee..e32d3ab395ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
@@ -75,4 +75,17 @@
 			drive-strength = <2>;   /* 2 mA */
 		};
 	};
+
+	blsp1_uart3_on: blsp1_uart3_on {
+		mux {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			function = "blsp_uart3_a";
+		};
+
+		config {
+			pins = "gpio45", "gpio46", "gpio47", "gpio48";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index a3465f6bae84..b69a7f38dd36 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1214,6 +1214,20 @@
 			qcom,num-ees = <4>;
 		};
 
+		blsp1_uart3: serial@c171000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x0c171000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
+			dma-names = "tx", "rx";
+			pinctrl-names = "default";
+			pinctrl-0 = <&blsp1_uart3_on>;
+			status = "disabled";
+		};
+
 		blsp1_i2c1: i2c@c175000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c175000 0x600>;
-- 
2.17.1

