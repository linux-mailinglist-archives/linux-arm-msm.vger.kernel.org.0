Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1FB69770B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 08:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbjBOHFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 02:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjBOHFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 02:05:11 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECE62B2AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:46 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id d2so17310122pjd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 23:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hWzwrq3hV8TOIaiR9k+5O0t1qbVTCRxBbpH8HHjlnE=;
        b=TXxVBnOl2SIR4Z+zNTzp6FqHB53+Ro8Go7PuEp2MxkqRwcIxvh5bMwnmHSSKMpLilf
         1Y8OZQuBrGEsJ3NfgbwuUeS7Ll+HNzDmvtfRFsaW6b2USxa4Ay8mc054jZl0cg71lm8x
         8Smdib4ujb59JRqQJAlzeO2le2ZBpJXGSCb8WKJ0Uv+isQVhvHMsSqH6e+s7eliCN4Vv
         j+N6v3E9sfXGX34XhdgaAk2bJ0O389NX5JC+M+E9Tp5BhdDTb6VaqKyIB7dawYXzTUQ/
         cV9rPjHlfBzY0kiMMkbUWkoM5KXCzoxBmc/HEk7PFhuyJc6JnS1rJS1I28RYa2NTl41r
         59pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hWzwrq3hV8TOIaiR9k+5O0t1qbVTCRxBbpH8HHjlnE=;
        b=oMUa/Op8hul8n6vJO9SX8gWPPFz7dQqtRv56R0ssZv6k8IvCVPG29U0kroRe13Ueyh
         nNxhQajQPM3v5yqVZBS09TiJjnM9yEJB3l4icwkg+wN8XZSRjuygslkQb0GDF5AhgVVM
         q1FB6RctvYSyeneLbYpDcbXOLZONy4RKu9vhTt/OpuuLKY2VvNXhNZOYjeL/ByUuNoBF
         Myo5TsWJ6oLolu466Ado/o6UjSvZjulF+Nain6WBsNbCJ1K35EMcLjHBiP55unu/DKSE
         uVgBECTfDQEkaREx+NWHC9cHX/Fku85ftZ24QwZErYFzIvCrajIRVT1UNAzNzfDi2ePX
         8/zg==
X-Gm-Message-State: AO0yUKWbXalOg2CTpmle0HqEwMLx3JsMa9kdd896ECr+NpYV/k6Te5QV
        wJwKJ3eFeSJXNNUcKZ8vxHLo
X-Google-Smtp-Source: AK7set/dvRUR4GZQ9t+4QoWWw1umfYbQXveA2+ox4t3Z1D+kxLGtdPXh57GFTCY3HU70nL6cqfvoPw==
X-Received: by 2002:a05:6a20:a1a5:b0:bc:ccea:a969 with SMTP id r37-20020a056a20a1a500b000bccceaa969mr758477pzk.26.1676444683578;
        Tue, 14 Feb 2023 23:04:43 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id e23-20020a63db17000000b004fb26a80875sm9953795pgg.22.2023.02.14.23.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 23:04:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 08/12] arm64: dts: qcom: sm8150: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:33:56 +0530
Message-Id: <20230215070400.5901-9-manivannan.sadhasivam@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index fd20096cfc6e..693d023d2629 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -48,6 +48,7 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
@@ -74,6 +75,7 @@ CPU1: cpu@100 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
@@ -97,6 +99,7 @@ CPU2: cpu@200 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x200>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
@@ -119,6 +122,7 @@ CPU3: cpu@300 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x300>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <488>;
 			dynamic-power-coefficient = <232>;
@@ -141,6 +145,7 @@ CPU4: cpu@400 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x400>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
@@ -163,6 +168,7 @@ CPU5: cpu@500 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x500>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
@@ -185,6 +191,7 @@ CPU6: cpu@600 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x600>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <369>;
@@ -207,6 +214,7 @@ CPU7: cpu@700 {
 			device_type = "cpu";
 			compatible = "qcom,kryo485";
 			reg = <0x0 0x700>;
+			clocks = <&cpufreq_hw 2>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <421>;
@@ -4273,6 +4281,7 @@ cpufreq_hw: cpufreq@18323000 {
 			clock-names = "xo", "alternate";
 
 			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
 		};
 
 		lmh_cluster1: lmh@18350800 {
-- 
2.25.1

