Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13D4C105E36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 02:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfKVB1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 20:27:08 -0500
Received: from onstation.org ([52.200.56.107]:33758 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbfKVB06 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 20:26:58 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 520EE44FD1;
        Fri, 22 Nov 2019 01:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1574386017;
        bh=CaHmDoZDSt9WG3Xh0TDc9eDdYCzbqbU5vHcj3IO1lu0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GN0IQztcelqBojl8jngElPhqaUgYYVwdNdx6rSaSfGKXvjnQIiLR5EY8GXN+B6p9x
         QElEUWKiMyJhh94Skdk7WKReEJTsODd6/jdNf3U186jNDhQbtiaRxteSUfdSj9rMLG
         9ggH34S1rwsjj+Bfx+vh82oy6yXsomeMc0Dwtc/A=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] drm/msm/gpu: add support for ocmem interconnect path
Date:   Thu, 21 Nov 2019 20:26:43 -0500
Message-Id: <20191122012645.7430-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
and must use the On Chip MEMory (OCMEM) in order to be functional.
There's a separate interconnect path that needs to be setup to OCMEM.
Add support for this second path to the GPU core.

In the downstream MSM 3.4 sources, the two interconnect paths for the
GPU are between:

  - MSM_BUS_MASTER_GRAPHICS_3D and MSM_BUS_SLAVE_EBI_CH0
  - MSM_BUS_MASTER_V_OCMEM_GFX3D and MSM_BUS_SLAVE_OCMEM

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0783e4b5486a..d27bdc999777 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -887,10 +887,21 @@ static int adreno_get_pwrlevels(struct device *dev,
 	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
 
 	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, NULL);
+	gpu->icc_path = of_icc_get(dev, "gfx-mem");
+	if (!gpu->icc_path) {
+		/*
+		 * Keep compatbility with device trees that don't have an
+		 * interconnect-names property.
+		 */
+		gpu->icc_path = of_icc_get(dev, NULL);
+	}
 	if (IS_ERR(gpu->icc_path))
 		gpu->icc_path = NULL;
 
+	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
+	if (IS_ERR(gpu->ocmem_icc_path))
+		gpu->ocmem_icc_path = NULL;
+
 	return 0;
 }
 
@@ -977,6 +988,7 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 		release_firmware(adreno_gpu->fw[i]);
 
 	icc_put(gpu->icc_path);
+	icc_put(gpu->ocmem_icc_path);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index ab8f0f9c9dc8..be5bc2e8425c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -111,8 +111,15 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
+	/* The gfx-mem interconnect path that's used by all GPU types. */
 	struct icc_path *icc_path;
 
+	/*
+	 * Second interconnect path for some A3xx and all A4xx GPUs to the
+	 * On Chip MEMory (OCMEM).
+	 */
+	struct icc_path *ocmem_icc_path;
+
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.21.0

