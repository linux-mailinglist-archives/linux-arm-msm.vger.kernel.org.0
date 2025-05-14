Return-Path: <linux-arm-msm+bounces-57926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF0AB73DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1F517CB54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583682949E3;
	Wed, 14 May 2025 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGS1xWdf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AF3293750;
	Wed, 14 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245432; cv=none; b=TVkjN8LIwmyfnJztqLD7lE5WJV6Q+ZSVrQgpXB0kzMI9LcXJGXMGc0ck8N9byRScv18l8W0/mBS+0jtDolaGDrswZXH5a/b4wDcZdT+N1oBPLKqjCdIbm2pn9afwZvnJK3zfCa4sfUEIEIy7aSjemL+u1JZEM4ldBtOnefTeCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245432; c=relaxed/simple;
	bh=BuOG55v99u/wyZEZkhop63nDtOBrVULAauHXI0T6Qfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzZY5rMaDg/n5Ovxw2Q+2fLSMg6jqWJR4ppOAteuLL/1eJCrKzkZS4eLeL9C/GbKPuUQCth7jy8RsxWm31vOCwYj756dmtJICpuyiFK623PZyLF9fmWYAQX/M/CirRbo7/UQJQOtKuMaZt8vbA9PehhRmYbRlTQMY4OIKSHGXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGS1xWdf; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso224852b3a.0;
        Wed, 14 May 2025 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245430; x=1747850230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=HGS1xWdfR/RYH3xRdvBljd6DPa36japDQfxRfsgOHtAbsNp/YrkOAs+ob1NdmbJQFF
         KufHx43n2RDJcZ43v+0T4YmrORiO10tJcWJX0FQ5SpX6Uo4O+x30358mxriMyZmP2V0D
         D6uulTdWUPAzs4e/8ODDOfKRmKZyni5fo5YoNIK1pgeL0mmb5x3PDk/D+yz7cOpqzV6g
         wTWaM9ATVWnrio6JImEUb222dxOS0iI1n85RK/MSIlZvLsH0vB6J3ddnx4YzHOoQUhce
         FGoXRRQTNIOa/eyAuKPPQaq1IjUPC/i2Z+t9jZa0VjQvO7kp6ApGYgduY6mUcdoD7MwM
         nX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245430; x=1747850230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=O2xlK0ye7h3TntRSfNFCtBYcdwTfzvqmStkeWrdZwxUkbLpurqSzBqW3OvSPNyGOeX
         Zr2PWhyE0iilK524fMzf6CECJAaCAlHhkJisUzxIYwDs/oMtAp8p4Ku5BGe8gTNzZXNJ
         yOvtkiDDGuvAAzc1kpRb5kYvcf8jShUV6pBEuGLZ4Kw/eF6O0m+bY3UQ1YYKkvNo5Uma
         +Se4YEMW8stq7UWJgFuqfmV6Awu60QseQf938JPXxGJoIwaYvdLxFwWPVdwLiXLBMcjk
         dsXRxGXsw2Wc3TVh/UYsB3agdMvT2aBBpp28T2Cco9J0WmsXtY0V1KD3x4dCb523o6Pl
         fXgw==
X-Forwarded-Encrypted: i=1; AJvYcCUIbScNd7hHk/q6gmqp6mwC0xeo9g4b7N0dgG+oH3xED+BYaqwxZTNZb8pQcB780KTkL95LVYD3VUbzLoIA@vger.kernel.org, AJvYcCUTlhYy4eMVqvl4E6sRw1F6bf0Rhc8Fty70Itbhzp3KgaPczS5ZOuFJpzmsko+9LKSyY7JJJZSr+9vNPfqx@vger.kernel.org
X-Gm-Message-State: AOJu0YxVX121/7Fbwhe/Sd21mYjqO9fA02dTD+JEl8UkLeWPjsPEDcZu
	ka/kZjSov5ARpkUc/asbpPUT1E7DVx6SiGwDU2EDcxRPmy5QZmx8
