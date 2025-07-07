Return-Path: <linux-arm-msm+bounces-63880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179DAFABA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A52B189DCA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED8A279DD1;
	Mon,  7 Jul 2025 06:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrG5Mf3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E627B4FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869102; cv=none; b=KMeq829IFdOKwRASPRoANFhmTDCebflwRDoQ4tXfT/aPK4VAZz5MOoJzz73NJ1Pxr7geO4V3BU0LuxeHT6c2WnqiIilettm2DHYPInKAHPFdifg/josAmUxSxkgzfg2NJnh8+97bM1C9QY4I0eAraJEU40y9Vf/zA/idYKlFwjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869102; c=relaxed/simple;
	bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0pN3sSdj2jtJ+BxEGDFt2WF7ECBwprrEfFTXbwhEr6mWG5aitY1d4tKP1k0xXLT7L65D0+1J4td9mympn8sWWvxIDk2FGGMZciw6FLxD+jG/weE34z50vgnjMHdoycCxuZNAreX/jbtbjWJIQf+oCgw93/EvNbB+oivG6i9azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrG5Mf3K; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235e1d710d8so35613895ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869100; x=1752473900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
        b=mrG5Mf3KCIQzoVniYBT5i3G6HVAhsi+aQMlfmm/CLS+h3YieBAAOlu8mgYJNuCQmL4
         jQowc8V/aDasgxjUJrMfZ7bWFw3Hulmjq9jgnUFLPzCOIv2QmFeMrZk6VYamesr4bPBa
         FV3vsWdB0KsBEf0FyWoKAbbQgrM/6LkOkS2LfIm646FUWRILiWdNnc01FTjYNPj90ad5
         TDbtyqMSlfy3erqjXWy2NaPQsu9YTa8TG3MZi0RlK8hkmBMWfttVky3TZW2Rb1E3S2Sx
         riO+74a7gIQwrOup93d9q6/6Yxkb0izgwIeIeaGnwOnoEp3UaMNw8LS9V5cOoOMBKce9
         mYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869100; x=1752473900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
        b=fkF4RKIJWxVTLNh1i1ZBou3zeaRFpzR9nHzwN+q9PS9OlQ8WSm/f42F6Mr23NF9Mzx
         cTx1LxWLXh7wqiNKK/8kzg+1qeEECRgTLlC4hlBJ7LIR6SaMiMpgZ/Xcn9fYmyfFmfEM
         zc4JkIpQUxpNtJFxZxCsjhEItSQJHjG3kwYnCRfe2Pq6OYH0ErTQSiTa1DiR+/ctRiDi
         ymVCR2nYmq03n5wGgd5Uxmpi6+tD8GlDPBoI1u61pdqzRJFIv8VG367hlUwPbraCGUFM
         2VWAAPj60QpU0gOgyUKQ18rBkhr7Fdb9fGMQvr5PzuXard+t1q12uqOCnLiaoPFmXo9w
         LD5g==
X-Gm-Message-State: AOJu0Yx5RXqBCk9+uAb7fqx5aQT3CziAVlAz4BcNU5TyCxGwTJ0Zw3Gp
	eO2u9+Zjkl7ADf7p5aJCbGBU4DWpd72Iw4+irIMtAcx9HRWfUGnzO1rAU7+ywMro0p4=
X-Gm-Gg: ASbGncu7zaLBhzB7+xq027GGOdls99nFQabY+AjbT+fV/3gwGFiJV4uuzD0HhuVyjdH
	ki1RnjM8uFMfLQusio7u08EP/dvzfX/U/33ED2kc5piU5P68qkxnQoBjutkwJO5V8IJMxUoKIvb
	wlh/omIlYu31uAsPVrISBQirbeOEbKs7nfBMvF8w8IQbkE8iZ0eEdVU+XIOjxXiogjgkWxA4dUV
	OcsNkr8ryXdo96avOAKk9unTcPvwTdmhSJH5hq6yt3a1LbJTw9bFbt31MkWut4kR4UL3G77cc4a
	vMtIYW4+93B6VXmvZkVbUuWuQp2CdPTUORoB47qcgftIuT7KJb39SHDc3+c=
X-Google-Smtp-Source: AGHT+IHRRa1nd8EABRQU5wK9XzCGFikI9OJL8kdQbUK0WUMo87bOtO4uywAsrOfWnCd+HRjG6iJPtg==
X-Received: by 2002:a17:903:2304:b0:220:c164:6ee1 with SMTP id d9443c01a7336-23c90fc7b7bmr105932755ad.32.1751869100387;
        Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:20 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:57 +0800
Subject: [PATCH v12 02/12] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-2-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=eVMLeIUgZqZLeZ6Ci2g5Ka64hLAyQjdFTZDLaC2dgeCYsGmozTC1kJqA/rBQTjoMdzD4RZrJq
 kdEp3oVl/uwAcz9bq09dQ8GU8HHKb8bWx8e6T5k+KSEV+cn4RO3kXWT
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..9a40492e5aa961f7180ba4ac6c86e06fcccef8c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -377,11 +377,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -392,7 +391,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1


