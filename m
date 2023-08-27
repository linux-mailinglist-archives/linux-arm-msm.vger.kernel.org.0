Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D70789EB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjH0N0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 09:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjH0N0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 09:26:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81711B3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2808367e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142755; x=1693747555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=Aw5Wzu61p3fgqE8qbHeNcnfanSLNCQKKvTZTQn2Oyyb7JR8CYzWdj35d4/TkNgivmA
         tz7nt9I66FvM9gtyyhJKOPTUL1g1vpn87nWxdR9YJB9RHjk2hsLVYYaI7JD+54bd2Qp8
         NtKVafztg7H5ZZJTlqXsZ1Bt/Hwn5U0boRMwTUFjK6E5tBz7324nob3ZtX+uUWuy8SO4
         FWp24G0fFHwHUF1fxV5uC9YuwP8KSKZotSqqQptkdjuqofybgTjuL7l/z0LE3mJSqaMN
         yDnDWw6gbEBHubz9svekzuHuVYJkD2XbZSBDTJIad8gYGN7H9EcSrOeh/0GYqhJSAfGe
         3uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142755; x=1693747555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=chp1t2zaDAGijzg/hqYpJZACQZaB2HvpUT/nnujMpztttmrd129tEsQsmEbX4Ys/Hv
         6ZuZALC97sHSDsadGBLGFH8ltFygy95sXOy93CazlcSX2gF1a/tGQVKCiHAv9mcyXmpV
         cL2J1S3rOnre3nDEgmov2Ku3j9YmFB1HthM24mEm4ABU84RkBzgLrV1L2flbBIYToxsz
         FZVkPmjrsVhBmD3ecz1e6AVco7EZzWdEp9sGh+CK0N6sUaohbwMDnFXj3Aw1sfXmwbfM
         cBr1/tu9eMemqyNkQHvq9IIFzkJoQgelJHNlS0s5Mb7NpLA9d6t1qto26ymGdZH6uSrP
         /rAw==
X-Gm-Message-State: AOJu0Ywh7tDJ3H+MLyYwPl87hirc91LtBmDDdYGR/22YE2SduNkL8fyw
        qtAdR/IeJ/4lKvJabrv+zdNHUQ==
X-Google-Smtp-Source: AGHT+IHY7hbxtNf/QtjGiIoO6Fcu8yi8W/1YGFubIABaRu0y4g/LYu6qfwWUQf3U35oyOGsIoOzT5A==
X-Received: by 2002:a05:6512:32cc:b0:4fe:3724:fdb6 with SMTP id f12-20020a05651232cc00b004fe3724fdb6mr9500421lfg.30.1693142755142;
        Sun, 27 Aug 2023 06:25:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:54 -0700 (PDT)
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
Subject: [PATCH v5 34/37] ARM: dts: qcom: pm8921: Disable keypad by default
Date:   Sun, 27 Aug 2023 16:25:22 +0300
Message-Id: <20230827132525.951475-35-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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

Since keypad is used only by some devices, disable it by default and enable explicitly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 360a179670c5..058962af3005 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -43,6 +43,7 @@ pm8921_keypad: keypad@148 {
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
+			status = "disabled";
 		};
 
 		pm8921_gpio: gpio@150 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index a5ea4843db43..36f4c997b0b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -102,6 +102,8 @@ MATRIX_KEY(0, 3, KEY_CAMERA)
 		>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
+
+	status = "okay";
 };
 
 &rpm {
-- 
2.39.2

