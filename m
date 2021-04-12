Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4435B791
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 02:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhDLACT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 20:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbhDLACS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 20:02:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2C6C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 17:02:01 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u4so13189570ljo.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ieepqs9ZuSvUUPxw9eZKC0f238LzqGVu9bKoapQmr4=;
        b=WZ1Dgb5fCpEqjax+Dm3uS2ehQWH+ccKnQRLlzUVlQgcVbvwrjOaaD3ZXGnY1hvvVNT
         ukZ6BMmFsw4n5iYPzQMINCzsyiLBR1mZYXEAePhRmZSuoOuBDWcMjbEpu2mXvPriUxu5
         CaUex8/DHuQRKUqEsBadYK4f/WjCf3gMdZD5oDqqIJA65pFGmWQPTYF68IxxQZcucRXj
         bYj+GVQU73fQODjiOgqDYD3OFB/OMjuAp4JeFMLFswI05ikCo8BJApjIMbRuYCXTNUkb
         wOVlzYSRRxL2GOVRe+bbBGrbFKPNkfxJTaPuM7qg/Mzd4n7Yffl/i80nbxHihpj4LUD4
         ItBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ieepqs9ZuSvUUPxw9eZKC0f238LzqGVu9bKoapQmr4=;
        b=B9vz+dqQc9rlafKN7QaC25CgjOVfmdKZw+dYjKP8ts8DqRJ+oMoslxyCsR5NqWySjk
         U97xUA7VYT7t34Ltv35NvWYwiwYs4hivhcKBdLH4O4LQa1WhOMYMBxBbXCxlgCpko1qL
         OwuZjgd2PtvwrM+olKeg3Os7znIC/dkroAlRdMWRQGexfj9o86gWO8ui830Fcu20n/Oj
         E9miyGRNNz3j0Zdzx1auUnATm0qodD17D/XqoIXUjeuUYm/PopKpFWpKr0vMdY3QDUdt
         YB9A2e7OMciDrKlxDzs0tEWhO2oVxDlgw9sqcv7Dd7ImZZV+/q0+oaXuDgJbkwwGWY88
         Riwg==
X-Gm-Message-State: AOAM532ChsmApyNG3Tao4x3LUU3DwEGqrQ8bnyVQ6IkWkyF+IF59Rmav
        4a7BQ4A71jtD4dr7sERFceZUrw==
X-Google-Smtp-Source: ABdhPJxRcOvXWuRVRVYNfvjK+PXibkRkqkrmDe20XRjGgJnbBjs5+YX9rDuf7nsmo//tp51W+1EHrw==
X-Received: by 2002:a2e:9f48:: with SMTP id v8mr3334597ljk.302.1618185720064;
        Sun, 11 Apr 2021 17:02:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c1sm2288633ljf.85.2021.04.11.17.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 17:01:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
Date:   Mon, 12 Apr 2021 03:01:58 +0300
Message-Id: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
return 0 instead of returning incorrect -EINVAL error code.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f0a2ddf96a4b..ff7f2ec42030 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy *phy,
 	if (pixel_clk_provider)
 		*pixel_clk_provider = phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
 
-	return -EINVAL;
+	return 0;
 }
 
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
-- 
2.30.2

