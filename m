Return-Path: <linux-arm-msm+bounces-33618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D4995FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E434285D22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 06:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9B17ADE8;
	Wed,  9 Oct 2024 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jS1J0YoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788C136341
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455973; cv=none; b=Sh9jlGoprBOXHR7btv6nYwfH9D+vM33TXYymro8jLnMvtYhwhuyXHtnOsHbUq8JW6DONP9yMTuoAMUtW+54kL6t2ssziYWi3ZrXnVIWCYYmARpEEAV18jW546TPTVamX2pSmQZ2W00UjHAi00hcwbIwaUUVuRONLQ8iGvui7ZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455973; c=relaxed/simple;
	bh=6lRuPczLurNQ81XiNhe8Vb57IXR2f8Atr3eozl9XC1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WS5I6j7iAFPGLRMKARYi1QLXTSw1KKlx65Z7FagAyuegoPPlUxc/3epXQwQeVsp4Fp/aT3zv5D7KhRYI99QBEL1irkjO+HBFNLg2yt1yITDB37QUST/IiyfGRhIfit72sWI/wEkEa7KxomIsy+XitcyEUdpky8OkW1Z01L5CeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jS1J0YoO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71dfc78d6ddso3260267b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728455970; x=1729060770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MVeW6UV3ttbqJXjuqBIKlAx6utQGRVi7urFzdcOAgg=;
        b=jS1J0YoO0EJtOglvaJAPgQefnosKVlA3KI7tj6GHc5xovBGWH5e7NgPpA4OJdlWaj9
         lTu4Bbqd9RRHpgWLb+RVbfQG+h/4ozbQGoNtwkFfmG+IPQrJD9XSlUaYcJrL3aSYx6CO
         IjEHvzFMnLRj/AWT7/us9J7a5Dh7mrywMxu9isKmRzv8ncLJJq/ERDDlU1MQqfRtBdYi
         TwuD23z5QY1b91y7GdiGu7f+r83fEHXMm1guSBeNodOOWsRcvSKR1PrVLNEh/hKXargV
         qPQXN/UAQHptJY2gxg3h/nlopLLraMv0vbFpNOUqmS5QoOgZS+uhgWLw7GZCQm7aKYgE
         /POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728455970; x=1729060770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MVeW6UV3ttbqJXjuqBIKlAx6utQGRVi7urFzdcOAgg=;
        b=lqWrAsSETBrHj6qnniftisFj7sI5Q6CVUWuph5iVPCNpeom0DOz0olv6OsUuLsEWUE
         JxKmQWzR2wLNDc+01j68HWLLyQ1kpjYR0LXZIZJi03HaqEBxOZUJ3lqnJxgwytSfsV6E
         T58fO84LNksBFJbsCZNDXTWQCZW0jE5iW4NfGl8lrfqPg3pH4CnD/n8LU3NzR3POqcqw
         7o1hrfpgqUM6f8FkracTij0cKYeSMmKU/gKn6EpXL5j12MNYmiHOAg9yCfLSgc37eOxa
         JeVfYs1PrYb9bd+udwZmUf6mf9Pe49vdGkQ7F6MTPrkrfIrCd1869/1W8lsGbqo1hjQk
         FyDQ==
X-Gm-Message-State: AOJu0Yz6utpp2GFaytDnB8xPVLbNksAzhKza3LLC/gEWF5Pezw3v0H9F
	7/2u9IcnxyOOplWEj7n4GnhkCcVVllFLmtB0RQ3Xf4kWteTxUb7nala0OfespRU=
X-Google-Smtp-Source: AGHT+IHTy7xygv7al/EQDOvd0D+Ec9evKh4dzfTL1Zh+wZCn/Dr6FM8OvtntTMFlrHrE7LAlVuVcVw==
X-Received: by 2002:a05:6a00:228d:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-71e1db7a9f1mr2487895b3a.7.1728455970551;
        Tue, 08 Oct 2024 23:39:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7d209sm7077396b3a.208.2024.10.08.23.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 23:39:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 14:38:42 +0800
Subject: [PATCH 1/2] drm/msm/dpu: Do not fix number of DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-1-139511076a9f@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728455958; l=2308;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6lRuPczLurNQ81XiNhe8Vb57IXR2f8Atr3eozl9XC1Y=;
 b=QcS5lFSo6pkfbk6zvBqAr8UaXW1dq4zBfJMN779ItJSZ/oiaM2Z+0FkXD4/qUZ7dt11NGnGRc
 KUN519ZCaiUCUD2nGzf0SurKixxBS87ojFtFaVhWDxcRuCMSGtYdWoO
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

If DSC is enabled, the only case is with 2 DSC engines so far. More
usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
So get real number of DSCs to decide whether DSC merge is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b26d5fe40c721..5260e2440f059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -202,6 +202,7 @@ struct dpu_crtc {
  * @mixers        : List of active mixers
  * @num_ctls      : Number of ctl paths in use
  * @hw_ctls       : List of active ctl paths
+ * @num_dscs      : Number of DSCs in use
  * @crc_source    : CRC source
  * @crc_frame_skip_count: Number of frames skipped before getting CRC
  */
@@ -223,6 +224,7 @@ struct dpu_crtc_state {
 	u32 num_ctls;
 	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
 
+	u32 num_dscs;
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6bdd9c21ff3ed..39700b13e92f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -548,14 +548,14 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	int i, intf_count = 0, num_dsc = 0;
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
 
 	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = cstate->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1169,6 +1169,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
 	}
 
+	cstate->num_dscs = num_dsc;
 	cstate->num_mixers = num_lm;
 
 	dpu_enc->connector = conn_state->connector;

-- 
2.34.1


