Return-Path: <linux-arm-msm+bounces-60376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A04ACF6D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B02C189DEC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC6F278153;
	Thu,  5 Jun 2025 18:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0iRk1uN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384A427C854
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148337; cv=none; b=k3FfNGX7GJHDNRzD5bfU7t5Oi2mAbvxQrYlQjDF0WkEofvCQjHS3r+3tmWBpcBbrujoltl1O2G05PLv6Ah31K/j4Zgd2PB+BNw8XyI8NhqXR9Sv4EyixzLkmBED6y4sEVGHtgj/vubkitv3EBq5+EvAAZ623HH4gafSP+i/QhXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148337; c=relaxed/simple;
	bh=8yxrJuQkxzYQChDV1AsntwCFAr6kU9KajLDojsgN7uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIpLbvhpP2EeZeXHPJP8r2TSTYTTHkU3lwrj5jKZnZA4m7UwjBukkwyOZJ0LBXPmn5qZ1gteCU9AP1L9rdNiBKcCerfX2BOfjBjQN3FmIcDXK9mMojmcQvzezJ/ZGdE3aHs6g5DKdO/UGMXJG/er9ntRPDbnw8nO4vHStHx9gsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0iRk1uN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GjaDH010763
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
	sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=F0iRk1uNT/wx0mzuCe7xK/aMnDy
	vhMRE7SuFAmZZQuUWa802yiJynMvI6vtkWKAefljtPIeMsJpEYEp6wUNCFhICZ36
	SYxZBJoBcQc9UoMlmDi/hOs3Rx66DBHahSAfucZso9Cu5MMr8/FImGGwwtZO0+gy
	0pjWyjr+ZqDsEPwtQOeT8aoEGluB82SJIseTJ2pxfKKve4eXCCwe64iSPfUexcX3
	gGsBjg+AOxJr4SZ2YYlBKpVrQxBBPxr9yPvYdcIKcKwFgasIiAqzDqjDFs1bct4R
	h68mp/8X1E//Yg4oh02W72BYXK/6/8emxlWAU+z5QH3VsRfWwyH3EcywW6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ytbys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311a6b43ed7so1207469a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148332; x=1749753132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
        b=BM8J9cIk4qXS9H7adc9jc8S3vZcT9i9rUCehSW3FwsMH/PNjX3uCb9xhG5W56e6A8B
         0b5dt/95PwXUnRnc+Qrm3q0xaPJNdE6XQTXpAvk49bDXqXOKf0Mx32KUJ9rrCpLzBl5s
         syL/S3ooNtSKvrJxzBJhbgTsx1zOCyOafN3XYz0FYY8YqMhuv7nCiFo2ab35/4bWJb/y
         X3m33MFv2OYyKU+DcaBg1bQyLV7hOAx5BszjJZDlj1xOplWco/m6tvSmT/s+MJyGnHsY
         cH3pDGAGSLNEEJ8EJVcDeL2XnpMztltI0yC2c87BdLlBC8zJgDGXa26FidH/NIZq/Hys
         YXdA==
X-Forwarded-Encrypted: i=1; AJvYcCXoJStwAhGNOfY/cTIYLa7ccMP3jG1yohOMri61K199nKzwgjxSqUoWFS2HYySgytyUKA4doMisSp2jzMIs@vger.kernel.org
X-Gm-Message-State: AOJu0Yztjz3VlXsFVRvw1foM0/gVwo64RgZ92rlWzgtj4BrMHwos0Gav
	AimbfRvqb2hXo4MQmFWmhAl/BPBO7na9tgLc3ZBT0t/E7xo+IafoO92Urhrn3b7xGu2PkpYuU0a
	k6rYlzPoVPOhthhRCPjm+eIHGBn77i4N6j+wjfDsNqmmO1pr5jwPB4c4u0jbkVdxow++9
X-Gm-Gg: ASbGnctVP25c8YlK4Q1CeNF+CkMshM0VTPKn0/SwQ3bOCf3jOQi33L6nhY+sn2MlaX/
	0b+bhUwpQZqZ/vzz4FgnMnX+xqct5cLn2qPJzchcQLEPkT7UP3zUHUtZmn6PIku0JDUryCps00j
	J8cJhISXlz5/8sg58ehs1KlKtDzep7jt9kfxi5h50XEqGsnJTd6XaduiATQgzNv475UXdXSF9P/
	pcaUvbFeCm7ePoF+BM5LiwqfuFbr51KA4HNrdhwB9MEAZifX1wIgxSCyueCo9f28xdgcHP5o51h
	o3gzytDiXE659Mdmb8P6ZSEMmZwLvzPe
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-3134788faefmr998044a91.33.1749148332203;
        Thu, 05 Jun 2025 11:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKBDew32EdipW62Q0cflXApQbfZYLbCKMDJJCflNU0zpokfB0+AAOj2B64JXMPgxhpvo9fg==
X-Received: by 2002:a17:90b:4b46:b0:312:b4a:6342 with SMTP id 98e67ed59e1d1-3134788faefmr997991a91.33.1749148331774;
        Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132ad9a4aasm1558718a91.1.2025.06.05.11.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/40] drm/msm: Improve msm_context comments
Date: Thu,  5 Jun 2025 11:28:48 -0700
Message-ID: <20250605183111.163594-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX8clal9sSCAFR
 ndqrLuyXS6NgGKExmh2pEKYq6VJRfWrGKg8VMz4BvJkEbQkx9eBbaLHCJSHV6IUkUle2jDxdhjw
 zkqSSv8sfCyqDHpQM9ATS6Ncgf/jAnYF5D2p0M8p26V46O8wsuV4A18qqVjUGBDmIyxWFv6K5sV
 7Bov4XEjZh668Ta1/BIsIk43UHh+mo/u6M2Sh2NsJMOeYPDEdU/a3RvLVQAZMFTU3qZIg5wrw1z
 TkPp5OsPCvAFDr+4+VlnqX99ziqGv+Nd9M+Etvhg71ljO1MWk5bIEfHm1y+4Qk/eLl/fFGSNe27
 WGAD7BvljRn3bvKcRGRfez0SS6lun8blAq4ODvO+pO03v75IbUBp1i5p/yTGLWofRILcq7OhzGk
 71YLZvsduyX5+FMdFVn8mLkRJzFMnwYJf6CF7Yw3MROoL0ZXTkG+2tqOSkmORokfVTMAb4JH
X-Proofpoint-ORIG-GUID: xgCA_lpcxt0GKE8DnClmCUr29SmR9ziB
X-Proofpoint-GUID: xgCA_lpcxt0GKE8DnClmCUr29SmR9ziB
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=6841e2ad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0


