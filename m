Return-Path: <linux-arm-msm+bounces-69840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47820B2CFF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 01:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC6D3BD220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 23:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718D9266560;
	Tue, 19 Aug 2025 23:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+Xj5hQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7825A34F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646155; cv=none; b=eJrkOhIU+axy5zw2ZLCpGfKvIj0aH0FVqfs9lnuy2W9p9755PzsraDfHwXJwKC2diEXm7A6Ffx+SSao/TNthnoynlZOlecuj39TiCz6WoTVQOfngcEYVbbors+7u6ZzZPWgxVu5z9WneJ5beDWHjC+BjCTPqcdBrAQsFlMfAa6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646155; c=relaxed/simple;
	bh=m2DbnQlqqNwwlNIxvhEoRGGpqQjDYvvlU9SkRZl+16o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGr3SDpLZV/jNSnvbcPPlTEtB9Cbk9ILmH5VjerUjFhoIE1beOdDk7Q0MAfqsivQcFtNSzBs5rdN1EKc+LQcUVRyTwIHK3YFdCFEQXCWQ+FmFkd0cVcB2K15bd2uuUoeCCcrovLa3HRtFhtciCwcQ0SATCYvCUfnMk65x7Ggpn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+Xj5hQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0xYs002980
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xOD0sf9vQpA
	36mr+XQVQk/HHckfya/iFMlPBFmcVO/4=; b=c+Xj5hQWU3OWNtFeY0EHlKy7/ml
	S5tMQOrEHcmUMpdv+G4YQ5XWvQhTgo3wTJrCQz0TERZCWS5l6cwsz9Pes32RY4mu
	4BVg1rBeIEYOHYEiA3N3TUUEkAb90GKegGLkICDjxMVENSQEmCtSiHuOq4R7InsT
	yNlzeqmnH16fGQ2kB9kLaGWDaCHiO9FeFbRxNy7RyBlKj2f37IgTuqfxdane2Oxv
	gXrtV/CuROTQJBmIgAbnk0BIP7Y+W3fpWu3+72+mSAsZHhOn39tbKZAuPvq6Q2lI
	WccOypGE5S0vUDt3l6gTG4944c8FflWWc+pcA3YVZfECyDjRkobPnIn5UHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tj090g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457f59889so62246725ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755646151; x=1756250951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOD0sf9vQpA36mr+XQVQk/HHckfya/iFMlPBFmcVO/4=;
        b=DjKlvmWy485pIk/ZoeXm1YO5d/XiZQpekxXgx3+RmJnqLLmDOuEgG3Y432JiY5rMbq
         GZiKNIcu1WbCznBA3V7qZlyvRhFjDJqg+gJMo2u3ujIE1FRJ14EQBAQHEPhNSUPi9Jiv
         liMeZf6SNMXlYX0+4Heu2uEJwEmP7N/0aJWfF8o2TLpMpEcc7b2d/5whau+fUWDj+d3z
         ERlEUQuxwcB+kFziJDmMUNFV78bGHdDHn7t6StOn2WSNDUqpXkSkHWeLEUDDWXtFWZB9
         fjH5ObuR/Q/ZvN7MHVHmnUGZZC2d1KJdJC7FrWDRJ3xMuBmCrgTqaS/d5o9dUhwAX22g
         WAEQ==
X-Gm-Message-State: AOJu0Yzolx6jw+yleXXQs3xKjMUG5BjvcHDZVSz/KQ0G36S7ptJlNB6V
	byoYov943Mg/BvaVp6K71BXEu0UBnI6MfPJGeGkiEpgMzGtTK3CL32lJndrMhbNBphXMgmVQXHq
	Cmw5hNKyuJLi4PYipuVdMAMWobx2SH9W8GVs2qZTu+reb0d87LycgpAstzWgmJZxJJPml
X-Gm-Gg: ASbGnctA+orpe2EDPS+SPX7d2L4FKAn7hhErvZ/HPFtEbmHk18xP2ztudt+CD6zK0oe
	yioWgiHgBnR/EQIbzAwnIEKu1Cx+oFIejYnYh/MPObLmfRMAtR9Rhrt4N60p4fA8sfZUjVr+sD6
	5q/2y7qCswBPnIgrxogSw03YkNhY+gfIdvQQ/HyYIA88Z0H5W3lvRr/X5qMy+eeUd8cLermaRdh
	qWRFqGWaKPnMBxJA960UM3rDbqaCsKgBChgV0A8gfdhRYD79hcFIY2mfh6iOOZbzJ+LQeWrdICG
	3BDFX+5kk7BpJLPC1fgeoLPAiGchy4Y32g0KUj69ISh/42wmT20=
