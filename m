Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD915A3CC6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 10:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiH1IoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 04:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbiH1In4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 04:43:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577FF2E6B8
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:54 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d23so7340325lfl.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 01:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=mvZLaxhQ7PtnLt7qee+emHloemlKn1eiZ8X9UnrK8Wg=;
        b=uRVChqfI2R0vrbL4VnGJAc4RvqbkIXsuwsSo7T5e59aNf5lPQRYqYAJqg6vKz/FWOP
         UDJ0fwobEQiMQPy+BkizVOAdm4p8EX1D+vKabwYfx1CxwNVSRNrXmAwCM9zIdQs86b4c
         O9Z39rc5O8rHhwtT8zOCaubuRtzaB/o0+dfYX/7YNXLDrSuRfFwjCt/tXdP2leRMpuOs
         +JfDeyueKRRzXkYE08aw3NYolptJjrxSMvreRhUDpIWJNtMZ+XRd95sn1Lc4qy+vRkI+
         WuEWgqn5lH1fFjplAy5mhYPMIAWT0cs4OjbtwsttZgMsSNfR53kAVAmRaIbLVRaCWWXO
         m6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=mvZLaxhQ7PtnLt7qee+emHloemlKn1eiZ8X9UnrK8Wg=;
        b=7N9Sux00Hl5sr1AqeWoCQog92lnVJ9sRxRh9/O4s8QlSFUaJFTpreFS+r3h8pnCp+G
         vWzZUKtkvC9qD2vS++yfgHVYQTC8lpEr5qSaScltUCPI4YYl4o+JC/UQbv6FFh/2AdMf
         B2RXWfn+n9ZHR/tX2uhDCgRXhsSSRY8e2/MijjmwZMRVYALx+fIhb5/3M2/ptIh7AK4p
         eZLXA+Irasyx3W6SJUwGm4Z8WCjsoNn9ZtYEJ+sBbyytQ4CETX0PoDD5hhcS9p5hJWrB
         shsYsIXQXNEbjIHyoTNwLwi4lpGW1FX3GLvZ6Cl2PMwHCKQSx4CZiXdQNUtRLVynNzXI
         ba7Q==
X-Gm-Message-State: ACgBeo3JOz01L0Pwq4kl5Om1su2HBvWSja2N+TGwEJCNsmXZBC8W+HyN
        4eGaP420zJ5HmW+vJY4kp9CiTQ==
X-Google-Smtp-Source: AA6agR7L3H3fXGtXkneVzap3FZxeVWPTdacfMUlW0owTjwLIXJLzNb9oaADAgdHS6LVtPznRqGOxXw==
X-Received: by 2002:a05:6512:1505:b0:492:c1db:c2b with SMTP id bq5-20020a056512150500b00492c1db0c2bmr4511260lfb.108.1661676232654;
        Sun, 28 Aug 2022 01:43:52 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id c6-20020ac25f66000000b0048afe02c925sm890114lfc.219.2022.08.28.01.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 01:43:52 -0700 (PDT)
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
Subject: [PATCH 07/14] arm64: dts: qcom: align SPMI PMIC regulators node name with dtschema
Date:   Sun, 28 Aug 2022 11:43:34 +0300
Message-Id: <20220828084341.112146-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
References: <20220828084341.112146-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings expect regulators node name to be "regulators":

  qcom/sdm630-sony-xperia-nile-voyager.dtb: pmic@3: 'pm660l-regulators' does not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm660.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index d0eefbb51663..e1622b16c08b 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -187,7 +187,7 @@ pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm660_spmi_regulators: pm660-regulators {
+		pm660_spmi_regulators: regulators {
 			compatible = "qcom,pm660-regulators";
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index c7945470ffee..8957c6a8c92f 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -81,7 +81,7 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
-		pm660l_spmi_regulators: pm660l-regulators {
+		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
 	};
-- 
2.34.1

