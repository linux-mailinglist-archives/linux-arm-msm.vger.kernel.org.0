Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C0F2A0953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 16:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgJ3PMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 11:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgJ3PMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 11:12:13 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AE7C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 08:12:12 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m16so7263379ljo.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HmLApEco+rX8mEQowG+X3JrxaqslQdNzajS3RXlAwc4=;
        b=Tqb7O5kk3DsDfwbCyi/N62cSbTRuKTlWvRDOrRX0UK94p5yx2nykHIfq3F83pRzD4m
         CBnP5gDVH25wtvfCi2WXDdN2Y+eGpbOa0UF6EClN/a1EuS4jsF8amYFS5Y2QOlKWJ8tf
         VVZ7wxL1YgWLRwqKaSWmI2CfH1+lxGwoUixJXMmCe7NxnpYilaBe5ufBKlnUFNXwoSFj
         cFzuMsujm6jKIJR5jMaRCwoEfh3YTFGu36xe8FEkz4RHLMCqMOQ7h0CeAuu107yf6ngb
         06ijysHFIcmX9g4KNx9rK3vmkRombtOQhaPt+MzK9H4TG7Wn93OGrQ8027CBTkEV2wZO
         T4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HmLApEco+rX8mEQowG+X3JrxaqslQdNzajS3RXlAwc4=;
        b=CthlzXrDpPiHoCb38iGRn0x6llusOzyZeCnngzB2sQ8a53d8jFPI1jNryNEUbv7PZf
         PF8Fh8HMb0B1wWscA2Khc3BONfj3D8rML2GTfEAjgHK7JFeyTFufroSg+q8Cbx6UGpBa
         fdUD25DBb13QSSoUD1tPjU+c3hiM/E7YBTikG2Ms5+w8SRTgyFY5JPj64OaYXkomdMdb
         B+Kfhw0q8Pq2+VDw+bZHxCBPYl36/mPBABBHqRcyAEpqJTRGmX/6zZH6oDQSlPtBNeRB
         ZbHJBKE92PwPD00NYm7aX/UoNGAVNb1ImySL2s8xHWAmDIgk7437Twl+ifihwiSfay2w
         P43g==
X-Gm-Message-State: AOAM533Q0BFTHiw3VHh+YU9k9MwBsFvwb5ZbtEQmMwbAZKOL5xcHqxgt
        CmAblELCNxLEqBlWzFQR6rlFNg==
X-Google-Smtp-Source: ABdhPJz8Jf3qUgHHL0oIhqFyjGJF47n865tCXisEWtPQ4NvvEiiPTNTUXmZA8itu60q/kdRV0TymxA==
X-Received: by 2002:a05:651c:1139:: with SMTP id e25mr1238791ljo.63.1604070731032;
        Fri, 30 Oct 2020 08:12:11 -0700 (PDT)
Received: from eriador.lan ([188.162.64.225])
        by smtp.gmail.com with ESMTPSA id l16sm647269lfe.78.2020.10.30.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:12:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     benl-kernelpatches@squareup.com
Cc:     airlied@linux.ie, benl@squareup.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        harigovi@codeaurora.org, kholk11@gmail.com, konradybcio@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, zhengbin13@huawei.com
Subject: [PATCH] drm/msm/dsi: do not try reading 28nm vco rate if it's not enabled
Date:   Fri, 30 Oct 2020 18:12:07 +0300
Message-Id: <20201030151207.766857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reading VCO rate for this PLL can cause boot stalls, if it is not
enabled. Guard clk_hw_get_rate with a call to
dsi_pll_28nm_clk_is_enabled().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
index 6dffd7f4a99b..37a1f996a588 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
@@ -447,7 +447,10 @@ static void dsi_pll_28nm_save_state(struct msm_dsi_pll *pll)
 	cached_state->postdiv1 =
 			pll_read(base + REG_DSI_28nm_PHY_PLL_POSTDIV1_CFG);
 	cached_state->byte_mux = pll_read(base + REG_DSI_28nm_PHY_PLL_VREG_CFG);
-	cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	if (dsi_pll_28nm_clk_is_enabled(&pll->clk_hw))
+		cached_state->vco_rate = clk_hw_get_rate(&pll->clk_hw);
+	else
+		cached_state->vco_rate = 0;
 }
 
 static int dsi_pll_28nm_restore_state(struct msm_dsi_pll *pll)
-- 
2.28.0

