Return-Path: <linux-arm-msm+bounces-33646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DBF9963FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A91C281098
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAA018FDAB;
	Wed,  9 Oct 2024 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kH+TOkgH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D8191493
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463869; cv=none; b=FOdhVdw1Wy0g9jDFwzZLvhcprq4s8uJhDKwh/XiEAYA/gWWJxW2Ozth+gJuFE+2cr/T0S727UlByym5HHgTkQbuXpyAfHiYvKl0U+flrg9l83Cg8XtMGVaVrr38TuDfrvJt45xLNsu183buxFdrvvK2Ed87N//l0XpZq/bihLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463869; c=relaxed/simple;
	bh=zBBzWdWsfyqBIiT9wbwcVNQEKc8lnnOJ9lwiSkj7ngI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1S3P4Pov+k+HkvslS0atpv9R6SUoHtB/uMli+5DUPpZqmkTTz8hSNTOVQpUnnrWU59JaWw+h04h59UoDPugyWSv66KQEVXqYTOPMM5sJb/45KmWrYpwWkpLxrYuIDjagj1iKiIn6g5wAHg4Cd++dO203CS+OmtKpTe5QgI3OaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kH+TOkgH; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e28ba2d96aso1268387a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463867; x=1729068667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xeuc89940OyZEzmfZGsShlcWun218secJztkD+/huVg=;
        b=kH+TOkgHtOBytMNN7smX3WjzUD7Yt7NiUvjkXLPuZDMqLVM9h4rxNo9U3uet9m1Ipv
         /5Yi7d8CjqGdiMFaX8JeJ/j7NJB5nGp32YBsPAGru4Z4YAXAhGkyip4vMrEs/UaxAdRr
         G02zWjK828/YEksgerytgm6sjb4pjY+ITEexNT4E6vbNRhUCP3JhalRuUeN9P58nNF1T
         Vw3B7SYRVZyxU1z9pVaEFCoECEX3vn/4SxlMvx2BFTyKBlcaANo14OZeTdAEFpci4Ypq
         Hz8IzjlO223DiDhQlbNcH7PIptPvp9AOqQrGHa8VTrH19zOuej7nzgSc9gU5rLL7srWs
         m18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463867; x=1729068667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xeuc89940OyZEzmfZGsShlcWun218secJztkD+/huVg=;
        b=OHlwOCBO2XY4aXlPq/h7yj1lR/YPTK91pqKewL9wDJ818n+zEOET+qtD5Q/ec49NVo
         g3MTtq283jsgo1WqhHvpBow52DOnbZQPDNXXhZ3RZypNHb14lzd0yGcfohMyUQMJk7TU
         08eys4zPsMuZVG1+5Vc2zRIbiqjvoFNmFr8y9j/fjhXbfJAs+IuWovEjJ6SzM3Hy/HjG
         LVES+kIFB1Gil8ujzef3sRNGSGrPeDp/HHDyqi9J2DsWCF48X1qynjSFs5WvSKn73tsM
         NiHcMPGq2utizG3fNeacpLPhKhay8h/IKfQZdkcR5CQeZ0zSdWZ8/3H07KrHDN6ySzPz
         BjYg==
X-Gm-Message-State: AOJu0Yxftj2ds6XkhTy1s4pBMdza6bq3zE6gebjZHMntkJnonIqAu6lN
	HEqf/Y4fec4eLIVGf3oHsuRuAVf3vVefm7VEqLOr08kJgFwLK8oikIC0nDfOSUQ=
X-Google-Smtp-Source: AGHT+IF0F7RtB5DS5euGqhy7U7rhzvEMjBeGrvubLOfvxfogUs8BIv6homsplq8ODB4C0o2n6DXgtQ==
X-Received: by 2002:a17:90b:1104:b0:2e2:9522:279e with SMTP id 98e67ed59e1d1-2e2a25247e0mr2201199a91.31.1728463867148;
        Wed, 09 Oct 2024 01:51:07 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:51:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:21 +0800
Subject: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1729;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=zBBzWdWsfyqBIiT9wbwcVNQEKc8lnnOJ9lwiSkj7ngI=;
 b=olKDHeGrWWSragjDEGtR+qG7l03ad9g8wQu7Scz79ICx2dg8oxIEAOpVwrukiQ+/+oPfeExdI
 7EvMgTVIa78DCYbucqzqXSwayrVfw07ZG1dzLBNsZo+LiJkdMYaFHoI
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Update mixer number info earlier so that the plane nopipe check
can have the info to clip the plane. Otherwise, the first nonpipe
check will have mixer number as 0 and plane is not checked.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index dfe282c607933..68655c8817bf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
+	struct dpu_crtc_state *cstate;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
+	cstate = to_dpu_crtc_state(crtc_state);
+	cstate->num_mixers = topology.num_lm;
 
 	/*
 	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
@@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	}
 
 	cstate->num_dscs = num_dsc;
-	cstate->num_mixers = num_lm;
+	if (cstate->num_mixers != num_lm) {
+		if (!cstate->num_mixers)
+			DPU_ERROR_ENC(dpu_enc,
+				      "mixer number %d is not as expected %d\n",
+				      num_lm, cstate->num_mixers);
+		cstate->num_mixers = num_lm;
+	}
 	dpu_enc->connector = conn_state->connector;
 
 	/*

-- 
2.34.1


