Return-Path: <linux-arm-msm+bounces-56562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA4AA7858
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CC957B9B9B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6D4270563;
	Fri,  2 May 2025 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crQasWdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693122701CA;
	Fri,  2 May 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205745; cv=none; b=g4+2Vtcume5XfMnWz1SeOwUDkKeQqH7zpW6kI44sNDs8v7DWjzD4i9EbSbLp01Uz58DNYURFjurTgYTeGQ6qfhGMLb4JDPYtC1xrdPJ0mk4MKfOrssh6GTFFIqpF6ga8BXt7gIcTDZLZx7pRMkEsYy0BsVqpfVOwYz0C5YpaDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205745; c=relaxed/simple;
	bh=j6bKjmoop+1/uaz6CfUQ2VZqh1wDm9EZSFTjlMrhnBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=razvreTRKfOw5NblDoiJHTdzWLTxy5Q+sieQXFiuym+01hMBXzWLtOU6KxJernZdjXUzauqkfiGHhki0a+TGJJcg+dR5StTQbPOcOTVGkngTRiOBFvs1OXXM2Ji2/nl0D+mzXw7ISplx6YHsnjZ4CtDDxZ8TsbjBYWLeRUS3MQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crQasWdH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224341bbc1dso31823375ad.3;
        Fri, 02 May 2025 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205744; x=1746810544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=crQasWdH2eht/JhI7zSp1VyjD3BmxY1RL94XoGNdnm3kX02XnzYteIHwT5hUJFu4gT
         sP40/vi9zNECRVxp8ofJfbP2HxWqbegxmNWrjE4AEVhX2VdyxS4dc23dN8XromWMeQLd
         JfPISPz4gsx54NRcfOYXAqnvt1SvqprrJQnqfAbvlQ7Ld+uyqRq7bgdUVPSa4/m6TcYs
         XPm5jULi9z3//LICbySSUmgN7Bezt4aUrWzIfUhOdxzvEbXswG8QiqqwytsazUi1jMav
         FVCtdLgQT2Bc3M6W7140K6A8iByQKrCQi6oDubklOD9AmKqS3UE6mXPPC5xQooWQ1ZKz
         bMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205744; x=1746810544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=h8wEB1cnk75rDy/5X8Z+LcMCALx1jnk6CqF4zTSh5FVQGgZCgpQoux0fcZE3Q6/m4c
         9PYZHhVVhqpKDd1oV6cOvgQCMCDtRCokKVwxQsxpu/xCOCFhwpIMhmA6GWzig8q7V15Y
         GTVjmL21Ivd4xR2MPOCFCdFGVYkJSdE540j3EPyvh607fODSILPETpNa6o9FiKVw6tk3
         1jinlozt8w04spWPnhFi7KUlAOxxCtavI//enSSD/MZ6Bns0sAdQ2nOOSLcHitNRQqOu
         2LSTZbqJhyDygK4ZB5rr6i4HXOSRcqNDOcr63TLBYfHsCOH6yDb+cvXVQKLy/J3Aonk0
         gaEw==
X-Forwarded-Encrypted: i=1; AJvYcCUEYT+FsSBkGTeAULhuA4I0AhfzQMaWpvoZsbLtY2R8h+44inTJRbtrYFlq4XlgmHBgq00oUXO7hAmwa57p@vger.kernel.org, AJvYcCVasqTtpJDAIphHTCMlHPgYwiQGgM2eI0jn8dMeU1HOZcEKptuhOWorGQqu6bOaHmFzgz5WOzjNmM4c/tsr@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5zKrAskD32G/eiKgTUc+OGH+E0dh+rw+l+siUOVvuJUP+SqY
	gwu0Le5HMPceLnoGy6/s2crXlYwV8KqTz7xUFs62QEQBbuR097fomj2TEw==
X-Gm-Gg: ASbGncurguITLn1gisVKN911jzZkBfbFi77PWN/+dkwzTumWIIfzFbPPbqPiiYUctNK
	xfg9JxYUtFhzUc0HVhxyY6c65zNyvhnrqsgSVaDx0Yt8qEUbsW9f1qqb6O5M81MucGLaZkuYv3l
	/kQCDz7CRnEIQfJFT26weoAz0kUJZkpTlJ7DfAvTezl/x05HIJ9rJr+0RwvXteHTHUiqlvnfvyI
	C4nFWk2waLSAgtyj0mTJZhOMykHDKQuFHXjSoBMZ/4ouIixKcbDcxPIj/8egof6Vsv8p5ZSBn07
	saEXJ62AssX+uRUM1ACkpedtwkMFvUdiIhFjtJiDLcDtXALzBSQi17vwNCRxSFYSfe+nr8w3yUB
	rOInLGMNCW52i1iQ=
X-Google-Smtp-Source: AGHT+IFt0hJ0TFReRcQprtgIUwIHV5gv96kJ2x1/zd91bJ5uzVT1QVa2F1GOV3CmBQedUOyrodGMRA==
X-Received: by 2002:a17:903:1904:b0:223:f408:c3cf with SMTP id d9443c01a7336-22e102e2c23mr59200455ad.21.1746205743576;
        Fri, 02 May 2025 10:09:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34748914sm6008563a91.11.2025.05.02.10.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:09:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 22/33] drm/msm: Crashdump prep for sparse mappings
Date: Fri,  2 May 2025 09:56:49 -0700
Message-ID: <20250502165831.44850-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.49.0


