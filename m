Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44BBD5FE243
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 20:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiJMS6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 14:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiJMS5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 14:57:40 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9584D53A41
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 11:55:20 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id a5so1043770qkl.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnCT0VgQ2CF/aUpIc9SESbA3PNLIPfUbsJ/xWR2SExI=;
        b=rU9B7FsFbc0EPP+Pbk/JbYcLg12PnIDY8c98JgWlhsHu3q6IHpmg48vjUC89iMB9Q2
         5oH4nArIq0ODve+SFu2t+eGTHmix6DzjWbNKmw5oYLYqH+Xk3vMB39OpyX6CcH+nh4bw
         Dpdzea/CxdT8Joh6nQ4hNzDSsuGvY/DRGVHWTgHbGVGVka+uI6gV96u6g7FXReTipo4t
         fmmzzIWhJv/22w2vCEYVvYGHHh4w0duGVJYA8EgX4T+9GeieoyHplsq7G5L/ImGl97BY
         xx7xRcNUc3G1KiqKr8GFPpxEMtNMcIB2u7eMs8dIBrZ5tBs6gJDQDd5FsQDvUmN4VNTV
         ns7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnCT0VgQ2CF/aUpIc9SESbA3PNLIPfUbsJ/xWR2SExI=;
        b=l/iJ2YHDD8yA0cIMvutx70fbofgOiA2O2SvhcO4TzQlDDq/Haxq5Yxg8PflvZ6s4A+
         +82faT3Z/784vN8eRxHw2uNaTUgZ+6ZU9NANC/fHixhy7xh4w7tQvPVzYGNbWPYC6/Si
         rXT/XVrbLV+D/6KAP0O7qqovfBOzFgqO5/ZVCuMp8Thu1pEC/OqpCseXh6phnBZ1YDqE
         qRfM/BkORSCTEim+MDCW9PWPhW8tQnpxgUMcqgGqwcXeElDiP/NN5vIitJjKzr7IPFam
         WpgIrar3E1N6yrJI7VhlEwDbQTnHWZZsi2RDu94RaC2ZaY9xJ7sIEpHb4J8XKke9LRAw
         qwGQ==
X-Gm-Message-State: ACrzQf2q1Fx/B74R/YiEGdm1V7PkUzeG5LobrXgKzpXwPl0KvpbaGi1c
        mymGeLdBJs9/p2ukMrcho+xoHg==
X-Google-Smtp-Source: AMsMyM4D3OZe/p1sgMTeJQRdNRCNh4MOXKwBJ7XHsqsSkClLLhzLCP73/6JRvW6oQFmNB+kYdE85QA==
X-Received: by 2002:a37:8205:0:b0:6e4:3d36:10a4 with SMTP id e5-20020a378205000000b006e43d3610a4mr1011355qkd.783.1665687317069;
        Thu, 13 Oct 2022 11:55:17 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id k13-20020a05620a0b8d00b006cdd0939ffbsm345983qkh.86.2022.10.13.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:55:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: msm8994: Correct SPI10 CS pin
Date:   Thu, 13 Oct 2022 14:53:12 -0400
Message-Id: <20221013185314.91266-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The GPIO55 is part of SPI10 pins, not its chip-select.  Probably the
intention was to use one of dedicated chip-select GPIOs: 47 or 67.
GPIO47 is used for UART2, so choose GPIO67.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index ded5b7ceeaf9..7a582a5fe3a8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -897,7 +897,7 @@ default {
 				};
 				cs {
 					function = "gpio";
-					pins = "gpio55";
+					pins = "gpio67";
 					drive-strength = <2>;
 					bias-disable;
 				};
-- 
2.34.1

