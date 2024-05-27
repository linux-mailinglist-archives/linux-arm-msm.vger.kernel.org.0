Return-Path: <linux-arm-msm+bounces-20611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F072E8D00A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD781F2464B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A33615FA6E;
	Mon, 27 May 2024 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwN7a7pB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D315ECE9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814613; cv=none; b=rkx8N4c1L7O6RMMNODHbvgp6nwzCm6oIGHMupvR9oy3CLz82gPplyPm1O9J4rMVCuClXC11SymRsr2CrpaIH4X/hp23axIW0Ir3oaDTVg/Clpow0px2jD22aHZk1jbh2uQpUK1GQlg/F4WqB0agjU8Z0AQhM1aGzIBBi1ELVF3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814613; c=relaxed/simple;
	bh=IA1NluuyWIC8/XotvFbpj4DqgZjTYuJun/bo3v6zFBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kz/myHKHXMeQXaDOjzRUhLCIWiUXXaEqTIk+2c17NsDtg6kvBxbcXiOWPmgHVJEDwrnvPm437UjBpNF2bU/L4U5dG0l64ppW0ksev8AEu1L2YiOGMi78ucI/QMhkGa8XeH5bA7/g1wH0MEiLrsJtPmlobIvCpyQzTE8XSYuEiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwN7a7pB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-420180b59b7so48019115e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814608; x=1717419408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WF/896sdGC2fcFcBLtp8Wafg57BR7Ezd4qNrSg9FQvk=;
        b=BwN7a7pBxyMNT2BPrOB6//1t4gazuGS0ola5489MnPgkYFfHLf/LayfkbNmsaJ9NHz
         qL6mY09AnVwYf+/GpbTTN55+vsHFpFDzKDjav/oETT3mDaY7dar6jVikQr6UEL96IY5K
         jJ0Jod2BqYtcwi1W44/8nU+VVneU79Qu0nohZbQlc0/wBGoHuJruU+GGSUrsjvIpsl//
         kigZYE8gPVcQSMvfyPicbbae8yDTbD6b75fD7KTeOyntJCBt2RMgE/5IM0xDJBlBfunL
         mfxOQbXzYmgoFkwtXmeLY15wNNacsOJeasMv5YUM1SHkesOqkAqFOcROCLC6a3T+6ic1
         ycdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814608; x=1717419408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WF/896sdGC2fcFcBLtp8Wafg57BR7Ezd4qNrSg9FQvk=;
        b=XlXcXnV2if6DALRThga7SC+zeR4+D7h6yoWSFYYkJi2zBbl2jvsrZLkCE4qiVx/lfC
         7+l1wxvHRGQpD7uyjPHvnJab6WVoGlG8+Ct5MKg4I83Bp1frmRDzXbNZ22lEZx5ZtJtK
         16eAKE2pwSbad2UsyMv5JFxFTZ/pyY/JgfmbRKvXvTve0VspXxSMqfvh2XxWYmDafJgm
         +fXoHZNY4SXi5PL84F8gWHpqAnPqp+gVoERhB3+BC8NJL1TVyMwpyQ51gWkEgFvi6nPg
         PnM6sa9qn5buS0hTmynPPSxe4pHLggZt08KGFm3GYev9X0pp6kRbRZq8HK0TTqpfaPwo
         86pw==
X-Gm-Message-State: AOJu0YwjkJHZyLPdjAwWEtQuSdDtgvcogRBM70IaQR77sb13X+7ClrzV
	q1+XwAMWe6xkYWheERUaCEKhleV6tFpI0t9nwR317bnqwEH1J3MQmh9mCtHY8EuZL5AW0oLxiB+
	a
X-Google-Smtp-Source: AGHT+IH6VchPULTEGSRUUO5sOippxyiBXFHEUeCEq0xBz+JEny96RRYZTpf8xbzdHO8n6U/xPBWnGg==
X-Received: by 2002:a05:600c:5103:b0:420:1a3:dd04 with SMTP id 5b1f17b1804b1-421089eeb0emr77231195e9.24.1716814608651;
        Mon, 27 May 2024 05:56:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:54 +0200
