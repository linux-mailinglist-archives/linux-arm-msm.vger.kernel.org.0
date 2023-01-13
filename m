Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3DD66913C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238783AbjAMIhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240570AbjAMIhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:41 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3E7559E0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:40 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y25so32091131lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ygam0JtyGSNqoL4zyLZHudwzPBEZFe3ZjPaOEcOI9x8=;
        b=InN2T44q2+2QlbqDPvQDP5dFLI3SPGsIZuCrAFLih5Mn10C/HPbykwwdX2TAuQQpI7
         B3aWoPh+RyI5e5CHkfS64U6+sAZ9UdLCSleL8kumsDRmz1HM1i5Wf9n/j6z+tpTOkXnA
         jD9erakVtIAzAJysuorCZ9R8d4DyHowvKUUBHRJndh+Iv+sArIU5TmYtQ79oqZLpZe0p
         KKjAXjmVsMekZPCH8Lyrf7jPdqmsuGEHA9ypdkz1iE+6qCtuqG3tzCdLZj57oBrrrNkV
         EhnRfu/tvujR3VBf2UGvbPR2MM9c76C206r5UKexFxsS1gttZnvV+DH4K921E99k8w3A
         OeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ygam0JtyGSNqoL4zyLZHudwzPBEZFe3ZjPaOEcOI9x8=;
        b=N857GOMCbjhh1VcJrS3JKQsQyV2Ehi6HFVSiDp+V49hOD78wEgpf4Od1LAn0kfXuiR
         DuDRPoq6SgZg3htsOEfUrlOYM2bTAnr8YS5JEcQ5FGh4Fzc0EP2rQ5HZyGEQKv/S06+o
         Byk7N7SaIMtdp1BjmLmFRRon7vgzJDCMcypk78rcYgppjZOign4JdMuIcCDHeq8a7xbB
         kIuv/UUHkUjgYaDf3l+gcFna13jUSZBxHbioNzRKfxJ5zaAWuCK0BFHXbQgLr0Cib8TK
         FBpuU3s5x/R6Bw3Arrlce5vBSQ5J24RylGYbn5F8nGP+XIfywEZqZwA2s+/i82B50ew1
         cTiQ==
X-Gm-Message-State: AFqh2krB3TzQjz6VhaPHip4eNL/MH4RVv0uyaenvgx2nmsn8nfaGQtzW
        uYZ6c3+M+GHwuP4q0NA2WFCPsg==
X-Google-Smtp-Source: AMrXdXuf1vf2Ydl1TyNZ/2incZgzsnd0vwxj+MNY81XQB2uiaCvgUWIpD5RbZZYPnQZH0qiwzOPnGg==
X-Received: by 2002:a05:6512:318d:b0:4b5:70e0:f2e6 with SMTP id i13-20020a056512318d00b004b570e0f2e6mr5754158lfe.24.1673599058652;
        Fri, 13 Jan 2023 00:37:38 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:38 -0800 (PST)
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
Subject: [PATCH v6 10/11] arm64: dts: qcom: rename mdp nodes to display-controller
Date:   Fri, 13 Jan 2023 10:37:19 +0200
Message-Id: <20230113083720.39224-11-dmitry.baryshkov@linaro.org>
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
index b688df272207..027eb99340e2 100644
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
index 9d4b785409b1..4e17bc9f8167 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -699,7 +699,7 @@ mdss: display-subsystem@1a00000 {
 
 			status = "disabled";
 
-			mdp: mdp@1a01000 {
+			mdp: display-controller@1a01000 {
 				compatible = "qcom,msm8953-mdp5", "qcom,mdp5";
 				reg = <0x1a01000 0x89000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 1be9a92fc8c1..50cc6f125557 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -932,7 +932,7 @@ mdss: display-subsystem@900000 {
 
 			status = "disabled";
 
-			mdp: mdp@901000 {
+			mdp: display-controller@901000 {
 				compatible = "qcom,msm8996-mdp5", "qcom,mdp5";
 				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 2ca2f75f2aa7..5827cda270a0 100644
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

