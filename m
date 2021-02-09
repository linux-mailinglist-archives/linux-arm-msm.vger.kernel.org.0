Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC5F314F74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 13:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhBIMtu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 07:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhBIMsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 07:48:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F8AC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 04:48:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j19so7798476lfr.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xp4VsyxHOqEhAHKGKETwGM5yW+arT2DW9ndgALlXFUI=;
        b=VJQgEYgh/6TlrvPjTOFLEaycDf/O++jvI4hnbuHqHs4c4ucVlCf7Q7c1A18kwLLPqT
         IYhxk9rQiRsFYqt5OpupEgTcf6LK9plghgxO/r+31vKhcZKQzPBHy7NzhAzSTHePQblK
         0m+78GAXYNlse6Oizy8BvnRxlPsVGd41EG0hfNjO4v+DtTYioZfnl4qgYHQAWQCgogUH
         75u//HxfjT1o0l5pqartI4tJH+ve40HkQ+pv4Ylk69L3PfzM22sDTqduc8tLKp0wRFUv
         nCiD4bls5m5WUcc/rK88wgMu5r48x8qtnLhZghDbQddFDY6lbnAdgzUrX8BWDQJk8+oP
         kf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xp4VsyxHOqEhAHKGKETwGM5yW+arT2DW9ndgALlXFUI=;
        b=taiziAVFVYaXI9kLjuzNFq9h5mD3eR91fwmXNcGE3ESpc1BMWeIKeDl+uQXRExVv9d
         HjbnAF9Le5R4uZjg0OVh2XeW6YNh5ERaZfW9QE1xysiV3jskcU5KhkeQghNrnQniso5C
         pYT496492c5t3zphSOdNNAEzjqANggwUWHteXu2xv7x8E/PVoYLWJKUyD+2p5sGm+Vcr
         cOcjfmIXCb1JUrso3OugWof3ahWsnKpdnov95eenAtDNlvqSNRIvUTxyBw4ORFzADOQL
         mgNyz7gxcOQ4ybxH9BT39sE+JKtZRuT6S5Dt5jAVdtDc7byIB67IxhnKs7VI4PXCcJsH
         xm0g==
X-Gm-Message-State: AOAM533DdBFeJ8Qz1qMu1qdLZ7JXIZFeLFTv3dpscFa1PuNZ3mTaGFGl
        hF+GyTG/ielrXTemdas4K+TcAHiFoqevW7aZ
X-Google-Smtp-Source: ABdhPJxoMsDcNsgbqD8482dPCDvvMDy8obwjdlP8CsF85z584Ox3LufWj7Zwa76koUzxIieUAVzJkg==
X-Received: by 2002:a19:88d7:: with SMTP id k206mr13344264lfd.476.1612874889251;
        Tue, 09 Feb 2021 04:48:09 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id e16sm1220653ljn.105.2021.02.09.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 04:48:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
Date:   Tue,  9 Feb 2021 15:47:55 +0300
Message-Id: <20210209124758.990681-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
References: <20210209124758.990681-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed on linux-arm-msm list, start splitting sm8250 pinctrl
settings into generic and board-specific parts. The first part to
receive such treatment is the spi, so split spi pinconf to the board
device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |   5 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 300 +++++------------------
 2 files changed, 65 insertions(+), 240 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 2f0528d01299..787da8ccba54 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -815,6 +815,11 @@ &pm8150_rtc {
 	status = "okay";
 };
 
