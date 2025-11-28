Return-Path: <linux-arm-msm+bounces-83803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71386C92C7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 18:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 88A874E347A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 17:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E029532ED49;
	Fri, 28 Nov 2025 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mie8/qVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9949F3090FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764350304; cv=none; b=WvqnzPVfv/KwGkz3gxPGsMGsoTkXUmTTjFXcaEZxFo4+pMfSu8Y5hbxLGrrdyyr8gUPEqKk/cGIB4zvtMosLWMjgFJqce6K+R2YnSmCy7GGbtzcZML265szU6Llq3b3YEQ+jKDqjVVchQExG8ymuRpuZZAbimh7mHDjqmyaopAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764350304; c=relaxed/simple;
	bh=qSMDgAab8niEa7uXA8/JyMRbEm4G4q6XD1/VjNo6mzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qBsmuPgFPayuYQS75pysjN0s6sv04tqEByXhySHsGA1nmdjVfC56UrSQqxRFdV7QohSMaDCBB7V7O9S87KdFuPov7gtwyu5eMieOMCSx0EDRuiBY+JZdoH0ZpWbbdfU7gG722aAMNzSUYvLSrVCv3N0BSwTssMw0VuDw3awMjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mie8/qVm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b770f4accc0so142591466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764350299; x=1764955099; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJQwfOIw2qQpgiHTYzvOGMNFZV2HUBa/BfEUHAS1g30=;
        b=mie8/qVm7GZTNlXrWjW7S9fsYxpm+NRxImyppNe8MqFXpG8I/6ycJnUfujWYQD77Jh
         Ni2l4QjwRZgaUnD3uptBZUb2LKtOvX9UTH1dnGLlLwTf+rUfcnLHIkL5ePYpM/b3yBJg
         9PRLUi53q2t+59ffo/GTQfpLE39EgmHKjFQVgWVt/RhrQmtK0309l0aSe26Sw6YwwUxv
         I0x5j7op8+QReRCtzj2rZS8P9+n+tES9hfLC9ol8blSDWl8QQ6qLtcvvE0xLPQCgcGkl
         AhAs1MK7lj34Yl8dE77EoPKzcg2helSy1z/HI/GPDU+J+mZK0lxTDB+A3F3fFqPpzpMc
         7uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764350299; x=1764955099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJQwfOIw2qQpgiHTYzvOGMNFZV2HUBa/BfEUHAS1g30=;
        b=xUJk/YAp5W1thNICc7//VVqWSHtwFo2bWZBFXsRd2wbYIaZFliwBgJP/DzsV70oIS1
         1c1/iky4iYJ9pET7z4/7KXmnQ4V4gTmqRLYmabDqGs3nV965zHp0wUVZhPzTMqI6EBMn
         65Op8ULhyEByqT4GCAUuETWL1JmHNK/iRO/IkAeQOuu7KS0zhJx9ycrWHk9GSryneMcB
         MfTn7Tpai1uY30mDsZuG70JG2iwvo8ZM1L5tN1tpGQrHiRyuUpyh+2n24rqaEeb10Gy/
         6QI9Bohw6pnZ9Z+/T4XIwqi0ggp4reWYU0cN1GHhVBsgKvIF0GvZlo3UglAmPB4b0rbu
         YTeg==
X-Gm-Message-State: AOJu0YyyJWoVjot9iJTKBHQ3kjuvJvllT2iEM9VKfGX4CM6k1g5uw63R
	agQoPn5wawe3bT5x8Oqz8z6J2uW0JY3FJ+XnXUi4ooXmM1HjMVGb5lA=
X-Gm-Gg: ASbGncvnDKcHGkrSIGiKPtCfTg8JMkpA6x2ylDa0i6HaIMg8XBSUj/WSRnRiSGUBRMZ
	GRstOQGFSca52xbp+WrYJYRKtKUvFx2IixmXVLJLPveh/3t3fGXVEqJhs7aFIIREgyMwBH5zK0H
	3DHIBBXr6Boa8LXvQLYKGasYjE9id+PIsfUWcSMvI9+lzDS0DkLZK7oBC6zQXCH3S5yVqHgK+vp
	kXBRKWcLv7+Q6w6nl/od3BPde62MSh7PMGskCJEEo/z36oPqQ3e0SQ/5O7BLzQsQizCmFTiKyYx
	78cA1FcYnA1eypsk6qZv6KsxhZkUgohtWXBSjVEvKOUy3Bc4YjT5WOsg5xpiB6GQXa8o5/OxTlY
	NlpMG2NcSQkqP9coU3WUEkkAunX8L1R9gCZXdIgF5ZPHw6bWeRYVB1A56oJsqKOBy6n3JWcPq7z
	exlaDRQnq6fkb/0F8QPdL07IVAFzDUBRhSnb6t1bhj7VUc5I/uTAtRx6Fn2vciBRJNDu6i1Eo=
X-Google-Smtp-Source: AGHT+IGMb2CAJXzm7R7ZYxSu0VKeZ+ZE/F03jrlS6C47GGzI0dctfnwYd5RO36R52sY8BYB1vKXY+g==
X-Received: by 2002:a17:907:801:b0:b73:7de4:dfdb with SMTP id a640c23a62f3a-b76c5515010mr1501580566b.37.1764350298291;
        Fri, 28 Nov 2025 09:18:18 -0800 (PST)
