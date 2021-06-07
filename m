Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3712539DD00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 14:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhFGMyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 08:54:04 -0400
Received: from mail-m17639.qiye.163.com ([59.111.176.39]:17598 "EHLO
        mail-m17639.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbhFGMyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 08:54:03 -0400
Received: from ubuntu.localdomain (unknown [36.152.145.181])
        by mail-m17639.qiye.163.com (Hmail) with ESMTPA id CDF5A3800A3;
        Mon,  7 Jun 2021 20:52:09 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Bernard Zhao <bernard@vivo.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: cleanup coding style a bit
Date:   Mon,  7 Jun 2021 05:52:06 -0700
Message-Id: <20210607125208.22659-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQx1ITlZJTE5CHR1PTkxPTUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6Sgw*ED8UTg9KNCxPLhU6
        Iy8wCxBVSlVKTUlIS0xLSEhLT05OVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
        TklVSk9OVUpDSllXWQgBWUFJSktPNwY+
X-HM-Tid: 0a79e687cd20d994kuwscdf5a3800a3
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

cleanup coding style a bit

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 82bebb40234d..87e834850e44 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -655,13 +655,13 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	if (!pdev) {
 		DRM_DEV_ERROR(dev->dev, "no a4xx device\n");
 		ret = -ENXIO;
-		goto fail;
+		return ERR_PTR(ret);
 	}
 
 	a4xx_gpu = kzalloc(sizeof(*a4xx_gpu), GFP_KERNEL);
 	if (!a4xx_gpu) {
 		ret = -ENOMEM;
-		goto fail;
+		return ERR_PTR(ret);
 	}
 
 	adreno_gpu = &a4xx_gpu->base;
-- 
2.31.0

