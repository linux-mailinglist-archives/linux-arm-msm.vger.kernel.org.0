Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65474C0DB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 06:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjGIETg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 00:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbjGIETd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 00:19:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF0FE58
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Jul 2023 21:19:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fba86f069bso5146978e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Jul 2023 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688876370; x=1691468370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1VJuUGOFBi79tukb+D2NWsxrsW5NBrmRFX2x2Q6rsI=;
        b=FcTwrHF3oJK31WkP63aPguur1Y1cbPLJM9okRzZ8yWVPPdz56SSfccyWKZKBt48Yuw
         zB3uPqvBscgVnO0JZ25xqa983B9Xyv3eL1af2VXI+rLa1AWu/yiFz3D4+f8gEb22CTKC
         /aro+Zpy1VTqVPuVo8DEUfPzRn+I5SIN5bHPrwUu0gHN2ESEbrSO5RBTVsFz237eJP6P
         eg+eTNV2EUvzP/yWHOqPD0/jN+QyukonfTTVRtdrVTsXRZP/l2YW3e28rzeF637Os5Dt
         vWJUkuMEvoDCblnv9v0S+hAq/wzx7RfDmS6dWuwMPsrd+uQbs2dEuflsbTEFsLGkFpKu
         JaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688876370; x=1691468370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1VJuUGOFBi79tukb+D2NWsxrsW5NBrmRFX2x2Q6rsI=;
        b=aU5EaDJPd5ugpTDFZggmuOxV94Hy312vlVFepqvrEeFErUxSzIM+HvtwfjnxyWzXFl
         RajXb1oYoKWCpPnZ1dOF3xS3Hj2yqRG9fiAMQDtDutZ+/lZdrYY/KDtvPCDNFzX4e9jC
         9VRVbQaOrmaMTcPhamjcljXhqJl6iI9BcbBrattiOtYVh3CuUATztBinfTy2nC5WYwR8
         1EYD/DyJRmbO4jGvJXTwUoKSqclDIk11fQNhfuTNnBju2BiG2cAcPCKTyvYS2JBt8TuA
         +Ana1ptbWycJ1LwkgBus1rrh5iiSE99ZQi2sTYFG+SrUrYR3k9XXL4xMtdu4VlljRGjL
         ORJw==
X-Gm-Message-State: ABy/qLalUI6eIzfvovqgNdewAkVHvFRn6LOT++90tB3X6Rk22CZFo0yP
        7K5eKpQ08cAq+caHp114of0MnA==
X-Google-Smtp-Source: APBJJlEFVhGLnVsbm70RLFGO3ra4g1djfDzatugt+Suo3Tj0ccKUebhfbKx/SlZZOKli2FUoFFs6eQ==
X-Received: by 2002:ac2:4ec5:0:b0:4fb:81f2:422b with SMTP id p5-20020ac24ec5000000b004fb81f2422bmr6296100lfr.54.1688876369999;
        Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 21:19:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
Date:   Sun,  9 Jul 2023 07:19:24 +0300
Message-Id: <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the nb7vpq904m, onboard USB-C redriver / retimer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 52 +++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index b6c587ffdf8f..a03f334a3d01 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -610,6 +610,46 @@ lt9611_out: endpoint {
 /* LS-I2C1 */
 &i2c15 {
 	status = "okay";
+
+	typec-mux@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_s4a_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_usb_con_ss: endpoint {
+					remote-endpoint = <&pm8150b_typec_mux_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_phy_con_ss: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
+					data-lanes = <0 1 2 3>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				redriver_usb_con_sbu: endpoint {
+					remote-endpoint = <&pm8150b_typec_sbu_out>;
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
 };
 
 &usb_1_qmpphy_typec_mux_in {
-	remote-endpoint = <&pm8150b_typec_mux_out>;
+	remote-endpoint = <&redriver_phy_con_ss>;
 };
 
 &usb_2 {
@@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
 			port@1 {
 				reg = <1>;
 				pm8150b_typec_mux_out: endpoint {
-					remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
+					remote-endpoint = <&redriver_usb_con_ss>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&redriver_usb_con_sbu>;
 				};
 			};
 		};
-- 
2.39.2

