Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9F15A3DB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 15:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiH1N04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 09:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiH1N0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 09:26:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB0902317D
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:26:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m16so7097841wru.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Aug 2022 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HykuBI5xToy8Y53SKmj40eGehy+Koxti7iT6gLB1tdA=;
        b=M/1MAcG0vd9sz6JaXtzdg6XQbvI7tsLlL9g8POBwJLGJ3/p3Rkfh4DbUafZBYH+GhV
         qc8ebq3N9qtUNXSorYXKDkErMIvlQwU8BjcZd8gB6u125K0ZTFyU8bCAdOECZNDIbC0r
         hWWiytfoZO6kv9OBH9+mRtWHF0/CBuc58o8NGbaO0RtP0VhmYsNmdppVEbANIwSAC60p
         /7viAoOaSDcNUAGxUC7XPwsF3H5QYjxjh0+WQR5hDBZpI1pVcJfEDYAWjxh+oUpRC5ia
         Kbt22IenSXjJRk58Qk3AGTk7MlxVkEMH7yu3gzny9UyNiSvm5isaBYOkpxbf0z/AgDJf
         Ebjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HykuBI5xToy8Y53SKmj40eGehy+Koxti7iT6gLB1tdA=;
        b=eEpaMHKWqQ3fwCDgjyt7SIRh0vYuUVX8axRP2bgW6LE+YZ1HFpbk0ISq19ocX+U5hZ
         tkamZ12wyxOf72wh3sCr9aStgW2sXTpQe6UbaE7fIMBGAyVcRa3aJkbmQErANHWZ/ek4
         jXMagECXAk0dXIWqyvEvHRiR4nspuyQ/tf2V/S3RLr+7cNdw2auA4TSzPHjCQSOGNkUp
         6N6YWwRNDw8et2FpSJsJORwgqPRqfKRXsOFVXJ9QAHg6fkmlthBNmDiJNlkPu2fR8A0Q
         CrTJsck5SbuP1j2hhpXcpLaJOS+q/VlP1QI8ySUT4FJ2apCaltWfa5skFjQVQwG1MrX5
         2Ueg==
X-Gm-Message-State: ACgBeo0MJGxYDGYCMvrXfJY0u48ca8ahLxasxLWjKbFpYudFzAKy1Tc8
        O87W4G0V/+dZWWjSC5OJcb/c7A==
X-Google-Smtp-Source: AA6agR6wfDx5Dx75+UCCPwrelranCdATSrJjyrrP8Kcu/Lapl7ybNJdIWHISMO1xjaaWGEGQIXG53A==
X-Received: by 2002:a5d:60cf:0:b0:225:8a17:fe1 with SMTP id x15-20020a5d60cf000000b002258a170fe1mr4153042wrt.490.1661693212262;
        Sun, 28 Aug 2022 06:26:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e15-20020adffc4f000000b0021e51c039c5sm4518874wrs.80.2022.08.28.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 06:26:51 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: pm8350c: Drop PWM reg declaration
Date:   Sun, 28 Aug 2022 14:26:48 +0100
Message-Id: <20220828132648.3624126-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
References: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
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

The PWM is a part of the SPMI PMIC block and maps several different
addresses within the SPMI block. It is not accurate to describe as pwm@reg
as a result.

Fixes: 5be66d2dc887 ("arm64: dts: qcom: pm8350c: Add pwm support")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index e0bbb67717fec..f28e71487d5c7 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -30,9 +30,8 @@ pm8350c_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
-		pm8350c_pwm: pwm@e800 {
+		pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
-			reg = <0xe800>;
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
-- 
2.37.1

