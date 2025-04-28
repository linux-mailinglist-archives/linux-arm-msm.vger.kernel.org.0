Return-Path: <linux-arm-msm+bounces-55970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B795A9FB60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216B91A8723C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A9921ABAC;
	Mon, 28 Apr 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqRr04cd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50F21A455;
	Mon, 28 Apr 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873861; cv=none; b=uWoaSq7QaJW7UZP93udVXt44w1jYhdFE7dz4KnovmJZGVTc87G2vFYrnyIssuws+dzDRblAK6GiosxpOUKbXhPL7TpIR6uSFUVysPOgwuoPAkjJ+ZNauhBGASNQNnY/7nolCjQo/pxLx9Vp/emu9QMI2XWdoE+BMVRUWq/SdR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873861; c=relaxed/simple;
	bh=BuOG55v99u/wyZEZkhop63nDtOBrVULAauHXI0T6Qfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auCilU6SU7bsJQZm/9ggd4LjqTEFsAlraB2azgoOUidozqTucYxlyCC1qw7nIdHmt1Hc2X8hicBSJ+OHUqIfA5Kg2oxYJ1agH55W8NrLtvRaT2ZCCjN+yTJU8gf/HJHsmFIhi4QDC3GDP9y/XjWvgOpy/tJYNzzerGKPZ15EApQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqRr04cd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3035858c687so4434217a91.2;
        Mon, 28 Apr 2025 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873859; x=1746478659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=kqRr04cdnKuAQk4iNzhU8e3QYDB23swQY+lvJBy0vjDiRwnqiqHwiOfwyADJQYcvwJ
         C9vMIR5Y9cJ1KFo0WoFyqbBzJVGRV9x+WU6VRDVz1DyY5glmP+rQiJN4t4j7pWAWh650
         uPysc9PdRX+ZeLimmEunXv2SszBm1MGtYA9uHZ33JU3hjtMaZ5+LgPxZpl0WQMIIIvna
         6o7QU/Vp4EkPHPeE5pu7OfQPsCGPI9iyBUqa5PJeM9XxfaMz1dTH/AFWaVSVWsrq79A6
         EKWTYl1lWjkRENr3pJxXo8Idh8LB50UujxrO6FUzIKhr3dZts5TcbZbISIpA/3dSifNj
         lO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873859; x=1746478659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=Uhm/XzK5ECxXdT7brSjfbPQb8VxgMNQw+kkLgGisoQQi5qsZ5LK0ao0R8gsIFc1ube
         5JrciNTwVbPIogwi1E+oHh9cJjGNQ6nrrsSUokS5SeaB8sOwGvjYGvlyKj5ge5MUoow9
         1b91gPcRHab8NaGgHiP+R1hqRxyWnTsZwjkFSz3c5Lf+IN/g7RYFYFmA8ZjNzuUW+fsr
         W1B99I4c2baJTB7RR55ZO0vQMhJ39gZa762zUeKIMOUWLbswuyFNr3SPmUovm497pkbn
         oJJKB4XFyKoEHNHj5kgAbqrT7ZMGOJy72KxDUiy4AkQwY5n8hEeiWf/iGqSlOcUZoiSC
         f7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDy7s6fcHrEI8jQMAh8h0XFM55SSYOFHgCjuTb3NeOSBpsIMDvFB7m/daNcsXAL776K1mwxYGRm9kpjT9i@vger.kernel.org, AJvYcCW1SFFxgThAg6pIHUTorGWdt9d26NiObXUnApExdWhMn4ODlVODShyKvOvNTpcKiYPGUuARH1XcBdr66V2U@vger.kernel.org
X-Gm-Message-State: AOJu0YwEOuxI4J47BwjnMheANDhm/DyFY/HdhFK+V2WxD34bmNHPMdn+
	+NdGjYJOUtZttgU9wDoloqhwaMKrRkjYcA2kZU3pXx7RtbKmwe58
X-Gm-Gg: ASbGncuvfQ2u33VvLaASuWQoOELF03f8BsKG6rz+7tqY/0dDM0ALgdE+RtaYStkG/R6
	/CfN8tlFzKhEh30y0rKe+KEOx4tmwZwvs7LvyzXrmwaxyA0gd7f0rWrPx6K0el03Tv39eN4cU6e
	Lvv+SMdO9dQhV8070PXxhhM44rJ5+F3jTvDWrcA1BPwUa5OXdjdjKGYjs/a7yvJCUTTo097lCY1
	qllPkw/++5/50TPTRt/WGAa9tMfWRpKpyWfGT/RQ0jmA4ivSSavEG75wve53+RJX5hJyOGfOyye
	b6OBM/jHLD3IZ42RVd2Mlww9enQRtzIJg5u8ZvyQC1JQuZNJraYwTDul6GsWvFuSybZyWuNk1Z1
	XCcsKU3iF/0EBxM4=
X-Google-Smtp-Source: AGHT+IFA4j1FCmA8GPwBPzKtphBOSMUEmDwzd7txi84H6lRlkSebQA9HsP1oOd1oXCDN8qelajX4jA==
X-Received: by 2002:a17:90b:548f:b0:2ff:58e1:2bb4 with SMTP id 98e67ed59e1d1-30a21586c93mr1552123a91.22.1745873859063;
        Mon, 28 Apr 2025 13:57:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f754fed6sm7783001a91.0.2025.04.28.13.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:38 -0700 (PDT)
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
Subject: [PATCH v3 23/33] drm/msm: rd dumping prep for sparse mappings
Date: Mon, 28 Apr 2025 13:54:30 -0700
Message-ID: <20250428205619.227835-24-robdclark@gmail.com>
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


