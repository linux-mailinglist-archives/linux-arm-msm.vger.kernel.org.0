Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 033D66E8BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbjDTHve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbjDTHva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:51:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3977448D
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-504fce3d7fbso558009a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977063; x=1684569063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IihJMWhBQMAF9uLnh84rG7aXShOKGQju+1NiPpwGOQo=;
        b=aTENG6dKiTxIo85OoVhzc+ASDqM7blfSQWQ5qOku/IvCy7l6KOuUcCxhgPsYFPy9Vq
         8XOkTlt2yF/S1XblVYpR7igUvmeHME87Gl4CzHVwR+0wDA0jtAPLwWY8TrpmHOA3VGsD
         yE8kV0iEaJMXvk7FgG/6Qt59sNIj/BSr4FPzhDsUs7r6WA8c9mGnGEbM90BIZajkg0kS
         Pz3rBtwkuYyu8XjnMd+pzj6yaO6Ic7jH3j6f5t8eg6prrBjM6XTEuLrAsug0GcIKVvHn
         Yobsh3OLxF7KYA6oSP4gKHZx6dxVxJW0t3HCzgUN48MCTn36EVYViI5FuRRgJiX6KrI5
         m9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977063; x=1684569063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IihJMWhBQMAF9uLnh84rG7aXShOKGQju+1NiPpwGOQo=;
        b=lJ7Jy1gCbtfrMgn8Po5p6D7B3b44af73VXUeIkBvfIc1i8gnjlRj4XcoE8Uw4Mr6he
         SSR1u214gBNWtIrISy3Xalt+abmuBAiVsUJQSqSkAhtzS9/+r/bowcT+8SxxZMsrXpPC
         Wsg2kWS3khF41ZdZ+HUhTfH6acCXrOn54o9Qo5gMu/ctb6whuGKqn2fAKuE5/pNoifjR
         nwoqdLyXR4MAyEaCgc7l0fKNh9GGjsBdnY50i8sXZg2+m42GVxANXJEonldMn1P3nf4p
         8TC42uQUkY+8mtkGnEEE67kgGe3a6k4y97OR65Ft3EYj0XYPwk7mVXwabm8vUULiGMoI
         NUVQ==
X-Gm-Message-State: AAQBX9d01JqrwjWT+gLRUkyfr15aE3ZDZk4csMA3+kvz4QPy67FxvH3K
        cGL87FzSC0nes148gEautmh6lQ==
X-Google-Smtp-Source: AKy350YMCd8ORAhjQ5DAsJNtBjqifqJ6hOIiEHGVWZ8YaBx8JqhsDuzeY/VByDUM8HM3WekNYDo52g==
X-Received: by 2002:a05:6402:7c2:b0:4fb:5089:6e01 with SMTP id u2-20020a05640207c200b004fb50896e01mr1070495edy.6.1681977063583;
        Thu, 20 Apr 2023 00:51:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id h25-20020a50ed99000000b00505060e4280sm447165edr.94.2023.04.20.00.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:51:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/10] ARM: dts: qcom: ipq8064: align USB node names with bindings
Date:   Thu, 20 Apr 2023 09:50:50 +0200
Message-Id: <20230420075053.41976-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect USB controller node names to be named "usb".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 49310520da1c..396938ec46cb 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -614,7 +614,7 @@ nss_common: syscon@3000000 {
 			reg = <0x03000000 0x0000FFFF>;
 		};
 
-		usb3_0: usb3@100f8800 {
+		usb3_0: usb@100f8800 {
 			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -629,7 +629,7 @@ usb3_0: usb3@100f8800 {
 
 			status = "disabled";
 
-			dwc3_0: dwc3@10000000 {
+			dwc3_0: usb@10000000 {
 				compatible = "snps,dwc3";
 				reg = <0x10000000 0xcd00>;
 				interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
@@ -660,7 +660,7 @@ ss_phy_0: phy@100f8830 {
 			status = "disabled";
 		};
 
-		usb3_1: usb3@110f8800 {
+		usb3_1: usb@110f8800 {
 			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -675,7 +675,7 @@ usb3_1: usb3@110f8800 {
 
 			status = "disabled";
 
-			dwc3_1: dwc3@11000000 {
+			dwc3_1: usb@11000000 {
 				compatible = "snps,dwc3";
 				reg = <0x11000000 0xcd00>;
 				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

