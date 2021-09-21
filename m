Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFAC41377C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 18:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbhIUQYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 12:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhIUQYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 12:24:24 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E969C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:22:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id m3so80672310lfu.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PvMNvv3sYbU3IT6mahg4mt0FldiKwEFahBq/kmBwdgg=;
        b=g3Bp/l36yCXsaJDwrsykQTfOkJXTOU8gKVlNQbOv9S8KMhOHJ2WaPkIabsknTtxZ0X
         mN2tdJbCtgPrB4D129z/TFLWz0GZR583FE1Nh+qCRIAuo5UtzfrQ9na/etPLuQbssJ1z
         h/ioHUFgE8uQWHX2AH5mQTSIDdhBvafu6rHt0tPZnn7sCRNgXqW3zhR06IlJJsaoTykz
         Jn9mtJIL7LFfkJ2s1GwyD56dmP1oHJBgVh/TqRHKI81O8zUOh73and4beFJFS3uy2hXt
         EnxHPryNwbl3gPT/a/U7U089X08MOz2KkCXZWRsebR22PT3nKiIfemblRuALNWGrD0gP
         9ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PvMNvv3sYbU3IT6mahg4mt0FldiKwEFahBq/kmBwdgg=;
        b=nnKvAE9fCwNKSDjRaEqDM85wZ7M3M1Zd44je+Cd+GTNJY6DLrkNWcoYkT9d4I1XevD
         GU8aZ3wxcMY8LOYO+sYwB9z2pCoet1kP4w4DOhUigCct6dqLDxu8IvKGqu+sgVq0dfed
         cCnygVOLVlTYMOBmYRuorETc0yyjSTucKMhXoQTIqUkBo2IRTUD9LmzMw9v/jmKPkVfK
         A8h7siIhNraqHb/jIHkXFZGQz099mVHyIzXNW8hkkSciAXag4PgNt7rGFuhUL3VuLiNs
         GoRkOeZ2faguc8wIdTz72Hbakl2cQ4E/X7OkAjZBXkCemTKlSHM/jN2PHzvQ/nioXAPH
         PtmA==
X-Gm-Message-State: AOAM531MNyTmTCHbLd/4q4BjtR7mc8ug+kUzTiAV1wHgSi1U3G8Uif8j
        2OlAUVKQ8EFkTngPVnABDeVdPQ==
X-Google-Smtp-Source: ABdhPJwdRviDVzXDEdat1U8xrx4utFSsYpeLV1LWwpMpSY4cAPxvpzT4K9sj4c7yVu8H7X2fT4t/lQ==
X-Received: by 2002:a2e:5046:: with SMTP id v6mr9094222ljd.368.1632241366609;
        Tue, 21 Sep 2021 09:22:46 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v77sm1559567lfa.93.2021.09.21.09.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:22:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH] drm/msm/dsi/phy: fix clock names in 28nm_8960 phy
Date:   Tue, 21 Sep 2021 19:22:45 +0300
Message-Id: <20210921162245.1858118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from
dsi_pll_Nnm instances") mistakenly changed registered clock names. While
the platform is in progress of migration to using clock properties in
the dts rather than the global clock names, we should provide backwards
compatibility. Thus restore registerd global clock names.

Fixes: 9f91f22aafcd ("drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index aaa37456f4ee..71ed4aa0dc67 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -428,7 +428,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	bytediv->reg = pll_28nm->phy->pll_base + REG_DSI_28nm_8960_PHY_PLL_CTRL_9;
 
 	snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
-	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpllbyte", pll_28nm->phy->id + 1);
 
 	bytediv_init.name = clk_name;
 	bytediv_init.ops = &clk_bytediv_ops;
@@ -442,7 +442,7 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 		return ret;
 	provided_clocks[DSI_BYTE_PLL_CLK] = &bytediv->hw;
 
-	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id);
+	snprintf(clk_name, 32, "dsi%dpll", pll_28nm->phy->id + 1);
 	/* DIV3 */
 	hw = devm_clk_hw_register_divider(dev, clk_name,
 				parent_name, 0, pll_28nm->phy->pll_base +
-- 
2.30.2

