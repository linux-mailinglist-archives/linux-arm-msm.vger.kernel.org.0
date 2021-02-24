Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B1132471E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 23:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbhBXWsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 17:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbhBXWse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 17:48:34 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA4FC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 14:47:53 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a17so4349806ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 14:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+EhLULxHZtitYfJyrWghw0Pq73IBIvjg1EFWi426yM=;
        b=FNuIaQkFNcTljA8L+euAvwQe9NOI39JuUyYd//d+ETVwXIw5tVlrkc0vQ5nKN7IEYK
         5jVJuYAZQMMNTNqmaan1oDd7HFVLMRRZpNTSwDr3AHHDpGNVbWDoe3bPQ/XisdngLf32
         AZGyUzqZHbcuKmcIYYLGs5Oq1yf/VHOM43paZf1hzeLWZrRrQK+LPun8mhel6q4S11aF
         sjte4dNRVEERb7MTkw1z6Ocp5nk6EBqhOFgiPa3LFV6dYFnWwKOhCnfPssLRTTIQTbsd
         jfQXfRPYeltbNrUP9y7bdWC0X+IVnxjsjT6R4yE7jGgTA1IEOr/LanX6sw0KSalOiIg7
         0v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L+EhLULxHZtitYfJyrWghw0Pq73IBIvjg1EFWi426yM=;
        b=f3ub5e1IXopLNnzaaGkOU+Aek0BcbI3qyHhVLM0qGiSEJex6FETDat262uC6QsYB+O
         +sVLIFrLzuqu4pvYH1NAXJkG9YBmtyP0wUQ9EA9oFjLzLmnZtHcT/7SErzm9O8gHrVA7
         d9s8Gh+GXaYK9mK+IcsT9Zdvo/aLB8GUbobAFQ3KgJABh5yxf4My0+k+4NkN3lnMicWj
         Q1v6jRpRaEs1cgTKCd12sv1A+J1sz/mYArpXhDwU33eSG+4h/Z0dzY6YzTEdxzfgKjsD
         bjTeKlOm+z1mWOm4I9mK4T4hRRnxbBMUMRkdCU9rPS502Owa3OTfHjOa6r/kjCm56Z8J
         +lCg==
X-Gm-Message-State: AOAM5312yq447ymHHtJvG18HEozX3X5aEalBWHDZeS9uZE4E5T0CE3Cl
        6YO9qzgMXavXTiSZv0/lS3SSYed/drw1iw==
X-Google-Smtp-Source: ABdhPJxinUEQTILi+fIEftaSVri/anqPPkKu31M5Kgq0bodMglUL6YY2TRonGFWkgsiUQNElLeMNwA==
X-Received: by 2002:a2e:7202:: with SMTP id n2mr26874ljc.17.1614206872325;
        Wed, 24 Feb 2021 14:47:52 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h11sm766702lfd.243.2021.02.24.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 14:47:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
Date:   Thu, 25 Feb 2021 01:47:51 +0300
Message-Id: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix setting min/max DSI PLL rate for the V4.1 7nm DSI PLL (used on
sm8250). Current code checks for pll->type before it is set (as it is
set in the msm_dsi_pll_init() after calling device-specific functions.

Cc: Jonathan Marek <jonathan@marek.ca>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     | 2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     | 6 ++++--
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
index a45fe95aff49..3dc65877fa10 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
@@ -163,7 +163,7 @@ struct msm_dsi_pll *msm_dsi_pll_init(struct platform_device *pdev,
 		break;
 	case MSM_DSI_PHY_7NM:
 	case MSM_DSI_PHY_7NM_V4_1:
-		pll = msm_dsi_pll_7nm_init(pdev, id);
+		pll = msm_dsi_pll_7nm_init(pdev, type, id);
 		break;
 	default:
 		pll = ERR_PTR(-ENXIO);
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
index 3405982a092c..bbecb1de5678 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
@@ -117,10 +117,12 @@ msm_dsi_pll_10nm_init(struct platform_device *pdev, int id)
 }
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_7NM_PHY
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id);
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id);
 #else
 static inline struct msm_dsi_pll *
-msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id)
 {
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 93bf142e4a4e..c1f6708367ae 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -852,7 +852,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm)
 	return ret;
 }
 
-struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
+struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev,
+					enum msm_dsi_phy_type type, int id)
 {
 	struct dsi_pll_7nm *pll_7nm;
 	struct msm_dsi_pll *pll;
@@ -885,7 +886,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll = &pll_7nm->base;
 	pll->min_rate = 1000000000UL;
 	pll->max_rate = 3500000000UL;
-	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
+	if (type == MSM_DSI_PHY_7NM_V4_1) {
 		pll->min_rate = 600000000UL;
 		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
-- 
2.30.0

