Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCAA30949A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 11:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhA3K6n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 05:58:43 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:50042 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230104AbhA3K6m (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 05:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612004278; bh=KdlNGAY4nK3WzfQuGgG4CVn1pnQONOfGY7E2y4sczAI=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=li/VCp0EEELn1k68E+rOMkWWVcaDIzp/cLaSGhFeW3fooYEREW2gwHkaWerutScHy
         1xbi4CctlP5jdyu0RYxCKUBKhMAzjtV/Wo0bKn/YR1qO0NFTy+nCpXhlGgPLySpkL5
         XE8iHUx5Nm/Xr1VXdOE6xust9FKk9qstDgGPJatM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Sat, 30 Jan 2021 11:57:58 +0100 (CET)
X-EA-Auth: jRcFJ1K7921araqJUCuoVbgFj3t8HOTYpAfJJim+4Y8zWpBfhHWKZv2k8KWwq/hIT+RqpQNKSxwVSlI7th0Enf6xryPgS5XXoSlrOMo6/Io=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        allen <allen.chen@ite.com.tw>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8916-alcatel-idol347: Add framebuffer support
Date:   Sat, 30 Jan 2021 11:57:13 +0100
Message-Id: <20210130105717.2628781-5-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add simple-framebuffer support and related reserved-memory block.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 540b1fa4b260..e4d22cec8ff0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "msm8916-pm8916.dtsi"
+#include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
@@ -16,6 +17,36 @@ aliases {
 
 	chosen {
 		stdout-path = "serial0";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@83200000 {
+			status = "okay";
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x83200000 0x0 (720 * 1280 * 3)>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+			power-domains = <&gcc MDSS_GDSC>;
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>,
+				 <&xo_board>;
+		};
+	};
+
+	reserved-memory {
+		continuous_splash: framebuffer@83000000 {
+			reg = <0x0 0x83000000 0x0 0x1400000>;
+			no-map;
+		};
 	};
 
 	gpio-keys {
-- 
2.29.2



