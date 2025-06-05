Return-Path: <linux-arm-msm+bounces-60411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA47ACF746
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1479188760A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA4B289E1C;
	Thu,  5 Jun 2025 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhVw0kSf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD751289E04
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148436; cv=none; b=BI9I8vAT/nDNpoMdFdTO0cq+0Q/8QEwCrIk5+iJmHl+w3gpdC92EtpnOyTWUiQB2K8/GPqodwvqRDShuNsqeP/J5wmlnI//bEa+EAuKOiP0d1ifyf9KWmnoC0bvwmS78B+vlXfvvm0ZW22NFd+vAfP2pEyq24w/i4u25lY7TvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148436; c=relaxed/simple;
	bh=szvV6IrMopmr+OBL9gQagLLcUjdP+1eIVq6kpBn3t2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eipM6v6qpzLbaamh33xSW7WwbzdfXojP+jbQm++pbpbXfV6kvx8GUHFQgObziVWBx2LHTr2BWXtitQqxkZccmzPvlgR2oOjjd/7L+LuDngaP5CD1vm0sLdj5Evu1/IyG1GC9uTtTtMBSYbubW3NxZpwb5Czfh2SzF7qXl9qwHJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhVw0kSf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GaJA2032471
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0CQf8ECEko
	EZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=; b=LhVw0kSfCagt1hE3EbqQFhcSwTz
	jNIZhPETxbdWpiKNWh6SlWzzz8pI2sQz1VU63FbymNH1wz6vxjP1dwplO0yJROus
	y8EVElidhgJ0V9BMT5abry+KJwCJ4ngUa2xfOUn/EYiEJ45U0tCXivKmC9GT0gzq
	rWnTgT4ANyrHfr8X7aPcZhSc10Lek6wcad3/S2kSDCaWYUmtX9wYwfOnZZpUexEf
	qXy/w/xsVRRcyRuyHw8Aq60gJve0uaHzmlIja7UJFPdzEkOE+tpuBLyYtBm6CifT
	8AnkqBdcBuP3OlmoOhHvGkhk+71q7Cvvq7yMI3xC0WhD3JxgpQTuvj3c0JA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-310efe825ccso1408276a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148400; x=1749753200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0CQf8ECEkoEZPuzosk2AQuQ/2hYymsahlQVM4KlO5E=;
        b=U6r5uMMM2np8Y51sZs7qzBbBSXKltbBWL4TpGibGJeTDwZAnzBNO5YcDjAcErzeyzG
         /Z2cM3Qkqx/J9jo4wuAFrPPM5dJDTgAF51ClwLFu6k6KKPXWEk2LlZM6R3CbZqqE4arm
         NeZANSivP2FIe4v3/7tquibQ77g4DIItc91B5OoaWLebGO81FonQM9XNV1DXWAmixNgA
         CgXFejolQzweSNVaA2MOX2DVsIDibzpwbLImGYxbcoA7FCMz7dr+D9xSLVvtWrwQg/s7
         NrlZqrdyaUYXaMnOSd6uO+TwtXCwk9HD2QMuWWa75rJ8hVdatR/eP3bQHLr2q/EK4Zam
         5zIA==
X-Forwarded-Encrypted: i=1; AJvYcCVdmBg0T5LyJ7BYu02vDZd7GpeZQQqmqFJZIVfAIA9jRH/KZi/+AmTmnlUwusqaLrM/1k3OInilIBBBR+cS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JWiPoUQilnC/qgNxxxP/EhKRL3BxdTSB3jaxnYGUl9Bz8YN/
	N1k7iBDPSD2wAVXRT0B3GbaYQbhjm9L0y94s+7JTPPhyw6sEQ3GBh2/68t0ltt3F61Suvo/51Yu
	aNqEqZvnxkzZO1Hl2tPY/o+yWnQdfiavSL9Yk+6tP6XdJggh9u3gblyRGKd+Lu+4eH6Z/
X-Gm-Gg: ASbGncufR7xfbIckoncHYFvhDhetRn3VScFGGhL393K0ZGCTk8MNiy04Yr7w0JbaMMd
	6Iz4OQRdv1QpejfajuI2WMSGTEYEozTcNnFwBVbUkbKyyoPA/yavGCyR90cmcFYDMAV0PhAw17p
	8088Axsx6+GkoGNzR3t0iEgGemIxrOnXpoHyYX1Zk7FxBlNKYNCidYg31EYktn+x8WC5xTIMtHb
	nW4jOtlDH+yxmfr4gMrxfCEM71i88wmIvJFOlyvE0ZJD/c0mYZC7g1plXcOnKOnSqoDhcTOqL/H
	4qG3Ww0Cj4+IDdrdJDE4tw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-3134706f8efmr1045860a91.30.1749148399698;
        Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtRHbayHnOG/QPhFRjld2rJq5hRHHtm7rPI8PxA2Bd1CySo0EJuFhDV1n0cRcHKai1dDS1Qw==
X-Received: by 2002:a17:90b:4e86:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-3134706f8efmr1045803a91.30.1749148399107;
        Thu, 05 Jun 2025 11:33:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc373esm61635a91.32.2025.06.05.11.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 36/40] drm/msm: Add mmu prealloc tracepoint
Date: Thu,  5 Jun 2025 11:29:21 -0700
Message-ID: <20250605183111.163594-37-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e30f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=W9C9WuCMp67TlgULjysA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: A37RJQ8bSwfIw-SQUYlQTOfu8UARF0-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX6oGviahNUhM7
 UddTdVhnGptSKExdqnrciGayHmJV0JzFos5yj0n4xkVU1WxN/Jz7AV7LJF7N3fOA6etMsj9p8r+
 sSg1xMmXve+tjygMeNGnk9SDDm20j0CZPDsD99EjvePBG0hPwe+JYB2Tj4SE6FbXEkyqszfMzek
 /uT15QIBzRGOJro7pC5ITEAJ0oVNZ70+tJdOfWe0WkjcGcHUFYx+P4BXFCDnKDtT+cany2phCR/
 T3G/HIUHjcnZu82XC2c/kR0vJaxuLR7odVCO5VG2y6jAQ2F4ErIT4AbRt7A7UAh+ERuCrGxeegz
 iCcBNLm9TXyVXnM5SEnPiJGeN7rG2Gne22wMLIWO75WbuBB3UD2NsllP7cSh5ZzwHSx7m4kZ3Oo
 Ap7mZ6/S1Br19yZVUp+NICLTPEwauO6klwdwNPhbgHywtfxpeYUNwrFhMV1+7hWowiBeE4xD
X-Proofpoint-GUID: A37RJQ8bSwfIw-SQUYlQTOfu8UARF0-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

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


