Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732035A383D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbiH0O4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Aug 2022 10:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbiH0O4r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Aug 2022 10:56:47 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DB22B198
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:46 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id bs25so5016424wrb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 07:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3IUgdGEoh6SUefAGVEJuf5Vdw0rjNhMb5+8tK3DbfD8=;
        b=vEtXM8WAJx1xD97GIqCXN8BpsekW2GvkQRlaxIhsfj2k9hmwHSmt9i7tanthjoIW68
         5XHFPKdO2Ch3fGE8sAAaet9iSNoYNSHaGH9yKPuoJq6Nd831zoE97nzNUHZNczfcgYno
         QhAYiOQ331S+sebFUhEAJeXJ01Pqn6CzT1XBkecjoFjiUQMkkUEpFKwxD7lFltxYiKne
         xZov/snwGR+2dXGVUbN4X1/j4aNKaQ/JC+kWHHrGuQL0ZFF05GQP4bS20NaysMFPUsPA
         1ErPWZDI6fNHQYYH2iWZGAxed1sSM7pTITyQeZB2S7O6NFLcWxQ3q5gxgrCHnqFWLV3U
         xDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3IUgdGEoh6SUefAGVEJuf5Vdw0rjNhMb5+8tK3DbfD8=;
        b=SXh+RRMfO88IJsX7u8TYO8ZFq+6M1NfU6Vr4ZbNaslo1HKVec22LRWnCTDbHcwa4gI
         Ag9V9Ppejt+6OudJsrv4DEd3fehyfV6yjEIGqBlfM9218Yuy0btwRQ3dc1047HGSz9rB
         ff5a4DWQBoMpygm8pnr5KUe4/s45mY38ilAaZtBS3LMH+d3NaDY3CEJiW7ARQI1jAldk
         BwDaoneradFCjMbFVUec/J5+Vl/eENVTn4+ZDNzrHY8Ufuqi3mfC8oPdKNgS9HJCwCKS
         hKlB48zpk/y3P6v+0CYmHskpmkGTNMKqm9XhT6tebGk4JN4+rJd/fvgogv1mE7YEKV8i
         T+XQ==
X-Gm-Message-State: ACgBeo2xCTUmHVaQ2CekyVY7bpCss2pIAWrxjmF+eO3y8saIhbZE9TWp
        BgzmnEsnx3jdzQa2JECHpv7muw==
X-Google-Smtp-Source: AA6agR4B1iwtVIUQq8a8Q263gquX96r/Bg2+JjrlbgZi3+TGP7eVyi/6HvUufjiYrM7ResJ1TgVnkA==
X-Received: by 2002:adf:f642:0:b0:226:d4b1:8502 with SMTP id x2-20020adff642000000b00226d4b18502mr674903wrp.553.1661612205252;
        Sat, 27 Aug 2022 07:56:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m186-20020a1c26c3000000b003a5e7435190sm3407395wmm.32.2022.08.27.07.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 07:56:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: pm8350c: Drop PWM reg declaration
Date:   Sat, 27 Aug 2022 15:56:40 +0100
Message-Id: <20220827145640.3530878-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
References: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
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

The PWM is a part of the SPMI PMIC block and maps several different
addresses within the SPMI block. It is not accurate to describe as pwm@reg
as a result.

Fixes: 5be66d2dc887 ("arm64: dts: qcom: pm8350c: Add pwm support")
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