Received: from [192.168.1.17] (host-79-36-164-91.retail.telecomitalia.it. [79.36.164.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162093sm509465066b.2.2025.11.28.09.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:18:17 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 28 Nov 2025 18:17:28 +0100
Subject: [PATCH v2] drm/msm: Fix a7xx per pipe register programming
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-gras_nc_mode_fix-v2-1-634cda7b810f@gmail.com>
X-B4-Tracking: v=1; b=H4sIACjZKWkC/2WNQQrCMBBFr1JmbSQTmxRdeQ8pIaSTdMA2kkhRS
 u9uLLhy+R7891colJkKXJoVMi1cOM0V1KEBP7o5kuChMiipNKIyImZX7OztlAaygV+iU6ol0tK
 40xnq7JGp6j156yuPXJ4pv/eHBb/2F+v+YwsKFNpLHwyaVmK4xsnx/ejTBP22bR+MHLPwsAAAA
 A==
X-Change-ID: 20251126-gras_nc_mode_fix-7224ee506a39
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764350296; l=7753;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=qSMDgAab8niEa7uXA8/JyMRbEm4G4q6XD1/VjNo6mzM=;
 b=T23Rwt648GTVB5YRJanV0yDkpqQX+VDqWRFRQ92FRrpdINbCDnsVnFd9OEz6+pj9nnS5aw8x+
 KpSbq+SP5RzA4aaxGasbztjY6qk3Kg28G5Rv55eY27+65W6w647PBqk
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
but it needs to be programmed for both.

Program both pipes in hw_init and introducea separate reglist for it in
order to add this register to the dynamic reglist which supports
restoring registers per pipe.

Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
Cc: stable@vger.kernel.org
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Added missing Cc: stable to commit
- Added pipe_regs to all 7xx gens
- Null check pipe_regs in a7xx_patch_pwrup_reglist
- Added parentheses around bitwise and in a7xx_patch_pwrup_reglist
- Use A7XX_PIPE_{BR, BV, NONE} enum values
- Link to v1: https://lore.kernel.org/r/20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 12 ++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 34 +++++++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 ++++++++++++
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..10732062d681 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A6XX_RB_NC_MODE_CNTL,
 	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
-	REG_A7XX_GRAS_NC_MODE_CNTL,
 	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
 	REG_A6XX_UCHE_GBIF_GX_CONFIG,
 	REG_A6XX_UCHE_CLIENT_PF,
@@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
 
 DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
 
+static const struct adreno_reglist_pipe a7xx_reglist_pipe_regs[] = {
+	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
+};
+
+DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_reglist_pipe);
+
 static const struct adreno_info a7xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
@@ -1491,6 +1496,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a730_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_cgc_mode = 0x00020000,
 		},
@@ -1513,6 +1519,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
@@ -1548,6 +1555,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
@@ -1590,6 +1598,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.ifpc_reglist = &a750_ifpc_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
@@ -1623,6 +1632,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
 			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.pipe_reglist = &a7xx_reglist_pipe,
 			.gbif_cx = a640_gbif,
 			.gmu_chipid = 0x70f0000,
 			.gmu_cgc_mode = 0x00020222,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0200a7e71cdf..422ce4c97f70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -849,9 +849,16 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
-	if (adreno_is_a7xx(adreno_gpu))
-		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
-			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+	if (adreno_is_a7xx(adreno_gpu)) {
+		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
+				  FIELD_PREP(GENMASK(8, 5), hbb_lo));
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
+	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  min_acc_len_64b << 23 | hbb_lo << 21);
@@ -865,9 +872,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	const struct adreno_reglist_list *reglist;
+	const struct adreno_reglist_pipe_list *pipe_reglist;
 	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
 	struct cpu_gpu_lock *lock = ptr;
 	u32 *dest = (u32 *)&lock->regs[0];
+	u32 pipe_reglist_count = 0;
 	int i;
 
 	lock->gpu_req = lock->cpu_req = lock->turn = 0;
@@ -907,7 +916,24 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
 	 * stored as number for triplets in dynamic_list_len.
 	 */
-	lock->dynamic_list_len = 0;
+	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
+	if (pipe_reglist) {
+		for (u32 pipe_id = A7XX_PIPE_BR; pipe_id <= A7XX_PIPE_BV; pipe_id++) {
+			gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+				  A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id));
+			for (i = 0; i < pipe_reglist->count; i++) {
+				if ((pipe_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
+					continue;
+				*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
+				*dest++ = pipe_reglist->regs[i].offset;
+				*dest++ = gpu_read(gpu, pipe_reglist->regs[i].offset);
+				pipe_reglist_count++;
+			}
+		}
+		gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST,
+			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(A7XX_PIPE_NONE));
+	}
+	lock->dynamic_list_len = pipe_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6820216ec5fc..0a1d6acbc638 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -46,6 +46,7 @@ struct a6xx_info {
 	const struct adreno_protect *protect;
 	const struct adreno_reglist_list *pwrup_reglist;
 	const struct adreno_reglist_list *ifpc_reglist;
+	const struct adreno_reglist_pipe_list *pipe_reglist;
 	const struct adreno_reglist *gbif_cx;
 	const struct adreno_reglist_pipe *nonctxt_reglist;
 	u32 max_slices;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0f8d3de97636..1d0145f8b3ec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -188,6 +188,19 @@ static const struct adreno_reglist_list name = {		\
 	.count = ARRAY_SIZE(name ## _regs),		\
 };
 
+struct adreno_reglist_pipe_list {
+	/** @reg: List of register **/
+	const struct adreno_reglist_pipe *regs;
+	/** @count: Number of registers in the list **/
+	u32 count;
+};
+
+#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)	\
+static const struct adreno_reglist_pipe_list name = {		\
+	.regs = name ## _regs,				\
+	.count = ARRAY_SIZE(name ## _regs),		\
+};
+
 struct adreno_gpu {
 	struct msm_gpu base;
 	const struct adreno_info *info;

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-gras_nc_mode_fix-7224ee506a39

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


