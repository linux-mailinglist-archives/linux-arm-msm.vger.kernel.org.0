Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187F0789A7E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjH0BAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjH0A7w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:52 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341591AC
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2507403e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097988; x=1693702788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=iLdaRalAEAgQdvJh/7AlI30QUxeDI0E4A0d/S/qU6EVUyhRUWEP88ecVuVBRFW4PrX
         J+Ogf+CUBY0+gnIFCSae8gtxWJ/9gDZLxK4c+6tHoPuB+k0Z//ioh6p+depchZ15oZmI
         ogfJQ8ceL3p4T/LcMMrPcuCydAV6udTIBPr5E7Fk+qitT6lHAacSIDrhloF3RIFCCw14
         Rrnr8mK1FP3dvhPV0G+HRv/NkPS831HRkdFnjOj+ctSUAQri0MQRWXM6tBAe4EycwGl+
         9nv+Ez8l2n6RGUKQrtuNXAvkG9NGuUbwvwthwr5s6VpWMYhqVxMfI/7PweZkpJQDJzQm
         O0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097988; x=1693702788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=kLruXn6DEnmkTNppwrOPMIhrWOlvjTsx3Z7jPvHmQg0swQUPJRs0cu0+q5tSiMOE3k
         1HqfgGjQ68kx2EhW2I2Tbmi7fGy8eOysVMRi3vh09F12hq5JScPZAwZcFS03bNAu3OGv
         t1bKaTuguKTJP5m2qXiFLXKPdUSIXDomdC8C+RUK8LJj9CLviiABLGkDPbNo44nAzx4e
         lPj5Kf+NAfnT+F1//HWKANZdTTbqEkU/in1WJ3wQpHz/xBH7L77nVszaqketifiuwCBw
         +29pJLKboaUEL01XIE3emq0MaqGo0HoGLFtlo10nwQ7N2ZGlcd3M1vxr7yOAKznJL4Gh
         b7uw==
X-Gm-Message-State: AOJu0Yw8GTn3/w4O8NC7Vcw4Of3/QRVLOMCoGSl5bj70yt66qh7jwk7p
        c4dcfA4CDUuskKsilvQNVXvIQg==
X-Google-Smtp-Source: AGHT+IFTwjPT5v/eCeIXRplfhaNBLzBdBeVS+3h1HdZ/BkWCPSWEoAyNldxD+/XaCoAvXZsv/WE1GQ==
X-Received: by 2002:a05:6512:1143:b0:500:acae:30c5 with SMTP id m3-20020a056512114300b00500acae30c5mr1002440lfg.15.1693097988638;
        Sat, 26 Aug 2023 17:59:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:47 -0700 (PDT)
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
Subject: [PATCH v4 24/38] ARM: dts: qcom: pm8018: move reg property
Date:   Sun, 27 Aug 2023 03:59:06 +0300
Message-Id: <20230827005920.898719-25-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

