Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A395F9DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 13:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbiJJLqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 07:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiJJLqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 07:46:30 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2789A580B2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:25 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id s21so6292174qtx.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87LarcGZUBDgr/oOLmODSXoRJIoY9TQRZN+1jE9/e80=;
        b=CUbfd3EmiObZ7AW/AzD4QlPimlqSNg5htPQDL8HerNQ/f2WXOAsdZhltEmy6U+/NMZ
         2TkSw07tOa+UAeXZIeaE4TxkXo8sRpLTF+QquCxZAdpunLoqGRyiYk37WTuU8Y06u8wB
         yPrlWpFaQmSxb0LN+kI9nNn568JdQLLZOKgVxtvj0ccfBBdvdfPs0KwgauW3hFb11LAk
         J7w8SFIy9sJ6LMOmIIMAJGdd/1TlhHQ+zLk4Vyqf1TytIe1QdUYmELZhEDIqBetrNKAU
         WLaJ4EJnuuk1XxiblZeVoxLV3Bp5bAM/ZPTjUSgOoxWVCGv18h3jt8K3Zta8KySTCTzO
         P5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87LarcGZUBDgr/oOLmODSXoRJIoY9TQRZN+1jE9/e80=;
        b=Kk8Fz+TlpH+KY2SQfabnkUB8Rwq/CnE7WQRpC+aU9emaHiffWYLPPp8q3m0rDA9whr
         LHYundJUV125JNi9ToRW9lOKwQ8SI4vsih2YNtxI9QF9oTffoIlyOeutkL+s4AQmGEBw
         3KncAI7HkrGaXLRek4qhqXM+KY520mxvcs6BGezkmuhh9OsvyQla2xWUje1gEgool2v8
         dQMU7CQNRb+2HDxSBT05HZad3JIE1AyfYQSgzT6alH7Th9DLNe8Sm1XpZN8nz1/1P2N+
         eGU7NZUvsvUJNm779L4NVCbtg87hGEd/sCrEGtiH5RiYGMLeGLIIlZ5KAoDbe+/kp3/Y
         AxLw==
X-Gm-Message-State: ACrzQf3UT7UrRF7R8gX/jytGBGpIbSe0Udr/NHN8l4ih/uYAcoRBmOKF
        +odtcwyDFnynMEl//jXa0Gn7WMrtvfw+sQ==
X-Google-Smtp-Source: AMsMyM6trnS53gwTrdqygRdoUjSYxGTV9WcA33cxuAALJD3Pc1LKGNP7e82qp23PpDB3Z9T/7jcEwQ==
X-Received: by 2002:ac8:5f4d:0:b0:392:f942:911b with SMTP id y13-20020ac85f4d000000b00392f942911bmr14376591qta.26.1665402384895;
        Mon, 10 Oct 2022 04:46:24 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a178c00b003972790deb9sm6698707qtk.84.2022.10.10.04.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 04:46:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>, Xilin Wu <wuxilin123@gmail.com>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
Date:   Mon, 10 Oct 2022 07:44:13 -0400
Message-Id: <20221010114417.29859-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
References: <20221010114417.29859-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pin configuration (done with generic pin controller helpers and
as expressed by bindings) requires children nodes with either:
1. "pins" property and the actual configuration,
2. another set of nodes with above point.

The qup_spi2_default pin configuration uses alreaady the second method
with a "pinmux" child, so configure drive-strength similarly in
"pinconf".  Otherwise the PIN drive strength would not be applied.

Fixes: 8d23a0040475 ("arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.

Changes since v1:
1. Put it under pinconf instead of pinmux, as suggested by Doug.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 132417e2d11e..a3e15dedd60c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1123,7 +1123,10 @@ &wifi {
 
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi2_default {
-	drive-strength = <16>;
+	pinconf {
+		pins = "gpio27", "gpio28", "gpio29", "gpio30";
+		drive-strength = <16>;
+	};
 };
 
 &qup_uart3_default{
-- 
2.34.1

