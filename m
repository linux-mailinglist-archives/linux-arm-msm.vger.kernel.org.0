Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5542CFF944
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2019 12:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfKQLso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Nov 2019 06:48:44 -0500
Received: from onstation.org ([52.200.56.107]:38758 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbfKQLsm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Nov 2019 06:48:42 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id DAA034FE4B;
        Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573991321;
        bh=rl6/6/Eu9skt4+IcmxvISu1bBxwQsQboq/5RVDZniic=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=le+c7mmslEwZqMNGy37bnORfMaWTTpxN3JKvaDGIwpg++SdQqlGzGx3oBKuw7DZz+
         U9wXQ6h///rjUt9SzUsCQKrvmoPemstl+qpSVk3E+51jYjuzN75M4CqfAkfVpH/rSc
         kk3vlXgixVujTB906XcAlQFL4QAVtsoCcOZzTJVU=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] drm/msm/a4xx: set interconnect bandwidth vote
Date:   Sun, 17 Nov 2019 06:48:25 -0500
Message-Id: <20191117114825.13541-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117114825.13541-1-masneyb@onstation.org>
References: <20191117114825.13541-1-masneyb@onstation.org>
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
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index b01388a9e89e..c631d1df7751 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -591,6 +591,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 		goto fail;
 	}
 
+	/*
+	 * Set the ICC path to maximum speed for now by multiplying the fastest
+	 * frequency by the bus width (8). We'll want to scale this later on to
+	 * improve battery life.
+	 */
+	icc_set_bw(gpu->gfx_mem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
+
 	return gpu;
 
 fail:
-- 
2.21.0

