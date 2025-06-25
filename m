Return-Path: <linux-arm-msm+bounces-62550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0654AE8DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638193BD83A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CF42FCE17;
	Wed, 25 Jun 2025 18:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9T/rjxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE6D2FC015
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877964; cv=none; b=WZLKQlvjbQBItXd7rmWl3rvm/xAO/UnA84PTu4D7qjyxJ4MHzkGr8ZOwvVkPYNw/b5tYo4seAVyBYJPf6wxzA/hF7RyAQWoC8ROTSvbJIHBEvkr0wf6KrlEzzNH/kMocpbkn9fBfCajW612YT+8yhPZR+EMHKRGWYp4dfLJy3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877964; c=relaxed/simple;
	bh=szvV6IrMopmr+OBL9gQagLLcUjdP+1eIVq6kpBn3t2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KG3CgE0LprE29so1m9u+DfY4TkDNH39zh8n3LFRV5nJpJDRfdQZxFydNfPQdTtXyyDrLi4AKhcewrXp/JEho6pVNANBXz4KUcPoegHo0oy2JylDN8pu2NgCFMhEyoFHcmoJtgxqircPrc3hoivYVXxVZ2RecP/xxWJ+kZbAvSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9T/rjxq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHghYk021624
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
	EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=P9T/rjxqUMR6cavrz/lgkUrhCUz
	DN/OtrtklgG5Gq0r+xNFu9IswxkwPWlCs91mPtSma44UBle2uz99UVmUUpSHe12V
	flHGUKwYppSBSdFnKRLuH0YZ9R7mhVDenTwCFWevlMs2/Vsr85weCyBJ4pgY1gEw
	T2McfsXeoFvGmOOA+joewFvy1Ugm2tM1nX5H0AE+ISfC2W4gYygccRv/Syxs2RAF
	nO7K9S8zCqDNcuPQWz2T/O/sChmouMuihU9wL2jnpAqgCZav3GYovZB6JK7Dq0ZW
	NKsp+It9Hr/Wi4AhhdX6q+OAGLk9B4I0DqCbXdRDLdK7ILkAVihylboiLWg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ae13e99d6so277274b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877960; x=1751482760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
        b=GfgAPWyMQm+2vhkuw7n5xqoBabg5P7TIp7K4C4hUGqNVeJBtOxHTJtftYwWlAM3NIf
         dwQWjvHCwVTN2TkoPw20f/fXyMBo8frlWGoRgCx54QJBES60R8RyxGyO8mUzt1SP039d
         KmG76aJ2UdDXbRsyLE9CIaDaCkFGO12fV+5QupONCmRkAFBWKgmr4wmKfj07uT2Sn4xb
         xqGkDc28WdvJYJmYuFMk6uAa1oivJ0V64JsyNq6dRXJxPyC2oVhQWeztmrViWnVZ4CyP
         VpD1bqOuAsRfdoF3caFfZVkS7l37z7G2Fhp226bjeyn7XpEqOA13PH1j6Q90khUaPx9E
         yECg==
X-Gm-Message-State: AOJu0YyVyzY6hjUFOtgqtFo1sAt4iAx6py8Xu+5RnGANOnW70ivXMVDa
	rGV9NcvIWJ9GeNpdjyRmvF9tNAe+7wX9J1Azu9izKTQeuIz8ndsugTSRiEFkngCGkXaeJ41k+Jw
	O+h293NZWMLUg472i1qb2s9AURvE54DxfsyTE5uZmq5V5sz6Gh6dB24KoE0k4AqRhRR3e
X-Gm-Gg: ASbGnct7kTgkCcrep9bTRYz9f4IB2wzfZtv7CLkGONVzJh6hyNnsPgxDxS+vCwSue7J
	UxY1BjMOBs26ixHLy4mGIYQXJzY7K7E9MoBfC0WHPt2R0P78dQSib0xiuEgwlfgUCEzc+5R8++j
	C0Cn4n8W9eMm1fmpGcKA/dgZRJtCWz+MaGg/ikYjTf7BnuEbzRsM88pPNRYvvnN0zcgZXPUoJCs
	L73vpXiNIBL1aKjFqPx2+Ze108vudHQDqNQ0zLhiJBzjdA9RBjkpNeuLOyOA70jp9LfYa/ye6ly
	v2t8jwE799rg7bXkH4KL+9OW5+w4u1L8
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2208d116316mr884056637.11.1750877959822;
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmJ+IhD7XkltkNbiUYif6D9uQ/Gi11DQoaOwAXBuNqubE9zV+mGLMYWUUTXdmancoD07qNUA==
X-Received: by 2002:a05:6a21:790:b0:1f3:31fe:c1da with SMTP id adf61e73a8af0-2208d116316mr884031637.11.1750877959453;
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f126a7bbsm13319342a12.69.2025.06.25.11.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 38/42] drm/msm: Add mmu prealloc tracepoint
Date: Wed, 25 Jun 2025 11:47:31 -0700
Message-ID: <20250625184918.124608-39-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c4709 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX+YPJWzrLbYX1
 +BcNIfdfXByCm6Er/ABEaSViLWxEjfE+UWXxKSLNaKSnAg62hfd2bvmPoy6PalZ+38H8yVPv1Ch
 KiNH5bbOIuZRiG02bh0oE6YruwN9TSs5VXpuBVLc+fy05P1LSnrXU+haEBlk0zMVHWdpPL7Ccjf
 n6tHQMynLVSJz5wgCnAIZd+1TEKO7PogAxpFZ+ObjGHK9L6yzzjntF5VkyHS+tgnrYK6x1Nc8N7
 Vz2gcYOtd/oCrbofyEJcOeOsFSkpjBx9j/K7QITPFJbKI7Crkyo9xQTaugjJwmybF3x1TAZj9eP
 +b6NSx/5CBd4Ojoo5GZqec6WKSizacJ+qeI2okWuj2b3yVHs0qVRR0oVLTkm61O1M3n3rckdhDV
 4dIhHuyTpovvyxljbf3tpiZAlLG4sO+1iuT2zkbuglsBXchy3oxtNfkYJvYApVRzXUXFBnWt
X-Proofpoint-ORIG-GUID: ktVkjVxyKNFMiFTDbknhXuBOhqwytEbB
X-Proofpoint-GUID: ktVkjVxyKNFMiFTDbknhXuBOhqwytEbB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

So we can monitor how many pages are getting preallocated vs how many
get used.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
index bfee3e0dcb23..09fd99ac06f6 100644
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