X-Received: by 2002:a17:903:1983:b0:242:3105:1787 with SMTP id d9443c01a7336-245ef278bd6mr8125205ad.50.1755646151411;
        Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBNouQd1WNy02GNK10dJCaNN0bn7eGUl0jW23JNcTKuITpIN2aFC9d99JUYmsh8MwZPEEokA==
X-Received: by 2002:a17:903:1983:b0:242:3105:1787 with SMTP id d9443c01a7336-245ef278bd6mr8124815ad.50.1755646151013;
        Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33df68sm8352945ad.21.2025.08.19.16.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:29:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] drm/msm: Fix obj leak in VM_BIND error path
Date: Tue, 19 Aug 2025 16:29:01 -0700
Message-ID: <20250819232905.207547-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B8LgEOtM c=1 sm=1 tr=0 ts=68a508c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=hfQrMx_BsErUUvjcJTYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Y2LCHTVbjVkt1wGnPkLhfCkP0AtZrrah
X-Proofpoint-GUID: Y2LCHTVbjVkt1wGnPkLhfCkP0AtZrrah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX+4FvEDsdmiL3
 DQYe+6vf5N55GmtlI8TXPQ6KGZ9CLdkROpBzJqW1YgF4rE5eFaQ54Hg+eWjbtLz4niBD8etv5eO
 AMdaLWa3ZbWO9x2TcBFVxZqsAQwqBvJJeNsB2fbtIMPEi46xIIMmMob+98YgzxvBPHx8fHR4ptN
 Y/49Zie3E/ZDiB/6ivOv1X2Epy9Qz72zCINaxaPd78mw06lCc8vHA/kjCr7MJN2RTbzA14ddgbL
 /dxxkZmK9BEHh2/c98RD/ZbowXLdlc4gt6Zodl79KytgYo96VsH5r3YPjaPbwXQbCFfaE15nUaS
 kKsA3Ci6qIjQQ5bAOr925QHxRSdGwepAoMWzDKVbZlG1oX3GcUknFi5sDqTzLDHMR2FJsLr7T70
 ypk0H9w2hUGD1iL7DqemdNBQFN71wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196

If we fail a handle-lookup part way thru, we need to drop the already
obtained obj references.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 00d0f3b7ba32..209154be5efc 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1023,6 +1023,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 	struct drm_device *dev = job->vm->drm;
 	int ret = 0;
 	int cnt = 0;
+	int i = -1;
 
 	if (args->nr_ops == 1) {
 		/* Single op case, the op is inlined: */
@@ -1056,11 +1057,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 	spin_lock(&file->table_lock);
 
-	for (unsigned i = 0; i < args->nr_ops; i++) {
+	for (i = 0; i < args->nr_ops; i++) {
+		struct msm_vm_bind_op *op = &job->ops[i];
 		struct drm_gem_object *obj;
 
-		if (!job->ops[i].handle) {
-			job->ops[i].obj = NULL;
+		if (!op->handle) {
+			op->obj = NULL;
 			continue;
 		}
 
@@ -1068,15 +1070,15 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 		 * normally use drm_gem_object_lookup(), but for bulk lookup
 		 * all under single table_lock just hit object_idr directly:
 		 */
-		obj = idr_find(&file->object_idr, job->ops[i].handle);
+		obj = idr_find(&file->object_idr, op->handle);
 		if (!obj) {
-			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", job->ops[i].handle, i);
+			ret = UERR(EINVAL, dev, "invalid handle %u at index %u\n", op->handle, i);
 			goto out_unlock;
 		}
 
 		drm_gem_object_get(obj);
 
-		job->ops[i].obj = obj;
+		op->obj = obj;
 		cnt++;
 	}
 
@@ -1085,6 +1087,17 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 out_unlock:
 	spin_unlock(&file->table_lock);
 
+	if (ret) {
+		for (; i >= 0; i--) {
+			struct msm_vm_bind_op *op = &job->ops[i];
+
+			if (!op->obj)
+				continue;
+
+			drm_gem_object_put(op->obj);
+			op->obj = NULL;
+		}
+	}
 out:
 	return ret;
 }
-- 
2.50.1


