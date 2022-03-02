Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D428D4CB2A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 23:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiCBW62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 17:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiCBW61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 17:58:27 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D53B26D2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 14:57:35 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id o6so4402888ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 14:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AOixTqbLkmUt5KzDDz/VZJz+gfDZkRumbt+VIp4C3b8=;
        b=ZJPRPff8emMDliBMrMOumvg8Tyr8r4HHVlmNvMmXn1j7p2vRe+p5vnxFfLzIzCsmvK
         yqGO1Ig/+e8vMNjUzR6xryMeSj5m2afjXo0Ft0T+fg+SNuSLkzhQbgKlLuwN0wSE6US7
         w46Z7CMQm1tuuI8Ak/8v4lrECIPl92VIwDuaNhrLGPX9QG0Zf62moh+2CcEk3UBDdbnh
         nh9V/ZUdSad2es4SB8uz1pokLzA5VlViiC07Mz898KsulnuHBet1sn25AALby2lOxAx8
         RideSACTRzeg9dnH9X1S9P1WCr8Zkreol/RlDLM35fAjTEKFjO8pVYky0FOOFW3gsKno
         9QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AOixTqbLkmUt5KzDDz/VZJz+gfDZkRumbt+VIp4C3b8=;
        b=Gnn12PIurQ3CKGncIDUbxxKvVY+qI8zg2x/v6gqAfPs8Rq+8qZmnzpwHqHnNP7nnFc
         DhwcX+8wbLbMXC2edEJfWRTbiKD/DSkRcCt1kX++fY2tKqouewgpGg/TjGA0iUpX0+yf
         Muqp1DMYZ8lr4uvWngMku7ZhaZ25LCJyqyhEAw9oL9D3LS1Axz9bWcGNTnOR3vTXA5cN
         rWe2M/E/1WBnjPQPmAeAqjlse2bdso/KWN47hAJwoiCsgSZBPMXgGs+aO/whjWlowq0I
         pXxOzYhig6+kULRILR0rx3EnEMNU06qmpMdxWLs9ZgchsaJ1lyPMZxd5vG0nlnezzAdY
         y4VA==
X-Gm-Message-State: AOAM533DuNKbS+NPKrFxl7ukd4KK25LheYKcHvL/bna7V2E3wql88hXW
        BPfsrTVnIJHWc1bFRzw05QkFEA==
X-Google-Smtp-Source: ABdhPJxARxRyH3owoYzra3Hd1juOU7X3fQJJZnKHh25cR+Hv5iHYGwUWAXaSIKOhINzWL1fiblj5MA==
X-Received: by 2002:a2e:3c0b:0:b0:245:f5f8:3f4a with SMTP id j11-20020a2e3c0b000000b00245f5f83f4amr21345019lja.483.1646261654968;
        Wed, 02 Mar 2022 14:54:14 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x26-20020a05651c105a00b00246585ccd53sm54236ljm.75.2022.03.02.14.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:54:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/6] arm64: dts: qcom: sdm630: Drop flags for mdss irqs
Date:   Thu,  3 Mar 2022 01:54:07 +0300
Message-Id: <20220302225411.2456001-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Fixes: b52555d590d1 ("arm64: dts: qcom: sdm630: Add MDSS nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..7f875bf9390a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1453,7 +1453,7 @@ mdp: mdp@c901000 {
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
-				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <0>;
 
 				assigned-clocks = <&mmcc MDSS_MDP_CLK>,
 						  <&mmcc MDSS_VSYNC_CLK>;
@@ -1530,7 +1530,7 @@ dsi0: dsi@c994000 {
 				power-domains = <&rpmpd SDM660_VDDCX>;
 
 				interrupt-parent = <&mdss>;
-				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <4>;
 
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-- 
2.34.1

