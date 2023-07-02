Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99006744DD8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjGBNne (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjGBNnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2574BE6D
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6c3921c8bso56453351fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305409; x=1690897409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IT0WSZL5NfAjkx38HXtQq+fDnbve0LjJXQvD/mMilM=;
        b=W+QYgs3tfkTQDcilkfC4aFAmOvq7ACA+jMzoEF2b8ng6jQGmNLuUjRqvKASFveL/bC
         Z/oMsBdswQeS7DxT7JmfGD3ozITUHZGJNLnL7FmeH1swuTRKr+hUeNT4Rj7o8k64znot
         jhjZtDcqgydnWWZ8ssODBqJFvYQTCiRoh5U7TKUP3aAyJt2zS6prbW0ne5cEw9mLT9gk
         j1Wjn4v17crRwPRKzdhHF3cD887ahMGldij4nxUfeqtkGYKdY/y6fit+bvZ5sXdVGG6o
         OoQOisqAm+0Eg2oZJWSJZYhPI69b3H3dqmo/+PyPvGbepBUYOee+LthQRpPX+gJJvhcH
         qnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305409; x=1690897409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IT0WSZL5NfAjkx38HXtQq+fDnbve0LjJXQvD/mMilM=;
        b=H/+8MjBLXrCOSLqXIHYlJ/pdoANL4hnDXfjYuhC6A6YgHnNAl9a9Si9FndxJGmOmwt
         Ixyqh7C8sa/I4SUCJg8JkBtvKDFV757XIrau+wINGshkl0jLFns/049zA7NLbhInLWcn
         prpdwSpHNhbJJiskG19sMA3ED7+q+zATX+OXhvv3oe/EUtB7i3iyGUuBFuKcFIJRZVSL
         GsZ9bV/2tdnQixf3EfEihoVwV3WERX9dihaV0QDaNixHj/pvSIsomVes1JO4+irMVoyE
         BnkSNMNHG3XfQ73e3xuCDLELIw+Nrijtog2Pwh46U0jnw3sjClX9Hqs/IeDbQ0gtop4K
         z8aQ==
X-Gm-Message-State: ABy/qLa+BhN9vBfR/14Ms288N9aSEL+qn8lLIZAMEZ0HnLWgR1CGpAtu
        eaiPBGmZhmOov5lBZrnizdc+4A==
X-Google-Smtp-Source: APBJJlHfyUQhaZjoXG6GUR51cyku5tSH0b1FlawbEdLi46p4EaI7twJMGejBtkvekf63X/uhwuaBww==
X-Received: by 2002:a05:651c:20c:b0:2b6:d63d:cc1e with SMTP id y12-20020a05651c020c00b002b6d63dcc1emr3918204ljn.51.1688305409360;
        Sun, 02 Jul 2023 06:43:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 10/27] ARM: dts: qcom: msm8960: fix PMIC node labels
Date:   Sun,  2 Jul 2023 16:43:03 +0300
Message-Id: <20230702134320.98831-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
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

Change PM8921 node labels to start with pm8921_ prefix, following other
Qualcomm PMIC device nodes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 913bc6afd0a1..6b8d90d02146 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -264,7 +264,7 @@ ssbi@500000 {
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
+			pm8921: pmic {
 				compatible = "qcom,pm8921";
 				interrupt-parent = <&msmgpio>;
 				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
@@ -276,7 +276,7 @@ pmicintc: pmic {
 				pwrkey@1c {
 					compatible = "qcom,pm8921-pwrkey";
 					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
 						     <51 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15625>;
@@ -286,7 +286,7 @@ pwrkey@1c {
 				pm8921_keypad: keypad@148 {
 					compatible = "qcom,pm8921-keypad";
 					reg = <0x148>;
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
 						     <75 IRQ_TYPE_EDGE_RISING>;
 					debounce = <15>;
@@ -296,7 +296,7 @@ pm8921_keypad: keypad@148 {
 
 				rtc@11d {
 					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
+					interrupt-parent = <&pm8921>;
 					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 					reg = <0x11d>;
 					allow-set-time;
-- 
2.39.2

