Return-Path: <linux-arm-msm+bounces-42749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF89F762E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3112C16D6AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02557217F57;
	Thu, 19 Dec 2024 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6M3HU+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683A921767B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594599; cv=none; b=VeZ0Cb1UocVXDtIYD+zVBc9ViQan2gVJZCcq1qNf4++6Ln3oEWy2OiTJFp+9QICYVSk0C3MGJSMRBVO4xf4zIeGafIo2jvywJ86dqU94HF6N0y9vLbNrKF0t368wNZ69c44mUSB9qoWeGn63dPtl5WghRDW1NC9Tux651JDRhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594599; c=relaxed/simple;
	bh=SPyiBgL3hfMVngEeCufF2JBzxfqk/rbHqElyh4UjDxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJAUd+54MLXI/fLP2kr7VibDDunUInJ64xF5F3o3+3myqL2FExxLiToOYfMztqy5xbFH6zbwN0KcixOHv+cx8MOrp9xbM2lqtLQdNNSYT6bcEF6ql856Gef7IdZszweFB3T6T5e0zaYxxZLfoj+cxpu/PZRf8YjX20JxPKuWHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6M3HU+7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so5552165ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594597; x=1735199397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
        b=I6M3HU+7Z1PQKTfBRUVJF23W8MsMkDYfa7Z4gYUp9jYN0ikMIknxzxs17DmhebBgH6
         ar3kUveAmrlS+7QRFtsWMjZdaSvvcO2xSbA3FjzLHCnvX7prgOMwTt5fm1AUBUvIQ6Kf
         KW5zGkoRqZ8J//veZfaVT100wgRQvsVJ7qfyEyGoT6/5m/R4M0nOsJJw7Tti6d27qMvZ
         1etw1oO2r5pmD+zpuWxtYvbK4oBWGLWD0YLjjracCgk/yii529a5YhNuFoirxOvaHhXQ
         hppdXEelTzKHenHVlUxeD4OUlnu3uNeayChw2c/yWlHFOLQtznQt19O4/6K/CmAenIdm
         qsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594597; x=1735199397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kt1DlYp93VR60ha+vWGXO3XGir76XTQggij8rAuDIM0=;
        b=iGCBFImPHj4PEGLYtWu3+qzQutbv9DXMEQ/5r1nGosteUj6J+faSpX82cpR+MPpKsV
         0DKtgYpFCBJMRu2PSVUjvdh16IKSl3K3cZRXIfAdJKKFhrsYqHqNXY0YutCNmlF9KcYD
         +Nb4EsX2dCtmw9Pv8Fxvf0afcDfDLR4M9bMtKwy7mLKm3Wrybm/GT6ZV4wp+qkqZhDeo
         HoUiVSHmqoXH3QmFr8okUn0CMQgSqX7J29yhk7R3zWzAKlz3mtbkYpddq21J5b3jB/ch
         ojc9heNi1oi7QnAjxgVVkLt0zpmMnIEC8NZdmJlGvqMTiZKu7754Sqx3jMIBsLJ8CDWA
         nFuA==
X-Gm-Message-State: AOJu0YzvaMH6zEvnUM0wELIMWb6XGmIJUNc0maGzGJwVYRBwLIT2tmi7
	Je8LSUTP3pawsb0hSsoa5lZJ/n0a5ozuKH0/NhQfVGDPXq7lALj54qDiuieeNPXmkFduF5KldBy
	4WBYOEA==
X-Gm-Gg: ASbGncsNsDUQzIm0OgeG7yTH/x6s4hL94VzBhBhLE7zBCuCv2ESG5stqcLZ1yeO1Jf+
	WxFCAgZI/pGSlmbgLJn4Y7jwIvQdqqIT7z3HJFxPIphstpkW40JsB+1WoJdCyMZ+J4NKQLS3MUG
	F1kSTZdV+RWc1QOuXXO4m/BRDrL/vVF+pLgXAInxUoaa6ZYnScdZ7k0RHKd+oFCSi0miqMY1Ln6
	bxqmNCVE4qSSzJLKLSCJPztFr4elyFR4zcY8ytDrAzpYXEwacv40g==
X-Google-Smtp-Source: AGHT+IEIuQm8BM3R5VmAdsk7F2I4BPZS0vz/z5taFEvNb6zAXkyIxwrf4C4EqP7xNztbzEzQR/bRgw==
X-Received: by 2002:a17:903:2b0c:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-219d9901901mr40917305ad.56.1734594597497;
        Wed, 18 Dec 2024 23:49:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:49:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:22 +0800
Subject: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1407;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SPyiBgL3hfMVngEeCufF2JBzxfqk/rbHqElyh4UjDxo=;
 b=pXN0nYxNuCAd3few9qkZw0NaAGt1iWhzQs66UXTaamXatgEGLwTZGiI8Z767QZ3Inz+g1Cy5J
 +a46j5hy40OC+6jLhxP11YqtKClm8L+DXz2Iar2rUdv0mCjmJ+T+eZ/
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

decide right side of a pair per last bit, in case of multiple
mixer pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7191b1a6d41b3..41c9d3e3e3c7c 100644
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


