Return-Path: <linux-arm-msm+bounces-23981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A37889150DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58A441F25092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F921A00FE;
	Mon, 24 Jun 2024 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJEE7YkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D852D19FA8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240441; cv=none; b=MnvIEeeuXTFGo77f/Pe7IzBNDJcJJXISAfAnGpaD2d8mGIHWRpDqgddTH05fTIMpXnDAhNGcxRTBhX4pHtISJiwUb36qiWrb3oT/g0Eg/HbbYfAumUqVSA9hZwpDKEhcuyRpuqBS6nzTF5Zmn0VpMO0F423asW2z7yz+TNAiWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240441; c=relaxed/simple;
	bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE5NnD+s4vfASlzVENpL+gD5yg2hbHpM5LXFvZuHvNSHmfg2oAtWaZKlIxlE6LQYQX/dqX5AoE+GJehE2FkV2T1xB9EgjvZy95OZx6u2LcNKJosSMvxq8Ry//zRWHU1vE0AFISs+OehKADlLvMnndRJGscP+Oy/PMi4FQtD1N70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJEE7YkY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso1297127e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240438; x=1719845238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
        b=WJEE7YkYSgIjpNuTri1v0NqOOT0I+0s/94FQ1PCCk71oqemPpj7181YR3syl9WyWoF
         wkyB9N9rXY0Wm2U90q+kBMJ1I5ZkbYtoPLxYLWjO969vD9v8nsWhsmSfvSNjB90tgJap
         x0tTm7bLPyBahnOUWESR8lHPFLKhJgeTylPm7Tjxxd7O9BCf5PLL6cA6eUXNOQvZTbjC
         zcnqCC+6pBngjyJaaBcUASn1L5BDPosSIlmweUkyVuTi0fofzv3h5Si6iwNqcDA4+fo1
         giH39+ceRCJqTgQwyz2z1W5Ke62Ztqv1N+b6D99bQBfbqqMd4WX8+kfuTXF3XoNvfJcG
         m6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240438; x=1719845238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
        b=PdfDXGh6DknH9NfpQUf+wpu6BJuUAOZeMXGOGUOCNKUH6nRUGoLhV6MgCK+WRu49di
         b1MQlGj4d85hRD6n9E9fa45eGH3L1AAd1THkebn+KsIWXJOBXtFslXeVdNpvu4mqby57
         i6qUw6VgGWrQAKLeA2oeaAow8hCPG02T4dqq2RePgzO3Z/3zHm0l67BJ7Ja2Bc8zz3A8
         vIsH/7EvCRgPAn1OBOekMq6yN2YTSvT9yhNdyA5QjY43bcavU+Z5aWmCRK5yqLaa+9p1
         WgxXX/lJGWcpc08UHZAUTzRL85BCPH92ziQSBqwc6Bp7EAvNvhPQOwt8jj2Tk1EAGksw
         tlZg==
X-Forwarded-Encrypted: i=1; AJvYcCUoUIC6EaF+eCR+z237Lcmsi3DuVxvLrqHPByyaWhUh6YWV3/p+IR8Nv7euBCOdN6kEwOKW3eF9tcXBDzd7tHkXiD1jhPmy4PKQVvbpNw==
X-Gm-Message-State: AOJu0YzFqZ/QpivkW47AT+O8xTkcvyXCVnbKReZi4lxVjy6QEfyFQdRC
	1lxBkFRSIH/RkIMITlY7Gzi/INEdDywAyXGYSHRvrHGXgaVk98E78nxNqcNZy50=
X-Google-Smtp-Source: AGHT+IHwn4mRcNgV5Qui2ZZtG9U+fDFH4wKxNBRIQDXWFZ5liYEi6+aF7gwp9ETB6Ys9QB5FWdWudw==
X-Received: by 2002:ac2:4c41:0:b0:52c:db28:4d92 with SMTP id 2adb3069b0e04-52ce1832653mr3384526e87.11.1719240437910;
        Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:12 +0300
Subject: [PATCH v4 06/16] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-6-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv72B9V3iefGPWeIHr1+B/BabWUEjMIFcJC
 wUzvrn/t0uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1RknB/9bSdIVf5ZCOI+Rzc50netnzopJnWbRMkvL6CV+axROugiqdEMHL416YrhuSaZhYrubJbP
 LVOnd43VVOo4BJJfAkZhDCv8CSXUfWO5zj/RWee7YLy4m8bKqNpGxb4dMPXz3/Ni7k4EQnYsAjQ
 tkUcPMimbrPCTaE3zrk8bHG57NQkX4vZAuI+/sJxzeJboPLlz4c9WW1rdNwfSwVu2H3EhK5U6Du
 c0m+YcfQRum8gH/JjIMxe5ei44+XFIx2wBRNs62JRUtLPN8Zvqkrua6q6SpzHZVldaHgMcVQxsU
 HgQgFiKDqLk6DUncpBpKrKyYv4YpwLgyQWHLcnt0GId/511W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index eabc4813c649..241c2d7a218a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)
@@ -1103,17 +1103,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1128,12 +1117,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2


