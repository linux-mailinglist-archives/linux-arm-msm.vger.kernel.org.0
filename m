Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E47B1941
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjI1LDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjI1LD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:27 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C58198
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-503056c8195so21173304e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899003; x=1696503803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yhFXWgI+Nw/HVhizDlvwlBGCzre1lf/F+Jl5Rt5/EM=;
        b=tLFkyi235JlGPgaODrdiP4Ox5p3a1HUeUw6aW+M/OtgSXsUwJdq3CkE70HfUEICRFZ
         BmFtiOofRoioLqxYJsZ2vDa9fVSrFpOMKRtLB2D5I1cUFm+pPHqeuy6mcVLlAeEhrnRf
         5VQKnMR5jAiPkdazqlm1DH0Y+2vG52h6DYDuWC9K/pENCFmHkANVeWKPWJ48HDDqiMrK
         Po3bF64StNQXTRS6qBNkS9nxeUXaBUtN3kYxZnwWwMnlrDjmt8BvE/IsJ4JkO/SK4pGZ
         JmEJgaVxbdbc42+uVFdZSkCilunkRe8gwD8AV/TeXrKzM8vuO4J72kuszqpburGE5fop
         B/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899003; x=1696503803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yhFXWgI+Nw/HVhizDlvwlBGCzre1lf/F+Jl5Rt5/EM=;
        b=Mqpuqw1tPBoeg96LZdWi2FS7b6UGf8LK9pfUNBnVtpeeo4eswwxE/fSsDaH2oRaBAC
         mYkYeUro+tvUM6/WLiDGOK6gNo6Y5383NXLh9g/Wgs5hmHYiIzSHuo9ge/jc3dTN2lR3
         o4u2EV7oHshDe99h9Fc3shN9FRiLGNa4cGHVWi9mIKH9XSneVFHFsa45H66upig0CA0P
         e+Nz+0eUY7psCaXEuNPacuGa8XGb+DRy6yygOTKnKTuCxYDgNEzwjEGodg7d90qkd/0W
         AMSKDT9lbVbHqSHKgajWpI5Mg74I7LI6t7m/HUkPiG4ctd+NX3B8xvHHsLNaaLmnfxJ1
         WPSw==
X-Gm-Message-State: AOJu0Yyvqmg07BTHiZyz8QyR9mF3R/g4iw/S8tghSq7/Hy0bwuiYgxsa
        ELkA6VrLZW6WcU6Oe1FDGgmebQ==
X-Google-Smtp-Source: AGHT+IGJ3VQlIwDXgujPjHoTOnOyrlE25RMQMjsLqHuYdGkNYO0mipGztQzoq6UxJQ9OULFdnsPCAQ==
X-Received: by 2002:a05:6512:1053:b0:502:9c4e:d46a with SMTP id c19-20020a056512105300b005029c4ed46amr1105183lfb.32.1695899002865;
        Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 15/36] ARM: dts: qcom: msm8960: move PMIC interrupts to the board files
Date:   Thu, 28 Sep 2023 14:02:48 +0300
Message-Id: <20230928110309.1212221-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   | 2 --
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 4641b4f2195d..43149c90c4fc 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -88,6 +88,10 @@ clk-pins {
 	};
 };
 
+&pm8921 {
+	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8921_keypad {
 	linux,keymap = <
 		MATRIX_KEY(0, 0, KEY_VOLUMEUP)
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 13e85c287498..9e203164beb6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -84,6 +84,10 @@ clk-pins {
 	};
 };
 
+&pm8921 {
+	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index ea2d961b266b..f1267c83d67a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -266,8 +266,6 @@ ssbi@500000 {
 
 			pm8921: pmic {
 				compatible = "qcom,pm8921";
-				interrupt-parent = <&msmgpio>;
-				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2

