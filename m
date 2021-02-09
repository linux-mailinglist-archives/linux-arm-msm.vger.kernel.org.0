Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91A2331589C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 22:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbhBIVZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 16:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbhBIUj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 15:39:27 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A57C0698CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 12:28:57 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id h26so4102037lfm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 12:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xp4VsyxHOqEhAHKGKETwGM5yW+arT2DW9ndgALlXFUI=;
        b=b+p4OX1p9P1I1qr4wpx8uFUayUQtZ+P1yidIohv20NrhAdrOt1Fii3hjXl8NLMKTL7
         kmi339UCip0vlK1fsCsX7++JKM633J+tmcsFblAaDE+dG8YBoatRDCWoRfMgYLFJxZs9
         n3IRvVPFU6NqsalGXKtl2CynB6G5ObcYLS73CUkrQp2WevJEqUijTCPrEMTi2J2fsrBa
         UZqD7jFZzck8fhXi6JsuhMbJYLqW9CRTaFtalbgUBEnpoV80N+vQ4CfNIVhBdcEfGoBP
         jbODiDvZUKIiHzyduYeWxTWGphzyWHGqDSVEN0YXEk4oX/0MtDo2i0LiP5kcn2zjRsCD
         +WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xp4VsyxHOqEhAHKGKETwGM5yW+arT2DW9ndgALlXFUI=;
        b=WfPvftOhVvAfL3Teeq//wGSIYoKVm5y3+FYJK0BeMjxlFB86z01EsxqJ961zGQ3n7O
         M/Utg2ItyZyTrSRz2QPgdyGsPZH/yveFBlZ0TcndkwBcvfDEq2fos+7w+Yjoiq2/of0x
         A98eAIpakRfTa2UKb0dRMywS5riEzr7VbrKIgGH2AG+R8W46HiQZcDGVSFD9p9TZir8m
         mb3XYHBJ/Bf2fDOAnpJmeHxD5YNqaxfS4DABdvs1aThxpibrCmkmsWWR/i8BqoarTLUD
         ZqFUSHNoO229ijGRxXPUD4fsznHK/u01jSlfcrkjnMIYuBaTBu09E8f0BCk2otdQozVF
         qIFQ==
X-Gm-Message-State: AOAM531eO6PnDTpit8ZCWcrPRNRbF9BrYfIVFzMgaZUKEgzDVt9Aca0w
        KCsZPw+p8OnLqCx/MLP5y2U1dg==
X-Google-Smtp-Source: ABdhPJzytWhkNYfZZ1ZH/sU1Z9X1io2rHHrveGZI5AhnJnRNR7QmUzD2+JfPwciMoDb7z+XnioAIbw==
X-Received: by 2002:a05:6512:130f:: with SMTP id x15mr14295414lfu.259.1612902536271;
        Tue, 09 Feb 2021 12:28:56 -0800 (PST)
Received: from eriador.lan ([94.25.229.138])
        by smtp.gmail.com with ESMTPSA id o19sm2680449lfu.182.2021.02.09.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 12:28:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
Date:   Tue,  9 Feb 2021 23:28:46 +0300
Message-Id: <20210209202849.1148569-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
References: <20210209202849.1148569-1-dmitry.baryshkov@linaro.org>
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

