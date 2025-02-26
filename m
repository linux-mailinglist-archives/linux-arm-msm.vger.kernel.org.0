Return-Path: <linux-arm-msm+bounces-49497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB983A45F27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF39168426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB93D21773E;
	Wed, 26 Feb 2025 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ysZH/WoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8AF21B9DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573150; cv=none; b=hOWDkjh63qSIxLMx70J+ciuugseGyWdUDStWhc6oKBbzK0cC9/BDpdBDAYQHFThs98jOJBGqQPJNNeVTMyjs71TKZtVwdVqXa/cjZzdlVcjpurT/8vOPaIRvM+UusOzmNew7RMlENWi2rvhqDd2GMzjcIDJt/IR6K2JTCrsWiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573150; c=relaxed/simple;
	bh=WBM/p7IonF+GUTkphvNqY034IFJPvXxbXKnpEjol144=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkwzGeA2S42VawWsuay4OOf2ptoK3lxhk1xkznbnj12ZtmXLC5hchr0yzjGNAOi8xV3jMTU/Y3sF3bcppxfVy5oFv+BWkHDOAobny17GN1Mrz+pWP0AfmJHFUzNmrtBgjxAWMmfcr9Qlp9Y8vqke/VzryCBBhzV/tl1FWv5p8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ysZH/WoO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so10770582a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573148; x=1741177948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
        b=ysZH/WoOKDKQ7Wy6oKnSlBlexxMvw1td1XVNgNzWIDYcdYtIBEJksfSrHb7khVgZC6
         GMbUETU9O2r2cIpPayrMNtaj3A16IlPliuK+bj8S8HOlX8cUdyLZOThsVfIzOyBNVHU8
         R1trXQ9AwqB6rMQnuhxz1hQWXN1wWXEUQGaMN0bxNV2wBkNHcXeUVXIwkEAIp+UMal6X
         4W89Z2wct1ZKfP0GdeEOrjJ80GO+uoO5oQ4zJhauQ0yWIBgtsgV5FKGVBUBJ3a+xjacf
         G4Zme+at6o+tuV0cjt+el6fF/wtbx2QyL8tQKiv0iuBz47kC4biXfCHEVLgf4vcgwXu4
         bCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573148; x=1741177948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rajdpuATf4cHrwTeJ8T+ZsyTPgo2DiGPUjAIn6iu1Wg=;
        b=JaWlrpTC2TqkQ4Q3aBRtkCamJn2jnjL2WyCpNxLZcgbE2EvZHw4vgolKmcOTRQ1cKs
         8Xoy5L7KquZhy4aSrhz9MHxOtec9QXn44Dmmi3NX8HsXqLrJhKBdAdalbbH8AvSy2DhW
         9HLnrrM+ZSqYJ9cIcscRlbJWw3TNl71EE/sATKjPcQA8YTcrJwoPRP/8IfJLntG8xUGc
         zT+xojof7Z/zoHqNx239eGaNWgKfYn7P54581ul2XaDVjZ4TbLNJobcbvUMqqbQqsh6u
         J3ZZP9gVPaUpMfWHKtYnQfP/a0sJ3sN9wfPVLwJDn89zl42lUsLpuPqhqk2gSw2bQXBe
         L2xg==
X-Gm-Message-State: AOJu0YxJk7dKCIjWuE0soxLkjiWnFuxLj0nXQkQEDwZ1f9O81BAumNV5
	ojNS9+Jj1ODb0oQctkBQC9NYO5fGq1sOff1NqPcH2lquPXxqgywVpeEUPrIa1sxtnjT7f5Al1SX
	dldDd0aNK
X-Gm-Gg: ASbGncvVZdTNrveDFUU4QqxnnZcbJLEgXZO1nSjBZdg+dTv1m0sOpETgW/KvaW4EjyM
	7X9JrFf7zOHjJZG/E7nXB9xNSvc6WrvRaL+AiBhUEqfJXePzY811RBYQ+2eFrezJ3sPSDnz4QTG
	xABFXQOHM8Gh9mEnmMoJ9A1BHZKAQWJ6AWSXsv4cLim00EmaGhtMAlut9wTQuJmNkvgMznpsHKY
	BSGqRB4iTdxzlr6x8z9lh8oVgYAgfbiuTYVqgCCNfodVRcPA9bauwq2iDy3yW3GmDyEeISm2SBT
	6rPYR5Xk2qI/BL1sRXUpCGg=
X-Google-Smtp-Source: AGHT+IF86x+3JtGSuvvDrydZiqFZ+wC9maj1cZbfnlplFjFOAng4eFAvvbksYNd/GXPBrK2GwFsO/w==
X-Received: by 2002:a17:90b:5688:b0:2ee:ab29:1a57 with SMTP id 98e67ed59e1d1-2fe68ac9600mr11759074a91.2.1740573148497;
        Wed, 26 Feb 2025 04:32:28 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:32:28 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:51 +0800
Subject: [PATCH v7 02/15] drm/msm/dpu: Do not fix number of DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-2-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WBM/p7IonF+GUTkphvNqY034IFJPvXxbXKnpEjol144=;
 b=Gsx+uVZA8t1OCJerV0i6O0mFqa4gtWo0jTTX/YQL9ypeWl/c5RKdtbKT3JKuvGm4zZ4XPxNMy
 aytHLSBTtCjCyTWrMJfwQMQqfPn6Vvrn8/WLH7j/FH/BxC449gAust5
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, if DSC is enabled, only 2 DSC engines are supported so far.
More usage cases will be added, such as 4 DSC in 4:4:2 topology. So
get the real number of DSCs to decide whether DSC merging is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eaac172141ede7bb4002ce1d0268b2f436fffc6c..c734d2c5790d2a8f5f20c4b5aa1e316062d9b34d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1


