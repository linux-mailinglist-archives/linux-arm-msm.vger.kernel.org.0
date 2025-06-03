Return-Path: <linux-arm-msm+bounces-60098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DE4ACC0E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF913A33E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A292690EA;
	Tue,  3 Jun 2025 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZoTkVHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A52686B7
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934657; cv=none; b=OATx6cmp6PDog95szZhobLcZaduHRyJMJjGGoWfva0Hz7R8PxTBdsVqXQl/K1uzijYxV9gRsI2ZaRmwBqQBPtgpQLHtPJ2l0wpIBX9lmWMOBVG4L8olnJbEYEGRRf9HrUxU2oAHODWmtQUxkUBMTvEbNnEkvWURXi23GcLsZ/2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934657; c=relaxed/simple;
	bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUdI20KrL851YqIbhFqz5HTgEvuYCUqFW+lc9cfmwpzxjO5py/iX31zFtrP0Z9ZFaLwmRpznE7cJEPPhvED3LXLe6RkBRaiKXjRHadP8sOP9zh2kSMoMZoJsCL9eM7nxXfMHdM76FT1X4Jgt8FdK7bKiECfFvFesMThxsYHN1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZoTkVHS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso4251403b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934654; x=1749539454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
        b=FZoTkVHS5jxWUu5XqdZP4WwdfJ82YIUIbk4K7mdZqWkVMYu4vUqo/uuTscGvRGqIYb
         Q52w8ODl8G27vndJ2XaaiXzpzFCGx+xF/Fvay5Ga7wbxh3g3WUVezk/T5W9WDOAYvwEJ
         C9nrDAE5RuytsDNcPvMBrUtUrcuazDQX9Td0S/0iBeKXybh7t/7k9vCcqi6pfIkSyRPR
         YBxbS0VT7UjjbS5IMgxtD8BSUKSmfLofR6ou1vlj7UyE8LkvY/zt4jT1v9i0WdKPqC0I
         7L3nk7Yi45c/hKk+c87rOyji65fu4/dM1YghumGZQ7PFl4RcFs7p7sbsnmm8kZ6t+8cS
         T2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934654; x=1749539454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
        b=OYGA62DAUSqhi7Cr/A1lcaVPb8UEwHDYQzYNdBiq/zG4pbGyF4hmoWg9x1RLJGLWN0
         pz2bcHZEU+Gr7c2S6hZhkOdaaL3RcY+IZLywwI0TEFonz1pxaPFPdwY2FEg6oxdwLWTT
         ukTvumAadmq72EaZRc4lWKpdoX+Y84MObefa6deo/i0zdAFgd2tw/wMtDw5E987ThLBt
         Il7n8E7YGsZnQoLqJrHKI8GfmZhN5G1C11ocrJ21EYU+qM7ea6V6itAveuEQB62nzLW+
         v5NS1odOJuOnmW/oAhUeVZndVC/XCFKw+3Ri6G1nlyNl3SNWjpPbBHNGtACmUDeTQqxa
         Y/zw==
X-Gm-Message-State: AOJu0YzN8sZPJe8oGDEvfhwW1yotdhUT+ZfBhN67FMHUlReuEQ0D2urf
	JWFFErYiIYNkNI/7/SlTmebuUyh2w/B9+paER6u2junLJc83vw5WPBlU7QkFmON+GQ8=
X-Gm-Gg: ASbGncuI8RTqi/mEXlBVAlS0bLycQP2LbbmSp4TyKHgO/v5PTXSUb3fxu9N4L9Bm9n6
	tIsWIzk5DLSesnj/0H0oHDsjpb2mUK6tUd/Y1ltFBg1xs6u2HCP6zYgceFRZwvrk8jaiTfLopJF
	wnZ+bx7m/CGfq2ZH0KwVBVtsZuse5bVcseoSqoTRRbJLtTksZIJMTkNTOSM+G9rMpeV5yszA+wm
	1gNL4s7uz19Gp2c36kocKcFAc1rfmUfKPnYEts5WbbdixdPlHp5qcYN7Y75cYXkvl0fUDsa/I3s
	KuHDwH7o81O6lqGL36Q/3FDanuvLOw6eF6tmarLIWBIwLF350Q==
X-Google-Smtp-Source: AGHT+IEjJGNuidzGcf6sJ/A0meCFZ2p/UGTGDCh8kd70ximZ8dtNCwm1meXyCFhsmKPr3Tv9lyZmUw==
X-Received: by 2002:a05:6a20:a11b:b0:216:1476:f5c with SMTP id adf61e73a8af0-21bad120c57mr16078986637.25.1748934653870;
        Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:03 +0800
Subject: [PATCH v11 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-4-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
 b=HYENK6zyOmddtj3kw/I4EdLhSrfkzfZ0p/SQUiDA02c89wQHKvf9pcRyzEdpvnvPF6bqlrhpk
 Ql/a0CaLDNpB6KEqsa8tRrmCptdMW8z86dhWOE+3vIpDR0s53qbgC+X
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
index 7020098360e474ee149824a488d912a7ad8ed06a..be8102691b99d3b381476ff844ddfd28fe17dc7c 100644
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


