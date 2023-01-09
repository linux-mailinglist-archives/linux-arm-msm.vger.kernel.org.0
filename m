Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5539E661E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbjAIFCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:02:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbjAIFB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:01:59 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABDDA445
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:01:58 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so11267230lfv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
        b=GzZgsr7ysm6Vahqhzw8OED4F8Mk1Iyje5Zw3eP0+IyXYt9Kx08093QrS5E/BrXg/gf
         TgavSsHAjk//2Ijw9oY3op0NRX8Y9f/pnQ9AmO7auuTbGNbUb/2luSuNzICBM7ItFKxT
         yOCxFWRYDU6IuMLOVyJjmpJOODHNjgdGIBvut4wIKKVpSGa2meTKFVJcRPqjRH/MtlNQ
         e4OqwaaQWFkt03/3SlV72YaYBjsIKZCRnOSHFgv8ywjjvUW/N3oWaEJXTMLKJbH/joPR
         Ysc9STYaTxhNMtztOIpVtib8n0fz+qNJmLJMIV5Lhn0G9a4zQhu99FqJpv6qQLscweUy
         Lq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
        b=ACvHW59FJVEhiJ/GxkC2zNs4U0CRX/qaobDAF3OPYar0odQaMLbmeoY0fFkudaqD4s
         ABDeOlUs8av18L4NVpBZApyT7cezyj+APYMZZXLgPfZ4eehnc/qSVoRW41dT33fR0BGm
         M5MMMT59B1GAFOx/wMf9EMQ+dID0uF4avZ83/nV3Ec9lIJPCBtO9lnZg00ztt5Snat6+
         Xp++Bvl+AdQ1jW2agxPzdV2N/gQgpGYhvGo2kEzYA4hKMxIOfkfZdwVYPT0zruJLxRKB
         U/4GG9Y1WHfWr8yF1UkVRIDHcu8Lr9YYzlc+7824zMut+Sh5ZNmHcWn8hnUQz48hVN7q
         e3rQ==
X-Gm-Message-State: AFqh2koii8yzSr8XDwQp7u2fPogECRyl82j+6dOuWyQWUxv1r+S4f8gy
        1ShLmxHIutCg0jm6okNM4Dgb/Q==
X-Google-Smtp-Source: AMrXdXtITLmpH6LgbBKxG+zPB+ftxYgfZLCr61fILYsSSkjME9qg74R5e0xyjYPafiiQJLiZPVG+Gg==
X-Received: by 2002:ac2:4bd3:0:b0:4b4:a460:c995 with SMTP id o19-20020ac24bd3000000b004b4a460c995mr24853877lfq.5.1673240516885;
        Sun, 08 Jan 2023 21:01:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:01:56 -0800 (PST)
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
Subject: [PATCH v5 4/4] arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
Date:   Mon,  9 Jan 2023 07:01:52 +0200
Message-Id: <20230109050152.316606-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
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
index 2ca8e977fc2a..0a23fb6efae8 100644
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
index d31464204f69..b5cd1bcad5eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -931,7 +931,7 @@ mdss: mdss@900000 {
 			status = "disabled";
 
 			mdp: mdp@901000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27..65addd4c672e 100644
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
index d52123cb5cd3..cdaa0d7a66f3 100644
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

