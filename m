Return-Path: <linux-arm-msm+bounces-50016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B79A4C4A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52C7189765E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DB5215789;
	Mon,  3 Mar 2025 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wUmx12f9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE12153C9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014912; cv=none; b=bckjbNn2ejzKpIIaR0x9DtoxgL4jSM63/0FWY+hM7Wj+GdhseksfnGUQ5wextNgzHbG71AxPOA1clDbRQOMjKizFT3xvOFj0LMnO51y8BEjNFpvVOzIh0P5yNyOOt7xsIhWFXKACjAE7wc9Sm4QERVJfXYMEj8l+D1ZLoeEYXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014912; c=relaxed/simple;
	bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBPcEtbbi0awGnFKqPYyUTPy3KEmrzMMN4AKG0E/oJNjLRiHQb/EyP/YHttAyjE9keLZoHR7swNKIk01AAp0vImhi0JQjjRnRmls8fHvyXuM4psH1e1bzPGYejiUXZb+nCUXBljUsdBrOK+nQqJwY32VliIfWxHTCQuW9MqjzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wUmx12f9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22374f56453so71502465ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014910; x=1741619710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=wUmx12f9mKcjeYNoBqX2cdUlyiYhkwwXri1dKZSWgxVeSaVCAvGP3pWmo2rTmiv5lU
         hAVIVAHIdfRh5QY5sYt3IFOWh4EwKCMEBaL/7adcyNtgYcCrq6BnjRmjisJKq4HstI3G
         GMeOrjxVis16wbdjcieL2Iy5BJ4cIkhbhZSOfdS6awu5lyO4v4qd5APQYi5sIJ01ZEDq
         UO5mke3O1oGzD3OksOVwAmJrhIzc+IwT8qUbelyD1169yQEIrPCbGJNM0uG0dqm2PRo9
         /xfjLSaQVmHcpXoPMwgpbZQpo4HMU7eLupiWzflHO1SQALd9iNSYrR+zUgTdnBeMblt6
         KaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014910; x=1741619710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=ZXHQPScgH6vQpUCCdBldfBVNzNtFRserxpC0rn9pBpbo2/tZIc9o0AmzDycnCHOuNo
         FMXCXC5f7ck25niKnceKLv/spz7mkzl/pt+dopS+qIfLikAHR/ZFOEY+N4xSgPVqyV2O
         JphQ9MEk32LMPLB3Ro7xyQfA2n/TDcgUNGIOhccP24Vo0E2b+qV4U+tvg0JDcJt9IAp6
         Dhv3tDQuBbh28u7kxSnfKCZ8KUl9aDAxkiLTVIzHWl0EKTP2GbB/4sTwROdZA54htoAj
         4qmid0lJ/Hew39bJ+3ciJTNoOQkZttHFUvMma1e10n6DvNo+VUvfLwNA0vz3z5QcQomd
         toRw==
X-Gm-Message-State: AOJu0Ywu22DW1GneXemfnffx0Agl2hZOYHWYmpXWepRuvTa286ftxJZn
	IpmByLQ8No/cyWmelDqPFIMRcAO7sEgAtkEqtLG7TEoxioP+92KnXEg9VaB2uWI=
X-Gm-Gg: ASbGnctWXgn4su50tnEB41PeFM+d/ep6h9LTte3b+VLE5cNfWxRN9SfRmtCOiX0lCbm
	kG4ZK2iLlgddam5cdTsNnVvLZvE5fY0CYagw2XT7WuQFenYIzHBrR5vkteWSfyRnGpYEENahKec
	EgBflb15aooSd0CHZTHI0vsXI+gxs2r46cf1mXjAakPI8nszQ+YnusROKkXzyHTUERnaT7BbSAD
	r7cnU7hf33LVPfPYlcDelQs+MP9AuYERhZz/SmNHQn2a5fiZT2jR0Ablev/NxEY6W3EFzKduWsS
	16pmTRzjGQY3rCktcv+7an8P6qjf+w9vm/TOaNIOZg==
X-Google-Smtp-Source: AGHT+IFXQFVV2iDx7zy3Vu2t/VrO3jNK2d7/LTTuBESSbmurMHpjbXZYGouAn99h2/O8Evq+lSAPvA==
X-Received: by 2002:a05:6a00:244d:b0:736:5504:e8af with SMTP id d2e1a72fcca58-7365504e9edmr6999431b3a.24.1741014910436;
        Mon, 03 Mar 2025 07:15:10 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:09 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:32 +0800
Subject: [PATCH v8 03/15] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-3-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=0/rhKu0LON5yZrlYDkf940GcbT6nSV69ScJn5vFP7k5m3Ms11NY5nPo997caC4RruAvKsAnc8
 vIrv6QQczDHBve5G8aFSo3D1SGx0UdO4M9SvMrA0P04XhlYQO87q5Ye
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d..5b98ae96bf5d46872a7af801d4157820d72af01f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2027,11 +2027,11 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
-	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int num_dsc = dpu_enc->num_dscs;
 	int this_frame_slices;
 	int intf_ip_w, enc_ip_w;
 	int dsc_common_mode;
@@ -2039,7 +2039,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2068,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1


