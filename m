Return-Path: <linux-arm-msm+bounces-14061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01287B5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58E21F226A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA638BEA;
	Thu, 14 Mar 2024 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eml2S07q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6256B5256
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374553; cv=none; b=RZo0QXP5HQp3qkUJuI2k4pcW/xItfartox9Dz57K2cE1Fz5DgnPoxQJ8LO/3x9j2sU5jMSKSYVTvPOcf2rJUDiFfbAOa8VyhO3psnnV+x8EidaBLmi1Zo9j23o7pOapdvNvg5nb/CWDoXR5VsCXKULl8kjEcrICzSxrpvLFlY3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374553; c=relaxed/simple;
	bh=sy4hXVNcsUTC75IEPue3Qh0lptrgkYLpP7TJaFh5TAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SmnlZSqdfrOMCQAJ3vMHtCrAhENWHznSnLtFUMSPWtRUT2kB4dcFxvB1Gc6N17AnnO2KOvE358Vezi9Nu2AjZ9Rx6UGKNjXruJJmD7PfxpJy4U07ySiag7VSz4Xrkl+3S7HBv1e+Hz3QS9PX0Ko3VwoqEEtG3noh914PYED7iLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eml2S07q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51325c38d10so1406201e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374549; x=1710979349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAS0pluJVyXsp6jVYhZTGdSQ3udV3IrTqeal2WShYuU=;
        b=eml2S07qBIIBFYtIh+XW+jDdyvua+BOpNxesR9O/5dV9ph7M2AfjayoFH07Qbqd9Cw
         FiucXMQIofA2S1iCOwd6bIpYlBwY1BP8XsKFqAVkSR4b/0QIVnuAXOo/NbidvoOoeW9+
         reBmIaePRDpI3GgkDtQJ1RyRgBxdPs8MemM7kOklWVDnj/Vbgu8I2qjYaddwfh4bmGZC
         61jdbIvQhsjbKw9B+0G0XGf8TbpEgTvvuM6QhfJzDIMrsUk3vZQuRyq9EyDw70njPsVR
         gg9TY5UxHm9ofttg64dBufimOZN6C+vjG17myC9MqFgfV6JMNiH6o1ppNDeghuV9Y03y
         5+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374549; x=1710979349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAS0pluJVyXsp6jVYhZTGdSQ3udV3IrTqeal2WShYuU=;
        b=cemmsQsNpT8JFCq+MZJr1frjGzQTr5Y3zr5dOptG0kdTp8vUi3MjnSvyFnkYdOeuOZ
         /bOHa5s+RCWibFVGGXpRF7CZ8Ns8D/T/vC+MsvcTlXH7ejdGDYBZy4e2P95vspeqbmZw
         HspKCD1xudO+JsgZd2ya/k5cRsFDcqNpoICPVIGfG39Sy8UTHn1MqU1kJCn0vNR/OM3m
         DrCn7bOw2BxrNI47qfPUNbowG3q0pP5I3AOUPmJ8PZGMuS3J5tOL+38U8MwKEG2ITB6J
         UINn6xQ/t3csRqCpIFmVK8lID1I3lFQOZKCoSNOcWe2uWo//qNxISdYmPGySQH/JHNzy
         qM+g==
X-Forwarded-Encrypted: i=1; AJvYcCVEY3o5Y5/q2BYPo5SQPw/4sdS7DiRLLRRNSNqHeLJWzKHpozASyHBjXigLRBCI0DQKjmkmP4RSA8p7157h25ckHLh+lxg1Vw6fzUCV5g==
X-Gm-Message-State: AOJu0YzKzewEhwxfm4QeTmusInuQaF7N1GcIZQzORTNTB+0kdpLxh4+R
	sYOlxJD823gXok0LMlGxCCD+H/77u8moNTuOKgM4tj13fWtZc9t2mXL4N3WO1Jg=
X-Google-Smtp-Source: AGHT+IEdie8MACkhAj7NV2jIC3MvktUrsBN4mHTmfGXCaNUNwtX842uUnkuTTJA+Vg3GTr7xjJ8Yfg==
X-Received: by 2002:a19:9109:0:b0:513:cdde:2f6 with SMTP id t9-20020a199109000000b00513cdde02f6mr308457lfd.32.1710374549755;
        Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 13/13] drm/msm/dpu: include SSPP allocation state into the dumped state
Date: Thu, 14 Mar 2024 02:02:16 +0200
Message-Id: <20240314000216.392549-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make dpu_rm_print_state() also output the SSPP allocation state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7264a4d44a14..7997df340f72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -890,4 +890,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }
-- 
2.39.2


