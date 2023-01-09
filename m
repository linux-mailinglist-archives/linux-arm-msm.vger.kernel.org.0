Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49226661E44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 06:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235999AbjAIFOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 00:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbjAIFOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 00:14:09 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CA3BF55
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 21:14:07 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v25so11240032lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 21:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUdirdX7P4Wo7cXSRmpMI1Qs3iZu/Yop9djIK4BzOsE=;
        b=PCCnebfhaqmKEGpaRzEdSbxSOE9ISfelUMBSWPSYtLGZ3tlKAFogpLnU5FICz5OhFD
         sFYZAHCZQIFCSHdlZ5otgrfeBXQHoQ/eG1XkslOe0CpSyZ11EtnxvkUhPQgFMTKmaYHY
         7LJaeWrIK07PL/DwiU/CT5a1jHWL72NH8rcJ+fc0WQ7urah7Kc6NMOFm2t/Yblo3V5DF
         jY+WpPdRq6/5svaOsbvnB7IXX2VlBxwIcyRjHbQv/mrHb9Z3YCGe29olRi/sW9QbfH0L
         v4jTC1NSR6fiC//DvgNvMWb+xa7nygjKn6TgCcVH8KCuQAQkFuY8Um1ICZi2seANadUL
         5skw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUdirdX7P4Wo7cXSRmpMI1Qs3iZu/Yop9djIK4BzOsE=;
        b=01aWg7kRgDdMRo4mnJ3m27ZbmW3HsTpI+ULq72ZLb1nsf496S9s0+gWfqwm2c3hVlU
         UnG62lmqRyqQM87AJl8+xD50uxqBiDGEQHK+SNtiY3d41aemEp8LLAgwogq65ASfkBqL
         p/ozuS4ldyNcMBTmVQkbQB2JypXsBAISrMV+OwY7NDLEA4vmVMHC35Tb4mpc8gU400vq
         gIM9+uXLfkFZE49ixRE1vAseN2eQNGnz+W/iAVIvs81h2DwvqYy81orQylY5iHseRMIh
         Lzt9QVn1UWC1tx+KXeVRGCgJEHz0rbaS4qUqSsdcD5Mov+XgS32qBT2bF4HPb355zhOP
         rjVg==
X-Gm-Message-State: AFqh2kojntWAJpf10uQPpWR0rkYUPcYRtOHgxL8CSKicAupAQMsJqMwo
        bdLhv3Upy/+oJDvdzHxMK+0sFA==
X-Google-Smtp-Source: AMrXdXvUAN6buFz4rVx9MWKd8qnwUf1edVie3ZcCVzojhygJZhe6/HposZHRdsbvebYjd407eICksw==
X-Received: by 2002:a05:6512:e9f:b0:4cb:3b24:8390 with SMTP id bi31-20020a0565120e9f00b004cb3b248390mr8585769lfb.59.1673241246337;
        Sun, 08 Jan 2023 21:14:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 21:14:06 -0800 (PST)
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
Subject: [PATCH 5/6] arm64: dts: qcom: rename mdp nodes to display-controller
Date:   Mon,  9 Jan 2023 07:14:01 +0200
Message-Id: <20230109051402.317577-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

Follow the schema change and rename mdp nodes to generic name
'display-controller'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8f29d7e49423..591f5552c59d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -988,7 +988,7 @@ mdss: display-subsystem@1a00000 {
 			#size-cells = <1>;
 			ranges;
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8916-mdp5", "qcom,mdp5";
 				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index c07b707ff454..dbe506815310 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -755,7 +755,7 @@ mdss: display-subsystem@1a00000 {
 
 			status = "disabled";
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8953-mdp5", "qcom,mdp5";
 				reg = <0x1a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b30c35fffe68..409c3c34e8ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -930,7 +930,7 @@ mdss: display-subsystem@900000 {
 
 			status = "disabled";
 
-			mdp: mdp@901000 {
+			mdp: display-controller@901000 {
 				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 0bceda788341..9409ca3f3485 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1497,7 +1497,7 @@ mdss: display-subsystem@c900000 {
 			ranges;
 			status = "disabled";
 
-			mdp: mdp@c901000 {
+			mdp: display-controller@c901000 {
 				compatible = "qcom,sdm630-mdp5", "qcom,mdp5";
 				reg = <0x0c901000 0x89000>;
 				reg-names = "mdp_phys";
-- 
2.39.0

