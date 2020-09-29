Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A5A27B8C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 02:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgI2ASQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 20:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgI2ASP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 20:18:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65B9C061755;
        Mon, 28 Sep 2020 17:18:15 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so2776364pfn.9;
        Mon, 28 Sep 2020 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oy1aXlDPXrReF1gBpu82DpN2M0nTMmLTwJqtxAH2mCA=;
        b=gSZGDzL313qgnP9EOczNvz/gNDSAfTjbal1eD50rvCr3AiMcjMnYFcl0d0P5zY7clH
         wIWgqQtLsZ8WRVQ88FbJ64AbDkRyJSc0KgYIMTCZfRjHyQh7TCmOKFQ32elgcbIVZjZV
         XMAwl9JduHCTFpRahOlb5LODeoyTEftVTmgFCvMBq7Haef6PdNSrm9+o80fII+WcxCAT
         51Ftexs7DNsOieK+sQFcphWmgJMV5RYLsdxQG9ze3Qt9MItWm3Uu5sUwVQZ4M/5Ol8v2
         5bQmab8sY/LaxAZuaGWyIzHzaL1v3Utg1U8wG/H58rD7ohWpWATgZpSpnMaIApmoaaMq
         1boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oy1aXlDPXrReF1gBpu82DpN2M0nTMmLTwJqtxAH2mCA=;
        b=OZMIi9jXwo+Q2+5DpTTFEthIMP9CCMafFang2cFqHmF00IqYsqO37pOP7cDlxeYeIX
         EK8DnEenowiAUeaL652RkeueOZX0njZYrIAoUYr465HSwioGpzqdAIeWYwIpQlb9/Cjo
         w3l8I0Ev74SNzk+TlprvFVZ7++ABejcKG516WmWjURA1bZkXQzqTSXmiNAsTRjXA6WPk
         tY1PxfcEbdDLh6zO9aW9NUXFPqneUIu9HkAuFOP9D9NaxqxYJ1jEgCBvZunVMCgoR2U7
         IxBP3Gf49k7BNEAMMDs3AqM5Cil0WrqgSvppjNT1CGrJsElH6nYOpJjEnrd6/CXo4hkU
         4TGQ==
X-Gm-Message-State: AOAM5316oHHwxf1Fldk/O/SUZNb9ghV2w9hVpqRajTRwvvkDU7Ag4i8A
        sqZc4GVfubqT+YOsrmeDHGw=
X-Google-Smtp-Source: ABdhPJx9B+EigXOvBOeQtwn7+Eryj+DGPRHycZtoFvJRN16DN8hlDsLfqlEYL5HT43IpE3C2I1JwsA==
X-Received: by 2002:aa7:9e4e:0:b029:13c:1611:6589 with SMTP id z14-20020aa79e4e0000b029013c16116589mr1765820pfq.6.1601338695189;
        Mon, 28 Sep 2020 17:18:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id a74sm2939486pfa.16.2020.09.28.17.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 17:18:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: fix 32b build warns
Date:   Mon, 28 Sep 2020 17:19:12 -0700
Message-Id: <20200929001925.2916984-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Neither of these code-paths apply to older 32b devices, but it is rude
to introduce warnings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index fd8f491f2e48..458b5b26d3c2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -209,7 +209,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	size = iommu->geometry.aperture_end - start + 1;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu",
-		start & GENMASK(48, 0), size);
+		start & GENMASK_ULL(48, 0), size);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 029cc8bf5a04..de0dfb815125 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -879,7 +879,7 @@ struct msm_dsi_pll *msm_dsi_pll_7nm_init(struct platform_device *pdev, int id)
 	pll->max_rate = 3500000000UL;
 	if (pll->type == MSM_DSI_PHY_7NM_V4_1) {
 		pll->min_rate = 600000000UL;
-		pll->max_rate = 5000000000UL;
+		pll->max_rate = (unsigned long)5000000000ULL;
 		/* workaround for max rate overflowing on 32-bit builds: */
 		pll->max_rate = max(pll->max_rate, 0xffffffffUL);
 	}
-- 
2.26.2

