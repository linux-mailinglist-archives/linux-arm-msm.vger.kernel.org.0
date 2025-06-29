Return-Path: <linux-arm-msm+bounces-63012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47365AED0D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4051B1893823
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127C825B2F4;
	Sun, 29 Jun 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hw21Q6K5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D56258CFF
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228218; cv=none; b=M2i8RzFy5DVuWbKZzHm5JDo+D3rr68yfNvIfLuuld7vYcSznSrY7/pZGt+KBMsuksRhILMNMenMGeXT73f0JJUrJLPUmmfHBWbkja50rlob91pMmc7YcrjkRqV3V7ByIStJAbSlB1Xrlnq03rKz5gy5nZkmIwXiX+k46n3ef2xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228218; c=relaxed/simple;
	bh=e1ndf2hUIh/MotZmx2Og/v+YPEYB0tTP1wLOvcibMkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMJkvyWvpTgmivivEcIulvDg/MCD++lbKbJpPmT5fGXATtS77ThuM6K/VkaldOAa/9pWag/aOS1S3k6Qw/2mwcHA3xaTAYR/aECgaDgqHJYKvSPKQRHkSNk+suaz4276GcgvOA0icD2aToBHppgPcVMR4nJ8ux32MbY5rI1hqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hw21Q6K5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIk980006080
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MXd06Saq6/9
	4jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=; b=Hw21Q6K5584PMaleLKBvAEKOLvU
	PfMLIfQ/q7iD1wwv4xmqE1S3x0eYxUfgPQHPImWOKTjCbZhqjiDSylHDkI09/tlx
	nocgV8FTfzHc2dnoFkYEvYDctSSkpOo5aP5Azuvi1RQ9tQfR68HgytdjsikfdV1c
	a34/esORWPg7VcPojv1lrrvHNT2+KakhF5qjVia2g02VETxa0kG8SGRUp57ybkcs
	qxTKlcfaX2egg+db7DpV4vedX+bWUb6xOeQzqbtEmgzDZXkKsE2a4AXPTY01z2XS
	jiwGaR1R/nxItrLY7ly3C4qTsdZE0OXqRYAa3Airpff5cie99c92A+7DoZg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso2570375b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228214; x=1751833014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXd06Saq6/94jOhWiMbD0wlZ29ngCx2vyB54A9DMyFk=;
        b=nNPS34M0akAIhW5rZ7GW8Ad6kquyuHHOkiQhlm01zJR/F50hXTgPZVhKzBojCSAiRr
         6nJtjsK7SqicCVemR7okcaKxY2BMF3apiPx2t6j3Uox6sRHnzUyoE2Kfp8QEtjQUvnLs
         TApFWZV+I2Vd+i60mHwrEFLqwnPH7MGqOM6Gt+oeLazbeZmTzCq4GpTwIXjSaBUh3IXb
         XFNPI+6M11Za9avRLBT7U0GaVABL1xRQ6WUDaUDXIMm1+Sy3vMuXONjp7bcq/Saevf+U
         mi5tvXAJhn/sxgNhzhQxH27pQcAKf9sc2gSmqLXT2R/0VhDs7R77J4bI445/O+NjSggG
         CXYw==
X-Gm-Message-State: AOJu0YwKBLLv2DXaGQN7ihej4zHHjCy4XCJFAjDWDvpFyjcWjg2ti7MH
	aDElQ7VDUC3MDBNkkGDb40Ot21imwHMmtqNSgphKSwbTrbawPXxzdxe7eOgP7YTYLMThimZNrGH
	iqXINisbU8sSB6Ym47kDhn6zMF7syya66iTbaB7k4xNIIAgnU5+hi1NnEMKs7OwPsanqX
