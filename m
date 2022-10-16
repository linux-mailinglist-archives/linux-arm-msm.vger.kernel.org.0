Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 880CB60022B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Oct 2022 19:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiJPRWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Oct 2022 13:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiJPRWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Oct 2022 13:22:46 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633C532EEC
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:39 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x13so5443180qkg.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Oct 2022 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IP8p9vKToYJMy7wcnsAiwE01U8L1mn26stcaAumSsjA=;
        b=YMXLKK9xvTY9noqnf5q27iT1Khsyi1SUgdPZHhxV8Xo1pNBvnfvaSGBNcvqN0Di5QC
         IXdNB90nDwhZxxUmC47esow0oLJOnCWI/jE3W5kEt3Km9K6TWm8SRgOHnxE5hia0K8rv
         rQdtiUdEVYyf3rtICN2M7T5W+ZAiwESN9BGFxVPQfBB8gl9DzkJ/onsQHUf0jD+oTdwU
         MNh5DmgkNb+0aV/gac44ULr1f71wR1Jpu4YJ34Ib1AUqA7/taxuwTypvk/MoZfkcpTmJ
         IwJqNBCN6HecRbOlBuCgI98RN7I1K8GzowLHTeKu4HdYcgRZCB7q43cYmBf98kn3wiPk
         x9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IP8p9vKToYJMy7wcnsAiwE01U8L1mn26stcaAumSsjA=;
        b=aoxyADqA85lLzy2kLaEp7q/69lJjr9bOs43wNS0i0OcFYej/1Q2NUaCQAYlMI8oEmU
         7Dub+SqdLUoMcdN9Z94arf+R9ZRrGo5Gk6eG6TzXCUK6ZBVFqbWPxjVbVDWKgHoKBW0Q
         6N2F/hptI3cj/5K/Sxnw+ev/kSl0f7tFzZzxDFnRotZFKkATd+FFOQOQejBikxXfVjUq
         8XkMgd5JXMERrwIyagN8lCDHoysGnSazvfTmHXln4cjOoCJVPyJJlokVOV6TY7ehV4Gx
         Fp/JJG3cB47BLS7uhoPYmPDXgVVfXROF4BMpfY4k+hBxCwJC56rjU0LK4FWF6PPeeCKR
         +I3Q==
X-Gm-Message-State: ACrzQf0ohNRx2V+HyC8IerNfVllMXMQHsmhqOZGt2Qv3nAtCjF9yMLVu
        jd/7LWiDBWkDgLxJqbb1176PjA==
X-Google-Smtp-Source: AMsMyM5XUSx92w88r8BqIOmw6M1ooQckCyuDr6aLX08Iaxc3Lu05306F0hVu7oSwahRM3bKs1/hL8A==
X-Received: by 2002:a05:620a:10a1:b0:6ed:3b23:6991 with SMTP id h1-20020a05620a10a100b006ed3b236991mr4980209qkk.683.1665940958200;
        Sun, 16 Oct 2022 10:22:38 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r5-20020ac87945000000b003431446588fsm6051008qtt.5.2022.10.16.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:22:37 -0700 (PDT)
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
Subject: [PATCH v3 05/17] arm64: dts: qcom: sc7280-herobrine: correct number of gpio-line-names
Date:   Sun, 16 Oct 2022 13:22:00 -0400
Message-Id: <20221016172212.49105-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org>
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

There are 175 GPIOs (gpio0-174).

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts          | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts    | 1 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi    | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index f0f26af1e421..4e0b013e25f4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -372,5 +372,6 @@ &tlmm {
 			  "",				/* 170 */
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
+			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
index ccbe50b6249a..739e81bd6d68 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
@@ -328,6 +328,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1a671968725..c8ff13db30b9 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -358,6 +358,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
index 4566722bf4dd..3dff610fb946 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
@@ -321,6 +321,5 @@ &tlmm {
 			  "MOS_BLE_UART_TX",
 			  "MOS_BLE_UART_RX",
 			  "",
-			  "",
 			  "";
 };
-- 
2.34.1