X-Gm-Gg: ASbGncuKKaPAbM0qKAst++C/CAM7bGcEl40ySmFwAw/Ec7jFRykbeR2Gy4lDBBfsWx4
	lmY4ejfw7ERN6r833nYhgNPviElebyqaqmnJsLscZLP4eM4xpZ8JahsvMzgGZvZZAK3xF/nxJFM
	lk+nE8eSsStVv59mIksq6+lODXDLneN5uowtkC2s+GDGqlzRCixSexMuU/Z+h200jIAS/LhjqXb
	gcFhSOZJCbdCUWr/afptpuK75Kt8E1bevxsXiKiOinexlyL9dYUcei0HJ/zA23UtwqaPPhiBFfK
	7Dagfgwt4n1DJhhlmoqUYtq19E4ZT/qN4d1cpa5KbIq0G+cvszS/K92EzBUOHmxSyzyn4Unw9oK
	zt4S5WKg+9TuvrFuHo7M+7N6BBA==
X-Google-Smtp-Source: AGHT+IERdBLJnsCnw0JeOkTwexRLqCKnv6uxUFKnFKJqf9D0Ew2AiXRI1GIuglRISh+thcuyBqTkHQ==
X-Received: by 2002:a05:6a00:13a1:b0:740:b372:be5 with SMTP id d2e1a72fcca58-74289290623mr5862001b3a.9.1747245429872;
        Wed, 14 May 2025 10:57:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423770510asm9662944b3a.26.2025.05.14.10.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:09 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 26/40] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 14 May 2025 10:53:40 -0700
Message-ID: <20250514175527.42488-27-robdclark@gmail.com>
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 67f845213810..f7b85084e228 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -402,14 +402,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
 void msm_submit_retire(struct msm_gem_submit *submit);
 
-/* helper to determine of a buffer in submit should be dumped, used for both
- * devcoredump and debugfs cmdstream dumping:
- */
-static inline bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 39138e190cb9..edbcb93410a9 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -308,21 +308,11 @@ void msm_rd_debugfs_cleanup(struct msm_drm_private *priv)
 	priv->hangrd = NULL;
 }
 
-static void snapshot_buf(struct msm_rd_state *rd,
-		struct msm_gem_submit *submit, int idx,
-		uint64_t iova, uint32_t size, bool full)
+static void snapshot_buf(struct msm_rd_state *rd, struct drm_gem_object *obj,
+			 uint64_t iova, bool full, size_t offset, size_t size)
 {
-	struct drm_gem_object *obj = submit->bos[idx].obj;
-	unsigned offset = 0;
 	const char *buf;
 
-	if (iova) {
-		offset = iova - submit->bos[idx].iova;
-	} else {
-		iova = submit->bos[idx].iova;
-		size = obj->size;
-	}
-
 	/*
 	 * Always write the GPUADDR header so can get a complete list of all the
 	 * buffers in the cmd
@@ -333,10 +323,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	if (!full)
 		return;
 
-	/* But only dump the contents of buffers marked READ */
-	if (!(submit->bos[idx].flags & MSM_SUBMIT_BO_READ))
-		return;
-
 	buf = msm_gem_get_vaddr_active(obj);
 	if (IS_ERR(buf))
 		return;
@@ -352,6 +338,7 @@ static void snapshot_buf(struct msm_rd_state *rd,
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
 {
+	extern bool rd_full;
 	struct task_struct *task;
 	char msg[256];
 	int i, n;
@@ -385,16 +372,25 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++)
-		snapshot_buf(rd, submit, i, 0, 0, should_dump(submit, i));
+	for (i = 0; i < submit->nr_bos; i++) {
+		struct drm_gem_object *obj = submit->bos[i].obj;
+		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+	}
 
 	for (i = 0; i < submit->nr_cmds; i++) {
 		uint32_t szd  = submit->cmd[i].size; /* in dwords */
+		int idx = submit->cmd[i].idx;
+		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
 		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!should_dump(submit, i)) {
-			snapshot_buf(rd, submit, submit->cmd[i].idx,
-					submit->cmd[i].iova, szd * 4, true);
+		if (!dump) {
+			struct drm_gem_object *obj = submit->bos[idx].obj;
+			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+
+			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+				     offset, szd * 4);
 		}
 	}
 
-- 
2.49.0


