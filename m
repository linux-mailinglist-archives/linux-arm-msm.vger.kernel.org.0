Return-Path: <linux-arm-msm+bounces-55969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B44A9FB5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D95F3B5AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5242321A42C;
	Mon, 28 Apr 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdZ6AIZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A82165E2;
	Mon, 28 Apr 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873859; cv=none; b=VuzDzsxTy9opdLjDjyC7Y6KaN1dM4+2v2I4lT+UFcyioDBi8xj7NeF3dp1XekMstUksKVF7ucjyHG4ZfrtkmAIhHscw2czk1Nd2PRiSUzPd50I28tB44NgxKsRh11LKhfX4Fwx8nSDgoSrumcQJA5gXaqJgc00UiMr4KPOPAVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873859; c=relaxed/simple;
	bh=j6bKjmoop+1/uaz6CfUQ2VZqh1wDm9EZSFTjlMrhnBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0UeytGS/FXhuSxXX3Ag+g5hxudoTNtV3esqdeFau27pAKcDiPUf/AcZxaEyexc2UznVI6jE/LfPxFxOw8h/V5HXkkC44plBCLcEQQlr170LSIfPgSc2OJkbF2cDwbRkAHJKe8jKPwECCTCJYLvW3kd6xnvXruHPYTu/TTRD4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdZ6AIZ3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so4525776b3a.3;
        Mon, 28 Apr 2025 13:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873857; x=1746478657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=BdZ6AIZ3rYZw+YX6Gro8dXtnt50OAfAySNXZm9PmNtYfLTNunZOWDywKnJ+j6j66/Y
         wamP+bKnjy9FPOZ1UzJ7YSWRGBKezKacXIJ6x18OCxIdqLptbfQhKKPmCJXdO7E+Z5Xa
         RPpxeWozbG86ovQi8ZahnAZbKxILE49x6uE13vnF+Gn1Dqt2EgECTgs/grXaMIODLFUD
         dDFXE6/dq+4yFnLvo/5LEg/imx08q3wouNxxTowmPL5qDvpowlgPosn07DLAd1XHnWgC
         u9scgDc7NOemJXL6qNlEgFRILwijnoPAdt1VDaX8giNA4Zt7CYtIJYu1UyrUHNeKtguG
         mxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873857; x=1746478657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=F66Q2Th4iHxd5nqvxqJC5Tb//yl5qqv0jjI4NemHKrB0WiLncuthjqnMISSAoit2TE
         gJY0bbGPfPiofItwVLPloRRx5NfEOWt5KxAOUhBzvp//VQ7QODKTCdAOLOMKlfit5tDo
         JA+VhEr3CBMNDGMXGZ5qjwIiS1Pk0XJreqXDVefGjBE6w7T7t3tZdNNv/sloCyIxNhxN
         2plu1amt4Q7XlkaOq9sIm5kEqo5NB4Pf4eHK3TrD5ANngPz6EZfoG4gez4KONb0JvIlM
         fJl0KK3bTfSH2p1DX4xHMDX7O9Ehz6+T62LOGz/uyhkisoCCphW/Mm0MduPwoVUyTJiC
         a92A==
X-Forwarded-Encrypted: i=1; AJvYcCVqanEsByr68NeN7yjdYBS7tSQlTDlQTzLWZok3zMpdTT0DUV8gWeJsEHjVlBmas3w8HqP+1DJ8C8vluXrY@vger.kernel.org, AJvYcCVsAX7ePDyU2529ULxqtl+kyH5Zx5dgJpAAQOcfqNw5ZPKGlyx+3uzZsr9LolxigLHsG25lHXt3TJd8uyak@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKDaZhdAXSSWaOInmm0C0GRhV358MfLdvBZplzzSYGzSinCVX
	u7TlEzmZlOyd5FTc5p/SkGRAe7JtxxVu9ucDn2VLJqQueZyYTwvM
X-Gm-Gg: ASbGnctRX4iHn9A6NirON/8Cc5StE30Y8vEpbmT/+HqecVhSgPLOjz345ML6vDHc78W
	+qn0Jre2ynsS+FDhCzwWVE1DbnkgjgXT8urpuew5c6ETTgjiIP2FS2cnNe3TbxKLobqWrxWA5ys
	i22glF7u7mY1u0rtedgBeSSJRZQ474TAFn75pCbA7qT824qQ6x+a5JqT3lIHk4yJbN4vMw7cov5
	rBnw085dyw4anGzpnUdBYXyv4OheWqN52/CHXcZ+LExEAzm1ipSI3i7om+Pq6cOH7DQ1bumjTSu
	Q9V2b51C0bvQvRMb2InDakgePE2CuJqlo4WMpYlkynj6y39p8Qm1CylqDP38BslNE7Wx+8DE1aZ
	SMn97vuek+P9kTSffAFfRVzcv5w==
X-Google-Smtp-Source: AGHT+IHciT69EOji1g4AIfyF6h6GdBBIsM4KOMJEJ9YOsl4DGiZSqbMw/CcEgannlQY6BWVt6UP7nQ==
X-Received: by 2002:a05:6a20:c90e:b0:1f3:388b:3b4b with SMTP id adf61e73a8af0-2095b71c7a4mr725161637.15.1745873857233;
        Mon, 28 Apr 2025 13:57:37 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f4b1749dsm7668348a12.0.2025.04.28.13.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:36 -0700 (PDT)
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
Subject: [PATCH v3 22/33] drm/msm: Crashdump prep for sparse mappings
Date: Mon, 28 Apr 2025 13:54:29 -0700
Message-ID: <20250428205619.227835-23-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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


