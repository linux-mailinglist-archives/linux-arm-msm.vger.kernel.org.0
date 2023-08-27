Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73DAA789A20
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjH0BAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjH0A7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C782CD1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso2879292e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097969; x=1693702769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=w+mTlmdTnNKyRDWWInYY6gjWSSboe//dx/nofUDQ1W+ujC+GZ0yM2ziAtkvdQWdREI
         HPYT5yfKfVqd8QVufA62gfVpbb525oXAl5ne9cJQzO50ShRHSr6Hqd+xif0mkE8xTn5I
         sfcHvo7cBa6zENLqjNm253735R4sCySB6+Yl/hOK8jlGsug/KRCUVj4vz7r4J3sUYlWv
         Bu+d23iJuDMs3R9s9ahvpcXqtqxxnUAKHZGm6c/+VL0YD3N8yZMK1tTQk3M4inyyys6i
         BNWDOjCU2IKwuZZ8reWqT8uliQTERVytKEQJRXIRnGTjVxEBGf6HX6L51r5NefiL0Nms
         dNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097969; x=1693702769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS4tS46Wt2bF/A6aYMT37LuXJaPlC2jK1TxmIfbaIXc=;
        b=CpUvQHA+3DUdBQ3hXXFnNHyFZ+V2gSMTWHxyP5fWYFOJ+gw/6NJjPXZG7OxG02H4i/
         e81ER6hbRWuzO3s5iI0x/NwX+yboNrlzEhOqVp5dU8hAPzg5Zzw1JgghjZVzOt7VVEDZ
         4a2dC0EHXr4Ky765OYi5pF1FIgBt8Oq2DIhdzIGQQq0TvmmZX/SuqLbECZymQsoYngBZ
         pfFyq7CxmRACWqo+QE9txO0ud91p24Ls88zSZKKJqCjij/YIGpN6rpbaZF+CLdcSapiL
         nn41ZIMEPfmTbixoY2xq+f1w0PK9e1Q+uWf7SqMAi20QFixYVXdPzng15ACvxiusIcqP
         btFA==
X-Gm-Message-State: AOJu0YyibHb9btnXzhJz+r+EzXAv/RdVUlMWWPs9XSUqVMrP3AKL0Hck
        HDmbk/qzMk/q2RYYBjVnOAF/lQ==
X-Google-Smtp-Source: AGHT+IGj8OZF/1EMhc/rsUi8zHDR6FWmCSqEK3x3PN3XBjBn/rkHpc0W3nLzI2Wiseg2XhWDtxojug==
X-Received: by 2002:a05:6512:108d:b0:4ff:7f57:facd with SMTP id j13-20020a056512108d00b004ff7f57facdmr18637315lfg.54.1693097969478;
        Sat, 26 Aug 2023 17:59:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 08/38] ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
Date:   Sun, 27 Aug 2023 03:58:50 +0300
Message-Id: <20230827005920.898719-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Group file inclusion to follow contemporary practice.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
index b269fdca1460..e3b4b93c3d38 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548-mangoh-green.dts
@@ -6,11 +6,11 @@
  * Author : Neil Armstrong <narmstrong@baylibre.com>
  */
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 #include "qcom-mdm9615-wp8548.dtsi"
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MangOH Green with WP8548 Module";
-- 
2.39.2

