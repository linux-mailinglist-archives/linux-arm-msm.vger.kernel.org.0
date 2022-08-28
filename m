Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDF65A3CB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 10:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbiH1Inx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 04:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbiH1Inu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 04:43:50 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D6925EE
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p5so4230708lfc.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9roCSqRwjkTGfEre8VmS4YMeVh5yMxTL5RSFOVc/GjA=;
        b=Wfjx96suyiGm7n0sWMhFbj2h7O3PmMKNtAL0PSH0hP5lrTgHMKtCtAOuzSno9Rrg8A
         4LJZ0KP81fYt3RFuMSBaFo6cp/GueIzFqD7b1SkXHfaSRb+SbTlx1EHCTHqJwVfcFWWY
         52J+SqrtF2f07wg3Tp8T4IZ/4na2TVPncU3RZR1HZ0sB4VEIZ59CQ3rvp4otsn1kQSN9
         7f/OqiYrZdpMAuY1J2YZMRXxOxQzJDuf/9cQB+DuI0FX234GGgn9iB+TJW5ceYFaONLH
         aKQN/jzkj7IPw0qHdp1IKeXFhUKbJr0k55D2olHf+k8Zyi4T1fGr+InnlS/pULyz9lb9
         zBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9roCSqRwjkTGfEre8VmS4YMeVh5yMxTL5RSFOVc/GjA=;
        b=o5oHNbw+DbukejnHEb/cHwGpfqS0Af2D/pr0xm+6Q109I8H9TbV6F3XoJhzTsYd/hp
         nB8MHhv01jOATs65NS5j3tdp3FdqqjtS9DnsDQer7XmzSSgFQ5OIUHdI3aqZFSUgIyZX
         TvFhqfVOoXRgJjRs+yDNPZTx6L4gvO6JA0dkx6owKOxyslNGe5+0CVo2P/B74m2UWxrJ
         CTpQfnwrXi5H2lI4imJF57Qxt8ifUpwq6VD4TtuL1u46PMK6+1Wim40SBQFFLzJcu018
         UEdEKLgA5VK8w1kl34e6xJp1bu1cE78XAu1FeFSN5YVgGYsf8AL2m4rIGteMbTWCFae8
         B04A==
X-Gm-Message-State: ACgBeo2w9dB6F2y6a6TMOI4PUjLN6Azj64g1lAbZzwNyQf+eIZCtF0sZ
        v0Kqh+tUiCd1HefVFPa8hEk3/Wteqm2LjImmAhc=
X-Google-Smtp-Source: AA6agR4ZEKBqFskCb3A7uYZ//jzZdErKtn8nhtWywCzql8hv0+XsQzFvhpVhn5a8x1fJxbXd4YrzrQ==
X-Received: by 2002:ac2:5045:0:b0:494:66d2:6dc2 with SMTP id a5-20020ac25045000000b0049466d26dc2mr924212lfm.661.1661676227282;
        Sun, 28 Aug 2022 01:43:47 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0048afe02c925sm890114lfc.219.2022.08.28.01.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 01:43:46 -0700 (PDT)
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
Subject: [PATCH 02/14] ARM: dts: qcom: pm8941: align SPMI PMIC LPG node name with dtschema
Date:   Sun, 28 Aug 2022 11:43:29 +0300
Message-Id: <20220828084341.112146-3-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/qcom-pm8941.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 3e5c85fbed7b..9cd49deb9fa7 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -144,7 +144,7 @@ pm8941_1: pm8941@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8941_lpg: lpg {
+		pm8941_lpg: pwm {
 			compatible = "qcom,pm8941-lpg";
 
 			#address-cells = <1>;
-- 
2.34.1

