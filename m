Return-Path: <linux-arm-msm+bounces-62967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C814AAECDA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B69C63AD96E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4776D24A04F;
	Sun, 29 Jun 2025 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QtR1bxDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371122A817
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206100; cv=none; b=UOYgtyeQTreI5Bl07A6kMW5NDz6DpSOPSBwSLwF+JhD80NLF2PlGvihU6pzHp1I1DsGLg7agVNXci9vg6MC3TyYDTFjcJpGun0NfiC3WfQWYxIPAYpg1H+elq7pArAMeUTUCZ/xXHd/9BxdKcw0tEvZNnO83lE435AsbXwtgHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206100; c=relaxed/simple;
	bh=DBDmWCiCFVgbl4WtBxHdzqbNhlAEm9jFk7Gr/5+tOIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9N5PKNIiwz5J0uaD+TbIm80X9nDy6ESlIm+3XEHrnSiHz4MBbHaiIlX3QfPu22eFmGrDeaCF2W/RPlS5Vk1wX2jBjnWRaHk6R7auWk5kfO/y2nJGPMazmaiGOfphYm/m89zb74aGMZ6JCmgwroYiPSdE9gpoQ1v3gFybn97JCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QtR1bxDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAqTYc028074
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
	vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=QtR1bxDXoq1dpVHguN0qwtmvC4Y
	0xC18TAnzct4aipM6HUb94TLMrrCAKsP60bZJFPIsgOe2s0DgsONMSWzseKdGXgn
	twCKv1gfnAGO3FObyCtuEdEhGDD+ulXJn+iMNSaCZW1QNygoMfx5w6yaj5gBNIQp
	LkBJDFS5H1Hac4sYN2Bt2aEpUrQVKMH5LQYw/mqxQ85l7wj6hDTZKAwJhsz9u46I
	pG/Vx2U6r4U3p9LSsIZXgKYHsXkItu72ynwuONtWSrmBnp0HkBjY7cVa4VzWpGPS
	MPOvBWqwCa6qvpJoyf6fdYRRFR+Pz2Z96JIenGdByZyT4PCqjrsFILRe9Cg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a61f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso5473756b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206096; x=1751810896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
        b=GZatIwIFqhHWDBpENfxV98LqRHSRYM11sXNfIagREMwAjun00UhjS6rIaqyeF0dBDG
         5K9Ab2S6EpvakbrmBfJRSvPDcPpahykHX/9PpD0k6pOy8voABFZe5OShSwhg+90q4cG0
         HZZXndSeZ2A0oVMEQIDuew6D50qQz0YSxT5ajj81I3GNlNI48p274plxjMifroJwnLxF
         SLCk9buKw33YqXnal9dTvu3dgAQHMaDG7Q2qCnzGMgDVoskq2LSjZOnVYR1zxA8V6+aP
         OppIYco+mWDO/hIeMLWCM42JswWLCNZVFZZi23VO+L+yf0S4M3CHv090gAU6Uj1vBQzE
         N+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXBQTOx5qZT0U1fenIMyN0QZTIrnr7FymjzgTodsRB0+IORQh21B+95Qz9+xNRbx7q2mPvLWwDIi7AN8BXp@vger.kernel.org
X-Gm-Message-State: AOJu0YwReUM4KLLS3Du3oIaJB8npbhZ+rrp6RwBwTKhdor9BzeXo5P2O
	CPpFy1gpOwKzp6vQErvGgYYWqVZlYuK7IsLBuf9UQaMCVhDdfvUstNYV0IBqKnb+vJhSPaBK8Lj
	7JDtkmCUtOS6DBpfuOPM4yfdMDDTMsQaOA95FGG8PkD9gtckaHQcjKYiW6zCzMRHrGUpr
X-Gm-Gg: ASbGncvNAmGBIFg8d12wWwzXoiM9qD/FJrcbJKbrpDgMrcRAi5RraVkBXUgRjCzGCnC
	iQoH5NdENJIr/Z/LhEcavQd1CGO6jQ2qGAIJjyQ5nCFhxc2a+CXdEhA1gL0oqbv8uT2RSSRmmXL
	b7iMGwbEFjNLTaLPzP/TynbhplutBm4bRKy5PLOfTYKq+4azGC27yCKqp/q6M9gzSvbyAO/HYR3
	pAaYqxv8h+VkQ241Ql1xsowDsoHKm7//YEHkY+I8bZpK4MOIv3JK8KIlZwc4B8WDytiuBevJuyd
	3qvFyvLh3xje3H7IVFwg45L2/Od0J4FF
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-220a18343cdmr17849600637.31.1751206095924;
        Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfYDkWzgCDdpgGyHKdq4vr6VIPmal4jKOqqpi3gamCdrIPmrcPzY2NWoSmG5zIgIYn9cnZRA==
X-Received: by 2002:a05:6a21:6b0f:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-220a18343cdmr17849557637.31.1751206095533;
        Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541c369sm6676309b3a.42.2025.06.29.07.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:15 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 07:03:41 -0700
Message-ID: <20250629140537.30850-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686148d1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: luwvIHCic10m_fQqmq5H4msuGuD8HT2h
X-Proofpoint-GUID: luwvIHCic10m_fQqmq5H4msuGuD8HT2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX2shY7dRr05Ej
 ye5DqnE80oRraO7OqNkmYB6Ek9T5S39JumdulxAEhsl/ejEpZk9xjTDASKWE0wHG110oneL+IWa
 ea7gIzaLZwFYh3gGQxNr/7RjUNL6zJp/DhFL2SNaGKFbJNWRFbthUpjAEYYdalHqz0T1UARziS0
 9ulbkPjG7YaPkaqib97aIZJvHy1mAyEHjJFx2/DvzadCVTXlJDTSThdgTNuHAFCNgRq1boShNEw
 Mx3EkeF0P/hY3q5uu1QKpe8q+h8YJTfgQs7q4ns6DRgU9flr9/qxVE7IEU22pQEX/yDxKY3ywYC
 nfSFNcp0Gwir8qP4xgX9+qPcr3alqHuBSgAJtC+MKEqlWnCIhyH0J6Ua+zZrs52kBPV41L6elVs
 bkT9TcK3OCUGugPYOh0aSNW9pKvT8XjdJ2LLsp5G7P2n3U+RQZ6Z6JMRIIJFMRmm7I37s7Oi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
index 887c9023f8a2..55c29f49b788 100644
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
2.50.0


