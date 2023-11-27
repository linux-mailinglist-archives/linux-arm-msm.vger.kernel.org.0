Return-Path: <linux-arm-msm+bounces-2093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C87FA238
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E922B2119A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B864530F9E;
	Mon, 27 Nov 2023 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hpnMlYeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73803A9E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:15 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b34563987so24246995e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094574; x=1701699374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BazhM/BZ03YE7Yt2JlSm/CTHrHyW7p3eEne03QtvrUU=;
        b=hpnMlYeb+sKnXRkmn0uLlXg7yXE3Qm2iSFb2b0HyU05Vjw92ODzjdX2Vd+YwDXcbNX
         OOPBk52AXs0M+u0/FyezR0wHJjcZIIfO0mlq+m88fg23N//TkGR38AkIGxIQ6ZIhUHVO
         hbEzptH+tnooOqyYqhWhL1B3uhThVnQcrElDicLeiLsdfLwUsZkFNET9mkIwZfzSRTSf
         t9oIYPjVxvUxcZu8ZuGwHP9Rm0BSfapMGasMXFra7jNNWIP9KZxUUfGZVPw18qAAt0VZ
         BOkkjMWzqkbPs7nXI7ubPosBsARVraY6VWVpAjdQTAjWu4XGbOiPPztiE3DH7tgdcPWI
         Fokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094574; x=1701699374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BazhM/BZ03YE7Yt2JlSm/CTHrHyW7p3eEne03QtvrUU=;
        b=mWV5UtoUIA/ypkcQ+1NUIaV9DbsQIpFNdXlDbeNo/8A9Nk9YGSGNAkpHcgyQDGCfnr
         zrRnOMvQUrHmXpCLRpKLweHAggSOVd5/TjVhWVa9USWUlJvZbd+9YFTcV0NkK85fFq8g
         Vzt5fvm9S1/I/4ovTu2N9gYzlUA7W7s/x21M9ncc/pnXAlQa1rgFWphDi3cSOeCTkH5Q
         qinYV3iBJI58tQ6/6mDbeC6old3xDZzc965nnUNacL69Ok6MmDK6JiybB25mQp8SUSSE
         Sq7PN4eWRXU8MjwCG7skYakrhctiNw8UiCLUSmvUoV9YjJ0lGmZi6UxN6CqYE5T1O4sd
         r8Dg==
X-Gm-Message-State: AOJu0Ywk7Sib9pa6GeuUQtNFkTpT8lMoLuIbeXFl3LJ8wHNCQyYOsd8k
	Vn5GD2g+K2NC3u4/POWfBEhq4A==
X-Google-Smtp-Source: AGHT+IFSWKu7Z2Vo5HFFvcrjP9GimXmpsFXml4lD1QU81jOOyJoXU560chuKtPnbNu5sLrZ8r0ugGQ==
X-Received: by 2002:a05:600c:6d3:b0:408:37aa:774a with SMTP id b19-20020a05600c06d300b0040837aa774amr13011037wmn.17.1701094574311;
        Mon, 27 Nov 2023 06:16:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:13 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 04/13] firmware: qcom: scm: smc: switch to using the SCM allocator
Date: Mon, 27 Nov 2023 15:15:51 +0100
Message-Id: <20231127141600.20929-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231127141600.20929-1-brgl@bgdev.pl>
References: <20231127141600.20929-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We need to allocate, map and pass a buffer to the trustzone if we have
more than 4 arguments for a given SCM calls. Let's use the new TrustZone
allocator for that memory and shrink the code in process.

As this code lives in a different compilation unit than the rest of the
SCM code, we need to provide a helper in the form of
qcom_scm_get_tzmem_pool() that allows the SMC low-level routines to
access the SCM memory pool.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/qcom_scm-smc.c | 30 ++++++++--------------------
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
index 0d4c028be0c1..71e98b666391 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -201,6 +201,11 @@ static void qcom_scm_bw_disable(void)
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
2.40.1


