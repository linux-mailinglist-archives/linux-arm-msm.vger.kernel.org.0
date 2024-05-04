Return-Path: <linux-arm-msm+bounces-19215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE58BBD19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 18:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97E371C20C66
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77113F9D2;
	Sat,  4 May 2024 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihz00wg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7511D52D;
	Sat,  4 May 2024 16:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840283; cv=none; b=mnrePjC5/ecajWN0jAmVvKL1ak6nOITGdz8H7aNasnpGgMGC638w7qBGAeVMi3PCuNrHRyU7u1cs+6uwqWRASk0SReqHGYfHOt8WOliA9P3lCqe5LQ2G8TokNW6AmIAcBgW6gW3FQBZHyhqG86e0O8HJscmMAc3lLB+/T27mFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840283; c=relaxed/simple;
	bh=kzZY9lGQpdtSb8LBt6oSjwlOz7umExQkGa/hvChrAq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INsLOEqGlwIU6o4Pep14JJs4ZH0DmNyh1wGhS6mwzUxpHj+NUYD6BN7ldv9nIyhFofoQ+/CPUGfjbCpnfVBpLOxLtXKTxC1kJ+U/RNHVjX6pLJKRRNt62JerPY2zjOg+S9rcf+7VvG8zhMArAldDjEmSZhDMwZsvCp+J51UJb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihz00wg0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso4835175ad.0;
        Sat, 04 May 2024 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714840282; x=1715445082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVHkSDrp78uKW0uZrcyHhFLD98BFVYL6QDF1S7ek4Xk=;
        b=ihz00wg0QF51IunlMa6GXXRhK7bvexHyTVCAGS7sH7TaVJlQOSak8YqJHQoep1DHeV
         aSKPEZzerT1lb13HYrlr5MLLTQXByFB4p3kvu1tcHsO4PFXzC2zmElnymn1H/feo+v1V
         i/+Y788Pfee315UUZKV7X/V3fg9iXS/Oa6b8kgEwVs805xDP7D5uxSA8/7Rk7X8JKjPE
         aT/etabnnM2SDThLpOlp6KYeeBhbyVigBgD9lFAh7Xerlzk3MjDnsyDsFGoWgTWyiPpE
         Nst4jFInRz20UjFiv2ZBIzJmryYH7P+vjUlKR/5e4zs9rYO2ZMWa0NxBN1c1oqe4/Eyy
         zw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714840282; x=1715445082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVHkSDrp78uKW0uZrcyHhFLD98BFVYL6QDF1S7ek4Xk=;
        b=p+d7erpo7r6gK6xcvTkCOLMQNpAnTicIIGTcnnBOeoThIBvCAFq1RHSqwQg6z/6EsE
         oU4g58RSnUiVphnHItlwQ2/ztgYKiEXxhWkyiMWV4pWYmAHv8D9eT2HyJNzfEWE+G/dT
         CzY7NEFn/WDFd9e5rArH76zMniV6k0NWc0Rzl7hExjYnTWO0eylM71ZQr3uFPGLxBrYo
         lBHQO/5T3eurTYTaOT4frSjl0BMjIpUqZHQ692WSKdBOnMPgVvddYe5fbPu3SqT4KpGk
         EXDImMN3+Rv29BRRLbw87XClkz5NgzsNJVkPXdeLBm+J87R40A53ptnPkVnEbLxOYPlL
         InfA==
X-Forwarded-Encrypted: i=1; AJvYcCUMnytd8mcj2m7WBCXf/2vlNp1eHs42hPBoa+eQgF0xdqb0tRoNwmsUCXQwROYnL1VhY6i+B/YDGyBzZG4QG7Qba/BrTBbzH8z/u7kd
X-Gm-Message-State: AOJu0YwK0hvdMJq7njEm8qA8AqkRlfAafZnWzJO8Z8WAIq2/y0S1acIW
	fE3rPWMS/iBS0S3q6JGhfe2o0JgATGRxNX8Jh9rQYnB65elE5POFMMYO/Q==
X-Google-Smtp-Source: AGHT+IHArHsW3DCfdQpbK2KIyCCirt6QvRblSevbGPQPn2t4LZFf5iduw2DZMI57WDH//nxVT0o+7A==
X-Received: by 2002:a17:902:f649:b0:1e2:bf94:487 with SMTP id m9-20020a170902f64900b001e2bf940487mr7668589plg.57.1714840281493;
        Sat, 04 May 2024 09:31:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001ec4ed47ddesm5274490plb.86.2024.05.04.09.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 09:31:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Cleanup indexed regs const'ness
Date: Sat,  4 May 2024 09:31:13 -0700
Message-ID: <20240504163114.639228-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

These tables were made non-const in commit 3cba4a2cdff3 ("drm/msm/a6xx:
Update ROQ size in coredump") in order to avoid powering up the GPU when
reading back a devcoredump.  Instead let's just stash the count that is
potentially read from hw in struct a6xx_gpu_state_obj, and make the
tables const again.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 15 +++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h |  8 ++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 77146d30bcaa..0a7717a4fc2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -24,6 +24,7 @@
 struct a6xx_gpu_state_obj {
 	const void *handle;
 	u32 *data;
+	u32 count;	/* optional, used when count potentially read from hw */
 };
 
 struct a6xx_gpu_state {
@@ -1437,16 +1438,18 @@ static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu)
 /* Read a block of data from an indexed register pair */
 static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
-		struct a6xx_indexed_registers *indexed,
+		const struct a6xx_indexed_registers *indexed,
 		struct a6xx_gpu_state_obj *obj)
 {
+	u32 count = indexed->count;
 	int i;
 
 	obj->handle = (const void *) indexed;
 	if (indexed->count_fn)
-		indexed->count = indexed->count_fn(gpu);
+		count = indexed->count_fn(gpu);
 
-	obj->data = state_kcalloc(a6xx_state, indexed->count, sizeof(u32));
+	obj->data = state_kcalloc(a6xx_state, count, sizeof(u32));
+	obj->count = count;
 	if (!obj->data)
 		return;
 
@@ -1454,7 +1457,7 @@ static void a6xx_get_indexed_regs(struct msm_gpu *gpu,
 	gpu_write(gpu, indexed->addr, 0);
 
 	/* Read the data - each read increments the internal address by 1 */
-	for (i = 0; i < indexed->count; i++)
+	for (i = 0; i < count; i++)
 		obj->data[i] = gpu_read(gpu, indexed->data);
 }
 
@@ -1890,9 +1893,9 @@ static void a6xx_show_indexed_regs(struct a6xx_gpu_state_obj *obj,
 		return;
 
 	print_name(p, "  - regs-name: ", indexed->name);
-	drm_printf(p, "    dwords: %d\n", indexed->count);
+	drm_printf(p, "    dwords: %d\n", obj->count);
 
-	print_ascii85(p, indexed->count << 2, obj->data);
+	print_ascii85(p, obj->count << 2, obj->data);
 }
 
 static void a6xx_show_debugbus_block(const struct a6xx_debugbus_block *block,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 3b1ba514e8ee..dd4c28a8d923 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -397,7 +397,7 @@ struct a6xx_indexed_registers {
 	u32 (*count_fn)(struct msm_gpu *gpu);
 };
 
-static struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
+static const struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -408,7 +408,7 @@ static struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
-static struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
+static const struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
@@ -433,12 +433,12 @@ static struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
 };
 
-static struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
+static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
 	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
-static struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
+static const struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
 	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
 	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
-- 
2.44.0


