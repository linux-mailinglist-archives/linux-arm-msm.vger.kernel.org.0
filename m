Return-Path: <linux-arm-msm+bounces-21051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AED8D4520
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 07:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771ED285B15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 05:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F942142E8C;
	Thu, 30 May 2024 05:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="isI9bu4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96ED143726
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717048638; cv=none; b=OPMzqkp0z2fHpHWFlB05MjRy2fv3z5943Z9W/p0PFS+6Vhq7DlKXOASXqvlxFsbPGLw3B59Kv4mubZ7S5Ao7rpF2L9/e6ESHvEXzaTuRV2ikSCb2cs0h0QObr4RC0V9LVDJG7bH824SOywJu5EawCyKLI18LWRy4RjiMWMhRT0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717048638; c=relaxed/simple;
	bh=I5nifQlkHyD4/nu30HBNiwamnt4h+/HLfZyqBAnBjJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp6+/6cBJRVuc4V6O52RwtX+deF1EcHUsYEHFZByOHzML8pc7Je2/B3kzfeUJ+KLAHPeKt2i1xVBpPvYRnmCjjD+I7ZzLZy3Wi/XeXw9DudGLfNPmsruwaldHuqEGi16knWnD/nnhi+AKtb4kE/eEDggnqyelL2oVImK/evW0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=isI9bu4r; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f3469382f2so4343715ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717048636; x=1717653436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZVQGdY4+q40BBHTXc3s5HupCWp6jK3VzSQUVWruj6o=;
        b=isI9bu4rMdUcBPMz30aStFZimaRb5wiZlQ1gmYKmEJ0WTKMfHtYFNLpHoIK/ZDmsYX
         ApbKusBaO5l7ChVyEqX/oxtd5OtTwSXOgYh75Wat/8KWlP4rRDpxhEHGCOTAl4pnU8Rv
         1UmiYBYyHFk/0Cc4hkv3ctoDJty2PxQ9dJ/XW2k3rtM9O5z5aWK4kOVIfX9vLWwl4Fqn
         JUXWvQ4+G314NR2tbq2BzQulvAune93drhDGDwq3vxbq1qCbfoZ+lpy4Kxn820y0K2dx
         iXb/7rNhtlKmPs371FVyqRklQeUtsopLj7kVsfwS4i+m3DjLKHwtmaKZEg5KuhNxVAtG
         PmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717048636; x=1717653436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZVQGdY4+q40BBHTXc3s5HupCWp6jK3VzSQUVWruj6o=;
        b=j/MVGFJCvDEsJqJ3E7LFnYvfv+Lhpt+GTqWXhIUz5gPZ3pgES/wwIZ3w3lU/VRIKkX
         TD343e8Qf4vy/nw5+71TFW+QW6ltFZfuM1ioe1EL4g+W3WxntC6iMGdEqToMgeowfAux
         gT2Un1Ftzx6BhJ2DempmNNGbg93lnwXpIziuwrnq+45mRyOfoPUiTpM7CV0HndkVej5n
         Hk13kIEUCPiutME3JtfckJn1mr1b271pSIhUXEgb44vdFyUP8zOhmUo9eHWNBXow/gEB
         rU/GSNP4uI/baB+NlrtTvsAotitF/6tC//zcoxxOdtmOmZxUFEuzSZW/I/J3Y7k1vSkM
         WQpA==
X-Gm-Message-State: AOJu0YyMNRRFttDN1+B4+nZcmKlGBFttJNDhzNXm4mvHRYLnStBPSXTr
	tfoUn9CnIYpXvqu9yyoDw7IKH2NpJYypC2ZA6ZK0R+ZEqo2auxm1FEYROuRzECI=
X-Google-Smtp-Source: AGHT+IFHRP9s7YeWMgwa/qHgOh7ZuyYspfdyiSHN574IBlMbLTNgrknvsbTKG9nAZB6npdJw2Bhocw==
X-Received: by 2002:a17:902:c943:b0:1f4:9474:e44d with SMTP id d9443c01a7336-1f61961bcd0mr17228055ad.21.1717048636303;
        Wed, 29 May 2024 22:57:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 22:57:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:47 +0800
Subject: [PATCH v6 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-3-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=3076;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=I5nifQlkHyD4/nu30HBNiwamnt4h+/HLfZyqBAnBjJ0=;
 b=MO5qo1g+m64QToCTWzXicApGgsbmx4Q2ZX7kcjbFlrP6hhXCCjr7gXsK4YTLxnUMTs74++HgG
 Z9csO391xNrAP60PnuNV2HEvXA8D4nXJuaGEm1XTm8QiZa+v8y12b1i
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Enable compression bit in cfg2 register for DSC in the DSI case
per hardware version.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 8 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 925ec6ada0e1..f2aab3e7c783 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,7 +307,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt);
+			&timing_params, fmt,
+			phys_enc->dpu_kms->catalog->mdss_ver);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index f97221423249..fa6debda0774 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,7 +98,8 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt)
+		const struct msm_format *fmt,
+		const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -177,6 +178,11 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	if (p->wide_bus_en && !dp_intf)
 		data_width = p->width >> 1;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf &&
+	    mdss_ver->core_major_ver >= 7)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f9015c67a574..ef947bf77693 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,7 +81,8 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt);
+			const struct msm_format *fmt,
+			const struct dpu_mdss_version *mdss_ver);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);

-- 
2.34.1


