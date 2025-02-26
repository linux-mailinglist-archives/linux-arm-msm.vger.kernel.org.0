Return-Path: <linux-arm-msm+bounces-49500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C159A45F56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3DE188DB2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113E421A449;
	Wed, 26 Feb 2025 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNfHIp91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878982185B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573177; cv=none; b=MqkZ1ylSJ1qET4fgYva0+GdPC89xWyLKxwTSK8Tj/mNFglzWM9x36kctB9l2K5q4SqyOPEh9MekA3Alrv0vaeNvU/HHRALs5wZfigvm5UyCxiKeHR/JhnwKIOuSSTaowgF8bKLEvWJh4H1EC2pOt6uZaOEi0hA3Bvn0eEIadWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573177; c=relaxed/simple;
	bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqZF6LeJ53h+e3YhoBYZwf6JuPbJNOostC1oGUJCdXObUDxvlmWnCXBSMihH1qxfC2XAptf9jnGwW6sstt9h6dl+KzE8Dh18Yu0VYDP+anQj9brlWYtOeqqqVLwYB6Z9XPY7rQ9ElBIm8rgj/JIHZgenkwqL9lZuydCMt/SH4N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNfHIp91; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so10767185a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573174; x=1741177974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=QNfHIp91HlAq1Tkxxm0epcaMq9PF+hUkFS8h95OrM4H5KmbKowUCvdN4o6VdfLsq3j
         2ginK+zaCHJ4T2x/eU6TlzT/dgWgq4FLXca9RhE2Em4ZfuMC28DV3LDZ4+ca2BOyrnXs
         AZA4wfzyFJ+tEtRv72eKnjXYz5xoXaNFLZcEBiGrCB/1UrF1Y4OVgl6VtiWqWoj0+rRg
         IN0TfywVfrxGcJeZPsIIDadGG9Ady6Nu1P33akoE+o1FTkXJE3ah/s1LQkhw860OHTbY
         WhRkLAI5o2s+LoESiql3jXynUCa2k7qFm/JOp8qSsjbil8OIy2vT831aheSIbZ2/EEsO
         ilMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573174; x=1741177974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=Vj/kmKufqyU9MeX/8vkXY9cwLImBQdHquMTpaXoxNC3qLJgXAI7HWbrs2x9NpuHj5I
         x45yqAIIDaSKXH4rybJMuEn9qurSEQWLhek4gX/Y1Z8C1ev7zgFqqW/TH+EDNX0aJUsG
         4Awj0+hbMRAjRN2ZHEtSyhLuCNl4vfAcHVvBIX9eU8as+/SFasqF/mcq/X3TgswBdlpV
         vyL5HliZGNZKb5aUNTVp06k+kLbv2sHAv/y8aGqqFKDeOSZbNl//yOccV7awaGCOlo+4
         rMvTJlHrrMtMZHE7Vfzpv1QsxNHoF32EjxT/XcFO39EbqqBoHEUu/W33OSNWxl35ZSwU
         YlQw==
X-Gm-Message-State: AOJu0YyX+eiiOeUHVuAKNGBgWHkiHH22e76ysj3kmq+ozWN654fnqH6B
	JBy9FK1D5groGUqf6Um668sP9xu8UX+dMLTzRlYMc3+cKT+6SftKQ+FtkouByELloOBlg3SRmUY
	Ap8BK/dXA
X-Gm-Gg: ASbGnctabIioLVHCkdIn0xNONT395p3jvmFrL9KO01a9HDZ+4Zy3KSFIilJZEh9My7/
	J+W+EFEGj4rAZGk1bJKct1TuYlEOh6BR1r2uz/ck/uaf46kul6LlRoy0vydDMIwIlEp4bSohwZq
	0W2reoxrqvzH+TZJ8OyWs2fTez6vFcksqBZ4W+Op9TyFLaLtIi4+4G10Hqj3YXnTsXPgM8/D9DR
	dwPCOLJRUydHZ3Dqol0SgWNuPRGztbYHR82VG+AzDWu1/bniooWIqhyhavOQIkqUz4BOhvoelDN
	e/ZZIVxMrtViKRtRf2G5iVE=
X-Google-Smtp-Source: AGHT+IF5L7rzBSpk5qpsdgsAUFke51js1iZjo1fChsxijAq1kVHbMpTBDgh9GnhBUEpzjWW9aGsJOw==
X-Received: by 2002:a17:90a:c88d:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2fe68bff7b9mr10849509a91.27.1740573174703;
        Wed, 26 Feb 2025 04:32:54 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:32:54 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:54 +0800
Subject: [PATCH v7 05/15] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-5-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=V/CkV7RfmMO2LWW73eg6oN53kkGMHGfvRe6idE6dRf7RLfIow3wlkAPeJrWmi8SDPXs0fCLVL
 pq6gm8FfMxWA+SjXyE5WFzO3MKcNwQq6WTfuXo1z9HFbqCHHOSYohl4
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
index 7191b1a6d41b3a96f956d199398f12b2923e8c82..41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
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
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1


