Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5620D6976F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 08:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjBOHFN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 02:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjBOHEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 02:04:49 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D373609A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:32 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id e17so10532602plg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLerwrwmNfdynSXWopegSimuZHzpOIcHKtk78GRdX8o=;
        b=CDD6hhgzG+k4l9BH2U6Z67LL3lVoDj57tdvq4TaY1FnG0jSzd6HtRTeY5XpvYX1Pgw
         G9f1TVzMP+OeA+QuZK0appRi26qZQfeVN7OECs2QQtX4EmNfx1QGnJoH2V+u4H61Q9ks
         M8xx6pOna6EfEcBzzDTWEzNjmvfwvhArrMfRldfCdRn78OwsKPJDNlKdD+CqAq9cz7Jt
         81EhVVGq00yG3tDdUd7pLCtHjHovZArsUA2Wrq8x25Z3t5roQxvo7fpIxaZz5wFdvPwC
         OnqYra9xF9s0joi+zLDI4TXD8fdiSuh/bUTHSrjvyH1gSXos89xMfUAS6SFnIfciwa3b
         rnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLerwrwmNfdynSXWopegSimuZHzpOIcHKtk78GRdX8o=;
        b=m/Y2L9UGJZUxaFH0gDeCR0bEgdZVfc7rajZLNeKXnO5kh39dtrOiwlPPYxPC1fwbF7
         Qe6a4oKqs3LuOzfEmqnZoQ5aLTMVxMoG2pLOYO0tm663+5m6VVCX/cnAOE5Ss9E39pwe
         Q+zN96dSR+9cxjoVbskC6E+zZNCZ/Ek3YgMolgYwy3prnTy6tcgllabhKPSwpeTemFxZ
         gkMWsM5hxkwLXUIW5dII2zzpdH72YLVZsDi7Nzpm97Uc0a2rUl2IKoRLRVLkD+3QSEvq
         xWKwA3jhRDr5RAHI8Z7W3Ek1ZCODH6gTdh0F507ucPBMKNHMHdiQxqeoM+0JJBAYLZk9
         O++A==
X-Gm-Message-State: AO0yUKXmUbE5Z6Wy61uaU6jYg6q1f0U7XrODYoRS6srGAbmrXzqUnieh
        QoGpMtzoE5ih7xS2zGEjgO/T
X-Google-Smtp-Source: AK7set+WN7i/v3ddRm/NjsgZKAqCsRSsgkHLuyYc+DbQ+6pqTSvMFZbKUHyceR5gbqleUAnPDM6+Sw==
X-Received: by 2002:a17:902:ea06:b0:19a:8680:ba87 with SMTP id s6-20020a170902ea0600b0019a8680ba87mr1562863plg.11.1676444672288;
        Tue, 14 Feb 2023 23:04:32 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b004fb26a80875sm9953795pgg.22.2023.02.14.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 23:04:31 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 05/12] arm64: dts: qcom: sm8250: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:33:53 +0530
Message-Id: <20230215070400.5901-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215070400.5901-1-manivannan.sadhasivam@linaro.org>
References: <20230215070400.5901-1-manivannan.sadhasivam@linaro.org>
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

Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply clocks
to the CPU cores. But this relationship is not represented in DTS so far.

So let's make cpufreq node as the clock provider and CPU nodes as the
consumers. The clock index for each CPU node is based on the frequency
domain index.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2f0e460acccd..44c8851178eb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -97,6 +97,7 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <448>;
 			dynamic-power-coefficient = <205>;
@@ -127,6 +128,7 @@ CPU1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <448>;
 			dynamic-power-coefficient = <205>;
@@ -151,6 +153,7 @@ CPU2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <448>;
 			dynamic-power-coefficient = <205>;
@@ -175,6 +178,7 @@ CPU3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <448>;
 			dynamic-power-coefficient = <205>;
@@ -199,6 +203,7 @@ CPU4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <379>;
@@ -223,6 +228,7 @@ CPU5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <379>;
@@ -248,6 +254,7 @@ CPU6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <379>;
@@ -272,6 +279,7 @@ CPU7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
+			clocks = <&cpufreq_hw 2>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <444>;
@@ -5481,6 +5489,7 @@ cpufreq_hw: cpufreq@18591000 {
 				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
 			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
 		};
 	};
 
-- 
2.25.1

