Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8055F11EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbiI3Sww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbiI3Swt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC5F1664A5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so8191822lfo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3EE3vb2mcuoSmKF99REo5BGBcJapZk+lfQfWm0CgsNc=;
        b=V3Hg+9SmmWsmVnHBkFXcR6Bd9a7MoEZBTcRgH5RWcBF2jpZ/nkPUZ7phhFhdErIaIu
         +Dp3dn2qZmvmzDKQY6jXuXxBHHuIyUh+GGSypfldGNOKevQWRggaJZsuAKu71y+EpvzU
         vBVr++c15SkH4JEg7QetXnjg1hWLKRLDiy81J4uT+5+ZtUdx0nltAtxWuIOKH33aGXOm
         O7QeKpInm1Sdcm49meNi9C79sSuITyOSj8CSDF5YZdh9VRMYlr9ef8XeWT0ZFbP0bEJN
         Kc3+8x+hAy+V+LkVTWvQ5fj6lWl9crkTBYX7j0dpHqALeU+7mAYJrY2h8vtjucA2PAqy
         L74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3EE3vb2mcuoSmKF99REo5BGBcJapZk+lfQfWm0CgsNc=;
        b=jfnLdMXT9YCPp1CEwW8eaPvKkbeWjmAzTLZvHOgHtv7yJYmMHMzKKzcye1uPsn6Z9b
         V2qqBhkZoLDQ9fgjetLY9pkFHS8qcMMBFyVmQdpSiK1B2BKrElgCKYqMVBjuNn5uL1qo
         cn8MaI9li6K/YrMIdjCfUOeo35EIHdXH4fFlAbkb4Iu/LAQibEp5E8kejxnFv3tt3ifj
         Unk6hpajPHQkZh96fk98fTUPEpYFVtbztT6bz0ms6+UDXSdlMjy7KjH90ttY5ARx8oIS
         7jvsTaR2hHEDOYFghngSDkuHpwyKajwEmDbe8mit5D43ZbKPVc1odpH6TArYYm6QuOeF
         NAeQ==
X-Gm-Message-State: ACrzQf1RntnL0AJKjx+QG1AshaxVeqJ2fqfzCkVeqBUvnGoaPIToCcIR
        8A5NldwQrCuySKYqrPtAvMYzIA==
X-Google-Smtp-Source: AMsMyM5rjwJ7mFr1kMphKXmcTZvwLyk+t+bvgITkL3VRO48dUTLVpt7rg31JNQbFu3ahrXl2peT0Pg==
X-Received: by 2002:a05:6512:b04:b0:4a0:588:5b33 with SMTP id w4-20020a0565120b0400b004a005885b33mr4035871lfu.371.1664563967264;
        Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 13/23] ARM: dts: qcom: apq8064: drop unit ids from PMIC nodes
Date:   Fri, 30 Sep 2022 21:52:26 +0300
Message-Id: <20220930185236.867655-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

On APQ8064 the PMICs are connected using SSBI devices, which do not have
any addressing scheme. Drop the unused unit ids from PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34d3fce17351..6a8f3fd0fcc3 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -672,7 +672,7 @@ ssbi@c00000 {
 			reg = <0x00c00000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8821: pmic@1 {
+			pm8821: pmic {
 				compatible = "qcom,pm8821";
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
@@ -698,7 +698,7 @@ qcom,ssbi@500000 {
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic@0 {
+			pmicintc: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <74 8>;
-- 
2.35.1

