Return-Path: <linux-arm-msm+bounces-52003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B3A6935F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D3CE1B880A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EAA21D5A4;
	Wed, 19 Mar 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATpvnhGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD521D3EC;
	Wed, 19 Mar 2025 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396165; cv=none; b=QlcanF8V7G9b1QBAYmFdOjDOoHEKoKoECtBwmn2571PCNfEMPX2xe8slzrK9Opda16X+uMOjFP/KLxHi5jyeAG0ppufFCgwFGeN8Nmx3ggkIQ3vFc9ROF71rdFLyzHpnbxtkeC5UNLNeJG96FFgaCSG8/7IgC/HuCDhU/qx1mTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396165; c=relaxed/simple;
	bh=vbQ0KEhFti8p7PTkMuoFIU0GERG+jrsA92raKdlHpSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paJKIlDLGUdDnVfhGvXrPMgNmAvwXds+wJM755XQkNKIUdcOhHCXooaapzoQv0NgZ26ITOHl9XD80Hx88ihIMzHL01Vi8auMAspNC4lvcchU1z3/3V6bqqAFRpnA1350LMLqy9AQvq6N9lJFgbPfhd+A+P86q7tdVzrTo7oegao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATpvnhGG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223594b3c6dso153316595ad.2;
        Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396163; x=1743000963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGMUbTt7iIqwEBWWKqeJyEV7/9JgbkufipFOA1ELWGU=;
        b=ATpvnhGGJH+hK+zDzCPbfc6WUkKs0EjZgbcWyHOhX+Am+FSkckuGNRhSIt0Y/HAeSF
         29nuz/Rs1yHJTpUlc+7ctGrnBTN/U0Xikr7vj28tR37yqbj3CJZCANIQvKynsZWXOJPw
         fDFSmnkC/T09HeMU33tPIPBsfAZ5LBGf5Hg17+3ChEuzLKk8jZBkQcLnytgQn5ROTJrn
         KQOOGXyZk5qTwUF6GmUfEEhrdx0pLFLFL71G3NW4HxNqI6lqhUTO6EjOmOlxy5vkSj+9
         CMO8dGITKRqXl9DZ+/eZF4UyRmpXgrgzL+8jHaINSCW+opQ/2fMYK66FVfC4EwPLbY1z
         q+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396163; x=1743000963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGMUbTt7iIqwEBWWKqeJyEV7/9JgbkufipFOA1ELWGU=;
        b=gv+79GjpattiKG3vdbiD24T6iKJ8bv63cFGLN+WBhDo2C5tl/SJjWkkFSRWvSTwF/0
         FvLoCs6mLao+S/HvbTsTuwMcATghgYmD1bdLUmOZPYLNofVteGH+icaYp6HHrET5c4x5
         79snbC64WoMvhTa9DdtqpSrN+GdJKfqQMt6n+BFHeEe+IdEG+EoFQArg4WmHsepNEsrb
         3A7KbXSPdZNzc4VpYUxx4UoKAAlBzm9ujQqnx6bZhP2zeeo/pbzMVrrrWpAdE0lfZ0JJ
         c8ESZgOutdEbRIzu0QxRqq830AolEhT1sAPb6cpN8SQZJ9wAtrWNtzKEV/tyElmMcjgu
         GIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVypC22sRqYPRvc8/SHNgr0QcinM48a5hBrYHo4YNDSyaVKReIIIlnYPVCxvnEfYzAuFS3IuFCUNaBw3umm@vger.kernel.org, AJvYcCXAvnzVidzCcNpG61qeAFKuR/aLITzPGbZvmseghiUW8CD5tO/OgQaS2mwPOsbzT6VdHpzzxitUviWSxN6f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy632PR9OFYHdH+m06a8e0OY25cWQH1rITKGkXfnnp7pEyFyrJ8
	ddzVTvv9txm3Nh+7pXHD+con2Ha0RSEdtl+0fZinxmHMh1zJLyuk
X-Gm-Gg: ASbGnctvNYs6e/wC2q3t0Qf0I4A34Bx66wCtjCAublDdBth8IhuJHMOK7ATSVQFzyiB
	tcQBB3AsmUgePCnIbAVeY84o+exKMoCZ4jJ9CiFxNZub0MK0Td/lZuCHG/Sayqhn75HsKdVfAS3
	VMHTTuf7jkZqRVLsUHkpiTbaK8V/bLkve8flIDp4eXI3a1gxO0aJv3nRp90ZwucH90I6wYviBfd
	yoJu3mNz89/dNVyDX3AvbAF6Nci7Xuk1sVVowS1hZNsVlTfqSsPnpexxF08TvsYFv8xEK3QsSFo
	E8dVpo+ca4/7vNEn8co6zNWCCSy4FtdlL7a5eHw7ekwjK32iGANCtI7VBsrg59zJXzOUZqvLMEg
	WBYXZRf1hIf91QlXC/jI=
X-Google-Smtp-Source: AGHT+IG6C1ekOTiy5yIDQoedqM/ij3ZtXbk1UlaxZBxrq32/wNuQ95sjJnGINydt9NUsDyFDytlCeg==
X-Received: by 2002:a17:902:ea10:b0:21f:768:cced with SMTP id d9443c01a7336-226499284e2mr32985575ad.8.1742396163076;
        Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116973easm11691119b3a.153.2025.03.19.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v2 30/34] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 19 Mar 2025 07:52:42 -0700
Message-ID: <20250319145425.51935-31-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
index 4831f4e42fd9..e35125d88466 100644
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
2.48.1


