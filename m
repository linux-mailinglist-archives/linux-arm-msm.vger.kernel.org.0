Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7950364B319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 11:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbiLMKTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 05:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235149AbiLMKTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 05:19:34 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F73B1C421
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 02:19:32 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id q6so4098819lfm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccr0x4vqQ1/xcMOM4hpeo/ppV1UsIX4GEqZSH2VSdAY=;
        b=qI3PNbQCuuqlovNhsKGw8gzFIbXEpSg68eVzCbcbaUU4RIAdNQXpy6sooK52uZ+MD0
         1/mt69dBfoQbRjclvXUO9geW1GEUZVulcbE4VmjsbsYZqRVdMVEC2oKUcHdKnuklVjO5
         OruyYrF/hyJ72RH3JWbWKi4yPNcs0kA/ApdpBYtLBBZYnmHBiA4TlZpvHo3EaIUT+5Jt
         YU1T+z0yGeFLFff4L7T6qBDD05H0QX1XbHzMVr2YjQtECjHIH18BQO1Iexx/UGXeTdwm
         S0Thsvfo5tMHZl/vOrocLIIttGHhhoL6c9mzQXynoj7vU8iDWHlI1LzAKtoyJF3rL0pb
         7FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ccr0x4vqQ1/xcMOM4hpeo/ppV1UsIX4GEqZSH2VSdAY=;
        b=K9Xr6N74XfZ4geVoFRgWBPvrY5GGIyBgjO2khLBul0BktjfUJB1GcnCndvsgiBSxw3
         ZKPDeW/7t3ZKkPc5oCwZFrNCshCLfjNiv63xitDI+87ZVf82t0O6NVCktLResXCJActY
         JhZ0YJawxxoS01/2zjdUh7enPd1ZVXigDzQpbFJmWVhgeHmBnq0MVCkRC6BUb11xFqh9
         YNU2/ckkyp1YTNAbUa80LDFOC1qMYh3uZrZCQFdK/n7AakmSFLudagzCeGgwVznhLhIn
         ekwN0p7ANSBUyZvWJwKBx/Rw9h8gUY9vDSPYE7bj3Z/1gZOZXghI8Ye/GGZoW07Unh5E
         upVg==
X-Gm-Message-State: ANoB5pnk6orqMuQsA+0PFEVikIAU4rikaQa96pHqZByA28nKS6fgODWR
        uns6RR/8/dlekJmq0IaDsOfIGw==
X-Google-Smtp-Source: AA0mqf6lCv3u0wSG6ftu9TEJHxoFInCvSBL/F/UbT9zVjikpWYoZPTDL2dVsaMUNmVzho98MhvhBmg==
X-Received: by 2002:a05:6512:3ba7:b0:4b5:7c02:39 with SMTP id g39-20020a0565123ba700b004b57c020039mr8113309lfv.47.1670926770939;
        Tue, 13 Dec 2022 02:19:30 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o11-20020ac25e2b000000b004b5732080d1sm302460lfg.150.2022.12.13.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 02:19:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc8280xp: correct SPMI bus address cells
Date:   Tue, 13 Dec 2022 11:19:19 +0100
Message-Id: <20221213101921.47924-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213101921.47924-1-krzysztof.kozlowski@linaro.org>
References: <20221213101921.47924-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SPMI bus uses two address cells and zero size cells (second reg
entry - SPMI_USID - is not the size):

  spmi@c440000: #address-cells:0:0: 2 was expected

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

---

Changes since v1:
1. secoond->second
2. Add tags
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 27f5c2f82338..3cb4ca6c53eb 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1947,8 +1947,8 @@ spmi_bus: spmi@c440000 {
 			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <0>;
 			interrupt-controller;
 			#interrupt-cells = <4>;
 		};
-- 
2.34.1

