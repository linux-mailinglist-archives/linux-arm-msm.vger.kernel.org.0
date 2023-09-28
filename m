Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17E77B1905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjI1LD1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbjI1LD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:26 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C78199
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:23 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so11327670e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899002; x=1696503802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hrf3T7SMfrgZcpY2Sc1wJIHd3l2CoV8yNgWWkItWy4A=;
        b=GvLcKFULrpXMFs5NseCTu7OoqudCM0Ui4sbhW+Ox5nxvAXzzq4AJ0WHjtFu7DNU1HF
         vWOsP+mkMXnKJMRC8rtoCZOUlK5fk4GA8vloq03xtU22sVeJFK+/BeTkHza/EN6C1wNa
         IV4Gm9XDxn/s8UPAzpxqiYf6TgL4opKhv2f34JDkE4T9VlLhaAKUSaT+KgNF87cdZUhn
         pEQ6wZNVESbot7aS4SA2INUOlMyQ5sn2mj9Pkjw2Q+1weE8YQ9/RvFMYL2uCxkxcUz7N
         aPKzYjNsdt4vjdmiw1PufdTMxdSdluKdBJgCWbcOJvkHCCDr/NsoybGj6P0z/mik0KNv
         uVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899002; x=1696503802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hrf3T7SMfrgZcpY2Sc1wJIHd3l2CoV8yNgWWkItWy4A=;
        b=X9spaT0DYY6e+ENA8vaG3fOt10dz6Wyd8LDg3W0Rvy/thAqRAPbkOc8N6yVPHkpaps
         oORCLd43RIPjJ2+mdAflqBtRGqUe0OBjThLhPQ1LK6dYrt+qcA0sfniYRmUmmLpe9SYc
         8NJR92rsLYo1s/m79ce/hypaXGSMcRbT9trETybGk6F8aSWrkkZKZfbMco7fuIOnvUzl
         7r+Fg6qfNQNeU1L+u7wO7EED5hUlK8Q00VAmkgNm9Jmbzu+DJi7LSp62bda423iRghaM
         yot9Bz9pRzTmPey4zo2/YwlsD20vPUrbzq6Sqiv3Y5u4X7Jyd9Ai5ab1BTVVpxBDKh+N
         85VQ==
X-Gm-Message-State: AOJu0YziMxf4eBnu7dtq7F4K/0uL5KMLquKKckRU/y4lyR8ftG1/eSbQ
        BpJL74mPs2VHMx1aQExz1h56YA==
X-Google-Smtp-Source: AGHT+IE/PBgzoBJ8Ws+SL+3i6nraA8b/wENcr1l/EEeAgWaYFs8Qk2jIooGzKUNVhMzQuoh7R1gOfw==
X-Received: by 2002:a05:6512:110f:b0:500:99a9:bc40 with SMTP id l15-20020a056512110f00b0050099a9bc40mr981332lfg.69.1695899001911;
        Thu, 28 Sep 2023 04:03:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 14/36] ARM: dts: qcom: msm8660: move PMIC interrupts to the board files
Date:   Thu, 28 Sep 2023 14:02:47 +0300
Message-Id: <20230928110309.1212221-15-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts        | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi            | 2 --
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 48fd1a1feea3..e4261d729d35 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -273,6 +273,10 @@ kxsd9@18 {
 	};
 };
 
+&pm8058 {
+	interrupts-extended = <&tlmm 88 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8058_gpio {
 	dragon_ethernet_gpios: ethernet-state {
 		pinconf {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 86fbb6dfdc2a..a5441aecd637 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -34,6 +34,10 @@ &gsbi12_serial {
 	status = "okay";
 };
 
+&pm8058 {
+	interrupts-extended = <&tlmm 88 IRQ_TYPE_LEVEL_LOW>;
+};
+
 &pm8058_keypad {
 	linux,keymap = <
 		MATRIX_KEY(0, 0, KEY_FN_F1)
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 9217ced108c4..84b0366792d4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -341,8 +341,6 @@ ssbi@500000 {
 
 			pm8058: pmic {
 				compatible = "qcom,pm8058";
-				interrupt-parent = <&tlmm>;
-				interrupts = <88 8>;
 				#interrupt-cells = <2>;
 				interrupt-controller;
 				#address-cells = <1>;
-- 
2.39.2

