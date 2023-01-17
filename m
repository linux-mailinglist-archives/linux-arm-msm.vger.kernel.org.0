Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B79670E02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjAQXtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjAQXt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:49:26 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86435B450
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:32 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id m21so47255400edc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um+h/huKDH11/O6/fiyl7ns8gRJLpwPcSE9QpMZLmrU=;
        b=oA8jyAm0b2yRGjeyncyJvI5p1Ds3+C1JGb/MYlAEa6AWk2wvRelx8zOvMV7ewm3cJ+
         RbLqQGCa2mtWGr5k2J6k8tFUVi6jL5kbGhG7iGYPIZKv6+mtSxx0n1qO7RCEcg6rRJYG
         Q3rNasFwJTiRCdL1+cr2U9H/ttyKMYrC0d2BFFPqNe0IQ/r0S4swW+OrLV/ORhkf78GM
         iZBVKYpubKmL6pPpkw7VA4uP8h6PkV8S2afrYXHFjqWwtzWqOaHTzmwrtJ6uEhjLbL4o
         hUpsHqmTZun82Rua4m0RgJ1ZmOjZtY2u0Pc1pghpdp1O1PfpOHZMnFHabwFRrFZJOPSv
         yHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um+h/huKDH11/O6/fiyl7ns8gRJLpwPcSE9QpMZLmrU=;
        b=hUpSP4cQ7gICfQy0CCYH6w37fz/JS2kXOq0UuuEJeDs3VTkds/GvmjqBUeuA1v97hh
         LuXuB7vsMlhOBGcW+yqdFFjcw8+ZwqSppm9/T9R913I+cBh11UK62dScR7tW1QAJIw9w
         UM8FzXSP47zDrsqcZTXFCmI7fIPN2RLG0YRyOlEoyDZlCH8Qyh6Rql1t4bPWnXJFlYTm
         XEv3o/1iAg42o6VYIgpqZau6/TAVsf2sVbhJGtTf1/dMwRBOL6ei+H3kFhs5UP74PZxX
         8s/VaeeElnJx4SJURrCHkMQUrV1zMSI0NMo4oGIbWnFzl6C2FjRUeLDoEpAcT0yrBtck
         r4rg==
X-Gm-Message-State: AFqh2kpn39z53E1WTGtf/N5gaY+GAYdxjcKB6VgVvP+Tfr1UBJDpHuGc
        Yu0Zz+Tgb3kpMsf6znw8CVO51g==
X-Google-Smtp-Source: AMrXdXtuZ63S8CzpCMOsCq0AAxv6wezwx+gZjxzh/GynF8sFqcjpyiSLo+D1oUA+dxztzhgDkwBtow==
X-Received: by 2002:a05:6402:cba:b0:49d:25f3:6b4e with SMTP id cn26-20020a0564020cba00b0049d25f36b4emr4568431edb.28.1673996311482;
        Tue, 17 Jan 2023 14:58:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 5/7] arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
Date:   Wed, 18 Jan 2023 00:58:22 +0200
Message-Id: <20230117225824.1552604-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
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

The vendor kernel uses RPM_SMD_XO_CLK_SRC clock as an CXO clock rather
than using the RPM_SMD_BB_CLK1 directly. Follow this example and switch
msm8996.dtsi to use RPM_SMD_XO_CLK_SRC clock instead of RPM_SMB_BB_CLK1.

Fixes: 2b8c9c77c268 ("arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1")
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index a8544c4158ac..150d13c0f4b8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -713,7 +713,7 @@ gcc: clock-controller@300000 {
 			#power-domain-cells = <1>;
 			reg = <0x00300000 0x90000>;
 
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_LN_BB_CLK>,
 				 <&sleep_clk>,
 				 <&pciephy_0>,
@@ -1055,7 +1055,7 @@ dsi0_phy: phy@994400 {
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 				clock-names = "iface", "ref";
 				status = "disabled";
 			};
@@ -1123,7 +1123,7 @@ dsi1_phy: phy@996400 {
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 				clock-names = "iface", "ref";
 				status = "disabled";
 			};
@@ -2952,7 +2952,7 @@ kryocc: clock-controller@6400000 {
 			reg = <0x06400000 0x90000>;
 
 			clock-names = "xo", "sys_apcs_aux";
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
 
 			#clock-cells = <1>;
 		};
@@ -3071,7 +3071,7 @@ sdhc1: mmc@7464900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				<&gcc GCC_SDCC1_APPS_CLK>,
-				<&rpmcc RPM_SMD_BB_CLK1>;
+				<&rpmcc RPM_SMD_XO_CLK_SRC>;
 			resets = <&gcc GCC_SDCC1_BCR>;
 
 			pinctrl-names = "default", "sleep";
@@ -3095,7 +3095,7 @@ sdhc2: mmc@74a4900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				<&gcc GCC_SDCC2_APPS_CLK>,
-				<&rpmcc RPM_SMD_BB_CLK1>;
+				<&rpmcc RPM_SMD_XO_CLK_SRC>;
 			resets = <&gcc GCC_SDCC2_BCR>;
 
 			pinctrl-names = "default", "sleep";
@@ -3417,7 +3417,7 @@ adsp_pil: remoteproc@9300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "xo";
 
 			memory-region = <&adsp_mem>;
-- 
2.39.0

