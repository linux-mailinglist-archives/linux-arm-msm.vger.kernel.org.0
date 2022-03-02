Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC404CB2A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 23:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiCBW6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 17:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiCBW6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 17:58:08 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773B513D927
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 14:57:13 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b11so5314458lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 14:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfVruM9Td3Qe8hMUXW/2W8vzb/CFZlBCaj9qNxMrBZQ=;
        b=SGDqdhhUoyUk04TyuwRLj5nU0/n+pQJk8CyLPjKi7op48hE9Oi5PG0XgD+plY0lBTd
         YFe1dD838csgexBoNIArITbGMar8UJOYBpr4mhgLDUD8p5jhXs/tZLg/vK1RHvJtEfi9
         g16OOJLslG7KgpYDVDHIVRMeuvrg3cLaaN1a21Vtnk9DjihknS5bECQW2O66o5wyuyc/
         t+hu5WB1XPe8k/NTBufYN59e68VwdmM9Zx0J7jbRhIjCNxIIFOfQV7h45tNTn9ivrzyu
         T/m6gyxWFroX4a1Npr6XWIZSKqTlzdM+oGbBb4OESbiHnAZTvkAHTN6Y/Fy9hrDhOK1L
         NuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zfVruM9Td3Qe8hMUXW/2W8vzb/CFZlBCaj9qNxMrBZQ=;
        b=LC6eEcFBGHmJ6NQ/NM2NvqNxwjxv9dIQ89lJ67QCu73wUA4F4YWSkGv2UJwtCuXvm5
         mTIyj4huqZCTBn7mKwGGR23AC1ummmkJe3OzV4Frw0e4sL635aRgh0N8mpGnXyxXg8+C
         IQiOcJ5cJ80T/TgL3pAlkutk3lhoMCyA20lyZt15R6Rnvmru6VbKvtfkbSnyEHB3aCuM
         oBJbpH4jpvX1UzNbsfKNTkdycvBOJwS4rf9g87UDiIVE52Pt8jKqkjDf7FiuWnuD81S1
         QGJeYzflL1Gn5n0qCkwspxphy80H7ZGTP48tVpazuX0tgZLcvGEey3HsqWVAvgiScESZ
         vSKw==
X-Gm-Message-State: AOAM532FGmu00UQzKfp85GUcVfNnWPcqv0a7SToL0/5lAqCCYz0iaxEG
        Wv4ikgS2T953CWPkvaMsl/d/eA==
X-Google-Smtp-Source: ABdhPJxtG5vOkVSwq2a3O+epKEVFO0+KA/Fssvm52be6GqZuJov2slZ3MzxvMZGWGDO0S36/SIIl7A==
X-Received: by 2002:a05:6512:3408:b0:443:c898:520b with SMTP id i8-20020a056512340800b00443c898520bmr18979256lfr.465.1646261653800;
        Wed, 02 Mar 2022 14:54:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:54:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/6] arm64: dts: qcom: msm8996: Drop flags for mdss irqs
Date:   Thu,  3 Mar 2022 01:54:06 +0300
Message-Id: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Fixes: 12d540375736 ("arm64: dts: qcom: msm8996: Add DSI0 nodes")
Fixes: 3a4547c1fc2f ("arm64: qcom: msm8996.dtsi: Add Display nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f0f81c23c16f..0597d865a4a6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -788,7 +788,7 @@ mdp: mdp@901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				clocks = <&mmcc MDSS_AHB_CLK>,
 					 <&mmcc MDSS_AXI_CLK>,
@@ -834,7 +834,7 @@ dsi0: dsi@994000 {
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_BYTE0_CLK>,
@@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
 					    "hdcp_physical";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <8>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
-- 
2.34.1

