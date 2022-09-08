Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87425B1657
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiIHIIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiIHIIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:08:09 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CF0D5738
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:08:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z23so18970216ljk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4oSg2P4H0c3IFq2G8ED04hH6+zeZ2P6mr31MJvIHYNs=;
        b=WdzHgHYOLisMlY4JWIzkCbxD+O5VCKLRal0erdnzhoz9mgsu28vk5UDVylPoflt7cA
         oR7C3vL3rF/j4q8wa0CzfYhBBkWr0mOpWrOj8zSfSb+s+g4OHkj8eD8WNcJNoR1JLmVu
         kI/DX5+4keNqGXLyp8PoubIjy+loL1a1nD/iG6eZjSVIlm/GF3aDpXy6NrAl4QDMTQxD
         4DavQC01DxwrOJt7ZWan0fz2tvA6S+tRfiaaoQm+e+dEXO/veKTRwJLoK50ZA55+ku5I
         aERajAFhCAZvZ1gJna8qW8Ie7MIn7RLoVHp3c5JpCSbKJwW1GEZoiIuja0XGxhMOP7IW
         bYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4oSg2P4H0c3IFq2G8ED04hH6+zeZ2P6mr31MJvIHYNs=;
        b=xwlq7lK5uVMRgTiGW9rxdPW71EutVgS2r1dnyVu4ufa5QRKsflvHjvg7hYXV+YVfVE
         WaEzHQBD/hZvoQUggtGBMqudYSNWw9eNdu8p2U1BIptazCN+EDlnv4hBwrWYmfFMHX8X
         4NP2uJGPVV9lgIpxqSFKK3yYy4nEhGp4qTj1UQVZvxg6GKCA15yotutoa2r3eRtXnr1J
         6SAiUOIOg3NBjvu6HPHjTtOOrssHoYSQGQuJGiDBDoTan+xKu2sRo30m0aw3cSDQSABT
         mK3urX1/4Qtgep8qVnMd4vDK5u1mW6FZjBr46CQf8V7rcAqAIZMEsFyorEFaHaZMKUgJ
         UUNg==
X-Gm-Message-State: ACgBeo2FiqX+xnmuY9cqqVvOqoQtMa4XwwgR7lPT/aCb4dtAERJhDUty
        I0M1P8K83z/f51Kq3bGUn/rfBQ==
X-Google-Smtp-Source: AA6agR7elsw7Te4mIKn3G/adi6mrcZqh7AcGgZteUMwQ8rw1iLZbiWgwxdmzY1Hg/jSYi7zm4N9nKw==
X-Received: by 2002:a2e:301a:0:b0:264:12f6:ead6 with SMTP id w26-20020a2e301a000000b0026412f6ead6mr2115406ljw.520.1662624484911;
        Thu, 08 Sep 2022 01:08:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c02c100b0026ab83298d6sm1425265ljo.77.2022.09.08.01.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:08:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] ARM: dts: qcom: use generic node name "gpio" in SPMI PMIC
Date:   Thu,  8 Sep 2022 10:08:00 +0200
Message-Id: <20220908080801.28910-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908080801.28910-1-krzysztof.kozlowski@linaro.org>
References: <20220908080801.28910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GPIO controller nodes are named by convention just "gpio", not "gpios".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi  | 2 +-
 arch/arm/boot/dts/qcom-pma8084.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 9cd49deb9fa7..1ac477878c67 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -59,7 +59,7 @@ smbb: charger@1000 {
 			chg_otg: otg-vbus { };
 		};
 
-		pm8941_gpios: gpios@c000 {
+		pm8941_gpios: gpio@c000 {
 			compatible = "qcom,pm8941-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
index e77602e9f95c..0da6c1a5d547 100644
--- a/arch/arm/boot/dts/qcom-pma8084.dtsi
+++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
@@ -27,7 +27,7 @@ pwrkey@800 {
 			bias-pull-up;
 		};
 
-		pma8084_gpios: gpios@c000 {
+		pma8084_gpios: gpio@c000 {
 			compatible = "qcom,pma8084-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
-- 
2.34.1

