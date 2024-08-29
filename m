Return-Path: <linux-arm-msm+bounces-29973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E59641A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFEC828A816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D7C1B142A;
	Thu, 29 Aug 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNU/Hs/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCD19408D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926833; cv=none; b=l65to9y3ZHyTHNliB3kMyDqGVGPLKvnX6KydeNlW7OS8xLjANfElsgTnTnsIaaBg2CjUo91fH/83AKhTBDzZ6qNJDnpXwLPdZnOj9Rdv+FUTXlPeeGBCblbKg0ohugA2/L/8bCka1EaNSpRf5u+GUff0gXI0JAvbapOhmF9YdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926833; c=relaxed/simple;
	bh=MuxQ5OVXyjEXNTRIAzTsA5+Nkr/OtZrXgpfu/qynNjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9/MOTHQzbkAhzeamiK8eYof7DTTy6Mf9ia5TQlfDdAIPoQI21CWqYFLhD/FhRGJNB9LrFgyaRKEmlF9AayoDmGep7v1C17PNf4dZpuX3Kao44EAoTQMl4A1Uy8H6rbAWbNuUkgCvWY+5OfQU6jocKqqqgcKZi/YXwwqjr4aD7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNU/Hs/b; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7094468d392so277688a34.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926831; x=1725531631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lbMpHi+idQrWBFT40ehkUCaBfcILsbcClLsstfOLPw=;
        b=BNU/Hs/bPWl8Q1qysapDwdkr3Z1IfRagih8//pzTf4lS2VbyaqyQBLucNgaZEU/gsp
         FMvyEKXoCgcR85/0e+e+d/8vjr821UCbcMXeRi1Kel9QIovQ1Z6L9ynGE3FYgwdprpTl
         GR/H4VexN5cDOik2WnFI9oTacHOJb0t54YOQR+h6pT6/eGyLay2IGpbNgxmPyK/KBWzC
         qpOCRQZMflprcfJq7MgA7QWPkQ+gsE49YXfaYuNuUmYbphV5BKJG9FhB66X5PwJEf5EZ
         FUm+oqpQDuMGpy47J78j3ucWpVABqO0Al3QMSAs0TolUE+3tv/IVUrHwvO63p4BnVBa/
         Na6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926831; x=1725531631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lbMpHi+idQrWBFT40ehkUCaBfcILsbcClLsstfOLPw=;
        b=pQAxiYW3+yQg1Z1+hkZDnia+cuiT2LFjzPwuBE/e+34m5UBjwPZfiyAEkLKSIEEZbe
         hPrwOktbJEkFd53SbymL6gfYO+CWWUWr5yc6dabpPlYaqwRvEvi2KVkoXSsuy4X573+s
         Vf04PEc1NU1PRHq0gVpKcVzARnSu+cA/YFkIhVZecXaEW88LW26XZXXPYrJYqHx7Gabt
         j+Q+UxxRuG08uZMl/xtzabQu1Ee6cMOC3GTfAB46KRi/pxlYuUCIMwaTgGqE3evDS3C9
         CJXK+M932PbSbEFCYnfWBb/ajmxDtZcZ7d1jofwqGaTsGyttkhDzwLRqm+NN7IEgoDUU
         ma9A==
X-Gm-Message-State: AOJu0Yy63KG9Gy+hDhZfu373Duuw32raplHzEaEiOgXkU5W3GHHYqxUu
	2DaUNyHlyZztHjnb2/+MBPE1lYoSJceXflpt3WflaZHof9uM4ZJJk9QEuu2WlMU=
X-Google-Smtp-Source: AGHT+IFen9Jq7QnLTtz1M24pXV3owljduQ7AzBDQAdlqHW1BLOQlXouMHpCoA0U+fCxUk+qf1Qgf2Q==
X-Received: by 2002:a05:6358:b00f:b0:1b5:fc87:f023 with SMTP id e5c5f4694b2df-1b603c4372amr301108555d.13.1724926831326;
        Thu, 29 Aug 2024 03:20:31 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:20:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:39 +0800
Subject: [PATCH 10/21] drm/msm/dpu: fix lm number counter for quad-pipe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2144;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=MuxQ5OVXyjEXNTRIAzTsA5+Nkr/OtZrXgpfu/qynNjo=;
 b=c5oycrwiyxCtgi1nfLY3vtWDhILufF21AgERHS7eIpJZlVfAkbuFpgeVC38YmR06XIUAU4YmN
 QxzQETH4WtaAYAC2NLpgo2dhnESjmYc43hBzPc03Wxklc0SUMHi6fmq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add the case to reserve multiple pair mixer for high resolution

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 33cfd94badaba..f57725ad494d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -2029,8 +2029,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	memset(&mixer, 0, sizeof(mixer));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index e219d706610c2..77d7ff789346e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Clear the last bit to drop the previous primary mixer if
+		 * fail to find its peer.
+		 */
+		lm_count &= 0xfe;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
@@ -353,6 +357,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
+		DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]:%d for enc_id %d\n",
+			  i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i], enc_id);
 	}
 
 	return 0;

-- 
2.34.1


