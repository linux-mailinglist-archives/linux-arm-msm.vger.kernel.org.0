Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9170073F05E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjF0BY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjF0BY2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:28 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9390173C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so46979e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829065; x=1690421065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYkQHL6lry7VO64+ZtcbjdDVvh4boYbgCY+jGtA/4rk=;
        b=DoyF63ywVBuhSRpQulWP3wnhTnQD7TDCP2vV4H4tpNbOAJni5OtCqix99JxV2G59ms
         XBa8vwEFOuLEc82ZCCHAvzhsYiINtKVzTgFUuLvAQ8Dd1STX4eGaI31rV4eNxF2e2SUW
         TgdbP4dCysYJ/ILE1Vlo+ahNrARTPa8If3tatyWQKc6PLRY1VT2cl5SXSfDBtiq7yTil
         f85elHkoz2M+6NZJwZ/me6h49LbV3rdZr3Ro0fYxUzn3eCJvGRP82uuylIpmHy9GL4Vc
         9wY3z/lzZ06Yy+rpoEkbTMQ6HPYwUGhe4kBMdYiLZ012BnumLt2rn+TmixH6WNNp7Vzt
         GAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829065; x=1690421065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYkQHL6lry7VO64+ZtcbjdDVvh4boYbgCY+jGtA/4rk=;
        b=G7+IKoWOIoK6vhVQiK71ZE1TZdF+Ldq/kCkrIEXgaCOyBbPSeLe9pfCSoXKedjdOFa
         k+5SLU5ctYF8bM3ouQJKeoW3RLno24c+7xkZRgCW8HqijmcM8yrj4rSxDm8U5ivvKS48
         7QqRr+D85HD+7B1PRkQpgdTv8KNgpo5VsVdGMDjOlTWxuHFWeuoIRz5OgeTKrBZLRNjI
         ws+FbrgW5j3qgYNHuXOyi0ds3PBbYFCwurq3jdPqLRNqscuR1vj0RDE0ghCdP/G4ddgN
         rKK3O4a9wVh6Y+Sxdke/SfDh5TSCcku8XM1ipANBMAHUaSPStLYMB/U/X7h9Z1t/hliK
         6aGg==
X-Gm-Message-State: AC+VfDxHAdrqkr6GjRDUNItjGtSEzI9yVSRbZiJP8F1ydowDMiGziFSS
        bSdhmdMmAqVSX3IhR2TV/czkMw==
X-Google-Smtp-Source: ACHHUZ5jETTTNgbtu6aAIf3kgja4GidPVAcx9Or261fhIUwMsDJHi1nnXhEvfMupltAD2jTn3HqGdQ==
X-Received: by 2002:a05:6512:3b06:b0:4fb:77d6:89c3 with SMTP id f6-20020a0565123b0600b004fb77d689c3mr2868253lfv.12.1687829065024;
        Mon, 26 Jun 2023 18:24:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 02/15] ARM: dts: qcom: msm8960: introduce label for PMIC keypad
Date:   Tue, 27 Jun 2023 04:24:09 +0300
Message-Id: <20230627012422.206077-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To simplify MSM8960 CDP board file, add label to PMIC keypad node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 20 +++++++++-----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi    |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 6c1bc3818883..4641b4f2195d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,17 +88,15 @@ clk-pins {
 	};
 };
 
-&pmicintc {
-	keypad@148 {
-		linux,keymap = <
-			MATRIX_KEY(0, 0, KEY_VOLUMEUP)
-			MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
-			MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
-			MATRIX_KEY(0, 3, KEY_CAMERA)
-			>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <5>;
-	};
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
+		MATRIX_KEY(0, 1, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0, 2, KEY_CAMERA_FOCUS)
+		MATRIX_KEY(0, 3, KEY_CAMERA)
+		>;
+	keypad,num-rows = <1>;
+	keypad,num-columns = <5>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fa2013388d99..913bc6afd0a1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -283,7 +283,7 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				keypad@148 {
+				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
 					interrupt-parent = <&pmicintc>;
-- 
2.39.2

