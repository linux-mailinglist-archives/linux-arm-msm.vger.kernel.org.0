Return-Path: <linux-arm-msm+bounces-48220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB80A385CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 159C37A247C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235622206AA;
	Mon, 17 Feb 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaVDDwRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7921D58D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801819; cv=none; b=bpK9NT0wwNKfbGszDUGzKeaH2hseTBAK2IX64nH96KQvLcedXsZ0m5uDwVKKTxuj0MejI3suu3rhjU0ybPi76P1esdYZj+FLtYeygJKFc/UCG+4ywypxiz4KpeNgWNSYnPuVHS49wzCUDRjeOLJeQlyYECRDnd7yrq6zL6JBoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801819; c=relaxed/simple;
	bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLuPWDGbTwvqv81201mGL5+Bwq3YsszHpP21XMA9KuTrCVHM3prVF3ZOhK2aPCl+hDMoniPKy2P18aD4vRIrNpfhSZ6oKUm4qmHPmSoiNdbktcO2Gw+Wb1l6KXibO6bNUMyyQPZ7BTkCoF+hB78fz/v577wQzdutUErFuC29WaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaVDDwRD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-219f8263ae0so77484715ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801817; x=1740406617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=zaVDDwRDbOwRI6RYpZIlKt2ftJ8J8W1P0Oi+xBhKpShnTyPlNWMgOhJhlhAxfuhDCj
         vrUkPjrnntenJR7sBFyZqT/O6UbiGN54wM+TFG0UeBi9QYawUhYMdMG2zHDfBYkPwDYU
         X+ehrMMMAuQNFu49/oEarPLVm1NrUV4n7Mn906WHwAgx7JhiNgqSuroRVPucr63uX5g+
         SgFGoTZY9nyYe4rAW+B9zGPs/IdfhK8M+pboT6ZijlL/tv+Za5VWzLhpLNUoBcaqpWv9
         Oe31LD042VLn2sPSF17n9hJ8FWa0F7huxjJKTJBjxocQflYzbaQKMWMaUbNNbQUXbH+c
         7FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801817; x=1740406617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieoJPWE+tVOeqiIoh5GOinrnACdNHE09O5GdzPDKAj8=;
        b=uzYLLbPtJOfmcZRq8j+Un1+Qpcaz+rkEWOFv7LQmaf9H38fkYGAbbUUQplJhL28VpW
         xKjodSGWrP1Vcwq4CCHZtnomc+RTWsjTLSMlZfpdZelNBYg2/NaP0y69dbQCj6pbQQyi
         c4T4T0lL6WV7wTw4/iXvhRCujkCoX8lUZhGu/uIYJgcgFTsLPtoZ3uR3tPk5wuBJ9cNg
         UnK042ZItasSRggZ/ybdN/1HySz9aOKwlR75ZzDVYPZDckzrU4E+JP/rTHWfQX8ZDqIA
         TQcuSNRxeZV1k9R0YT3e0wlq+fEgjfWe8hlWImQEn+p5aY2TWhItcYrxS8tC0hnecLpB
         CXvw==
X-Gm-Message-State: AOJu0YxY2PCaFcPZ8NvtCZ0xfIkFTPOMseuN2hPjQm2+4mw3AXf92IGU
	zUUeCqCpboUZGhZhSzaTkoVtgTdk4Ju/iesLgP8B4AIvRj3qr8zekBq7Ft1871I=
X-Gm-Gg: ASbGnctUeLaJ02m6X8pHTGyczQ5+I3JddWTVc0Dt1HzX6d4qJ1N/YxPxKc1uyAmEH1H
	+7qmQGg7F0wvLjEexBwJnF6CmXMY78tEMnZlzS/O5tn740NNC9+l1IYdxuy1FPWC4MWINOjF0xb
	HYX8aZg5HMpdzuM2DLOtdao8zlFWhMiFvqHhVeXNYruCGJKYmsyQAWFt/y3olXQxSjmtWJJ7koQ
	75p1Ey3Ai+MiEZMs9hWWKPCwtjRJpwZN9tJVdGcc7i8pM+KzuFfvEglemB8pDzGdxMwOro6bCZ4
	tGpggUeC4DiA
X-Google-Smtp-Source: AGHT+IEzS4KfqXP8Xt5GHMhRafBYz+RgwbGhXZbMd3m4c1JZ4WuTSy64hH8ktZu0531hH/zPEWjhCA==
X-Received: by 2002:a17:902:f802:b0:221:1c2:2012 with SMTP id d9443c01a7336-221040d8543mr122081405ad.49.1739801816584;
        Mon, 17 Feb 2025 06:16:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:16:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:52 +0800
Subject: [PATCH v6 03/15] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-3-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2046;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OxydkO597ugBLy/eoQLhIhZIi3C8VBz20HvkW34FMds=;
 b=lhqZ5hF5B/LxqlpWvqkkYt16wWBab7XyL2JKhANDd8P3fXIeDeCBYNDuOWhE5D35Gixz8qzDh
 NTv0ao21qDWBwzxlK6RGvis1Oqq9uwC7CB3quezik71QV5Xd72QHSdn
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


