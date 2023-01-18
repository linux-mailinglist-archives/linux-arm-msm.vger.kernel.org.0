Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF229671262
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjARENA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjAREM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:12:57 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D425423F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:55 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mg12so7933418ejc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jnYFFFXAiODVvXwN00kyY0qSvtuFhNMmRWU+RYoo84=;
        b=H3m4cl5W8cSvI35YeZSbSc6aoUiwJzSMt0x3Wpp7m/dJvd7pJ+4k/dgnqJu5Dqq49B
         rV0domtH53BFydu72C9VHS9tdsuDQ8ErdoijM8cPCQCsuArhoeGEwc9oRGPPCLIlheWz
         WPPBNvyR0YADTANv4YvjbqJWWmN2ZOLggsDSgFSKG8iG9WaJHU1CXs3SeVlNHsU59FLS
         FTT9bRN80fjCS9HPLw0daV8abYnSdtz/gRFTLaC4HzUE785vxdRgo3RnAJbyx+MInWbc
         KojSR+F0hUZSdKgof8uBrTC3iBZgeAU84dJFLfiQRIOeDhCygYMPT5KKgpeRVqrT0Xc/
         mGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jnYFFFXAiODVvXwN00kyY0qSvtuFhNMmRWU+RYoo84=;
        b=sOk6pysnd9g4n2GTqb20go7wQxXrI2l0rEBPXObrgOlnndxLqRWpDkrmUgDzlgg24u
         b7mUV+tnrrOoM6tDm2+U+28lzO/lJ7CQmCGuc+MKaFo17ZdtJqOk1iBHm5Q1eTfEid3x
         fYpFH/RTLPnry5qMiASc1uGKNr8qlnKJdLoHoKYIcpG3+VCWBzQlm6AOBg76SAt7IsfJ
         u9ChaOu/rewOuVpQPNODmjjpRYdfHFZIgn53y+M+hn/ZmyTWR51uJljeuavz9Db7lUa/
         iluvmA9/310jxAh9GepZUPd/A5idc8xImue+MmPE13v6kjCauWkIzJvRKMRCZGam/Ask
         2hHw==
X-Gm-Message-State: AFqh2kqSXYRECX4EJDu+pHB/wCkAf4jIks5iI05ihLMxgsRjo6yEJceR
        RaM2dpavA0BTltafl09ngYlDmw==
X-Google-Smtp-Source: AMrXdXtT5nJfM7v/1mK5rCbxCsGDsVrZX3Jbl+xCqerkf+haZ++qipKINw6J3zZ3f6po/mf0MFuJVA==
X-Received: by 2002:a17:907:d40c:b0:872:af53:a028 with SMTP id vi12-20020a170907d40c00b00872af53a028mr1781278ejc.61.1674015175447;
        Tue, 17 Jan 2023 20:12:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:54 -0800 (PST)
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
Subject: [PATCH v7 08/11] arm64: dts: qcom: rename mdss nodes to display-subsystem
Date:   Wed, 18 Jan 2023 06:12:40 +0200
Message-Id: <20230118041243.1720520-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdss nodes to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 68cdf255c474..b688df272207 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -963,7 +963,7 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x30000>;
 		};
 
-		mdss: mdss@1a00000 {
+		mdss: display-subsystem@1a00000 {
 			status = "disabled";
 			compatible = "qcom,mdss";
 			reg = <0x01a00000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 068eac8dc97f..9d4b785409b1 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -670,7 +670,7 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
 			reg = <0x193f044 0x4>;
 		};
 
-		mdss: mdss@1a00000 {
+		mdss: display-subsystem@1a00000 {
 			compatible = "qcom,mdss";
 
 			reg = <0x1a00000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c05d2a85247e..97979f7a8050 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -908,7 +908,7 @@ mmcc: clock-controller@8c0000 {
 					       <825000000>;
 		};
 
-		mdss: mdss@900000 {
+		mdss: display-subsystem@900000 {
 			compatible = "qcom,mdss";
 
 			reg = <0x00900000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3a0bd0fb56b4..b2ea615e7df1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2922,7 +2922,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sc7180-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index d1542335be74..2ca2f75f2aa7 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1470,7 +1470,7 @@ opp-262500000 {
 			};
 		};
 
-		mdss: mdss@c900000 {
+		mdss: display-subsystem@c900000 {
 			compatible = "qcom,mdss";
 			reg = <0x0c900000 0x1000>,
 			      <0x0c9b0000 0x1040>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0f1cb2c8addd..72c5ec84d3ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4414,7 +4414,7 @@ clock_camcc: clock-controller@ad00000 {
 			clock-names = "bi_tcxo";
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a4ce9cf14d9c..dabed46f04a7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3970,7 +3970,7 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
-		mdss: mdss@ae00000 {
+		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
-- 
2.39.0

