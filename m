Return-Path: <linux-arm-msm+bounces-52004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAFA69296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22ED1756D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D941B21E0BA;
	Wed, 19 Mar 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljjzPbQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D87621D59C;
	Wed, 19 Mar 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396166; cv=none; b=b3JkwXLUgXWjzuHQ7dM87xvQnA4iV0Qm3lmC+f0s1FLKv3X2+Bt6uveG80qRsve/dmGklnZv4Z5vr6eQOhRMsMpx0vTluxG8LFnpfh6zibThSN5js5gmp0MYWJKPvhaEnf174ErryfhXYwtUcACxVMDEhnUrnhlqHz/0uVRGvSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396166; c=relaxed/simple;
	bh=XFrw5u2qWMhLqWQN6rAEO1fDp0MSHDKigS985FrCaD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRwLUAkYa9hZjWPst4roEUhbfwGJHqnUvtUMk7PuLbCL7cSxN/xpmBlHORzcOstN7uiCvJwQR7JivGMn7OM6UANVw4sLFOb/EO5MAiyBc6h3ijv6ncLmW1ahgbuMjIvLup3dnV7skZPExqHrh6P4/akicRS6EPkkk+pZ1xvDLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljjzPbQB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22438c356c8so121928915ad.1;
        Wed, 19 Mar 2025 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396164; x=1743000964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZyxZF1nI8E1mZeUh1efMDQKSRZ1oVsI+H9k2RwI1Ak=;
        b=ljjzPbQBTNUPflXSoqkVkwVj0huKAXAT5sq5hBF7ve4hxtgfBnJaUYUdP7y9fVVNi7
         yL8t90qUwC9fZwKNWxUcDwpp7eCm2pd4qGllA1adELXNyJmFFhU5NP4eJqej6wFEybIS
         g5zqZKidDl6IGd4AvgIRrPiTNyBsI0tCE7/+D9Q2vgzCn2Ja/3OY86ozexTg3DQFw9wa
         WmHgsqwqwWfNQPmtN8S9L9owTRpZ+X/7g/Xt9B1VC/tL/X8ZuPMGS1WL/FEggYUy70an
         mImidEPAP3HyUVJYWj1zoVzPhDKL7XI5z0KrsoYr8kk06FhVwGbL7lWMeoeOdROfCVS/
         vg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396164; x=1743000964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZyxZF1nI8E1mZeUh1efMDQKSRZ1oVsI+H9k2RwI1Ak=;
        b=F3KCjcV62ktsYXKsmQSve+w19X5cn9U9SIWcJWDYywyvYDUXJEZNMsjzN3ZkzbPK53
         DusehLx4zBQ9QCD2QSzwBNlIeITUkc4mDJyv0lx25WqwSzf7ABhBy0aCF4ObJ7B15LVm
         kohkAd07PY0NaQKpRpepHbzJvLP3fL3/GFceqVYTvCvat94FFPp23fI3zYmSnagwvEwi
         +4bjyVTysLT7JFNvwwTL4SK/tQExQQ7z0mcSwZhjJVYnATWILyZ2FDPT0PWRtYE9L7XP
         4598fvW4orB7LnsshDGLJva9qA38KW/vxvo9id1ZOqyzgRdNN4FBEKE1rPVqMn3GDezE
         Rdsw==
X-Forwarded-Encrypted: i=1; AJvYcCVWXCvQgNUC0h7EIwTDlIxMvxGiKJoy8AnN2iSkb14TBSXrVPRVI5zG4zwLldNPJlbcOHELmDLoPGV21SGi@vger.kernel.org, AJvYcCWJlKtc25C55G7ndytZdw/r2rkFSHxm7seJUMEIBr2AGA+LHLkYCCY+oldkXV0jGi1c5Hq01t1c2jPci6HL@vger.kernel.org
X-Gm-Message-State: AOJu0YxWasjyz80sPCke2KkbWTkhmSvYjPED0XzgOsMXe0z025CIfP6a
	Hrh91aAThtvnhVi5sB98poDVH2k41YvIaZute9HPoJ7Jd4vsz51+
X-Gm-Gg: ASbGncsLnQPWDC7ymdPcTYfZcNTNHSPKeI4k1IhQ7t9rHN5QeTt5DmKxBcge5/LpvH1
	3H9SWo4SB5MHLgSBIROgeCPYTQy2VgZRaX0cOPMQcEys/HHxtqMguj9jRc+R1RjNQ+2WgFG1Onp
	HuR8O3iBVhetpdQUG/oYQsVrJ3GOZyh5caBpKpwk7wHChcgRlPZufUkxZUUukU39DtB6JkSlK5Z
	28CFaDBK3gH1qGHSHKUriJFIduDlYkwgNiAdzKrHAKE0OCexmc24lYbjqAXI7zuoJ9hCjV4WyZS
	dqiw7GpXRkoxTNFU1Q0Ou9WhXoG++VKC/AQI4CEEJFI5fUQ3BIxBC9uprV1uWDJvVpl+04VUpI9
	Ua7UF0jBuShQuxtul6wk=
X-Google-Smtp-Source: AGHT+IFqEszybvbaGro60Kzsz4sWMwuybNXHGvQpUzUdz3uKHnJ5bvPgXOMr2/uENrWiEeOfd1OvXg==
X-Received: by 2002:a17:902:ce84:b0:224:1294:1d26 with SMTP id d9443c01a7336-22649935818mr29989425ad.13.1742396164506;
        Wed, 19 Mar 2025 07:56:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbec04sm115037555ad.191.2025.03.19.07.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 31/34] drm/msm: rd dumping prep for sparse mappings
Date: Wed, 19 Mar 2025 07:52:43 -0700
Message-ID: <20250319145425.51935-32-robdclark@gmail.com>
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

Similar to the previous commit, add support for dumping partial
mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ---------
 drivers/gpu/drm/msm/msm_rd.c  | 38 ++++++++++++++++-------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0409d35ebb32..bdd9b09b8ca9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -420,14 +420,4 @@ static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
 
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
2.48.1


