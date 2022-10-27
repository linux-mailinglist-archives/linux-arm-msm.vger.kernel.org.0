Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB1160F04B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 08:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbiJ0Gbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 02:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbiJ0GbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 02:31:12 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D0A161FC7
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:05 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso574847pjc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJD9pg+8d3gbB5bhYEtgXKZfAldyXXkDaqxLrNjRHCg=;
        b=Wc3M/xJxsntnV3zSr730T95omcsJ7gxCjGaRYgqi0yGZMppK6QRd2RruLsgTky4edm
         9s3hAjv7LR1fAFwIoLNU677Zfi3ACcDaTbLfUJ5uqkUlosSLpYgySR57eTf6DCYE3c5G
         xLZAa1miqqkxjTgmZcbKq3CPw8jC+m0m8edrar47c8kJZpZgaVeKpevINh1GYQMZoL+c
         g4kiLZDtHNlT27yXKuI9Ys3eKqcxZUXfQnVKE2FHggb9MOd+Udfe9wE71UucuO1ch3TU
         XqPdEc6PwBnnm8lmebmyq83lM15xZVrvdHPlTMSAqt64QTl+j1Lu7c+CVLf63X+yS36U
         Dipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJD9pg+8d3gbB5bhYEtgXKZfAldyXXkDaqxLrNjRHCg=;
        b=UnZnjsYDSh+t2p4ez+b7jKvZ9hO9XQGt4UBPykMUbXwpjzm0bqcPxVH+tTCxg4MAAX
         LJiC8cMJKAm/qzgfsy3e3teoTiRCMJAnFS5D1jISjF29dPRyssKmZ5n2qZBZs+i/WhgI
         JpM2uc1jxx+6z8u1C5vgoDfZ+ODJHuEEcvvX9AxMl6X5eV9/FokdL1KrGTvezkdCUAlP
         rq2Lq06cEiKtP7SBahSvuMzhVNYBcO+khdeF3wCX9t47+KVusxz7pXVBqurHLdHfZzLV
         a9W6j0qJPGiuUXcYRlhiNk3IcLrlW7otj4q8idtVR0u2LqxZZ8PW9EEaaXLK5IFfFZHM
         KCoA==
X-Gm-Message-State: ACrzQf0nLR3ysyp/q0pjrV19ZYcmZ60KyhOV9NZMdGLQ/2UzU1AN/pxV
        /9O+cIHttusx+BlGXkBY9XOhW/nY306S+LM=
X-Google-Smtp-Source: AMsMyM4Ae7muS29NvHlJAXpdQKUmEBj3L+1jpX7k7qk6MlBh1xSzP7RawSsA8G2OlzK+jmU2WXEDFw==
X-Received: by 2002:a17:902:ef4f:b0:186:6723:8da5 with SMTP id e15-20020a170902ef4f00b0018667238da5mr35911254plx.6.1666852254627;
        Wed, 26 Oct 2022 23:30:54 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.123])
        by smtp.gmail.com with ESMTPSA id i126-20020a626d84000000b00561d79f1064sm446041pfc.57.2022.10.26.23.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 23:30:53 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/11] arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels
Date:   Thu, 27 Oct 2022 12:00:03 +0530
Message-Id: <20221027063006.9056-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
References: <20221027063006.9056-1-manivannan.sadhasivam@linaro.org>
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

Add VADC channels for measuring the on-chip die temperature and external
crystal osciallator temperature of PMK8280.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 6aa8cf6d9776..9ac5d5c22832 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -173,6 +174,23 @@ &pmk8280_pon_resin {
 	status = "okay";
 };
 
+&pmk8280_vadc {
+	status = "okay";
+
+	pmk8280-die-temp@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk8280_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	pmk8280-xo-therm@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		label = "pmk8280_xo_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.25.1

