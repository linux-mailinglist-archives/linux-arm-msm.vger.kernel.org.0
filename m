Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AE572B5FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 05:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbjFLDSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jun 2023 23:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjFLDRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jun 2023 23:17:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 738BC184
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f61735676fso4474184e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 20:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686539778; x=1689131778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAmGA4CGrc2mip02rFkO4Zx0BoHPmjJnhKCFRcvi1qk=;
        b=i1Hr6spoFkG/27w/7KVvHCjWfZfx5W58XOzkaRLQTy4MuXverDKit/JoUvTg0TVzqY
         QArSJzbRQ58idwbexI8sdnKskDMV1LFEhXZ2iDI2DPInC0PHtQBwsW6KuDzoTQWk17OY
         IaX+rXbZXiOBP390Kicus3KJ8Dkk4vLJeoZqF8yEQJwNGJk2DX/OCWnk+E3ny/rgNQtP
         E5zLixYas2YRAjK/GMe3lIXtvlDi00KvMxrlyOw2nW6sUGq2OtQRY4uR0Md4EpajdbpI
         xyxNuRqF7h6M8/ERbbA/eVTAtyB2QYNCc3izke62E2Bq7gSAJosZP4Q7JX7KxyZAvQIJ
         3OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686539778; x=1689131778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAmGA4CGrc2mip02rFkO4Zx0BoHPmjJnhKCFRcvi1qk=;
        b=DLdew+C1fA+4eEC2rO6ffiMRFI+gJNjQFAgCMrRXE8uieVVyptow6pF+JI4OWu/2n7
         n7DK+A7dprjfySsXY3bmhoWYXUkNLyBuv4GRubyS1IOWZcMaadk2HfNNT1sDQjTPfOOQ
         Pd+QrctrHXDKFbWeNNGbZUmpKNif9V0RqOrTa9hw8AgEoq07uUooYF3T1v8c4VLgaiop
         2H99m7GU3MGmh4qnP25guY2oPTzWIFgfZYY5syQ/04qg2FfQ2qfO+liiSr+dT3pmZK3T
         kBSZlLAKLX4KIX8ccDsQf2JDrGwfDuwrEO1RfnGPAf0PykFPCdb+DYy5eevEC8cenbMd
         ARjg==
X-Gm-Message-State: AC+VfDxrnGnF4/3SEewsvb0FvjiDZ/xPQ4SliAv0dyTv1Bg6BEW8Eo8B
        VKiXnRluGJQuCXFbjCaoS3LkAQ==
X-Google-Smtp-Source: ACHHUZ5ebUVXFqaQVfNpyMR0OjRILdzgCwRKvjDWlBLRqQhCTbm9SliC8tbYuL16gqK4u2/3LcOCPA==
X-Received: by 2002:a19:7104:0:b0:4f2:4df1:f071 with SMTP id m4-20020a197104000000b004f24df1f071mr2592817lfc.51.1686539778351;
        Sun, 11 Jun 2023 20:16:18 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ee0c000000b004f27471e0aesm1295901lfb.79.2023.06.11.20.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 20:16:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
Subject: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with unprogrammed rate
Date:   Mon, 12 Jun 2023 06:16:16 +0300
Message-Id: <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
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

CCF can try enabling VCO before the rate has been programmed. This can
cause clock lockups and/or other boot issues. Program the VCO to the
minimal PLL rate if the read rate is 0 Hz.

Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..6979d35eb7c3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
 	wmb(); /* Ensure that the reset is deasserted */
 }
 
+static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate);
 static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 	int rc;
 
+	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
+		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
+
 	dsi_pll_enable_pll_bias(pll_7nm);
 	if (pll_7nm->slave)
 		dsi_pll_enable_pll_bias(pll_7nm->slave);
-- 
2.39.2

