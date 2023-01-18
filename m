Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377C0671263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjARENB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjAREM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:12:57 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B6A54237
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:55 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id vm8so80236439ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
        b=wEwM3ODNU0MowFecviicvfnDW0dJpG75Qv0ExZ3a3pelAnpBJasRKpOnZ6j6+devK9
         HbVPw2a7RTyw0ZVqCywthztmlTNs1lHeNCL6tx/zvKdeBUJzlcT8EzYq9nHnXJk2RBgm
         Jz3v4CmJQmEkyTwBgZleRXccoDE3WQqi1rTT8gdjxOs+YsuzHhyRgVjJ6/BjBxXpGPOw
         kmRPRI+I+tVVCv3v/pnI7Yk1iuAtDywHHXMmEQdTOLTQGgUMeA10rOPPjUgmOLf/Okil
         911bIZkfxJ6axICvWAhMJBQp15XR2wcNAkbow09GzWWcb0cD4S4k7b8llqHod74Fscd3
         HLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKUFMUuC1mjW2I+55wNX6rF9nT8cDKjOOif5GeIpc7A=;
        b=DQIYKZCFv2iJWO54Xy+IMbosdhPst/iswXpkIRxT7qra+PiWKmfLpJyRw77TBZFhHv
         mrPrgDFubE9q/m0O4eNDqqvvMnuaxD2TaHzhqZnaA32CcQcSScbLYlWsKWy/aQ6Ncl3B
         nHbdgTV3mLs1bXzuNWP+tvz5s1hikNuTeSYthPnIiD+Q9UyrW0S/1Dze2ms8VBLlrgjI
         HP7zZo3ATIq+eLPoqZD6tqcpmGAeXAtLKsIR55z629cqzXW4E6lfNZsycRUCBAktAdWj
         IySz/Z9nR83eoirQAN3VExa2MPolBg1ZpWqiLvF/mv4uM7zZmGOYVvw9UAHbSVv3bAk4
         8Lag==
X-Gm-Message-State: AFqh2konQ1TQ6CKvwYGJ3ZjFRQcMGtUtOLI+4kwdb7IbH9LiOF2UaQrW
        kgYXVKtqvKjgMnv0ktGxCtXazg==
X-Google-Smtp-Source: AMrXdXvN1wWQAbY/8RhWhTDjJ4y3Gmo4ScpVY5GcZ+s1FciLYFRvitJ90f6oITqDZ2nrIsr5sPAzxA==
X-Received: by 2002:a17:907:9623:b0:869:236c:ac40 with SMTP id gb35-20020a170907962300b00869236cac40mr6677727ejc.31.1674015174016;
        Tue, 17 Jan 2023 20:12:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm2314100ejc.3.2023.01.17.20.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 20:12:53 -0800 (PST)
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
Subject: [PATCH v7 07/11] arm64: dts: qcom: add SoC specific compat strings to mdp5 nodes
Date:   Wed, 18 Jan 2023 06:12:39 +0200
Message-Id: <20230118041243.1720520-8-dmitry.baryshkov@linaro.org>
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
index b8cf5c461d98..c05d2a85247e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -935,7 +935,7 @@ mdss: mdss@900000 {
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

