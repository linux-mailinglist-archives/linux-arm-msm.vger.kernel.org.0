Return-Path: <linux-arm-msm+bounces-63882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B73E3AFABB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E52997ACBED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C8F272811;
	Mon,  7 Jul 2025 06:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+3LvjYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8A262FED
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869116; cv=none; b=n3XkXTWk9uyen4W54bXqeLH4AWFI76aOMg9VWQfw++rLe5L6VfoRpBlWceKeb2L+sw5iMzDfrUFQfQHn6NtrNnmf+p9zwBQNOXN3b8TDajYcGOGLgN/N/D3lDWscCaowG7BLe9CwquHKGw7+EecsGVBXAisn4omInDKjOuCx4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869116; c=relaxed/simple;
	bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCdgbqoQQIap4hRvBE021vOsGhU1IZ5bshZW2B1P58CvtcrdwA25+kYN3UW78oaCuIlnZ+3iuVO4MbbuiivXTvDgtjlpirZQBTtAsgbukKTq8pP6pyqVDQUY5T8dDUsKaQQoIdMkfcjBA9J5sbCWIjyNniOPXbagPDVdAVBbk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+3LvjYp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso1368200b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869114; x=1752473914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
        b=A+3LvjYpn0ZeHEsrliihf6vnYWXd7bBuqa8HG0BTpVBsKbn4QMOPaoXkf5nddNxRSu
         Oxl6DkmCEvkS9PnHNgAVM1kKNZoreoeyUT2YutiHpcXG3CFeRQVAR0OB4JVwWoBL6yYq
         EOwGUVoG9t10o52DEWlxonu7nmku2pULl6UBLUpag/mP6ZEynOQWtvGndhckC+9cJEu6
         Vp7Znnivt9P9i0uaIFAYV2me32CANffEeekDZF3dEGl6+taByidH3iKFbsQgOZi/z3GN
         xVsNbtsITuay7FuRf9p1zUQw5ufW1LBrywHnr6R6jtnWYbY9B9cIOvUR+nmH9FO6oJ1l
         arwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869114; x=1752473914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
        b=rR1gsSi4MHwMj7UYcq3Jp9AvV0BGuedZKpI+PfPMDgnmuriV6QztZV4olTOzIHuXnY
         1XSE1Gk/nIg6blGaFLVaSAqIwT3ZOnl0o4D+0w1ok3ZaDtxQ9qGUB9Brim+YnU4NI93C
         LSC4JNLurBJ0rLfXoyMEpb/be+B0PNmwOYo64u7mrgJn8R6kpctgO/JtZ+lCplLJ8qY5
         sBEwbitgfd8A89OZ4tKtNCb3fA3rF+L8LFkWTO79p9cXHIE76fS+7zgXwCxn7N/EmoJT
         EXde2xxhqzFDiKeFu+/C3R7KaAiBpjiQDzjjFkJM5qiawf5hrbMjmFwsuXloujGgTzpC
         bhBA==
X-Gm-Message-State: AOJu0YwJSxB9uMmV48jRldo3yN2qt6zotK5tdYCFDPiYinAWEtZUq80E
	yqIogrPgUOzxET8uZZ0eNT4oWE8kFOc+vMr6wPa7ivyjxgzfJ8QpD5wGc2e7n4KD6CE=
X-Gm-Gg: ASbGncvtfFQtGC15Q9rOxIFu1htpA7io//W4qGmR0aOK2YpMjb0Gt3/kAuFuYfs1Rhq
	Ojms44fBgujU7bBUfNqpDhyJo1LIokzj5cr33HYttmM/4IQSxHhyPDQlAJ5vU9VdjgkR/lx/zjm
	3Bf9BaqZuA2JHK7mtGT4oMR+ehhYsVoK+eBpMsRFYywkdlFfVSfDMPnMXxr1FUSuSQr74Sut9DI
	n/MxXcQETWPxu9cwAiZkF2rJYG3vVwTykQ8hND5kwRWCg08JPC476V6xzTsQTraEHNpkE8JtT/k
	z0RzI8WVRCc8x5XQSIXJQsZ9Gm7pG4scBVazhv1W+fNbgdLtERB+mo43Nus=
X-Google-Smtp-Source: AGHT+IEhrv3fmXBC2zf/SakWM0z47cC7OpSvTf+Ugbc9/YCKMZxghEVPFjk+9Rao57znNMbR7C25Og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr13270461637.7.1751869114109;
        Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:59 +0800
Subject: [PATCH v12 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-4-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=8J0scBIavzi43Hc18EtLQ0upqpSsevKQ8nja/mECnzE4bufiDHQr1EC6aLVX4rEF26cw5m/f9
 1POTKLa7ev5BqipWab+rOy402M4esn20vuhkdBAEbl/rKZAxXTIcGSH
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
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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


