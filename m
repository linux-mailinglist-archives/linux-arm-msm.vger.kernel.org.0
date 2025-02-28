Return-Path: <linux-arm-msm+bounces-49886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12502A4A519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D064B3B9F85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0391C5485;
	Fri, 28 Feb 2025 21:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdgfvWBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63891BDA99;
	Fri, 28 Feb 2025 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740778292; cv=none; b=o8dHsTcMt8B2HHj2tLH06gq9JA8GAw1LyCt0x9RbvaeyMq6lDI1KrikIIknntQtL/44/Y4E/CNaFm6UGOvFlLWzrDENuxrsnJ9QhUx9DIyBS/oQpMA27DPOj1Chqqj1vOvOXIiolFEMZyWCbtMUv5vjC+DZFCXp4z5S4GqEmQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740778292; c=relaxed/simple;
	bh=HAcXscxXb0f6Phwv9IoUb80SSjaAHtPaE74v8uUfSkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUjR4/hADWaWZ2M3VW4bm075z1UyxsES60L/hwJ+vnLEkWq5EkUJF0h2SFcgzEPFDjVB4OxbytYVHzn+MQsEV1q4YfDpgnsFuoovhZZKzy+gNKpY9FF8CYS8eCGyZ2iG8B/B7N/NzYUdXZENiNegd4C/Ytzzw9LIKtxR37cHWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdgfvWBE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fe82414cf7so5118132a91.0;
        Fri, 28 Feb 2025 13:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740778290; x=1741383090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93u9FMaBovFoKZ6qB26R5Bei+BiF4xVMXoIYM5LNkow=;
        b=BdgfvWBEEZfr3O04j/iZz/aDpBA0880ZgosRd1qQHNgNBsAKXt/jp6eFqvUmlYjnUd
         rUlkxyHkR28L8wdHpCOtxr4aoQN6Jm+hBQH0lGb0kzrurnZfohBVRPTey7B+jYQTwDeW
         4RiT53mIXYeq/ACmPCS1rmJvx8JaSCRW3emJWBvxBK6KfbsJJFp/4K4FciImTgoU9fvW
         s4kS03ejYml4PQbEV6OK6kXzZ70lBwiQ97JpR5ONisUXs5EzQ4k1kqVjQS9SvvFcD8t8
         vWu8Dqe/K72Zdpg0WJQ8/tmJctTX9BIYTbY0yhLSkuifYzCqGMtlNYzbyIowrQl9BQjb
         I4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740778290; x=1741383090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93u9FMaBovFoKZ6qB26R5Bei+BiF4xVMXoIYM5LNkow=;
        b=h9GrxL1iqSM8Yt66iDtTcZRG2WgJqZyZqZbRuZshJh37BwXAcXGz/Ko20tmszHeQDJ
         Qd8/BINHI5yl0kI+oPYuynEgo4XybXNmJ9uZ58cXP8yPQsXC3U38hSoCr3j35mvVAWsc
         Sx0Dd+Ddl4mDGua2tElLzsGKkYFUuIan2UT5MhPYfvP4Nsx70QvPmg8/Ekov/gQum7Ly
         903Vtlu/+g7Tuis7glbnfueu1vsaDPX0Zloj5aTKIGwYOF1W2lgWAyE+3LaK5Q5JA4q9
         otITqDkzHAopgA2t//HDinYnWx6Z5jpusjHDkLWiK9b+S/CKrjbSJzbUURawI6BPp7DG
         Ed0A==
X-Forwarded-Encrypted: i=1; AJvYcCVqfAQhBTZQXfDu2dHl9MC1PM5cRqqCH3hJn6S5dDVHlKJVfaI/v+vpB3KslxO6lGD6qrW7E9x979+W9aXC@vger.kernel.org, AJvYcCXkuhyGvs75kCy+yv5/jNaMXRFoag3U0LlEvxJ4LhKXUgG3znYaKYifY9M5PoJM06So6rhTe/Xgd4YssTWL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9pDgCGDlhm1XI0XXqIv7YJID7eEI3cVplTAH+QmdcJe9AIBkX
	ury2aQVY68BV0gR/2tiiYTacUNm3sH4E/2eBToMNSV/uE9+LmMdv
X-Gm-Gg: ASbGncsRsh1U2ekbVK5ypCOhtqiA7KYgBsoZa6dAnnm9OlNn/+Wxip2eGKSLs18nrgX
	aF5QBMaPKlTpsP2Gm30NSIR893aqjoXabQHS6M9XFqFl/zw/TFL/XaXAKB8Ab4kjxFl8VPyV3/z
	bbuXHNOl9AGT1uoPhW1K5noRCS0qAvxSeT9/LtewW9FbgV+TMhkj7QjvI6Pc/Xs9r6XHV7ZSf9X
	hmvYVSiv/VXdBQEzq6q1CtHoIgaoHCEEpBOanb7rhLJkRMlTGmj7XjrTN9TtC6pZqsXqORTRImv
	V7e2neljHlfTeoYtqi/fUYFFfZmQljP/XutqZVAEdmEFEgr1nBf2Hz9rk8HacMOvT0GrXULUQPf
	6
X-Google-Smtp-Source: AGHT+IFIrARPSHoqgSXOC06UG9mDf7Pz3KJcb8i4kd5NHyX2D35P54N5Ad/Fqa37E2Gj9VBa53GQrw==
X-Received: by 2002:a17:90a:e703:b0:2fa:1851:a023 with SMTP id 98e67ed59e1d1-2febac06670mr7684454a91.35.1740778289973;
        Fri, 28 Feb 2025 13:31:29 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050f3c6sm37776505ad.210.2025.02.28.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 13:31:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Fix a6xx indexed-regs in devcoreduump
Date: Fri, 28 Feb 2025 13:31:24 -0800
Message-ID: <20250228213124.54213-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Somehow, possibly as a result of rebase gone badly, setting
nr_indexed_regs for pre-a650 a6xx devices lost the setting of
nr_indexed_regs, resulting in values getting snapshot, but omitted
from the devcoredump.

Fixes: e997ae5f45ca ("drm/msm/a6xx: Mostly implement A7xx gpu_state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a73613551493..b37ff7433072 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1507,6 +1507,8 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* Restore the size in the hardware */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
+
+	a6xx_state->nr_indexed_regs = count;
 }
 
 static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
-- 
2.48.1


