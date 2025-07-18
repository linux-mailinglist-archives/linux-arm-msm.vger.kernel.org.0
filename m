Return-Path: <linux-arm-msm+bounces-65667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BCCB0A596
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 393907AA3E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AB12144CF;
	Fri, 18 Jul 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avQ9R7v4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3315E5C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846630; cv=none; b=Fr/dHNUazvgrzL4YRPvdqUcxyYllNtIacVlszpmjeJc63by2qVz6NnntXW4HyWMr/zvPQLyGv+lAnXQCMYG+8ctqIPLaN2jMP3gRDSKjwWa5SE57I2W+RQqx2q9lK1sowZcX3yu947yssTA+nr3vfktInkyHXp+GIkKGrHOmwC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846630; c=relaxed/simple;
	bh=7jdn+j6fBv6aWaKF7kL45m2rJ786qt9Jr+L9adAhzQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DdCZCtjbmWF2OuzRV+vBi4XEa8XRqq25K59vRZ7W+phW4ZFZRqZ0QkqRrtCDj+kIcx4a/xQ0tmAy6mb9UOcZihcbdu6UdUQGZjAMkbh2RIDiijEYb8u1Gicex2BAU3KMrAXXsPmHSCq3/ck19U/KtxmK2eqDWMVCy4MR5CjJMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avQ9R7v4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f2b58f0d09so3292286d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752846628; x=1753451428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SkrPfspFyHc5xXXEoWwTf4iCGpyicgV2GEoNlsTW98U=;
        b=avQ9R7v4M9nXcjiKupOPsOapTbTv3CSyNAYdIGLz2giC687l0DAhMKbyt4bAq4HEIL
         3YLYZYieijH1hVxylJGVVh1UAABDNZyLQ7KhLTEIUHV5pytvrRKgmdAWBhr5fB5YqvOz
         /TZpPwEe/7Juo/UAHIDMC7HmYQDlsah551WH/NB71l+DXw4TAJPiZK3917B6oCrRbH6t
         uCW0++9fEOFqxw8oneol5HOxV5uE03YGWdsMERgghj/nAF5nmUn+rkPNXBli2nFjV68/
         eDup5LiMS2dBcgUE7Lhu853PaNQsMrpKz1IWEuVQ5+AeJY6dYPHZMEwGVgwHyNi0eDSs
         c2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752846628; x=1753451428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkrPfspFyHc5xXXEoWwTf4iCGpyicgV2GEoNlsTW98U=;
        b=meGhoFWG2cfppt2IDLXw4OKxcvz83BHmD7WbQm2Xxv7UsVDg219y0BJPBdiNYWkdR5
         nVGecQjzPb7gPtLJ5uq2eVZ4bSf8KL//pol0wKfm+wb/qqJ5anOkA2lgt+JwM3E90jK0
         6M8O9FBcusXIitTSZ0ZY1n3XXyW9rVqVdi3JymEp7Glwwag6z3LV1uefnV00ZGAaD6jH
         YHY5HJlt3wQjp5tk1Hz8ilk08CmxMrBi7YKnkZw9wDFeAxYdCGr7naMmZISTaHNXu+4N
         KybuIWUoD52FqvpE/aITzjQB0PdlFRHcxr7DgWxxVDCL0JllKK0F+sU9WQp6x7QnQVpK
         yh8w==
X-Gm-Message-State: AOJu0Yzgi30oXG6USAUIjGkyk1/nKpMH9QyIBv8S2cQI6VfxluWKIju2
	Nd+MnWKhwKM3zUxNIF59QJpqpZDxYlF52XWQLILKJa/njF5MgR26vt/Q
X-Gm-Gg: ASbGnculZ5JkO0yI06eyl8hET44hT4Ozr5qTxDXyoaoqlZWAVlla0p6xVZBU5ZFvXJr
	YJJEjTDv/m8kzR7GBcWBz4kb4QkEaOf6Ub0NwIwzWUCE9PiNxx3QVULpbyGOq605jZvBvqAz5N5
	CsnSdscm78cg2uMl3UGGdbVOm8NoIDHTmCvbZVck+qGNFcPkzi+i+G0lDe4ph/zOhHIXZo0SAUQ
	syKZaexORRxhainD3LQUJME99NYQdhzvCP2TUSAS5oYtP+6ke14K936PwT+ra2/bEOG1GIWi5h0
	oShEeStNs/gNqJXp3m5y8qRG142YFgtPucsmcA2Lr5Do7gzaxRHfKSMC7AMckW2Guv9UaV5LinM
	i7q1dYAryPgc0ONpiiGnNvgEkX4TgjyT0mkJ7lDhRDIWc+oWnMfZo6AXgb7XukQvsFT0PZq3Bed
	ej
X-Google-Smtp-Source: AGHT+IGY+iixbqvjsq7I2rON5HkFkX4iW716c+BcnszkkT292Hx+bz0cr4N2jZl10jUZwZr8FYCT4Q==
X-Received: by 2002:a05:6214:418f:b0:704:a6ef:2ea2 with SMTP id 6a1803df08f44-704f48370efmr70796456d6.4.1752846627495;
        Fri, 18 Jul 2025 06:50:27 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8c049dsm7632356d6.17.2025.07.18.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 06:50:27 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 18 Jul 2025 09:50:17 -0400
