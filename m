Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481E7697719
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 08:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbjBOHGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 02:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbjBOHFo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 02:05:44 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B159534F58
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:59 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id z6so7922418pgk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9SZVljqrUgZ+rONZA9P+4NVWoVxjLglMoeDTNYtK/s=;
        b=vGsvj9+7E+fcbpEsGcJbRqZHNGK+vVQReuooTnh1mGB0auT9rze2W+v1+qeDstnQA6
         UM57R8zIw9S4EBoKoQCcInBerSxDuyK3F9AT0OwMdNQZICFQ+pWjHXRhM7xKNNtHdBr+
         oL1EMjGwN7nY7xZYYyAN58svbOvgYAicDpXSbSBMdxvoAq6XYqxg+r+dYrO98TKnW2Td
         qnjoiv2MZ1gZafOq6lJoaqVtwuuZXWE+jX+J9EhvqIfaEh7nPn7XOcmZ2xXXEOrUC0Kx
         3NXXVwdJkxwxneTJJ3bu0xfX6OEGUSxnHB0BewHoAKWLHxbqmuaHLddcunPy2tPRGuzL
         Ylsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9SZVljqrUgZ+rONZA9P+4NVWoVxjLglMoeDTNYtK/s=;
        b=AMwv84ZuadO1UwVGgL7XQ+nN5reFi8C4S5hdqzv3eaWQiyH8QS2WbHpUQQ4BCctbk/
         LFdMVEJjvXZTIgv7fHZ39SwTAmAEbzW0tsRK45JBoLBshZSOrBzCoJ3Eqt8owkCQc7ai
         gDlJuXYlaZqwsuRHP/oggghb3fL9VAWKyvI3qCzLmRj2uvNxg1ZcEv7pxLbhYXHi6/Jx
         lgET6qJBQ5E7xI30kozse1swpZG9Stcl1xhvOagYKVwxjzfxJQdguCPdJueFT3uNEQ3U
         5fiYvuR5/ulWZF9u7SkLLwfQE1icWbGmG01UEI9/pns5d03d3gixNV5h0HmMYwn0UUH5
         7pbg==
X-Gm-Message-State: AO0yUKVNHssLFmKMTgYRS8g0KhNHECh7xLvmj7CynOqve8wmywSveQaQ
        lHHB0OthaN9oh6V18DT4gP0w
X-Google-Smtp-Source: AK7set/ms4duETp2wCsPmCbgGWdXj6W212ASa08LIZGeYWuk+vsPdwsUdZ+MSTHKVbW7RJAt+nUrgg==
X-Received: by 2002:a05:6a00:42:b0:598:b178:a3a9 with SMTP id i2-20020a056a00004200b00598b178a3a9mr909696pfk.6.1676444699140;
        Tue, 14 Feb 2023 23:04:59 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b004fb26a80875sm9953795pgg.22.2023.02.14.23.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 23:04:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 12/12] arm64: dts: qcom: sm6115: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:34:00 +0530
Message-Id: <20230215070400.5901-13-manivannan.sadhasivam@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 4d6ec815b78b..f55b193139bf 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -39,6 +39,7 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
@@ -54,6 +55,7 @@ CPU1: cpu@1 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x1>;
+			clocks = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
@@ -65,6 +67,7 @@ CPU2: cpu@2 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x2>;
+			clocks = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
@@ -76,6 +79,7 @@ CPU3: cpu@3 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x3>;
+			clocks = <&cpufreq_hw 0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			enable-method = "psci";
@@ -87,6 +91,7 @@ CPU4: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
@@ -102,6 +107,7 @@ CPU5: cpu@101 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x101>;
+			clocks = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
@@ -113,6 +119,7 @@ CPU6: cpu@102 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x102>;
+			clocks = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
@@ -124,6 +131,7 @@ CPU7: cpu@103 {
 			device_type = "cpu";
 			compatible = "qcom,kryo260";
 			reg = <0x0 0x103>;
+			clocks = <&cpufreq_hw 1>;
 			capacity-dmips-mhz = <1638>;
 			dynamic-power-coefficient = <282>;
 			enable-method = "psci";
@@ -2123,6 +2131,7 @@ cpufreq_hw: cpufreq@f521000 {
 			clock-names = "xo", "alternate";
 
 			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
 		};
 	};
 
-- 
2.25.1

