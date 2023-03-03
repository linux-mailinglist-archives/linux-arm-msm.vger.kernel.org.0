Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15BBA6AA3EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjCCWJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbjCCWJV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:09:21 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEE867801
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 13:59:52 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so5356762lfb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677880710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMUNS7sepBti40evG3v1VzCcdXq5T/S+i6PiT3G+pfs=;
        b=mwKCN8Hd+7f+HoC4Zlb2O3XOI1pWE/V8SEf7jIDFZQ9ruRjREK4sfNVuT5Yy0aFDNI
         4R2K/z/WIPEP2xGN8+VxguMd7cNNHgjWbZGHe9dmyni4dnXxrFc1yiuzicXnAaUXnmWO
         hVFoBMAshKj2qEiajhjiFUdgw5veq2UWUqDR91c2VIP79cVQt/h/gqgYoZOvvC3VsbwE
         8sbOjdGO+H5tf9ElRaLB3LARiEKYT8A0xrUFiqPRA9MUkgTr+tyJ9z8zVrU97L1VOvcz
         M0agUjPa21WPgjlld+gGkwHzucMwDInRBkQPIMewB5ZlBKjS/j9OYyBHi66Lla2EfsMO
         rF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677880710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMUNS7sepBti40evG3v1VzCcdXq5T/S+i6PiT3G+pfs=;
        b=7huzgWKFAFS+4dOe7zma1n6Ezg28Xs12h+2yMLjaUfMBJ5GcPxzyLggTEMHGY4Y0Cx
         GTQubTa6oynjo+EeDk42w1d4Ze6FgM+0iXY9QL6Z3FXltSwLcS08+dfPJSD0HMhiQ6aR
         snp3HZK8c4p/1e846VjDcSXSKVXRsRt8A9GmX1iAryW3/LXe89E1jCzoY9dgpjFN6uDo
         cTUivTFByfL6aR2qFCPFMtP/8O9P54+b5wumGCYI33r1gxrZTPqTYA5b2Gz9uGiQvDUk
         cNS1cRCFgM9Tl6kIxr3RiRKjPe7FiucgclNabkkX5EG1p1NEIU4KF79u2DiQtBsfavWE
         Hnkw==
X-Gm-Message-State: AO0yUKU5VlSI8qbKN0h1GsTWIpHptVTKmvTng9BafYmwyjJFjS+HVJ13
        6LFiSdbrd9fy/xefHuSI3SnIsQ==
X-Google-Smtp-Source: AK7set+xTOMvHQPpikQYpYy36pXqXQETgeNZhjJI5qy6WIbBqGxqgoV4v/7eUZshp7eRmb+hJNNc7w==
X-Received: by 2002:a19:7405:0:b0:4e1:7d1c:85ce with SMTP id v5-20020a197405000000b004e17d1c85cemr910940lfe.27.1677880710686;
        Fri, 03 Mar 2023 13:58:30 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:30 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:13 +0100
Subject: [PATCH 13/15] arm64: dts: qcom: sm6375: Bump CPU rail power
 collapse index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-13-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=2856;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Qo/t+wBOxYfbhVIzvJopzDAhr8R83GF/inpNjIKH5i4=;
 b=g235hPJZ2ZyXkacBlAhRPLIHA1uGZC7mNoBH5+i+M1wYXAToQ+XNthEFZmTV3B9F+OBYu7mYBkwF
 dpZhHdtcBlItLd+uTPAzfc0bCew7lPkDsplDEmTL1vif1Eaa8jYq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for supporting a less-deep sleep state, rename the
existing rail power off from _0 to _1.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index ecb654357288..05d8d6a012b6 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -207,7 +207,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "silver-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -217,7 +217,7 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 				compatible = "arm,idle-state";
 				idle-state-name = "gold-rail-power-collapse";
 				arm,psci-suspend-param = <0x40000004>;
@@ -268,49 +268,49 @@ psci {
 		CPU_PD0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			domain-idle-states = <&LITTLE_CPU_SLEEP_1>;
 		};
 
 		CPU_PD6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_1>;
 		};
 
 		CPU_PD7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&CLUSTER_PD>;
-			domain-idle-states = <&BIG_CPU_SLEEP_0>;
+			domain-idle-states = <&BIG_CPU_SLEEP_1>;
 		};
 
 		CLUSTER_PD: power-domain-cpu-cluster0 {

-- 
2.39.2

