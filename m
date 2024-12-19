Return-Path: <linux-arm-msm+bounces-42747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F09F7620
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042A17A4DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED6A216E1B;
	Thu, 19 Dec 2024 07:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfA1B3rB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8621772B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594587; cv=none; b=UREBGlTDYuYUVa3YlcRSiysM4ZXPS9SgkDR5BMh8Kg19SBjv7bUO6S+OZSeWE5XayZS46k66LmIQzzJQOVaJhMcC4OeawbygqFi7oxlDRePsd+djoFOCjQM8n/WGz80ZIaMBODKhEzIQbLMuf2cVWV/MsrOqTud8UzWBY9FTors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594587; c=relaxed/simple;
	bh=dEsdzF1H8mOIfM+sxcd5TqOuqI1FUZfMvRVAMT2Swjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqd5Mzs+PIQ8lAooo1w6a8hUxPxB4bB4+rUPzF6SLY8qh8iE5/FB5XKVaHaYYnfPdW5NXb8h0jax4vKT6w5/xdLEzvslqtEQYi2hzHvu99mnlFptKEqzIIsTH9Rh9TYxWEHD7GlW+iGWsBO6W0sbNOGX3w0FIumTmLbo6B2b5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfA1B3rB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2164b662090so3973985ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594585; x=1735199385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL0eJAJsn+bF1xqyLJhetwK7icVAiboBpbquincLAUk=;
        b=hfA1B3rBgjRBWHj5npffCQxT5B0pvthpX/iIycifs5aNZQStpZ7Sl53pTnIg3mSS2L
         grECRfQEHPQhixIo2WPEDDhyuKIvs155rI4+eRMiFMG6g4lp/yE9OkkIA6IIsJHIVA2i
         MXyau5AS1cdMvFIYvcAXC2JexGU4zYirRE65vQ+m15zD6Qnh1yxLkvo0iWUE6IObvaBO
         TKXOJTwKz9l+E/VFnKmBP93aSK34mBq6tonNe9+c8XaW/CvZyCFSY/U5T0euhwKR5iaY
         yKxSwZ4cpfZ8GRLV9Y6TZ9M4ZRjDlB0Lh+98ikwB0HMYRf7J9IlFXESmGlKlUonsiXjy
         RlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594585; x=1735199385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YL0eJAJsn+bF1xqyLJhetwK7icVAiboBpbquincLAUk=;
        b=C9zmfypeFs/mqOF9xcU8oGMDEcIyfjS1rdVabPz9iGTHhFJtzewo5LdGtRpuh0XihC
         6TqG5UMHiv6tqfhD4P+GyMEoIqai9wJd5fLwjMlCvXBQixUlE1EEMl70Nehoqbd80j2p
         k06uhHOOH41FW3hDmRqCqDbd6aUI0a5KwIovOjZftdX5xSsySYnZzl1Nbct8MXLKsCR8
         yW6l4x+LQsz/ple+c0RLShm+GtAkVVh0+p25PYYeh33UQjodo637FRKZdmLdTbL6pmHp
         xSnqNiFFsfP6UnpArrLWUJrM7T0MeetGZFo91vcaF0ds7fFqZ/Lq90tyWjo1sM5Oj9Yo
         qPkQ==
X-Gm-Message-State: AOJu0YxkTpsYTGDxh5yfuRMcillbKgCEes2o5X1ZaKgjszPHTka8ck/O
	Mw3sUCkmbiPTgI8DyKEtXXhqvDvvhk0UuFs/QgW8BFGRn4mgjXyGrXcWSSSCqiA+zUOaakb+I5K
	47j8Z0Q==
X-Gm-Gg: ASbGncuka/8zDdxotGqidFTxrYDdR6v5wq/8O7XntmllQUS/1VN8U2ifzosdJnTFzpG
	KMc9nu+i6LBfyTi5J1gh89qHIgfLFqJjPX6nOBC7k0En3O7YKyvbI8sDK0v5jdOwuW52jZq2hd7
	dJYEG3eYPAdITAva2ImscvI7FfKgQFy0vZAtQNZ7WRgDeX21Em8XwfuvsuWZUIQQdey4PX7PbQ8
	UV5SQ5rQlP0PDG97HiAZgswCkqzlACmygobWI4tjFERfg8sGviwVQ==
X-Google-Smtp-Source: AGHT+IG8rv5UfI7SqBNEnpsP6TqIUeKqwCRsTWaZTqEBm7avzTjZMTdrTbSgeuVwf1Up9AP+9yofcg==
X-Received: by 2002:a17:902:f542:b0:216:554a:212c with SMTP id d9443c01a7336-218d725b78dmr84056735ad.46.1734594585506;
        Wed, 18 Dec 2024 23:49:45 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:49:45 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:20 +0800
Subject: [PATCH v3 02/15] drm/msm/dpu: configure DSC per number in use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-2-92c7c0a228e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1681;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=dEsdzF1H8mOIfM+sxcd5TqOuqI1FUZfMvRVAMT2Swjc=;
 b=rrqwTWpMtEAIaU36uDB76/XIvHkIBNMil6khUbR4tZDKfFmCUSldk1LyQIc7lN+lIjC8yU/yR
 uHMpx/08OwiCFgHnHxKMoea7xtwZyW5YCHEUxhMwkxJ2WVoHoyjsUse
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently if DSC support is requested, the driver only supports using
2 DSC blocks. We need 4 DSC in quad-pipe topology in future. So let's
only configure DSC engines in use, instead of the maximum number of
DSC engines.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 650df585138cd..cc23f364dd080 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2028,6 +2028,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 				 struct drm_dsc_config *dsc)
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
+	int num_dsc = dpu_enc->num_dscs;
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
 	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
@@ -2039,7 +2040,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	u32 initial_lines;
 	int i;
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (i = 0; i < num_dsc; i++) {
 		hw_pp[i] = dpu_enc->hw_pp[i];
 		hw_dsc[i] = dpu_enc->hw_dsc[i];
 
@@ -2068,7 +2069,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 	enc_ip_w = intf_ip_w / 2;
 	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+	for (i = 0; i < num_dsc; i++)
 		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
 					 dsc, dsc_common_mode, initial_lines);
 }

-- 
2.34.1


