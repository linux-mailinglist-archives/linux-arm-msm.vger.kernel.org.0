Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8C166F2BD9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 03:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjEABND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 21:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjEABNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 21:13:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89F6E61
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 18:13:00 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4eed764a10cso2496348e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682903579; x=1685495579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnI6vO61JZwJqdYgPavotTq1kv1IzG9rA8bUFkEpBp4=;
        b=xyPe3Fvv67nuQAtdoIrUuRlhAvNaRHJu2cGjsxqceJPXfQRWpr4euhUtNpUy2Prwj7
         1nkXgqF4R+gBG5W1a5qCeKdksZLhTTx9W8+Vk1kqlpm5klgeCy9RoWH2tKGSSnWxKe/O
         P9QnzArTbTy5PC23k+oma51mXRAYy6oTJ+ppF6kVzTvs9sxpKsAKDJCmOrb8V1OCUDB5
         Yr1D3J6fkNkEHUquiECEyxmdkb3gbenWjX+aP3Nu6UMYa13ndB3rAtQiOq0gGMwugNDt
         zOW5Ws2CW6Q1n9cv3RMgl27f7CyE1jMdXvS97YXb9nGin9VhJNilOHqEVTpOds0/bDlq
         6ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682903579; x=1685495579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnI6vO61JZwJqdYgPavotTq1kv1IzG9rA8bUFkEpBp4=;
        b=IYcNZV6gx5uxEG0gqOBLuWsxYf5INTXMUYNf/j7SR6qs65gpYp1778Qcu9GHlDYY8y
         wK+SFGhFJkqubGKjOIJNLQdu1ZCggcwtv7BtfWFccn2DPDPcT+WIgt0d6tVC3/auRzRF
         EsytOY4YmPBan84RqLHJykpuK8okBIhdOTxjGyJP5C2yrgPyDrcWI0+RQFfHw0dahofm
         ANcq2zNeSoMCeLmlsTRkvymuUkSQ7nBsxOe7zuk+BV8kZd/M9CjPmZiYxkuMuDp8le9i
         uki0nFWm4SzDG/5r2dja+tm36L+C/XsHGyWiG1LyDJ3QXARQ+umLIs3+EMtuiwpqFxxD
         E35A==
X-Gm-Message-State: AC+VfDy7Ewz0vEMIjkPlW53b3P77sT4Z6eGvMX72zCQNAmjThrtWhrDH
        lk3wsgoPAqduKNNhAbn1HVXOQA==
X-Google-Smtp-Source: ACHHUZ5bfneIWAzj1o7uii0f3owbo2c5wxb+feyxx69/fl3rCaV7BSYwjnlVTIBxeji/IGSbkMc4Yw==
X-Received: by 2002:a19:5501:0:b0:4e9:9e31:5f70 with SMTP id n1-20020a195501000000b004e99e315f70mr4268480lfe.56.1682903579030;
        Sun, 30 Apr 2023 18:12:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h9-20020a2e9ec9000000b002ab5ad42f3fsm733424ljk.92.2023.04.30.18.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 18:12:58 -0700 (PDT)
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
Date:   Mon,  1 May 2023 04:12:57 +0300
Message-Id: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
enabling VCO before the rate has been programmed. This can cause clock
lockups and/or other boot issues. Program the VCO to the minimal PLL
rate if the read rate is 0 Hz.

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 9f488adea7f5..3ce45b023e63 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 	if (unlikely(pll_14nm->phy->pll_on))
 		return 0;
 
+	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
+		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
+
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
 
-- 
2.39.2