X-Gm-Gg: ASbGncuQ9QHrpe+DSI+fAIPZ4pUabKYAPfkl9HJr9y/gTw5cNWOMeGnh/il9iMw2ZWZ
	gLZZuqbQ4rs92HYevNVLb0EBXG5astV6WJwzhvCbNqlGcZNjIiK561Kl6vdvnpZSMb1cNtXMm4L
	zT4rCvZCK4LtfT/rSw7lK6wEuQbTEK2YqAamgD8Kvav2XCCXUvmojdkPSg+poNR3uYEcNt90WPJ
	w7XSl6ORdGkKGXPLKBvRVixmfpuvhNTKH6vY/SWrx2HHhh5O72g4E5p0HJxwD0POYQgysjfZj2p
	BuX8gQ0P6SwKcgJzK/TmLpZycBzd6IvC4g==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr15911466b3a.19.1751228213687;
        Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwS0jhkR8kO4XI31Ia1S/bTnmlQi728sKrSzukVGa/mmnt9dqDSkWMQ2dsZWOWEB2qBV+YJQ==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr15911449b3a.19.1751228213309;
        Sun, 29 Jun 2025 13:16:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5579d37sm6914468b3a.81.2025.06.29.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Sun, 29 Jun 2025 13:13:08 -0700
Message-ID: <20250629201530.25775-26-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f37 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: LUGqDOhwIUS8YyCXVvBQ4oP1hCXq_HVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5VOaNcUkzC3U
 evnZevLr7ChrUu1VBmdQrdam7nJr+RgvpFxDOLsbr7B/dqsKOOEMSp7NJQSJ/XI2vikf7F7Lxyh
 ewRtX/SNn6bwLlNp9R0glNgs79kkzamJoAi3iYN+KU0KLxvn4v0yEc85Dub7aZWkwLJJwucv2CN
 kmYPeZqiuDK2+D6edMwHm8pvN6y3j7Agw4CjL3HjOgjaZxGRPbfOQAlLSZQMvoW5ldKUwexHw0p
 Zw8jmgcgQ1LEiwqgTUlCaCX/GIl7u05L0nfMFyLG+fdLmxsjPE5JDxZzgwwmGw8rDt/sh0iPtUy
 AqwwTml7C6srBubDvSNP1E93ACd1ei/wdcqOTiItGXHjT2foEsV4KuCYJjAe1yYDsJXXoq1jjGD
 5mgmYl/IPaq9GnM+4gxHXsQWoQDqLzAoDLejSVvQQq90NcI/+wbeYkYLsxq28R/H3C5JSycx
X-Proofpoint-GUID: LUGqDOhwIUS8YyCXVvBQ4oP1hCXq_HVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=931
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0846f6c5169f..0a9d5ecbef7b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -219,13 +219,14 @@ static void msm_gpu_devcoredump_free(void *data)
 }
 
 static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
-		struct drm_gem_object *obj, u64 iova, bool full)
+				      struct drm_gem_object *obj, u64 iova,
+				      bool full, size_t offset, size_t size)
 {
 	struct msm_gpu_state_bo *state_bo = &state->bos[state->nr_bos];
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
 	/* Don't record write only objects */
-	state_bo->size = obj->size;
+	state_bo->size = size;
 	state_bo->flags = msm_obj->flags;
 	state_bo->iova = iova;
 
@@ -236,7 +237,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 	if (full) {
 		void *ptr;
 
-		state_bo->data = kvmalloc(obj->size, GFP_KERNEL);
+		state_bo->data = kvmalloc(size, GFP_KERNEL);
 		if (!state_bo->data)
 			goto out;
 
@@ -249,7 +250,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 			goto out;
 		}
 
-		memcpy(state_bo->data, ptr, obj->size);
+		memcpy(state_bo->data, ptr + offset, size);
 		msm_gem_put_vaddr(obj);
 	}
 out:
@@ -281,6 +282,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->fault_info = *fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -296,9 +298,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
 		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
-						  submit->bos[i].iova,
-						  should_dump(submit, i));
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
 		}
 	}
 
-- 
2.50.0


