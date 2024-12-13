Return-Path: <linux-arm-msm+bounces-42131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B319F18A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D5F0188EBD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EFE1E885A;
	Fri, 13 Dec 2024 22:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwBos2H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE5195B37
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128092; cv=none; b=TD+ctVqUdvcKGjkZ6026mGIaytt+rB693+y13VOBAemyD4UVCqE2Lmc72Mtvs/y7x4qxuJXeEvMe3+Dbj5mj+pYrG6N44OfmLBs+pmyYp962SH6eArIYKhpoMJ8d7HAtyCdlLHRE17L76QPRls4Gk+V96I3Wyy/01ILTMjjHCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128092; c=relaxed/simple;
	bh=KiXfdgfeqKgTVNdjNXr3dsy1BJirVzYvM0m0vfoOcq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEF/Y7sP+T4uFCLoDK1WXaiQzZfcNGOM+7g6tPZ8olCLPM1zGAaX4TYmv2Ulq7x4bJNlEocSz+Jqg3hoHyfDk4jubCYqWNSmqNLwNYiWmCL+r2o4LLaTmTDfw8rUeNjlwOOVsApZEPcVFxzK10IhFzCqV6dAcIaCdjcIuZixSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwBos2H4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3022484d4e4so24156171fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128088; x=1734732888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFIunEH6NYw6O7UYyVNXbgbLmjHlOeVQmpSwSeHMBao=;
        b=OwBos2H4B9E58kTuHuiI+Ew2vDOPCvXekR/VCmief1ougrMdUmfIsdyqUrkSIxTn8Z
         ivkwut4rVyRdj1dbqzJ1B/avrrsDa7+HaHy7XT2DgG3QxapWlU+YqNoh1eWNX0al3bPJ
         bkAfHp5+/bO9BX9kau/rgxCprzpu1oU4//Tbf1Xs/te9ADircsU+5ZkK/VNtmqfm0IfR
         lIVycTDgMAKOH696ZSckmwYJMigj4O4rUOlYF6qyB4oA9zooPoNEGWd5anpm1kqlFAAm
         GD+ZY35DBld/HtsdE+TQEYCuOZLVtplXokQ4pQxi8KZiX3LeXPtG3u10jpeq3Jyi2AVU
         x04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128088; x=1734732888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFIunEH6NYw6O7UYyVNXbgbLmjHlOeVQmpSwSeHMBao=;
        b=CSyHEfM7BipKQh2/9njDzpPaVUVLYN6qTelcHrnynrHKvK3bVfbnSaqtPkIiG1lMVp
         47wja96aZzt1voZLZfOyVUfNPlQRz4xx+iO1E9g8drSPq947jYGKc+4bD+ttVPzMQCUU
         L/M+zdRQ0MbLveanJK9JO3L6x3IJ6qG0cEcKCBqhmwPI+AWlv8arliwju7ziyzpO2OgU
         qeIa4p62okMdfaYleNIln3fgbMrIdHuBFbb+JeYkUI+fDOIX5hsdg0UbQmvhDGd4jkX4
         yOelen/3obS5BdZJXa+66vLK+BV5VJbAMxH1OLvRCSQTUxwOmgtb+1Xz0uFH+oS6Ku1C
         BKKA==
X-Gm-Message-State: AOJu0YyVXd2gs/xoMUOR9qecPqcWA/NKAeYsQwDu5+IL7ghI1jfrmDSx
	6ovTVdcesQA3acy3i2NBXfPCLuoqQwEm3AZpbs5hT2msewfam9Ry4yNGi9IT28M=
X-Gm-Gg: ASbGncuzUVpQMNpP17Htv0OdBH+vqR8bmUMYAyBZ0hs470lkSRl5wiwCemhO0SY0WRC
	qGDeC/M9l2y444rh1cLdl/QYEZ3At6tfNWpFn0aD3um0V02l7oHGFyMnrGrPps/IM2vW2rE/yQj
	9kEjnmmtJ5GBbomSk/X5GprfeU2DMY6QMHLLmguSlE8lPyXFGpRIGCrGaVyrIegucfhKohYqqWe
	mTooGhubEmRxBD37UlXaHzwoWIf/5tGaaATryju5Sgdqk+0xtKXf+AQH2/YN765
X-Google-Smtp-Source: AGHT+IF7GgoHcOexOKRJ8X++fiOk2MhG/lT8Tj8XpKIrctUylGpqU4Nng6FPy4dLfrgcOpJAlg2Dsw==
X-Received: by 2002:a2e:a989:0:b0:300:33b1:f0bf with SMTP id 38308e7fff4ca-3025431991amr15417111fa.0.1734128088339;
        Fri, 13 Dec 2024 14:14:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:21 +0200
Subject: [PATCH 05/35] drm/msm/dpu: inline _setup_ctl_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-5-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5644;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KiXfdgfeqKgTVNdjNXr3dsy1BJirVzYvM0m0vfoOcq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEvsbvj08SfEtIrrM/RfnDoJmwWGdXp7Xed
 sz7Sc5TY66JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1XQUB/kB59yMP1tvpmrmu1FLW7XhdmgtE08BjwqKPdkukc3wqyY3W8x1ow+sFb/H2G2B1gD7XH0
 DxyWEfL10kod48p+NaKHvBBOePZT/imOkTECRZY2neviqwJSawlmmo67NbxaEapAnCCgw0uDS44
 iYbjaqlBCMMhfCaspI7FBcykq9CjGWxJzVArT8yYWJPK15PP73RGWwT/Z140s+8GuG9atWD9K13
 BVG+g2MVADVzkoM/Ca2bhhmJKnKnrVJEZodmpyu0QPl2U04ui6lvzDbP5fyABsGpWwS+5b0JTjP
 mPnT/BFdliZ88cqUOPaisxwVtrxWfIU2PKfzvC10H0x2HKKc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 96 ++++++++++++++----------------
 1 file changed, 46 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 4893f10d6a5832521808c0f4d8b231c356dbdc41..9a958a0c19f54c2ed2c204e314dfa8cd9e735111 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -687,55 +687,6 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
-static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
-		unsigned long cap)
-{
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf_v1;
-
-		ops->update_pending_flush_periph =
-			dpu_hw_ctl_update_pending_flush_periph_v1;
-
-		ops->update_pending_flush_merge_3d =
-			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
-		ops->update_pending_flush_dsc =
-			dpu_hw_ctl_update_pending_flush_dsc_v1;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
-	} else {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
-	}
-	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
-	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
-	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
-	ops->trigger_start = dpu_hw_ctl_trigger_start;
-	ops->is_started = dpu_hw_ctl_is_started;
-	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->reset = dpu_hw_ctl_reset_control;
-	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
-	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
-	else
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
-
-	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
-		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -761,7 +712,52 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
-	_setup_ctl_ops(&c->ops, c->caps->features);
+
+	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		c->ops.update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
+		c->ops.update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		c->ops.update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
+	} else {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
+	}
+	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
+	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
+	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
+	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
+	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
+	c->ops.is_started = dpu_hw_ctl_is_started;
+	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
+	c->ops.reset = dpu_hw_ctl_reset_control;
+	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
+	else
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
+	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5


