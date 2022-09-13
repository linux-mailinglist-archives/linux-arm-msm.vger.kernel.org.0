Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6D85B6E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 15:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiIMNOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 09:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiIMNOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 09:14:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CFC103B
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:32 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y29so14314227ljq.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AYTfQ/8q3iOQdS6L9K3xlP1uJArjxjNbvxSZu1MZ7EM=;
        b=lRrz3GkDbD4TxHnjuoqCBPRZOr1Mxb1x7Zl8/uUpFnYBknsuXIdXe78tDX7FVQxlga
         gUnzM4dt9uaO3d5IftuEQ3oUoSVbufhrz5ZMmDZw9eFcBUKmRGZkByeK/nTtJkczz46r
         4NfQP/6sRNFi3bYZnR356Avxx8zh9Wz9SDX+gHXMLFJ+NEto9MEKdKclZytWBoKGP7ga
         K1UmjlHskeL2wbi0iXXCcVdUdk4wUl9E4KGDAwCxPvWJBk1OpEpz26KRJirDZwhMLEWQ
         C35ldYv3nispJKDX1s2oZmTIR/v0sgKZU21LO2D3XvhBsLzoSQemqTMUEywu4Ze+8fhs
         rIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=AYTfQ/8q3iOQdS6L9K3xlP1uJArjxjNbvxSZu1MZ7EM=;
        b=NYk2gMra+MbBmxyB9rd5MpH36aSDmkuhDDzUozsVQyauX130XYfeqEDq/TIuF05esc
         /x+D69N2JR1LRYuB4XzQQ7Wo7RAwvqGDOjj9ZwLpKjqqQs8fklKtGhf45TLLpJEvNvjZ
         DU09k4xzQXViUhYyRohVYJMruyTLVVikqkcC4dLE9XsBLllYIwxqdv1yS0vJQu0t4tqh
         XqTCSM/2+i4t19BoCpeihlCQifZvrx/Nr5uYLow9aTGwMQCQOhVrCpD4QA+uPq7N8/Jh
         aYnoz4IVp8RocTglZ680wfon3NJ4Uh9ra9VV7WUz8sY9iJS0eVm+0H54UBPpvzyiS43m
         XIKg==
X-Gm-Message-State: ACgBeo0DjDnt5hC3WBvAZaLkD81c5xbr2deVmMkUqGKALEQVcL00LNgg
        BcKn0FqJBYyyeJ3UTSpZN39M0Yj4RHLBtg==
X-Google-Smtp-Source: AA6agR4uKOApQ7WOXaFOnodnLebBEqOFd2k5vgd5QImfjiO/IWNQeU9a9+0mt5wu/o+h1BXYKMzNvw==
X-Received: by 2002:a2e:be9b:0:b0:25f:e027:4999 with SMTP id a27-20020a2ebe9b000000b0025fe0274999mr9514661ljr.395.1663074870524;
        Tue, 13 Sep 2022 06:14:30 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m25-20020a05651202f900b00492f5ad0ae7sm1703255lfq.43.2022.09.13.06.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:14:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom-msm8660: Add GSBI1 SPI bus
Date:   Tue, 13 Sep 2022 15:14:21 +0200
Message-Id: <20220913131423.304804-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 63a501c63cf8..5640c02db852 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -131,6 +131,31 @@ gcc: clock-controller@900000 {
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
2.37.3

