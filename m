Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7CC789AAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjH0BAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjH0BAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 21:00:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A378CD1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4ffa94a7a47so3218261e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693098004; x=1693702804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=bOJC7z4KRBqy3r61moEvQtgWtEDBJ/g1i9A12Rk50O4M5mng9bgQbnyx+t7aFLBPAt
         G3R18OcnmDWK60nPXgHqcPC8VTGS+l0Mp3myB5KfhiipLLh8wDyEQLzhywNvVEZqKUOu
         DFqi6ovvKrwc9xmoyJu0DAiay2oST/jTApY7avZHwo5GHbMJQp+28cAgbhbjihpGeA7V
         PzODxzhHeK8RHopezuKdkwidcBoPkNQuYJCSEk72jTvIyOYUnSuUMZYuZULnlaIsmVoD
         kEIUh/V0gW33tVBm2/7L5BGGD+/BDl6rXI/U6tNqetO9yMXAwXzUftCVCPEshUcg3BvV
         ZtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693098004; x=1693702804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=Jr1/Ms2tSwKFaONb1naXbNCsZL2KMp2lFYQNyD23l59jt24SaQjBBz6FBvECZe6cxy
         2FfACvskBfHpTvESRTy082K0Fo1upjeskV2smnvF2QxyemfwcG51bDrWvyPh8hbnU6qA
         tail0cj1e6H64Ca17bJUIe9qGXYPdPHh4mTaHS3OuyTdCpYsyd6ux2TDd+crfHgN6B28
         ICyrERxftdBx4jhHWJhwTwxT68ObxRU8AeqSwMFHG+dFaKdmzFvTyPvksiOT2PJ+yh/d
         zqhxmkmY7u/tp5JQMjESKUJCh0gaKqWWQVuPLu5Ycaagfv5zFXuUpbjQ7OiMJuffbXWj
         DzZA==
X-Gm-Message-State: AOJu0YxD/j+v3QA8EimURzOl8rZOIRWfJC0zUayhUAWx4D1qkO036Mod
        YtFKET6URk+noR8pmPF9otVcGA==
X-Google-Smtp-Source: AGHT+IGwIJOW2n2P7FY/gY0MrKKkYf6g0hYYDtVz2inuriDR40FzZyZZgSx6KqmqiOAvt0Yaq8zknQ==
X-Received: by 2002:a05:6512:2347:b0:4f8:8be4:8a82 with SMTP id p7-20020a056512234700b004f88be48a82mr18651829lfu.22.1693098004764;
        Sat, 26 Aug 2023 18:00:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.18.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 18:00:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 35/38] ARM: dts: qcom: pm8921: Disable keypad by default
Date:   Sun, 27 Aug 2023 03:59:17 +0300
Message-Id: <20230827005920.898719-36-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since keypad is used only by some devices, disable it by default and enable explicitly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 360a179670c5..058962af3005 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -43,6 +43,7 @@ pm8921_keypad: keypad@148 {
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
+			status = "disabled";
 		};
 
 		pm8921_gpio: gpio@150 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index a5ea4843db43..36f4c997b0b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -102,6 +102,8 @@ MATRIX_KEY(0, 3, KEY_CAMERA)
 		>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
+
+	status = "okay";
 };
 
 &rpm {
-- 
2.39.2

