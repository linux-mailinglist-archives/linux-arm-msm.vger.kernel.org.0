Return-Path: <linux-arm-msm+bounces-63009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CFBAED0CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 712697A0721
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A6D257ACF;
	Sun, 29 Jun 2025 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcWUYfXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97545254B14
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228213; cv=none; b=DEa04FHuKYUKZnrBsxGTvrC57+WDgBYbwnhpXajvMSnxLD25kn4zZy9k4+KppDmBcmYPOBDYQfMrfpGfnupPCrG4fqZ5mm9eY0wHzAgCGreJn+c4TYRIXpzK88Qu3gA4u7Z+GTprX4NhKGVpQwsmmhBr/H5vF3Yrc7dKjfwqs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228213; c=relaxed/simple;
	bh=m0U9/s1Q9Od9FftI8RojXks8GPgRuLuUt0Z66pJguBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEEyB8QaMIM2eU4DtITWflNYemEy1KrbcB2+XPDpaneQt9QxhvzY3vxwmQwn9URrUw+LNV2njxTD4DmzA26aTRvIIJPJ6/ojZdflg2bhzVAAZJiK8COZ7dXDsw6mFAC6NCJhO1EZ4HdS7doemnoysESggBamTpyYx3fFCPqh3NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcWUYfXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJuPV3026473
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S4kAEuyQKeE
	+qmE3bZkWMAOyZt7c6wX4bFKVn68PInY=; b=AcWUYfXeDAr+3tnQccnpkdHLT+O
	fLDQxzJY1HGC20hGo9SahYrs38I6aVsK+M01gtpw5oxrlRoY2jbNlEvq4D9Uj1wm
	0Qro9NqOphPX66xy+3DxDme1TV4rKzryBNYpvk5N7lpGnxUWNro4p0sifw2O/JQJ
	zdLwX/J8pMBI+G7RGxU5PAUQ4JB7Ene8GjLzOOIi+hnUmQgHOEKMiyBO5YEGnlzU
	7p7LP+1uiTTy1GGP+ayHdgbUARELNPrBHoglIPeimeXbYvcxP3NiDZi6oe5BWWbD
	/cetq9AqZRI3RycpDzng4RgRNgdKvBZAL7qWUs3b2vEhHSV7NEMTnWgelhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpth8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313fb0ec33bso3409649a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228210; x=1751833010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4kAEuyQKeE+qmE3bZkWMAOyZt7c6wX4bFKVn68PInY=;
        b=peGPfKjj7BuQ/j32eZSerjxh9LpZENS6jZZVOcJ7RZgHgQicCfo+DNO66SbmoxduVS
         euyusBduUA+G8YEz4sJYJCaCLLnVsX7sJvfxuK8q30+RyYO9xLJJhWH9IYQHxrgD/8Yb
         Y4moy2b5yPo1EtYtM9O61jEA1UzAXR0AbA2xK5sEaL2WFMa07VuqCD3spy0H/uf809JM
         v+nUWTdptLhiued0cwQ4+sIh8o/MzY1WtUHI8OUNj7cQM5Omvfl83esDtb2EDSS/nqAz
         ODIcmEe36GK5ml6sfW9ArAbrkJJ/rnKZ9jm6Fbhkly8EgYEyjMGAn0zQ+UgxCcDhNCHH
         JW2g==
X-Gm-Message-State: AOJu0YwYIL9gUL5dSw9smvDKjT7egtKd7e6D2rlJlncHHG/f7wASibtz
	rkI5OvaX5YP8lpoHpz/B1g3qL1BR+kwNpm4h0TWfvecUdMSk9m3nVkL8EKrpd7vjwvdOyDSJm8A
	XEKHRHwj4BZKcUT3+xGmOeUwgmfzVKfmDFnuxzy4fdCL7mIgM47b4ga9X8CxB2hRlrdEX
X-Gm-Gg: ASbGncsca26JlCltHIfk8rzExZFgSBrZFbZZni9PgFlf7bMf2nFsrT96DEd122J11XZ
	Dy4fHmuFhXhbPDMkx/BEZWcrEf9/5GL0ZpMGBEh02K914PWyGcpY/DJkmzQhGru64BtYMxmimmc
	2zKC6h+LTkKunyKi+gfQNJcyR+V/DGsYxkc/3Ptjb84obXh4LlwrpFtKXsliEeFWAx5qsavCN3D
	GIHmzKAJk3L5UYE0NoUFCDdVKJMtQ5nLoExseoWIFLQzz0SjrFg3gBNEU8JjW6ME+6KNoc9rfJp
	94Blsi1XugA+YHFQTRVL7KzbduZaeGOPRw==
