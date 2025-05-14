Return-Path: <linux-arm-msm+bounces-57877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8DAB7180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9BA47B1457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440EB27A905;
	Wed, 14 May 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHH3Bd//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB11B040B;
	Wed, 14 May 2025 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240425; cv=none; b=FUvxZhuFaD/zui9zBqhR4cwx+w/9OukISviNqt+SIEB+Qpfgm7xT1dcx3o4DXok03Hx2aAaoaLhRFYsnJT3nACV5kCLRUuzi9lQLbDeWrC7a/t7woCNH130YV1rzJ5nRWiHFZodrWAq5l5qUFapxTnu2dyJ5K0AkVYC8RUD9N8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240425; c=relaxed/simple;
	bh=GZCwmkmzbXGm23N/nOld3XsSbdbeC2Re8XmPrqrvAyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtJPzCMBQHGYQb7UQyeS8T8Jnk+a1Eh11gil18ieP8pd6yXosxfMeULGNOvFUWJbXKXYQHiggO4bufIjrmCS0ngk9glie2MLJ+9n35KRmfvQLjmNqwX/H+usV+4a6gi4bc8qo6YGRdeDxQhC7/t0kDcKLXb40ILPeHvDmbPIwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHH3Bd//; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e6880d106so146715ad.1;
        Wed, 14 May 2025 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747240422; x=1747845222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8NFmJ8VaC2SUZH7esKNt2Ms7nN1mYBgEnYL3nIvpM4=;
        b=RHH3Bd//MXpg5JcyKNIs8utnSTz2Wf/7ItHftvJHOvbqSb8DAIc073IFq81cwYTKJ5
         X8QGXOdcZzsu/Kk0LnPhnbK7kzaVc3Y2JPePntkOmaVHREiPbJFyorIIaRe0r1Mzf/Ss
         +DvUIuu2a5z1FG3UHC4i8l/KkIr/GLKvJtRGph0jj1fLzxLidqPCJwtJS7Sf7aI0IhYE
         Ywxg6XNC1Q2EJ+gTW2oy9LE45un3fB56n1A1oQhhX0Wp29N2u0x2mnS10/1FCY43sJzI
         3AS6nP/SWjRKJNuY4ts2/RGCdIQjFKURAb/bpJY/Lq79P7h7J39vYyYap+pf/2FuOO18
         c8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240422; x=1747845222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8NFmJ8VaC2SUZH7esKNt2Ms7nN1mYBgEnYL3nIvpM4=;
        b=ecwYT0HvjJrsEj/Ca31DalpzoppNcAR1Jm19A2Wv1G3c1EdJtvRJrya0ydtG7HVvhm
         BKxnCS6FrENUj6ZcouK15FyKBFFqSEAy7At5yXY+ldL7i9AvjzCZW4+4KChWQT2gqUm+
         on/N2LlSOr7pzW3hL66KwpKJXibGvuV+2nbnQvdCB4QpXUC4JKF9GR3Qhe+uzZyPMe4U
         mKzX9CBSuXU1X6snNUJcOk/AjNr+jAcZcywHzKHyDo1GNgbaOl6lN+aOTYwaMxjFQtU1
         YhxCHapv/+nEprACiUVqab+nD7azwl4GdG7yvKYFtK/2L5nBXDFRVTPLzRaCm86iCkwg
         Zdog==
X-Forwarded-Encrypted: i=1; AJvYcCVIkUUOIXFIvVK6gM+tcs2dIMNQOQYGhOXOswlV5QzpBZ+N3U435PVaG+MRrnm3dxIS9aGZH+epkJHX4so=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/H0uVMT808nZB0wOSwNIAhJaIX24uMQ+Cb4krzzY+PFeRCehI
	sE96TDR3iEFe5xQeYkwrdt0GAawT3J9pNUaxZ9JIEfzTOunVt6Us
X-Gm-Gg: ASbGncsMEQCOO9WAympWbQGdzfMu8gBhH9Z1bbWJcjnze59r1HyaHTeoeWJujW55HyH
	yk80bH6628COAcO6I5HeVXh+VoYSuwh74wSiRU1LGUvIpz0XJDCReN8w2YT+PUJF+P4FEbub36X
	FI41DhKePBF+SyRCKKrxU8ArvGwCr74W/iiWQUh7yRKE/09wPStco1AoATdSvSDYh7t2Wmziw2Y
	C5zhWb1jFWaUa4UTSQzhJLDpxJu46LFdMthK74/2P1uMr2xhR5feIqfRL5S7G4Nmr6nuvLE1Oba
	2axfrNegnAmPd9kaJ8x4ruChz/XaJGJ7P9lYSeRfFjgKeJ7YMy8mMCaQglKVumioWikf4BjPyoJ
	iVLiEiLAeUyAgR2MoumWeZ1Br2A==
X-Google-Smtp-Source: AGHT+IERCtCWMPp273Pn/kSesFNut1YmKeS7V26pT+IIXOt9MSp5ENJ0CmcVrJLH9gRNLdpIfbkHPw==
X-Received: by 2002:a17:903:1aef:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-23198126227mr68599475ad.12.1747240421020;
        Wed, 14 May 2025 09:33:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc773f225sm99788915ad.89.2025.05.14.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Fix a fence leak in submit error path
Date: Wed, 14 May 2025 09:33:32 -0700
Message-ID: <20250514163334.23544-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514163334.23544-1-robdclark@gmail.com>
References: <20250514163334.23544-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

In error paths, we could unref the submit without calling
drm_sched_entity_push_job(), so msm_job_free() will never get
called.  Since drm_sched_job_cleanup() will NULL out the
s_fence, we can use that to detect this case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3e9aa2cc38ef..b2aeaecaa39b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -85,6 +85,15 @@ void __msm_gem_submit_destroy(struct kref *kref)
 			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
+	/*
+	 * In error paths, we could unref the submit without calling
+	 * drm_sched_entity_push_job(), so msm_job_free() will never
+	 * get called.  Since drm_sched_job_cleanup() will NULL out
+	 * s_fence, we can use that to detect this case.
+	 */
+	if (submit->base.s_fence)
+		drm_sched_job_cleanup(&submit->base);
+
 	if (submit->fence_id) {
 		spin_lock(&submit->queue->idr_lock);
 		idr_remove(&submit->queue->fence_idr, submit->fence_id);
-- 
2.49.0