Subject: [PATCH] drm/msm: Wait for MMU devcoredump when waiting for GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-msm-gmu-fault-wait-v1-1-4dcadd3b0eb6@gmail.com>
X-B4-Tracking: v=1; b=H4sIABhRemgC/x2MSQqAMAwAvyI5G6hLVfyKeAiaasCqtG5Q/LvF4
 zDMBPDshD20SQDHl3jZ1ghZmsAw0zoxyhgZcpVrVWcNWm9xsicaOpcDb5IDy0rrsqBoDUEMd8d
 Gnn/a9e/7AXQioLVkAAAA
X-Change-ID: 20250718-msm-gmu-fault-wait-465543a718fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752846626; l=5970;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=7jdn+j6fBv6aWaKF7kL45m2rJ786qt9Jr+L9adAhzQ8=;
 b=h/gtiksZFzUmUzMXG5fGGLeqjCC3mUBvSX2JjMHs7VbjfVxTsnoicD0K24PKvLU1mw5vRb2zF
 GJ4yZzmoLsuBaSI4XnI4dg+jT2bOKWyVQ8TpXgHtqUXBCroozZ39wGV
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

If there is a flood of faults then the MMU can become saturated while it
waits for the kernel to process the first fault and resume it, so that
the GMU becomes blocked. This is mainly a problem when the kernel reads
the state of the GPU for a devcoredump, because this takes a while. If
we timeout waiting for the GMU, check if this has happened and retry
after we're finished.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 21 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 21 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 4 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..6ec396fab22d194481a76d30b2d36ea5fb662241 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -340,6 +340,7 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	int ret;
 	u32 val;
 	int request, ack;
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 
 	WARN_ON_ONCE(!mutex_is_locked(&gmu->lock));
 
@@ -363,9 +364,23 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	/* Trigger the equested OOB operation */
 	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << request);
 
-	/* Wait for the acknowledge interrupt */
-	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & (1 << ack), 100, 10000);
+	do {
+		/* Wait for the acknowledge interrupt */
+		ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
+			val & (1 << ack), 100, 10000);
+
+		if (!ret)
+			break;
+
+		if (completion_done(&a6xx_gpu->base.fault_coredump_done))
+			break;
+
+		/* We may timeout because the GMU is temporarily wedged from
+		 * pending faults from the GPU and we are taking a devcoredump.
+		 * Wait until the MMU is resumed and try again.
+		 */
+		wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
+	} while (true);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 8e69b1e8465711837151725c8f70e7b4b16a368e..4e775ca757ce3649ac238d25cebfd7eb693fda61 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -104,10 +104,25 @@ static int a6xx_hfi_wait_for_msg_interrupt(struct a6xx_gmu *gmu, u32 id, u32 seq
 {
 	int ret;
 	u32 val;
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+
+	do {
+		/* Wait for a response */
+		ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
+			val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
+
+		if (!ret)
+			break;
 
-	/* Wait for a response */
-	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
+		if (completion_done(&a6xx_gpu->base.fault_coredump_done))
+			break;
+
+		/* We may timeout because the GMU is temporarily wedged from
+		 * pending faults from the GPU and we are taking a devcoredump.
+		 * Wait until the MMU is resumed and try again.
+		 */
+		wait_for_completion(&a6xx_gpu->base.fault_coredump_done);
+	} while (true);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f1230465bf0d0840274a6eb03a10c4df3a7a68d3..19181b6fddfd518e2f60324da1a7087458115e40 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -293,6 +293,7 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4])
 {
+	struct adreno_gpu *adreno_gpu = container_of(gpu, struct adreno_gpu, base);
 	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_mmu *mmu = to_msm_vm(gpu->vm)->mmu;
 	const char *type = "UNKNOWN";
@@ -345,6 +346,11 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 		/* Turn off the hangcheck timer to keep it from bothering us */
 		timer_delete(&gpu->hangcheck_timer);
 
+		/* Let any concurrent GMU transactions know that the MMU may be
+		 * blocked for a while and they should wait on us.
+		 */
+		reinit_completion(&adreno_gpu->fault_coredump_done);
+
 		fault_info.ttbr0 = info->ttbr0;
 		fault_info.iova  = iova;
 		fault_info.flags = flags;
@@ -352,6 +358,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 		fault_info.block = block;
 
 		msm_gpu_fault_crashstate_capture(gpu, &fault_info);
+
+		complete_all(&adreno_gpu->fault_coredump_done);
 	}
 
 	return 0;
@@ -1238,6 +1246,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (ret)
 		return ret;
 
+	init_completion(&adreno_gpu->fault_coredump_done);
+	complete_all(&adreno_gpu->fault_coredump_done);
+
 	pm_runtime_set_autosuspend_delay(dev,
 		adreno_gpu->info->inactive_period);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9dc93c247196d5b8b3659157f7aeea81809d4056..f16556c6f2921708e740ecd47f5b4668e87700aa 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -179,6 +179,8 @@ struct adreno_gpu {
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
+	struct completion fault_coredump_done;
+
 	/* interesting register offsets to dump: */
 	const unsigned int *registers;
 

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250718-msm-gmu-fault-wait-465543a718fa

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


