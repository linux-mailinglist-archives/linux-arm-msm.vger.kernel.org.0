Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95E128F920
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391441AbgJOTDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 15:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391439AbgJOTDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 15:03:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD8DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:40 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c141so4840563lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bVhjbsTSxgBooF0oDEk6fnL5KJWip8RsGYfRTsIW3/o=;
        b=Olv9UFBwkrn4JXZrqse3ThJk1WGrsOAVxih4wTIqFOeYNByqvtbKoyV+1NSE0jvXsQ
         f/68ALwjPZjXMoTOR3q3GE0uZKBMSeMnup4Fu38B/rtY2WqywGtMhJQraD7NmvIvsxgR
         3qEdyqGomnUvuaCmjQD0PJFFSEtGWj8PFJQz1+fSTPacAugUdoriLMbyvCHisKW/akZm
         rLIDV76NVuHEZsZ0DBCmEiD4olQeH0bahD9dbf7x0APQpx9r70IDdE/ciP5ZP2NsvIb5
         ulsXqUYfg5QeZAv/AqsZh1UP8ksKqt6MoEuGTkLfoUMQMSLvDes7Yuphyq39gNzG/Sym
         q68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bVhjbsTSxgBooF0oDEk6fnL5KJWip8RsGYfRTsIW3/o=;
        b=c35ZpR7GkdseAOMy0Kfsk7Y0PyBU6QPxjYmSRTcYYPT5ZvAfl+mHQR/SQxOI432ply
         FqpIHpRsBvLTVSo1lGuoIZj91tO65PpXVJ/GAuo6Vh/CWUQPO8hMsRWjVVeAo5Z1z7T8
         S5lX3/6iW9cQrcafYcmG6UNmK9K6Qh6unLvwnc2X3ODWqV3pHjPDT1fAb7zHRbxcooWA
         waUpfFUaoAVYzlkbkNhqkmUKg/azBSc7foZYpff3EoYg+CuYpU2qnofARW8ibcQqJt2f
         V/iEShflBvaridItG14ayk2g7B8UFOz0SukPFNDfMfjw94kz3ZbmFrjyZ15YmU7UUZfZ
         55pQ==
X-Gm-Message-State: AOAM533EgjvYc0MZGA+BNeoZ5SpsjQvUhf45JiEiy7+hriaY5YvKAThj
        hGqine+x72CbDJOI5Iiqwo4m2w==
X-Google-Smtp-Source: ABdhPJwcxEOb1Alb/QhRoycX2zuNQNTPP5yDNI0C/j7OgnEmDwKTrP1kcNDMpS+cHNm4QXZCokk//A==
X-Received: by 2002:a19:6d4:: with SMTP id 203mr8998lfg.391.1602788618497;
        Thu, 15 Oct 2020 12:03:38 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:03:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm/dsi_pll_10nm: restore VCO rate during restore_state
Date:   Thu, 15 Oct 2020 22:03:30 +0300
Message-Id: <20201015190332.1182588-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PHY disable/enable resets PLL registers to default values. Thus in
addition to restoring several registers we also need to restore VCO rate
settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: c6659785dfb3 ("drm/msm/dsi/pll: call vco set rate explicitly")
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 6ac04fc303f5..e4e9bf04b736 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -559,6 +559,7 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 val;
+	int ret;
 
 	val = pll_read(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
@@ -573,6 +574,13 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
+	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	if (ret) {
+		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
+			"restore vco rate failed. ret=%d\n", ret);
+		return ret;
+	}
+
 	DBG("DSI PLL%d", pll_10nm->id);
 
 	return 0;
-- 
2.28.0

