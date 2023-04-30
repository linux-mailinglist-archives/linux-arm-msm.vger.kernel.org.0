Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224BD6F2BC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 01:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbjD3X7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 19:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbjD3X5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 19:57:41 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C6911C
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:39 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8b62cfaceso19410311fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682899057; x=1685491057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF8t/AqUo8Et5YKjy/byNCQSRCIaffjpRgyw3XVjfmw=;
        b=QjKcw9PcK6Kgfb0y+sw37x42bYfUOduEdZWMANbSeqoKaKJ2Cq58EFuVWK4bztOGpj
         2eGccbFnH4P6ESgxVGl+06h2tjl4WD1kfs5YJqGyAKQZxOqJSB0HyrnsbUXghslMmwoD
         RzcB8HTo/dsoJpFhfugH8s0Qk64sOT8ZZ4BAmidrqbYDrUUGvp9dTDrAeUpr9HqAUN8a
         QrZHGBH1fAA3pb6VA91UqNSYbTqLGqzAv5K/PLvWvWOTY2rloNvbIhPFl+tKKBvQ4Nj/
         3RxIzWvpc2PsfHr53VA20JP6yO07GwDMleTgW6Gg9gHzIxXa1n343ge10DqADPELZOFa
         fXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899057; x=1685491057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF8t/AqUo8Et5YKjy/byNCQSRCIaffjpRgyw3XVjfmw=;
        b=A+bCzEfEv8dc+lZogF2Asdh5u5/18PR3Oe2Y7gJu7uJKlhq/OKDgH/39QV8bfcy+M+
         AVjbi8I7OfswVxKMxnMTszD93u19O/DXlx6dKJUJjNdoDkp54ozj+Ztv1xhL9TqNHY6i
         jLkVDI47vlH2yU/Cih3rzt1aChMimWTWZ7Qr6O9yyvFd81D0ZDvCziXgOfndG8GZ9rvX
         oVL5jwne/ezg7kOH15JINAN1CehN/sBaLB4ojeBdn2fPEGbg8P3juEb8P0R6FwPDlzuu
         bzxFRQFsca08Y1xm7FQxf8++5+ZOR2inCb0y+w/gpIt1Cc2qfOpdmsgMFeAMalAN4QbC
         fTBw==
X-Gm-Message-State: AC+VfDwQrE3POq7uG5V+1NeVoUBHqw8LYDrP3NsieyweQVL9Jb3fugIK
        2ODV8PgurrxqR2RgOUWKCibyug==
X-Google-Smtp-Source: ACHHUZ5pQA+YPfuuFGC/gCLC7LzvMxGCuI1H+TScUYyIJiA/O5q0GqqtPofPj7Kwp3/KRQ+DpJT5gQ==
X-Received: by 2002:a2e:7818:0:b0:2a8:baab:fb2e with SMTP id t24-20020a2e7818000000b002a8baabfb2emr3566936ljc.47.1682899057790;
        Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 6/7] drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
Date:   Mon,  1 May 2023 02:57:31 +0300
Message-Id: <20230430235732.3341119-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little sense to get intf index just to call dpu_rm_get_intf()
on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 507ff3f88c67..b35e92c658ad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1259,22 +1259,23 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+		struct dpu_rm *dpu_rm,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
 
 	if (type == INTF_WB)
-		return INTF_MAX;
+		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == type
 		    && catalog->intf[i].controller_id == controller_id) {
-			return catalog->intf[i].id;
+			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
 	}
 
-	return INTF_MAX;
+	return NULL;
 }
 
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
@@ -2244,7 +2245,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
-		enum dpu_intf intf_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2258,12 +2258,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
-							    disp_info->intf_type,
-							    controller_id);
-
-		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
-			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
+		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
+							   disp_info->intf_type,
+							   controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
@@ -2287,7 +2284,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 			break;
 		}
-
 	}
 
 	mutex_unlock(&dpu_enc->enc_lock);
-- 
2.39.2

