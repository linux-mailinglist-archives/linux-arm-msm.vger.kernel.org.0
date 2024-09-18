Return-Path: <linux-arm-msm+bounces-31964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E7197BDFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72DB282B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 14:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386591AE84F;
	Wed, 18 Sep 2024 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WKpz9h3Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB31AE04A;
	Wed, 18 Sep 2024 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726669865; cv=none; b=bj0LZZ74jnMWCn6JDVhkoeT+oVUgUbW5yLwXr2z/ltXrbnAYku5oshgTm0brRt5QPvJalXbszWPaRsDEO8RZ7Lkoo4nFxBaqj8U+daIVOE9Y+9Ja6C+5NKDrU83OwzFg3RuUaIywwOwTU31WExF2oI565T3ybd1xTeg14OATyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726669865; c=relaxed/simple;
	bh=8fj+vXGZ3P7+bld/eItHccBpRr09QtDWXCUdUFOxQf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KU5CmzSuHUfqerTIHQ1uLI12KjNeIEdWys8PaPsvOZVKuJhTclYPzFOQaMnQHTCV+NaSBCHB41WrZEn8vXtG6za0vdWmkqEmIlBN5lc5UxqOgE6qU2L018BxW85245qNIvw0KyWqsY5zRfnopPLS6g4dvQJo4PCi+XUZwBwfgBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WKpz9h3Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I6eZuc005293;
	Wed, 18 Sep 2024 14:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jTHd0EfAk5dp139PGWtBRuHpNDjfFb1mBNF
	F4LsmkYU=; b=WKpz9h3YM/0kGKDS0hLDByRs4dMxxJn49JYFJY477Zu63vIdKFW
	kJ2ozLxo4ChRC4Ko7GQBn9WDvl0EOFCvkofDAteq8TNkHraWaBs02Dx6xUNhJiDz
	c2rh8etIaDoh0u3L5YFUqRos8GbXvhcq+W0VwxhIHkYEUX1fbAJ0/t9U3J/zfjxm
	3a1MdABrgoQhsOErmtdiuBInnBH791Zt9Hov7+qOUT6N3psjs4XSiJ8qcjQGtGmi
	DaAX+yVzxwLG85CS2jP0cK/vG2D8kmnB5cJtW2NyZoP2yr42Ui4RVHZ8cMykmUkH
	BihSKnSHem5rNiDWXyxn7NwyMO76mR5QXbQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd27cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 14:30:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48IEUooq031033;
	Wed, 18 Sep 2024 14:30:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41n3jm9qbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 14:30:49 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48IEU7VQ030377;
	Wed, 18 Sep 2024 14:30:49 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48IEUncN031028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 14:30:49 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 4D76C584; Wed, 18 Sep 2024 20:00:48 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH] firmware: qcom: scm: Add check for NULL-pointer dereference
Date: Wed, 18 Sep 2024 20:00:37 +0530
Message-ID: <20240918143037.2826043-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hnc8eYeCWBQBEvJwrgN8HhiQHnMtkj5o
X-Proofpoint-GUID: hnc8eYeCWBQBEvJwrgN8HhiQHnMtkj5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180094

Avoid NULL pointer dereference while using any qcom SCM calls.
Add macro to easy the check at each SCM calls.

Change-Id: Icc667f7bee05c9f0552a6779e033d1b892cf74b7

diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
index 029e6d117cb8..3247145a6583 100644
--- a/drivers/firmware/qcom/qcom_scm-legacy.c
+++ b/drivers/firmware/qcom/qcom_scm-legacy.c
@@ -148,6 +148,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 	__le32 *arg_buf;
 	const __le32 *res_buf;

+	if (!dev)
+		return -EPROBE_DEFER;
+
 	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
 	if (!cmd)
 		return -ENOMEM;
diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f572..4f48fabe1625 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -173,6 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];

 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
+		if (!mempool)
+			return -EPROBE_DEFER;
+
 		args_virt = qcom_tzmem_alloc(mempool,
 					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
 					     flag);
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..72e71fc569e3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2015 Linaro Ltd.
  */

