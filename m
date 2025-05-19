Return-Path: <linux-arm-msm+bounces-58539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D4ABC6B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 313D43BDA1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF19E28CF4C;
	Mon, 19 May 2025 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKwsCfZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A728C5D8;
	Mon, 19 May 2025 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677516; cv=none; b=BgYi5NNeO6Jw0KPkmGzEtRak4hyu31wIIrzMy88XOXRFBLTl5YTroGajrNx1W/38IRKouPan/+ceCDNAS/+D0+0sF5CBKEicxMcSNGkfbwN6c6Ovtq0DuDLOPU8XfT/+gt0+UOF5t7WOkFVGbJKFekOmXZQ+EQp3+w03z4j7g8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677516; c=relaxed/simple;
	bh=1wsvWV0YZRQ3M4IxbBtLuTb+92UFg0iH3xbdfIwOzMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wuqzou8vIydgS+ZBYzpKmyVu6xkAbeoluyliaDWoabiBX5DKYm7Ps8xGKga1XQ/Tm9OXV/9AHUD2GGcFL2MVjBfBl/VVHbmf9gckrsnarXD5Q8PT8bdxOPBGu9NheA+kQVZ7vDDR8zmgWdsqhr6bJEcSEz0WXFHQLLC63u7GqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKwsCfZW; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af523f4511fso3738224a12.0;
        Mon, 19 May 2025 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677514; x=1748282314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=WKwsCfZWFw0qbXlKmK8Sccoc4E6JwqBeCDyKwrc0EoaFBFfwEksTUzmeTkYzBU1yCB
         0k1cfuOzsD7oSTGJsz1n4lDF+/ZSKqUg0qGTQ7WG6KVQwdVMmcXcfLzHNIJJtiUz36BI
         9L96moTrGRg+xdi0htfaKOGE6SXzPVM7EmOJEV8lX2d/hY5aocVI8dlwYDxYF5ghagoz
         wqw+4tOsiqU7ru8ZF2p8aLTOmDZa3TW4dN+RnxL8yN66ELRlhZJ7dwFaJTTQeXc58O4S
         DN/s+DYy/RH5Opj0MVIlmRqVMaStie21LdJoyJPuK/dXsrTmk70LUk8dkg2Ob4ZXijl7
         qPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677514; x=1748282314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=rlbitACyfaJMxWRYW+/FQ6M0/uZ+DBq9FkEnb9WQwwBrLyyV5sQQfYnfZROP6iaKXU
         +2bGEdJx3Y/v/XoQgvqGSYJQyz/1stq0Az9oW9oNko60GZmLP1zxIhZdTDrf5aGWART4
         fFYqRBvTZkeuD6TEmWGQlZRUOd3XFzL1QGJqKKEJYBe8oYV52F6ufTknlw/yQphUMTLc
         ZrRSIwjRbRJ6JGm00g4fowMMMkDfPjNifVofm7lEczR2G84tLg/MS9SSSea6bXlCcC4e
         5NciZO4LgyuRgrghVMOw6lCb9LNEnO+L/IA8Z82Ueg3bqZSyUDcWide85h9/LXtaiopA
         YL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN8O2A49nlMsesxEmIlMuO7m8MDhQOA2D3cKwm9nDqlvpSGfqilJs9ofI3ZGPz4zCFJbs0lv1zJDu1UmfC@vger.kernel.org, AJvYcCW/c71UCo05EFVdh8D10E7AzEg456rPztJ/AcoYqk9Bho1cWj7n4cuuLWWyMtcyRPaBh2Zic0yBnZ556RQh@vger.kernel.org
X-Gm-Message-State: AOJu0YzpC3GdZr33nrxJIQsHQwnZFfxfEvCY/ctDsKeJsxX5Icuftb4s
	y8dOutqXpQ0XDFOUn+JgcwzDK6HmCLykVdewDEuLPpNtIXirdCxJLyN9
X-Gm-Gg: ASbGncs4oYKDErlRgYxy0+o20zGh3oVNt1AeUvMqlRV2MIjIsRiSw0pvrWVNBKrHYO9
	E8Zyim9RtrZ40vz9iB2iqifhIVk9IjOgJl0Fe7JiCkTdtvYxvJDKpaYwPEt1RncS1QbGAZMvCgy
	pNBLYiYFyrPRc+/e3CcHLlCYw4AWpoiUQN/S4PKzMhoB+uEp2TPcSdK13Kdt2sMDH+0VbKE+h7/
	FN2i4sYPhoHkWZ3VGqCqqHnakuoNHuvBnF9Jk6VSKYqcmicLgGwAKyjsVUwIlOHq9awFTpUWZja
	R7Gv/8xT1wYAVQF5ojpVfKgDmh/JiVkv87kwwIahgIXkCKMfzGCV/8oU7hYTtPIDOtVxmOhxgeI
	GVtkIFRCnQfhjLU8j4/hSKSqfVg==
X-Google-Smtp-Source: AGHT+IHrmLudJpGr4AV2O9eH5ch69mKTZqWzfXo1Zl0S1OWsw1bZvzg52Ne9++UTY1xHmvTFxaiFnA==
X-Received: by 2002:a17:903:fa4:b0:22f:f747:8fbe with SMTP id d9443c01a7336-231d458284bmr197335365ad.53.1747677514284;
        Mon, 19 May 2025 10:58:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb9f6sm63061805ad.207.2025.05.19.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:33 -0700 (PDT)
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
Subject: [PATCH v5 28/40] drm/msm: rd dumping support for sparse
Date: Mon, 19 May 2025 10:57:25 -0700
Message-ID: <20250519175755.13037-16-robdclark@gmail.com>
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


