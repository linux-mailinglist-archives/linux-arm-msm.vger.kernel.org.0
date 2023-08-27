Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26E1A789A0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjH0BAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjH0A7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:31 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E446E1BE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bd0bc8b429so405211fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097966; x=1693702766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7ewwDA5rK2znaB44N+h4kM3uTy6kez9qLlohwFRQDU=;
        b=dr+xGfPeYe7Wa2DSNVZV/hj9UAPQ38c1g0yJEofbEloBWIr1C3nlyAvN0XLN5ZIE8R
         vPE7dc7lBbQTQjDAkbzvDAGGQknMkvPAfLHw+56eiGXgownMfZNCWL7QhB1DnR8fJvsK
         tyubDUAkii2h2hCpEDAEdZVibyZr3GZ1mjbj/pWq/dAFQvml5ZJ4S/bEVukF3UQXLt4G
         w2t6VnAgMuPsIXLtSwpcTYsIDjifzLmck2LgWL/Sc+qMPoNOJrNfidamDEhAbij4RX3G
         eqS+i3kiGqxA18emCJU7b61VMN39U9VQucVvlZIAyNGujQDP/2IrmmjJhJ+aTC6CXiUS
         izMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097966; x=1693702766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7ewwDA5rK2znaB44N+h4kM3uTy6kez9qLlohwFRQDU=;
        b=lBfIMtd4j5cdn2SmplmrFsx6vwOnUanm0cva9/HLwyqyQhUNxVxYTja2TLacItSkHQ
         bH1l9bfjngd4OqgKrJYlm2O8TkD+Mr+JM6xelpclY2jC+ZuD68UzwNe6PeuxYLlg9BoH
         paM4/42k2/uRKPmFDsFc62MPX2nQGyQaUM6maTQUD09AV4WXzQI8FpIfk+m0XfLFkgHN
         hr5HAzHdL5dPhlKsaK2qnv6arKzr4u6mwxvd8VceSoXQP/Rdda+rAs2Y7IYkW2X39cpL
         YZI67T+2jTHd1wPkug0S1Ticrr7jhG+l0E5yHz+ZY3OWxW854zheK5JzIS/KeoX/WlRW
         B1ww==
X-Gm-Message-State: AOJu0YyMqDNbkUFOy5dqXzw/hyCs6uEvHwSV4clc0U1bWOi86ey6Ka9T
        v1DhEL93Ka2NM3rdfkI6usuDEA==
X-Google-Smtp-Source: AGHT+IGkdIIbysyoBRj0pXlTSsbuUyxPi/2jfcF4IkJZNSjqZkhLnZGgbQJK/uyzvu1TAIbijBXsZw==
X-Received: by 2002:a05:6512:33c5:b0:4f9:cd02:4af1 with SMTP id d5-20020a05651233c500b004f9cd024af1mr17790616lfg.34.1693097966249;
        Sat, 26 Aug 2023 17:59:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:25 -0700 (PDT)
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
        linux-leds@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/38] ARM: dts: qcom: apq8064: correct XOADC register address
Date:   Sun, 27 Aug 2023 03:58:46 +0300
Message-Id: <20230827005920.898719-5-dmitry.baryshkov@linaro.org>
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

The XOADC is present at the address 0x197 rather than just 197. It
doesn't change a lot (since the driver hardcodes all register
addresses), but the DT should present correct address anyway.

Fixes: c4b70883ee33 ("ARM: dts: add XOADC and IIO HWMON to APQ8064")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 516f0d2495e2..950adb63af70 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -738,7 +738,7 @@ pwrkey@1c {
 
 				xoadc: xoadc@197 {
 					compatible = "qcom,pm8921-adc";
-					reg = <197>;
+					reg = <0x197>;
 					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
 					#address-cells = <2>;
 					#size-cells = <0>;
-- 
2.39.2

