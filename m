Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994F45F11E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232418AbiI3Swu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiI3Swr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:47 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1BC166F03
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f21so1258353lfm.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=32ReyeR7XTuL/1pE9nCyvZ0sfnZgNS4vS4jw57Niey4=;
        b=l9+eGK9GXzGiAnjrtQO70xhoTBHK8XX+tzOsU2mUID5N2ygW7IgHEiu/XId2gPvQyN
         hZp4+sV0MRZ7BoIOkSax98qnPDd2B9EwKY8iryoh394j0yI4dIl+oP49C7UUn3iqU4uZ
         LVGS8xPfGz3KHZkjGu0LNtT+d/+926VELnmp0jgiBmppsPmngkaSdOgdqysOtAHXIPoc
         pR2yTY82mMKikSvmLwDimXAcVJzDo3bSRjZ6XoP+Mw9sa62lKdQULgYKu5A8PdXJe+4C
         LbpNIvQ7Rc3AAtW1gNXdn72vD+hTyENlxC+hUSDJQuPxmtYxxbjWS412qzLC5uAJ9CNu
         lutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=32ReyeR7XTuL/1pE9nCyvZ0sfnZgNS4vS4jw57Niey4=;
        b=pDMu1pedMmDCHDL5vpdh5CJq+xgtdZMFNvgf1H3l9+MLcquh/TJOdb+DzOLx+8Ds7b
         eSBDnbfkcIDqz/rvlCb1Mz2FlfcbCP9EFpOnea6V/j76C7UnO5MNJVyjWLvVft8/Xws8
         hIm/7SSww9oIOukbX6wFB6uzS33Xlqhxj/h62RD0QUVO671bB8LmpAInNnr9gppg2a9X
         Et6muFtCO89h7wuz/a+8p8dMB2eHKjrF98R9g54nPSYWup+I1q/ARGRRYaQe9utxTrkC
         g4LN+s3ly1cCVcbDibO98rP3O8OZZeAznCU410go9ZEmXAKb2/+mMKdIrHesG3yAvRDj
         a0Aw==
X-Gm-Message-State: ACrzQf1GwTWmUgC/G/Gr7Yq1LeGiUtxYHBcAnnnnwGojdXqEhtfZYWtP
        RvaZCtMU5IDG2WKPJWvV9BTQjw==
X-Google-Smtp-Source: AMsMyM7XKvHEgDHGTJdajPskW5DvDS7UeJ1ZP7X5gosWM9Mg30grrsi/SWOL7vpz5EOob5BMuuh6/Q==
X-Received: by 2002:a05:6512:c21:b0:49b:d7ab:166f with SMTP id z33-20020a0565120c2100b0049bd7ab166fmr3623927lfu.418.1664563964961;
        Fri, 30 Sep 2022 11:52:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 10/23] ARM: dts: qcom: apq8064-cm-qs600: pull SDCC pwrseq node up one level
Date:   Fri, 30 Sep 2022 21:52:23 +0300
Message-Id: <20220930185236.867655-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

There are no need to add additional simple-bus nodes just to populate
a single pwrseq device. Pull it up one level into /. While we are at it
also fix node name replacing underscore with dash.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 5ff0d9a275cc..d6ecfd8addb7 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -15,18 +15,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	pwrseq {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-		compatible = "simple-bus";
-
-		sdcc4_pwrseq: sdcc4_pwrseq {
-			pinctrl-names = "default";
-			pinctrl-0 = <&wlan_default_gpios>;
-			compatible = "mmc-pwrseq-simple";
-			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
-		};
+	sdcc4_pwrseq: pwrseq-sdcc4 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&wlan_default_gpios>;
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
 	};
 
 	/* on board fixed 3.3v supply */
-- 
2.35.1