+#define pr_fmt(fmt)     "qcom_scm: %s: " fmt, __func__
+
 #include <linux/arm-smccc.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -145,6 +147,8 @@ static const char * const download_mode_name[] = {

 static struct qcom_scm *__scm;

+#define SCM_NOT_INITIALIZED()	(unlikely(!__scm) ? pr_err("SCM not initialized\n") : 0)
+
 static int qcom_scm_clk_enable(void)
 {
 	int ret;
@@ -216,6 +220,9 @@ static DEFINE_SPINLOCK(scm_query_lock);

 struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
 {
+	if (SCM_NOT_INITIALIZED())
+		return NULL;
+
 	return __scm->mempool;
 }

@@ -261,7 +268,7 @@ static enum qcom_scm_convention __get_convention(void)
 	 * early calls into the firmware on these SoCs so the device pointer
 	 * will be valid here to check if the compatible matches.
 	 */
-	if (of_device_is_compatible(__scm ? __scm->dev->of_node : NULL, "qcom,scm-sc7180")) {
+	if (of_device_is_compatible(__scm->dev->of_node, "qcom,scm-sc7180")) {
 		forced = true;
 		goto found;
 	}
@@ -277,7 +284,7 @@ static enum qcom_scm_convention __get_convention(void)
 	spin_lock_irqsave(&scm_query_lock, flags);
 	if (probed_convention != qcom_scm_convention) {
 		qcom_scm_convention = probed_convention;
-		pr_info("qcom_scm: convention: %s%s\n",
+		pr_info("convention: %s%s\n",
 			qcom_scm_convention_names[qcom_scm_convention],
 			forced ? " (forced)" : "");
 	}
@@ -378,6 +385,9 @@ static int qcom_scm_set_boot_addr(void *entry, const u8 *cpu_bits)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	for_each_present_cpu(cpu) {
 		if (cpu >= QCOM_SCM_BOOT_MAX_CPUS)
 			return -EINVAL;
@@ -387,7 +397,7 @@ static int qcom_scm_set_boot_addr(void *entry, const u8 *cpu_bits)
 	desc.args[0] = flags;
 	desc.args[1] = virt_to_phys(entry);

-	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
+	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }

 static int qcom_scm_set_boot_addr_mc(void *entry, unsigned int flags)
@@ -405,8 +415,11 @@ static int qcom_scm_set_boot_addr_mc(void *entry, unsigned int flags)
 		},
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	/* Need a device for DMA of the additional arguments */
-	if (!__scm || __get_convention() == SMC_CONVENTION_LEGACY)
+	if (__get_convention() == SMC_CONVENTION_LEGACY)
 		return -EOPNOTSUPP;

 	return qcom_scm_call(__scm->dev, &desc, NULL);
@@ -459,7 +472,10 @@ void qcom_scm_cpu_power_down(u32 flags)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

-	qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
+	if (SCM_NOT_INITIALIZED())
+		return;
+
+	qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_cpu_power_down);

@@ -476,6 +492,9 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
 	struct qcom_scm_res res;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);

 	return ret ? : res.result[0];
@@ -539,6 +558,9 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 {
 	int ret = 0;

+	if (SCM_NOT_INITIALIZED())
+		return;
+
 	if (__scm->dload_mode_addr) {
 		ret = qcom_scm_io_rmw(__scm->dload_mode_addr, QCOM_DLOAD_MASK,
 				      FIELD_PREP(QCOM_DLOAD_MASK, dload_mode));
@@ -586,6 +608,9 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -640,6 +665,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
  */
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 {
+	if (SCM_NOT_INITIALIZED())
+		return;
+
 	if (!ctx->ptr)
 		return;

@@ -674,6 +702,9 @@ int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
@@ -711,6 +742,9 @@ int qcom_scm_pas_auth_and_reset(u32 peripheral)
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
@@ -747,6 +781,9 @@ int qcom_scm_pas_shutdown(u32 peripheral)
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_clk_enable();
 	if (ret)
 		return ret;
@@ -784,6 +821,9 @@ bool qcom_scm_pas_supported(u32 peripheral)
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return false;
+
 	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
 					  QCOM_SCM_PIL_PAS_IS_SUPPORTED))
 		return false;
@@ -807,7 +847,7 @@ static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	struct qcom_scm_res res;
 	int ret;

-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, &res);

 	return ret ? : res.result[0];
 }
