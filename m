Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966241F1335
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 09:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgFHHJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 03:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgFHHJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 03:09:34 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B925C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 00:09:34 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s1so19103896ljo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLHXN6AWltCIBxs2DNSCGZ0DX+K3s3X6F8h3xg9dmHM=;
        b=rqhpmzBMr0ZmT3IS15wvsjt+shYjUl/MkyLX04MMwELrKIC2nhBgNDywQIyzmsHccx
         +2uGTY0M3uPVbDDXjn10U0+gZhh/QGE5A5AnT2vmjxwJpW2A+a+KrofSkcCdexMVRC5Y
         nFfXJ/tAws0MZ+BdPNWJKjIq6p8/3214drcaP6lyGd6Y/XZtkxHXuE1PO3tuIWMrh/Ys
         Cl+hCfK4Mqws6z1pseEpF6PjYnkJW4toov6aaWHZkr5OheFrXE+GhvY0Aw8MSWaWNT76
         QvLc8XwNZH9dGUUGHPfbRAKt5Kuc40yIjK6mcqiplHuq+b4A+szaSafNLZRussdg27uG
         Mxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLHXN6AWltCIBxs2DNSCGZ0DX+K3s3X6F8h3xg9dmHM=;
        b=JTfDDa3Cf7zavbAwGQks5ChAr02A5MnMstlOR9X7FgE4l2yf01iCgGNr3Yer/nGqA2
         jjXahzwjDp/YDGXWvDheBS18D/NuPla6FZz16qQjgxjkD/w/Txfzidl8lJOgAOpZVIUy
         Vhns5jffRAz+KITo0Ps2noTu6QjXw73Yz6V2yWS6xlSrLR2F+iinsi/NL/SeHzRsdyrH
         WAo+1FuhPzCM+xrzNK3F1qy6BvY8/+2IZ6Msp/dXirzLa0gecgOm2BjDFa5qf2z+y+WT
         JSU/fDS6runlpM7gFD58aBJHyAjDCNXHGOoSJh+snaMcto1cPp/PHPuJU+SAXdyunDAu
         vYCg==
X-Gm-Message-State: AOAM530nIgHocjbmxJYWjmOoS7W8mRF8Nb4nWlOmkYkUQyWbqi0fK6BS
        KCyu7fuM+orbDNBwoTTenu0/RODsN4Y=
X-Google-Smtp-Source: ABdhPJwmn8EDKRgBdqaIHjIFkjdAeHcs2vHaYa1ppUzzJYGx5Vn/ROwc0gkIovk1v0oXFn2K6FVBfg==
X-Received: by 2002:a2e:8601:: with SMTP id a1mr8729523lji.255.1591600172465;
        Mon, 08 Jun 2020 00:09:32 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id o2sm4168948lfc.85.2020.06.08.00.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:09:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: qcom-msm8660: Add GSBI1 SPI bus
Date:   Mon,  8 Jun 2020 09:07:18 +0200
Message-Id: <20200608070718.59666-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GSBI1 can be used to enable an external SPI bus on e.g. the
APQ8060. On the DragonBoard APQ8060 this SPI bus is used to
talk to the LCD display.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 480fc08cbe8e..5b21fbc12d37 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -130,6 +130,31 @@ gcc: clock-controller@900000 {
 			reg = <0x900000 0x4000>;
 		};
 
+		gsbi1: gsbi@16000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <12>;
+			reg = <0x16000000 0x100>;
+			clocks = <&gcc GSBI1_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			syscon-tcsr = <&tcsr>;
+
+			gsbi1_spi: spi@16080000 {
+				compatible = "qcom,spi-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
+				clock-names = "core", "iface";
+				status = "disabled";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gsbi6: gsbi@16500000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			cell-index = <12>;
-- 
2.25.4

