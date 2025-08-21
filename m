Return-Path: <linux-arm-msm+bounces-70033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E22B2E92F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 02:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 100CCA25ECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 00:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB05C2A1B2;
	Thu, 21 Aug 2025 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnO3TDYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266768F54
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734678; cv=none; b=SlFl8qN/yVCf/8JigxBam+43L/zjxy4mXZWCueOqUHbzMxLIOfMD8MBPJ/69uXwCC+TB/FeVLohVX7r4hqk6ySJZ/EHhA0pshHLtFRVGvSzkp3TiPW4rY13iMBaxo6mFJV6JZGADAJLk/mUN7xEVSyM7VvVlVk/Db2YrutYxehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734678; c=relaxed/simple;
	bh=aJAOWN0ijFMS0Vkkf/yh1HfO36czNE64NzzeczFKSWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1OMBFxBMvVVERfjw2kfHORcTrfIU0NS68Q26WMnQOHEFYKsrTQcN0dXh7W2HTnxVX/nwXpmlw94lrDAzqwnKXfe1vRDu+KB64Ufrk1YrljcMBBg3qOZtg4Jj/cwyqfs1y5IDLRTpWVf4htvnK3z9rkRNUNqw5wjnjSQ922kIdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnO3TDYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KFCar1007320
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UUeZ954T0o+
	UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=; b=bnO3TDYveWTOLQkrfm5KcRB8buo
	9/wxJEHtJNuR4gVm924oFrvDt4dqX8QBrtQ4wfPF3ZkFOIbppnEeavSg0/NR5KcB
	nJeyjRuQRB7DplRV9XFwpxFA9rNRv0R1ajpcvmihLg2KNTZO6rintJ6vtBJe9m4w
	vxHlDVsFcV55q52w5k+wiY1jHQ4ZUlJQ/kwhPl6yssTnNL/iFqVFfTK+KiiMfreG
	Z70qJTUF0LRPC5Arcq4cUgww6QFylMX1L8yLKH5qppU5Hg0e8eh60SJMnVJK2PeG
	7maKAnXNkVHXES43FarV9w0IYni2Ys9b0wUmkGQJ3naZpHGyx774r56lZJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt897rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4761f281a8so273409a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755734675; x=1756339475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUeZ954T0o+UR5vuNiqg0BBHjNOT7Hd/arRfZ79Ap5Y=;
        b=WP3trOXZt6H7//k9GUADpqop4JVHvosHkZwQA9P7nSCHHuHXnqzxFjMB8glF6VW/tM
         cqozNdhmcNIZKpvUxMlPLK5Fd9v+nuMIirF+u0bf1kfTgPBMKZ5u9tVNJFwWD7QKoUw1
         9t26Gy04jiMADbFA0Bb5hAkQoJUYjcJkMsiic/Ptsn2kFW5XUUP+t7FD3ipBrKdSoE+S
         OCcYIKE4NG1L0EoDmYXDtW5GUgKls57Vi7W/LzATGlalNcxxkz2hHfuELiARiDiIg6+c
         yqwjPnA/ujSCBUAlMEbrL8LZ5dCqToKkXBaSBDPTEzIxV3nimZIFjnF3Ehm4wN09u4Eh
         VFug==
X-Gm-Message-State: AOJu0YzA2ltAHUT3C5ERuY656Jy+UzEbhz0dRKZvj31QeNHPGpU29xLa
	itAf2Wyd4P9CwSOfMTdCJuJob/Qc4BQlgD0/Hy4q1+0I0642fSGGHCayKPvehOQ4+3F6mP4rRO0
	eI2/fI99TWgsjL/35G0LIqXlMgTlI8cpuyJ8S2CLbipIb81/4fdjpkeMihf+wcN5dOF3I
X-Gm-Gg: ASbGncuXIXdkVhxUfDDz97ExG/apXiotwNyQgMOoNVrt4s7e7P8j+cg+F++eLxqXpv3
	EQ+klB+wYJPCLhf8z2z9HrpJ++MjLcrEgQ/fnrl86RhzYBtDCjFJFYu8RByVnj3kAjuUqpOC7Bh
	xWwP8aXDWiDOOaFQ1xkmmVPHQPCtm/j+H1AvxI79t9OFdcnsj5NA0rR4M0L/1HUHxmGqE2ycDT0
	QXLuq/+vN0FOIUGSZlQGIl5bfVUDxly3Bh8G5p8fcwmeyeVss+G7QiSdiTHhMsZfEi9SGf+4JeN
	rTq81SiM9lXfsCsLQf4hKJJhgVm6a6YuwduzMC1BXu1UtyzYmgA=
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id adf61e73a8af0-24330a38b92mr513548637.30.1755734674626;
        Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlUnW8lxbe7CPRYj4ZEmunFvuRSStPlf00u91BAFQGx6Z5Mg65P2yj1AhS1x6n8d3UR7v6+g==
X-Received: by 2002:a05:6a20:2589:b0:240:750:58f with SMTP id adf61e73a8af0-24330a38b92mr513507637.30.1755734674129;
        Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e8f20c7dbsm3229516b3a.68.2025.08.20.17.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/msm: Fix obj leak in VM_BIND error path
Date: Wed, 20 Aug 2025 17:04:25 -0700
Message-ID: <20250821000429.303628-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX84C8pbWYIgvV
 dmAgnxsRhhkeJrtfwctlcHh7S3FKaKU2wd2mYBOtGQ6uZfXfZaeLvJPkXAIOwyxvfME1JkdtD97
 uvhXc+NtM7oTInUp7l5swJc8W/87yLY3dy0Wfdn3NMaKQljhGoOIg/suwTKI5XnBuaDZRUyLFHX
 ftdORKXJXz614v82oKVX8peA3F1V5oZ6BUqcJ6vcnwFbjxD1LsTYLbffIm0wFF9+qOcze6rBZKL
 lhExbp46eo8ZxHTx3iYQOZrWGxEtSywBOJ6X+B8QEdWacp1WOk5f0RgOxP9HysSWKpJGzyvfale
 VEkPUGXlBqQvyC4gFEWkrGPd2eK97JuzFe0CnnaZ0cdhuVPyWbJzyenmo7FZn42a5Tm+cQRd7Lz
 14MQlBLQ/7AgwAOy/Ctgivrj1YgWBQ==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a66293 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=hfQrMx_BsErUUvjcJTYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: js9ODLufHGFCH-wZm0nn7QKQ9l95P7be
X-Proofpoint-ORIG-GUID: js9ODLufHGFCH-wZm0nn7QKQ9l95P7be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

If we fail a handle-lookup part way thru, we need to drop the already
obtained obj references.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
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