@@ -818,6 +858,9 @@ static int qcom_scm_pas_reset_assert(struct reset_controller_dev *rcdev,
 	if (idx != 0)
 		return -EINVAL;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return __qcom_scm_pas_mss_reset(__scm->dev, 1);
 }

@@ -827,6 +870,9 @@ static int qcom_scm_pas_reset_deassert(struct reset_controller_dev *rcdev,
 	if (idx != 0)
 		return -EINVAL;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return __qcom_scm_pas_mss_reset(__scm->dev, 0);
 }

@@ -847,6 +893,8 @@ int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 	struct qcom_scm_res res;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;

 	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
 	if (ret >= 0)
@@ -867,6 +915,9 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_io_writel);
@@ -879,6 +930,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_io_writel);
  */
 bool qcom_scm_restore_sec_cfg_available(void)
 {
+	if (SCM_NOT_INITIALIZED())
+		return false;
+
 	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
 					    QCOM_SCM_MP_RESTORE_SEC_CFG);
 }
@@ -897,6 +951,9 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 	struct qcom_scm_res res;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);

 	return ret ? : res.result[0];
@@ -915,6 +972,9 @@ int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 	struct qcom_scm_res res;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);

 	if (size)
@@ -938,6 +998,9 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 	};
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);

 	/* the pg table has been initialized already, ignore the error */
@@ -959,6 +1022,9 @@ int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_iommu_set_cp_pool_size);
@@ -981,6 +1047,9 @@ int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);

 	return ret ? : res.result[0];
@@ -1045,6 +1114,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	int ret, i, b;
 	u64 srcvm_bits = *srcvm;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	src_sz = hweight64(srcvm_bits) * sizeof(*src);
 	mem_to_map_sz = sizeof(*mem_to_map);
 	dest_sz = dest_cnt * sizeof(*destvm);
@@ -1102,6 +1174,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_assign_mem);
  */
 bool qcom_scm_ocmem_lock_available(void)
 {
+	if (SCM_NOT_INITIALIZED())
+		return false;
+
 	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_OCMEM,
 					    QCOM_SCM_OCMEM_LOCK_CMD);
 }
@@ -1129,6 +1204,9 @@ int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
 		.arginfo = QCOM_SCM_ARGS(4),
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ocmem_lock);
@@ -1152,6 +1230,9 @@ int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
 		.arginfo = QCOM_SCM_ARGS(3),
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
@@ -1164,6 +1245,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_unlock);
  */
 bool qcom_scm_ice_available(void)
 {
+	if (SCM_NOT_INITIALIZED())
+		return false;
+
 	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
 					    QCOM_SCM_ES_INVALIDATE_ICE_KEY) &&
 		__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_ES,
@@ -1193,6 +1277,9 @@ int qcom_scm_ice_invalidate_key(u32 index)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_ice_invalidate_key);
@@ -1236,6 +1323,9 @@ int qcom_scm_ice_set_key(u32 index, const u8 *key, u32 key_size,

 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	void *keybuf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 							   key_size,
 							   GFP_KERNEL);
@@ -1260,10 +1350,14 @@ EXPORT_SYMBOL_GPL(qcom_scm_ice_set_key);
 bool qcom_scm_hdcp_available(void)
 {
 	bool avail;
-	int ret = qcom_scm_clk_enable();
+	int ret;
+
+	if (SCM_NOT_INITIALIZED())
+		return false;

+	ret = qcom_scm_clk_enable();
 	if (ret)
-		return ret;
+		return false;

 	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
 						QCOM_SCM_HDCP_INVOKE);
