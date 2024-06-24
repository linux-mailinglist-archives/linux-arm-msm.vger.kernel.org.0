Return-Path: <linux-arm-msm+bounces-24035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDADB915890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ECD8284C50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0381A08C9;
	Mon, 24 Jun 2024 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPUw9Lbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130901A0AE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263636; cv=none; b=dbahniSCLn37tQIM1Hud81Y2i/rC6QDko8rC2ZlQUJI9gPEUKIVfgNhsjMj1NblG+liTsffcHvNeTqrnMGE12euAgFyqJjENwKPxPQCbtCp4KiLGiAlNabId8qFclVPiqhJylIoCNiJ+YuPJBjmuZ8E6lz18ZWHyZk73SEFhtVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263636; c=relaxed/simple;
	bh=JuN2zmqa3YG6hCctSw6/+U8MgNgpOA1IwwqjLQLeOJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q/uJzi5odmmisiOXGD4a7PqTpheCRz8VB2WcrRR8oudERP8IFKLrCPQpEJ+bxxpRER/6Rp2NC/RaHTMtu3YuG4Cys5j4FZXshjAmiNGQ5SDRC50Nqic17yS7SbchBlyK9xns1DlqEOJihmg1kKZQCzDqU5lXS2PZVlsLxXUZ+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPUw9Lbu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bbf73f334so3649321e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263632; x=1719868432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GrGyKZl+O80ijWJfca6TGiiA9ZGIyJflMlmN8aektA=;
        b=OPUw9LbuCF86/GPDaIw5+9finiuXwOIl9+hJ5oS2aTAH1CURPKBsVq/EW5n0wYbesJ
         LXVLHKHOgc0BODPN/XwzvOk7qJGFHDNGdWTpoGEkcdYcw5g13DMmcij02isnhieYFaIG
         7LveJ+4qCsGpL2J6Xk2SRyTV2eyhUSIJxzPJLhQA3J4tGfxXDd20NQjDs6VS9nlL1PKQ
         GmTL88kEi4quvAyMFAUF2RpqaDvadwNHc+ucwwNtkismFlkRjvguyxQOviJPwBseV7De
         KXh2gj/PpyvpCnK/kSqZmqRAavT63P1smkHgyLtX3ve0wm315hUQvsXpnPrGvlj3M4sh
         R7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263632; x=1719868432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GrGyKZl+O80ijWJfca6TGiiA9ZGIyJflMlmN8aektA=;
        b=H+DdDcooLjWw1T9IzaixWQKGT+6Ht+/gWF3UBIuvSrqO2WThW1TVt1wSk6ray3vTUk
         QvpMILwYPGXPuvGWkwKT8bUjzyIqlVsDigWmWMQZaC8B02EHYb6qnIvO1lWMUpe3FvU/
         TRao9GPAI60rTxUUyArWrAySAwSNB8sjp00jVGJqyjF5O4D30Wjjb5oW0SnT0RfnoRlF
         mZn+TWWqV8HdEfpS/1kYl2yooWzRJX1p7trr36o4ltcWVkOLA2lJShpDQrfkCI6dF4aF
         aBhFrK3SiFmUd7MS35WnvHihmxGkLz1nA0oI+5Od9nZYzufb7pqnpap4iZLnSJ+Yn2Vv
         1feg==
X-Forwarded-Encrypted: i=1; AJvYcCXo4BJAWxzm1i/InBwGh+sggbZVn7MiQQd4YxEbx+TYK6sm4YQIUO8Q4/edu2mHYl3bQ2rqRb2mmS7lvMOvxJH15Eqmo3Wf4rstoJorBQ==
X-Gm-Message-State: AOJu0YzyD+WijOMmtXlr/TarBxsEFNl0gaecQe5o/P36szRSY0zHQ8jF
	p+W4Q56aTMWVI3/KoyUAxtd312JdIPpq7/1PQvGalUbW8/xAZOpdR8mv4nN5Bx4=
X-Google-Smtp-Source: AGHT+IFPvMvTQcYjcTfk+sgbIJmve+brFn/z6kYzdhl1+BvJPWzFSrNihWQx6zW4FE36HWMeAf/vmg==
X-Received: by 2002:a05:6512:acf:b0:52c:e28f:4da2 with SMTP id 2adb3069b0e04-52ce28f4e39mr4007235e87.43.1719263632207;
        Mon, 24 Jun 2024 14:13:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:48 +0300
