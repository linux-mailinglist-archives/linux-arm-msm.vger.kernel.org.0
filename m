Return-Path: <linux-arm-msm+bounces-59410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26911AC3CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AEE3B8101
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CF51F2BA4;
	Mon, 26 May 2025 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1DfsBJn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FCF1F2B90
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251768; cv=none; b=oPF2YHiC6cqcfNuYUjb8uTpWCGssYN1lhYHmWnw/jvk7YJvuHQcbMM93ZY9YjqrZmV+6UVxs70k3o4/xRpfTHHQ3gi2ogNWEslQbIREX+GjdW4ibcmUFliUmquv8BRPpYZ8uoPQicG5v9Wydt8LEeQwaIPddLnHlmMrteIf9i8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251768; c=relaxed/simple;
	bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRmGMByclE9bm7wUsJjoL5/5qkTNLdEm07049et5MhOW0IsRVmdoq9j7Zrd/4V4vQWRtVcHTmsr1/tNuwqcdKQ6fyFwmCd+hUkf7zXpGMO3kZ1zjkmITfBMGENnbgf1CgoEVGXXJONgwUovRUlUTYYhnJYvBux5eRgxrQGgmdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1DfsBJn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1396077b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251766; x=1748856566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=O1DfsBJnPWD4QXawsI8/O/oYpg04Wu1owXirz8BgXwUKIFD2WxErfSkC4OA5xfRxGQ
         XlrtE+gJ0GWWGf+lT+5P+oT2FEQfLERqlEqH3YCxfaarlDfPuMbB+u0HnFAGbOq4kFRh
         KA5EevM88FKaDX/iXKuDYRHAVRrnJxD+g8DoNT4cbXF9nbIpm4V3deHkFL+2e70HUDGt
         u38b+bVzJ9GDIs64G1FzV5pTbMKc1lxUqcxaS6xpdxhkrj2NmYzdH9I57+OXzzG5JrsP
         BWUTp89c71TsQbDWT9wyLs+nkVwtrNgetrEpfHq+Jt56GFKzDbk98/e/vjPAlU56BqMl
         cLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251766; x=1748856566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6pBDEEcTuBgbm817Rj3tBVeinNfrDQuQQunJdnxKqw=;
        b=PR+tm4utirlEjlSF5slmF3wjNfVqn5jjUMz6Q6PlxPmK+5zTfXwrkH9GIsHUdTz5yU
         6Y4ZuV/WD4pz+LRV4ZHqYTqZ8Ht0iCqcOUpwV+gzCS+K4XGVWVg6Ul0zLLH2CevttC8k
         HtZfU0hCqWQ1+leuw+MYkVPoPDxZSExMvqQEGOPsJPZwL1rP6PSN6PBbjPbapsA84aCP
         MFEc1Tgu5GmXagHQxpj1L4BMtm+1gpJAzeV/PDWX5KhUv3nd3r4rwT2hRG+U43GaGAlo
         q4VkQryAI3CL8JutWsjJMMipGdWUp2alLFEBZgW0ZJhArYsprfJ8S5Mm4Cv8KsSdm3gd
         KDJA==
X-Gm-Message-State: AOJu0YzrmKq17f1EAT9HbW3vqtCvakV0hMFL60zpknJcElVdQDMW4+xu
	2DVoyjoxBkINCFv6i02VAwCBp7ejxEVdXznXyweOBLGiQL8dA2TB9JPO10ae3l4Efgo=
X-Gm-Gg: ASbGncvc8SytovZFO3Ftb+qHzLZEmqfkA5+IFeXSDCf2yLnEgcLLMOUAGq7/vIVv/op
	WPIJqVORcjNgi0Gh346/hB4nE+sHo7UJ1zKlJ8fDIO+TTB+BMLpXw6MuqlgYTF3o1uGSJNiqhJ0
	vtzFMB02abBnI+BZXrBIcXbDmupBh11PoNl6gzdnECxbsgmAqJIrgJ32R9NYEFABsy8Qhf/fbHP
	9Z7AZTm3ZMbHkbOXkzY8L13JYIklgxs+TlXbkPX+wQbtwcIhF5A+9Nd2lszsne2sNkSCrHwMCUj
	IvOS4goipvgVQYwWz0D/b3zTiFbXXJLh8YrYZJkmpjBoKOpH9A==
X-Google-Smtp-Source: AGHT+IGBU2+X9RIttwmFp1d909ftMCV8QM76oVtcLcEN6kaVIzpX9cZHgBQ1cN8l9hiL0Bv/OYUGjQ==
X-Received: by 2002:a05:6a00:3e20:b0:740:5977:7efd with SMTP id d2e1a72fcca58-745fe01b292mr10482210b3a.13.1748251766134;
        Mon, 26 May 2025 02:29:26 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:29:25 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:26 +0800
Subject: [PATCH v10 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-8-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e1upM+aOdYliO/dIh1k3i/FkzXto3qmBjVI/19UomkE=;
 b=UpshzwdRDHpc47WYogNvfnNWELf2045T5glAjSaMOQFc1v4LPx/qXu6iDqlflfI4UaZIUNLrf
 LWewYmH4X4FBtOCHV5q9qhM+SL745aQSzrwfrU/kXib3L9aLVxNH4V+
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
index be8102691b99d3b381476ff844ddfd28fe17dc7c..8b6fa7ef78e2c0fb38daef9090dbf747c7ba111d 100644
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
@@ -2377,7 +2378,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


