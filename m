Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2079D6976C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 07:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbjBOG4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 01:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbjBOG4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 01:56:04 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A70F360A7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:50 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so1043469pjw.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLerwrwmNfdynSXWopegSimuZHzpOIcHKtk78GRdX8o=;
        b=UWT7PSGN+DTqPGi5/+E/wRvWd7NuIeEIeYB0D2DExXZ4sJSvhI4Y1UEDIO4fnbBxJ5
         UzmCQPiZcwsEOnlRn4tilvAiTCOh06UFypIrUH9Fhp1Y05upYYcRFK0O23xzRYh8Xhta
         fw24qHfTeWhi2TozzQq3kAbhV10qKE1Vw9OzlrqbBD1XbRh8NRcUd+3JPs681E4gaPOE
         OPy8RiY5Ho0mIahQBXFameqTf2u6cnRrkC9AsqB4FurpJVYviYlOWupMYo2EtA17XVTO
         /qJmQuOV80JcPXx43yh6EezCfooJSagqhiHFPAvDmnwSk2kXFYUJ2NA+rAmnhxRKuuz8
         6uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLerwrwmNfdynSXWopegSimuZHzpOIcHKtk78GRdX8o=;
        b=duEXGsKHzZ1kmHJi+bR43/ZH2QOdxKNTXuRarzQy7RTKhoAHkJ/EeR4NMhH9Fbbd80
         pKjtelR+ySIQKABnIUHD3jXcRxzmHGMhNOlYqMLMMabau/0N+WYStN1U4F5LyfWcqkFZ
         MqmXeNNoQUDy+TmvgzdT/3P7HyMr1IbJLgG1k3CrdQx81gZp10KLKDDwP275AP3h+R8O
         DfOzRawMYfmZneOjGRl71au1iFcSNYsT8yepbJHFYBEWK/t+x/i4K58C1Y69Z+vB8rsB
         T0Laimr/etQFIuJAQXqrL6cP0mg1PxO4AlVTsXqaHCMQffYRa2gDBYnHxlrJsIcvNC7X
         46lw==
X-Gm-Message-State: AO0yUKXW9YwnFbxTUmTcAYpCHX68cnYz55uns5H5EVuWsQX0V7VO5wDB
        Okz77DtZykv7gVU7Img1Hoz5
X-Google-Smtp-Source: AK7set9yIv7SjmdaFApOYfB5S/AU/g11ZIKU7F5uALQTE/oT5unaGzT/HgeUETR74mhvrcYVzDwgJg==
X-Received: by 2002:a17:902:ec81:b0:19a:c432:1f57 with SMTP id x1-20020a170902ec8100b0019ac4321f57mr1666194plg.17.1676444150390;
        Tue, 14 Feb 2023 22:55:50 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm10276870pls.183.2023.02.14.22.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 22:55:50 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/12] arm64: dts: qcom: sm8250: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:25:16 +0530
Message-Id: <20230215065520.5535-6-manivannan.sadhasivam@linaro.org>
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

