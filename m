Return-Path: <linux-arm-msm+bounces-57928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC78AB73E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08D34E04A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FC829615D;
	Wed, 14 May 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTEM8PoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEF2951D9;
	Wed, 14 May 2025 17:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245435; cv=none; b=pmfIlFlLlMSkw2G5vnD+k16phTxbnPqwGn6M7zraM/0JzYOjj9GnntwC6oA9X+GeR1EGLb2a/OD1LYCJp2J+nEPON/OQkwnyKdyo4LipBrEK3qkcQiCbjFd+I/pxE+V8fMHteGdwdRMOJNqIrxCTHWrfjABJxZWWGMa5xZ/oczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245435; c=relaxed/simple;
	bh=1wsvWV0YZRQ3M4IxbBtLuTb+92UFg0iH3xbdfIwOzMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/OKli2CohPKYHpK9Y+PrHFjJeUYcJXaEAUwwnZ+hwIo5hZwOHa2vLjv6NyIUclYKm2KmXQY617tTTJPGT3MBgT/4SIQ2waKhahQgIB6FUAKFgzrBCEIGcPXcgmrprCqAnK19YEBnoeLjmFlyozWVn4nxx85RcngT22dpkLSdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTEM8PoL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2302d90c7f7so1259025ad.3;
        Wed, 14 May 2025 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245433; x=1747850233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=QTEM8PoLsEScoAio2B9pOD3m+LtktpJUo61kSbLiHBWso/3vyCOnAxKpxphtzBTTEM
         tT19Ln5CW/+ZV26T2Kq4UDkErXqtZ3l2nTevCr4+vE7WCUfZ4IzBAj8cygC5lIxIHHx7
         yBGO3ZVbSw4gzX5rpJBnfcJxbYniIFhaG1nPI5nWejLFZa0CqLKKgZHbfcCUHzUsrs7b
         As2cEAXbKSZcuOOwE4JPPQ46D5XwxOYbR/poeOEgBnj44FMjfIo/qBiDNxQ5O8wa9JW0
         D+g7iDjVz5aE1G7FVlY+vXzNdmxO5L5XZE4ThvBaKG/isb12b8UK2DR29Va1gMKGa5Pi
         5KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245433; x=1747850233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiZxqllnGo+IvZFpO+z8qrywFd5uUBfHA/RzhZX4v9U=;
        b=e9qygpvtqP3+n/CrhsVaNbWksUhqt25EVkuhIWubszyqmUYMOVrNpfZk8fJ1cOmQc9
         ww8BZNEFJZNuBGTuJodYmBsNoQPT+SUBc91Fd906FwSA2U6jRXALt2T8xpQxmy6RHDPg
         OgT1VLWZCmpcGeLLO9kIyI9/B9kCu+rqNR3KI7N3teqjRVK6T5aIvFVR8+UXc0yVu4DM
         DBRP5Lw7+oLvV8v6FhKhdm2ge8cK3Uow09X0noH8jODk1P8Uf2YFWge+Yn2RHSGyQSyK
         ckVgxYi9CfV2EXZikjZAnPrTk7IzkQP4VIMzhsxotQY+brUdG7rDWY6Vu/44CS+Ka3gX
         dxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWPoU9FI2AmvdWHRJaJvHxE5GUgCd3FGi5dYCnny0cHQx9m32aXvzkZKQbpRZXH1rfM9IbLt5ETGLiBqkVW@vger.kernel.org, AJvYcCWVEpAU3SylJ07WO6NrLiW4XPCK1eidsLrCE6P0CmInsPXIjU9hKa9KYg/90eIZP8cg8HV9b3pNOEK/uEn6@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhRGvTo3vJgDH0D0iSrs2PRypkV2byE9ipEuWsuFod9qv4WSi
	sYRcsx+LEVtpMOSHl3WtCV/jpm/wfEvA+WqBSn/SgPUZBBJZidCc
X-Gm-Gg: ASbGncvxkx2mEjylGybn/6r2p5APdG5MdUfD17uKaxyMEHV0qRg4BW2AxgV1mJ/L4lV
	pwsFuOc9TrJkkdPQXsWMZ21wPti/SUMzgO/yCWkNGNc/aKcR7MT5eFuGGJNJ2X7yzKvQKVNEQig
	S5UixZO/04hVzGW6b1VKwlDtnF+yiqRWcflWPaCBRVxcK1SmaGEYfQ/nF97jkWCDMVUIgI3o6YQ
	sngjmnsxno2gXxRXCGDNIO5X3LkA7uUAiFYhuJl/8RVvPZw+k/SKOZsxfQJNrq0S6/NSR4fjfVp
	075/TqDOsHm7sv5lWXmEGD/vq16aWZak/pg4Heg/11dcRcPSH6fSHipB9BdZUohsrMRpF9bzllu
	0BdzEybc6HKT4BsOyhdrCcqbt8SkMCzCUnqNF
X-Google-Smtp-Source: AGHT+IF37JM7RU82Eh4gVcJCG45SjQ0Om0e94uP1ly014l7G76cINVXkAqGEtv39Wzw2dlqIT/fmAA==
X-Received: by 2002:a17:902:da8b:b0:224:2717:7993 with SMTP id d9443c01a7336-231981c916emr61269365ad.45.1747245433151;
        Wed, 14 May 2025 10:57:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8273db4sm102829615ad.131.2025.05.14.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:12 -0700 (PDT)
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
Subject: [PATCH v4 28/40] drm/msm: rd dumping support for sparse
Date: Wed, 14 May 2025 10:53:42 -0700
Message-ID: <20250514175527.42488-29-robdclark@gmail.com>
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


