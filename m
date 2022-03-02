Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12024C9A1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238795AbiCBAw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:52:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbiCBAw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:52:56 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD30013FB7
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:52:13 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id m14so100696lfu.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
        b=kFWE16Aoaj+o//Zn40/+etJqsbR+TZiRHqtnJsI4Wog2t4S6E4CxC6ghXAduSbJ7UT
         thVeHdkT3kso/hcUs38OYn6eAL65hSDNXuayQoJSyYJDPJsMAeDwSdgMhda9CjVIGSSS
         9UR9oX8fr7HPnLeOw6hY6crk5HT+Nknf6x3SwnSeZ7k27Bf7Oa7noyyqemREOVIZizMh
         QeWpgE+3gnWmbj/NKI1NqbzIefp7Zk0xmkvMqymGJvbgP5GrSt5UWwHruw2JQdBaMvVM
         u4qgyWgrchX3iceBmKZr8HKg4bWQPzevxyoJS629sZwO/ALPB1SloRM8f705ZAcDA5zB
         Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SWC9HLvSBhB6Pz8h3N3F3AQ0kWvVsZWnOAu1rbrD3T8=;
        b=z+7IiOzcpb1daYiPwq9hRcKPtw56nroBXhnqCDiSR0dB8JVSjLQIu9nJB+wWABMM4W
         kjoPGJz+R0N5V1Gh7DIhofHWfnKeMFz8AfGUiI7eeQX8McioY7R5GFbf2wBMWJqcv5ee
         0wH3ws+QFf8mbFSXqc34HcEhqKSzIRotKadD7A24MIIqZS3KPCMDNwz2KX4F3HBe/fV7
         j+AChPrR09KNeduKg6ubRAhq5ZXSu/ABrS5CU2bPxAEDmtOq7QqHb6ywP4KUTMyrOHPZ
         607N7yFor/b0auOxLAIDOTRc25yEAWUgz7A6Q8q/OcpvXxNJ0n5gwNUz8FRwLO2pvSCD
         KMEg==
X-Gm-Message-State: AOAM530aaRadiaKhRl+FjJmTxUfpiVuwFZm3D2TU9xxwGMp4MF1bJwtX
        woTo8DT3WG9HHpaa30dQFj81fw==
X-Google-Smtp-Source: ABdhPJym3l2+Hs9czgroqBDyOci3cO8rUBNuuvJjNmEzzQ1BKImUtnbRIkY8c6HLvLBt5WHRuMLJWQ==
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id b2-20020a056512304200b0043796f5e68amr17760636lfb.449.1646182332278;
        Tue, 01 Mar 2022 16:52:12 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:52:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags for mdss irqs
Date:   Wed,  2 Mar 2022 03:52:06 +0300
Message-Id: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of interrupt cells for the mdss interrupt controller is 1,
meaning there should only be one cell for the interrupt number, not two.
Drop the second cell containing (unused) irq flags.

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

