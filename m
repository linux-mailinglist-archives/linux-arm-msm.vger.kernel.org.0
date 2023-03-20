Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F3E6C1A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjCTP5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbjCTP50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:57:26 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B373CE37
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:48:53 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id y14so10820178wrq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQBrWOWMRyJ3wjDq0yJMqRO2YdabzJXcF1JUT5g0hCM=;
        b=oWcV8JzzdxXip4NBl0sEP1Becezov8gw6ttzDvqXSH6tTN70W+tSfKmnWq2C/Ne8of
         FJzS3UBntdhrl/ZyM2y6+tL2Kyp37kKMFoD0/kkf/ntd4ndn9eVz1fS89r3Jnk1A9SOG
         tzuOuJp7xpPC3lNN9WK8bnS/d744gu+GxLyOMKLSzPvqOZnfKFo5H7iPsdcmCZdpJhfu
         uyXY+1Cq9tsJTdphfRf2Nz18zxPBVY1WOcjLQk6Pe6q2Y64wKgHP9Kre+KpcaFWRHM8l
         biiF0MArvAuc6AzhZlulI6puI1KG4J7FYdf9hC0kqn3lmoNkOwj5XKlhYfgfs0bpsssR
         xYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQBrWOWMRyJ3wjDq0yJMqRO2YdabzJXcF1JUT5g0hCM=;
        b=sOUbM30TZmGUkUQyxMKQ4nFXnMsag6SnJL2aWdP0PqpvwJAN2bT0u7KVff4q4SJsz1
         COPANixfQqe1onptnVd9MWVnzCpvNEV+El+2QQYZBZlI1kOUyypEILKUk8OGF4uYJsuQ
         4mlhgBNJzxvkQMWRevLJg38vQ3hMpR7MQENJPhYYKpDrOsvqqAJIBjpmF3TaFLIAYDtA
         4W4RQtLg5XiJO2GzidKRzcErLaZ++l5gR2XhOHoLYlaZCyMSf+ppPzoRByJqjQ+rILEB
         dgn5WQ55zLmPJWddurYKqITagJFpAPQaoa6MB8z+vzBcAm7Z4HqgCxwdSQXvaKu6MO9n
         YjJw==
X-Gm-Message-State: AO0yUKX7URa/j8IFbomVfGg/MqwS5y/wiKYq/+t3MfFKCYfkJ7Ox68SL
        1CQnrGP4vjwBU00t/avQLYZcSw==
X-Google-Smtp-Source: AK7set+lvmuy/Fsjw3E59GUjp5+8DqDwzar9JJBlr6msE6Roi3Nf9qP6DN//uhEZD3bUgm8Tym30lA==
X-Received: by 2002:adf:dc51:0:b0:2cf:ea5d:f607 with SMTP id m17-20020adfdc51000000b002cfea5df607mr13953804wrj.17.1679327331794;
        Mon, 20 Mar 2023 08:48:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 01/15] arm64: dts: qcom: sa8775p: pad reg properties to 8 digits
Date:   Mon, 20 Mar 2023 16:48:27 +0100
Message-Id: <20230320154841.327908-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The file has inconsistent padding of the address part of soc node
children's reg properties. Fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index c5b73c591e0f..5aa28a3b12ae 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -440,7 +440,7 @@ soc: soc@0 {
 
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sa8775p-gcc";
-			reg = <0x0 0x100000 0x0 0xc7018>;
+			reg = <0x0 0x00100000 0x0 0xc7018>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -464,7 +464,7 @@ gcc: clock-controller@100000 {
 
 		ipcc: mailbox@408000 {
 			compatible = "qcom,sa8775p-ipcc", "qcom,ipcc";
-			reg = <0x0 0x408000 0x0 0x1000>;
+			reg = <0x0 0x00408000 0x0 0x1000>;
 			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -473,7 +473,7 @@ ipcc: mailbox@408000 {
 
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
-			reg = <0x0 0xac0000 0x0 0x6000>;
+			reg = <0x0 0x00ac0000 0x0 0x6000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -485,7 +485,7 @@ qupv3_id_1: geniqup@ac0000 {
 
 			uart10: serial@a8c000 {
 				compatible = "qcom,geni-uart";
-				reg = <0x0 0xa8c000 0x0 0x4000>;
+				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
@@ -735,7 +735,7 @@ rpmhpd_opp_turbo_l1: opp-9 {
 
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x1f40000 0x0 0x20000>;
+			reg = <0x0 0x01f40000 0x0 0x20000>;
 			#hwlock-cells = <1>;
 		};
 
@@ -754,7 +754,7 @@ cpufreq_hw: cpufreq@18591000 {
 
 		tlmm: pinctrl@f000000 {
 			compatible = "qcom,sa8775p-tlmm";
-			reg = <0x0 0xf000000 0x0 0x1000000>;
+			reg = <0x0 0x0f000000 0x0 0x1000000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.37.2

