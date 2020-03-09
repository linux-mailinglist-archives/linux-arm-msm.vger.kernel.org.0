Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6173E17E499
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgCIQTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 12:19:25 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47065 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgCIQTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 12:19:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id n15so11956670wrw.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 09:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5WnGmh/vRlpN1V58qrypiX81UrHCL64TgTV/PYkJ9GU=;
        b=xtSXLCOQYHZMN/Ej+phfTwfMDMIer72jYLLhvKVVBnzAtnXPzF+JSrSqZ3yQQ7pRRq
         QlzRMoP2axYlACUKrOLjymOsZK1qa0QRFVZQXMRyJhkt0UQyQMygVaSXLY+BqN3D85VM
         up8op/aaZCM5518oNEc8y75p97Q9N5Uo3vYF9pBC3snu9eQt74XpKrgUizc8HjYBQOG3
         T8F3Q2tUBG/gkBJe3SvQ85Z07E7hO8OyIsoXorRVi8++/3R89shP6sBCipTxJHeiU0dd
         Abr9S/iJfa4ACzVHMOzR2t1cpxL0ypCofQd8b9G82UtZ7saGCW+KtA+4gw3kA3W9yS6m
         5BVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5WnGmh/vRlpN1V58qrypiX81UrHCL64TgTV/PYkJ9GU=;
        b=BhNwpmsPxdR1ppxpYA18tz48ECNsaASrUL4vZSubH9EvVeTfHqzqBwfNheaQ2BDlOR
         NaaaKJEQBLbitlEaYncMrqukaewh8Em67ctRPFc/UXHQJbnF1au1i+EO0QfTlzf+pC0l
         2Cmpzw/dOSYqKku3cKvhiQYYRG25TeE1Qw1+vY7G1BvmmhrV+/OctZ+Hp2KIAWcRr6c5
         dGPKfEezwQqhAgJXAhZbyc1yIipTu2FFoSlwUtFk8JTB5FfuSNvgcnzbI515dAYDeehD
         nTSJOHagfTr9hfUktSVzI0h5/HQp6y4OSu5vY/2TLXpFOpw9TpY6/1iRtAAMZufpKYhs
         fEgw==
X-Gm-Message-State: ANhLgQ0MPjoPQVvUb34369vFEVU5hGl9VzvHmSf8VxGKqZAU2DpMsDWo
        0juaH5Z4huHLamAHXQfTn8uMcQ==
X-Google-Smtp-Source: ADFU+vvXXFEjB9lqP4DTFIpOoCQhjC/1pvDByxO+55vtG+AlcFiAzAgb3RPUN7q57e5DMOQFTET2Pg==
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr9620858wrv.164.1583770762837;
        Mon, 09 Mar 2020 09:19:22 -0700 (PDT)
Received: from localhost.localdomain ([172.111.156.105])
        by smtp.gmail.com with ESMTPSA id y8sm67214wmj.22.2020.03.09.09.19.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Mar 2020 09:19:22 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 3/3] arm64: dts: msm8916: Add CCI node
Date:   Mon,  9 Mar 2020 17:23:18 +0100
Message-Id: <1583770998-25449-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
References: <1583770998-25449-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 v2: add this patch in the series
 v3: add only cci node for now
 v4: no change
 v5: add cci label

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e10..3c6f746 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1451,6 +1451,33 @@
 			};
 		};
 
+		cci: cci@1b0c000 {
+			compatible = "qcom,msm8916-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1b0c000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
+				<&gcc GCC_CAMSS_CCI_CLK>,
+				<&gcc GCC_CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb", "cci_ahb",
+				      "cci", "camss_ahb";
+			assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
+					  <&gcc GCC_CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80000000>, <19200000>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default>;
+			status = "disabled";
+
+			i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@1b00000 {
 			compatible = "qcom,msm8916-camss";
 			reg = <0x1b0ac00 0x200>,
-- 
2.7.4

