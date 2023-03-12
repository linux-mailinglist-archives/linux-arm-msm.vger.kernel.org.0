Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35AD76B6A40
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Mar 2023 19:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbjCLSiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Mar 2023 14:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjCLSiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Mar 2023 14:38:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1448BA278
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j11so40269437edq.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Mar 2023 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678646191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuPzeXIkkvxZlmBGwuF8BA+hbLGZlSob+2JT6Oo/EEM=;
        b=HOy1+bQPa4p0NPb0+dDp2X9KViwR9fYIHAhZ8QfG2PdTYYULkJ2tKcmssHjeYG2oyt
         LUaj124iD2LEeKvnx94x7Bo8QxUudW87q5xc0RXZzrnFtJv/RLrWLE6jQrKS7pWdv/O7
         EDxDbSTpKpWbGgUq6/yjuBJ4IfKBX/qJBYbtIXaXfT9v1MECLnPD14jLLNZBLlbuJOfq
         jUOE+M6I51ch40pJOZLBF/wGTOludsewVAQbDzYEN7Bjae8fFj3Ytd5TuJ+eyh532e4+
         0ewj4a7+zqTD6J9TUeQqrKEsdLiPWLaUbjIXkNfve2GOptPcoQ1oNfvp7T/6AkPC6C53
         0/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuPzeXIkkvxZlmBGwuF8BA+hbLGZlSob+2JT6Oo/EEM=;
        b=2+jdjMyWLP+289caFBg1uhFxRNScG9FTNJogZmd4zXqwlpWG9XPaOTOSAu5uw8CXnU
         upVpjw+KE/qucHPBfVcPUl2V5kSrlj7V+SnzLJoz7VsjAHia8vxs6jV1dBKhdFC+De2z
         RPI/lRjYskebpqO3LCI/BUlTf8yVsxcXDiZF4CdE9JrRec7koOYVe43van1tmka8vC0S
         vy7Y6L8xftKKVjZobLKB+D0ym58BD5kTqt25Sy/3Ov/daaDgxCiINut836wQ6d1Z3594
         uywbajSbPZMB/MalwzII3jCR2duQ/CCZIF0nkOe/GHBhgHOWGcpklTTw8gYqj4PEs77T
         2lsQ==
X-Gm-Message-State: AO0yUKVKRYhhGFfWOeOlrY42JPuwkX42yVSrTFqLGkO9EfbO3AnQHfKX
        ks0wcgIzY2yss7+pWN79BtXBfw==
X-Google-Smtp-Source: AK7set9HLozRBqMdyTjPD5NrdfwGCNQCb5xIU53D6EMe2N5ul7aBJKW0Au2hRZrT9E/qZjW6ys77HQ==
X-Received: by 2002:a17:907:7f0b:b0:907:9470:b7ab with SMTP id qf11-20020a1709077f0b00b009079470b7abmr35591538ejc.71.1678646191153;
        Sun, 12 Mar 2023 11:36:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709060dce00b0092669fb4ba1sm893806eji.130.2023.03.12.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:36:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] arm64: dts: qcom: msm8998-oneplus-cheeseburger: revert "fix backlight pin function"
Date:   Sun, 12 Mar 2023 19:36:19 +0100
Message-Id: <20230312183622.460488-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
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

This reverts commit 46546f28825cf3a5ef6873b9cf947cd85c8a7258 because it
mistakenly took PMIC pinctrl/GPIO as TLMM.  The TLMM pinctrl uses "gpio"
function, but PMIC uses "normal", so original code was correct:

  msm8998-oneplus-cheeseburger.dtb: pmic@2: gpio@c000:button-backlight-state: 'oneOf' conditional failed, one must be fixed:
    'gpio' is not one of ['normal', 'paired', 'func1', 'func2', 'dtest1', 'dtest2', 'dtest3', 'dtest4', 'func3', 'func4']

Fixes: 46546f28825c ("arm64: dts: qcom: msm8998-oneplus-cheeseburger: fix backlight pin function")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Eh, embarrassing. I would say to myself - use dtbs_check on patches, but
I think that time there were too many errors coming from Qualcomm
pinctrl bindings.
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
index d36b36af49d0..fac8b3510cd3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
@@ -34,7 +34,7 @@ led-keypad-backlight {
 &pmi8998_gpios {
 	button_backlight_default: button-backlight-state {
 		pins = "gpio5";
-		function = "gpio";
+		function = "normal";
 		bias-pull-down;
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
 	};
-- 
2.34.1

