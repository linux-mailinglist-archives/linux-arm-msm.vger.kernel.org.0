Return-Path: <linux-arm-msm+bounces-55972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9117A9FB64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C2987B05DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5488D21B8FE;
	Mon, 28 Apr 2025 20:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb0CdEAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAB21B18A;
	Mon, 28 Apr 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873866; cv=none; b=tGcG3iBK1mgGXsZhs4mV+5t2aU+BswEP3yeh4vnc0tMdY0KOk42hcCz13mu4cdauejZMc0rlnTTBUkgdbDcNR/cbJQ4s1GEHpFeB7lVCzL0jtX12TZAbVnbmI3jmzVCIM8zIyRZIf7StN4Ccg5WBl0KF3wnp+wTO2gaymQihVXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873866; c=relaxed/simple;
	bh=1wsvWV0YZRQ3M4IxbBtLuTb+92UFg0iH3xbdfIwOzMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA52eDO3aGp8JejuNVUJ2BEYk3uiiiBTksuXyT9rTWXR+WR+wScyQZFnTgwyvdtgL/i6/tm8XAEVw7cXR2ARMiapMpSLWcE9aBZCj8zQgPeBUFxsE/ZRoOUiI5A/DWvM56LOagWlalkE7fSI1NgP9YR9try/f1kHL2V8aePIs7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb0CdEAd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224171d6826so79937025ad.3;
        Mon, 28 Apr 2025 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873863; x=1746478663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=Rb0CdEAdgJpOI//BEgAq626HMwhj+fh7NTV8w3a71ren/R/+j54yp0dMPfcPKrv7+y
         bh7dvsMF9PMdh630zKTH3yZYyES7OOqMo3jj8K6wYNolvHgWpJwbstdkPnyVn/uNq8iq
         d6O4HfWj3D69oQ5v0Xc7IeZJOMCtqRcp3HVfUPjBOdmzTb8KHRKMmpX42eVPKMJQBnSH
         VIBcpm6UeuWduQZDHWyKJMD92iyV4akpt45kFpj98v7DpQDIeq9FZ484aG4szSFaMBXL
         n5tj+zLmXPuyDQ8mz/1o5xCKwbUmAchzv90veWo3alm9ICwym/tu98XGeC9798v8Yfn0
         5wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873863; x=1746478663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=XVX7RnVoc17spIls3Tx4GjjyCRKrSyzZ4mUNirmOiIW6eCYXzpfk5Mdy7FjGxIHuGe
         52d+LTjZwMc/0LvjKvdN1WN5nAzHakVV4k1aIKci0wglpMzR61GccdMllOtv2w7hsjCC
         2UqzCELAa78FXweUhWkK6uVCf15NOdtyWxg26KXq0gYhMZJ+5P/rLSdaS711Kefj8N/j
         edTGNcf2G2yV7A+X3tICD1p9ML2MfAW3ZBAd2YbbHVGsiVoAIBJQwPSmmeL2Wye47Xr8
         0GnpXA1mSRsuk/mjigLA2HXnKFIEZJyGq4zDMQ18QXSjbMvU0THAQD/yo3x0WUgTFf/J
         A6jw==
X-Forwarded-Encrypted: i=1; AJvYcCVq0O9e2PpgJTnhprV/nBFoJjPe4XhWiFREckbeSS4Jt42MgHAb162vUhWyoEO54NXHlKUvMdg1g864CmW5@vger.kernel.org, AJvYcCVv8m9DZJSXFLeR0B6Ru2BjnyUJyyn5oy+WnKa7iYAIOE9VQarJ4sRmLlkyRXAbroDcBPZrOYgsJo/JtmwW@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEqQi8KPbZiETkVFLgnnJ/tDYx+1sumABGy+hu5u6YYOBmQaL
	aIBeQLbbjIJWP7id3K+GKyBvwDUG8/O+r/9NvVaD6G4NwzoV/2np
X-Gm-Gg: ASbGncs12Qfpk83wu7YzSjlAmVIBGh1eeBO/0BlYOj/CBvAlbDUBTKF/U8r+PphaSJj
	mHCjKwBloPXjjd3NwgSGE5PcKsy73iL4YiEQ5u2YXYKqnSSuIThclTM6B4P2J5JdHrohsx68Jww
	kN1Tx6MmzjpjqFMU2i2EHTk7w9l1xzFDN5LmXmZPBYLN0QBIJvoMFEjDunxZkTmk06xNEUgu1TI
	SB+y9H5NIdRT6mX4E8/oeWbcL40NPKqnzEGcSHSgbk/dWXSxnYeS7mSAyahPm0KGfallwo/vjgA
	u3TwOemZydEXNzZZNiU76KY8ErZCjv0rpVs8hzj5meMOl6kQbYBoJdbyAvZbLE175gQ7xXcV1Tp
	IJl5WuImdc285tzc=
X-Google-Smtp-Source: AGHT+IGO0Wyb6MjGYuXyoTTC0xkygTgeuxFteeqaRiKWownIw9sbk+EtRyzAartKK1ODniQrSfUbHQ==
X-Received: by 2002:a17:902:ea01:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22dc69f83eamr158682155ad.1.1745873862812;
        Mon, 28 Apr 2025 13:57:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d77e77sm88284225ad.18.2025.04.28.13.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:42 -0700 (PDT)
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
Subject: [PATCH v3 25/33] drm/msm: rd dumping support for sparse
Date: Mon, 28 Apr 2025 13:54:32 -0700
Message-ID: <20250428205619.227835-26-robdclark@gmail.com>
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

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..54493a94dcb7 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		drm_gpuvm_resv_assert_held(submit->vm);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.49.0


