Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3145F6976F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 08:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbjBOHEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 02:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbjBOHEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 02:04:34 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384622BF19
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:25 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b5so19385553plz.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUhIIB+rfvrBco0Tx+05fd4NkFmNEOYIZUMnaElvm+E=;
        b=NbPR/wy9Le5l8ozOb+Ll2Oega3WQzP92LeeqVEu/BsbQBQpVKpL4CZFgitxVmG8Vzs
         BxRniE8zT7Ith1kiRALuxxAfwjzFi/FM+TQGQ50APf5+nmaj1KB7sul59MemVER4hSZZ
         WOeyP3d3eSyguggcKrTc7RSk31GWrS4QR06hWq7VfDG8YNASIp4N0UNFzVSKU1CD0/Mk
         ZLHcnl4SU3E3vkvgRLzJNa/H+n9FsZ/MzSybKplrssh/NzcrJk0xoNDIi4LqunyKkP/i
         WBguLa47tHhOa/QyVHeRZ9T/La+jamD3wNXDSXzuFakuTiD7710Pl23A3NcbjUzEJhU0
         VdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUhIIB+rfvrBco0Tx+05fd4NkFmNEOYIZUMnaElvm+E=;
        b=xhbFem25q/u0VDYhyjDfgY7i4cyU9Y1Oo4jJ4KANHi+f3RLdzL1RP5rtgcE+acHQas
         GtPz8Xr50FGU5UR3wOuqHTVTUzy4OBH9qH8SOiFa6sJQmGbGG23JRigOOQkRJ4hDM18D
         UXFeTB9CaEfwEX/BqQe/MlLXxd8fRWlJ/uwMBxkDcfinKd0DT9hI4URwL+sqz9pN/6WL
         ST7T2SNkXOFN3V3fi9Tc0UIl1R3bU8WucYNnl4WGaoyZ8xREqoHOP9+w/KiB4UiFg1dG
         bg31TKKFsgpAkpePvyMb8lvlBz4HNAm8g4fVk8ZGFHnSIbTQ2FMhEhRMXWBpWOH5HEFh
         Qz+Q==
X-Gm-Message-State: AO0yUKVUtUE7XZlo+RK7ZFxtT2lFWJtTPjgUGq0t5265VLscflrJ9xQq
        4dzVMPL2ayRpRwlhn++v30DE
X-Google-Smtp-Source: AK7set+6HTklswC0VFLHuRDsaKpXxTW5/QvhGj9pfceEpq67kb1mZfRYrOLBj0EuRwcJWKDebRc0TQ==
X-Received: by 2002:a05:6a20:1611:b0:be:9142:737a with SMTP id l17-20020a056a20161100b000be9142737amr1064757pzj.56.1676444664699;
        Tue, 14 Feb 2023 23:04:24 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b004fb26a80875sm9953795pgg.22.2023.02.14.23.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 23:04:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 03/12] arm64: dts: qcom: sm6350: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:33:51 +0530
Message-Id: <20230215070400.5901-4-manivannan.sadhasivam@linaro.org>
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

