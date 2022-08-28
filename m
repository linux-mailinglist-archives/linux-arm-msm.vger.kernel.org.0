Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13625A3CD9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbiH1IoH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 04:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbiH1In4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 04:43:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232531705B
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z6so7361776lfu.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dpouqk7Zih4jSuA445+2TvsQjhvHH+9R0VG9/O0SurM=;
        b=EA3Fcx7BQNcvbewffgftB8aMRUHhAkT+LRj0MRLQJkHxQFdF9HVJR/0lUOJ0FfWmXd
         4C2gmOXy349Vk70tvahV2LO76vtb06H26BB4UfhA+IOxeMGKSlUzW9RH+/k/iXXORXES
         Jv/BgzWaP+4wncuTC143+lqOzKq+xIdta3QP+h0r3e865vysHhPzSCcylyA2xEWVo+IU
         qOFJKOMFpQO7r/LqVsKIQrTKEJtT05dDIASHMrnJ04bm4ns9YdlUMv0rMmU/NEocuzMY
         2/ZB/K5UP0527U66v1BnRniBaXIhUo9sk6Zj3TJH6YIqAQ6KMdblUm5I4EBxq+WDXt3x
         cWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dpouqk7Zih4jSuA445+2TvsQjhvHH+9R0VG9/O0SurM=;
        b=ne8uKrYLFS98wqDo3tCz8aYPVTMgYqV5+e4dqMhZeYq8CzfqHL2KT2nFm/syRBzLz4
         Z8t3rMdVIByGQSTOfWqb4oDcCKRy58lLgYoR3iyJ3p2KkAt9POvc5fx9IvCKj/h1iCrt
         etAcnwMGNHUVYbsmy6V1mP0qclAx4ZMOXXGb58lT8U1j6QrDYXd6r4QPm1hJ3ktkbm4e
         cfKScX4CjRjnyIzTZVP4aQNED4z6FtZ1VlWajPh7ahm6WF9JUF3eTJ08GUsZ3cAlZ2Av
         bQoq7WbOYcufYSY8jyAG3+Qk8DPas/VInd1zC8VA11xhrgHgWVaSgxAzn/e3Ufz4xb3V
         DXFw==
X-Gm-Message-State: ACgBeo38vhChkFuI96zNhmg+s/5e93t87ILYCAMSX0Tf/BPQjRpXVs9j
        pzoI+hsmUdcJlhM5iCYtHiL1sg==
X-Google-Smtp-Source: AA6agR6BLOr84zmdrUN6/fq437Ng42rAjhxU4Ff16H0PguDji4dde+O1MICUigt9S3HoCWlKAt1Cnw==
X-Received: by 2002:ac2:58d5:0:b0:48b:3a88:641 with SMTP id u21-20020ac258d5000000b0048b3a880641mr4442894lfo.421.1661676233708;
        Sun, 28 Aug 2022 01:43:53 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0048afe02c925sm890114lfc.219.2022.08.28.01.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 01:43:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/14] arm64: dts: qcom: align SPMI PMIC LPG node name with dtschema
Date:   Sun, 28 Aug 2022 11:43:35 +0300
Message-Id: <20220828084341.112146-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
References: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect LPG/PWM node name to be "pwm":

  pmic@5: 'lpg' does not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pm8994.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 8957c6a8c92f..8aa0a5078772 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -65,7 +65,7 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm660l_lpg: lpg@b100 {
+		pm660l_lpg: pwm {
 			compatible = "qcom,pm660l-lpg";
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 5d1ec3a6cc3c..47f74b547a3a 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -128,7 +128,7 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8150b_lpg: lpg {
+		pm8150b_lpg: pwm {
 			compatible = "qcom,pm8150b-lpg";
 
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index c62d023b39a2..e1479e6a371e 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -116,7 +116,7 @@ pmic@5 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8150l_lpg: lpg {
+		pm8150l_lpg: pwm {
 			compatible = "qcom,pm8150l-lpg";
 
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index ab342397fcd8..e92e5ac414d3 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -135,7 +135,7 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8994_lpg: lpg {
+		pm8994_lpg: pwm {
 			compatible = "qcom,pm8994-lpg";
 
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 84c44912ec93..2e8b58f944e9 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -37,7 +37,7 @@ pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pmi8994_lpg: lpg {
+		pmi8994_lpg: pwm {
 			compatible = "qcom,pmi8994-lpg";
 
 			#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 6d3d212560c1..3852a012bb0f 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -42,7 +42,7 @@ lab: lab {
 			};
 		};
 
-		pmi8998_lpg: lpg {
+		pmi8998_lpg: pwm {
 			compatible = "qcom,pmi8998-lpg";
 
 			#address-cells = <1>;
-- 
2.34.1

