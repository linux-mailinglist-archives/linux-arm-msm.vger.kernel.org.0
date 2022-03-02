Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7D74C9A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 01:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238800AbiCBAw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 19:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238797AbiCBAw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 19:52:58 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25D07EA31
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 16:52:15 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id u7so84960ljk.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
        b=oEmqBkXAdaJ9rnJDQtmTdrV6zzeyI3SIDdlyVBZ4QLxJAkUw4VYGbn5hLe0c2y4m1l
         1i0hPWf5Us3QDEj8Wmu2DvR4cT0LcqhXE7NLRBSS5et5XaSCjpl0Sof4nZtburkGLa+w
         I/QrvAYTnr4A0E2gkFhQdlYSuvHXK1LAdkqnZrJtADJb1ZVsU2mRi/gP+T2oL6Jw1Sgf
         zF9cPkzMEpSD34t2STfywILF8DBgRD1GdlERGKgQveauH+uqiGKOUB3MbJwDxg2cx+GA
         QlP3l4jeP1S5bOq+1i1fnDX6Fk6DyoD6seumYqf1xQqYMs0EIPeImFgpX+0gwDqqjw3/
         seqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5dxVC0XYMtIkeKswxmMMqBeM9Azi7/GfbM0XxG5vLXE=;
        b=Md2gXnjotGLu0xr/ROrg2qc7UwAi2qmVl7tjwLsycx6pYJMvAEotdMKbMXnCb21PMl
         lVGw4sKLtNi8SfZ42tUJ0bVCVTGPRa4fYrL64oNAr6TuR1UY8IiiwNdHwiNxI4B7Q97B
         I4rCX2CfsFppwjYOpKqCXtQ9W9jNNCJFg4pNdDmmiL0SPeNQfYz5Y3slZbSYmgYkuVua
         ddd46SGb+Vl3gaiWEDILUzodk3e8FoAdx3tBsyG7Z7lp13ugMfGOdtDqNofK+S0ncsuG
         wCguw2PMNNlH88GcpIz7mk3Ds05HY3Zcccsz0WGZN8Nx4fsUwBqppUDmZQt6Rd1A867r
         1e/w==
X-Gm-Message-State: AOAM533fW8fzJQ7ZEocxhrDUL4dmKHjLO8wZgGjzUFU6EzF4TdImjrPC
        m++eZJsT9xATmGHegeFcbeSGpA==
X-Google-Smtp-Source: ABdhPJw1dajR6vcW+/GGOcsIoftUlKpFkCNvxRaWyG04WZEO0cJhVTEkXW+He7bQtZfg+1bUDlFVSA==
X-Received: by 2002:a05:651c:514:b0:246:8b8c:a97b with SMTP id o20-20020a05651c051400b002468b8ca97bmr8544838ljp.238.1646182333544;
        Tue, 01 Mar 2022 16:52:13 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0:5258:5528:7624:3edd])
        by smtp.gmail.com with ESMTPSA id n23-20020a19ef17000000b00445b8db3c42sm198171lfh.172.2022.03.01.16.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:52:13 -0800 (PST)
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
Subject: [PATCH 2/5] arm64: dts: qcom: sdm630: Drop flags for mdss irqs
Date:   Wed,  2 Mar 2022 03:52:07 +0300
Message-Id: <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
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

