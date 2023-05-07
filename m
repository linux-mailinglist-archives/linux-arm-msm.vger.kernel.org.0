Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3236F9B7F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 22:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbjEGU2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 16:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjEGU2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 16:28:50 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1F24483
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 13:28:45 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac8cc8829fso25729161fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683491324; x=1686083324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyozR2QyoRjCMdtT4EkVneCs1KKsOlXbUdEyBHVrmYQ=;
        b=WuZy1B1l1SCIBOjsvt+qJLlT2nkPyQ9IKFtB63Lpa7Xt8LWeCxqjJxdL1azjkHpuHj
         i7WxSF9OmzjpsDevL4RSguQrKmFX14+vZL9VgeNqEQawtZhJ2YX4/b7F5uYjYkTYvN6t
         HNrAJwsfWwc9En56KKcM5MEoSDLzC9kZw3B2D/+hPmAJJZUErrKulm/OLklwYFg1JscI
         prdgg7ExHYW8xQXM1leqhki9NKJPP1tEhMrGzIxiUPywcYvOl825qyzITTHHbLysKiBh
         gc/VbIfr1z+hfv4PQxzPNeihICFo1JRNhty3OTx0SA5WxrmLNONnJ4z9wkoMSSzh+pDr
         q0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683491324; x=1686083324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyozR2QyoRjCMdtT4EkVneCs1KKsOlXbUdEyBHVrmYQ=;
        b=XpEUKE4Mjayr6F9hPO2xpFvndex50H3HKcxEaLlEpZgdFo9KqTelOt3BMBiQRs7NIX
         yCKTaJWVdUiaH9D787nC0TqlkSgoNLjSu2sP3wfyZaBX7tlKU2LxSDKjTWF8gzfHN9ob
         7fA3/+xB8OOzxxDx/Ac+sh0P6uyNdhpWVCCneth7TzvCWI5RgLh9VM8AyrqUbdVH3q9o
         Nx2lr4e/h4dtLmyJy3sf2FIDgxR/U7BMuiH5grGHVX/hMNlIr0xzdlYVWiKfwUJVylMB
         YttUY6c55YxuF/LzLjQuzrxycoR0D/H9aeT97iB5P2/CQSdGvEbtPutYxkbz8jalVsIA
         TQcg==
X-Gm-Message-State: AC+VfDxE6hIemRgCiIc/MWSp9KBpiruXecHRoNikamweZH3Nx4VeJlmG
        vUcuwvTE06vPCu2HzmYiZZk5og==
X-Google-Smtp-Source: ACHHUZ4rd/9XKDbKxuC13Ag1L+a0V004U2wUtQvJVHFLmXEKr3FiwNGzj9a2LPx43cmjYDZaSHhX+w==
X-Received: by 2002:a2e:99d9:0:b0:2a8:e53f:c174 with SMTP id l25-20020a2e99d9000000b002a8e53fc174mr2178716ljj.26.1683491324195;
        Sun, 07 May 2023 13:28:44 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f25-20020a2e9199000000b002a8bb52d994sm928043ljg.25.2023.05.07.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 13:28:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 2/3] ARM: dts: qcom: msm8974: add support for the HDMI output
Date:   Sun,  7 May 2023 23:28:40 +0300
Message-Id: <20230507202841.2339127-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
References: <20230507202841.2339127-1-dmitry.baryshkov@linaro.org>
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

Add HDMI and HDMI PHY device nodes for the Qualcomm MSM8974 SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 90 ++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index fb661c1bd3d5..fbe74eeef863 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1805,6 +1805,21 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
 				};
 			};
 
+			hdmi_default: hdmi-default-state {
+				cec-pins {
+					pins = "gpio31";
+					function = "hdmi_cec";
+				};
+				ddc-pins {
+					pins = "gpio32", "gpio33";
+					function = "hdmi_ddc";
+				};
+				hpd-pins {
+					pins = "gpio34";
+					function = "hdmi_hpd";
+				};
+			};
+
 			spi8_default: spi8_default-state {
 				mosi-pins {
 					pins = "gpio45";
@@ -1840,7 +1855,7 @@ mmcc: clock-controller@fd8c0000 {
 				 <&dsi0_phy 0>,
 				 <&dsi1_phy 1>,
 				 <&dsi1_phy 0>,
-				 <0>,
+				 <&mdss_hdmi_phy>,
 				 <0>,
 				 <0>;
 			clock-names = "xo",
@@ -1914,6 +1929,13 @@ mdp5_intf2_out: endpoint {
 							remote-endpoint = <&dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						mdp5_intf3_out: endpoint {
+							remote-endpoint = <&mdss_hdmi_in>;
+						};
+					};
 				};
 			};
 
@@ -1970,6 +1992,72 @@ dsi0_out: endpoint {
 				};
 			};
 
+			mdss_hdmi: hdmi-tx@fd922100 {
+				compatible = "qcom,hdmi-tx-8974";
+				reg = <0xfd922100 0x35c>,
+				      <0xfc4b8000 0x60f0>;
+				reg-names = "core_physical",
+					    "qfprom_physical";
+
+				pinctrl-0 = <&hdmi_default>;
+				pinctrl-names = "default";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names =
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp";
+
+				phys = <&mdss_hdmi_phy>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_hdmi_in: endpoint {
+							remote-endpoint = <&mdp5_intf3_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_hdmi_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_hdmi_phy: hdmi-phy@fd922500 {
+				compatible = "qcom,hdmi-phy-8974";
+				reg = <0xfd922500 0x7c>,
+				      <0xfd922700 0xd4>;
+				reg-names = "hdmi_phy",
+					    "hdmi_pll";
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_AHB_CLK>;
+				clock-names = "iface",
+					      "alt_iface";
+
+				#phy-cells = <0>;
+				#clock-cells = <0>;
+
+				status = "disabled";
+			};
+
 			dsi0_phy: phy@fd922a00 {
 				compatible = "qcom,dsi-phy-28nm-hpm";
 				reg = <0xfd922a00 0xd4>,
-- 
2.39.2