Subject: [PATCH v5 08/16] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-8-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9601;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JuN2zmqa3YG6hCctSw6/+U8MgNgpOA1IwwqjLQLeOJ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGIT023OVVglPxuzLogd5U93l/ulnttLK4lo
 UGMM8k9MTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiAAKCRCLPIo+Aiko
 1VwICACz+yKvsvBdOqLbdn5thfvf36bmyCr2hePmTBNpFbGHGEhOq0OSyfJ2ZLm3Em1wUdYP1X1
 87QMcssZvK/RdwxDxBsH4MWnv4QVWeYMXR73dj9VoYhlZ18t++tNraZWXtvGePgF/hh3HjendWi
 WZTtnU3M+ntjKFXfYK/S4keAhEgPWuGtZO9B2XvG6oAUR6V9n9+BbnkIFLHjOs/wwTWDrvl7XUZ
 djCn7LbDHBg/+/vrikn0uIahjL7GChmT17zSSgWnWNEipNrKl8g52FJepsLMqwx6kUXzSYrcqS2
 N5WFySkl4akjV4uVE3fipHjLZR42tce2PzTqoZ6Hj7ojy7PK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
sizes and pitches. Drop format field from this structure as it's not a
part of the data layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
 5 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 882c717859ce..c4a16a73bc97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -166,10 +166,10 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 /**
  * dpu_encoder_phys_wb_setup_fb - setup output framebuffer
  * @phys_enc:	Pointer to physical encoder
- * @fb:		Pointer to output framebuffer
+ * @format: Format of the framebuffer
  */
 static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
-		struct drm_framebuffer *fb)
+					 const struct msm_format *format)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
 	struct dpu_hw_wb *hw_wb;
@@ -193,12 +193,12 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 		hw_wb->ops.setup_roi(hw_wb, wb_cfg);
 
 	if (hw_wb->ops.setup_outformat)
-		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
+		hw_wb->ops.setup_outformat(hw_wb, wb_cfg, format);
 
 	if (hw_wb->ops.setup_cdp) {
 		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
 
-		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
+		hw_wb->ops.setup_cdp(hw_wb, format,
 				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
 	}
 
@@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
 	struct drm_display_mode mode = phys_enc->cached_mode;
-	struct drm_framebuffer *fb = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct drm_writeback_job *wb_job;
 	const struct msm_format *format;
-	const struct msm_format *dpu_fmt;
 
-	wb_job = wb_enc->wb_job;
 	format = msm_framebuffer_format(wb_enc->wb_job->fb);
-	dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
 
 	DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
 			hw_wb->idx - WB_0, mode.name,
@@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
 
 	dpu_encoder_phys_wb_set_qos(phys_enc);
 
-	dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
+	dpu_encoder_phys_wb_setup_fb(phys_enc, format);
 
-	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
 
 	dpu_encoder_phys_wb_setup_ctl(phys_enc);
 }
@@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	format = msm_framebuffer_format(job->fb);
 