+&qup_spi0_default {
+	drive-strength = <6>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 947e1accae3a..51d103671759 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2984,303 +2984,123 @@ config {
 			};
 
 			qup_spi0_default: qup-spi0-default {
-				mux {
-					pins = "gpio28", "gpio29",
-					       "gpio30", "gpio31";
-					function = "qup0";
-				};
-
-				config {
-					pins = "gpio28", "gpio29",
-					       "gpio30", "gpio31";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio28", "gpio29",
+				       "gpio30", "gpio31";
+				function = "qup0";
 			};
 
 			qup_spi1_default: qup-spi1-default {
-				mux {
-					pins = "gpio4", "gpio5",
-					       "gpio6", "gpio7";
-					function = "qup1";
-				};
-
-				config {
-					pins = "gpio4", "gpio5",
-					       "gpio6", "gpio7";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio4", "gpio5",
+				       "gpio6", "gpio7";
+				function = "qup1";
 			};
 
 			qup_spi2_default: qup-spi2-default {
-				mux {
-					pins = "gpio115", "gpio116",
-					       "gpio117", "gpio118";
-					function = "qup2";
-				};
-
-				config {
-					pins = "gpio115", "gpio116",
-					       "gpio117", "gpio118";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio115", "gpio116",
+				       "gpio117", "gpio118";
+				function = "qup2";
 			};
 
 			qup_spi3_default: qup-spi3-default {
-				mux {
-					pins = "gpio119", "gpio120",
-					       "gpio121", "gpio122";
-					function = "qup3";
-				};
-
-				config {
-					pins = "gpio119", "gpio120",
-					       "gpio121", "gpio122";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio119", "gpio120",
+				       "gpio121", "gpio122";
+				function = "qup3";
 			};
 
 			qup_spi4_default: qup-spi4-default {
-				mux {
-					pins = "gpio8", "gpio9",
-					       "gpio10", "gpio11";
-					function = "qup4";
-				};
-
-				config {
-					pins = "gpio8", "gpio9",
-					       "gpio10", "gpio11";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio8", "gpio9",
+				       "gpio10", "gpio11";
+				function = "qup4";
 			};
 
 			qup_spi5_default: qup-spi5-default {
-				mux {
-					pins = "gpio12", "gpio13",
-					       "gpio14", "gpio15";
-					function = "qup5";
-				};
-
-				config {
-					pins = "gpio12", "gpio13",
-					       "gpio14", "gpio15";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio12", "gpio13",
+				       "gpio14", "gpio15";
+				function = "qup5";
 			};
 
 			qup_spi6_default: qup-spi6-default {
-				mux {
-					pins = "gpio16", "gpio17",
-					       "gpio18", "gpio19";
-					function = "qup6";
-				};
-
-				config {
-					pins = "gpio16", "gpio17",
-					       "gpio18", "gpio19";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio16", "gpio17",
+				       "gpio18", "gpio19";
+				function = "qup6";
 			};
 
 			qup_spi7_default: qup-spi7-default {
-				mux {
-					pins = "gpio20", "gpio21",
-					       "gpio22", "gpio23";
-					function = "qup7";
-				};
-
-				config {
-					pins = "gpio20", "gpio21",
-					       "gpio22", "gpio23";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio20", "gpio21",
+				       "gpio22", "gpio23";
+				function = "qup7";
 			};
 
 			qup_spi8_default: qup-spi8-default {
-				mux {
-					pins = "gpio24", "gpio25",
-					       "gpio26", "gpio27";
-					function = "qup8";
-				};
-
-				config {
-					pins = "gpio24", "gpio25",
-					       "gpio26", "gpio27";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio24", "gpio25",
+				       "gpio26", "gpio27";
+				function = "qup8";
 			};
 
 			qup_spi9_default: qup-spi9-default {
-				mux {
-					pins = "gpio125", "gpio126",
-					       "gpio127", "gpio128";
-					function = "qup9";
-				};
-
-				config {
-					pins = "gpio125", "gpio126",
-					       "gpio127", "gpio128";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio125", "gpio126",
+				       "gpio127", "gpio128";
+				function = "qup9";
 			};
 
 			qup_spi10_default: qup-spi10-default {
-				mux {
-					pins = "gpio129", "gpio130",
-					       "gpio131", "gpio132";
-					function = "qup10";
-				};
-
-				config {
-					pins = "gpio129", "gpio130",
-					       "gpio131", "gpio132";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio129", "gpio130",
+				       "gpio131", "gpio132";
+				function = "qup10";
 			};
 
 			qup_spi11_default: qup-spi11-default {
-				mux {
-					pins = "gpio60", "gpio61",
-					       "gpio62", "gpio63";
-					function = "qup11";
-				};
-
-				config {
-					pins = "gpio60", "gpio61",
-					       "gpio62", "gpio63";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio60", "gpio61",
+				       "gpio62", "gpio63";
+				function = "qup11";
 			};
 
 			qup_spi12_default: qup-spi12-default {
-				mux {
-					pins = "gpio32", "gpio33",
-					       "gpio34", "gpio35";
-					function = "qup12";
-				};
-
-				config {
-					pins = "gpio32", "gpio33",
-					       "gpio34", "gpio35";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio32", "gpio33",
+				       "gpio34", "gpio35";
+				function = "qup12";
 			};
 
 			qup_spi13_default: qup-spi13-default {
-				mux {
-					pins = "gpio36", "gpio37",
-					       "gpio38", "gpio39";
-					function = "qup13";
-				};
-
-				config {
-					pins = "gpio36", "gpio37",
-					       "gpio38", "gpio39";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio36", "gpio37",
+				       "gpio38", "gpio39";
+				function = "qup13";
 			};
 
 			qup_spi14_default: qup-spi14-default {
-				mux {
-					pins = "gpio40", "gpio41",
-					       "gpio42", "gpio43";
-					function = "qup14";
-				};
-
-				config {
-					pins = "gpio40", "gpio41",
-					       "gpio42", "gpio43";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43";
+				function = "qup14";
 			};
 
 			qup_spi15_default: qup-spi15-default {
-				mux {
-					pins = "gpio44", "gpio45",
-					       "gpio46", "gpio47";
-					function = "qup15";
-				};
-
-				config {
-					pins = "gpio44", "gpio45",
-					       "gpio46", "gpio47";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio44", "gpio45",
+				       "gpio46", "gpio47";
+				function = "qup15";
 			};
 
 			qup_spi16_default: qup-spi16-default {
-				mux {
-					pins = "gpio48", "gpio49",
-					       "gpio50", "gpio51";
-					function = "qup16";
-				};
-
-				config {
-					pins = "gpio48", "gpio49",
-					       "gpio50", "gpio51";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio48", "gpio49",
+				       "gpio50", "gpio51";
+				function = "qup16";
 			};
 
 			qup_spi17_default: qup-spi17-default {
-				mux {
-					pins = "gpio52", "gpio53",
-					       "gpio54", "gpio55";
-					function = "qup17";
-				};
-
-				config {
-					pins = "gpio52", "gpio53",
-					       "gpio54", "gpio55";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio52", "gpio53",
+				       "gpio54", "gpio55";
+				function = "qup17";
 			};
 
 			qup_spi18_default: qup-spi18-default {
-				mux {
-					pins = "gpio56", "gpio57",
-					       "gpio58", "gpio59";
-					function = "qup18";
-				};
-
-				config {
-					pins = "gpio56", "gpio57",
-					       "gpio58", "gpio59";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio56", "gpio57",
+				       "gpio58", "gpio59";
+				function = "qup18";
 			};
 
 			qup_spi19_default: qup-spi19-default {
-				mux {
-					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3";
-					function = "qup19";
-				};
-
-				config {
-					pins = "gpio0", "gpio1",
-					       "gpio2", "gpio3";
-					drive-strength = <6>;
-					bias-disable;
-				};
+				pins = "gpio0", "gpio1",
+				       "gpio2", "gpio3";
+				function = "qup19";
 			};
 
 			qup_uart2_default: qup-uart2-default {
-- 
2.30.0

