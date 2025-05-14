Return-Path: <linux-arm-msm+bounces-57925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4EAB73E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B60307B827F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17372293B6A;
	Wed, 14 May 2025 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArXfemQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA129373E;
	Wed, 14 May 2025 17:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245432; cv=none; b=eqnb551qf9QpPaYMaUCEmiT0AbmgCcvXE9t+pq0rhp9bSPyk+sCShW9Y/i4a7uZ1Xy1fO9lMTW3uWLU7L4gNCUzHTPrsu8qAE9yuoQpQTLUoD1Do+jkFXaKx7q3b3OWD7ZBHaPbb1SpnKZM2U+sNsfmaYalrPpo41brTIP/sa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245432; c=relaxed/simple;
	bh=j6bKjmoop+1/uaz6CfUQ2VZqh1wDm9EZSFTjlMrhnBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9FFTkxlAOxUWo6cmSfMjOivlUufW+nii0uEpLVrSOoyhx0HLQWW2VF4pT1msOwqIplKWMixVuUu0ETYiEO9mOH8E5pqsRzaJcpk+Z9+gnCNt45swyJJDU8ugEtu//y1/U7simZUPutL176oynmuH4DUdguM0UxEApfCbNazEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArXfemQH; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376e311086so165955b3a.3;
        Wed, 14 May 2025 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245428; x=1747850228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=ArXfemQHSyQ3/T9oJFB/78w2yvg6mlxtQggTL+E51LUg5VvXYWpUG9KR5nKfBYDbyc
         ZrJXxyns/tUxpdElP2bCr0me2F+i6+PX9ag8vXpBB3j4ZiX90hrzes0jKFAEYwqwZ+79
         GTECWZFhu1P51kRvHl5phV1MfJcLq/W/WPZeisHd+zcwVdM4sb40V1jeDh3BAWvqoNqI
         1cCeBxNPitzEpyJQ+EYCP7soEb6iMbVGbh313vvEcRVw+X+yldTb723+Ro69gjKbL+EJ
         z9LeAU5XXZiL0AVpsVk5nqIxtrHon9TPkGSN3ZuSpxhPIGE6HuJsKbrrijtANecMU64p
         N5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245428; x=1747850228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQObzJ/G5smai1eIvIjNkPePS5oTUL5f/3qh2v6cVDU=;
        b=ZZtWr+KaNSC3tHVz8pcuEnba/gbRlzFtn4UFOPsxyErlD3MFzg6Fwe4ZXPp71nrVGr
         LOYwztRy0GHIaAnnS4g9FrhZbPHX87orasJHOs2NiiOwr0sO9Wv+ZA/Xgps/r1NbAulD
         EfbHudqCjdnt7ACPHOLTyqJL81TC97zqN6PtTSuopL6FeR1aJ7+wRd0nGtzr0pqyV2fC
         XuKLzQiopoIyx7nmvFQUuPYp9uyok8QEQydidK+iQyxkbf+B2Nd1vsOYrQzYw2Nkj2+C
         T/w1fW2ehakLRJWXH8yXs9LYAJ6FnDBQjEx0/RsWGNSD8fKoIaZIcMrXD9r3AqmRnY8G
         KCaA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Y00XZki+eAOF6lYEKNDJOu7rl1rbH8gr2A+ix0yYshuDwk3Msufv4B7u48o5v84cYAIju1b9vXTK4c4M@vger.kernel.org, AJvYcCWeyhPabLBAcXPOex1OX4eIveO1ENWcHKbVrmWdUcl3CPHhh6p5qjtu9NfwbzoHO+Fcdy3fx+MW0F3lkmmp@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoF3fu3MYWRA3GalWy27+VHdkXMwY/J7AQrvBe7ZAyItI9wb9
	0KhQTP+aJL3xiGt7wY9V3gpCAI8V9RXrTpVx9g4qxe3cVSCyOsSc
X-Gm-Gg: ASbGncvCvtwoPJJpbK9Na6+EfYuyWABXqhqlc3qdDqEhpw/f0eFSeiQCtKVydQrvZ/R
	wIHsjM8IYgm4WeyNARw87Nw227Ev7wQvjlodrvVvGhoeYvc0eHgP1wE6syCBxMX9hFuxAAJ0N30
	QJTPxZrWG149EW+LyX7AGXkeum8vtXakcI7NgSEY0Z/AiRY/V74Oy+BYR74jTZNp9ISdec1t24U
	c2Yd++F5GXdxXghCUnFmGe2NMfSgwuR3md19JMTly9zSyKJjMLfXwriI+xa9+/2SQ6TeuFGVc5C
	O9OPYm6fS69mnjjom4np2kfspwP0tZzmJMuE9DK0DE5i0tAhNYP13JAD1jV0s6M5Ut5glol1JxI
	HEV7CUa8A5fpgQxdgQA23/TiDjA==
X-Google-Smtp-Source: AGHT+IFvqGDDbKYn/ol2Sh9+UeUz8WXB4kWezbNzsAEeALL/EHqt45gf7BNh7xw8UU3lGlwevYccsQ==
X-Received: by 2002:a05:6a00:ac0a:b0:736:692e:129 with SMTP id d2e1a72fcca58-7428936236emr6894905b3a.24.1747245428509;
        Wed, 14 May 2025 10:57:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423770424bsm9657937b3a.30.2025.05.14.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:07 -0700 (PDT)
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
Subject: [PATCH v4 25/40] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 14 May 2025 10:53:39 -0700
Message-ID: <20250514175527.42488-26-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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


