Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F24F28F924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 21:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391439AbgJOTDq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 15:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391438AbgJOTDp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 15:03:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DDCC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:44 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y16so4301160ljk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2020 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
        b=EUNB8eg9424Pz3MhNKldl/Gb7ORKJB2IZF7A8HYSeXEkaXV1kyQYBUtA4NmwOfV2GJ
         C793nDdbvoFHUoSrofe6zkCe07kKkCOAXemj0ShENkt5VkAfIj1xJleAwSi1+QzlKBCN
         /VfsFU8ZZhlHu0gGnebxXcfAxvRMIWFL71Bo8nPSeFEWxzsd4jis1WuRXCRGIlLcwyxY
         HO8QoSjxBXYUVoWGmMhV77xRQF6q/m/Mw0U8xgItOHrDTMjcu4HFFcbN9KawKqv6VTqC
         ynuSUsoXiNMlzCO5Ds8xnCmY25YSDikVX1MU3aqHfkZu18+5A7wScX48zL6Nm92x6RJb
         ObIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhaZDdXwG9Htyy9xDjuNDYv8IjQyEGy8Xq6PwirKnX0=;
        b=AdHSpeDPJFQ3ozYv/68Tz723DLfC+NyitpN2t6kpd8KDsxA5RLCR+ueOdBZch3n0Ig
         GRHiBhNXY8ot9ndvUWGAaisZuArn+PsaQ4owdCf3yfrQv52AzkIytZZllVxiDSfYh8CK
         nQ33OvwRtL5Av1e0eS8Rc7VZS4JJU3FydnO17eQUgP9lxJt/c1dbs9pJciOvfINmnpEp
         yLq23iw9B8upBhGwDoVjM2mJbLPUhL/BP8DLTOhR2MktCcKYzuipNCkNGgXTB/8rX/c2
         m2PQi43DGwUQ08+npq+NwVVWMbmBGLaZbEVBpFtRtG1UEvCXg5tFWT9jfVEnBAvew1NR
         DvCg==
X-Gm-Message-State: AOAM531Vo9v/4k1h7n5bUjI4Kdj+kqQXpvaYndyx5bDBLITUtQUsuWpo
        3qyY0eJkaXoRMhULMnPXKf570g==
X-Google-Smtp-Source: ABdhPJzOf/yetyToCB83zvZHrgJDHli/yZIfn5ryh53Ru5VXPFtzWszJqI2El1p0VvHgPBFP3Tt3XA==
X-Received: by 2002:a2e:9242:: with SMTP id v2mr62953ljg.115.1602788622679;
        Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
        by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:03:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/dsi_phy_10nm: implement PHY disabling
Date:   Thu, 15 Oct 2020 22:03:32 +0300
Message-Id: <20201015190332.1182588-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement phy_disable() callback to disable DSI PHY lanes and blocks
when phy is not used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: ff73ff194060 ("drm/msm/dsi: Populate the 10nm PHY funcs")
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 47403d4f2d28..d1b92d4dc197 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -192,6 +192,28 @@ static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
 
 static void dsi_10nm_phy_disable(struct msm_dsi_phy *phy)
 {
+	void __iomem *base = phy->base;
+	u32 data;
+
+	DBG("");
+
+	if (dsi_phy_hw_v3_0_is_pll_on(phy))
+		pr_warn("Turning OFF PHY while PLL is on\n");
+
+	dsi_phy_hw_v3_0_config_lpcdrx(phy, false);
+	data = dsi_phy_read(base + REG_DSI_10nm_PHY_CMN_CTRL_0);
+
+	/* disable all lanes */
+	data &= ~0x1F;
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, data);
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_LANE_CTRL0, 0);
+
+	/* Turn off all PHY blocks */
+	dsi_phy_write(base + REG_DSI_10nm_PHY_CMN_CTRL_0, 0x00);
+	/* make sure phy is turned off */
+	wmb();
+
+	DBG("DSI%d PHY disabled", phy->id);
 }
 
 static int dsi_10nm_phy_init(struct msm_dsi_phy *phy)
-- 
2.28.0

