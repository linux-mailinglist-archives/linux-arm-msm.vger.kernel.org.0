Return-Path: <linux-arm-msm+bounces-42754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB49F7642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5F3167493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7475521885E;
	Thu, 19 Dec 2024 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+92ZR2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD901218859
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594633; cv=none; b=UkU4PZBQ06jifwj/XxeYH+BmvOkbruo7yOUOMD6kFMzSMZTdZaqEB8pEm64Bdf261vBqvMEVw3wWakzq2kpEFxE/QvOzkVtG9gOmwqbgqwzQX1lHjXiBIMXFhS9ZOMn97e85sN2AMEs2drNWnLz6BlOgWAE/zYHVG6P288JBe2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594633; c=relaxed/simple;
	bh=lJNk0O7zKbjtRBUPK/q7deOXG2gRF1mUYLxIqB8dl4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MakRqfHOORZyOB3Kx+DaJ5lKxahaJEbuWVfAc04aJrvsY5Ls4/L3i31gKO9kA0JvTWPaTFCWF2WVmqee/JaWzswOOWO5vHpYKffNQnAc4zZq6OVUYfosbzviL2N3BcwxWp7ZugPNo/t+LpIYXLhbX+xxPAcpm77ct4DmxF22Gd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+92ZR2u; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-218c80a97caso4472695ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594631; x=1735199431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0y4Yjsb8dzPb2yoZQl9aqLWS59hh0GNRfXMNjyDZkkU=;
        b=G+92ZR2u9MYDKXXK8jfNiQqYbMh6RR9dvvDDey8pF23jGbOfzaMz+cXz3/Br47Mfpe
         H9FBk551xwP9KKm94aAsQ1rwxQCb+BGbaKCmScgVawnrCGo4lW6yJUE+Js3WUU8E/TCz
         KjJU3MQBteu4TMhLYEwdU1HGHyiCa+ypSiyei1dDOZelsoaXgnim+lwL1ZiE4zBRwlar
         yh2MfUFn9YJZCuaurdBSOOiO370rVJW+bk+ZLovmOKfDGR/8Vzp2dHj3AQnODUUG6mXW
         KuHdcI6e2XZchPVGRsIOGna0qcUHzNmfK/T6tlE4Qggl51C5gj3351lEvFRzznZNeTtJ
         T/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594631; x=1735199431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y4Yjsb8dzPb2yoZQl9aqLWS59hh0GNRfXMNjyDZkkU=;
        b=UmIRI4QQmMEXOtajuEtiRlRNam6m4nMqZpgdXwtxWiPCBLJfkh0HSpNDvVumy91WkW
         4fv2iT+S6HOoDDYisHGnpQtmEMA+MuvYE9D22cnWXz3Hzp39SCktk/ISuc7c9m2NS8lI
         qXe4slfpJhIanVwZuPq1FIGXcA1ufUsax5P4BHId0PVVn/+SJ26AXdKt87/Vnmy1NF9B
         MoNbKPYxn4YqAnMo5NY1JbOfZtCOiEtQIQbYXkPxtOOvy1aq7dlfHZ5XzDmEPSdzkO/P
         264KErHExpTE1qe0S3G391X10O6WrfVb1fYWU6xqD2RhSamwNL/9akNlO0+XEIa1/3zN
         EyNQ==
X-Gm-Message-State: AOJu0Ywlu54WiOZhkPXGT8jMX+0KrpXFgZwAiGdmtXCKa3JzzYgu57ay
	fnkh0IDY8nI/D4/0rt40WiWJlkU0pIbOzFWiWWMCle/9iE3Mgg9xebtcdkjfcIOXQv3XsMpjEZi
	IO7TIlw==
X-Gm-Gg: ASbGncuZ3x9FmCoO5JGyqJHCPBgv2xrcdZJIDX/drbqr+3kOoDdjsgA1LAhyO/OnTpD
	xmgdrEYIeGaS7+aozPlW5vSuKior09MGrjKVMSzDHLNcsOKzMJAFjSzdntbHv2RyAGliR2ud6su
	WZW5wviccJ4/lzLZKpKQgVlRaK3OVGrVJB3tLIiNvBQJz898e/OzQ/svwXhkMQat0ZKB/YD/3pY
	TWPJ/M5phlO9K09RRD2O6FlyaMQC2aXi/W8IAkRk5gEGJz2zLvzZQ==
X-Google-Smtp-Source: AGHT+IGJQBzx46oVDkkr51UYNg9QQolgkooANHZOCytLLBosiKXTDeptUQsxwc5OV1zLGoWGtnUwbA==
X-Received: by 2002:a17:902:d508:b0:216:393b:23d4 with SMTP id d9443c01a7336-218d6fd5ebbmr82321875ad.11.1734594630933;
        Wed, 18 Dec 2024 23:50:30 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:27 +0800
Subject: [PATCH v3 09/15] drm/msm/dpu: split PIPES_PER_STAGE definition per
 plane and mixer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=5820;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lJNk0O7zKbjtRBUPK/q7deOXG2gRF1mUYLxIqB8dl4g=;
 b=7ZNggoMXbrc/XSTgAUtIIo9jiSmKwjXmu+WIot50hbQGRU7mY3fZSgTank3joTqQ5OAR2XHCa
 qAKK5AwOl1LCyC4QW0SaftwOZlwIRP+zsXHCI9LlZ03dXIvM51Rk7Dr
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Split PIPES_PER_STAGE definition per plane and mixer pair. Because
there are more than 2 pipes in quad pipe case, while 2 pipes at most
per mixer pair. A stage struct serve a mixer pair, so pipes per
plane is split out as PIPES_PER_PLANE.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a0284b1425b1f..72ed8749cd716 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
@@ -1436,7 +1436,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (pstate->pipe[i].sspp) {
 				seq_printf(s, "\tsspp[%d]:%s\n",
 					   i, pstate->pipe[i].sspp->cap->name);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index f8806a4d317be..68867c2f40d4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,6 +32,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index aaf934ec96be5..46c6b6126fe5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
 						   &pstate->pipe_cfg[i].dst_rect,
@@ -1076,7 +1076,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1128,7 +1128,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1240,7 +1240,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1370,7 +1370,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1384,7 +1384,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1403,7 +1403,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1518,7 +1518,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1575,7 +1575,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (pstate->pipe[i].sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 052fd046e8463..18ff5ec2603ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -33,8 +33,8 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1


