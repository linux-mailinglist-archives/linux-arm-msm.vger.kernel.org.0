Return-Path: <linux-arm-msm+bounces-78417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9FBFE659
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A44501A036FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015652F6184;
	Wed, 22 Oct 2025 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XEkMV+VT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2138826ED37
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171646; cv=none; b=A96NFnWHt0TwlYLvISFX+C++JlvI3jTrIKsrTUl0Ql3m5IMRs5MzQJs8M0cFgBmJpuqujXh6pg8FyFqUqLVnGbgNcjSdNHpcqm8Az8HTzY+Lwpq+QnWE///j6tXYJ8GGtSFAWroopRrSjm3XMtqxM6itQjyazCFgIwxaRKvzpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171646; c=relaxed/simple;
	bh=s1tNuMqAcm2bXMiMD6V6FQCydvFf5uZlJ3OrFtH/Ovo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9o2c10jcIVS4XSA1LzAh6XKHB9vR3DTPTnflSK8/DXnAWvHSjXSwrT98Sl1Igqd2ieWXRWvJ31hboEw+GtzzhX5ooIB5wMlYF2HxY/bnzyYNsRo8b+UfRyY02Xc5M2GomjikYRHIX5AlEGszc4bL1SPYcrFALlJvcOJQVj08Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XEkMV+VT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MK1DWT027078
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnh
	T/pYk/5k=; b=XEkMV+VT0Vncnb4O8C33110XM73b8qxAXFOmWykCvCJVcT1/Qg9
	XAHAez+tRla3HOj7g7zHbK6LyZV1P76src9J0CqU3pa5hUg9yf/uQzARdqNi2qjU
	sgnPKIucpFNLncrNNnR0Un2Wyj794wd52GTHb15SI9T0DdFj3eMtrAhCp5vEq94l
	UQAbQBuY6td+QZscz4cRMufFjBuDIVPAIC65vErFx0EVnLAmsxyAjka9ro/1Gunb
	LVdiEVcIQkWSjP3p164VQA7n0srzvHy6FhOwFe2bqv2emGj26oqZ9Y7M2mwHGHfq
	/Ze6q8qtTYrHuYhE27eg/7g7OBIjoPsPKLA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8g9gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117fbda6eso95801b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761171643; x=1761776443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojPDymiYZTBLdr/wyRVgSgbdNLO5BGbhwnhT/pYk/5k=;
        b=MgSStvnVDlry1jxqbiETIUUYqKRl7NLGBLL4On1D29wgCa8nEFnWsyJ7tiBTeTpIi1
         KB8bhcYAow6ZjseydL9Qtlq2RUeKsvV5cwW/fTwXYgdj9CleukgaxBw5nY+Y0hvpbgpK
         h/gkKImqsKbSTNADO/WGvvfuqlmoQ8RcCEUZvhykSmXLC1RKcFGq8QwR6EaPl6FUrI4f
         kGUthxoCnZTZMhuNHFpNFGXWc0RzaoomP48/MEVLsxihkAIjNCvoDmGSicWH5/oVVGbK
         v12YZ7D2P+UxAMe8rjLBBNGMOIK/KGugY0lsOeiYT6uAD1o4rESUp9LP+Y7GBJrEhQZd
         s7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA/jtXY+Y8/gPggvXIH9zZorYrseYVj5guuHFPCnb2uF3l9tToyVpw0CasZXQZX91+mu5wz4gr/22vedIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6lQR7XGdk7ttJYr9cNd8xbd3/obDfzLS0ndtBD4pKP7Oc6sPb
	t3WNHiLn0w8G8zLLCLJuopZHjE82/lhRUuL3rHnmtlocH5sUUpA8sbMRQrgCrHnKimSA5hnX69c
	alSTssY2z8YMxb4mozxV8Qa6qD1jEcGIDwfyuLJMZXgmUsqBl7BS+XcRh0JM4DyCGCfrX
X-Gm-Gg: ASbGncuBQAP+dfAyGRhsgOvwiZwERFV7GjT2X5zdq/zO87yzuxK6yag41mnR1gbBxvR
	ZDBt/ZGO9TFHbtKtkxrerTZjRv5qfd1DIEgbEOOdq0gHdUiU6vQhnUuWI2XThN3oui6uvG2j02j
	e3HmZ8sJ5PDVv/up5W987FTE0eFBip5VvE5Vh9KvPlSjT51p2zAouTvsVG9GoO9HrG7GAvAFmJk
	ebOSeSnRVFLsGQ/yGmx8s0vtSpEDXmi5406Rcdzy30DvWIQmUOm1JM774vFqKEkWTkZKFgFksXL
	mszz64Yjp016MhoX6cp2vwJTEs9DJm4fPluk60vaFr81pfGmp7n7SrBWD7UURL+mXgnc934BLk+
	U7cvZuEH2vw==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id d2e1a72fcca58-7a220a99177mr31804776b3a.17.1761171642682;
        Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP3Xt+fiS6/lvXldmXrI/Xmz9rKgUz8Br5D+seLdPQbhnS8ioRXSjubRta++0jtoklDejZTA==
X-Received: by 2002:a05:6a00:94ce:b0:771:fa65:ae6e with SMTP id d2e1a72fcca58-7a220a99177mr31804731b3a.17.1761171642157;
        Wed, 22 Oct 2025 15:20:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb0c93sm284889b3a.59.2025.10.22.15.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 15:20:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Ensure vm is created in VM_BIND ioctl
Date: Wed, 22 Oct 2025 15:20:38 -0700
Message-ID: <20251022222039.9937-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dD9LnSr8OlNLZ2uc4-Uef4oT59a28tQg
X-Proofpoint-GUID: dD9LnSr8OlNLZ2uc4-Uef4oT59a28tQg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXxAku2o+kGuMR
 F+7ydESd9sLD5i1rAnL1qZJiFRHY14R88JnnxIeJ8spjHFsn7JWxNNjftER5gUUlxOSqStIpjaV
 aj8IbwkBYZfg3xGFrk8ohg18fjx7n4zG7ZCoAVsVsll9Q3iukS8HGVjC9D9NsYcRLfy4//P++qn
 tsykvqrzx6m8xdHDSNzxhxDukTGZbsUjpdiTv2dmEVSSUzLfMOSlfO2ViCXMLnV12eT582YxJ5/
 pWu98nrKbl3vZOnsBipVODDKFIkmJSGulJJmnrq1oyEMjkgG0OckhUHuDvb0FzZ6v4dft7IHj0b
 Nb1DQ2hbNgM6untD6M8xd0znDu0NytAYhGse8CgZmwNOkX/ghCXbQFOG8JEOhPAFOW6HaTCozLE
 KxWIti1iZPnEQLHsCGSOSQxO1+wepg==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f958bb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3QSsbYrYwaFkjnnp2pkA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Since the vm is lazily created, to allow userspace to opt-in to a
VM_BIND context, we can't assume it is already created.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..90712586faac 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1382,7 +1382,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Maybe we could allow just UNMAP ops?  OTOH userspace should just
 	 * immediately close the device file and all will be torn down.
 	 */
-	if (to_msm_vm(ctx->vm)->unusable)
+	if (to_msm_vm(msm_context_vm(dev, ctx))->unusable)
 		return UERR(EPIPE, dev, "context is unusable");
 
 	/*
-- 
2.51.0


