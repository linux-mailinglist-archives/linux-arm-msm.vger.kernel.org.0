Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19154424DEA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 09:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240429AbhJGHMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 03:12:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240390AbhJGHMB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 03:12:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2115D61130;
        Thu,  7 Oct 2021 07:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633590608;
        bh=3vu4Bee7oRVtNEuAX+7MQpXOIM3UymsAieFKiYA33TY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WH1M949JZayrWDTDrn0QWRC4vV5vJAtuurxDdIjsju7GA4SWll78oHtm17CVb4ClI
         qXmB99IO5w++fH0Jow7Uq8J5+w3SvrRumejzGwh+R52jPh4AcgbU1nC/WIPbX+XRog
         8TeejPVOzD1TG5fiNvf/AKL1IVX3z33HijgMLcvx8Xbot1K6XbPo+HpLnRQTfjip4P
         OYXAnOpDRnkuudzmFqJy9ZpJcUJfwpsrNFxJEJyPARwzLexZ1bvJ58SoSWSIWWUmym
         s3NA/6wdX0NnsPl1oHziIWVBNb2RuCdjuPl8YbgyuJ7uEyrTakSO8RTRVaYghmUY7q
         4LGHjgTYuI63g==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 11/11] drm/msm/dsi: Pass DSC params to drm_panel
Date:   Thu,  7 Oct 2021 12:39:00 +0530
Message-Id: <20211007070900.456044-12-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When DSC is enabled, we need to pass the DSC parameters to panel driver
as well, so add a dsc parameter in panel and set it when DSC is enabled

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++++++++-
 include/drm/drm_panel.h            |  7 +++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 86e36a3e97b6..097827a6149c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2192,6 +2192,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	struct platform_device *pdev = msm_host->pdev;
 	struct msm_drm_private *priv;
+	struct drm_panel *panel;
 	int ret;
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
@@ -2211,8 +2212,21 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	}
 
 	msm_host->dev = dev;
+	panel = msm_dsi_host_get_panel(&msm_host->base);
 	priv = dev->dev_private;
-	priv->dsc = msm_host->dsc;
+
+	if (panel && panel->dsc) {
+		struct msm_display_dsc_config *dsc = priv->dsc;
+
+		if (!dsc) {
+			dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
+			if (!dsc)
+				return -ENOMEM;
+			dsc->drm = panel->dsc;
+			priv->dsc = dsc;
+			msm_host->dsc = dsc;
+		}
+	}
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4602f833eb51..eb8ae9bf32ed 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -171,6 +171,13 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @dsc:
+	 *
+	 * Panel DSC pps payload to be sent
+	 */
+	struct drm_dsc_config *dsc;
 };
 
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
-- 
2.31.1

