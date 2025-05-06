Return-Path: <linux-arm-msm+bounces-56974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC4AAC9F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1BE7982AD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC028466C;
	Tue,  6 May 2025 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dhGl5gCK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA0283123
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546516; cv=none; b=u8qgO+xKUIEfH5b5tWiuUNSMgU+VWcl8Eg9osi79hebp9mpPhDSo/l5zAbFxs113Wt63P5NjK3OCHOecjvPAWrZYBEiEdR4SjW1X4QiKSK7MhJm29s6e6RxTAlPNGnC1KGl0qJGw5SLCS0G15tdaAaQRjaLbbH1ZTF+9OgYjVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546516; c=relaxed/simple;
	bh=/Vf7BSjg/MaihhtMFivLw4bpSJ257f4gu0+UsGFzZC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NpM9gHSc/kSTM3DfrHSdhVOhmMSSSMYfUUaNTLuZwuN+RIKV7qFmjntF8ksrYpJiLWHbUXuxS4S3faKTwZ6eKHW5aAvK/Osu+ioVebjawug+6PzEQ3TDvayRl+nVqX6KKeBo6OA7ER+PdTsD4e+Tgj3tLcrYJ1JdVX8V9gvIcQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dhGl5gCK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3958186a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546514; x=1747151314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlKc5OKCjraOL5Xq+zClMPaANGiwyVoqcG5MXUiBedI=;
        b=dhGl5gCKzjYER7EQZJXK5tADJ94vaxySqWOReABkwvUnZ5zmhSG1gomyAK9pKErXDH
         R0VA1ZFNA5qBtkohF7vAcOhdF+AaUzuAZyPVS9+q2Bm4mqF0T2Ud9aNcT+moIHNl4mcT
         WN5eQ7FD9MHsG5iNX/YHWnUV31anVmMxtiM0+KfZb4+6ZqRLdAv9VXyjg+9BFB+e58Ca
         pxRM8WYvZ5oy7txz6/EfYj2Ad6x8mGO8EWgVU7+4Dfq5Hgmy7ZxokX7JF7Vo1Y6kHHhG
         jh3fIKa52JiQLnbET/yEVnKIkQehc1JFeWAP/2i1+b8nw+qPyS814OHr8Roi7sG/MnAz
         ic9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546514; x=1747151314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlKc5OKCjraOL5Xq+zClMPaANGiwyVoqcG5MXUiBedI=;
        b=cyZAyic6O0iWR09vUZs3WcIzDKw0aSXa0HNpzFS/vg43HgyCKoOLwCieUv9T61GlFZ
         dzx9LTHBvYoVlfZ2/MoPOkiJCLsy7pAvm5SX2nkz9NApKsC7wwueFE8cfApP536hi3Zn
         S8px+280ZPz0kXdtwHSLYcSV8PuqrwyQAN5r2ySxACycFnUImcJKaHer9n1Z9WyM9e0y
         c+lqi/5c5K78+jmv+uyMUhTy2Wyf8XwdmwYaWhGclxNw3aIReK44wMxb7MU95MQ1la3V
         d0PtAJ7UzurcOrO0FBxYBhTnIrUyLnin6ymgDD1WkxOy8w/KohEwd0ol9dLRoYOlIvqI
         Mt+g==
X-Gm-Message-State: AOJu0YyLp1qT6wG8oBvhocl9geVJ+k1qn2FMVPPtD0ZKoKuCCsdS/rY3
	mfzxrk/onfyS7ys1JAFNIeWxeIxSFXXTmlUNHzm1/minYQlXmMSVBfonn7lRc3r8h0Ns6pBXMaC
	6B73GqQ==
X-Gm-Gg: ASbGncu7z9G1iO/opQCLudpI0bgxf6KDzW0QBCKFikYmedWd4KkncHkySJ4gzCOh4Qp
	HOHiOchrBjcyR58vwY6gqUP8tX8JyG8Msf2oXBemrkthwMaY38/YskGxbzsJ8TupqLh1tgTcugD
	APdYGY8FcB4dgnAONr9WsX5WafNsRYCShGfxCDTUcX68CT/VIkYtEjwZ7FCVuwLcdPuoF5khxpb
	RWs6eGluK5MYoBL2rnftnXPXRkUBwL6lEwMGmbzafEMmSfffShXR6LLKgOBRClIxjhlLLormgiv
	tG72JWgDJfvnTnXDX7sIIcOzrEaX0jUhr+v30Q==
X-Google-Smtp-Source: AGHT+IGoJn2EvCDGjtDpBNSI5Ux2FQ5/eerIPyReEspy9plxak4A9pNzUDInz/bSoQf2uKP3NKltmQ==
X-Received: by 2002:a17:90a:e706:b0:306:b78a:e22d with SMTP id 98e67ed59e1d1-30a619a1979mr16535974a91.20.1746546514126;
        Tue, 06 May 2025 08:48:34 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:36 +0800
Subject: [PATCH v9 06/14] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-6-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/Vf7BSjg/MaihhtMFivLw4bpSJ257f4gu0+UsGFzZC4=;
 b=VB+iiFa0JUzWXa8nR4U0Xk1+uQn3FrT56o24OMqbgG10ZXKL2Je/ktWohVnSjsezBF+tleH6C
 HFvipTLbJuOBlSSOKgpzp9EPkIEOUPCzdDibIEupyUzU23Yu+/IPIUQ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3edfcd7d49c1efb2b7ed2b9f0cc38a4b3073acf6..3e4ff345bd6d9c0e2a08274874fac40690409cf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1157,7 +1157,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1236,10 +1236,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1


