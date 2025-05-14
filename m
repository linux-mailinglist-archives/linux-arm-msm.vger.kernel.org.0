Return-Path: <linux-arm-msm+bounces-57938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623FAB73F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B8143AFBFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C8A297B66;
	Wed, 14 May 2025 17:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzZjyeQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692E297A60;
	Wed, 14 May 2025 17:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245451; cv=none; b=sGpvh+UVHPl0n7AJ1OScMaBHkNgvhm1ZpNcC0z8zUB1B5+5aBrbgjAekPQRsowOX2CXbg+Kg47zi1Fpf2yIunOg+GfkrA7FkneuNtP4bFT7KN9R8QjfQkS3YmDHdFyl6w+oLb4IMORMnGyvPpiCSKw0i024qPsrlQStHXG+gTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245451; c=relaxed/simple;
	bh=C9zlyB2KOAVgg++Lt92d9JRcxin5HlXVkR/UdSjceQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DocMnDeYI32ccEwsDRH97C1ekY7vKSHL8iJ3zzs6WtEEOoVuVcsblnoTbj8AgQzrHo3pKqtO+Jj6ZBm9zxhEKHfXS9/8WfZNractnemwI1o8PSqPgKJIpu1v46zLNJP1T6wF7ZzJTKUmE9jUh+Gw+sxpPZ8Qqc4fxcY3rElnGA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzZjyeQ+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74237a74f15so219019b3a.0;
        Wed, 14 May 2025 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245449; x=1747850249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
        b=CzZjyeQ+M5UwyoeLnqLQjUvSLWbH/OJRZmd+gONT/A9aSTUne/gxAWrfjyx6rXpdoW
         lOQJM5pgAuT50yR43KrvS0SyCt/Z2BkIqgoEKT2HCKpp8vUtIJujRVIfFk5hUN740EBX
         4Jg0mHuh8KPpZhhX5yfAMmsCiJJTRvBRJceVPgjFhaW4bm4IQK58QeJv1LPo8/qxAYjn
         w7rtGcxYkf3/QJHdjTWdP9x8r8W5XvQ2OIaJJbZHFmEc4GBqm936meG089Un/Q0OBtEj
         NxBmBeyb2cddo9GzBeHoxbLOhssvEsWyOiFlv9DlWi3Ll9Zt7V+oQIxv856r00QQiXgm
         deVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245449; x=1747850249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vZUP3yiYvnGJEGnZA5yTtXN5qfGZSR/tLPaaIrC1kY=;
        b=qbTgLouCM5goUfhh+DkzacvzQOZNBdL/2ql7DKkyVfDqw9EWC1TYombRsZclGxHD+7
         FAgtoU/S5c8ec/50kNFRbqJ0jmaYoCCCh2kPhnPApoL7s2EvvOIEtiOjy0jht3hwLYqs
         K5xiGVDaE652r9t7OnWwMLC82s+4PDKfkVrpNk2KAK3gA9++OMGrrsNMQsjVxSxusWbx
         qRQpriTH+6d/wlfVEzy0CFn26zqT9HPs3dXNsi6UT78BhTtS+7CvYFEmTKzEOIAXMWon
         wZBo4HZ4wDzKOsE2BhQvRjm//qhj1J9lTGzgMauuCh5xCAs9IT6SV8bwip6NQMyQ9O9g
         lYVA==
X-Forwarded-Encrypted: i=1; AJvYcCWUIl3sjMSlDNIFIfgMJrWYj+Xk/6POJwp0YvwKvD/gU36h9mP0A07/kMAekd53/E1dSFESRDYSp45E0QR4@vger.kernel.org, AJvYcCXPCVPfwie/DifK8FyRiNyhxgrCywIPnKUM+W1sC/sj6pRPYEHik6i8lqp4DVWz9gEXDfTJ4hBxpe+n7VDs@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAucOdpLDvQ8jA634KdrWGc41G1AlavZLkwGo+YU3I35JjGmW
	OO4K42fE9hq5RlC9dZsMUslS7i2ooNLTcu2NtSg/JeOqHjy6k4X9
X-Gm-Gg: ASbGncvzVqaTxF2rG/1knMorccoeBv6RSMZLDCJuEiD12SG8X3E3A8NDLiA7rowKe/v
	QPEzc2T7LO2CTv4OCzlo0VLrccZkj5nLLiomTZeFKqNXXAocnl4Sj3Qzr2ovlvRYI4hcIXKsxk7
	V5iP/bCmXvWn/xlskU0jZAIGDq8LCPOdLTpiJhg0hB10ogX0Xd6DS4RKtaZqh0DUdcbXxquTOiF
	2DhyjW0qH/WYrAL39EyzcNbP2YpNWJM4tjSetAzKw05afQHc+7lh+++5q6oLdSih7OShDBC4w3A
	I25BPtu9vB1jPzJJpvfyGqhszsd4BbfQfK1QJSlNDiKzr0gFdkqpzmzJbl7T+IiG4w3LDlIae2f
	EDc58h1g8Am6F1lQswzVItjV4sA==
X-Google-Smtp-Source: AGHT+IFAb6eTKRNfd7E/h3KyQK5OTZipPPfZzvdv53yXZDo69nHkzR5LlYArW5mqLE1u50vA4UVzdw==
X-Received: by 2002:a05:6a20:b40a:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-215ff11a54bmr6793511637.25.1747245449104;
        Wed, 14 May 2025 10:57:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237761e45sm9715747b3a.81.2025.05.14.10.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:28 -0700 (PDT)
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
Subject: [PATCH v4 38/40] drm/msm: Add mmu prealloc tracepoint
Date: Wed, 14 May 2025 10:53:52 -0700
Message-ID: <20250514175527.42488-39-robdclark@gmail.com>
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

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c     |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d..781bbe5540bd 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,20 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
 );
 
+TRACE_EVENT(msm_mmu_prealloc_cleanup,
+		TP_PROTO(u32 count, u32 remaining),
+		TP_ARGS(count, remaining),
+		TP_STRUCT__entry(
+			__field(u32, count)
+			__field(u32, remaining)
+			),
+		TP_fast_assign(
+			__entry->count = count;
+			__entry->remaining = remaining;
+			),
+		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d04837461c3d..b5d019093380 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
 #include "msm_drv.h"
+#include "msm_gpu_trace.h"
 #include "msm_mmu.h"
 
 struct msm_iommu {
@@ -346,6 +347,9 @@ msm_iommu_pagetable_prealloc_cleanup(struct msm_mmu *mmu, struct msm_mmu_preallo
 	struct kmem_cache *pt_cache = get_pt_cache(mmu);
 	uint32_t remaining_pt_count = p->count - p->ptr;
 
+	if (p->count > 0)
+		trace_msm_mmu_prealloc_cleanup(p->count, remaining_pt_count);
+
 	kmem_cache_free_bulk(pt_cache, remaining_pt_count, &p->pages[p->ptr]);
 	kvfree(p->pages);
 }
-- 
2.49.0


