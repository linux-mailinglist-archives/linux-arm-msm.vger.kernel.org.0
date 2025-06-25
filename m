Return-Path: <linux-arm-msm+bounces-62537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBEAAE8DCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2224F174876
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34CF2F3651;
	Wed, 25 Jun 2025 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5Xb9PZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AD12F2362
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877944; cv=none; b=L9N8DVRmi6+1GUHnzbs0twKQxRjEA0mNtg4cFPbBEo14zBbXz1IXn8xDgAoUnop9CcjaZvsTZlVdPKx6zap4pnxvUWqz55+FHwRo2/uk1L/91aOmNSexfJf/Ud5nllVaLM0BNtg/zNw7kYJPU2E9Ak7qJdfF/BKcco5w37l1cNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877944; c=relaxed/simple;
	bh=4K+ThbkPsMfskaKnhREr4LpxGki6i+xf+4qaxzdTSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqz2yltJVXRFk4G6+qU8+L5puITQidjn6BK5UjMROET9tW1/eG/zsA9d3jItDBVuDgPmgdtq8Ku7s5mpSK1dZsU40btqFCnM4lYcGLolLd0GY00ThhHi4YEbePfOPqZOssTDs7gLttmTFyMW8nTMAx1+zoDex8QQdJTWD+aXmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5Xb9PZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCDAGL028021
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
	YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=Y5Xb9PZA5V9SfHTSNZrW2S229Ep
	tf/237o+5A7MKzfVbAdzgxyVjbOHkY1SgpLzhUoHQ9SDemhASlhCZWJ45CX8MtXJ
	qxqF2J0nNrZFlQYFYXVelNk7T4IwmIF1k0RexZk/viAIU4Fsc/Rg48UHw7Ark/AO
	oNywZl1jaIXwov679cvJWjQnJ2WhOD6SvrEYl13wbj+e49gMxSfLU6HS3T7xBx9b
	z23pPwTxjylsKz0DqezgrusMW9OlI0TzHz6LTUowPhNoQbWjI8LQhauB9pNBd/N1
	LRPc+PBaHJByLxz2bvfWRHLl8sdC6EhR/mCTbtvmo1zAY0lyh4JxriZZDiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748fd21468cso184813b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877940; x=1751482740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
        b=HYXms8xiHo9w+c3vV2/M8CJX7gmugNO5tnUUW6sJRGzBudsnROeVknKKXRwtJXHpT3
         n9Hy3szMPyfW8paj36sOa0xArXakdGm7CCA9y5chgtQfPSndBToYsLmODicZKHBwobzx
         RCGDMoy8uvYkmM/rlP5OczXZ46QWB/7Avkbo8+8fz6SojSedoXJ9Y0gQplH7vcvpyS3L
         V5VI5Llcgnua6KMY0zGJGWJmhTREb2GjJbb8kgSB4nc1sKokoG6u7DoUEhdY3iz15sSC
         2YU6pJEHUVIYs8fyrjc+jFPWr6ERg2LwlJnuZHkgFHgv4fkLrGC56ZNtw4QFvsh0f/Fz
         MY4Q==
X-Gm-Message-State: AOJu0YwEt9XMAnFf6LVH678968RhAqe3kMSLAFB1Nq6OPg4jFj+B2Chh
	jl/aHCDWAVNkXH5d54R2cqkBcimRcCi7fwMdQbxKWobwfs7DRN95KUELRYlt5UqbyneBmXvctzG
	BxvHlgzRxdAISfYIfHf0g1+Q9rPz3QKpG/QsIdrzzMMcs7opmAIUcye85pjS7UoyGQjfh
X-Gm-Gg: ASbGncsUR2rcWJTWbVI3vRFiq1J4MIE94f8kqkJRPSt8MgHHAAg34ldTUkxxuJX1z2b
	Vfm/O+w9LLT/ldpcu2Err9uTLX22uZlVocfIkL7jCgFmOcIQYM38bz9TyXuq3ubKQ8bCYCk6ZaZ
	Gvo+YljC/0wkEz+2idam5maqqPGUuQzxUr0kvV3xSpvEIpJrTxDVRQrDfj6YCFzsZhIoXU23Mct
	sUdsmrG+PkEaS7+ewynllBhyb0FDuiC4GQLpr4PsKc9ZeZEAj7EwD3JMzVAuZ3G9LkPD2qaAKnS
	bJO0YmhBFlJxnre2G7ytD7Q8tQHXgita
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-2208c5b6de0mr1386090637.20.1750877940383;
        Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjs/J0QvS0VnPAD9ghs0ZXCa9bknqb6IuT0ol4Vr7UUmIFGa/LYVfwR/mtK9s9csP9ptJgQ==
X-Received: by 2002:a05:6a21:99a4:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-2208c5b6de0mr1386057637.20.1750877939992;
        Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118ea18sm13411229a12.2.2025.06.25.11.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 25/42] drm/msm: Crashdump prep for sparse mappings
Date: Wed, 25 Jun 2025 11:47:18 -0700
Message-ID: <20250625184918.124608-26-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2xYHBPGJdKp4YVMAxbbrr006-wIFfthJ
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46f5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 2xYHBPGJdKp4YVMAxbbrr006-wIFfthJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX/XLVbRrXZQv2
 eJKimQAPz3JbAhdthzOueaPjM0Bl66OH0tqsJAX45BKyu7eaiW8L6DZ3IDx8ymBJF9gZWK9rQS3
 uUBb94l6SvMitFhkCdfTvDzDm/uUatJi0dvEXuiMGPSfP7UbEOCqTSgHm3/WO8ZHNb9UPVqIJ58
 uHb28XprSMmrOSLfDItHusmQm/E74CD1RXznOxiTAf/ArIAcVk/kQkeahSFHziMgr1AQUSIWpwL
 ffPuerEi5hVLC6vlUh2oROkserv/Q/s+aKEDJet0U5EQiVBH/rz3t+4GOczsrvDvo7+l9W6Ayu0
 y5W+z/hk2HfE4W9f/2/AihzAD8d8tK3YVt/qYVpZkaT+j7paetSXIU7oJppXUn/zYdjPZPzLKr7
 NzZkaI9q+EVx/WgDgw6M5QgoItUwSl/0aORhX0WiofgVBEwDX0cRROFpfo3DFDa1ShMQ8pTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=930 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

In this case, userspace could request dumping partial GEM obj mappings.
Also drop use of should_dump() helper, which really only makes sense in
the old submit->bos[] table world.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 6503ce655b10..2eaca2a22de9 100644
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
@@ -279,6 +280,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->fault_info = gpu->fault_info;
 
 	if (submit) {
+		extern bool rd_full;
 		int i;
 
 		if (state->fault_info.ttbr0) {
@@ -294,9 +296,10 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
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
2.49.0


