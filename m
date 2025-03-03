Return-Path: <linux-arm-msm+bounces-50018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8BA4C4A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00B8173253
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F3F21480C;
	Mon,  3 Mar 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCZqWMCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B08214A79
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014925; cv=none; b=sA3UjFBBQkVWOthy2cQ8fY5IllzxOxlt0nrZjOpjk8/FnqHuw7/cBPsefyRly3uBKPLsYt1svH0b1yuMcgqj6iMhwL5b0h3aKQ+E/kC7Vl1xN9vPm5uDsSjxDTkkMopNQxi0YqImnBdsOSwvU4tbd8qhJCLDslM67uMFWWdcNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014925; c=relaxed/simple;
	bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOW5Uo5o8/GwsTq79VJO1qTmdoVG7rtHogl7BpKXrKSldBuD0qoFLuBdOfyOR7caPlPBsXYLcjICdhLzLAkBuPEBX2tluYGcI1r+FRqbJ+tWclb5x9x5dLfBFWnXHnxb5a880mQnmR16JuBMh2zmHTtR1YYSfQqYZ/Cp7cQ7Qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCZqWMCu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22185cddbffso93797455ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014923; x=1741619723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=qCZqWMCuLAZ3e+VqMgnzYTZim9d0eWeoW0Ho1Gfl/QrxSibYftsbi0JWpzFz7woaMz
         dSKjz8i1WmPeTWmr9tr8+y4sl6sLkfhFhahNYfWgk/601nXHltVSvVewFpU9+tBcYcX8
         NwIkkPerpTWBrGsn0mMOmY5/ULXbMbZ3Sfu06FbyJKcHjFTOz1B4hzvG0DS6QUm0l+QZ
         /R6cOlkv2nQgB9763Gpq/PYWt73WfDjOmDtYTylSJi92w41wpZ/DXQPnAnhoMZ5BQfx/
         NYn6m+n16hm7prdj5ODxk5HV3XUj4Kn7gFrcuvz84scg4+wTblt3/quN1Bg4iP5RAPJo
         sU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014923; x=1741619723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq+zAHNdvdZOSJ//3Q5rS+vuxV2fvoAwakzSqW6Ri/w=;
        b=ivzeZOLe/4A55QV6z2p+9k87ZwGHo6W1dC1mcEyzuFU1ygSDzns2+t9jG2q40ilr5i
         q1d+meqIrw/4AI3Rf23ZZuJWY9FaDkAGV44m6j+8faIYoTwMKcd5I43MjqoccU5PCJ+6
         eYpM8GGOg8EmsgiNj0GQxF7gfcsZfbirCGcI64zQc7t1drY6VHnVpUQnlX6/ZaqlVbja
         Rh0Qx19xAuVH5gEgFObSRUhk0BVd6DmygfBco4q1Qjwt8s+U9qTnaSV5QgaTGUcdatf5
         BKhV+IomggIgkWXtUhPN+6Eolsws5c6BmxAD3Dm+x0P+fBfeDqPKYS0W94+g1YDCF8xf
         07ew==
X-Gm-Message-State: AOJu0YzKWOVwDZRcoKrRcuJH3NNB9XFLFC3r9OZGddfxim5YPUVTutp8
	NkuCXw/PzusPgFfM8GrJJhXQXqNrCs/LS0DQ2c4MdpSIKtjYkT2o3DQNwkRiQOI=
X-Gm-Gg: ASbGncvAlpwJKtOonn626XVMmvlzUJkTXkHn6EnzCrL1ZwdowqxSlc7yH4R88DWmGT1
	NG6KJaHxo08HCsvbW1fiu5pPd25nUh4JcsQaDBdycv2zrOhNd8zVtABXXW6Q2std6BWvh3VwGU3
	drL09degcVgJsPxsOVjR40rwhgnoq4GcANympO4TMoBHYnkY3nipAhswPFfPYsE5Cly4GZNPRg/
	2ANEYY3mRP2FShH7TOTWwfS4dLDvaL4KoncFj5iWNjuRXnYx8YyDye9ksd7NnfLsow3CUPYZnLg
	XCuEnRaerjduzrTGACqBi3ApxvBFyMvhJ7+K74t5cw==
X-Google-Smtp-Source: AGHT+IH8ciiBAiPz51W2tR23I7EbaKEiqHRlhwb3pmWcoE72Do5A2AxJD4u+8qKk0YjyQanKYtbzqw==
X-Received: by 2002:a05:6a00:1310:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-7349d1a73e0mr28617699b3a.1.1741014923366;
        Mon, 03 Mar 2025 07:15:23 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:34 +0800
Subject: [PATCH v8 05/15] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-5-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=BbqtIHW7JPzSyRGmtZOcXUwUkV9c75Bm5PqICVDkcB0=;
 b=0UvNk46EPZ4R1btXvQ5qsC6M/xPiIKiZt74mBiD/8nGd1TCcQLFWDWnxpVruAaubbFg3jMisl
 7JN9ORSQifZDKqYz0JrteTdbTxfJa1MxXbP6jYP/s4c7/Fji7JTh7T9
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


