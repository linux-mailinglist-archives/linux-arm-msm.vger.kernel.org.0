Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA81D789A4D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjH0BAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjH0A7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F39CD1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-500b3f7f336so688581e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097976; x=1693702776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHnM0hu7z2BD25024RNiZ2OtoQYiaBNdLcRYXHmhZNU=;
        b=rLKN1cho4vy1uhqSey9bdUkpmVhUJUds1fDXQ1nZDvmWHujNLNzmlvjcJxECsxa3Gv
         Ir0v6xx5QDjTk6zPOxD1S9gwvPfm48BAzAHO/87FRdD0Cd6scvDYAAawt58QGs0PdKFv
         Z1VMcDJ3nVIscdF6toc4v3HYDOZTiBDZth97UhUBYk2rpY/d5uOCHYg7o320LFR0RiRA
         gZ4+UDs1Fb7dSTIwhPQEEsfBTpVyIjDyKojaJUS84beU7F4q5M8CnzlaWkN/EQF7oB6d
         iFp4U816I8hsp6zkV0gEOh2U0OqfXW7MWZEwWbYQNZb08sTyUeOiwLcH2Su4mmnoC3Qn
         bhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097976; x=1693702776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHnM0hu7z2BD25024RNiZ2OtoQYiaBNdLcRYXHmhZNU=;
        b=BcYyg9lREeGCedOwqlfVlW9l4qpEMuSRbIffn5qb5/7yL+jgNLfAe9aJwtyS6dbrfl
         /O0S/R93UU04EulhmFvzrU0ZL8mXm3UAoFEtUQeGByvjfIJU4DpLeCQmn7b9WGFC0H9E
         5Qmsbe27TWhWYgwftRRC2Okg0/XEqzMDC9tVMNDBq4BqFZEdgGIVxM0Zd9tfRT0/PeUR
         J6717DY9ZJbsLPhT+wj3vsDyg0w0kpm5vQ7+4g7y5lNTZxjN8mDwA4F0OMKsSniACmBj
         bFsaitoJ0CwvgPbqO+V4an+LQ8CvDVKNINmlHmKQF/fRP1vBS5hC0GSjV9X6ebp+chCX
         XTLw==
X-Gm-Message-State: AOJu0YwaMJBf1NDuuytoXnkOFGctEbx6DYuUW7/p8RMflCJuDIoDXjuD
        ql1uLzqCarIa6Z6MC5mPk6BuEw==
X-Google-Smtp-Source: AGHT+IEvHyFGyFD+Z7Ob/AsiUpHOk48hjW01+vZcO2hKm4MhKOgsawJySq0cs2hJvoFZ090SOhsnsQ==
X-Received: by 2002:a05:6512:31c8:b0:4f8:714e:27a8 with SMTP id j8-20020a05651231c800b004f8714e27a8mr18106145lfe.0.1693097975950;
        Sat, 26 Aug 2023 17:59:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:35 -0700 (PDT)
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
Subject: [PATCH v4 15/38] ARM: dts: qcom: mdm9615: move PMIC interrupts to the board files
Date:   Sun, 27 Aug 2023 03:58:57 +0300
Message-Id: <20230827005920.898719-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The interrupt of SSBI PMICs is routed to the SoCs GPIO. As such, it is
not a property of the SoC, it is a property of the particular board
(even if it is standard and unified between all devices). Move these
interrupt specifications to the board files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi | 4 ++++
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi        | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index dac3aa793f71..b782ff0d16cd 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -76,6 +76,10 @@ reset-out-pins {
 	};
 };
 
+&pm8018 {
+	interrupts-extended = <&intc GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &pm8018_gpio {
 	usb_vbus_5v_pins: usb-vbus-5v-state {
 		pins = "gpio4";
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
index c4cfbdbcdf14..373d9425b8bd 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi
@@ -265,7 +265,6 @@ qcom,ssbi@500000 {
 
 			pm8018: pmic {
 				compatible = "qcom,pm8018", "qcom,pm8921";
-				interrupts = <GIC_PPI 226 IRQ_TYPE_LEVEL_HIGH>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2

