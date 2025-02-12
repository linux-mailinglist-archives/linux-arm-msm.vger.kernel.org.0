Return-Path: <linux-arm-msm+bounces-47831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854BA3332C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 00:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D663A5ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 23:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFD5260A47;
	Wed, 12 Feb 2025 23:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Awt03P9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58BF2580EC;
	Wed, 12 Feb 2025 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739401488; cv=none; b=czLdxEZ1JibqPxX8fhNAKgcNL7YhY497EoDB/dUuAeU4cjIxvhkhDZCGMwlVrNHYuZyeP65A2LTl8U1Cp3EfZkfvw71E2HQrXvsutfMN4WPFOK3iWavZzN2pWEKPiKHFUYQJgBOcvzmkUuAPwEmzH5J1IzrYAacAtxQstpfeq+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739401488; c=relaxed/simple;
	bh=y4Incp0qb4B4ngPLB+sALUgrKMocGxeOHTAr68tsUbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulCLp+6LxMyVuaH7tPF/7D+dfdXRbzGgTsrqEjfWnvzejwaQOargXJg0UHAIczYDgqxJxDDzrEx6Lyg0+mZRiDJyEjL4xUY5SQ4E15eNryHLxkMN4tmJBRc1DLQIxh2g012ySPWKAtmpIs26LWrnXXz5KuslBEs5M9mK4tUsmVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Awt03P9s; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so442612a91.3;
        Wed, 12 Feb 2025 15:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401486; x=1740006286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6fZexvMzlS57FlcyC9jwgq8Jb44X105OrNbzoHVQ5U=;
        b=Awt03P9sBYNR14kCYS1PYgWnYAHBWaI7OKM/p5OC/3x7/u2mzcLQ31mE1bHOqPy78c
         P7w1/n7qtgghwgRjhNjRmQz/rXFajwqti9n1T+cfnzCE/EWu6JX0WyS29PoyFjISVW0V
         BBV3bd5nvGdLC5uyUCm1jRoKTQ8xywKBu8txk3NO083yVD7CAfszqfpE++ajksw1L9Yz
         Cm9Lkxn8Xk73S+O2Of+68kBHvU50n2M/8OIttp37FKqSiYIU6q3/gUeYfGY3UamqtwYU
         cB0KyFqAlbU1UnH0OIwzO1SGKxiTH29NH5+0KHEk5hvClBa+Tk+ahCpvMOiRMlrn1V6o
         Fk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401486; x=1740006286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6fZexvMzlS57FlcyC9jwgq8Jb44X105OrNbzoHVQ5U=;
        b=A9bzXaC349cHXJrNCjC8SYqwX4g3xZlXNC6Yi35vY+JM6XItvYANdyVw4bdy65DqJo
         TmwJ09JH9Qhrghr/w3BOLTUHp0a0vV11yDE50KrDJibQ3g0sckSRIOrfL4ovYIR68v5/
         EHiyb5bvStt+VKDjpS89ELn24RMbyQo9pTtwBIcXIq9aW/UJwTDX6Zmz5BEMQTArxXA/
         CQ3d4bYMOPEd5LioiPhVCNKQ63pVaPWEhosKsxIDbFLpc6mi2yqfDwXW4k1QI65ysPT6
         hAmYPHES8BQuPKQ39Ok3O4ufxTSBMGdtPWQh1sotBqYn6Nz3J7MUOnjzMiUxTpUbAaD9
         R+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVRnJz1vQcR8TbIR+vL26+Yo5HbMrbP1AH0itu6uG5dlIzehkXH04LYzrfnzjakUc5EuUeMtnMwCO0hGpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tTqMxvQHeKs/XjBufDQ9n+x8JuF1GLxDThtxgpuhf8k5HUqZ
	DCcBPp074bOv1FuyyI7y29g58kaW12UxTUN5IrbJJea5GQXv4YJh
X-Gm-Gg: ASbGncui4CfE0U93I4wT6nn63X+Jz/QW7IeNrIb8B9tHQWMZ3ef25/YB4cEUPHSZccZ
	8/1Ujb9vojgUUZHpWFk1lJH8Q/I/QbjYOHlBsPeY2QENhDs/yMb+Gc2j4PEkTyUjrvknZwvHc5b
	0URU1IcFCjr1LWO3CRQ52YbSWONjraVJa6MWNKiRd0Plxhay4AOKFrQou96UpkkCMphTKxHXsGe
	XPvHoGjaxjnpWwPMByoUN5uTM3xInlmxNDBcVYIQPZfMjUpaKRK0L0AzarRpnvlWSQnHx2UcT/N
	Xj6Y8GgKcXJ7/gqBBy4+Q2p3
X-Google-Smtp-Source: AGHT+IHP0p+NONiLl7i2Vw7OYvZPcYWuVz1tQmt2LIN0LjY2OtrDWpizb9LboFu7wNKv18MMihvTqw==
X-Received: by 2002:a17:90b:358d:b0:2ee:ead6:6213 with SMTP id 98e67ed59e1d1-2fbf8f59ed1mr5770571a91.19.1739401485964;
        Wed, 12 Feb 2025 15:04:45 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:45 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Date: Wed, 12 Feb 2025 15:03:47 -0800
Subject: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
In-Reply-To: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=1738;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=y4Incp0qb4B4ngPLB+sALUgrKMocGxeOHTAr68tsUbw=;
 b=Vqx/NFaijxFNP/RnAZxTLuD4GWG+Eyg+gmPQCUi+e2pVNsHZnPUs5Ow8PG22uJ66Z56c3Jw58
 2AgMigYprCpCCP64ekS83C1DDQfTO+hVrVLsPfH/cwQ5AuB69VpWm/G
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=

Type-C DisplayPort inoperable due to incorrect porch settings.
- Re-used wide_bus_en as flag to prevent porch shifting

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb..a21addc4794f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -94,17 +94,21 @@ static void drm_mode_to_intf_timing_params(
 		timing->vsync_polarity = 0;
 	}
 
-	/* for DP/EDP, Shift timings to align it to bottom right */
-	if (phys_enc->hw_intf->cap->type == INTF_DP) {
+	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
+
+	/*
+	 *  For DP/EDP, Shift timings to align it to bottom right.
+	 *  wide_bus_en is set for everything excluding SDM845 &
+	 *  porch changes cause DisplayPort failure and HDMI tearing.
+	 */
+	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
 		timing->h_back_porch += timing->h_front_porch;
 		timing->h_front_porch = 0;
 		timing->v_back_porch += timing->v_front_porch;
 		timing->v_front_porch = 0;
 	}
 
-	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
-	timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
-
 	/*
 	 * for DP, divide the horizonal parameters by 2 when
 	 * widebus is enabled

-- 
2.43.0


