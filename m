Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F861795AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 17:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388219AbgCDQtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 11:49:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38058 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388024AbgCDQtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 11:49:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id u9so2589038wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rD4Tta4Ky2Kw2i1Eu0PqbZJvYvJ9BvhGYQ86KEAuKFQ=;
        b=e0x9VRmEh4+SOYPrLNbTuhz1MG2bga7HXMsnNjfVFqiZJY4bzLEKBw5tHlBHh+CD83
         9l5OzS24yLoDtj+UjuiFBxxTCU6gNsiVgR2P1hkKHPB4uSY9/2wuQkcqCwpjokblzDA/
         2QWwz5xS8wL/N7PvpbLbSp1B3fw9oKuxXJEVmqkrHuMqsJ+Q/fka94AgmcPEE0wmsxJD
         h0RdnbaYpEqmSnoJOPq+YU29fVxTSFFIeVIAM7IVYwdDeVm2xnRx3STahvOQ46IULTBK
         5D0s/poGRPdiqSUn3/XjjgNCqXpvHLoRv42wxkm9Ar06vCewyJ4pdHUZklfUyzFo/hL5
         lmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rD4Tta4Ky2Kw2i1Eu0PqbZJvYvJ9BvhGYQ86KEAuKFQ=;
        b=A+rU2I/6dhznKJ0fm+xZ73g6PXzLjlXPYgiHlBRMJGkxKvhKSYzS9VioizxniE0317
         FgJhM35EfpHfgq04L84lyhW7L9uxaxkUWLCsvBoIaf/rX11gm5JqOBhLW1haTJb1TK6k
         J5ZKcIfS/zrhGEookH0V4uYB1xh+ucqUEm68CE5G8TjotxptosFGwb4N3/cM1mrDMZtd
         Fh42b80p6Cl3NZUnD7yuPy8D9Ci7m4bY115uL124tyaAiQ63KQrcij66P0w1KHICNOON
         PNEAEyF7Ry5tjCppHqQLdFakEkUDk8DAKVduWqJk+EgnSpPsdb0WHoKlow/1+tIMtmIs
         qdYA==
X-Gm-Message-State: ANhLgQ33HUIcmQCofPQ0aoErg55PcJ0slHaIUi7tXJ3CSiRW46ArX5fW
        0+T2pXLDbjnT3l+YfoQUfZnrbA==
X-Google-Smtp-Source: ADFU+vteAHmkMq+Gs1WexHwWt7Wto47wSEU8tcIx7f0ctaJaV5kC7TSMdbfOeVNwpiS0q7Lv13Csow==
X-Received: by 2002:a1c:81c5:: with SMTP id c188mr4457833wmd.98.1583340557147;
        Wed, 04 Mar 2020 08:49:17 -0800 (PST)
Received: from localhost.localdomain ([37.171.70.150])
        by smtp.gmail.com with ESMTPSA id y3sm909226wrm.46.2020.03.04.08.49.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Mar 2020 08:49:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: msm8916: Add CCI node
Date:   Wed,  4 Mar 2020 17:52:56 +0100
Message-Id: <1583340776-27865-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The msm8916 CCI controller provides one CCI/I2C bus.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this patch in the series
 v3: add only cci node for now

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8686e10..985cb5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1451,6 +1451,33 @@
 			};
 		};
 
+		cci@1b0c000 {
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
+			cci0: i2c-bus@0 {
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

