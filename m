Return-Path: <linux-arm-msm+bounces-63025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90652AED0EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15933188C1F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E912264A61;
	Sun, 29 Jun 2025 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+fjg4A0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719A238151
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228238; cv=none; b=Ih22Z0HM6PMi4sIKuVga/1mwRPOTuNETO50A++6KR9Wffl9lSGTzxEGPoCUG7M0WoYBz3tjZgpsCm1Rhhml3n8PuN/Ln3/mMI5cxKAX9GC1WIFoMvwwEjc5b00xawyaDemytLraDUjO3NGH0USWehGLtWCLg3pThbbo/vKx2v5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228238; c=relaxed/simple;
	bh=DBDmWCiCFVgbl4WtBxHdzqbNhlAEm9jFk7Gr/5+tOIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLCuVuDx1MliNUKOznTfUJnSpVvL8xGYW448lc8MTdwfLaNM0+3ZEKlJEpRJeP77QcbHaH8lN5mgJ17BzBwZmb8X+gUE2Z2Qk6U1P1DB2SRN3IKyFgQE53Islu/RalIiPTOeU5DfVTEx8YJpi7rCduQpItM0gqhxBxm++AQK3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+fjg4A0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T5I8sw012920
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5mY0F5PMmU9
	vrS33+13h25TEJD4UxWJEsq72XU3xSVs=; b=P+fjg4A0RZe6REe3XrkoPcZmiE2
	OcTh9tv7DwGlIzx2RC8LdNJZNsqxuuMYRM+aL0FhYrNgxk6qJBt/FnSKIyqXQ+Bd
	WV1953yLX6NW39Ns9BklbuvSRNchtfwp9ndDR45xf1IVhb6hfyPgDDjjRgSSwxff
	1lU3Bn8F3aWOCRU+Ve7zQLtqyPJXXna72nx3aAVxiTqKD/KV92YrDibrcnLH6NiY
	DPBD2HMtL2BQi80rxpJYqotdJiaW+hmH7akgXgEflBwdjvTcbNyDY2/YjycPnmXY
	DvAcrfH947y2/u0VG1YZc7lqDtRxjKObMAPWDo/Pxe7dcArHpzlXJYMAwzw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2v1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:15 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so2701089b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228234; x=1751833034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mY0F5PMmU9vrS33+13h25TEJD4UxWJEsq72XU3xSVs=;
        b=LwnQTrkfBCrQ54YpnhBdhSd6mIoi00qYcqhXdhN3A0Z7iOkAWg3MqOyG3lN8EVtsVD
         Dm/+tfGvo+FflBy8Gz89vemCg0L5wZfRwFK1929M+U9ExB6sWG9J3f+VP5/T+JXYaIAv
         a3aiKmZ7El86nYu6Ke76Jb1yiV0R9b5YsK+hmawCwB1AVCksBhhlhOfrZOFDJ19F6HNQ
         vQNBQCOcy73nerLpG/eLrMCjpvN1HoCWufUzHoFMrfg1wJR0q6FIvwaKAseYmFUrjDH3
         AoC1fRx60VM7b/B/C59P3jJFb59NqTPFBiRml+hloK4HeKN66P/tWHbhZIXhkgHdkwJs
         BIDg==
X-Gm-Message-State: AOJu0YxOPvBHp/1ZWWND1ObXA3N36TFfnXb673bsXmLBp53fZG5ok2dU
	IZUk59swDSrVaO4tB5wnR/dRhg+2IaX9KJ/3gaWLR6b9VtGt4XyeUGOgrGphAr2jSJOWYe7CbfC
	JzZrUuJw3qu/sWPQt6WTUU88rTsyris/SL9+jg55QTvFFZ9wJnK5KyDPbmlqrYfh8uHgH
X-Gm-Gg: ASbGncvXMfEhnQXua3JD8sJz3g+PN3HZ0cZC3i3qaCMxQ4XtC0UmGEUMUITd9g0Wq+h
	qpXiErnVDiYJquSDVEp9cG7MOI0r+apZFefVDVxZwip6ga01Fk/KHVI/CZm4cRZTOdHguAgE+fJ
	oCyI8jthiLcEvMYgi7Wc9q5KdGKlgt0qC3v0F+aJjH1G41JwYbyk4uH9BkPO97QO3HYRu7AESV1
	IS6OfzZyTxTbfrtX9gmP1DVolNd8EUu5qY1daexE1ok95J6C0kSrmgihL4+elFpKzZQOi/wV1Pw
	/pxp1btziPSvXlSWdv/8FvuM144LrBmrPg==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id d2e1a72fcca58-74af70a825cmr16437206b3a.24.1751228233866;
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOpY4JD8XXzpeyT/cFkQnTv9hNBJBrOs2mriXfKg05KpBh8dREEFouJKKLOYU1fqTJGyyiJw==
X-Received: by 2002:a05:6a00:3cd5:b0:74a:f611:484 with SMTP id d2e1a72fcca58-74af70a825cmr16437173b3a.24.1751228233466;
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efae1sm7273234b3a.163.2025.06.29.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Sun, 29 Jun 2025 13:13:21 -0700
Message-ID: <20250629201530.25775-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JHUhWtsSjwC7aUvvpiENtbgCeX1MmpJF
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f4b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: JHUhWtsSjwC7aUvvpiENtbgCeX1MmpJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5r5q7M6L1LcG
 zEs3sWddYgvxcD2vMAcBfZk0wt2IEe93SYU315DMZWGnCcrbPKqA8WiETLEQtqOsi0LgvcF3xh3
 PpEa+4P+sFi5TCalC8aelqmxK7BL2Rjb4JzwGuu5ISWlb8gW/KqW+D8Q+gRA4Q+9OqmRGmr1S41
 HwmiYenVznzVNIIGEJnrSJl7E7wUeCD/bGyt9DIkh+qvbZWTlv7mOKZvCH4TKy0LZlq41E2r2VF
 nut1a2cftImu3mxaLiO7aIc4CLdaP1B6+noiapaUjaR+epK8Leu4XqYIFiGwbg6HZv/zhxo2n/c
 K14TfX8ZMSRIpTEW6EVOGkJJQodj/0fiMDibFIP49WDk1L5im8GczJW8szkO8PmlJeL4c1LPFXV
 FnenEKkUYlfsyNtHy7tRJLFR3cw2Q5+3UTry92KIosMYpH4fV16jlf+XNjySPfbhdPcgE/u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

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


