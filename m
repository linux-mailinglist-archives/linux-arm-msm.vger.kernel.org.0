Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2E975A9D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjGTI5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232072AbjGTIfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:35:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF822269E
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso830222e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842108; x=1692434108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOqO11cfzw9uwyqrzkPlT+dVPtOCYt3uiLm4jdQTOtY=;
        b=j63EndOv1B9Copru0nGpInKS8CeEE8oMQEJsajGPdVgOPMxNLsmdeYGeKweWHpymLc
         1a/Th8pMuL1wWqPCSAxpVohmrJmBS6GrmDUfJl8hWKNw3+YSq+F1qC4HBdQx9VIrxDgj
         do3XbSDWo0lPlfSxvDQdHTyQCY6mqukEgwgoNZKy72vhVHjA5HOMMwvDdsHPB8GAAQUQ
         yqYSI0ewGg54B1A45vZ87KO+qEYUD+10SBpS81lZV3LF3rp1TkIPlG3cvmSwIqFwbCy/
         FrZZ0xsHFQDIufj4j5uabAyZOLYRf5vGNTfutOKZ2GiBNFJN7WjhjrZ8HudMPzKJtVpY
         NJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842108; x=1692434108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOqO11cfzw9uwyqrzkPlT+dVPtOCYt3uiLm4jdQTOtY=;
        b=GJ7t/2koAgt8szjBE1aXwsdned4nQ57AdcBBqcfhgfskk/FgF+bhxvfRfnWxPn28Pa
         RVLDivyklyuKuZlknp9vQjPI/plwnorEIFncDtW5dvM3OS2sBFPavhsw2xhFwusqU1qd
         +32PqjICORglQNcXcI1z5G9nw9AWtQfawHORotIuxhhZdSsqO6V70WB14Y1zzGxO6/Ne
         3Nxho/w7xqQsFF7XdyUIYyWyAgeUAp2BLNX6mwfKerQ3oMmO/TlgDjyFTRnfEfNo1W9p
         kC3tNGvk1FaYQnHl3ySqSpFPwCUJb/veUkrsHsIZn1ifro6HZBPD8IC4y290r2jahgzM
         ObwQ==
X-Gm-Message-State: ABy/qLYSaTR+dpNUFoHFxgxNpv3o1SWxiYKnMr63Y8KxIkiidczfI5Ti
        uL5wzaZWf5a130v86lPJVSMtTQ==
X-Google-Smtp-Source: APBJJlEAjCoAEoBvsxTykEeci+6iz+4mlZb77YHi0whoeFnx90Ww17hDH8YUqXBgt3xHUgSCkvpgyw==
X-Received: by 2002:a19:ca5a:0:b0:4f4:b13a:d683 with SMTP id h26-20020a19ca5a000000b004f4b13ad683mr1423959lfj.69.1689842107939;
        Thu, 20 Jul 2023 01:35:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d4fc3000000b00314329f7d8asm627060wrw.29.2023.07.20.01.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:35:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sc8180x-pmics: align SPMI PMIC Power-on node name with dtschema
Date:   Thu, 20 Jul 2023 10:34:59 +0200
Message-Id: <20230720083500.73554-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720083500.73554-1-krzysztof.kozlowski@linaro.org>
References: <20230720083500.73554-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect the Power-on node name to be "pon":

  sc8180x-lenovo-flex-5g.dtb: pmic@0: 'power-on@800' does not match any of the regexes:

Fixes: d3302290f59e ("arm64: dts: qcom: sc8180x: Add pmics")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index 53b283e29407..bc17d22dbefc 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -74,7 +74,7 @@ pmc8180_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pon: power-on@800 {
+		pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x0800>;
 			pwrkey {
@@ -247,7 +247,7 @@ pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		power-on@800 {
+		pon@800 {
 			compatible = "qcom,pm8916-pon";
 			reg = <0x0800>;
 
-- 
2.34.1