@@ -1305,6 +1399,9 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 	};
 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;

@@ -1333,6 +1430,9 @@ int qcom_scm_iommu_set_pt_format(u32 sec_id, u32 ctx_num, u32 pt_fmt)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_iommu_set_pt_format);
@@ -1348,6 +1448,8 @@ int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;

 	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
 }
@@ -1355,6 +1457,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_qsmmu500_wait_safe_toggle);

 bool qcom_scm_lmh_dcvsh_available(void)
 {
+	if (SCM_NOT_INITIALIZED())
+		return false;
+
 	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_LMH, QCOM_SCM_LMH_LIMIT_DCVSH);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
@@ -1369,6 +1474,9 @@ int qcom_scm_shm_bridge_enable(void)

 	struct qcom_scm_res res;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
 					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
 		return -EOPNOTSUPP;
@@ -1396,6 +1504,9 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 	struct qcom_scm_res res;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_call(__scm->dev, &desc, &res);

 	if (handle && !ret)
@@ -1415,6 +1526,9 @@ int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
 		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_delete);
@@ -1429,6 +1543,9 @@ int qcom_scm_lmh_profile_change(u32 profile_id)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_profile_change);
@@ -1450,6 +1567,9 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	u32 *payload_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
 							       payload_size,
 							       GFP_KERNEL);
@@ -1480,6 +1600,9 @@ int qcom_scm_gpu_init_regs(u32 gpu_req)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
 EXPORT_SYMBOL_GPL(qcom_scm_gpu_init_regs);
@@ -1554,6 +1677,9 @@ static int qcom_scm_qseecom_call(const struct qcom_scm_desc *desc,
 {
 	int status;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	/*
 	 * Note: Multiple QSEECOM SCM calls should not be executed same time,
 	 * so lock things here. This needs to be extended to callback/listener
@@ -1848,6 +1974,9 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 {
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
 	if (ret)
 		return ret;
@@ -1861,6 +1990,9 @@ static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
 {
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
 	if (ret)
 		return ret;
@@ -1910,11 +2042,14 @@ static int set_download_mode(const char *val, const struct kernel_param *kp)
 	bool tmp;
 	int ret;

+	if (SCM_NOT_INITIALIZED())
+		return -ENODEV;
+
 	ret = sysfs_match_string(download_mode_name, val);
 	if (ret < 0) {
 		ret = kstrtobool(val, &tmp);
 		if (ret < 0) {
-			pr_err("qcom_scm: err: %d\n", ret);
+			pr_err("err: %d\n", ret);
 			return ret;
 		}

@@ -1922,8 +2057,7 @@ static int set_download_mode(const char *val, const struct kernel_param *kp)
 	}

 	download_mode = ret;
-	if (__scm)
-		qcom_scm_set_download_mode(download_mode);
+	qcom_scm_set_download_mode(download_mode);

 	return 0;
 }
@@ -1971,13 +2105,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (IS_ERR(scm->bus_clk))
 		return PTR_ERR(scm->bus_clk);

-	scm->reset.ops = &qcom_scm_pas_reset_ops;
-	scm->reset.nr_resets = 1;
-	scm->reset.of_node = pdev->dev.of_node;
-	ret = devm_reset_controller_register(&pdev->dev, &scm->reset);
-	if (ret)
-		return ret;
-
 	/* vote for max clk rate for highest performance */
 	ret = clk_set_rate(scm->core_clk, INT_MAX);
 	if (ret)
@@ -1986,6 +2113,13 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Let all above stores be available after this */
 	smp_store_release(&__scm, scm);

+	__scm->reset.ops = &qcom_scm_pas_reset_ops;
+	__scm->reset.nr_resets = 1;
+	__scm->reset.of_node = pdev->dev.of_node;
+	ret = devm_reset_controller_register(&pdev->dev, &__scm->reset);
+	if (ret)
+		return ret;
+
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq < 0) {
 		if (irq != -ENXIO)
--
2.46.0


