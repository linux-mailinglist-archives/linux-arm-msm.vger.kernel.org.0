Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8940789A25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjH0BAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjH0A7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4113ECFA
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5007abb15e9so3227108e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097968; x=1693702768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=UShHV9j76+b2UGFB5EC7mePQoUg/FeJkI8Odj0XEg9yl6Y/6tzP1o1HYOMLoYGrsY/
         bPr07/vlfUQXGFhlwyLSh99G/BFYRZljHiqFe8YrdYD4W+9RD/tCbnFbIBInYDgaRcNK
         MRMo9F7XH+AimDgB48tvcZgOHpsKzwMfFC09QMwGITB17xd7VeKKXA3ODUcpeRLCEoVa
         W8xBM43KxlHJXSQr/53nWHi71y5z6LXfI6Di3jlB2r6HZpMkHpyequGDsgo85cjX+rLV
         vlw/oefl7qj+O/cflOnK0YVzgYKe3Pbt0DgrnS7cahy3zXfL9qKzDZ7GXnlFXvZdp+YL
         Y9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097968; x=1693702768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=WpOkro8N7B25IqqezBIhFe/S1S2QfAQOuHUxZ7fjRPFp8ze26Gnk6gD18gseQlAYxk
         Ld3JXbfxtYk5JxRXJtEe2hBe495VVAJkyPgbMjUhAQ7XRhp/iARz7lypls3rCaQwWO6U
         LaWCMlI55ufwjqNxVS8PcLPqJw2UNmN2lR2zXOPK47wqcc/Lenn0zXUUi4oCsmqZMgTU
         QYjMkdpBMlc2jOs+s6nrhRtv6sCi7J8xFY2k4nUUqIyY868Gd4ZOVk6PVkGvb8MgBzHv
         RMxFCxxABdQciRLdHZ6tmC+PgqBTG7Apx4sFiKAR11bGMMAwm31NmfEneo4HBEd6/9RV
         1o7A==
X-Gm-Message-State: AOJu0YxPvNbTF/PxKW5ySZV7mqMeCFFIoYbgQJ3t78zm/GfUbz1Ff/XF
        KXs37sH7qcuZr1TFGd8v/G4qKg==
X-Google-Smtp-Source: AGHT+IG71KDyuArP16wER/MBvZejk6g5ArMnhWS8q/w1v/qvxBf3oYq1dqBHZ7VVSpJT4nHsqqMdCg==
X-Received: by 2002:a05:6512:5d0:b0:500:9bbf:da17 with SMTP id o16-20020a05651205d000b005009bbfda17mr5923510lfo.51.1693097968651;
        Sat, 26 Aug 2023 17:59:28 -0700 (PDT)
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
Subject: [PATCH v4 07/38] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Sun, 27 Aug 2023 03:58:49 +0300
Message-Id: <20230827005920.898719-8-dmitry.baryshkov@linaro.org>
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

Move sdcc1 device node to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2

