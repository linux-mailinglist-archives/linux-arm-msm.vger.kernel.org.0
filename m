Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020EF708DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjESCjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjESCjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:39:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789D4E5C
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:02 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac90178fdaso29444071fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463940; x=1687055940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7sWPUpXfit0IoHIN18zicq6x1U5u52TuWmEQf6/nWw=;
        b=xV85jzsFFtv4tR92o8EmSj3uFs3pm9eyAExQSKLqdoVq28bZS8S5OFGuOEnMP3iG8D
         IDKyRBJbZypHG70kv2fq7B25/Gvu7VEoWs9S88gBXwTz9/K+LOiBrbNTftV+du+ElVbb
         ugLq5vx6TtPCTdxSaseF+zeW0suwTYAGaSUtyB/cVmiiH2vuUeDVEwroy6Hu3JyJQcQ/
         yhSGpZeLyNXgD+iMWUjmIU1PjAkwaUgwf838rfFn9pL0JxEeNhs7g7T3FcvjksllZViN
         F4f1mA1YDAvZJSVrSNmz7ursOMnTVva3JocevUhBXUdnUrh90bSEbdwS1gXMei3Ul+pk
         HqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463940; x=1687055940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7sWPUpXfit0IoHIN18zicq6x1U5u52TuWmEQf6/nWw=;
        b=DiZej/s7naxsz2yjzvtgCF0E5eP0+RvU/n3HG2vyyH4EWA/aKRsDRPypqwtQoLlZvU
         wQWi8NvnZU7SgfJNMivzhStq+O4v818mR3MPlMXU5CJohp8dxlAa0qzQLt41yZRu6WnM
         EdrCYG7bW4tI6kHg29udxVrxAnIxfSdkw/zSu780I8OvLmU7Q7HqeD0ygniAuCeUHX2l
         +n4ycboAY/uYHYdPNYqUXRW9YfaH4C7o7NDkTTU1ZB5SmYKmN4Cs412gvu3ObcsofcX7
         KLYMeK9pnrtPxmo19uTjECc/+b/PJiOAjqgGVavL+pijNBeXWkVl1Xrxut7aZ+rtfofd
         cMJg==
X-Gm-Message-State: AC+VfDxbfn71ZTz0GTe529GhSrS1k9RqyeLBQLRnSUxx40cLBStC/KJa
        qkYddJZuDPnXfWKHqP20Z/+RDA==
X-Google-Smtp-Source: ACHHUZ7Lmh5aWwN4XRdeO1owFS5AI09jNusSmFbRCeT4Hv/ZFCDKBmYi6CrWJpmjgdA+1qcwCuOlkw==
X-Received: by 2002:a2e:80d7:0:b0:2a8:dce8:2d13 with SMTP id r23-20020a2e80d7000000b002a8dce82d13mr156488ljg.14.1684463940734;
        Thu, 18 May 2023 19:39:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:39:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
Date:   Fri, 19 May 2023 05:38:53 +0300
Message-Id: <20230519023855.3840907-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little sense to get intf index just to call dpu_rm_get_intf()
on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 92e915bcf88a..c72b7445db97 100644
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
@@ -2251,7 +2252,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
-		enum dpu_intf intf_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2265,12 +2265,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
@@ -2294,7 +2291,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 			break;
 		}
-
 	}
 
 	mutex_unlock(&dpu_enc->enc_lock);
-- 
2.39.2

