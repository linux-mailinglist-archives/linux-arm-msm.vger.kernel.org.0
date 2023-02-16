Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C466994E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 13:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBPMxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 07:53:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230427AbjBPMxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 07:53:12 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1976348E31
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:08 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bu23so1732810wrb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dibhyEZtmC71mf7EJSLWFvkJAQUY//1IZfvc8uLBhaw=;
        b=E160OixKVn90Zpizo/M3/xEFYcyRRa/ZXahSb91waDLEM8CkY0pOfJ94KT+2CNrbpA
         OIcBQJtTj0JiQkqn1kf9QeiLKuzWxrWBwj7BooNZiopqlGCjcOAiM4z1T7xw1lH5EHJm
         xs5M/1mJGlg/2V5R79Jo9i3nbWQgEjOl7dZIRkdwOjI0C7CRdzHsEjLnIBvGLSYBqVnP
         /jmX7rxl/uCnZCY12BM/DppcSV3eborERAUSxomSX8wSQV+pdtZDOmdqUe2GMop5YKZN
         rBzG2nY1i0t7WEncfe5lXrtRT+QYAwq+bHoRPdf8x2qvaZSUGfnxMx6QsxUyJY0hYnds
         ys+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dibhyEZtmC71mf7EJSLWFvkJAQUY//1IZfvc8uLBhaw=;
        b=q+hKBiUNPRigsZR7pYwvB79usiCBuUS5bThE2mXPtnO3sZdUsSUOp11MQ77BpHbGqZ
         AVXH/6k6Hh3Ko9+8PK/lcc6xZ40Zxd5rXQUo+4MO/c52Fty7ad4gjpP9fUr887YRrq/n
         H6gDjCIvS2YGIUGJArz7RcVP+NAmRnYIFUjhSFdKkMavTAJAJlx5eXYdSrpA8MGfg7lt
         4qeLRYL1zOTBjPX3puGT6N6AVL82tjsaK4qRzO0d9t0LtWvjvURDth0PyEXgnEElViFu
         SkGBIuQtdXjpc3QL9/FW17Jv9tbdhk0KRq3c1nIpC+8iQzSqaL1axxKxJWLKaRHFXqGH
         Qj4w==
X-Gm-Message-State: AO0yUKURnN+Bmf9MZ9I4Hyx91DHd+r6aKQGrulO+KNIc4zPTvGSt3nkW
        5wsGJzANEF+kdyqqKI2F/5nhGA==
X-Google-Smtp-Source: AK7set/4zjAVRkIhO53ldU71bp1KqctiEVHhvuH8slmb/qQuJ2do0Q9irXuM9u4q8pEeHCQsPd8O8g==
X-Received: by 2002:adf:f450:0:b0:2c5:5759:12d2 with SMTP id f16-20020adff450000000b002c5575912d2mr4825255wrp.35.1676551986668;
        Thu, 16 Feb 2023 04:53:06 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b002be5bdbe40csm1453292wrs.27.2023.02.16.04.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:53:06 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 6/9] arm64: dts: qcom: sa8775p-ride: enable the SPI node
Date:   Thu, 16 Feb 2023 13:52:54 +0100
Message-Id: <20230216125257.112300-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230216125257.112300-1-brgl@bgdev.pl>
References: <20230216125257.112300-1-brgl@bgdev.pl>
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

Enable the SPI interface exposed on the sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 5fdce8279537..d01ca3a9ee37 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart10;
 		i2c18 = &i2c18;
+		spi16 = &spi16;
 	};
 
 	chosen {
@@ -40,12 +41,25 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&spi16 {
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &tlmm {
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
 
+	qup_spi16_default: qup-spi16-state {
+		pins = "gpio86", "gpio87", "gpio88", "gpio89";
+		function = "qup2_se2";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
 	qup_i2c18_default: qup-i2c18-state {
 		pins = "gpio95", "gpio96";
 		function = "qup2_se4";
-- 
2.37.2

