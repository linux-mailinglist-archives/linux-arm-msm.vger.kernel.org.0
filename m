Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4E53176CA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 03:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgCCCsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 21:48:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:43386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728237AbgCCCsA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 21:48:00 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 432FF24673;
        Tue,  3 Mar 2020 02:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583203680;
        bh=1nbaMWuIFAoLjoGhCKBHXRKpAcZ/Cxe1xzwNFvknask=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sYtOn8rr0XeBkam4CjYVj5OQ7U5opmHuNElLh+u95FAcgjAzfDbRPTNIxmu8oxTs1
         FI5laM7NqVVbXjQROslKEYN0FTEMbgoRjwzdG5w2MFAsZQpsQiE0L1yO3kp+NpKfEn
         RvbaAn/P9Qeo2IYV0UzWJx9JimRDWLE4+sMakXXg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 16/58] drm/msm/dsi: save pll state before dsi host is powered off
Date:   Mon,  2 Mar 2020 21:46:58 -0500
Message-Id: <20200303024740.9511-16-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303024740.9511-1-sashal@kernel.org>
References: <20200303024740.9511-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Harigovindan P <harigovi@codeaurora.org>

[ Upstream commit a1028dcfd0dd97884072288d0c8ed7f30399b528 ]

Save pll state before dsi host is powered off. Without this change
some register values gets resetted.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 +++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 355a60b4a536f..73127948f54d9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -479,6 +479,7 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct drm_panel *panel = msm_dsi->panel;
+	struct msm_dsi_pll *src_pll;
 	bool is_dual_dsi = IS_DUAL_DSI();
 	int ret;
 
@@ -519,6 +520,10 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
+	/* Save PLL status if it is a clock source */
+	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
+	msm_dsi_pll_save_state(src_pll);
+
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
 		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 3522863a4984f..21519229fe73a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -724,10 +724,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	if (!phy || !phy->cfg->ops.disable)
 		return;
 
-	/* Save PLL status if it is a clock source */
-	if (phy->usecase != MSM_DSI_PHY_SLAVE)
-		msm_dsi_pll_save_state(phy->pll);
-
 	phy->cfg->ops.disable(phy);
 
 	dsi_phy_regulator_disable(phy);
-- 
2.20.1