X-Received: by 2002:a17:90b:3d50:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-318c8d12fdemr18035335a91.0.1751228209738;
        Sun, 29 Jun 2025 13:16:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6nTxOSnHirq4oNQbnpHK2fdyqzABLA2LE8fNqIqA4XMYtI/10wgAMlVQbHMSFwZWmx3ExcQ==
X-Received: by 2002:a17:90b:3d50:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-318c8d12fdemr18035297a91.0.1751228209115;
        Sun, 29 Jun 2025 13:16:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fd38bsm7460035a91.34.2025.06.29.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:48 -0700 (PDT)
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
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 22/42] drm/msm: Add opt-in for VM_BIND
Date: Sun, 29 Jun 2025 13:13:05 -0700
Message-ID: <20250629201530.25775-23-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX6MeK2c7pq1vv
 PYEymM4X7XG4STmTHUrfTn6NU0Yx1w8NIBMlfal7Sm+9rYdtjCmFibhoLg2jr8g+N/uHWWQ+YXl
 x/jFANfcoNE/2GENKZwlEpHZTX0ID4+B2w//FhKy6CSS95bzJKNMSHmVJAW+eCIyoqcaRd6BbOP
 1iytpQ+iNlcSBbCGY/QS07fK5Qc2YTaAmqUaw2DmCsE25EEb+uw7GGIFxl3fQzXFzVcQpK/GH32
 j4h9ZnRGOrZRjmbMipr/EgLVrAyWdJdlWBYmJV/Yyv9iSlwox/BA3ifP0qyjq0vBQGgIKCSfgiG
 jpvbcoSizfDsW4t7dVygteJPA7hwrMDNqNSUy1BcbfYfsR5Gs/ANqF/m6uKK/ZRAbNFkGuNBxUs
 kuB+DVtQ40sjBEzfoDuLA31lvbBDZgvTO66o4dqjhiG+W8Hy51IUXDXacwHpOgzXDII2MBxp
X-Proofpoint-ORIG-GUID: lPmFaRIOJDGlJxL6Y5DyOgAUyABkxGkt
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f32 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iDRtRSvoPPFvr6RSarUA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lPmFaRIOJDGlJxL6Y5DyOgAUyABkxGkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

Add a SET_PARAM for userspace to request to manage to the VM itself,
instead of getting a kernel managed VM.

In order to transition to a userspace managed VM, this param must be set
before any mappings are created.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 15 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c           | 22 +++++++++++++++++--
 drivers/gpu/drm/msm/msm_gem.c           |  8 +++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  5 +++--
 drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h              | 24 ++++++++++++++++++++
 7 files changed, 99 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7364b7e9c266..62b5f294a2aa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2276,7 +2276,7 @@ a6xx_create_vm(struct msm_gpu *gpu, struct platform_device *pdev)
 }
 
 static struct drm_gpuvm *
-a6xx_create_private_vm(struct msm_gpu *gpu)
+a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
@@ -2286,7 +2286,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu)
 		return ERR_CAST(mmu);
 
 	return msm_gem_vm_create(gpu->dev, mmu, "gpu", ADRENO_VM_START,
-				 adreno_private_vm_size(gpu), true);
+				 adreno_private_vm_size(gpu), kernel_managed);
 }
 
 static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 2baf381ea401..ff25e3dada04 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -504,6 +504,21 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		if (!capable(CAP_SYS_ADMIN))
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
+	case MSM_PARAM_EN_VM_BIND:
+		/* We can only support VM_BIND with per-process pgtables: */
+		if (ctx->vm == gpu->vm)
+			return UERR(EINVAL, drm, "requires per-process pgtables");
+
+		/*
+		 * We can only swtich to VM_BIND mode if the VM has not yet
+		 * been created:
+		 */
+		if (ctx->vm)
+			return UERR(EBUSY, drm, "VM already created");
+
+		ctx->userspace_managed_vm = value;
+
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5cbc2c7b1204..c1627cae6ae6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -232,9 +232,21 @@ static void load_gpu(struct drm_device *dev)
  */
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
 {
+	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
-	if (!ctx->vm)
-		ctx->vm = msm_gpu_create_private_vm(priv->gpu, current);
+
+	/* Once ctx->vm is created it is valid for the lifetime of the context: */
+	if (ctx->vm)
+		return ctx->vm;
+
+	mutex_lock(&init_lock);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
+	mutex_unlock(&init_lock);
+
 	return ctx->vm;
 }
 
