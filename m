Return-Path: <linux-arm-msm+bounces-45419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31982A15376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A892A169AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DE219D065;
	Fri, 17 Jan 2025 16:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5XYqPaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70EF1422A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129687; cv=none; b=tBhgg+GyuJC4Yu64quzpbG5j3JICKdOP/rjlpZB/TmJzQTtRGwrSLRzQIb0q4bFwidrBe2fv0jcfuN/TTnaPDuwHnuCwmYPqm8V+k+vnqfoOAGpojzvPREaKaXBLspiGRZAhFf1RcyWWYQQepVHF38PjMMdPiczrECg4tHeHikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129687; c=relaxed/simple;
	bh=/IJAxmB/BdtaWwEww2aruOsoZxn/wFwYKiR9mHwh12Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfmY90c+43D8JoovrwOpIe+FvgcDxpWNb7KgOFUvMRRNz3/5wG6hR7LacAj6O+2d6gofqgy+tMjDV76extcbLZjtWvtmlPJ3XjkZbgtZOgGu5sKU6byw/USAkBTQdmLUIQEASXp5L7u+BwmaI/4A97UT1sFFkCkjIi9SNstlqM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5XYqPaW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-219f8263ae0so44186085ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129685; x=1737734485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEVWVBq2xXs3gtt987wJdWPaa0xRoePdABgI8idn7OA=;
        b=J5XYqPaW8Vg4KX5muzqacEKlPa2CSgB9tYEUWl+CPd7ftJJG3GL3wnX23XhQRz4e1W
         440pIveSay37H7VtvILkeHbfxl+Dq4a8UY5BjwIA0mqM9uZ5WUDlJ19UED2JyXzuxZ1b
         NwpNA81ARknu4dHUTK+BeLpq6RIzsDjocCY2KRZqHG7NQIRvE2U6iLiG7HtCdz93TjA5
         2MdxslhHBTSu/hBdOriF19Z7ovnMm2Jw45FhsRaMBqzwnZgKdKGaywxSjWgxJ/qh7MTe
         T07nlxGcUj+4oHcuoYehDdS+NTILumtdWLTc+xcerelOFh1dhjX0g5CsIChdajQuDoKP
         1Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129685; x=1737734485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEVWVBq2xXs3gtt987wJdWPaa0xRoePdABgI8idn7OA=;
        b=PcxVt7CWCVefY5PrApCVQquJGGU+no0VtQgiYeJNZttRPvEPIXfRmAgSqT0m8emDZh
         ZV5W/Ju0riz8Ko0OEQsMx16V3XcmKQOjUNEOYP/JrdhC1ndrkDoOBq+7ABf//R5S3eVo
         WLjF+tKPCv3ZqjycbNbZr7zfIFngU3DF+kSn86j6VfPMUyEYbPSJuUFde2/6OhQRQKqx
         OOODRw+mlgO9db2P8vMYtAHjI0Zm1+3F5qLKc/pn5x0GLU5Ml8mP2mMIeZT1yJ7YspCJ
         8ojl7/IkvPXkJUW9BzX2lca7MgNZj89X+lI2EMPJHfTusoCBKBLLBan//6/zPM7qk1i2
         HweQ==
X-Gm-Message-State: AOJu0YxyF0S2uVnRvmc1hRRQBEZrnI3Ys1F9WxB01k2I/Z/uOwO8/BY/
	B4e0a3yy+VJgmDjtlegZkgehQzQNSKtRlTOqPQNw9CsPKdhNMR9+DvmY4se/v0Q=
X-Gm-Gg: ASbGncsbmdIku1bN7Ery/hDQosXai/OFeAAbVYa8wkx62i4SQ6mu0dLq9h+rhnDqedk
	IqMbphN/UWa2M3+8D6k2p2equVb6aKy3ZM9S8ihbSR/+iylk4RjPWkrzbux4T3Hh0hH95MHj5VK
	yf/feKi0zK8M6jeNtokgt5GEWIxuFBjPPCefidPoQYw26AA4hxG7Ech0GSt5jGmuIPQ76z0aVtg
	ijuv3G2feJZaPMXtgWAbzjMylEnYWU4Q2dQNvs3LlM2Kxr9FwFd4A==
X-Google-Smtp-Source: AGHT+IFxJrXP7faCwGCcSMWQrZZnf2BKovwITEHCqVUVHulJfmXf1NI1iyX2QKY8MQVmxQNmi+lDyA==
X-Received: by 2002:a17:902:d491:b0:21a:8769:302e with SMTP id d9443c01a7336-21c3540a3a8mr50050375ad.14.1737129685136;
        Fri, 17 Jan 2025 08:01:25 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:24 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:46 +0800
Subject: [PATCH v5 03/15] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-3-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=1936;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=/IJAxmB/BdtaWwEww2aruOsoZxn/wFwYKiR9mHwh12Y=;
 b=PLo9rqMZUByQATi5cKV8NUWFtCY8QhDLLM6s5AvnWUqWUbZhgrg7FHqg5MARotXFVwlKreR++
 rPEi1c1y0aOBZJuYSdaP111TKAA8kCobONcSU9H+lCXL4S+swJF5WOq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So Only
configure DSC engines in use, instead of the maximum number of DSC
engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c734d2c5790d2..5b98ae96bf5d4 100644
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


