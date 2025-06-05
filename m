Return-Path: <linux-arm-msm+bounces-60401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412FACF72A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6327D17B623
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB80287506;
	Thu,  5 Jun 2025 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDgP4tdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431CB2868BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148391; cv=none; b=c35BHlB2bn+ijlEWLe8sJuZAQmLlDu5egZK8ty/yH0vvqkNAVsOj2s/+fSpmwua6cQRbZCXCY1nbgKOupxTvUGzH8+v6ZVqTJp//n/n4B3YOJSZmyfsysxkNueu/2TYihMWAJr7ybZA3qup2E0FT0ulC/HY8UwHoj9s0TbRbu/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148391; c=relaxed/simple;
	bh=npcaXqJDoSyMBRhF30x2mSPk/8hD8RjcLAdanR+hf0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Djj0CCoj3ore55GUYlIkcuyvo2/E4iLQPLH5Viw5qHeArjm2F2dEvRtnbW0I6/VeHJkh4BC4baPx5YFY9E70VXmj+DBsgVrODKywm09GYFHb9JY3FdlEQQMYOMq4wYYbyZ/aDF/YS6XmKFO0XEdvn33IWQWTnMjbVZkvWI3+ZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDgP4tdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GFUPX004217
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YGw3pq0xuYX
	eB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=; b=nDgP4tdd+Ws7bev+GhOhAZpuA2f
	M/5EBWVxMI9QxUQaxxy1c7EQj+40WKPc35VOwdybVzQVPvSLi/uNj5CVH7u0jtzH
	g34lyK9urU3eUUuTdkyfQwdmfZJwhkmTpsvodQBhbXN4pgDi6EcYO2ogcrXEzRvQ
	pt3uVuNQShO5jBWVOW8DYplSU8gcl/t6+18vrDdHeXgHEZeIpHYpFUuway26NujA
	9MbRlhmnyMWkka6pk/wuCxmJFr2MZrFGUPiXe/p90wq3HSuilqJKIDaFrive0Wb9
	OWcw7fHa6h0llk8l5P5ChrLd+NPdTD0hMz9NVSWqClEnrl6LQ3V9RWvnJHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2c7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so1754422b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148388; x=1749753188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGw3pq0xuYXeB0bxqdCW/EyRGUrXHxJgo02Bi+E/25I=;
        b=rGiu0awM8cqqxshNc3Oz2Acl3iVdmwne+stqNkwi7ucIEFOVe/Q/K0OcBgaGBL3ixF
         U5or3BbzSlAdOrOpMmnCVIK4JvCRTL/GzsGnOtTSoAhvbczNYAmpkj+pW8r/bQMRgns7
         ravfSBAGqTgBaXmUjRYr9gBr/ImR93LZZdYVfn9/u0Ar/UTIZl4DBXWHsHAnDdxl5L0L
         rXnGuj42ZKeu7jOBwu12lEoG1p7eQ5s7gpN/iz8lalnfW0uztt15oMfOsdc0Rgqwwjuh
         82nBCupJu3691APRAITSPu06PzfYjHgCD8wZK+wLHEq3MB48nsCco0zoBGYROY2GWOKx
         o9cA==
X-Forwarded-Encrypted: i=1; AJvYcCUyvcAqhLiSjGF3e9QmgfWzo+nWJ2RoEGfyodn76fK6jCiM2lVL3XsEdz0y3C93POeBENX9HE8sSDMN9RZY@vger.kernel.org
X-Gm-Message-State: AOJu0YwnK08CMQYuHch8G8Bfj3WvyRup3XrlC3/0h6e4m4tV4NYNX8AB
	dUIjWhsj1XP+3hD+0Pha8u3sB1mVCo46RghwT3D14jpy/4l0u4tDP3T+BKROGRWR3BP2SX57BTp
	SBN17fJZyEhzF/qHNgQTSa2MQeVggklQoTReuocRd+uPD+Dt7c99otN56KysNf+7/WV8R
X-Gm-Gg: ASbGncuvUmBOFqRR/1BVjg0BFyAJppDvUUzvB4SYDrtSZ5N3vhj1GU52GW4CjkjySJL
	a0PQik1MzQ/3Ptsmgw1Ofd2IqDJur26c2Ps+RHWn8ZW5Si0XK2uEqRW6x1oOYCv7pGVv6bgM3c8
	/6tey1hdls0/jp4JHb9makv0GTJYa9qUyfKfZod3MJmfbmldC+FuiCeaDkZW2oyv1tYPXt3zGkJ
	YtRCdmzMUfqISoUfoY8fRvznCn6Cb4cZmvLv1md/NFMB6hRNO9VQSpl+ES25o60zhLdLuvVG/vF
	zFXScwTnhoJ/uj2yvFJE1g==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id adf61e73a8af0-21ee685066bmr387126637.3.1749148387730;
        Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZy4+h7p31V7pW53fals1CsboObn2Z1U4IfzK+Rx2MlP/oVXrylzGSxEK+JWTBZYf23+Ce6g==
X-Received: by 2002:a05:6a21:4cc5:b0:1f5:8fe3:4e29 with SMTP id adf61e73a8af0-21ee685066bmr387097637.3.1749148387380;
        Thu, 05 Jun 2025 11:33:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affadf70sm13643103b3a.91.2025.06.05.11.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:06 -0700 (PDT)
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
Subject: [PATCH v6 28/40] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Thu,  5 Jun 2025 11:29:13 -0700
Message-ID: <20250605183111.163594-29-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tiEmd2eDg-GXvOEcGf5lmvqOvLVspZtv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXzxTWNg9UUfqw
 g8VEh44z4q8df1pmqu+ndsxlZpQRVRC3jTd9uRR7JvduruGadKMYYKVxMOGiLRzCLPB8AqeecJc
 3V+EPwpN50Hf0vSIZ1JbC77ENst2i9Qmi0U5BZYMiUXpw2dPkMrwqAF6CHYwSNOIwOyP7HAmL6j
 vobBf8rxvD++dvZW7pZKglMRATrPg7S3JEX+0duJlowByJJmfJLmd1+NIH1purBvsbtSsyr4eB0
 L8KfxxQPWysO6LSFhiiytE0pfBonmvt9HjjpY8aF6FuRhXGY2Ol2YkqXIePLI1G+VjvkDU2h6tJ
 B64M/YCIifxWXcta+Nvm+TAYEl3mbTDsYLOHyWXhi/53nSzhIQvlOWOCa42npk/t14tFnYn+yso
 NV4TT65q3rUCv50gJJ4rT4aOIrn9mTV/Q+OISa5yCyt/MJcwS9BgVUZveOjkJqdxzZB3deK8
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e2e4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tiEmd2eDg-GXvOEcGf5lmvqOvLVspZtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ec349719b49a..106fec06c18d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -97,8 +97,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -903,7 +903,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.49.0