@@ -424,6 +436,9 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	if (should_fail(&fail_gem_iova, obj->size))
 		return -ENOMEM;
 
@@ -445,6 +460,9 @@ static int msm_ioctl_gem_info_set_iova(struct drm_device *dev,
 	if (!priv->gpu)
 		return -EINVAL;
 
+	if (msm_context_is_vmbind(ctx))
+		return UERR(EINVAL, dev, "VM_BIND is enabled");
+
 	/* Only supported if per-process address space is supported: */
 	if (priv->gpu->vm == vm)
 		return UERR(EOPNOTSUPP, dev, "requires per-process pgtables");
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 186d160b74de..d16d3012434a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -81,6 +81,14 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	if (!ctx->vm)
 		return;
 
+	/*
+	 * VM_BIND does not depend on implicit teardown of VMAs on handle
+	 * close, but instead on implicit teardown of the VM when the device
+	 * is closed (see msm_gem_vm_close())
+	 */
+	if (msm_context_is_vmbind(ctx))
+		return;
+
 	/*
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index fc4d6c9049b0..c08c942d85a0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -829,7 +829,8 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 
 /* Return a new address space for a msm_drm_private instance */
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed)
 {
 	struct drm_gpuvm *vm = NULL;
 
@@ -841,7 +842,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task)
 	 * the global one
 	 */
 	if (gpu->funcs->create_private_vm) {
-		vm = gpu->funcs->create_private_vm(gpu);
+		vm = gpu->funcs->create_private_vm(gpu, kernel_managed);
 		if (!IS_ERR(vm))
 			to_msm_vm(vm)->pid = get_pid(task_pid(task));
 	}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 29662742a7e1..b38a33a67ee9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -79,7 +79,7 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 			     bool suspended);
 	struct drm_gpuvm *(*create_vm)(struct msm_gpu *gpu, struct platform_device *pdev);
-	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu);
+	struct drm_gpuvm *(*create_private_vm)(struct msm_gpu *gpu, bool kernel_managed);
 	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 
 	/**
@@ -364,6 +364,14 @@ struct msm_context {
 	 */
 	bool closed;
 
+	/**
+	 * @userspace_managed_vm:
+	 *
+	 * Has userspace opted-in to userspace managed VM (ie. VM_BIND) via
+	 * MSM_PARAM_EN_VM_BIND?
+	 */
+	bool userspace_managed_vm;
+
 	/**
 	 * @vm:
 	 *
@@ -456,6 +464,22 @@ struct msm_context {
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
 
+/**
+ * msm_context_is_vm_bind() - has userspace opted in to VM_BIND?
+ *
+ * @ctx: the drm_file context
+ *
+ * See MSM_PARAM_EN_VM_BIND.  If userspace is managing the VM, it can
+ * do sparse binding including having multiple, potentially partial,
+ * mappings in the VM.  Therefore certain legacy uabi (ie. GET_IOVA,
+ * SET_IOVA) are rejected because they don't have a sensible meaning.
+ */
+static inline bool
+msm_context_is_vmbind(struct msm_context *ctx)
+{
+	return ctx->userspace_managed_vm;
+}
+
 /**
  * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
  *
@@ -683,7 +707,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config);
 
 struct drm_gpuvm *
-msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task);
+msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
+			  bool kernel_managed);
 
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 5bc5e4526ccf..b974f5a24dbc 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -93,6 +93,30 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
 /* PRR (Partially Resident Region) is required for sparse residency: */
 #define MSM_PARAM_HAS_PRR    0x15  /* RO */
+/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
+ *
+ * With VM_BIND enabled, userspace is required to allocate iova and use the
+ * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
+ * will be rejected.  (The latter does not have a sensible meaning when a BO
+ * can have multiple and/or partial mappings.)
+ *
+ * With VM_BIND enabled, userspace does not include a submit_bo table in the
+ * SUBMIT ioctl (this will be rejected), the resident set is determined by
+ * the the VM_BIND ops.
+ *
+ * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
+ * And it is not allowed to disable VM_BIND once it has been enabled.
+ *
+ * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
+ * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
+ *
+ * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
+ * from GPU faults or failed async VM_BIND ops, in particular because it is
+ * difficult to communicate to userspace which op failed so that userspace
+ * could rewind and try again.  When the VM is marked unusable, the SUBMIT
+ * ioctl will throw -EPIPE.
+ */
+#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.50.0


