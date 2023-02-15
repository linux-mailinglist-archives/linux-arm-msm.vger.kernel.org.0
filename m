Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A796976BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 07:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233601AbjBOG4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 01:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbjBOGzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 01:55:54 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7933D35266
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:43 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id w14-20020a17090a5e0e00b00233d3b9650eso1141413pjf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUhIIB+rfvrBco0Tx+05fd4NkFmNEOYIZUMnaElvm+E=;
        b=rvT9r9KEdxdCdEx2GeQYl8gZRXzxVietvcLA/znTfqasddQqlgKHV+6ME+fpZdZ+aM
         t2/udTgfa3qIuVMnp5Oi9X63BwezodgFlb4UNOo3TCKhwOihvYBlZMpodaybe2oLJJOq
         F0PXol31DIioq2VC9z1Es0Bd4Gtog9DXcdzKek67Y/MiLZ0sf6o36c2Ci730SumokrKR
         GYEUwrDiu4Bm4+aGAbHq7gmZyXtgnxEU56cFJ1XHmJUQpJbEf4cs71hi+VOCxHvbWgJQ
         gIR1zmEZqf5zktpkrg6g9DLaKTsA/oW+BM5kN389kwYBdxnPkstF3O9YetbaLiBQ0g/b
         Rnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUhIIB+rfvrBco0Tx+05fd4NkFmNEOYIZUMnaElvm+E=;
        b=dWv1SHGMde4h8GMd3cMzy4wuPgIy1nmr5d6UD8dFWBHPkH6r0rvkdwYUpjzZe7NnIk
         lhUjSCOjBq5VXxpTm88rPh2EYQLzceHOcdlNkSgb1ZbgjK1s9l2JiBySPKA7AaRexQWE
         acIJCmO89GHVKAzGtqMFPxXgCTDQsq/fh0oWz1SQudBQv83nv9YaoBR4Ej2pbpgFj5J8
         LWinLyddfEnd/VZtxdkDpd7DO10xWkvq4SGmPJzl98dMkIJ55NTl2Dr8j3g/aCkg2u2d
         lRylZtCsjSnngyroAr2ye+xqt8W2p2VI5VKO17CdjxTEggbkBpXle6F41wSRkjUAxv0F
         FEug==
X-Gm-Message-State: AO0yUKXCaQBRng95c4QHnfAnCP4TvTS87Ps32NRIuIy5iTooibKjw16I
        HhYcHOVPGNNzaMDed/G3v7LN
X-Google-Smtp-Source: AK7set/6fYfKiaaCWNrq35p1kTHmKLUaIG98KaglWUUA25TlVJrL/M6fdMbnMZjTC8YeeHsjOTVbfQ==
X-Received: by 2002:a17:902:ea0c:b0:199:2e77:fe56 with SMTP id s12-20020a170902ea0c00b001992e77fe56mr1778356plg.52.1676444142777;
        Tue, 14 Feb 2023 22:55:42 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm10276870pls.183.2023.02.14.22.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 22:55:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/12] arm64: dts: qcom: sm6350: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:25:14 +0530
Message-Id: <20230215065520.5535-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215065520.5535-1-manivannan.sadhasivam@linaro.org>
References: <20230215065520.5535-1-manivannan.sadhasivam@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..c46bb6dab6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -46,6 +46,7 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -71,6 +72,7 @@ CPU1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -92,6 +94,7 @@ CPU2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x200>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -113,6 +116,7 @@ CPU3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x300>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -134,6 +138,7 @@ CPU4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x400>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -155,6 +160,7 @@ CPU5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x500>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -177,6 +183,7 @@ CPU6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x600>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <703>;
@@ -198,6 +205,7 @@ CPU7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo560";
 			reg = <0x0 0x700>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1894>;
 			dynamic-power-coefficient = <703>;
@@ -2002,6 +2010,7 @@ cpufreq_hw: cpufreq@18323000 {
 			clock-names = "xo", "alternate";
 
 			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
 		};
 	};
 
-- 
2.25.1

