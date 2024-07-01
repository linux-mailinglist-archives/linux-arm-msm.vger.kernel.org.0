Return-Path: <linux-arm-msm+bounces-24849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DF91EA64
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 23:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5229C2820C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9B416CD28;
	Mon,  1 Jul 2024 21:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkRSBw4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665C4AEE0;
	Mon,  1 Jul 2024 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869540; cv=none; b=U51ifCncd/qN885B5oty5qx0XfMb+E1dY8fIob8gYc8PYWgBDNq8bnm9oyJ0AC9gkYP8XNVEtQbQ8Io+FkM0ebpZ9aNLaIRQjRI9fE9Ei1ft3phQR6jsOnrx0jLAAMOvy/94nVH1R01HidX1Eb+MPUrSMsM0zQvJ2Ues0Q1Fvsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869540; c=relaxed/simple;
	bh=UL/aII2Jt1lvOrPsGuVdH5YjejNJjEUaM7KueST9pU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XEzBb755tDebcZuu3hy4f98JuFWcLsNVxscRNjDSfgJ14cYAvNA30ANJF+HTlf8n0grn0ZwRDkzie2VctbI9/Tgo8ZynAY4n/HT1FI4rfpLbvieyoHJz3dmGB0ErM9lAJv1FVc32ISZgc3eXTWYDXEE36jvDCMvDH6LUreCe67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkRSBw4Q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fa0f143b85so24043785ad.3;
        Mon, 01 Jul 2024 14:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719869538; x=1720474338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bbLFnVEa+CU/qtvwaSGT47EN8FSAW/HwwbaQu0/5Hk=;
        b=WkRSBw4Q3MN5rXZkvfKKOxkoqZdMEoNujoumYdprkhpIXyZDeDGukjEdKzFURmc5ul
         U4tPZXWBRoPh7e9NIXx2cogUQYgQV43RHxdSYECP3qu0P/WGntr6NKw4h7EFkZyfTnZ8
         b3yR6WkL888ae3z5aMjvuPDnPkZ6PT30HwlJ5n+Mk4W7NaktRlTSx9u4Dk7UsrQnS2uq
         c6fNKZi4S+2INSN7wFy9FpGR9ttN9HI/gqatJePTYPDJl9UGidf18ViEBPD0A6O9dgRX
         P/VB7T8PgaOhfDK2y+aOtB5LbCTpZWAS7iZwRhQkBiDs7AgoYt1GBh1COrpvw0d9vHOy
         TqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719869538; x=1720474338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bbLFnVEa+CU/qtvwaSGT47EN8FSAW/HwwbaQu0/5Hk=;
        b=K/Pq1IQwBjqbiUjZXudwL75VtSaFf/qOahBV6ZFbJXZvyC1p1cXYX9A55vX0LUOap0
         ScQnc7Z+3xgbbzKRvfHPbKvSUnCTHPwsxP7V9LaFq+kNbA/g24v0iy0LouL8yHBtJd5f
         juDV6L07WlabSURCoiXWZcOhIFohlr7w28CvkP+LEnvF5SqKP4UUj5EVFzNcA2HnkJux
         d4XkHrMfInH8TmMeSMEdyDnDm68BCNjCCtijKQ8ZmxBVMaWaQR8GMQfRnSxY8r5edhUf
         kuO743Lj/1HibwUZzbNgguYnPv9j2SsbV2/l5Qq18KmSwG12LGz2VcWNJN9UqnKiaZLu
         nIUg==
X-Forwarded-Encrypted: i=1; AJvYcCUxbgG3GsPGsz0Mf1Qu+/brUb/zzpV47btHsa/PDtA1UJFkWDOptm2ucLnLkWf39tHym15lsue20/3KNlTGu7R4W8+NISjSbYHL6BLu8h7CocD8hB7mMfvdmf3ZHS5JQ3py8xKomq8zfdBWOQ==
X-Gm-Message-State: AOJu0YzmDw52ewa6yeUdRTUr/1cslqEnF89E211CuylNGD54F5vNEtDf
	+e1zezovNOWpb4pM0gv5ETfpbpNrZP0xmZAV4+iS/LBZSARmKjf8
X-Google-Smtp-Source: AGHT+IHIcAexP3OqxwduJL8FgnJI5xa1a0FyP/85oM+2PKJHJfsk0x8k1VLccITLOZ7HkF3Vk/7K2Q==
X-Received: by 2002:a17:902:c402:b0:1f9:db1e:ef9d with SMTP id d9443c01a7336-1fadbcf45e5mr52066355ad.49.1719869538138;
        Mon, 01 Jul 2024 14:32:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1568de4sm69750415ad.199.2024.07.01.14.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 14:32:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gem: Add missing rcu_dereference()
Date: Mon,  1 Jul 2024 14:32:14 -0700
Message-ID: <20240701213215.433101-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Fixes a sparse "different address spaces" error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406280050.syeEwLTE-lkp@intel.com/
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ddc6a131c041..ebc9ba66efb8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -48,7 +48,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 	uint64_t ctx_mem = atomic64_add_return(size, &ctx->ctx_mem);
 
 	rcu_read_lock(); /* Locks file->pid! */
-	trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), ctx_mem);
 	rcu_read_unlock();
 
 }
-- 
2.45.2


