Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCC8661B93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjAIAib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjAIAi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:38:26 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF1AFD21
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:38:25 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so10606499lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
        b=pwfVBT2HYHe9BboGX1na7E1Qz6Ou2AoQIQHEYu0U71gTHI/eegQIWsjONRGZE+h1cA
         64UUdaaFYIN1+opOVxD1m9++F1NSCmSO86qoD0GqjsnOFJZeYruqWRSoFITijjTGPILH
         Auwcu47pCOxDbeVCA3p/smU9z3NUBeYtrHA+plyTg7+wgmOP/GoOWUnohMX5VLF3i0cV
         EIIa7UyF2DkbpNN0cfjxA1z6xqrZkqLBVQ5WrwsngdUDpGGD0nTOUSrzuDRtT8onyTHL
         NYsOBK/vxtfwfdlZ89JMkP6fb074Y0/ba1TPM7GbOn9ykYc6SwvikK9ksZog6NF3LIc6
         F+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mrb15vphKcBSHFcYnw0cLYDDRYFrhAD7+lVEbzPfwQ8=;
        b=NJv8dRSmIqpLf+gBpwfzGTj9G8zga2fyrFLDfQg5Vb2RisNhgMcQ9A00UDV+5noX6H
         NNL+TMkcZt7PWxj1sh+KhYEL2H8ocpV6ly4Xmi+MyVSmnURycJjTx+fW3GSORSFZSeZp
         6MCJgG2Zzr83kC/hnNx0Uw5ZsL7lhCp70tO3RxnVpjECFMj9WzH3A/wDwFM6lwMXzjBT
         eN+gsoKqz8uh1kAJ1SlBpPsxMZvKAgg8d1QSX8qmlS3EKyCjzI/dkHuwbw0mwo8ntQJ9
         LRgU+rdqbDI2VxCCWkybfmqmRWmqWJLc/7njC5+PZPS/LNwOVjg5DDaKBm2xPLqdQXFH
         KlGQ==
X-Gm-Message-State: AFqh2krJQvYyVzbTVm2Wg83BNSAf1PeSPFdJDztU17vmKU3eSfLRsLwk
        Mj5KoW/iGbmAw5eKdX0wRd2VGQ==
X-Google-Smtp-Source: AMrXdXthjuqBHR/XrsnzBmMj02IZ5w9/MZL41eQpfbdHMpqKuGEMA3pUrNwkj6lUM0VobgBEAgh8Tw==
X-Received: by 2002:a05:6512:3d94:b0:4a4:68b8:f4f4 with SMTP id k20-20020a0565123d9400b004a468b8f4f4mr22544458lfv.58.1673224704322;
        Sun, 08 Jan 2023 16:38:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:38:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
Date:   Mon,  9 Jan 2023 02:38:19 +0200
Message-Id: <20230109003819.245803-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
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

