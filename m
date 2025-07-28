Return-Path: <linux-arm-msm+bounces-66848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEAFB13B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E31213BE039
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CCE26772C;
	Mon, 28 Jul 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JZJjvXnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26020269B01
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708497; cv=none; b=k6P8q5biQiGku9vp0N7mkThAWC25IQd6k866KSlr9cEdTW8ctihDYMuBDbzuHzoHj9AIYGbHspe3FjmOPvI1Fy7HrZIyxH9/QRF6Lnl5oaV6WankPBR7r0JrXMXPe/rU4tjQ1AKzYFqZbQAwDK42CSNz05I65ZyZ8dCbdVHd8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708497; c=relaxed/simple;
	bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHZvd6LFQ6j0C+i4waU/c/NeoB03oWqBFBt24AriTUM8sFbYbTg485Epw5KxFANbCXtLlPs7ZX4vGoa5ifeb75J4aEL+MoAejVJI2ANKKwsXWzt5rnbJhiouwvDU4mOhQVliTHsZIyoA2XQnbmHKPJDFBJaMKIT2K4mriaQOWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JZJjvXnL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74264d1832eso5036910b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753708495; x=1754313295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
        b=JZJjvXnLToSR1i6u+tODUj1ZPT687KDc0fMnTrCseKhuTqu0sVNI+eObzw4n/a/IEO
         0Dl+fiWCH3fKGOQIb11wMKgyViSpS+wgASjiz86yuFz3DyT47uNyzbU2EtbZHmcQ5RmT
         tzrzVjyJ7WrUcH+E8/yrxymTxhSdXV31A+hFx9TgKUkoeTJNmgh1wdlxRZAl8BvDi/JW
         juPmNbr7y2+f8DgU3RGbpKFD87+xXwWM2bPgmTduDIINTlQUDQhCOmTxywLpKffGEuiD
         eaD022ZTuh0J9segR1+0Qjb00U1FpL+LBhIyHA/TVz0fjS5RgjY7IpRNyhzJr1v7vbZl
         8KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708495; x=1754313295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf99YwbE+zk9ZgJ2ORD0W2vahwafwsW/a1Bh6B8t8K0=;
        b=Uf53n2XxdYv/tyVx0K5KMQ8XvXhquzJ8PfPzTlKAIHLCt4O65MNJwW/cHkAPfwisM2
         KuCnjeSvt3/sTBXpbbFMxNPUKavQ5mPi2UuKI+qD9m8On+FZ1MfJ7M6JP1aFbPBXMPVW
         PYYc4Gq8CugnkNANlU2Kz9GT2Vs0Pq5IdAgOB0JLINBRZCABdNrvx/gI1B6Htj97YF/W
         +uxd2qxc8eoJLwFivw5LwDbJQj4dk/ut154kxel60nzU8UDdB0zyxEpdJkGLIdOkKvBB
         RpSHycnPoG6TerDSqGGSdksZJqFpbKtm07JxlRhjedjiCeG+6fk7w+DcMt1BZLpwfWK7
         gh8g==
X-Gm-Message-State: AOJu0YxHG1eFDt0GunL7/3DQWNuyEcR/a2BRY1TS4oIO6ygS5mI8WaWv
	GVKIsFRUyDbAX/G6zESuik1gILfdL0pDGu03oEHGbqHJv5AzNmrwLaQtqtmnlSdXeGU=
X-Gm-Gg: ASbGncuop1tAXVSQVaUgr/MI060vAnWWsazz4rE/XVvnMrj7MF01eqGMsA2YMLzVPJg
	hdw/JBpneQ7nrBEzPDUayke1yADOuM7wl+yvhJ2gVqaiTqYet+zRr67NSfzIYT0zlQb1VpMclwZ
	TpKStCzfrk4rWVmwEUEmeARDJiJUnn3AfhBaAmtUX498oK/fbHfbAk3G1M6YqiS06/ML0vjDVVg
	3x/hr0MBZI1kDHlWGf23gNchViYq+vnAi/MpObuGA76h1zn9eZU99nKAuUi5M0ThJ54IZ/nprk8
	qe1ggRYnj7Sw0nLDHRkyCjLv+Gw106ED5Hmp8/uTaBp7C/2GGiRrTPQDHN1bdVzqGQlJzA3TxwF
	C+qMk3Pva2qc53cAwuQ==
X-Google-Smtp-Source: AGHT+IG/D20ljLwf5AcuzW3YqgNM4owFJUcPZ3fslmNc2hdmZkKFoi04pLcGuW1KmbQW5dWUBibnNw==
X-Received: by 2002:a05:6a00:190d:b0:756:d026:10a7 with SMTP id d2e1a72fcca58-763379f0131mr18993904b3a.21.1753708495406;
        Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:14:55 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:26 +0800
Subject: [PATCH v13 02/12] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-2-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KP97mkf4mFx6Hynpv+UvTtqAjJLhCHcsa39rmhW+j40=;
 b=ZmJJ2xnajYYZ10cD4MTxNnsob6Z2eKXOrG0hOMYC3PDZkQlNWn7dslvtXy+0zhgHpER50XAor
 EIFkXa35K7fAnUdjUnJ25DdlJ3xkpoimu8Hm2MxCMUMfW7WgWHvZg5r
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


