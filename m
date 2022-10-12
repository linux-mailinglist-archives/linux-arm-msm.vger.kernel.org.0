Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EFC5FC81F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiJLPQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 11:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbiJLPQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 11:16:32 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC63D18352
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 08:16:31 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id h15so6220940qtu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=M6wQigtVJrVPC9MwqwM9yRS8mMnzbDo6SepkFNF7b3AsYFewTcyUeL3vcV4h+D+WpM
         pLguOZaXQsbK6Z3z1g4PoKakPvUekqRZW/Aed7X2BddyI3OnNFQC2C4jZTtrduwAxRL8
         18lYklKksityuqtq3tayqZoN3deGG/Rs5lARuQ8wLNpqi1rKhqU+NFCYmj6xRSAhbGA7
         JU1234EIygn3hHBiz1aZw69wp93zU3ad5rt4WsxUyDy7os+Arjh8HdsqSldJEJ5whTfJ
         v08dZ1v2nL2WCJ99Ml6LTrOVVZqiZDUxkbQrcwidd79EGs+XjVJsioSDEP6tnmggJvqY
         ZozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=pAK7plmGYZP16kNy7bBlZGZvpA40MgovnkH8FeFsPuny0jzpgWi5z2hd8Rdo4oFJlH
         jX3FWzCBiyWKWr9b8k6IO/x+0BtHsYjMVaMfF7RX+VhzHIBNiOQZLu7pNtZtC/lZW6hN
         FwD2uyq+EhtCme94KY8P1KYbBiwVraAnCqjf3xedFLItd9FVak711qiyX/SfiheaX0+j
         wvBo79WcCCUo6ifVmSCHlqGdnWboB81QxqqeZ6Ed+vUqHoEuhEa48YSJYceqIAVjvTQu
         VLO1nTNlvCNrnXAUXAfil5UmFh1PFOCDCVhzxwP39jipX4V6cXw3JDhFLp+aKz9xIpIR
         N3vg==
X-Gm-Message-State: ACrzQf2Gi6902aq21jSL1fDHHUAGR6Jz0AknkZyRyy6BUhISo6j25h4n
        SGt14m72uEyVacD3xXglR9zX5/MWtAT2rA==
X-Google-Smtp-Source: AMsMyM7jBS8OcjxwxEwcD4uNNieiG8sP6kVEP5POfNJ+BoROi19TVVYwpicNF8ld4KbkfuPlccRzOw==
X-Received: by 2002:a05:622a:1788:b0:35c:bf57:caa7 with SMTP id s8-20020a05622a178800b0035cbf57caa7mr23920283qtk.470.1665587779925;
        Wed, 12 Oct 2022 08:16:19 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u2-20020a05620a454200b006af0ce13499sm16671612qkp.115.2022.10.12.08.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:16:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Date:   Wed, 12 Oct 2022 11:14:13 -0400
Message-Id: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm pinctrl bindings and drivers expect gpio-ranges property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f05f16ac5cc1..2c4acf227253 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.34.1

