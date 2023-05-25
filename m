Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1511710FE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 17:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241804AbjEYPrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 11:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241339AbjEYPrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 11:47:46 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90CD6197
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 08:47:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3063433fa66so1609497f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685029663; x=1687621663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQzDeB2LJCPdE4bVwWMc4k2lSAwN81htM+i28rNvOQw=;
        b=TddeFYuZXpTuvwVOeYzhBVlo9H8BGJvZb9EqxEmSJiiCQk57adWS5pamK4248laKn2
         zYvj3YM/6tUvrLhHTxSd7r6aOM84t35B8MXXAYtqiW2xRmC6s3eAIQyvzdzp9fN+9IRu
         Do4XiVWHXcJoo8bs3+C7e1SgBRU3rBo8+3tfGE7cLMhIMDc6uOuHRn9+Wcgn0UYeoQXH
         W7BlDYA3wS/AFhHLlFC2UBefU6cKSmGzA755ekag0UYEKlk5iMEBM5hLD5T0XWFrKnNx
         t+nHlmvlXa4N52RUbao2/3ovC03D02T0Jo5Ts26vAQswHa/5OJ9gmu08pxvrszwPh0Ek
         6O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685029663; x=1687621663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQzDeB2LJCPdE4bVwWMc4k2lSAwN81htM+i28rNvOQw=;
        b=PVd2N6Q5SXDXTKjw2OCNUPFfChBioMVck8nG1yfX9xO+X/9KrmHCX4K81myGy+XrJU
         n7ZUJGMXpmxVPDZAfs/kdYllxbWeI1ebHhGsPS7B/hSZlEk6wk2CiuKYGHTSwrRV+aHo
         mO+rHAzuZNAnWR9NUvN7ty4dxlcgYKFul/0yssa4VpK19hxGjTU+OSj2auYcslwq9wkt
         W1fS3Mg+dx8kuRqoiUhSCuADdsw3m1d++qAxNVVD/z7U9TX5wbywQ9DeUd3GR1OYTrsZ
         miCsrIqUuQW1kcVEH09s7R1Kaz1BwxvdOPid7T9NEkYCA0PeDcFtZR+PYeY4y7uPzomS
         Zu7g==
X-Gm-Message-State: AC+VfDx/dh1MLBai1dKOa9oOafOc4ku4RKU8tJgh+EuxnBJcf4wZ/kIL
        cd+12eT+aNnLnIg8IzHvpBl9GEuFwTsQEZ5xP8fbuA==
X-Google-Smtp-Source: ACHHUZ59TBUVXLZlCUafrhzicEJd3n6/rfz4bi0CwGrGP9vWkvnMMGTfQwrX2TAgeCEhsWeDhqJfEQ==
X-Received: by 2002:a5d:4ac2:0:b0:305:ed26:8576 with SMTP id y2-20020a5d4ac2000000b00305ed268576mr2825579wrs.9.1685029663038;
        Thu, 25 May 2023 08:47:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d5503000000b002ca864b807csm2275873wrv.0.2023.05.25.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 08:47:42 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 25 May 2023 17:47:35 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: pm8550: add PWM controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-1-4d5d7602f290@linaro.org>
References: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-0-4d5d7602f290@linaro.org>
In-Reply-To: <20230525-topic-sm8550-upstream-pm8550-lpg-dt-v1-0-4d5d7602f290@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XZDrtkI5nsyDY8glSBffiKfD1QTexpnFBhyAkUyRx8Q=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkb4MbuiHyxJ6G3/LqDSUYx3Ap3a7x45nVDJbCJFKZ
 pv1gW9mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZG+DGwAKCRB33NvayMhJ0ad7D/
 98cD9b/q2QZUqK258tcmcsdjj9h5dCynz3YsZaLRdOEQdOsvTRRvsDxR6x2yvULK7OwslhJf3GkORY
 A0tG1Pm54QcW0tJGbc1hwu8v6ZsSiZh2pkFWr4wRwuCMSqB5X917iHcKTeKpe6GEqXXuxnVXSZWcqh
 /7ZBJKkKYMM4Xt+Zpz0IDkg2IinW+W4ZDbO5MFiR/vAbD2YoyknlOxrafjeoEZ/a+dJDilE8WNP4mS
 vqkh7CvTcW0ovhXonHntGfnIUeemVLEFRExvW5RR+RD1Nk9EXWepLGSSTNAxov480viZm/pBCcKqoa
 EmfEAOF5tweZQoyTtDLFQXYZISOud5odIoaP4Xy5BrrDCYyOh3RPQOozwzhJiQXra+ErWqtMXE1y5L
 U1SDcEmlUONnxNfnv5MK4NYSI1N0Zs1L9OqnYblBQpAnCvUA19UhVfnMNg+YKwlW4WiCtzprlsR9Bn
 EniRCNrJBzey8Ow11YUOSBdx3gwpJYGlMAAVUJ0wk1qaB+UTiuoOIuhPTm3Oh4jXnZjccsKnIP39w1
 HXP+1V0Tk+I+cxyHR5GoVUZiF3YLv+PYFiGCWrI/MctnSlXuRAVJe5UO9RSnHazYDZDO7609i88LLU
 A3Hzx/CU/O+zJSGj6AYhh9gKiEnOp2wLGhbdKrq8naP+d52/Ss03u9KBK3qA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PWM function to the pm8550 dtsi, this is usually used
to drive RGB leds on platforms using this PMIC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 33f357a80636..db3d5c17a77d 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -61,5 +61,15 @@ pm8550_flash: led-controller@ee00 {
 			reg = <0xee00>;
 			status = "disabled";
 		};
+
+		pm8550_pwm: pwm {
+			compatible = "qcom,pm8550-pwm", "qcom,pm8350c-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.34.1

