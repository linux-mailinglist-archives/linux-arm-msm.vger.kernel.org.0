Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4319C6B21A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 11:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjCIKiZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 05:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjCIKiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 05:38:11 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A89E20A06
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 02:38:06 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h14so1371996wru.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678358284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4J+1GJ0DTm4BTyDlgRz+lJ76XEQHv+rIcqt4lsLOI0=;
        b=Pi6/etCxC3M1Ec9xrJa0vEZxTvl5yADqVtsEQHDYZWWvKfJzwnrQPBJQnHF5fBfeuL
         9SKKb/iKogiJJDyM4zbTE8X9KLBHpywwY5NFV0Jnieweud9+zuKNbLslGBN9zejgoEss
         k1RuoGjkmb9aen9dz2fP+OV9LeWDI9E0F9WX4f4nW+GGaHt3ICRsdKVXufYDMfcAm8/k
         n0NIauOJKLWRVIiLjoz70Ziw07ZUkU1qxyrdV8PMjJZTGvGy+pEQQCwajwEXshtQJ7Ph
         rcPyBbnfNg458Oyi2EEHp01RiebEAkjGiq9xWw5TxQWOGm2mQ83KxPW2Ubtyp7u46EmM
         V6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4J+1GJ0DTm4BTyDlgRz+lJ76XEQHv+rIcqt4lsLOI0=;
        b=KstdKCTk1l891duI/GfXkVcvlbV5mdmHH2iwphWjPJ5LknRNX1BBVx1Eo6lT0WdogO
         U0R/njDwKtz4PYa0wT/XADrrZrHH4dwgtweVNl/n4Kcfndwx3veTiO/ydQo+Om3n7mz/
         2eYsa8uceqV2dnCe5Grp+20hR5CGWD44Xlh7piF1lYrVnlnFr08NoE22ff8U7KcrpRkj
         uGLVjb2jD5K6DB+l92gXs31DQBKtPN7JbODAJk6+hJzoW5UDE3AsWDvOJeN08JpIBQds
         npqjRRopTOLumXD69C2QZjr9qvxowTjRu03ha+JzEvC6wATn8qj2pUwfUUUJL2B9wGkv
         B4AQ==
X-Gm-Message-State: AO0yUKWjgCl2BC+RDutPj6iNFwlLXYMP0Vlq9RTZPIUcu5c6vf6AdGOE
        OGbcrPP/JoTZ8ZDJro7MCStDIQ==
X-Google-Smtp-Source: AK7set/9cdU3wUGQmsIJBGi7HwZ8gdCGSZJhatqDvxbLAN3B+K+bRg3ptteM/per8kvHfDpk7tGoew==
X-Received: by 2002:adf:e681:0:b0:2c7:faf:af28 with SMTP id r1-20020adfe681000000b002c70fafaf28mr13879476wrm.43.1678358284462;
        Thu, 09 Mar 2023 02:38:04 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f14c:2275:50fc:c056])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d58e2000000b002c56af32e8csm17638119wrd.35.2023.03.09.02.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 02:38:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 9/9] arm64: dts: qcom: sa8775p-ride: enable the BT UART port
Date:   Thu,  9 Mar 2023 11:37:52 +0100
Message-Id: <20230309103752.173541-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230309103752.173541-1-brgl@bgdev.pl>
References: <20230309103752.173541-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the high-speed UART port connected to the Bluetooth controller on
the sa8775p-adp development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index cba7c8116141..1020dfd21da2 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart10;
 		serial1 = &uart12;
+		serial2 = &uart17;
 		i2c18 = &i2c18;
 		spi16 = &spi16;
 	};
@@ -93,6 +94,32 @@ qup_uart12_rx: qup-uart12-rx-pins {
 			bias-pull-down;
 		};
 	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+			bias-disable;
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+			bias-pull-up;
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+	};
 };
 
 &uart10 {
@@ -108,6 +135,12 @@ &uart12 {
 	status = "okay";
 };
 
+&uart17 {
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.37.2

