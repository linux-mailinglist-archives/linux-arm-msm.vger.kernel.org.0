Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8006E7B1921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjI1LDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231915AbjI1LDY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D452E1A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50305abe5f0so20321448e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899001; x=1696503801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUde0xWN/AjS01R5yGPdNlIjFEbaN381Y5DCWq+FQog=;
        b=AyELNFiY81zR5BmQCMN2hW6Er5zSy9S2nWr6qJn88ST6QcnKG1tfO+88kdKem5QvQw
         5/jQniJOwXc/gv2HMny6z4e/+cKXR3wkJvyHoJ3vXCn1kI84MpgHDiAeLoluZT9q5Om4
         EMdTo/V1YpFgZpP1b4YOLjLW9Tv8Xk/KAtCGAqUIrEnHQdYPt7bo4a1EJlXpVEnRfO5s
         3AtET5Ml4GbJdkfHQA5jA1hCf6zgCj2iAPhztQjGyNLMXx49n5ZqDmnq3XPpZmhec3A+
         4mN5+VAHoZhSj09sHsvey4dSlf3WbOBNuoCWQw3yOfapeurcks2WOTnm9qKyFoYF0ePC
         2qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899001; x=1696503801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUde0xWN/AjS01R5yGPdNlIjFEbaN381Y5DCWq+FQog=;
        b=Jlow/Wav3KeifZ46VcFqMMJFSV/mDcZ2zN++46lSfKoFN5rXPgKKN2fINlveuCaFC3
         IaIc7NQU/3qDna+OHb8NfQ5dgLAS/qaxCxi/5GYgBOaCrS3WBwY1l7RCVfsFBnhSOqCg
         8hqe7FKnpV/i3VIViAt2U0WRqHcKn7aFXwcoGLFZrGXCn3soqhRxFHc4fvhCm1XrMQnI
         PAzHldZ+Tc6wybQVw3ZN4vDmpEQvPNWJOaBNo5PIQKidtEvtJxQH3VquGkwDUS44NkfU
         z7zT6Ecg8AfBUQYQbcN+EQOeb3BWTcHnAuFtLKea0m0XgFp720wKZu/Aqv82Htlwy4Y9
         bmww==
X-Gm-Message-State: AOJu0Yy7x5pBC2+YKGvByPt90JafONEZ3bvb8nWVvl+janReX8PgAepS
        rzAZycXDCFM8L1pCz1U8FMJQWA==
X-Google-Smtp-Source: AGHT+IEdXV+w9LHV/GVWD+gT78HA93kFON+U4naGZaAFCFTa05TKKC9TWERFiSA+3sk7IKuhesyKiw==
X-Received: by 2002:a05:6512:527:b0:500:9d4a:89ff with SMTP id o7-20020a056512052700b005009d4a89ffmr860031lfc.62.1695899001166;
        Thu, 28 Sep 2023 04:03:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 13/36] ARM: dts: qcom: mdm9615: move PMIC interrupts to the board files
Date:   Thu, 28 Sep 2023 14:02:46 +0300
Message-Id: <20230928110309.1212221-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

