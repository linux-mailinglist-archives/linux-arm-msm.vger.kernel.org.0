Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471914B96D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbiBQDpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:45:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiBQDpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:45:21 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8E029C138
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:45:06 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id o6so6359540ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dysF/AP9QrJMWquX5SIkWcaQNfAWXARtu2Y4zNfbQ6Y=;
        b=rfKoIO/TT0FpbBVRgmJfnMsCvEmVCEunaz/kfpFZYAHnEjxFUgxcRn1yUIRvovksaZ
         DPkxdpMLFLpZy1IZ2fVtV3qpo+0GYk3gCtuqYezuvY3ykyxYvd5RmhoLWu1IjEFFWGLh
         NZVnoYNn4G9L7Wdv0fTE67lJFr11EO1tfPeUFy57IvJ3sbaqSZ438/0UvniSUUEHrLh1
         G3ps85iIUOuizIMBF8clZrlJZT6Ec5kfo6REQgSucJQr28gXnLhlaE3L8/MUb7shYDmQ
         86S1F2M6Ajc96UPr0yB8+/+jcVzb4ce1LEh+7wxa7nlOUb2cwABxlTQ3GruYfMO3cMw0
         cyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dysF/AP9QrJMWquX5SIkWcaQNfAWXARtu2Y4zNfbQ6Y=;
        b=xp1r1z2hLz+FbD1UB/Fu47eP2THReJqngxYIcyin8LYcQlDoYogz329l1zzOB8KtLm
         X1/y+PNuaSPJqLDFg/D500YvkVopaeyf14Fdb1DH/f2ENXCJlErbdnkuBcs/3g/wCf1V
         AfKdQXu/HZkhqOoQinj3QNl6BtEzm/B1WNtDFNJApMy64U3fuT3+GZfSyyuv1DGtciIc
         VN678EPt79rDdxgkBSYDi3sixJSy86cfIR0k8TQynESKvQFZ/khzdKBzHQdtO1ZOxPEg
         GYcbgEjivwybaVRKMhp5QAroZjJU2hQAENxlTJK/jOeciBaaxBWUB8QHcsJtHM2ziacH
         OslA==
X-Gm-Message-State: AOAM533hwEfquZKlrU59oI6JOPNe1M8zqK9LnwIFyuYw6BKQlXTsEz2R
        T4F/38I8vgjZpeyp0rzYU+ZpIg==
X-Google-Smtp-Source: ABdhPJzfd57r9AWVvQJ8QO+NOokrQNuI0VwdfIaOHr76fIVGnFwYUeNEfRwB6fP+WoBxyt3FZ44uWg==
X-Received: by 2002:a05:651c:307:b0:244:c6a1:167d with SMTP id a7-20020a05651c030700b00244c6a1167dmr833196ljp.263.1645069504902;
        Wed, 16 Feb 2022 19:45:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25sm822268lfc.22.2022.02.16.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:45:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/dpu: drop VBIF indices
Date:   Thu, 17 Feb 2022 06:45:02 +0300
Message-Id: <20220217034502.464312-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 36 ++++++++++++-------
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa4d20762ccb..dbb853042aa0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1115,7 +1115,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 
 static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
@@ -1144,7 +1144,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 
 static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	{
-	.name = "vbif_0", .id = VBIF_0,
+	.name = "vbif_rt", .id = VBIF_RT,
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index bb9ceadeb0bb..598c201ae50d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -254,11 +254,9 @@ enum dpu_wd_timer {
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
index cbbf77b17fc3..c011d4ab6acc 100644
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
2.34.1

