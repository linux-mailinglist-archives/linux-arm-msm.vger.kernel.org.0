Return-Path: <linux-arm-msm+bounces-58537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D661CABC6AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A594A4177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA2728C5A9;
	Mon, 19 May 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvGidRLm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529828C2B1;
	Mon, 19 May 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677513; cv=none; b=ShtSnOAXrmb2QJkQWjwnkwx8rULCdHYuYlOKyhSxM5h3oZ5dGXgk/5E8AsypljKdP/TWifDeFN4BOdBG0qeLDqYxmC522/aA9e3ldH/JPf2TVp9n+12h+Ibwjqi6TElunwtrtW42fC5dQGw9Yk0uSFGy03/fI6OQiP/D0HMJGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677513; c=relaxed/simple;
	bh=BuOG55v99u/wyZEZkhop63nDtOBrVULAauHXI0T6Qfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHflsQ5Ts0LaQZBDcM7QIXGPq2aJg81eGamJ32lYFdl57kM2o83hzK5qTU7EjMrjTJRiYNUbdOhV8Q2dYnsuzKVaPa4V9Z9A0rdFO2HhQkDZk2Ewk6Cx5rZPU+NbRc/5mvdyphrJJ20XbTS0rC/AJkOogKfce4dxYEVd2QpSoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvGidRLm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4856663b3a.0;
        Mon, 19 May 2025 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677511; x=1748282311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=gvGidRLmwL5bngtUSCs1wIQ5TT2aQThuiojStzXgJYGhpEvmw/xxEe5n+57ZCApk+S
         s8ITKFdG12UdX5TowiuiKaGLNtm1byj45IsJngWAgZ1ntM9Nm6v/N/k7KdPOeszt0NbT
         kMKoSiKYx8Yn+YwWgiL+vF41jr7B6yiPTmshrTST+P+0+nKT9a+pmZHK59riK3Qqt4WJ
         RCm1k96qeUqUfEnePD3e8r6LlvMBgldiIY4+8oXPWXtJSBZjs48o04JXxd8SkjuM2ZzT
         OKXKpXrEsX7n48V4fnQFg8kKxo8kyLaxmk5IKxx9R20zYzsvuF2Uq24X9zvET7RV7OAY
         HDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677511; x=1748282311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kT0TmtBcaT0OVTnm09Euq5X3LcvTa/vRpQlqBQDIOE=;
        b=b16P/gsvjmwRaLJ63tQ59kMcgDUERRAgr7rV9Krk9P8M91oaw/Msi0B2Q9GmDqRCkx
         j9A66U1GEvfyRy4XQmFnciJxWbxRrn/+t+lNSopvXoF4/P7R7A9JWeyvq0z1TYAj8szD
         sWGBDQgkiQdtrLaX9SVsVfmvYX1aW4kzOakUFAAPe2OEyziV53k+DztD60XpNkcih3Tb
         NQK8ssVAid9qvnt9m5RgV8DKSXQ4tdzO73qh7cycFEMzWjxO2VDS40sGNvFqhP1BzQMU
         ubGC58tQYUXp6ZPz3Jxol+fUXozrs6wHHuHI0nFpQkG2AF0xyEFxanbxOr6pNgREI7zd
         YURg==
X-Forwarded-Encrypted: i=1; AJvYcCUIiO85T9eqYJJLCejqulyRrlNM4f02C+KK3xUvu8WalSfLUNWx955auiC6sZ1k7bD3H/+w28bFecKmPAJu@vger.kernel.org, AJvYcCVZsHE2ndX7RGNYEy8HyPkgPQ98nxtg6Gt9HE3WC2Fwd9MufClrIHZy5E1uNM8ec3KZnFYz0OB+nm14/IKJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LKR4NQ16se66rbzD/8q0mXW0fbL+9p+q2f0R1YSaISjOCLe+
	OG8kE6NCO3RYtEWQCcttBlFSM/8V2FvA4tjz2yfIyDG3hknJvy9l3AyR
X-Gm-Gg: ASbGncsxmYgOywoZRA1zRm2FAAzlKppyddK6lQH5WwEOVWV70bBzeBkU/1RbTiJVie/
	XG0hF27MMge1gAqtgC+JP0+aiq9beKNv00vJeEURGs4NbDiy/NNbceybawOYpo08jNd1YRlylrJ
	dnPUGP6mAEUJtL1Xg0rme95umtdKbyM1LzKFQ6M3vzbRdCpB1Yw/p59a5E2z2wDaxa7nY9QvFng
	Q/mxBafT6slAEU7f+Mmo+KI/Uci+Ih7CjkHvk6C5ZI79CeKzhIUAe7+uRwA/E2pIIscCPLhQHr2
	yDFc0X77AFDhgETVBJ2a1EVTpCEptKaXYh74BwT90xLsNCauR7ZqWX7ioMlAj4WOU6qpF6UoWCe
	ZX/mGzA9FIU1Pk4KsizY8uWONYg==
X-Google-Smtp-Source: AGHT+IGcNbZUzGfoylGoUZxjRkQzz9FJ2idEjJZ6ivfqPV/jiUM1EgTwpooQaYWRwMgYCi0RdliOzw==
X-Received: by 2002:a05:6a20:4309:b0:1f3:1d13:96b3 with SMTP id adf61e73a8af0-2162188cb19mr18253281637.5.1747677511282;
        Mon, 19 May 2025 10:58:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a44e7sm6583580a12.73.2025.05.19.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:30 -0700 (PDT)
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
Subject: [PATCH v5 26/40] drm/msm: rd dumping prep for sparse mappings
Date: Mon, 19 May 2025 10:57:23 -0700
Message-ID: <20250519175755.13037-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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


