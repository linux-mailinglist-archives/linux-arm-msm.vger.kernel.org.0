Return-Path: <linux-arm-msm+bounces-60396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8EACF71E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D31F7189E95E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E740283FF7;
	Thu,  5 Jun 2025 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I//7Etx8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA627CB04
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148384; cv=none; b=AVgepg9hovOhJsh2CcOO2gvADH8UPyn1AYdwsOSr7MIhITTZPM41kHplZ6dmaw2LMZyw4oVQdTo8nYSLmc7otRtuQ6kNlokSxLKVtJFAgYN+O6F4cCOD4L0T5JXX3j3dNvud4i2szY47HSqxUzY4fU3Q6CyWTeC2njH8VxUq698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148384; c=relaxed/simple;
	bh=4K+ThbkPsMfskaKnhREr4LpxGki6i+xf+4qaxzdTSv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjpkuEQQP9/LOyknQhNi0OX+00LyTaQ4SvfgYYBySj2WPGLL0hAeajapJhncVnSAtDYTWiAW93xI4yKfM2QoLIFIeJM1puzUEefrJ4s3GpUZYsFlBUhlNdDZvTfN3POjA3HiNSglWqcU1Rm5++eWrJKhYAX02eql0z+2P5HtJV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I//7Etx8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559kgBc014378
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NGLp+jqx0Ko
	YMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=; b=I//7Etx8zRlLq5SrZlnM73W8V/v
	U8OLIX275hpszornK8w1yHVIvocN0tdWCenQbTLRT95l9NmSPzCdGgARNj9MRfrb
	BW1uUOt+Euot9uIF+mmf4zMzwClJxAlaJPxzSayS0lzJRW94+IkuYpFXehXQdgSX
	eEjLgOPyFA/xcdf4OZlXM+UXOyCRIXtPAThqLvPpmyBLMZCvl58haGxoueYusmvD
	LzBOe0nq4JTVuGpBBAf62wPlbCNqMZsS3RYWp66zgyvC1SJntiN5ZNlSZmGwO8hu
	ByMaMiZqZkngHstNtKp+hjpHY9xRmk2OAxlka7kEtfXNd0hNXEuRIaEfxsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be861a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f77f86f6so6209015ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148381; x=1749753181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGLp+jqx0KoYMf7JXKfzU6SErPKJ/xFeT0XGQHG0jTw=;
        b=goCE+EpcZx88zxSpt4lovnGLdv625s3BR6DBc+v90v0OP9SmGSUNwA3JuAZczfKhcY
         zdlJPj+s2PLOIHKpd4pd9t50+KoUlXCMF8VN6/JYEsKk4nNsm/3yfYsUaLPK4AEccK1Q
         CjHl5YlVShHcQuSzNG7dUyYYNikP3oe54TNfVGlm6sLf5IJV3g4Z0fAWVSRMicRhXXDL
         S5IiHCaXTgZ35f5pF7YlNXs60EAEbCq9Yx1mAK6ZxEXb+d4vMWHt/dgq935CHMj7d4GH
         WQo68hq5RY09rDQ7c/E4ja2VUjH/rd1g4LvniJuKoRaIdhV3MY5fJOM3HgaixcfeRfPp
         2lbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWns4Lu740I164QyykBWwcMUXuNtwg87cpHRhmGPgwtJxbXMl3K4JOURBE+xfBOtg4dxVx67yUxiihteNeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIgp+dMTTEbtTi4nKYLw9Rx7nCtS9VElFHfb/RStANOcCgsXL8
	xiD7YBTCRNuJGtDPJMvlgqcPd7IfjsKhKnM/EtT5z6Z3Uq42+5lIJ76zY2AdFad0XnrstQ8KetA
	dpz4CtQnOLA2cI69gAyU62omYwZsUx+03dsamIYEdY06VkPtPU4a4tRTQlzkCZUc8ZqoY
X-Gm-Gg: ASbGncshitjFXfat1xAqlfO1lqjihZFB6MVOcdwifvdsb34aUOsz55bxMkHDIf+x96W
	kglTORI/ufh/aRzKpJolUSCm/PQ2PWUYciMaUq01856+VFdDr6/pIk9b/ObpcYcTJG+ztnVaz6W
	I/NJ3pPnUhNFCNMboPrUCLgEpDqVXimLci9a1v7UQ2CTcKv5eqKX4OR2+yOeMnlVQPRU2zg+s5P
	/oMbR3ZpyNsIWEYTm3YXmVP9oKU800KSlcLcMRvger9VQ7I0WI1Gxhg5aP3cBto6sw5UnJNu86W
	rXeGy902oYkXqm5tLCQLiBLX3pmR4CzN
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr4749905ad.18.1749148380933;
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpPmwrnH8+LJaSqhhgdYBbgE1xYsGuSFpMvCfWrk4O73LnRkaIOhIZ9zOZwzNOMM2oXB4iOg==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr4749565ad.18.1749148380530;
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f453e4sm68227a91.28.2025.06.05.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 23/40] drm/msm: Crashdump prep for sparse mappings
Date: Thu,  5 Jun 2025 11:29:08 -0700
Message-ID: <20250605183111.163594-24-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2dd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=bYXzjpskvHxJzFY9Y_MA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vTGBT2fdn797o3Q_altg456mxvG11DK-
X-Proofpoint-ORIG-GUID: vTGBT2fdn797o3Q_altg456mxvG11DK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX9CWaHVjGITus
 tqjpgEppKZ/7ZrQKXnNoM2WQV445O8MquPMRANDt/vqtKwMD6tqBAA3h7W/oXKPaBtgESsWHKZM
 scfD5Fd2w8RJMS8+f1obQISWAOGGyAb7jG+uBcPPTzIepsi9IH0Y45xej9+KIatGjSH3E+qDZda
 rXQlKEaVxDRkC2hlglKSKqAMZJrkUpzUC8n+5TJEgqAkeHzWJDfT5RWjpJ0AreV3+k5jlfhrgMG
 QNa3ZvR0XIkXkZ6x39MY1Yd3HhB88e+/X8QSWPM/hc2vy8F0yKytio66jlTmiK63DmRDzEAGXCY
 reLYpsw0/VyhMTgs2PsEHFr2WWjZyqgZw4MPg5YXoMTv0nDo0Bhn42agzlMCmupRRtvl8UQqmR1
 QsOM32Mgdp1gXztGXB9rKMJ46Yv+43djC0fxn5Vg+h5lqPQGON2nw+tsBToHUUyVKl3DFG4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=931 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

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


