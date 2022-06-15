Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA21A54C944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 14:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349368AbiFOM5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 08:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349609AbiFOM5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 08:57:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FC442496
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h36so55916lfv.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59AyhIm0oQw9qERL0mlbbIIwRpFuDUxi5K6ieHsH2Ww=;
        b=NWPjh8OnGbqhIOvDhKj3a2bwdp6/fzFLkeMDBgILR0qJc3ySGN5Xv8BdyIl68S4eD7
         gKwVO2nbXfm60ryYV751BgLZy4C2JtE8W5F28Ms421TO+SGsfB48t4GAXUB9XePrjRKj
         knWq8LiIL3RxNiSHT/WgLjVN14GdQK/MRZik86maAUQawDI9qNFZShFumDNjBUbV8Avk
         Li5DuD5hTUZBTkTBZV744nlSYxsYDWhfjWV0DR8yfbBlNOvvZ/vgPZyfC1O371nYkZD1
         1dT2NIixUyh3GmnWM942JajjeuRZOGIqd+Q7hN5KV19tT+j9AHBrprtmEwWHPwVFZLua
         STBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59AyhIm0oQw9qERL0mlbbIIwRpFuDUxi5K6ieHsH2Ww=;
        b=xvTMuWwr5q9V6f11+PnuRWSTUxA9gChxlMgH6r+FKy/H1zsU81ML4LaBb1tN6Pn1oO
         ndwOY+LdGIjEEYqFsWAzuvwedsclvTDHLBOYmoh2rDEb2ryATpn6BzuzKiQyXk3wwozt
         SPXYsbjwqP5t6KB4ImTSrQoB4WJU9inHYTrQWEsevIKXO8i5IXwvcwdDCQjqmHCgz44W
         It4drF6uxqlSyoV2iMJ1tUM9LC6h7hQr18e8okHu+cKQ68rD7Uw0p1c6dawTBlqtDzbN
         hLPq6kzGAEyv/KvlTnJubLM4W8NI9O77KgqJaEC56R92ykklGu4Iu83kiVn0/hJsRGCX
         9h7A==
X-Gm-Message-State: AJIora/c+bRIBFsPF7pzXxKuS8foEOqzG8fs0JTYo6dYFREc0Vj0Annx
        bmojGB//QXxwB7QiRBZsZIsDDA==
X-Google-Smtp-Source: AGRyM1sobDSLJiTE3sKoiB3uO30zK351+bzfWrw+1uC3STytPVK143wxxDhmGZBodZj28kSgrPkOig==
X-Received: by 2002:a05:6512:3d22:b0:479:4ac2:14e9 with SMTP id d34-20020a0565123d2200b004794ac214e9mr5839068lfv.38.1655297825807;
        Wed, 15 Jun 2022 05:57:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651220cd00b0047255d21100sm1798013lfr.47.2022.06.15.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 05:57:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/msm/dpu: drop VBIF indices
Date:   Wed, 15 Jun 2022 15:57:03 +0300
Message-Id: <20220615125703.24647-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
References: <20220615125703.24647-1-dmitry.baryshkov@linaro.org>
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

We do not expect to have other VBIFs. Drop VBIF_n indices and always use
VBIF_RT and VBIF_NRT.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 36 ++++++++++++-------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 400ebceb56bb..f854889ea7fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1330,7 +1330,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
@@ -1359,7 +1359,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 
 static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 9f402be55fbf..d3b0ed0a9c6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -273,11 +273,9 @@ enum dpu_wd_timer {
 };
 
 enum dpu_vbif {
-	VBIF_0,
-	VBIF_1,
+	VBIF_RT,
+	VBIF_NRT,
 	VBIF_MAX,
-	VBIF_RT = VBIF_0,
-	VBIF_NRT = VBIF_1
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index a18fb649301c..1305e250b71e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -19,6 +19,18 @@ static struct dpu_hw_vbif *dpu_get_vbif(struct dpu_kms *dpu_kms, enum dpu_vbif v
 	return NULL;
 }
 
+static const char *dpu_vbif_name(enum dpu_vbif idx)
+{
+	switch (idx) {
+	case VBIF_RT:
+		return "VBIF_RT";
+	case VBIF_NRT:
+		return "VBIF_NRT";
+	default:
+		return "??";
+	}
+}
+
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -50,12 +62,12 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 
 	if (!status) {
 		rc = -ETIMEDOUT;
-		DPU_ERROR("VBIF %d client %d not halting. TIMEDOUT.\n",
-				vbif->idx - VBIF_0, xin_id);
+		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	} else {
 		rc = 0;
-		DRM_DEBUG_ATOMIC("VBIF %d client %d is halted\n",
-				vbif->idx - VBIF_0, xin_id);
+		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
+				dpu_vbif_name(vbif->idx), xin_id);
 	}
 
 	return rc;
@@ -95,8 +107,8 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
-			vbif->idx - VBIF_0, params->xin_id,
+	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+			dpu_vbif_name(vbif->idx), params->xin_id,
 			params->width, params->height, params->frame_rate,
 			pps, *ot_lim);
 }
@@ -141,8 +153,8 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DRM_DEBUG_ATOMIC("vbif:%d xin:%d ot_lim:%d\n",
-			vbif->idx - VBIF_0, params->xin_id, ot_lim);
+	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
+			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
 	return ot_lim;
 }
 
@@ -242,8 +254,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DRM_DEBUG_ATOMIC("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
+		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
+				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
@@ -263,8 +275,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 		if (vbif && vbif->ops.clear_errors) {
 			vbif->ops.clear_errors(vbif, &pnd, &src);
 			if (pnd || src) {
-				DRM_DEBUG_KMS("VBIF %d: pnd 0x%X, src 0x%X\n",
-					      vbif->idx - VBIF_0, pnd, src);
+				DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
+					      dpu_vbif_name(vbif->idx), pnd, src);
 			}
 		}
 	}
-- 
2.35.1

