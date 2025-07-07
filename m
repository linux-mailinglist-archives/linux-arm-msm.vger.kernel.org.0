Return-Path: <linux-arm-msm+bounces-63886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0948AFABB9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E13A13B799D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEE227B4E5;
	Mon,  7 Jul 2025 06:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXEuPcLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C128689B
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869141; cv=none; b=lFBf7d9HWxD7R+SpA3hSr9rYkX6Z3/HanRmlKuMvlAbe6ot0XsXnGQ8v8WHopT+So+aqHyNIDMuYqr9d4P8VVDkb28gIesb9BZvgbL28PUcVwMhdbIb78r5tMixgcJG2F8gF7Ud3XvWmV4mBdHFp/XOzveAJga6Hybi3N58kYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869141; c=relaxed/simple;
	bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vATw33+7Tw/KMT/Wp0lr196rgv5RQN3ygWroHwVufsCTZKH5XoXL7m/qT2gZwZODZTb6En5rLkuKES668EweNg8lsUvhZ5b9iTLUYvYN/y44hVlyVFg0desEFNFPwUyubNUeQv7+JrO63M6JVSV/ux1jZiDm5plubU5rzEWfXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXEuPcLu; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2165911b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869139; x=1752473939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=hXEuPcLu2HBrfOWluoM5OeLAsX8UX++mAEOv3izWEEFwWJg6KzNrIIWK9zyk316UUZ
         /cxxh7u/Lb21mnFoOomgxN1I1Shlue0Z5x9tS0atNK1XA2d/wbGkCp7ALc4fjwTvkMec
         KOo1z8CNG2PNwVyiXVOyzbPq7PxUSvKwP5RzG63gT+mPXlLNqa/z3kjwn73+gC9BPMKt
         3F1spUEfoxbY2Sk3dax0vt22DG9CbTQELZc44NNuTvfWrUl7sKAVz2lLUCTPjVecKNr9
         ZNSasrn6W/wjEYxoCa8VrwkRm9eSWtf4HZcLq9CjUbuGDiPPfPohzc9kH90MCMvhvCqu
         mL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869139; x=1752473939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=MO1dBH5tpnm6LPv27Dr7QXGLqdkICcknRyQAk04qbgYrs6bueFCJGZ2PVrBjho0/8V
         lXkzDuG75r07ujU47R91qHkuPDOoMxw0gjEyKxw2pDS2IOf6Gwsi2Yj+ed33WNyKEAUv
         r56UP44Dp8pm7ILRF1CKTS0SQKR1XiU/88Pp0MW4U4B7WjFIfoz9Yy+AN+dUbYQw3zjN
         nPRCgwN32wXLo8iDP6pw9vgSyTxIB4si3sW6oT9IW/aaIne6JFlbjJSio8jSuV2ZwWVg
         ITEICsSuJwFvb06pFECYSSujfWYH0ba6Bh9IeTSQpdQqPGA4fASiRNctrWmXsvsWnUPf
         cpeA==
X-Gm-Message-State: AOJu0Yw7DBb0ChN1Y9Yun90LhyR/co/nFHFcS8/gvlCNAnxw2CStzG+B
	jZH4NquKcx12TYc/KPVSl3eYB4Zz5CGLAxkjYgYImt1YBtzVrOhY9keBmAx0jWFMVlc=
X-Gm-Gg: ASbGnctsxQM2fat/tcOXEnMLPeBT9TgXygVZnMpvUayYslysPLT6kG0R7euH0d7b/Fv
	JkqZ8jthUn7Ws23uiv0Zi9wkLzBiTNICVC2vFuXapF7sdwQYMiTzxK2CxX69ga8RaRHxNfQQqvo
	mOfXgl0640q9CzUROhy5NcMepRZeFQov01GcTq++ZG29ji/GSB1rFi5ZsQMqC7/0nLUcmAoWYz5
	jCC+cN5aStg4dmHnmVoYb+zyGc1BQ/Wm7Y2TB3PlngXlZtAjchh1QCopwEeN2gTQbLj8i0MUwPQ
	AmaftDc6cP3XZexDXIgmOGCrxjDSKTfiF95l51zHnA789w193AhYataFRug=
X-Google-Smtp-Source: AGHT+IGHeMWJ3CU7o8u2I3jtTuKviAnMMK1jk68uIZizqYV/+1lVKm5gab4fF2qM/al4kHop9FptTg==
X-Received: by 2002:a05:6a20:7f99:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-227213b0f9dmr11250088637.19.1751869139526;
        Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:03 +0800
Subject: [PATCH v12 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-8-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=nFHB3VxCXhLEoI/KGV5opIO0xVlYrUN+hcLsZnNkOIelu+Vnn0r3HYqoOcRs+4m8mQ7Gt9lwE
 BgWUi8fort7AuSXXlYlKt/MQ7A0V0fejxbdR5aBcTw5rYTUIzzX9JJY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


