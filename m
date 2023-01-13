Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98EA669134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239903AbjAMIhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240559AbjAMIhh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:37 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DFF69B0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:36 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id cf42so32139207lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPHiREyaiZ++Q90QN1f0Tj1eoFwLzSQv1YWOQn6JI2E=;
        b=oz+Elk6sdjtlCVgkguKyFjXTPd0capMKVeTI6iigjeQOPGek7Ta0mbVRjzT6GoAImT
         TY4upUfV6gv9uBGFLZc0OuINJHUp3CnZJG9I8UU3fRDwxU8X3G+V3370QOX1CssKrarg
         P8piEFBJbjenVtIKozj7cTlcdaLbSboZogwM6vfZPyXeoSMNVOU29QQsJBq7wqsxnl/c
         ZyqUkwHVvIpdZGUX6BUjrSF/to6WSSRSzPddbUkGMY+YNf4nm/0DvbeYkJhm60gUpmeh
         xiPZ2a+qQyDf5NQqSiWfWamCO2eu4G3L3UHHStUOJz+gCgY0/mLWdjhFjV+xNDX/oAu/
         W0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPHiREyaiZ++Q90QN1f0Tj1eoFwLzSQv1YWOQn6JI2E=;
        b=umFtteu3AFLHqGQ0TObCDX6zwskmDenZH67AtFU7Nfm00URWx7UabJkj0e+EmBJX/h
         Uke1cxsiXcFhCXjxwcN4r/I3BuDEhV9QLwiYGxdqkgrqgeWqjU39dr/8n3ThL+/XB+gK
         DrF7gldutQhmLB6I+xLlFLSTW6b3AOAxvgrg2FJY3ErW9wTT/U9qkFoNISEwY1e7j+EE
         qxCvN7+xv3tsMRkt0ZlinLtj7dReObMfKj8ugUaebYWtq8SVmZp78wqamE+mBAH6Joks
         DrOXP/7JBfj1ufPlQ/XqBzawcjLgMe3a1gPMWgqGa3P8FuYyvnWOwLJyWJLI6H8mgM4/
         14ig==
X-Gm-Message-State: AFqh2kpE6JDsCOgPBDS6/2bqy3BBxYExCE7x/pX6QdZJ8KsV4A33Cw2W
        N/3ME0de/zQ6KWtORMPEGmCazg==
X-Google-Smtp-Source: AMrXdXsmHFXzfkdvEldBf2wWtYsJ4YkZ+e/XRh8ko/KRhlkqEHV+D+GEtH4kTkTfj75FVSAQxACBdw==
X-Received: by 2002:a05:6512:2526:b0:4a4:68b9:66e1 with SMTP id be38-20020a056512252600b004a468b966e1mr20255049lfb.44.1673599054770;
        Fri, 13 Jan 2023 00:37:34 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:34 -0800 (PST)
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
Subject: [PATCH v6 08/11] arm64: dts: qcom: rename mdss nodes to display-subsystem
Date:   Fri, 13 Jan 2023 10:37:17 +0200
Message-Id: <20230113083720.39224-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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
index df5871847778..1be9a92fc8c1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -906,7 +906,7 @@ mmcc: clock-controller@8c0000 {
 					       <825000000>;
 		};
 
-		mdss: mdss@900000 {
+		mdss: display-subsystem@900000 {
 			compatible = "qcom,mdss";
 
 			reg = <0x00900000 0x1000>,
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 7846edce6ae9..3b53d911a51f 100644
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

