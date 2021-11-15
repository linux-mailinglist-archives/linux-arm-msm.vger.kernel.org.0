Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B2E450270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 11:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237566AbhKOK1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 05:27:42 -0500
Received: from out0.migadu.com ([94.23.1.103]:39348 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237582AbhKOK1l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 05:27:41 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1636971881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Cz3g4Xx4a1qWFGtMUnYFptcAg79/8gM3RKl+Oky5ivU=;
        b=U5IBmBfva1AYPklYbaTkZo/2MYAbBdnkARowj8D+mGnvATdjZq3+ZuHz+O5qIetjsxxCka
        BT+3r4L4CJ2K7va0XepGC848A1PRXVLmOKwX2G8B8GsZckZXbdJaF1a9peD1SeUUHo0UhY
        RsLNraK2OyaVRyhwMtnCpAfC1j5LU1Y=
From:   Jackie Liu <liu.yun@linux.dev>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        jsanka@codeaurora.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/dp: remove deadcode on dpu_encoder_setup
Date:   Mon, 15 Nov 2021 18:24:11 +0800
Message-Id: <20211115102411.2578262-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

Nobody care about drm_enc on dpu_encoder_setup, cleanup.

[...]
*** CID 1493979:  Possible Control flow issues  (DEADCODE)
/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: 2186 in dpu_encoder_setup()
2180
2181     	return ret;
2182
2183     fail:
2184     	DPU_ERROR("failed to create encoder\n");
2185     	if (drm_enc)
>>>     CID 1493979:  Possible Control flow issues  (DEADCODE)
>>>     Execution cannot reach this statement: "dpu_encoder_destroy(drm_enc);".
2186     		dpu_encoder_destroy(drm_enc);
2187
2188     	return ret;
2189
2190
2191     }
[...]

Addresses-Coverity: ("Logically dead code")
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e7ee4cfb8461..67c1a979ad98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2146,15 +2146,16 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
-	struct drm_encoder *drm_enc = NULL;
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 
 	dpu_enc = to_dpu_encoder_virt(enc);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
-	if (ret)
+	if (ret) {
+		DPU_ERROR("failed to create encoder\n");
 		goto fail;
+	}
 
 	atomic_set(&dpu_enc->frame_done_timeout_ms, 0);
 	timer_setup(&dpu_enc->frame_done_timer,
@@ -2178,16 +2179,8 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 
 	DPU_DEBUG_ENC(dpu_enc, "created\n");
 
-	return ret;
-
 fail:
-	DPU_ERROR("failed to create encoder\n");
-	if (drm_enc)
-		dpu_encoder_destroy(drm_enc);
-
 	return ret;
-
-
 }
 
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
-- 
2.25.1

