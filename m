Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9822615EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbiKBJJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbiKBJIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:08:51 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0B227FD5
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:08:49 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id h193so6996652pgc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWX3PFtX+iNvvcqKHYXPbN+3ItiEZ3sX7UGhc0uTyP8=;
        b=QwqjzGJgppdayDXTm6UjIfNJI4qwy9hl2hsoOCOlR9hemvSkrVEKJVWHqSpRHEyAu7
         eQbTjEbZCGUK4OPFtRYcs7X/y6nQh3e2mAA4zpGMKvQO2cldA2MczhIiJLJZN6bInIhh
         HuOgvT0jecYqJ+0ltQ9vdeweX9z+FEfSLDJt9VP+z7sPrbru9R2qt/qQNEUHCE9NCepm
         mfdBEu1YTE9IwsdbAK0Xio1y+1S/2HBBiIWYIlnbLzS76dGG40lmEznyXPRynn92y0dz
         bbdvGHpe2EMxZ9VYHD7lPoz8SIWXdD16xJeLt6Vsm9FLoXaQu+KeLhXfee2cC5nZB6PY
         Z0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWX3PFtX+iNvvcqKHYXPbN+3ItiEZ3sX7UGhc0uTyP8=;
        b=uyJnICMnrNKtKs8F5KywvZq0mFNBoVg0l2DT+J9Apmk+Rxnt8UGBrKLytEitF/Kwn3
         vhz6pJkYcWReR1Sj46ZEE3jNx+NQ1fJN0T7LUmAl9uUjvUkHLcLtCb8JNHjzZAmGT5i0
         E7fWmlzLgNw/2i7rBOlnU14g/aSxpOroKkFECA3jGSDaYIIxvONRsMGJJGtujKv4eEIH
         kymm/pl+n3jEaS+AaXIhdaeBAdUyhFAFT8SLzyGVckcfRJE8A90vzgM1i2yl/wbNdwt/
         t8K363EApoMaOSjWqStozQMlr875EigJgMxo0jkZeXZWHXYKnkgivpdt8mwqH5bUrY1h
         YPTg==
X-Gm-Message-State: ACrzQf1L2kiTtKIvKmj1bbUGnOHBRUKjzorYIrzXOMi/52zzySMhEfLP
        JiR5thwBcOgELgpReqG2afiw
X-Google-Smtp-Source: AMsMyM7WN7H5q2WXhID5u3tLTwQgGgRaR6i8jg93NwvaEumnfLJJNhboz0orIs4S+pGTqV+bgQ2Qjg==
X-Received: by 2002:a05:6a00:2906:b0:52a:bc7f:f801 with SMTP id cg6-20020a056a00290600b0052abc7ff801mr24444615pfb.49.1667380128742;
        Wed, 02 Nov 2022 02:08:48 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b0017f36638010sm7856126plg.276.2022.11.02.02.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:08:47 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org
Cc:     johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8450: Supply clock from cpufreq node to CPUs
Date:   Wed,  2 Nov 2022 14:38:17 +0530
Message-Id: <20221102090818.65321-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102090818.65321-1-manivannan.sadhasivam@linaro.org>
References: <20221102090818.65321-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index d32f08df743d..234d2722a4fa 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -51,6 +51,7 @@ CPU0: cpu@0 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -70,6 +71,7 @@ CPU1: cpu@100 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -86,6 +88,7 @@ CPU2: cpu@200 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -102,6 +105,7 @@ CPU3: cpu@300 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -118,6 +122,7 @@ CPU4: cpu@400 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 1>;
 			L2_400: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -134,6 +139,7 @@ CPU5: cpu@500 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 1>;
 			L2_500: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -151,6 +157,7 @@ CPU6: cpu@600 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -167,6 +174,7 @@ CPU7: cpu@700 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;
+			clocks = <&cpufreq_hw 2>;
 			L2_700: l2-cache {
 			      compatible = "cache";
 			      next-level-cache = <&L3_0>;
@@ -3075,6 +3083,7 @@ cpufreq_hw: cpufreq@17d91000 {
 				     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";
 			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
 		};
 
 		gem_noc: interconnect@19100000 {
-- 
2.25.1

