Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8569F452ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 07:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbhKPG3p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 01:29:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:59462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230493AbhKPG1W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 01:27:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1A0A614C8;
        Tue, 16 Nov 2021 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637043859;
        bh=9JLy3WeI3hgc2qnNfS8pLzvLY1KoU8y2UppMi4uDgCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lIE+cuBE1w+gB4DcCAS23QNvS0s7yNtJ+xSSx7MePAr7MPgSR4PZQ+oUTpOhUr7Rn
         yI4FazZa9ZPze5BbfCFWX5swFod8ITxDnAozbdsEoMouFAt+po9AdK7TMP9CyjXlkf
         ixGlBgoHJ/IM3b/YZ7I9yg2LwDU8y4wdZi/GeDQ3a+qtS15kzl3kOR07W8DP5KIxJF
         kYlQ4rrHBjq9gS5AvdPO/6SASJtEGiIROg8Yvj6NIfrCS0MB0PfIqeOPPu8XAEp6HA
         4PMz9oMHo4SZwQaPjkPUzhiL/zMK5JEeLf1BJey4veRdqPBUWssvZ/xKL/S56DjFAr
         xufKpabs2Eoww==
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
Subject: [PATCH v3 13/13] drm/msm/dsi: Pass DSC params to drm_panel
Date:   Tue, 16 Nov 2021 11:52:56 +0530
Message-Id: <20211116062256.2417186-14-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116062256.2417186-1-vkoul@kernel.org>
References: <20211116062256.2417186-1-vkoul@kernel.org>
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
index 2c14c36f0b3d..3d5773fcf496 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2159,11 +2159,25 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	struct msm_drm_private *priv;
+	struct drm_panel *panel;
 	int ret;
 
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

