Return-Path: <linux-arm-msm+bounces-36336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5389B52E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19201C2142D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C600207205;
	Tue, 29 Oct 2024 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1gjTI0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322731DDA2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730230981; cv=none; b=LBVPt6PfG3uAqXoCYcyosng6OG02nJ3Kx1jf4jwpR+ftOrJQDUOBVL0IxK8loiLftn0XjS8Iwxx592f6aWDSfrDfVw/qc+6Qn87eEDjWy7hHZEpIWCtvf1msxe0zFAQE8zr/P2gXH1aRshZP48kCQYxM8XElzlW1wV1xeDj9JfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730230981; c=relaxed/simple;
	bh=YRUFJFFUQGeCCDsawmQjya1SV+7xF+qSakEJtukJYsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sRmlrEPbzHBhjUvEoxgBw6euX2Lct+nAaEmzy6ZvG1Mjhxona2RaBOfxDtDdySgBH4l302q8yOLhsWvBxfQopuKpnYxjQQHKL66HPNFkrWozFiKCveoFfUrcL9x3aUZT2roJRHdoSKXXRFnKfinZILpy0SVESd9fDDvbMGl7tCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1gjTI0P; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7183a3f3beaso2908785a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730230978; x=1730835778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TaIdkluJRQnGuMAA898Bqtz2g8g1yMGAe+YroMJ3Fzk=;
        b=U1gjTI0PqK7UR/fE0yiIx3D2vLSjGPjiuCZ9ubDZNQhJy1NHxWm8pfxqP/LUZj7lsX
         7FAsMDDSNdxWh0tUo8QBUHEGI9fol80omIKHs8hEjAx6D2cRj9xChvHBEfSDPpDW+je6
         CbUXU5uI8k2t2H5a7p37ZVvVYzGeXA5wMRVKCHUU1mStbFMAq7IKS9cam46druZmyhrf
         +T9sl/kgPG5gTrU4xQWySCoMZXO0QJ3wzRE1lQokVIXQxqTBYkuDGuaw1onPA46RV6KU
         BLtitX0sYyvIqPz5b9Vfg2wvlZP5+lN6z2GbOymQfZyj9JWBdfHW6rMl2k7Fwnu4quXk
         38Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730230978; x=1730835778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaIdkluJRQnGuMAA898Bqtz2g8g1yMGAe+YroMJ3Fzk=;
        b=rKzqfva08nanqTIHFeJX/BHX4N6pGWPHQjMVo61lqWrX1pa+0lQTLNc+pjq5fP5GxF
         CMBNUSPWoSe99jeP1TxfmCHNmmUzp64WZB6ujEnkj2OpTGQ3qXMj1BGDBAaj32qgfrq9
         uJO0fLy2iedBVYIFL9XCqoTrpJMOseJkUux4a8aRuMHEoS0OqT0qO75xIg+cttNC5o4p
         q6I369bDn/nbR+MaGk19Ficr7nqFECdqR0zpbp2tT6jOUm6XkSQ2CZKv2ar//OzjbNvm
         u5PtLYdaXBNq5ULPCBVk/sXHQVS9NI12LkFKKcwJRSCj5zJwQLiWvkZ3apm+IlKmxdBH
         FklQ==
X-Gm-Message-State: AOJu0Yw8lfF1NiM0g3T5A11Y8U8iNiHiIv6gwbM3MTNrJ9894i6O1T7q
	rpKI4CqfjL0hTVb1JzYp7+ZC1eJ+wTZuyVP9gQdGKZs7n0bTKFEd
X-Google-Smtp-Source: AGHT+IH8Y6mHGJESumZCtyH9ApNxBWJ7xnyPC3msCvWWq8Jvmf+vsM+TIkPiDmEpzNu1wHSKaSg/mg==
X-Received: by 2002:a05:6358:d38f:b0:1c5:e2eb:5aad with SMTP id e5c5f4694b2df-1c5e2eb5bcfmr138356255d.20.1730230977077;
        Tue, 29 Oct 2024 12:42:57 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d1798a839bsm44970316d6.36.2024.10.29.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:42:56 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_kalyant@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v2] drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
Date: Tue, 29 Oct 2024 14:42:10 -0500
Message-Id: <20241029194209.23684-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

There may be a potential integer overflow issue in
_dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
a smaller data type. The result of the calculation will be limited to
"int" in this case without correct casting. In screen with high
resolution and high refresh rate, integer overflow may happen.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
v2: Adjust subject.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..260accc151d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -80,7 +80,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 
 	mode = &state->adjusted_mode;
 
-	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		pstate = to_dpu_plane_state(plane->state);
-- 
2.25.1


