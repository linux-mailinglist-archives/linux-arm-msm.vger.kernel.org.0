Return-Path: <linux-arm-msm+bounces-88309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF3ED0B036
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6E3030443DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33302C21E6;
	Fri,  9 Jan 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2O5xSPP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuceD6OX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09ED35CBDF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973061; cv=none; b=SiX9TPhKv4AfKTCjMtVduWtswuXQt3hPEL1S26y7cn98Z/n+dYtFJm3XsVP38SnbIgf7AhcTX7DLnk2nTtUJl6GYqSdnPCgpFxLfJn4NmFOQ7mZfZtj4HNemlj23MM1bIWYLFt6CmDU8ZE4qDk726snfpXqUtLN6dFTJk4Y6wNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973061; c=relaxed/simple;
	bh=/HIKlNYsgiJ7NEXU3kFpdvz/Bzpb94i94DCuJ70VF7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iG6wQQ8vklf3dZr2B1vKI1gqeU7NCtEHUQaMg2DUNORxV9SihII4KviifxBRRAquVRHsG0djh8yl3ZBqK0zWcp+H73noItf9n7/IipGflJso2Cgc2cERHe1pKm9f9YqIqjdsQacITRZBOAsm0EtfuTtoP2j8FxI0twxi9zOAcBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2O5xSPP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuceD6OX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099X72o3324889
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oH2Jz/3QNtM
	hbWAoaj888UhChyiTdqT0RZuFRUtMRPY=; b=b2O5xSPPY7ellHQlCETxG+Zj5EF
	dcYNlWT4aDTaRXFcSXwFCxLV6epMtXKjrftpvzHF5DbO7Mr4icX/jSFy6emZsGyH
	yBi5FPmOK4/uqSXLk5Eh+VBo2bowNWf1toc+yQF/5ETpglw9RrGi6sn/sc09I5Ju
	ZLrPf22ovwUmOBdZSzku9dzXJty61Zmf6MpFuNXYRqQPJjOhe5fNrE2uAkeovPSB
	W44UW/hGcQXZ8Un/WM7LkPyvQvL+LwrI01lvRUrn7iOs/l5Pui5jH1e+YhKEDSzd
	HG7DYG2H3pNGOx+Kcl9bngmmdjoc+s76fTMrbGwqxJOIYMAxlupZqvTRygQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6ja2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:37:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so7356283a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973057; x=1768577857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH2Jz/3QNtMhbWAoaj888UhChyiTdqT0RZuFRUtMRPY=;
        b=IuceD6OXIXzoJjL6tOrZ1wCW1CSJs8Ujf0tWNKhR/x2e6f3Ct5t111ZuLvHBNyzA8B
         qOMp+aaY2N+xFJfWXJIAV6LupmaRv3eHZs5e2+EXO1o1sOxR4D/HSVPf4wxr1PxKuYfl
         5WXKDrR1zS9hPhbDKzvwB3cQEC9jlzV/QeGRIgvlKjMYJCCN48cjA75gRS20W7WW9fmH
         K/tUKAAVQnSBThy8nlkUYkPrn+AUh8TmkL4nP1u8o3tT46rKHQi1QET+ClKyoKCQnRI9
         xJAftAkz+ANPpAbsEbQ+jGFrXKYfNoE8mJPRERLUF/KqANjO5FPL4OaFlMH4MhFFGKHT
         o2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973057; x=1768577857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oH2Jz/3QNtMhbWAoaj888UhChyiTdqT0RZuFRUtMRPY=;
        b=eJu8d+1rmhweSPikhxmDnP61sE0u6u8D9IDirSdQy5Ig2jOqIZF6RHlIICtQS1fa13
         xbfgI+QIdHOt7zQ/vefQ3hPG77j7QpxZMTxoEL3K/9MQHetru4Khaygb8jm6XPrD87dx
         4fhvZxRfPjCxW/3gkyDAkgq3geC+z1MP2VvB7Cj8VaucGu5MuAJzQMKuDx0VhDgYKGtj
         7sB7APh8HFoB1BShpMV2cQM1hIyLVGdsOz4MuFYILi2+OimQ9vY97IbNBkV0XxhWwYE9
         6cQfz4LmXuMFW4t84GJu+AZB7bbaaL+/fQd0b/5X0PR2gBCKgGtpvZsXu2vg8D9o1Wdv
         Pf6A==
