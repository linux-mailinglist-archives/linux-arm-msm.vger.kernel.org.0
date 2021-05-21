Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241C638C711
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbhEUMwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:52:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235021AbhEUMw2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:52:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E14876128A;
        Fri, 21 May 2021 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621601465;
        bh=eVVDh8nCN1Yb9AXj+WoqxP1WMiIq4cunVQYwXJ411+s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FB68gwgtGq+RZ4lPSxPU+13XhnB3Z1HeAi0q79m3DM6PjhpWtWjDip5fcFjxrhvM+
         ol7wYkrEr/NS9MtlEPiMHD5yeRWP/rNHxZq/8s5zBSsycfFi/dKlY8U7G7Vp9LFHDK
         0TPbbcvegHUcB+CFnPLq3eobXs3T2Qh0NrwKe3TXRhEBu9bWPlTlhlsmWZpbGuHNKV
         d+puPRLs5D9EuQjNB2ZGpFT8MHAOlRq50wK0+8TfTxTFhFHVKNumlwUfWr11TapcJp
         OHdKcxj4MVyXluooa23nXv8aiPKvyA1FHPCfRmUVf4GRGlqYtATn9Rt5czTjmcvivR
         q+TIbdNhsEpaQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 11/13] drm/msm/disp/dpu1: Add support for DSC in topology
Date:   Fri, 21 May 2021 18:19:44 +0530
Message-Id: <20210521124946.3617862-16-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For DSC to work we typically need a 2,2,1 configuration. This should
suffice for resolutions upto 4k. For more resolutions like 8k this won't
work.

Furthermore, we can use 1 DSC encoder in lesser resulutions, but that is
not power efficient according to Abhinav, so it is recommended to always
use 2 encoders.

So for now we blindly create 2,2,1 topology when DSC is enabled

Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 18cb1274a8bb..bffb40085c67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -609,8 +609,22 @@ static struct msm_display_topology dpu_encoder_get_topology(
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
2.26.3

