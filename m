Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD60465A44D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 13:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbiLaM73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 07:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235676AbiLaM70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 07:59:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBEE9FC2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:25 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bt23so18511332lfb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SA/KUG7trdJprIRMgglwxfGA383w9t/Hu91AgkN9c4=;
        b=xjnCQ7cDJigZ3vGWyVGIERKYJCyVkjou+5ANtRInemvHykGXQEYhc5vBCVhNz8SPaP
         AS9fRt/Vr+XABr/Rgu8xYUGvZhK4XRFTVaFetJhtta34lZUM0K4fhRrf2J1E19vKcsLs
         fAqeZc1oyl2e5sd0h9445w8Y7nJXwvKkPpruEORzoVwhIOagoTvDOB8NrB5S1yTXRpD9
         tMpiSXAD9JDRqc9gT8tSgesYce6mxp8bhQt9TVGQug7DEaJ1fv7ZPi2rgG+5tGRZCS0k
         iERa27JxkV8hRUorYD5CpK9hd90LU6X2yexY3YAW+fe9hh1n3PZIYaa+/t+bBHP7EVPT
         6cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SA/KUG7trdJprIRMgglwxfGA383w9t/Hu91AgkN9c4=;
        b=xpxekZhegR9ZU64ZWqdZ0Vz4qgvJTAtw8VMnuZTcZpySNmjXbjCQWPCf+V05m2GTAm
         jLB6IbsWVqDDR0FMYbq98oTyEwWrvIPc7qwO8YOBE1FdBJEbz1PnJ3EQ0kaHh0/vsYSE
         pDb439xakpDjkYXxQp/svGiuIjwK73WxBqujVPVde4UJ/RcJAeDYd9CSinF9v3JBvO9C
         VpnfhJ4LxLPxkIyWh6pZNDMDaVroXL1UYWPf+acErJv1sdgj1WjTm+8f0jbZe1w6tz8I
         Ja+Akijj/+HJDzA/S3y3eYkUQ2Mn1EY/wpwDCNbnbhjIery4YuIg51plkNw6yJPGjVxf
         VxyA==
X-Gm-Message-State: AFqh2kq7ovMgZxjlmIBVcVzcdcZ0i+KAplvzFiBVRuucn0nSNRjVe9LV
        zdbLddWv3qecX4a/tBhPKGRIRUZhw/X3VSR7
X-Google-Smtp-Source: AMrXdXvF7WShDeUeV16nF6Su9sYyLKPzwsT0yrVJaLMYuTMWfRjF9+Q7PKeKglGKGTleI7/wXWYgFA==
X-Received: by 2002:a05:6512:2c8a:b0:4b6:fdc3:a65f with SMTP id dw10-20020a0565122c8a00b004b6fdc3a65fmr13489641lfb.11.1672491563291;
        Sat, 31 Dec 2022 04:59:23 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id d10-20020a0565123d0a00b004cb344a8c77sm22266lfv.54.2022.12.31.04.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 04:59:22 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] arm64: dts: qcom: ipq6018: Add/remove some newlines
Date:   Sat, 31 Dec 2022 13:58:58 +0100
Message-Id: <20221231125911.437599-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231125911.437599-1-konrad.dybcio@linaro.org>
References: <20221231125911.437599-1-konrad.dybcio@linaro.org>
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

Some lines were broken very aggresively, presumably to fit under 80 chars
and some places could have used a newline, particularly between subsequent
nodes. Address all that and remove redundant comments near PCIe ranges
while at it so as not to exceed 100 chars needlessly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 5452bb85f8e1..6b4f653239ab 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -102,26 +102,31 @@ opp-864000000 {
 			opp-microvolt = <725000>;
 			clock-latency-ns = <200000>;
 		};
+
 		opp-1056000000 {
 			opp-hz = /bits/ 64 <1056000000>;
 			opp-microvolt = <787500>;
 			clock-latency-ns = <200000>;
 		};
+
 		opp-1320000000 {
 			opp-hz = /bits/ 64 <1320000000>;
 			opp-microvolt = <862500>;
 			clock-latency-ns = <200000>;
 		};
+
 		opp-1440000000 {
 			opp-hz = /bits/ 64 <1440000000>;
 			opp-microvolt = <925000>;
 			clock-latency-ns = <200000>;
 		};
+
 		opp-1608000000 {
 			opp-hz = /bits/ 64 <1608000000>;
 			opp-microvolt = <987500>;
 			clock-latency-ns = <200000>;
 		};
+
 		opp-1800000000 {
 			opp-hz = /bits/ 64 <1800000000>;
 			opp-microvolt = <1062500>;
@@ -131,8 +136,7 @@ opp-1800000000 {
 
 	pmuv8: pmu {
 		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
-					 IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
 	psci: psci {
@@ -734,24 +738,18 @@ pcie0: pci@20000000 {
 			phys = <&pcie_phy0>;
 			phy-names = "pciephy";
 
-			ranges = <0x81000000 0 0x20200000 0 0x20200000
-				  0 0x10000>, /* downstream I/O */
-				 <0x82000000 0 0x20220000 0 0x20220000
-				  0 0xfde0000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0 0x20200000 0 0x20200000 0 0x10000>,
+				 <0x82000000 0 0x20220000 0 0x20220000 0 0xfde0000>;
 
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 75
-					 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-					<0 0 0 2 &intc 0 78
-					 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
-					<0 0 0 3 &intc 0 79
-					 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
-					<0 0 0 4 &intc 0 83
-					 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			interrupt-map = <0 0 0 1 &intc 0 75 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 78 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 79 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 83 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
 
 			clocks = <&gcc GCC_SYS_NOC_PCIE0_AXI_CLK>,
 				 <&gcc GCC_PCIE0_AXI_M_CLK>,
-- 
2.39.0

