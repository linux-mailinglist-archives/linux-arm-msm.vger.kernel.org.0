Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452F028F91E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391437AbgJOTDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 15:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391436AbgJOTDj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 15:03:39 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8085C061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:37 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 184so4827140lfd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
        b=R6AIOc5WJ33f0BpBRKWYPfmzPqDTmiRJK6HbByTEodetAfGJmFjYidA1TNiqjvR4Fi
         +z1TNNeyEyau6GtusqefeTQnKj5EcAJpmjSyGJsRm4kY0+nEU/tuqZaM645x9d52EkfJ
         XlL9lbev6DTnB4JsfiHTcsinc3sEuY5IWeieKnPKFav7EuFVVDRflL68jIvC95bn0frl
         ORFaopwANTwpTD6Yiy8F9m+79timzuVAvJkC66NNbUskf8Zvx8F7rJhZzbzksEu1tGPC
         TnNB5kTXKRU103n6pq7CvDUmOa/QkY1XLAknl7zyYtDYikwQOcsZTXxzyVWNSIv/3QC6
         4zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
        b=YiIJ5HSUErfbmRU2fgBsgMzZ6o9AH0SxwJ2vy8os+p9rwBPqDVeZc19el1ZOlWwuhG
         C5qFMdOrZ0JJCch0zDsnS3dGe6E7pCIQVTnHp0k5vWlWm3kIlCSTVZiJOz+Hac3/shHx
         CGIjzZlXzOsIkfPOgO12Fwucom26Jp6/dAzjVPzKEk9dDZyoySZl86fkueDiBOyRxcOy
         UO29FXxO4U5kw4zKvt7Wu06x3G1/DHPUrPzYKRbgNTxYcp7zNyDxQ6L9ms1wme9pSbwe
         W6v7donxTygXGmWAs9K6qQ8VqavNzdzt7PAr+Ea6qE72mKl6ZIyOR/4muSyXNrTKc7bg
         cTNQ==
X-Gm-Message-State: AOAM530Ze+Z7x51U3prNZP+IbsWZVDQsOebZwQyTjGevk4JpfrZX2fK2
        pc998b5dsM6FLR3mepQsUgfN1Q==
X-Google-Smtp-Source: ABdhPJyrLs7S6IIec/2X2Mr3xlDlbDJAbGZIbUGS6+Evt+QFdDtmpf67+WxUOYXCG2lMLvxRifri5g==
X-Received: by 2002:a19:c3d6:: with SMTP id t205mr21117lff.84.1602788616297;
        Thu, 15 Oct 2020 12:03:36 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:03:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/4] drm/msm/dsi_pll_7nm: restore VCO rate during restore_state
Date:   Thu, 15 Oct 2020 22:03:29 +0300
Message-Id: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PHY disable/enable resets PLL registers to default values. Thus in
addition to restoring several registers we also need to restore VCO rate
settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index de0dfb815125..93bf142e4a4e 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -585,6 +585,7 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
+	int ret;
 
 	val = pll_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
@@ -599,6 +600,13 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
+	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	if (ret) {
+		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
+			"restore vco rate failed. ret=%d\n", ret);
+		return ret;
+	}
+
 	DBG("DSI PLL%d", pll_7nm->id);
 
 	return 0;
-- 
2.28.0

