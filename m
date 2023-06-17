Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D8D7343BE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 22:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346548AbjFQUlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 16:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346527AbjFQUl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 16:41:28 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F7A19BD
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 13:41:26 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9875c2d949eso155634566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687034485; x=1689626485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ul5u2LRy09FnZ57VCih9X+lrbtOZWLMB4/wwnDvm74=;
        b=KPyTRKkk7Sl3y7iSnj0nTVpXG8juNgHaXnt4p94mLn8MSFQD9+/gjievTziaCNsM7p
         bhLHWz3eJYD9Xh44GjUkIeDTZujPW93RPjVYdTW1knU6H8lRpktBSpZ4hmmdlDtgHtyw
         hjMS3p6YWI5Z6kqTmA+YKwAbAKwSKJIxEVhJT4raGS68oHHvAXYqXHr2nLiVxApxSPNx
         hzro+o5cLG2Haj8o6IHQk5ywSWiXKtuc+QET8JUeh+CiArzdEy4jtR4T4A9yUx5fs7wr
         SJ0eJxJE16Y5qLcMFQE7U8iA0Ck/wapcZLqsEm42VZlGX8dl5V1NZbQVODqqtDjCqFWk
         brnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687034485; x=1689626485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ul5u2LRy09FnZ57VCih9X+lrbtOZWLMB4/wwnDvm74=;
        b=Qp5KGlnJ+0NfukBxfkHLSVorszOQtU25NSpLfq6oeN3yWnBo2FoGw47ua6QF/Lz9pg
         C8Vs/1967p5fM+7wSt91U4bfqZ7MES31BK0KyyOUzmM3Tl64nxFAFv957PoorVeVljby
         5Y+7qLyslGY/Tjth/me00vbQyW40Rh2LJPh89kMJwTfaWDU26394iV7v8IFGfjniSy2g
         vBAYNEm6XH0C8Q1wwR+QtPvreopwZadG7/Nx/9MSz1ZAo5nBFmOaQItdR+CAkEVSI0xz
         WGUI3Fb+1OOf2FzxyDV7nxcfNr6t+lnhyykLdKL4HGeqLvbZa0d2rLPjgg32QgJQB3W/
         VIVg==
X-Gm-Message-State: AC+VfDw843CSR2k7BW9Tyz25E1/6cnCTk5NxHG1iLKHB90oxBjbQmDP/
        kZFZ88HL6BdnwoCPx6XvOApVOA==
X-Google-Smtp-Source: ACHHUZ6Nq28V7NfTNJ2gPispeaQvufR5U9VpQWF83dtJOsWHm/sSwQxGq8GFfVJUQMruwFlGlYJy3g==
X-Received: by 2002:a17:907:60cc:b0:94a:845c:3528 with SMTP id hv12-20020a17090760cc00b0094a845c3528mr5551178ejc.45.1687034485459;
        Sat, 17 Jun 2023 13:41:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qn18-20020a170907211200b00982c33ea394sm3349203ejb.97.2023.06.17.13.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 13:41:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sm8250: Fix EPSS L3 interconnect cells
Date:   Sat, 17 Jun 2023 22:41:17 +0200
Message-Id: <20230617204118.61959-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617204118.61959-1-krzysztof.kozlowski@linaro.org>
References: <20230617204118.61959-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm EPSS L3 Interconnect does not take path (third) argument.  This
was introduced by commit b5a12438325b ("arm64: dts: qcom: sm8250: Use 2
interconnect cells") which probably wanted to use 2 cells only for RPMh
interconnects.

  sm8250-hdk.dtb: interconnect@18590000: #interconnect-cells:0:0: 1 was expected

Fixes: b5a12438325b ("arm64: dts: qcom: sm8250: Use 2 interconnect cells")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 83ab6de459bc..1efa07f2caff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -107,7 +107,7 @@ CPU0: cpu@0 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_0: l2-cache {
 				compatible = "cache";
@@ -138,7 +138,7 @@ CPU1: cpu@100 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_100: l2-cache {
 				compatible = "cache";
@@ -163,7 +163,7 @@ CPU2: cpu@200 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_200: l2-cache {
 				compatible = "cache";
@@ -188,7 +188,7 @@ CPU3: cpu@300 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_300: l2-cache {
 				compatible = "cache";
@@ -213,7 +213,7 @@ CPU4: cpu@400 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_400: l2-cache {
 				compatible = "cache";
@@ -238,7 +238,7 @@ CPU5: cpu@500 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_500: l2-cache {
 				compatible = "cache";
@@ -263,7 +263,7 @@ CPU6: cpu@600 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_600: l2-cache {
 				compatible = "cache";
@@ -288,7 +288,7 @@ CPU7: cpu@700 {
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			operating-points-v2 = <&cpu7_opp_table>;
 			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
-					<&epss_l3 MASTER_OSM_L3_APPS 0 &epss_l3 SLAVE_OSM_L3 0>;
+					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			L2_700: l2-cache {
 				compatible = "cache";
@@ -5679,7 +5679,7 @@ epss_l3: interconnect@18590000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
 			clock-names = "xo", "alternate";
 
-			#interconnect-cells = <2>;
+			#interconnect-cells = <1>;
 		};
 
 		cpufreq_hw: cpufreq@18591000 {
-- 
2.34.1

