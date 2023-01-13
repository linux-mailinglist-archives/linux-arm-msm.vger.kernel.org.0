Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697D6669132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240292AbjAMIhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240570AbjAMIhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:34 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9174F65AF6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:33 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g13so32119683lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAxGWhkR+sGLWasNMFlzZesjFzaUZpYkAtY7w3ETX04=;
        b=QHVcxOKdLZ663y8qMHMt8b+YIOuayY5GZX90/S0jOruZSithZMPQinIn+nMP52VNbu
         dm2UMlEDAFL4J7967dZ9Zlw8HaCJ3Ohn3muP42SQqCWm3RxSLFZoCt+QKfQ7lTjCclKi
         VBtTfR95BYf2dGXtI2b1Tte6ijmVRYIF5NdruTCEsM+qsIn50YL6fVpfkniRqmcwPABy
         SrKn5ObEUwZhNb5nJsI8cc6r3IPBra5pWrsv28eoagKaPGfnZYEpsCBfDh581rtgc+LJ
         GU9LgsKAtaLPrtq2hoNhNHUJHiPVhrUP5uSdBc2OQE2hdjY5rzpoXMJ1bPCrZbIKYp5g
         uzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAxGWhkR+sGLWasNMFlzZesjFzaUZpYkAtY7w3ETX04=;
        b=7ev+pLAlgpjJcsJe9PR6h0Br5UEX1vyIoyAZkT3eV3T43hDM45YIgdARiW0YD5Aoog
         qtjfR/irbjcsa7jxaDcdmZN6u7+y3geygbcwy0+1IGDiPBHDPcr+hne467PWIGIb7gKX
         Bjjxm4+paUVIT4RM7KBXhIi2C68ptjGpVYkJCYEByxG1vadOopWir0VhJaDogUje2jkd
         wpVxFtD1m+NZFaT2mS3gcfxDsqWWWTSBW/RxjITjCu6wunkDf2QuZlRSTGpLJUfmRjnV
         MQEBFjX7FuBkwFJN5Y9xZBjONAXAPFpZKd5wrbh2d5larp4himib0Oy1ZkDgckwvq17H
         VcpQ==
X-Gm-Message-State: AFqh2kqOX5psvS1ha0JD1Eh83rAMWXa1NXtQJrpAK/YEhN8IhVvfV+De
        yPjvwcRzTB/uWxadcXJ1PMNcmw==
X-Google-Smtp-Source: AMrXdXvFFP1XOuKfc2DLTQZwZQC8/8KcNqEVn3VpCMy3Jrqn/JuRW/LXX/8KpyMMcbjdR4KyFu78WQ==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e64c:aec6 with SMTP id k3-20020a05651210c300b004b6e64caec6mr27180183lfg.63.1673599053166;
        Fri, 13 Jan 2023 00:37:33 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:32 -0800 (PST)
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
Subject: [PATCH v6 07/11] arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
Date:   Fri, 13 Jan 2023 10:37:16 +0200
Message-Id: <20230113083720.39224-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Add SoC-specific compat string to the MDP5 device nodes to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi  | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index cf248e10660b..68cdf255c474 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -989,7 +989,7 @@ mdss: mdss@1a00000 {
 			ranges;
 
 			mdp: mdp@1a01000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f4da50b2c007..df5871847778 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -933,7 +933,7 @@ mdss: mdss@900000 {
 			status = "disabled";
 
 			mdp: mdp@901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index e08ead06d4d3..d1542335be74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1498,7 +1498,7 @@ mdss: mdss@c900000 {
 			status = "disabled";
 
 			mdp: mdp@c901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index d6908aa4c6e1..f0f27fc12c18 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -142,6 +142,8 @@ &gpucc {
 };
 
 &mdp {
+	compatible = "qcom,sdm660-mdp5", "qcom,mdp5";
+
 	ports {
 		port@1 {
 			reg = <1>;
-- 
2.39.0

