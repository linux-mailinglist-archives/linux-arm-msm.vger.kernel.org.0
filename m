Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0602C6229E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiKILNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiKILMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:12:55 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0116529803
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:12:51 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id y14so45720981ejd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kkk0BVciICMQdiXq3b4b24zIaTChjtWtKsRDR0Xn5SM=;
        b=norvNgsUlGEgHcxU7ydnTLIbBTUSbHiTkGUDaternIhcBTffi/H/rw6k8Uv9eBCVsK
         5qFimzdcfX+zJpfVz2+MzyCWfL2uO8Lkh1dAo3U0QFnTQdE3ELOlO6RuU6qgZ/7nZfIA
         RvMZK/vwayUgTzH43yT1Y9x67FMgM9UJpJyaNF8Jca1iuzjPcg9YxVBmXqcKxzROW1nF
         Ia91fPmDpStwRbdNp1v6dMnP5L0jAQ32wssNoCBU32PHFYwJMZRaD/pDYmVitlsVOjUK
         2wIQxt6lFWZwKiejN6TRpcyOJGOuUtr+Woo5i83jWPiEjt21yZCR+MmHWKHqTCSDN6S8
         lHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kkk0BVciICMQdiXq3b4b24zIaTChjtWtKsRDR0Xn5SM=;
        b=s7CL2oaWFutpX4fD+5ZJZrB49HSE6TBuKlupeBO+Eh7eMx4s75Rm8zZoCleIMIhUW4
         sM4wtorq/RlS3Qb7VkIRY69vhkzo3W+X1/14t4AaAvXFnAiEozCOHhXdjz93fnHl9RUo
         RI2Bcx0dnWCJEoSxcgINFJKRAUltbUF8ewI+l2ZacoQKBxBboPd56DincQ23mJR9vfgT
         Dw1i/FWF3KhdoXk1kxY6U5FZeaCAEbw30HnrkJRZN16YDPedeeAe1DD8gJXtqgqnBWvy
         3z4YoL0BNuLYsk5571eIV7nU/n5kgnbuy9lMR8Kt1hCCes3I4Jfdnz9Edqr1Z87WslMT
         YiIQ==
X-Gm-Message-State: ACrzQf3lQFr1pxG9i8sZQkbMUZVIT3jGdgg0yIqY0jN0TsWN4O3kS8Dg
        1F2UzP5h4u/Kj6sH33j3vxfocaD10+BN3oK6
X-Google-Smtp-Source: AMsMyM4Z85S7p4piPlh2/OIShmbx5SnxxCQO9DQ+xbE5KKJjI2fpKE0WZL4p76rz8I8F7+PMKExjog==
X-Received: by 2002:a17:907:d91:b0:7ad:e178:9fe5 with SMTP id go17-20020a1709070d9100b007ade1789fe5mr45807242ejc.476.1667992370275;
        Wed, 09 Nov 2022 03:12:50 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b007ad9c826d75sm5825899eje.61.2022.11.09.03.12.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 03:12:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
Date:   Wed,  9 Nov 2022 12:12:30 +0100
Message-Id: <20221109111236.46003-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109111236.46003-1-konrad.dybcio@linaro.org>
References: <20221109111236.46003-1-konrad.dybcio@linaro.org>
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

Add the pin setup for SPI/I2C configurations that are supported
downstream. I can guesstimate the correct settings for other buses,
but:

- I have no hardware to test it on
- Some QUPs are straight up missing pin funcs in TLMM
- Vendors probably didn't really care and used whatever was there in
the reference design and BSP - should any other be used, they can be
configured at a later time

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 62a64dd731a0..952156891476 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -519,6 +519,49 @@ tlmm: pinctrl@500000 {
 			gpio-controller;
 			#interrupt-cells = <2>;
 			#gpio-cells = <2>;
+
+			qup_i2c0_default: qup-i2c0-default-state {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c1_default: qup-i2c1-default-state {
+				pins = "gpio61", "gpio62";
+				function = "qup01";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c2_default: qup-i2c2-default-state {
+				pins = "gpio45", "gpio46";
+				function = "qup02";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c8_default: qup-i2c8-default-state {
+				pins = "gpio19", "gpio20";
+				/* TLMM, GCC and vendor DT all have different indices.. */
+				function = "qup12";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_i2c10_default: qup-i2c10-default-state {
+				pins = "gpio4", "gpio5";
+				function = "qup10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			qup_spi0_default: qup-spi0-default-state {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "qup00";
+				drive-strength = <6>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
-- 
2.38.1

