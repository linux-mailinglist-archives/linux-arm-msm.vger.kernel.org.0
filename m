Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3419A636C16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237209AbiKWVIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239127AbiKWVH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:07:29 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAD1266
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:27 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j16so29921060lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPFkruvlU7zrVvNuMEiG7x7XIlavtbJemFv/UB71t34=;
        b=F6ODKLmGxaxZW6vrrJASjd7RYxvVoh0jxNIA8rLALctVGGE73TsNfN4AZPPnDev61q
         IjX72koFK2Ry33aDAItXV3x9eShK9V4E8P9ybkrW6C1Dg59p35V1Tw8sbbx4jzwvOyt4
         uZZS3KghlICehz6d7tEriFcQ6ifr/QS4sJo9ezP9JBdjRrrA8x2DVso/EhxgKObN8Bcp
         TuyYpLB0aUZAuKbLDtaplF0+CAct+HE7Xdbms3h3crc+jFe9z5Wbu6dTbmJwlqpotdO2
         C/beoA+C3ZLea5xXQWXum9nLcT2oJpxdmJCYCGQAtq2c/QDmr2zTeejGEMgRPRBXUp+g
         J6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPFkruvlU7zrVvNuMEiG7x7XIlavtbJemFv/UB71t34=;
        b=txhhq1F+/Af3vKuRoqiyqPrjoShRjmJmjcxgWgt3G5RGlGaWS6/ANC7HdpqH8AWS/j
         htIeiLU1pJ32fD4dmpQuFk8R7cqJn+pKE51eT1Uqb1YGu1d9+rGSex37DdYmkzvsCk52
         doNoEiVHgcS8BSKDwRF10XUfdazGlXC54PtO3PST83epnRWTXNsnLT6J2z4r0cQxCdJ5
         MqNuL0Dd5XVPwu3UouRY0a3AKnp+YMtGKGBdLo2hO2UbdDydFoVp83oqZbmgatJupdBF
         VcS73QTgaeyC/BL1k6QfGddGR1eCR/sx9DyIAFrkIiaa1FQnIh27C6KHFSw0s7DU15tF
         xJ3w==
X-Gm-Message-State: ANoB5pnET+pPpkx64cRFNSa3chEdbMyi7uW2V2LysZkN11xFEWv95BRL
        hOk9iBg+2kpPtmH4/C/OxWNZUA==
X-Google-Smtp-Source: AA0mqf5SBnxq9+i0brSVlopHzdm/rGVGjlMXO2yXI5bC57Mcjvqs5hb/nqZ4lNLNJSReLXCETX2SZQ==
X-Received: by 2002:a05:6512:1184:b0:4af:a588:e8bd with SMTP id g4-20020a056512118400b004afa588e8bdmr9672840lfr.173.1669237645436;
        Wed, 23 Nov 2022 13:07:25 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2415a000000b0048a8c907fe9sm3024119lfi.167.2022.11.23.13.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:07:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Date:   Wed, 23 Nov 2022 23:07:20 +0200
Message-Id: <20221123210720.3593671-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
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

From: Vinod Koul <vkoul@kernel.org>

Add the HDMI display nodes and link it to DSI.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index d1635c9de6f3..01f65a0e3ca1 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -20,6 +20,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
@@ -393,6 +404,26 @@ lt9611_codec: hdmi-bridge@2b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
 
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
 	};
 };
 
@@ -405,6 +436,11 @@ &mdss_dsi0 {
 	status = "okay";
 };
 
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mdss_dsi0_phy {
 	vdds-supply = <&vreg_l5b_0p88>;
 	status = "okay";
-- 
2.35.1

