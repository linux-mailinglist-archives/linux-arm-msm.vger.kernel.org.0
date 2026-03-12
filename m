Return-Path: <linux-arm-msm+bounces-97163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCYuLK55sml/MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:30:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107D26EF5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 532B030E8350
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57BF31E85D;
	Thu, 12 Mar 2026 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="leNOSzPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D4336EE9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304116; cv=none; b=YeLEe6Uarm5i66X38xJjDjm4Lf/eXL5udGWkPrJAZDEseEG5O42HoIASxO/P+kdL/Qox9SA8rQeFZlFioqAOeawhsmlshEXSTkst+mKgz/RrqNh8MQoFgi7oOKDFxmMGNVOw6ue/suj/KJrjsyypm/1yo3Sv40uI4BCmriHMdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304116; c=relaxed/simple;
	bh=RE3qeIJFMCJw+TbGo280DpJf2sHQjKNb5z8KylWcMU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hd4efhTNsL32dE3OiajMIaSHaGuj2ZXgImXHC4FtW9Sgh8Vjwr5gb7Ofx0a13wvIErTa5hvFjbegZYT5i8R2KkJdkHVdpvYC5sY/4QzUNfRxj43x8YxbrM3WZs1Go0M2SSiqPj4utUxrtlh9wBWDdKe/bIjuRbeHSPN4tx+APSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=leNOSzPI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so811138f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773304114; x=1773908914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPddzVJSVtkRrcRhnsRvT/Hf7HSSWz/56c2ZASviYjw=;
        b=leNOSzPIf0H9ZQFjqpm/++yDDjfz4Xvi0lp5KiO0cXXg2+kPoW74UT3oAPkPVtIeS2
         MY6lIepqA5TAG/uq5IUWsPA2v4tjpeg6zw5pUqt9A/E4xN0f6XxWcii7G/Z27H9Um+aH
         l7lJ7Owc+++dFdKN3p1z5FjIUxLou/MZUWCVQ/XnbP2Mofw4PPuMlg2NFFmu3z+a8Urz
         y7MS4/5xCyXKnf7+HWABmqqtbKhGcl4udFKQO3lAmiRFfML3QGqXh3vMChHtP2L3JP3N
         aCiwG70i9aGamNpLtOd2hOgvB7v7EYTwnIJfzjliwbX333Yi27DiMGBic6sVIqfaADPS
         tHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304114; x=1773908914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wPddzVJSVtkRrcRhnsRvT/Hf7HSSWz/56c2ZASviYjw=;
        b=Gv42+8JxHdWQQ6oBD01kr74TU0CPcrIwxCUCfbVyPr9PPQjX628i2zUkpHX2/RTEvf
         lOWWwVDbIEkQcrGfIaVCeiq5mbY1HWvOlr6nnBYRUTbRSAm1JTTnyZG4bosL00qUVkI3
         X7+EgzKRniih9iFmBTWyTTlG0Dq0Tneq9RK2u8DPWR0+26ECKu5dvaEinLG/M1aKAuYl
         iVVmpdNjrEqhPDqoZJY7cieKpu0C4hNbz9HBool2RAXZV70K9PZvntWP+IEqS/3dMiKA
         Y6GXKMuMHxXT1oUE9By8kfFyJQCZKluk5QEdAnzSHadCP9RPhIwl9Rf0a5KQDY8ekQMV
         lrTA==
X-Gm-Message-State: AOJu0YxO4QMwCZ1Nq8Fe73s1ELzuc61GSQNTgn0h3wkSo6jD5UcOuD0h
	u6Nwhu0dADX2u6DyGNA4F3QP6A4aQNsTu1rDuz/Xj8SAFaNSMZPL90tte0/FHSaNPuM=
X-Gm-Gg: ATEYQzxDtnd28dh0gcLcIaMFFoPxURQ6Ea9zzgI/Oaxx1//GHa73w5jZtWoHrht8yob
	ftSLBjDK/DVANhf8ETx8bbTXdv5YQuf7vaOOERaMwAQ+sCBfNDzUwhZu+irZLO3p+mVjgwbYa1Z
	2qhJlf1C/mtg7KKoV/wNLWiLpwzTi5B3fjaF1fScMCHXsqUmOx7RNRcNsKwirmo/XEvDMhjbeUY
	tVLs7jJwbE5qwGWKN1TLDHGX0UsBMPth9rJKY/obpt9jWvkaFKuDUr8Md27zjTwSkQ84MTA79+A
	k0m61Ia+Ef4esnrckH7w6yYDA3b7ZCDfxywmPReUB/ZiwD3LdNdJ9+HrTYxnd3iRQGARtY+7DxP
	O+c1RnAA0taIHz02JAZQ0+dUoYJq8zPu7b4o6abxY8kgQyluaqGsgRrQVY8Fqsiri1iChKI72/v
	MdwUk=
X-Received: by 2002:a5d:5f82:0:b0:439:b5f9:eeba with SMTP id ffacd0b85a97d-439f81f2288mr10505269f8f.3.1773304113877;
        Thu, 12 Mar 2026 01:28:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a04:6f00:1::ee:b:1015])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm6273780f8f.29.2026.03.12.01.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:28:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Mar 2026 16:28:10 +0800
Subject: [PATCH v19 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-msm-next-quad-pipe-split-v19-1-4ffa2b06c996@linaro.org>
References: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
In-Reply-To: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304094; l=4057;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=RE3qeIJFMCJw+TbGo280DpJf2sHQjKNb5z8KylWcMU4=;
 b=M8/3vPKx/BLiXkMrb7SgSN2c/ye0Xo7pQ+VC1zKC3aDaybDQ5LizP8tMXUHdtiJ9hhKam2YbG
 BukVpt3O9A8Da7+yG3rBWBNQ+tM2Pd80pmWYCIOmnafEQ+B+vmf6LU3
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 1107D26EF5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dpu_plane_atomic_check_nosspp() currently handles both plane
validation and plane splitting. For better simplicity and to
facilitate future refactoring, move the splitting logic into
its own dedicated function.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 48 +++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9b7a8b46bfa91..4ed14f203c315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -821,13 +821,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 {
 	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t max_linewidth;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -850,14 +845,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -879,6 +866,31 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
 			return -E2BIG;
 
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_split(struct drm_plane *plane,
+			   struct drm_plane_state *new_plane_state,
+			   const struct drm_crtc_state *crtc_state)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	uint32_t max_linewidth;
+
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -910,8 +922,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
-
 	return 0;
 }
 
@@ -1132,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
+	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
 					      pipe->sspp,
 					      msm_framebuffer_format(new_plane_state->fb),
@@ -1180,6 +1194,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	/*
 	 * Force resource reallocation if the format of FB or src/dst have
 	 * changed. We might need to allocate different SSPP or SSPPs for this

-- 
2.43.0