X-Forwarded-Encrypted: i=1; AJvYcCWfkMCTlbgfpTzDIE+GKFzo88RYTR6tRV6ZtVRo3EpO3HQUW9sNLhkul2byFIr0A2t5Q1ORYLeQv8bwZEo6@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdGgK2rfyu9jj+uEpWTN2P/uJE3hDgjnByeW7ZaY4CNgHrojG
	Yd2MdKirAzLESUvUoaSin2VxK5iHnoQAhpLDTSTT4Yj8v7i5LJh6CXgABbtTs5x6SU36LiCRWFr
	sm4oI5kR2asNnEu+xuxgiH5X3C5OmcUORb+Gj1LR9md3ZnnXCmvjSKI2T092ehtFPsS5H
X-Gm-Gg: AY/fxX512ZW0B6PdI/aUVUUKKOP0ZwmfC7q1V360swssr4OcUdRucoWMjJvvI8wI0Jb
	TQ/5bx/bds4a/DPyCnlHBwWnj+pX24ok+cf9gyidpTFBwDIUaxmZKwUBeCki10i8WzSED8j3Kgw
	xkflcXH5sQihV+OkmIh8Bt3FRZ14P6dbMissQbZDSSSwyIdZBFJzanGxtsPhCxgGSzttAgQDuKz
	tlbLyuZrliO3vfu3c6nKFGVOx1xhGV3S6gCVhSisYuZP60b3p/+zMHTdP1h1ZrmeERynzpgJP6v
	NSug+B/dDCv7xFOBWE9QEcHrw+KnLycydZjWu7cr2aXyUKCYaL1e58WxSrW7jJLXxa+Sqvyhmtr
	eOydm/j1eEf+q2khfSpo1iO2vTUlqHBzAJpdhHN/f9NBMlNZeC8qF7Ayo
X-Received: by 2002:a17:90b:3c09:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-34f68b83d71mr9042668a91.5.1767973057483;
        Fri, 09 Jan 2026 07:37:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2Vfrv2/tYoqBOeDYVP7zcrLmd8CQkCkn73TF8rwpP1iUQcrfHCONENcD+YG4c21pg7fTQgA==
X-Received: by 2002:a17:90b:3c09:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-34f68b83d71mr9042647a91.5.1767973057024;
        Fri, 09 Jan 2026 07:37:37 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6ae3f033sm3725145a91.0.2026.01.09.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:37:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Date: Fri,  9 Jan 2026 07:37:29 -0800
Message-ID: <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX37ZLH70bxd5m
 wrS8f4aSObBPKza/ZBKHUDipfa7baIkTh1glOIoQUG1eWKqxA7gfknfPPfGoSmT9FIO9W0mgRQT
 3Nj6k/NP6BwzeI1fEFd1sb9hEGf1HntjcKHdFIyqwAhOwUgfpVwo+9zZjiCufS0vx3G3V2WSunF
 xMQJFlFjUfBcYJwXnMtGIZgXtzw3NXw+FOkikYh8QAPYDJZ1YMlOyqrfs8p7rsL0qT+EKkirEt7
 OS9vx5iFO1mF3JWEB+Y2XjUty4DQUx7IIKO9Bw2uSWGJPeOzLqIUDITDGS2GDYVSi6mYMBbRasO
 VKCRFiBVuOzPIOUSkNFp7fvwLvoGjfr0mjm/8GdGV0uKkVRurRcWR9uqU0rmx1ShZXDMVSOpSzz
 /IG00HS4K3zFp7Mfl+sItG+Dt2UV4EUtL431n2w+jwwkMyxZZO8+IskbDi/iI1kupJbTg9QnB72
 bUczt1W9XoDpLXH+NOQ==
X-Proofpoint-GUID: lnMIlZ7dOlCQMENfL_657WwbQI9NgOwQ
X-Proofpoint-ORIG-GUID: lnMIlZ7dOlCQMENfL_657WwbQI9NgOwQ
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=696120c2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rta67SEPMMT-BrgIBlQA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090117

This should also be zero for gen8.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c80909e63ca..d5fe6f6f0dec 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
-		if (adreno_is_a650_family(adreno_gpu) ||
-		    adreno_is_a740_family(adreno_gpu))
+		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
 			*value = 0;
 		else
 			*value = 0x100000;
-- 
2.52.0


