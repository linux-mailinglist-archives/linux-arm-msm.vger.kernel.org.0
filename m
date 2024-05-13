Return-Path: <linux-arm-msm+bounces-19799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8188C4496
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 17:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB0F51F222A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 15:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B994C15443B;
	Mon, 13 May 2024 15:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5BdzkMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C2148853;
	Mon, 13 May 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615516; cv=none; b=LYmFm9GumvL2fXkJUC4Om7Q9oJ1MyIrda76qTWi9Ro8xdR4qHIW7pk3ly92MWYuqpey3cuqmVCtMAS9yZhCVBTSGmlKuosyt13T+q7v0+bu6cAHLs4q2KO8Fv9ALEn6qtcNgriI+NR14A0WA4cezYWHLGXJ5a+p032Y7GC06ni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615516; c=relaxed/simple;
	bh=3imVNZ8J43hY3SgwUsbOPr7mp+hW498mREULCZekQPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jIPrT+Yg6bvxlcB0EVOS49enScBzfU5EX/SYH2hZoYlgKvippBekBkXeegDI6F1gn0zLuYGcHJ8XsUZDErj4gQVzAPsrsGzANHm6m+wx17trTmsHEk6fVJnq1clzpwY/DJdpvhi/M4wskF7WGVHvhDYtE/SVi1DuIk6/1crU8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5BdzkMv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f447976de7so3903326b3a.1;
        Mon, 13 May 2024 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715615514; x=1716220314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1wioqfQiuQuCuNYwlP+E5Wyu8F6jbMqAw/h0oL3eqU=;
        b=E5BdzkMvItijxacNcTnQywLJQRhulPW/U18k+7mCsCFs/TRaR2d4S0ISuAC616Q7fY
         /uKkANAOcAJQD7PJPqknoxwXOVoX2pjnRSCnaY2fX25ehE7ymzbOE9dv93mm9K0krfpX
         UpAsX1JHodwqUvLA7eoWMkxRnw4X4zB+UOaudWml3J7ZmUZ7HBdPkzxx/ZxITOLyfzkh
         xhHSBEcxqNnUn9Bahlr696fIOQ5SvS52woMbR9P3qsxoKNZHpEJ5uhqEFfa3rFmxkm6l
         QJK4RiK5SvW7kqhFy/bEzmMGBGyIL7fLJ+cx6/Qk5J0jvu0NJ2ka2+Oc0XKZMYJ5Ocer
         J3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715615514; x=1716220314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1wioqfQiuQuCuNYwlP+E5Wyu8F6jbMqAw/h0oL3eqU=;
        b=UKm/mLGR5UTZ63crCmM5hR+oJGqGPUgPS5mtv3hXf3DVUSctt4IzxKag4pK8Mszjlx
         RzEVS9qnww8BFvvBWvc3TFgoy1ff+JBKXMVbGF4VUD5QjmqYnA3IyEPJ2wwCdRyaIe7h
         MTt0ar2joumkf0RV7anXMbL9eK4RL6wiYHCQsQskSgfG3t9boeNn2oh9fBe2nUeIztZD
         nybt+64kvx0BxVNYzlfYcsgbPB7OOwOOLFwdaXmKwYI2kdrXp05xYbvE27B89Xgvg0qX
         70Ic0hkg1Kh2GIi91lnwwBxhrMoADHWtMzwkNqbptE5HoXdiZq+xhKshSSVwX2G4w/S1
         OVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVzivmIuj7oXS5EHSwz1fBaqZ6f+G407ZkRrqXS4ZlM6wap5fQWx4CrTwnam3Im6ryv5xUqfDSIAi7mHjR1eMHa6PvqTlxWnhvLsIcD
X-Gm-Message-State: AOJu0Yx+gltDMoEtICPnQN6ihKchyAWfIzTJ8mPCACOjHIuvN2eBNIDH
	cPkRoB4XFG2r8P0fwa0abRyQVebZfNm2qIaiWRuki+flSKG3e1jbExSn7Q==
X-Google-Smtp-Source: AGHT+IEDqMYogdWr3XOXh22OTvx+Uw4uVC3Zk4ODbviWxNXuhd9FThKOLXrM7kC6578pgduyhtA/Fw==
X-Received: by 2002:a17:90a:d714:b0:2b8:f7c6:1581 with SMTP id 98e67ed59e1d1-2b8f7c615d5mr2619575a91.23.1715615514501;
        Mon, 13 May 2024 08:51:54 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ea6ae7sm9906113a91.51.2024.05.13.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 08:51:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Connor Abbott <cwabbott0@gmail.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Add obj flags to gpu devcoredump
Date: Mon, 13 May 2024 08:51:47 -0700
Message-ID: <20240513155150.166924-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

When debugging faults, it is useful to know how the BO is mapped (cached
vs WC, gpu readonly, etc).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 6 ++++--
 drivers/gpu/drm/msm/msm_gpu.h           | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index b7bbef2eeff4..d9ea15994ae9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -887,6 +887,7 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 			drm_printf(p, "  - iova: 0x%016llx\n",
 				state->bos[i].iova);
 			drm_printf(p, "    size: %zd\n", state->bos[i].size);
+			drm_printf(p, "    flags: 0x%x\n", state->bos[i].flags);
 			drm_printf(p, "    name: %-32s\n", state->bos[i].name);
 
 			adreno_show_object(p, &state->bos[i].data,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d14ec058906f..ceaee23a4d22 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -222,14 +222,16 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		struct drm_gem_object *obj, u64 iova, bool full)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
 	state_bo->size = obj->size;
+	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
-	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(to_msm_bo(obj)->name));
+	BUILD_BUG_ON(sizeof(state_bo->name) != sizeof(msm_obj->name));
 
-	memcpy(state_bo->name, to_msm_bo(obj)->name, sizeof(state_bo->name));
+	memcpy(state_bo->name, msm_obj->name, sizeof(state_bo->name));
 
 	if (full) {
 		void *ptr;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 685470b84708..05bb247e7210 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -527,6 +527,7 @@ struct msm_gpu_submitqueue {
 struct msm_gpu_state_bo {
 	u64 iova;
 	size_t size;
+	u32 flags;
 	void *data;
 	bool encoded;
 	char name[32];
-- 
2.45.0


