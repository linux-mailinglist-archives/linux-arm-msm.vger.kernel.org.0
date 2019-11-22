Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E629B105E38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 02:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKVB1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 20:27:09 -0500
Received: from onstation.org ([52.200.56.107]:33778 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfKVB06 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 20:26:58 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B635A4FE48;
        Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1574386018;
        bh=fYnaunSzeUztsvg24uhUc/JRPip4E9qdhSh557hA/nU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TTtFu67dU3/KFQBtae+aBO0uLSAzgTr5FnJE+GZBdaoiarPaUndLiOBzZrOc2fvJO
         i69TN56y014l8kJYpBlMiVBKlaD8RDYEGANKpX+tBfGWaPBmEhX+z5MzVUfN61bd6X
         JRkOkA/CyORl2IfXmK7/7u1/nFDK2cXMNw0I3gqQ=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] drm/msm/a3xx: set interconnect bandwidth vote
Date:   Thu, 21 Nov 2019 20:26:44 -0500
Message-Id: <20191122012645.7430-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the two interconnect paths for the GPU to maximum speed for now to
work towards getting the GPU working upstream. We can revisit a later
time to optimize this for battery life.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 07ddcc529573..eff0ecd4e81a 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -504,6 +504,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "No memory protection without IOMMU\n");
 	}
 
+	/*
+	 * Set the ICC path to maximum speed for now by multiplying the fastest
+	 * frequency by the bus width (8). We'll want to scale this later on to
+	 * improve battery life.
+	 */
+	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+
 	return gpu;
 
 fail:
-- 
2.21.0

