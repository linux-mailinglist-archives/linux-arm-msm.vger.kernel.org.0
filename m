Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F44F5E9250
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbiIYLGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbiIYLGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:06:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E17931ED5
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:18 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d42so6861469lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=c3vr9ZcVCz9cz4XS0JEceE2ICtAEiQioi8Jl3QwESv4=;
        b=jMdOMRCSdiINsgdxHOvy9wHBcF7bRjSjqJjTHA1FEq+LmhWXa54aYuTs3N7QSp8C+q
         /161jGZdpnmlk1alg9Z/Io/u/ByDy3FYP6UxCbVBcnJJVnwseYggOC2j5pGvIdu9yoEL
         7Iwpy1ECYXUEdezqJgUWTk7ftYS5ZUS/e/rM0vUZtLK6TpAn/5X/tXw13IXxhHZwL4kH
         3w6lkegER3vLyqVGu6M37s5BvLVMb26xLpo0RZrMY0HVn9MezZ4QMthShoXU8ThzXTOE
         1cJwgrl3zvM9FZHqD2zrOlnPTRgubLyQVxrQjSYS0bbzHaBiO2B9rtkQNaB/MuSd4r6k
         qZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=c3vr9ZcVCz9cz4XS0JEceE2ICtAEiQioi8Jl3QwESv4=;
        b=D4duqb7UWOG+OKSVHXvvl/VU/ccibEmVLRHZLVZN8jHbRk+uz0ASk4MyChcuC408+o
         YaiGts68E8W0Rloo70saN8TGUSyjSTFBbL9j0UhG4z6ouAsHdi5oeOz/4j7MujtTNsA0
         sojH8n0Gz3x1/lpYE1koEoPPzVQpMpgZbnLvduCtPKv+w6kTDl8oQKiL+qSgeEtZH+sY
         430lu9x+oN/UYNVp5wpRBq9cd/aiTTC65iJoL+NYFKaIrtz5UN0P0sA0iuuM1qDWbq4b
         /kKEZ7hvvlTDWm2PA960prS4CZhdDmTd72sT4irPD9NKyyB7sblu1BZCh3ZmCiU0k3GG
         6yEw==
X-Gm-Message-State: ACrzQf0/f/gROSQE7f/ZMbdLFZAbv5lLyPaVLgkajcqm7TcvV3pN8RfZ
        fKGWOQ291GL+xeQFuuIajfbCDA==
X-Google-Smtp-Source: AMsMyM4JC1lcNK87LMmGzqJjfEddk8jD/YrDbuIGylz78nIuBbuzfAIBJ5M9k/y3RUqvYddCxvXufg==
X-Received: by 2002:a19:5505:0:b0:497:ad71:39f4 with SMTP id n5-20020a195505000000b00497ad7139f4mr6660486lfe.226.1664103976886;
        Sun, 25 Sep 2022 04:06:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:16 -0700 (PDT)
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
Subject: [PATCH 03/15] arm64: dts: qcom: sc8280xp: align TLMM pin configuration with DT schema
Date:   Sun, 25 Sep 2022 13:05:56 +0200
Message-Id: <20220925110608.145728-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema expects TLMM pin configuration nodes to be named with
'-state' suffix and their optional children with '-pins' suffix.

  qcom/sc8280xp-crd.dtb: pinctrl@f100000: kybd-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'disable', 'int-n', 'reset' do not match any of the regexes: 'pinctrl-[0-9]+'
    'disable', 'int-n', 'reset' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts            | 12 ++++++------
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index fea7d8273ccd..a2027f1d1d04 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -374,19 +374,19 @@ &tlmm {
 	gpio-reserved-ranges = <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -410,7 +410,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -418,13 +418,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b2b744bb8a53..68b61e8d03c0 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -350,19 +350,19 @@ &tlmm {
 	gpio-reserved-ranges = <70 2>, <74 6>, <83 4>, <125 2>, <128 2>, <154 7>;
 
 	kybd_default: kybd-default-state {
-		disable {
+		disable-pins {
 			pins = "gpio102";
 			function = "gpio";
 			output-low;
 		};
 
-		int-n {
+		int-n-pins {
 			pins = "gpio104";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset {
+		reset-pins {
 			pins = "gpio105";
 			function = "gpio";
 			bias-disable;
@@ -384,7 +384,7 @@ qup2_i2c5_default: qup2-i2c5-default-state {
 	};
 
 	tpad_default: tpad-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio182";
 			function = "gpio";
 			bias-disable;
@@ -392,13 +392,13 @@ int-n {
 	};
 
 	ts0_default: ts0-default-state {
-		int-n {
+		int-n-pins {
 			pins = "gpio175";
 			function = "gpio";
 			bias-disable;
 		};
 
-		reset-n {
+		reset-n-pins {
 			pins = "gpio99";
 			function = "gpio";
 			output-high;
-- 
2.34.1

