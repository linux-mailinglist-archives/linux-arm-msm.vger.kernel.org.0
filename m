Return-Path: <linux-arm-msm+bounces-31470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143F974DFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E46283105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 09:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B041714D3;
	Wed, 11 Sep 2024 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bcyec3xS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61129185B42
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726045641; cv=none; b=hYptQ/rSKAZxgxQDJxyJo2oueeoKMZPSUjalFtS5LJ4SM1Ly5GLvU3B6LGRsF+QTwX5gCBjied7S6A/K+Dz8t9wgktGuCKOkkGD7docbdVhEyiROT4t3gJY+2o/xdXBviuJ9I74uUgTGwi/acn2tj6jAwICyAhra53DqBBz76O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726045641; c=relaxed/simple;
	bh=fsAgJwHDEr+KSiZVY7zNR69LYpXgTK/JWvq+XG0/C90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRM0VocU3x7FqWXl5GHa1UjFtiNfmJ9SVGwq00LYzeLeWwf3NvbHVP9q9hwyJL858NvOfS1Ve2rAR4yv6+jsISSouxVWRCpZcMbtNMK7cEn4VvejviBYKKgJlvhWfZGt/VArOEFJrQtbcj7KLyanUCwqh6EC8gb3ONXCwngol0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bcyec3xS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3787f30d892so3985059f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726045638; x=1726650438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCc0Pk2LOqnsy/+/LSMn62Y8h7zBYg5YqPDf8fsQKV4=;
        b=Bcyec3xSjXWOirZTSimPyFOlVWr5X1V7ZGTTDFi8TyEpvHiWa2KAOMyVF/mGRToHNn
         Fk6/Ngc71gTYjBjhsoD/Ppsqqf5Vzzn1KcQYs7hpogrRhR+/fvVzkfHZ6+3mDQiHhX/g
         9rvh3uKmeavsvnwHr5xQD2Uvr5CGprsiuPIkWITMy/tMinfe4XYqhIvcf/eIc2qIa/mU
         Wme2Gx/UuoAI8jdI2rjTWoOBwuaFIlfl28s9zut0ReZuVSLaj7Ed+otWBdJdnMUvWeEt
         4TpJrlV3dHWs2vzxZfWWDiFASQ4GaZKGTCPVDFK1t/IO19tUTcIevdEL1k6qI57y4YYH
         r66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726045638; x=1726650438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCc0Pk2LOqnsy/+/LSMn62Y8h7zBYg5YqPDf8fsQKV4=;
        b=JOCzyRcsLT4YC1vkjKLXkpzNwbMMWW2nrLhMQoTDXJiGwAfDbPH49AYx4QuqkAXE+y
         G89wPkp2JHnobd5gQu68ZpwKYz3zh5GCaZZoECGGJKo9GxTTMpeD3Ix+Wqj4Sk8pgkxh
         DWj5uJbr8QIF/cpCoMDjVl+NbgdX+w7RENp4pIt1StKCQzKFJhCoeM5+p39gydg7a8HT
         CRGH878ARJ8J8I/3byaD/jaKgejoV8aCVmaj0jV3OrWYVPUhBx4FnVOlTvAE3xrHBxb9
         mUO2pJDiPTuQBL5bdgefBgRJSR2P9ECQbDvuMtHMYJTX5TnbPCs9prs8Ip8jPCjjxEnK
         TAzw==
X-Gm-Message-State: AOJu0YxVha6BrA+BxP711zKe3aAe/IA0gpod299RsERr/c8TjiPUYOjz
	C37TyOA6tnKWCf72fFgflPs6cXD3zUX/zCTG/URPvPzFNB8PwRDdIZ9p6WUNAlk=
X-Google-Smtp-Source: AGHT+IFJwkKixqpXEm2xArUQ1OkvCV/poaUEEYvKfjUZu2BNNxkQ+lrjF/R37qM92DDtapB4I33fng==
X-Received: by 2002:a5d:4742:0:b0:374:ae04:c7c5 with SMTP id ffacd0b85a97d-378896a3f84mr10416096f8f.36.1726045636808;
        Wed, 11 Sep 2024 02:07:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5389:6cf0:60c4:3842])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895649b88sm11029201f8f.6.2024.09.11.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:07:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Sep 2024 11:07:04 +0200
