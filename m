Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC49827097B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 02:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgISApk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 20:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgISApk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 20:45:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49FFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 17:45:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s14so4885016pju.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 17:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xrlb3XGvCaOL+FjeGgO11z174Op2tNfC1yc8fly6Axs=;
        b=TCRH60J8GWdN2Kjphz4DwUcWPciS5nIbwWn1373tnXNPtsGJbX+H89VYki5UfmJfQY
         3a6XrAPYbdY50H+GDqbxRwpMcnCuIhOIwIPwuKOje8uC6oA6wLewh7aL1hVAEt8gpkp6
         ZcRDT2teXhQLTrOejXEaXVhRsmejls/x6RPmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xrlb3XGvCaOL+FjeGgO11z174Op2tNfC1yc8fly6Axs=;
        b=Z8doJB9UbareJpK09bQuD2iEZUw9Kqpli7tYA176S98FKN3ShZq8E1PVX1oDsMMrtU
         /v0xKrWkY6B8OCkPImswVeSsCOulsTbfzqHDKzmmZF7srRSKnTZYp9bDb+Ps7BjDWi4J
         GB5Ep3Bd6Lw144nspnpVIcYpWuowFRaNB3EaHfvc49yf2FyIt/jZxpPzUjMozhMgxfv4
         ySxOxtQLGKK9Kw7wM6bdYRPNVBu2eAlwtksPefUEvKA6pUbyE0wUTHC+uAiYnzSQNF8E
         1OSvh41amtK6WTwrOjgYCx8BUX+0XVSf1j2UnpbmxDVAdi5SlvKDCV/b/RX8dzOer6px
         gMww==
X-Gm-Message-State: AOAM531+D4uEZzIcLjh3DJi4B1y2mHgqn3oyrqsRavLZ8pXzTzNL5o0+
        vbJ+XchCHKVL+IHEOfxnQJ7GHQ==
X-Google-Smtp-Source: ABdhPJyo2F56dP9YXVDn/mj/mgzywiYpHJvnepgNC86b/+u2YYjaL+JG9SoLXT+kk5VUZxQ5jU6kvw==
X-Received: by 2002:a17:902:424:b029:d0:cb2d:f26f with SMTP id 33-20020a1709020424b02900d0cb2df26fmr33532913ple.8.1600476339479;
        Fri, 18 Sep 2020 17:45:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id j18sm4257479pgm.30.2020.09.18.17.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 17:45:38 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        akashast@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: Switch sc7180-trogdor to control SPI CS via GPIO
Date:   Fri, 18 Sep 2020 17:45:28 -0700
Message-Id: <20200918174512.v2.2.I3c57d8b6d83d5bdad73a413eea1e249a98d11973@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918174511.v2.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
References: <20200918174511.v2.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As talked about in the patch ("arm64: dts: qcom: sc7180: Provide
pinconf for SPI to use GPIO for CS"), on some boards it makes much
more sense (and is much more efficient) to think of the SPI Chip
Select as a GPIO.  Trogdor is one such board where the SPI parts don't
run in GSI mode and we do a lot of SPI traffic.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf875589d364..0759896a0df5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -776,7 +776,20 @@ &sdhc_2 {
 	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
 };
 
+&spi0 {
+	pinctrl-0 = <&qup_spi0_cs_gpio>;
+	cs-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
+};
+
+&spi6 {
+	pinctrl-0 = <&qup_spi6_cs_gpio>;
+	cs-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
+};
+
 ap_spi_fp: &spi10 {
+	pinctrl-0 = <&qup_spi10_cs_gpio>;
+	cs-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
 	cros_ec_fp: ec@0 {
 		compatible = "google,cros-ec-spi";
 		reg = <0>;
@@ -937,7 +950,7 @@ pinconf {
 	};
 };
 
-&qup_spi0_default {
+&qup_spi0_cs_gpio {
 	pinconf {
 		pins = "gpio34", "gpio35", "gpio36", "gpio37";
 		drive-strength = <2>;
@@ -945,7 +958,7 @@ pinconf {
 	};
 };
 
-&qup_spi6_default {
+&qup_spi6_cs_gpio {
 	pinconf {
 		pins = "gpio59", "gpio60", "gpio61", "gpio62";
 		drive-strength = <2>;
@@ -953,7 +966,7 @@ pinconf {
 	};
 };
 
-&qup_spi10_default {
+&qup_spi10_cs_gpio {
 	pinconf {
 		pins = "gpio86", "gpio87", "gpio88", "gpio89";
 		drive-strength = <2>;
-- 
2.28.0.681.g6f77f65b4e-goog