Subject: [PATCH v10 04/15] firmware: qcom: scm: smc: switch to using the
 SCM allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-4-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4759;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h5olK4FER0ASPIH9I24ILYd6rhf4aQB9nxqDbU4jzPQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMIyg5jo/L/Pq/AFrA6tqCdM/FV+kOCl9Jvh
 9x10vovHz6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCAAKCRARpy6gFHHX
 crPBEADcf+aTOBUDz3TteutQQXSR2p0IkTWki6VzWv78A4/keZyujHuYKtncGvbAuj+6ZKyKgMS
 5sf+bvySqH8yFjx+92RWsjsEuaT8zZyFPs3sBnXGP/gzvhaGOZCAQwALHTFhJMfTbnuULIadXGf
 N3EmwU+nq+C5C1tA83qr2bTIc8GD8SiJMKzuT/POGAeNEKIR8EBl3n0D7U1Sna2uL/cBPltdlRi
 AQ5rjhLsVBGP0ISuAbA9E9EyoMFXaJVKwneZPh/yaApP/DPuFyf5BrBGautvBjPmmjXcaDV9D7X
 DixeVaP0uwD6B8H781xIIqrGw7HQ5Hhdm9cbXUK2fJ662TFXbBpTE7mowYiM7iV1hgIm6FkT+jC
 pS0IihiMPowRhrZevczmdsNs5UrIyOf/qb/i//WOiH/DPE1cYUCX3H4XPo+I7oumnPyOBmNrXuo
 MSUV4PhrBjHIG+pYM4Ums4XpuATvQn5gXYMLY1gGxYO/4Etxz8qpk8gzBjLxKn9a98ZpgOkTw+y
 kTM8l7VDe34XO/aAnTgqAmwpdnuKeUJYxHQpfBooNwgqjlzpxHEcrF3X1iE5NZjQQ3sSi6Rh94r
 0B0M4JW0ase1UWp3zIvpA77sIH0nohTmnHDT6n/hiaOwAURP0yXY1yhP5WMdY+DhiWxXjBYH2xG
 A5JGP5lDbaY1dIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We need to allocate, map and pass a buffer to the trustzone if we have
more than 4 arguments for a given SCM call. Let's use the new TrustZone
allocator for that memory and shrink the code in process.

As this code lives in a different compilation unit than the rest of the
SCM code, we need to provide a helper in the form of
qcom_scm_get_tzmem_pool() that allows the SMC low-level routines to
access the SCM memory pool.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 30 ++++++++----------------------
 drivers/firmware/qcom/qcom_scm.c     |  5 +++++
 drivers/firmware/qcom/qcom_scm.h     |  3 +++
 3 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 16cf88acfa8e..dca5f3f1883b 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -2,6 +2,7 @@
 /* Copyright (c) 2015,2019 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -9,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/arm-smccc.h>
 #include <linux/dma-mapping.h>
 
@@ -150,11 +152,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		   enum qcom_scm_convention qcom_convention,
 		   struct qcom_scm_res *res, bool atomic)
 {
+	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
 	int arglen = desc->arginfo & 0xf;
 	int i, ret;
-	dma_addr_t args_phys = 0;
-	void *args_virt = NULL;
-	size_t alloc_len;
+	void *args_virt __free(qcom_tzmem) = NULL;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
 	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
@@ -172,9 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
-		alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
-		args_virt = kzalloc(PAGE_ALIGN(alloc_len), flag);
-
+		args_virt = qcom_tzmem_alloc(mempool,
+					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
+					     flag);
 		if (!args_virt)
 			return -ENOMEM;
 
@@ -192,25 +193,10 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 						      SCM_SMC_FIRST_EXT_IDX]);
 		}
 
-		args_phys = dma_map_single(dev, args_virt, alloc_len,
-					   DMA_TO_DEVICE);
-
-		if (dma_mapping_error(dev, args_phys)) {
-			kfree(args_virt);
-			return -ENOMEM;
-		}
-
-		smc.args[SCM_SMC_LAST_REG_IDX] = args_phys;
+		smc.args[SCM_SMC_LAST_REG_IDX] = qcom_tzmem_to_phys(args_virt);
 	}
 
-	/* ret error check follows after args_virt cleanup*/
 	ret = __scm_smc_do(dev, &smc, &smc_res, atomic);
-
-	if (args_virt) {
-		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
-		kfree(args_virt);
-	}
-
 	if (ret)
 		return ret;
 
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 0e7b1813e4a7..1d207c14afc8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -204,6 +204,11 @@ static void qcom_scm_bw_disable(void)
 enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
 static DEFINE_SPINLOCK(scm_query_lock);
 
+struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
+{
+	return __scm->mempool;
+}
+
 static enum qcom_scm_convention __get_convention(void)
 {
 	unsigned long flags;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 4532907e8489..aa7d06939f8e 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -5,6 +5,7 @@
 #define __QCOM_SCM_INT_H
 
 struct device;
+struct qcom_tzmem_pool;
 
 enum qcom_scm_convention {
 	SMC_CONVENTION_UNKNOWN,
@@ -78,6 +79,8 @@ int scm_legacy_call_atomic(struct device *dev, const struct qcom_scm_desc *desc,
 int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 		    struct qcom_scm_res *res);
 
+struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
+
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
 #define QCOM_SCM_BOOT_TERMINATE_PC	0x02

-- 
2.43.0


