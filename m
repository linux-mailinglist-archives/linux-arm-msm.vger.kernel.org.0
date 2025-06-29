Return-Path: <linux-arm-msm+bounces-62999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CBEAED0B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECF51189615F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2DA244684;
	Sun, 29 Jun 2025 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4u/sYh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0648123E25B
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228191; cv=none; b=HtHD6qTjjMMUMsnJ2Y6fpvFuA8qf0kg2ifTWylkoilwkM2Wh3stWjNg5UrhZYNOxA1IStxbaM8hEyEg+VFSuQsfMVcePQ/VcDce5AmMBMKZnGxtHrg6HY1O3E9a8qRmq66Fbz3JExwVP9KxXIFfOLEDoWtkmHGAO584dgjNahMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228191; c=relaxed/simple;
	bh=LF3WmOXEduF0Yox49Tqnc+p3MIWedMqeUKG9yrG7bm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAGI5b49Z9a27C2VnC3mY6AY5ijsoLCK25OCL+ZfOgj6/IYWamUlGQNjmB2uuY3D4yzauU8gK41oqnrgtYGOozIOxt8it37sJGxaUKgV6N9nm48JkO2rtiSO2zZ9W9vWJjJ+lCOwtbMPC2ezy5jhzagXhUubCnwczAxxP/3oCmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4u/sYh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJQL3X008381
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
	ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=e4u/sYh26Nu+yUfdzM8Vm2zWilv
	XJBsX7EHwcKoHwP8YGOgaSdTUZZ2vzfbSEGoboK/KdGO1Z8343Ihc4Wjw4yxmsMD
	cZN5TwIeKJDgr0pv6b7dayED+I9nWDQdu6/S9NOZn9VMO8Ml90KzkDNGvglE7QnR
	z88U9I+Xw6H42rEGwHzV4THbVlu78CBK1d1BYeqXKxZoE1Tg/ODFQL6Lf5RXqDAW
	28tic4tDS5qdoKNkmzTFgGaBXpmEe4tgjFbS/JxU1Gd8Y3qYVjjyxWnlgN6Xktsk
	Dugrte7Vxjnrtf+lfibvnFa7rd/VL8o0/Nn/LIIX+TLVXX1C2ImXfjo3vNQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7398d70abbfso5823422b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228188; x=1751832988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
        b=qNAk0mn6ICxdOdC2/VBQ/+VqdCCcXEYT3F28Vel6QyXBAH0TTSb6asaOuCpUHC2lNr
         xyvEsCAdur7NJOumXEtRyyhQbaEipkXKeDkDBqeGVALpgaaSDCwmSqsGZgFeOZ5tlsf8
         Fi6/I4PwIGgUvCAO1Fgqs4vLsdU+5KcUyCRQ/hb4Emz81C+IVZ5b6PsCIEgLojHIj9sr
         xvEcJXbdzZxmnWZzAUuHJSI8HcEqzWVIDrycefFkZHfJoqwS2txpAflLZUPtSXAFT15p
         BxQ9Ssq/q2vXyiQW2/Zzpa7IgzpHXIgobUkLn05jNS31fRjU2m6aSPQ5tRe2Min5+VXb
         Hz1g==
X-Gm-Message-State: AOJu0YzjDTbx1U3KMm68bBZNVedMbW/DXPrv1jkdow/T+qTts9NjvZrx
	sW2rOJiZUDBdg/ceIs7gOFZBGcCPnc5d3DMwRFpOfIXAnyRp7H5iSxNDNmqnTVd2cvbYlkhhqNA
	u3LOcp9STwK28RMp3+nUTtHguNr5Hf8Bf75l3px6ZclDY4R9/+QM4BZVx63AI84G+9ZDw
X-Gm-Gg: ASbGncs4mYJx1stfe8zxNUNRGW+uuLb5HCw/G7W64Vu5wXAPlPxw4IGDlwgoCO3cFlv
	VuuOb5+zmoRaDMVlBhv5AMrEMe/kOCA2aUmPKqUA8BxevlnNCqpOLhetFisBAfksEaMBPddk1kX
	ANf6Ehe3Q3NF0inZ1yFaiPg7s6ptTnOcyuXdr6y4dIQAScmmn0s3EYBW+5LrELe3voQL0Rqw/RB
	kZB2lNRo72PL8E5T2sSFo0zRMOPr6tl5Yhhfmo5xl3i0WOkn4cJaRXF7IsWFkgGuYhxJb/jO5qo
	e2iZQXESPg0HXO/UMfQ/qY+8Vi8H9tqjmw==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-220a181b968mr17871074637.22.1751228188443;
        Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxbBSzM9ICK5hml2CqQZ7X32XpGFPJlqTsRIpEN5BqVeVXDnuT+nk46z1uPRQyZhJCmaLVA==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id adf61e73a8af0-220a181b968mr17871048637.22.1751228188064;
        Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541d233sm7603622b3a.61.2025.06.29.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 13:12:55 -0700
Message-ID: <20250629201530.25775-13-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7wnaESaFNUtlNPiZyNFNOYM0oBPRxj4V
X-Proofpoint-ORIG-GUID: 7wnaESaFNUtlNPiZyNFNOYM0oBPRxj4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXws51U5lg/fEX
 BsTRyGOrza256/crJBpP+zASlCJu1iIKJvk2i4n/fTYwWgW8pEwXadydOAYVwvIf5bQzID6j3Np
 uSdCBxyu+WLP3hH9Ld+7/HAIqZ41/oOffjUVyPhf5DEtec/kUotuFyvz7Ow6BZxja2rCBcLY9v4
 NjvZAN3ny7Y5wX2BNxB+jZpt/zTA5ZjBPDvGZfoJfAocw5/8cQ2XbDVWcB2C26zbxO42lUi5dhZ
 lGGpFxJFCtrbyz1pL38VvQB3dTYMfh3tZ/arjms2X3REOO31pQ2iWeE/hmE7EQIXIDf3XzVPY8b
 YNSnCcoFJMhrYjMiM0psbK3hipUlKA7ocDBokES61QXyrk2tUpe50O8KXLAwWSFzYQVR5UOjXRs
 qzv7OfthRHBJ0WRYmAoE2qR0C+InzFFA8Yh+B5sIS7q7Pvp8OSQJj1N4ay8DJjE/kSiEvYbx
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619f1d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0


