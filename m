Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C887C6976CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Feb 2023 07:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbjBOG5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Feb 2023 01:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbjBOG40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Feb 2023 01:56:26 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D14534F7A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:56:02 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so1043812pjw.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 22:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hWzwrq3hV8TOIaiR9k+5O0t1qbVTCRxBbpH8HHjlnE=;
        b=W73Vup5l/4wmUFILlnyK+/L/Wr2iRFEBesUg2thm7OrkLy0vgdp5c8DjXJsV+4p53t
         xmLK+cAIGCwz4XhR1HcSmz4UJEmWURJTdX8TFR6c2ajIOdXbqNZuO2vgEs9qqMaGJtmH
         zMcUiQ9rbGaxyvSnOlO0KN0PwxWnYnu79J49eaEu8ziVzzB1LhTXqiPXTCzgVG+nAER9
         nZLqQ6eEFJOfh+g3iq/3W8cQW2j8fsZIKHId9sYsimOsD4QMBQCtOAcj62gvKYp3Ku8X
         udHcu0S80nqUVZ5iTT6YCTxSxGyeTv6eaW9UmjDTWAv5lF3BqJVNCjUTvvetTxcCGGvq
         f4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hWzwrq3hV8TOIaiR9k+5O0t1qbVTCRxBbpH8HHjlnE=;
        b=EGNE9mscx2x/7+flRS0SH/+LpAhbgcK50sRqsiWa+HvNlLOslBvB2rH9w2Qll0LoY7
         1B6oXZ9q+MeqVpvzjJglm2Oe6adtInvNPdIs6e7lJroeWK29L15cnZQA1vJmw5SmQAcv
         gBR5uBoM3mWh3I4+5koCQ5U+hwhxJTAnPscejCLKddQUCMEmx5CkLDUIL6WgbMcYc+lp
         LsvNCYHSpLXSj07aj55/LCzcP7a9ikJFvDDhE9wIqGiWPH4+FrXH1acsulLVpszIvWp1
         3d0fDK4GE+VfAo2NIRiMr73kdAJTQVhuuRI0MqZzXPbgmeiC4F/Q5qvdUH/uKGK8K3Yq
         Gpow==
X-Gm-Message-State: AO0yUKUGPfvdyR6FDzvYQjOUxt3uOytO1ZsYQJ8G5JlW7L9Bec8IGSZ8
        KhH8BCMaKYQ01l1BPRtII73/pD5TDuHPNO4=
X-Google-Smtp-Source: AK7set98tbJrd+LprEx5pqji2QGDLjt7orjF6PtffR0wVCzF7mUDefaqcMsGkR6c6p6/PdhJntBbvQ==
X-Received: by 2002:a17:903:1110:b0:196:8d48:8744 with SMTP id n16-20020a170903111000b001968d488744mr1405591plh.40.1676444161988;
        Tue, 14 Feb 2023 22:56:01 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.87])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm10276870pls.183.2023.02.14.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 22:56:01 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        viresh.kumar@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/12] arm64: dts: qcom: sm8150: Supply clock from cpufreq node to CPUs
Date:   Wed, 15 Feb 2023 12:25:19 +0530
Message-Id: <20230215065520.5535-9-manivannan.sadhasivam@linaro.org>
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

