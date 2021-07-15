Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285483C9923
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 08:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhGOG4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 02:56:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239636AbhGOG4D (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 02:56:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 978026117A;
        Thu, 15 Jul 2021 06:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626331991;
        bh=R4oQOomA8Ok/mNiwcSkcXhUgjl0dzN7G+Iv9LqLtcyI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HGqcNWA0Cq+fYE9hv4SNYQ5hklXh4lnZWTj0DFfm8gBPSfmIVoIpR1wns12zrYnBk
         iLXd6C37MhC4m7sYiSN9JXIZANsTm7C/3W4WBWtOqyGjY/kN0nxGIR8kU82Qg/HD2l
         SXxy7KjFiZeIDdwkDxHL1SZG+rDG68gN6UvEDRvnqplEc284wmtJD4c2uloQ3YzJq4
         8RnEpQMJefeK43h8UYXcrQxBlBnmQT1XEYA58ZqKj8MINwN/oG2Yq4k2btwyoLYhgJ
         ttU0TvgJZAxO3rXiGKNTY3SiPXt8gPmQyIK6LZnpEojz5PU1WfMjXdpMyIxLkvvf9Z
         8pcmaqodP9bXQ==
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
Subject: [PATCH 09/11] drm/msm/disp/dpu1: Add support for DSC in topology
Date:   Thu, 15 Jul 2021 12:22:01 +0530
Message-Id: <20210715065203.709914-10-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715065203.709914-1-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions upto 4k. For more resolutions like 8k this won't
work.

The topology information is provided by DTS so we try to deduce the
topology required for DSC.
Furthermore, we can use 1 DSC encoder in lesser resolutions, but that is
not power efficient according to Abhinav, it is better to use 2 mixers
as that will split width/2 and is proven to be power efficient.

Also, the panel has been tested only with 2,2,1 configuration, so for
now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since RFC:
 - Add more details in changelog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 41140b781e66..8f0a8bd9c8ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -573,6 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology = {0};
+	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv;
 	int i, intf_count = 0;
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
@@ -607,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	topology.num_enc = 0;
 	topology.num_intf = intf_count;
 
+	drm_enc = &dpu_enc->base;
+	priv = drm_enc->dev->dev_private;
+	if (priv && priv->dsc) {
+		/* In case of Display Stream Compression DSC, we would use
+		 * 2 encoders, 2 line mixers and 1 interface
+		 * this is power optimal and can drive upto (including) 4k
+		 * screens
+		 */
+		topology.num_enc = 2;
+		topology.num_intf = 1;
+		topology.num_lm = 2;
+	}
+
 	return topology;
 }
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-- 
2.31.1

