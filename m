Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FB4674D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjATGO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjATGO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:28 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4052B7DF83
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:26 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ud5so11435091ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9K4WOdqw7adZ3t19Ot+UPxMZGfbNK0RwRjaDWGiMcg=;
        b=sIuwRvUvzUWnVmgtlVjBFpvO5cOUL2Cqjs+8Cw8hn1vZkqKg3GDmOO3YvzZEyvaThS
         K7jw2x7HKsBhi+ALbNSygEPDNaScqGkyNLoe1tX1F73bmhcQCM/vl0aUxU/Y2kNfCbvK
         5z+TzhBQahNEFa75kusN3RRFeNL6J5N8X9ohc7ZFSZGR0oct72NVxSsJ2wo0Vns390ZI
         yMXBU2//1zacObV9ZCnIQR9LVsF7nIKGmD0qSPjCIaXc8bUfBkMZoSc9VSov/NKpCnZo
         c5e0MOEYumtiPPKJjOwMcie6XIvYzLdRiG1hcyd1XlM/J8RyVUzJT8dYdWD6u6O4xUB9
         Sg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9K4WOdqw7adZ3t19Ot+UPxMZGfbNK0RwRjaDWGiMcg=;
        b=4gOusFFSxwBzEsyqv8afFBqy7dAXzf9pPruITOOnc8zcEAah4+i08ufSe24K9TuPHx
         qLnnlR+fIOOezgLLX/6paweMz8ZwNj//urPhZRHepWEM1YTIeD3jUnuNBOzkFH/9Qqki
         swBmdiHOnXi1y1evW3D8VQde9DpYpt3J3xyOshIpWIaq/TsyhFHgMKZZ0hfbFaXWJk6L
         bie0um1woJQqriwKRF4qrDSLFfrztYgBsaxxIAHxOxnCXLpwa4jfr5oUgv7S+gGZghZL
         8DVUG4WXK/FqhCegHh7LtuqPLvW/nEhLcLXITA1iyloXWX33N/YHbLa8Y+OWQ+T5GvaO
         yQ9Q==
X-Gm-Message-State: AFqh2kqXrWSVF0Qv9Iy9msbj2t2DgiqDhojJjqczT7DOCGamRXCdJXV9
        EqF42RTmulqZSK4MGTVByuLLqw==
X-Google-Smtp-Source: AMrXdXtFFh1Rq3GhljNniEVqTUQmVLkf54GNIzrb4638tM/GZXTGzV0T3RNZvFvvuS5UoWID7+61uw==
X-Received: by 2002:a17:906:7152:b0:84d:1f00:e29 with SMTP id z18-20020a170906715200b0084d1f000e29mr28707491ejj.7.1674195265820;
        Thu, 19 Jan 2023 22:14:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:25 -0800 (PST)
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
Subject: [PATCH v3 6/8] arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
Date:   Fri, 20 Jan 2023 08:14:15 +0200
Message-Id: <20230120061417.2623751-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0c2f7be9f205..4427305f8a94 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -719,7 +719,7 @@ gcc: clock-controller@300000 {
 			#power-domain-cells = <1>;
 			reg = <0x00300000 0x90000>;
 
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>,
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_LN_BB_CLK>,
 				 <&sleep_clk>,
 				 <&pciephy_0>,
@@ -1061,7 +1061,7 @@ dsi0_phy: phy@994400 {
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 				clock-names = "iface", "ref";
 				status = "disabled";
 			};
@@ -1129,7 +1129,7 @@ dsi1_phy: phy@996400 {
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 				clock-names = "iface", "ref";
 				status = "disabled";
 			};
@@ -2962,7 +2962,7 @@ kryocc: clock-controller@6400000 {
 			reg = <0x06400000 0x90000>;
 
 			clock-names = "xo", "sys_apcs_aux";
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+			clocks = <&rpmcc RPM_SMD_XO_A_CLK_SRC>, <&apcs_glb>;
 
 			#clock-cells = <1>;
 		};
@@ -3081,7 +3081,7 @@ sdhc1: mmc@7464900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				<&gcc GCC_SDCC1_APPS_CLK>,
-				<&rpmcc RPM_SMD_BB_CLK1>;
+				<&rpmcc RPM_SMD_XO_CLK_SRC>;
 			resets = <&gcc GCC_SDCC1_BCR>;
 
 			pinctrl-names = "default", "sleep";
@@ -3105,7 +3105,7 @@ sdhc2: mmc@74a4900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				<&gcc GCC_SDCC2_APPS_CLK>,
-				<&rpmcc RPM_SMD_BB_CLK1>;
+				<&rpmcc RPM_SMD_XO_CLK_SRC>;
 			resets = <&gcc GCC_SDCC2_BCR>;
 
 			pinctrl-names = "default", "sleep";
@@ -3427,7 +3427,7 @@ adsp_pil: remoteproc@9300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
 			clock-names = "xo";
 
 			memory-region = <&adsp_mem>;
-- 
2.39.0