-	wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
-					     format->pixel_format, job->fb->modifier);
-	if (!wb_cfg->dest.format) {
-		/* this error should be detected during atomic_check */
-		DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
-		return;
-	}
-
 	ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
 	if (ret) {
 		DPU_DEBUG("failed to populate layout %d\n", ret);
@@ -600,10 +587,10 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
-	wb_cfg->dest.num_planes = wb_cfg->dest.format->num_planes;
+	wb_cfg->dest.num_planes = format->num_planes;
 
-	if ((wb_cfg->dest.format->fetch_type == MDP_PLANE_PLANAR) &&
-			(wb_cfg->dest.format->element[0] == C1_B_Cb))
+	if ((format->fetch_type == MDP_PLANE_PLANAR) &&
+	    (format->element[0] == C1_B_Cb))
 		swap(wb_cfg->dest.plane_addr[1], wb_cfg->dest.plane_addr[2]);
 
 	DPU_DEBUG("[fb_offset:%8.8x,%8.8x,%8.8x,%8.8x]\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 8c2dc5b59bb0..46237a1ca6a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -104,7 +104,6 @@ static int _dpu_format_get_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -116,7 +115,7 @@ static int _dpu_format_get_plane_sizes_ubwc(
 		return -EINVAL;
 	}
 
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		uint32_t y_sclines, uv_sclines;
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
@@ -182,7 +181,6 @@ static int _dpu_format_get_plane_sizes_linear(
 	int i;
 
 	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
-	layout->format = fmt;
 	layout->width = width;
 	layout->height = height;
 	layout->num_planes = fmt->num_planes;
@@ -190,8 +188,8 @@ static int _dpu_format_get_plane_sizes_linear(
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
 		layout->num_planes = 1;
-		layout->plane_size[0] = width * height * layout->format->bpp;
-		layout->plane_pitch[0] = width * layout->format->bpp;
+		layout->plane_size[0] = width * height * fmt->bpp;
+		layout->plane_pitch[0] = width * fmt->bpp;
 	} else {
 		uint32_t v_subsample, h_subsample;
 		uint32_t chroma_samp;
@@ -272,6 +270,7 @@ static int _dpu_format_populate_addrs_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
@@ -286,10 +285,11 @@ static int _dpu_format_populate_addrs_ubwc(
 		return -EFAULT;
 	}
 
-	meta = MSM_FORMAT_IS_UBWC(layout->format);
+	fmt = msm_framebuffer_format(fb);
+	meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	/* Per-format logic for verifying active planes */
-	if (MSM_FORMAT_IS_YUV(layout->format)) {
+	if (MSM_FORMAT_IS_YUV(fmt)) {
 		/************************************************/
 		/*      UBWC            **                      */
 		/*      buffer          **      DPU PLANE       */
@@ -390,6 +390,7 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
+	const struct msm_format *fmt;
 	int ret;
 
 	if (!fb || !layout) {
@@ -403,17 +404,17 @@ int dpu_format_populate_layout(
 		return -ERANGE;
 	}
 
-	layout->format = msm_framebuffer_format(fb);
+	fmt = msm_framebuffer_format(fb);
 
 	/* Populate the plane sizes etc via get_format */
-	ret = dpu_format_get_plane_sizes(layout->format, fb->width, fb->height,
+	ret = dpu_format_get_plane_sizes(fmt, fb->width, fb->height,
 			layout, fb->pitches);
 	if (ret)
 		return ret;
 
 	/* Populate the addresses given the fb */
-	if (MSM_FORMAT_IS_UBWC(layout->format) ||
-			MSM_FORMAT_IS_TILE(layout->format))
+	if (MSM_FORMAT_IS_UBWC(fmt) ||
+			MSM_FORMAT_IS_TILE(fmt))
 		ret = _dpu_format_populate_addrs_ubwc(aspace, fb, layout);
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a2eff36a2224..f8806a4d317b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -293,7 +293,6 @@ enum dpu_3d_blend_mode {
 
 /**
  * struct dpu_hw_fmt_layout - format information of the source pixel data
- * @format: pixel format parameters
  * @num_planes: number of planes (including meta data planes)
  * @width: image width
  * @height: image height
@@ -303,7 +302,6 @@ enum dpu_3d_blend_mode {
  * @plane_pitch: pitch of each plane
  */
 struct dpu_hw_fmt_layout {
-	const struct msm_format *format;
 	uint32_t num_planes;
 	uint32_t width;
 	uint32_t height;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 93ff01c889b5..f39db534697d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -64,10 +64,10 @@ static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 }
 
 static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
-		struct dpu_hw_wb_cfg *data)
+				   struct dpu_hw_wb_cfg *data,
+				   const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
-	const struct msm_format *fmt = data->dest.format;
 	u32 dst_format, pattern, ystride0, ystride1, outsize, chroma_samp;
 	u32 write_config = 0;
 	u32 opmode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 37497473e16c..b240a4f7b33a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -37,7 +37,8 @@ struct dpu_hw_wb_ops {
 			struct dpu_hw_wb_cfg *wb);
 
 	void (*setup_outformat)(struct dpu_hw_wb *ctx,
-			struct dpu_hw_wb_cfg *wb);
+			struct dpu_hw_wb_cfg *wb,
+			const struct msm_format *fmt);
 
 	void (*setup_roi)(struct dpu_hw_wb *ctx,
 			struct dpu_hw_wb_cfg *wb);

-- 
2.39.2


