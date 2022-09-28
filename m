Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043A35ED8A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 11:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbiI1JPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 05:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbiI1JPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 05:15:00 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E596FD120
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:57 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id e18so8108604wmq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=pO1LhJ/5vLes6LBQ95oOOVk/Qa5Nb0E3tUK4B+CQ1TU=;
        b=X6x9KHx0JbnHRU7uWPj00EBG7xMl2XZwGTmeelCXNX5ZGnXvoG5mdG5bXuTnhrMMZ8
         Kdosc8A9tW22wfpG0LP2BrBixbkgT81ZRbMZWFqPBlu3m7xKe1XSYGnBYEj9x7uY8ESk
         3sprC88nmwaAs9pDlTs4KGpSAQilvwaDqz2u8Lh2QV+XTZ5UfFUvMwKCb7mVtR/boXzO
         +ZyRd6PEWNoZ0ww0ldVMAQTQRGJBuC1LDkcQHe9aZBy0Fr702pSVjIaPZRsYCsbfcRMn
         lKwEoRD8KiS1AjtVQGPX9YQtHRnNXoJpZacvr7P+Yss5wZ1QMDnPP1tKW0fa5j0XH0As
         G80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pO1LhJ/5vLes6LBQ95oOOVk/Qa5Nb0E3tUK4B+CQ1TU=;
        b=HRGx/wNvl4rTFQ9HAZoW40GB4R1cdLSThxunSku70oj+Cyky8QpHpz/RRtuG2/Vh83
         MKypBG7ww3AnfoaOt/0+L5S0bA4FWdb4RiAviAsBBh2f2rDaZBHP79/Q74E04MXKuFDn
         g/hvXVJsVlRvXO8bPG+Tsr2o2D6n80U091R1O4+eJmojlqEn+L8RO+hPrn65NQ0lj4u1
         v6JxtlJTCznfgLt5GYEizWGM4533mu/XzJLE8SexhafY4OjSziwH+JpqQAmyeoO4Zv8L
         zdpIlXhVeKAR21lPPYfU+dFbw7pnnBay1UbfPpWQz5JA0zVc6jdQXpnDj/51JhAMjmdl
         vX6w==
X-Gm-Message-State: ACrzQf3BYpI3ruo+jPHjMvNJtKlKcP20rn7kJfroy5A8pesoCwklNemT
        fSSg+xY6rWOKcjxc/EK+EYFL/g==
X-Google-Smtp-Source: AMsMyM7pUFmrtpT2SyT1r2VjwwKy8Voy5XBgDeVEoM3wqngJ8ePkhE3Y+4C24RYK2paO3dLglEns5A==
X-Received: by 2002:a05:600c:154a:b0:3b4:c9ec:41df with SMTP id f10-20020a05600c154a00b003b4c9ec41dfmr5683123wmg.109.1664356496407;
        Wed, 28 Sep 2022 02:14:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b0022a53fe201fsm2420016wru.68.2022.09.28.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 02:14:56 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 28 Sep 2022 09:14:54 +0000
Subject: [PATCH v1 4/7] arm: dts: qcom: mdm9615: remove invalid spi-max-frequency
 gsbi3_spi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v1-4-b6e63a7df1e8@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The spi-max-frequency property has nothing to do in the controller's node,
remove it and fix the 'spi-max-frequency' was unexpected dtbs check error.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index e547becc9f75..792aa98cc136 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -170,7 +170,6 @@ gsbi3_spi: spi@16280000 {
 				#size-cells = <0>;
 				reg = <0x16280000 0x1000>;
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				spi-max-frequency = <24000000>;
 
 				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";

-- 
b4 0.10.0
