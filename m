Return-Path: <linux-arm-msm+bounces-62522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE1AE8DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E27F16B426
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D392E610C;
	Wed, 25 Jun 2025 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFPAYJxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8A2DECC3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877912; cv=none; b=EPtC5hBMiqtwsv8/uQVIznMUYvoQOUgSm99/lmWAtjUaVJLeHaAiKMWgI9dWUwV2J60BhjzKvI0p4FmvHM7WfLydeplDrvDmJwZPCzUiE6JqGqSbNSJUCeqdsS6IBcECInI1ggz432ZOuvzXWGA0QKGIFLWYyzNdzo+EWCxhEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877912; c=relaxed/simple;
	bh=GrGA6aQZ+A819VWvU0l5WrQm1ewySWpRFv6nLaO7aCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNW37ioSk5jhzOX/2XIG5JbRwZMV8WNZxFa+Q1JNqWTrx1JN9xqYz3aC/C6oHvtPYG+zLKFuINWYbujeSHYRjkNhbKA0gMiU9QbJvV/WPIToJDP8GotEQfrkQWPQ2GOzwQkM2CH1OLPa1YLHZlrPwABByo0Uf1B1mn7UhYqBwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFPAYJxO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD19rg022368
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aJRux9Mmt7D
	uLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=; b=pFPAYJxODp7VLqvoCbvH+1VyFoR
	TVVh8aSjTtlmlxdCSvt3gkbQFZA5EiJz+tz0zl2LIqflivHZYPF+St2WOkPcCHdT
	5G7cWuDWjzBDv4gGMEAtA65z0/XlHKoGGajfs0u/EjgkGiKYnISbAJUh+GsYoBj+
	wfz5JwZrZAd94KBVHajZQ3FQHvHiL1KPe+JAR7JJbwP9PzdhOWqEasP2ezVf9L4d
	dYC5FmQM04XuMxffPpu0rh79jaKEjWeVsw5XNkJKAHJtcqN2YWh5vRDkoGac5VoL
	/y5jyaLj02fxQsDabfjeGOC9A2NO2jjyY4tWqAqeFI5xfB2R+t9Kep2ttAg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40s16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c36951518so160750a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877909; x=1751482709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJRux9Mmt7DuLoNeHMGnLL0gFwmGFL0eGNY7k6BguSQ=;
        b=NgxwtC2qMmBRoUTb+qrkEOFfKYtM/3fNxYGMSq6vdiYNfbJiiQ1jrU+Z2QxKqt+3YI
         iW0j7VeIyK4vetbRscHTChqnSDLOZgohrcw6Y/5Pr7ZPSNxLk3B0CdiVXFiUEktszm2W
         b4dXhOf9rW/fIbx8slcvShCUx1CnUDShckjDzi5SZ3vCAKWo7QaPgzzfcvZc/KPlars1
         ri03FL92iKzZkIauWir3pGXx1LZz76dl3i6pY32cKRf5zXDP2+IY65dikqTs2wPMMXtV
         nWU9H/sHYeHVrOSAplyZGmuPbgW+zuQ9tFpCWZ9P/kbih6As/GfLVi6S3ZeMmRqBpLK8
         HjkA==
X-Gm-Message-State: AOJu0YziisgbfC8MUk/2u/LhHvOw7R0eyL/FquRVOuN5JifbeN7i1Mf3
	qQfZJdfcfwbU5BFMG5aO3uFC6toBRDkDqpN8YLqFkr1sknzjkHq61aYwFH3f6hzMZ3USxT9k60x
	/tkaerweo1I/yr0pTid6OPyfUEB8YpnlhSzlw+fXUqgr8uuTa91CIO0UpNEmX2iuWIF7H
X-Gm-Gg: ASbGncvqU54Q6nDc0rsBdm/m5fVzRW8rJOONNtLnehOBxGKT3k8ST1E+/JYRexC1ApT
	V41+quXrqGxF53qZQnTgXw6gpfY5abj0ij9qzGj2pSRPKxcv6qX+UrSXMl890GlYElqfmOsP5zQ
	zT/qBsYclhIYLZM/+h9/QKxhBZghtHOPRMIl1Gg7NhT0ZZYD3ibHpPjW9AUpGY7QYqP6p9P10a1
	+4jztJ/tRINdpI5zIhmXHOkHfEpGl4c9LJafE9k23caAfCvJxhRHs65EObeFXH424iLwdTQBk6d
	XiAvlIJheoyXnmSu0umc43yzLb6dCRDt
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2207f25dd7amr6659466637.27.1750877909323;
        Wed, 25 Jun 2025 11:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC270RcmL94Y5v5YXXUNIT0L43Aj7rmknkarCokDfRAAcbW7dfFvu+z2RftyoP2ixS2WyXNQ==
X-Received: by 2002:a05:6a20:2588:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-2207f25dd7amr6659442637.27.1750877908935;
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882cc78sm4909730b3a.87.2025.06.25.11.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
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
Subject: [PATCH v7 10/42] drm/msm: Don't close VMAs on purge
Date: Wed, 25 Jun 2025 11:47:03 -0700
Message-ID: <20250625184918.124608-11-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX3lQFDbhmS42H
 /J0mWWLkJJJQSF5mPO1cU7N0jLanPP70ixp9e5yNpEk6ODu4RJ9W3XxRaOzL4or1V5e0yNbIHnF
 YXFIKtuoF1gRtGFdMLVzhZ1BaUFt6XXaCfevp9+wmaWDGH1rbA316WkmkGoX3nDUbMY1W0XWCrk
 goVfal6DRchAC/X1xCWUH/ZlgKpvEQM+DHQLnWB1BG7uHduTD3qjOy1B2V29R9fCLPhExgmK0JM
 4jW4g+c7fzWR4tb/1BNUWsETSZMrauOVsEo1oFzWupAlKVqhtvs4fpzepJIF8syOFKo2GDqqCo1
 ZgAKxt57zp1ebRLeakjavq0y8XXaFuFbZnzLNjjjRe9fwtiYO33hlUeuvXiGJoV9+XiTIqi/TYv
 v/WGveinxIseS4iYruABYDuFQd+G/4azmhAx4/NUGIWsOBZSS+yCRTkaZqnqZcrZeMJI1yFu
X-Proofpoint-ORIG-GUID: MuXjIZjg7ztwO_jQx7D1j9xdiss62VW1
X-Proofpoint-GUID: MuXjIZjg7ztwO_jQx7D1j9xdiss62VW1
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46d6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pCKbN_IlIROpsMws84IA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0