Subject: [PATCH v2 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-tzmem-null-ptr-v2-2-7c61b1a1b463@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
In-Reply-To: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2802;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v/CIUywqSceQ2rIapI5Q0gb6HopYTWHqEOvnqJ6sKv8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBm4V28fuMz92TseSVRgJfF+UHFGJzElcDOSNQCO
 SZ89F2PcjGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZuFdvAAKCRARpy6gFHHX
 ciH4D/47tqKjsTOtsjc4ifXbdBdTE6rbhHX4WNqPncJgG/x7WOmCr8cOKraTmovFh7WBEp4XtGd
 m3FMWntz4ZfQuDQ+bVuBq3/NaNPfHw3SLPEpmsgIE84cM+gICyg+jyWtIF2/WTKnqW78m8eBXeg
 rk8ZbPQCD1/uz/Q2JUM75m0S604eTWSuupnDenebLow7Z0SyohIS426HnhB67ONrLzOPerNU+/1
 dm4DlRmCMrVuLNvHdJFaOwLClinUZWAsEHmUbcVa5rQd14neHehgUfDsJWWcw5npMMYKx8h9ydh
 QA4DFg+ENCxkkYQCbcoLX8x409oNPYme6te2/v0UZMt3+rYYt3cPjEfRG5q4ML7kAZi87suxKZX
 gMazBZZy7PP9VAo1pM2su5KFjKtzbJgX86sqS9dNJcG1j7JOLNZNw69neFIioDZ8FITttoDM5d/
 25uBWy+eRkYPL3UkN4nirf3Th731N1sDgx50p6MMfaCOjohi0J5eh6Jirme+Wr7FvZLT4VQ3AIe
 rM3ymCq9xyRKS/8AhBFB03YrB3GfG4D6GZ2BhvVzt9mJCr9EtavROX5UFs1zLqqxhlrUamCGvka
 AKeJ7GUajeaOugzDkY+AAu1JB4KDnbxdBowEFre1mZWAZuOVnGitj/NP7WnwovixpZ5wzc2SiSg
 RpR4A7qMPuLUJ4w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Older platforms don't have an actual SCM device tied into the driver
model and so there's no struct device which to use with the TZ Mem API.
We need to fall-back to kcalloc() when allocating the buffer for
additional SMC arguments on such platforms which don't even probe the SCM
driver and never create the TZMem pool.

Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
Reported-by: Rudraksha Gupta <guptarud@gmail.com>
Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f572..88652c38c9a0 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
 	return 0;
 }
 
+static void smc_args_free(void *ptr)
+{
+	if (likely(qcom_scm_get_tzmem_pool()))
+		qcom_tzmem_free(ptr);
+	else
+		kfree(ptr);
+}
+
+DEFINE_FREE(smc_args, void *, if (!IS_ERR_OR_NULL(_T)) smc_args_free(_T));
 
 int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		   enum qcom_scm_convention qcom_convention,
@@ -155,7 +164,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
 	int arglen = desc->arginfo & 0xf;
 	int i, ret;
-	void *args_virt __free(qcom_tzmem) = NULL;
+	void *args_virt __free(smc_args) = NULL;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
 	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
@@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
-		args_virt = qcom_tzmem_alloc(mempool,
-					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
-					     flag);
+		/*
+		 * Older platforms don't have an entry for SCM in device-tree
+		 * and so no device is bound to the SCM driver. This means there
+		 * is no struct device for the TZ Mem API. Fall back to
+		 * kcalloc() on such platforms.
+		 */
+		if (mempool)
+			args_virt = qcom_tzmem_alloc(
+					mempool,
+					SCM_SMC_N_EXT_ARGS * sizeof(u64),
+					flag);
+		else
+			args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
+					    flag);
 		if (!args_virt)
 			return -ENOMEM;
 

-- 
2.43.0


