Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D25F9C28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfKLVYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:24:01 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39224 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbfKLVXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BF25360D85; Tue, 12 Nov 2019 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593802;
        bh=nhAeTUEUZOtIr1aQoEJfNexTuZH1+kTL+/NP6LNQJnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QSYNw04H2cFBDztxGk5mJs0zaQ/okhl7dEke1+FhmEhhq0Upy27YaEtPIgypR+MmF
         hhcMur2QV2IaTzkRw4A0gYjdjoI6df8tTKb1k5ONciyaR7XlwlozNJUGsz9cTn+H5w
         EnNhWgOONHRK27FL7mSLlYnVO20BvwJeC9aPJDyY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 631A960CA5;
        Tue, 12 Nov 2019 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593790;
        bh=nhAeTUEUZOtIr1aQoEJfNexTuZH1+kTL+/NP6LNQJnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bpR7Z4A9ex0SuMJJobfEOZJj78e+qdunru8RQkun5044DT4trUgoiD7I/Uj1nee59
         ryQ/ovgLk33YP7kh/N0/G1I72EMRs3FqD5HlaPNHgIAgFRTwyEWIc3zbghBmDJkUbu
         ZF5CYFACenkn+KE8zn/KVHU8SyaisPpt7z5PhiBM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 631A960CA5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/18] firmware: qcom_scm-64: Add SCM results to descriptor
Date:   Tue, 12 Nov 2019 13:22:43 -0800
Message-Id: <1573593774-12539-8-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove knowledge of arm_smccc_res struct from client wrappers so that
client wrappers only work QCOM SCM data structures. SCM calls may have
up to 3 arguments, so qcom_scm_call_smccc is responsible now for filling
those 3 arguments accordingly.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 105 ++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 60 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index e81fb6e..f0a5f24 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -50,6 +50,7 @@ struct qcom_scm_desc {
 	u32 cmd;
 	u32 arginfo;
 	u64 args[MAX_QCOM_SCM_ARGS];
+	u64 result[MAX_QCOM_SCM_RETS];
 	u32 owner;
 };
 
@@ -115,8 +116,7 @@ static void qcom_scm_call_do_smccc(const struct qcom_scm_desc *desc,
 }
 
 static int ___qcom_scm_call_smccc(struct device *dev,
-				  const struct qcom_scm_desc *desc,
-				  struct arm_smccc_res *res, bool atomic)
+				  struct qcom_scm_desc *desc, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
@@ -125,6 +125,7 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
+	struct arm_smccc_res res;
 
 	if (unlikely(arglen > SMCCC_N_REG_ARGS)) {
 		alloc_len = SMCCC_N_EXT_ARGS * sizeof(u64);
@@ -158,15 +159,19 @@ static int ___qcom_scm_call_smccc(struct device *dev,
 		x5 = args_phys;
 	}
 
-	qcom_scm_call_do_smccc(desc, res, x5, atomic);
+	qcom_scm_call_do_smccc(desc, &res, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
 		kfree(args_virt);
 	}
 
-	if (res->a0 < 0)
-		return qcom_scm_remap_error(res->a0);
+	desc->result[0] = res.a1;
+	desc->result[1] = res.a2;
+	desc->result[2] = res.a3;
+
+	if (res.a0 < 0)
+		return qcom_scm_remap_error(res.a0);
 
 	return 0;
 }
@@ -181,11 +186,10 @@ static int ___qcom_scm_call_smccc(struct device *dev,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
  */
-static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
-			 struct arm_smccc_res *res)
+static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	might_sleep();
-	return ___qcom_scm_call_smccc(dev, desc, res, false);
+	return ___qcom_scm_call_smccc(dev, desc, false);
 }
 
 /**
@@ -199,11 +203,9 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
  */
-static int qcom_scm_call_atomic(struct device *dev,
-				const struct qcom_scm_desc *desc,
-				struct arm_smccc_res *res)
+static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
-	return ___qcom_scm_call_smccc(dev, desc, res, true);
+	return ___qcom_scm_call_smccc(dev, desc, true);
 }
 
 /**
@@ -254,15 +256,14 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
 	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
 			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
@@ -274,7 +275,6 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 		.cmd = QCOM_SCM_HDCP_INVOKE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
@@ -291,8 +291,8 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, &desc, &res);
-	*resp = res.a1;
+	ret = qcom_scm_call(dev, &desc);
+	*resp = desc.result[0];
 
 	return ret;
 }
@@ -324,14 +324,13 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? false : !!res.a1;
+	return ret ? false : !!desc.result[0];
 }
 
 int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
@@ -343,15 +342,14 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.args[1] = metadata_phys;
 	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
@@ -363,16 +361,15 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.args[1] = addr;
 	desc.args[2] = size;
 	desc.arginfo = QCOM_SCM_ARGS(3);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
@@ -383,14 +380,13 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
@@ -401,14 +397,13 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
@@ -418,16 +413,15 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = reset;
 	desc.args[1] = 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -437,16 +431,15 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = state;
 	desc.args[1] = id;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
@@ -459,7 +452,6 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 		.cmd = QCOM_SCM_MP_ASSIGN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = mem_region;
 	desc.args[1] = mem_sz;
@@ -473,9 +465,9 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
@@ -485,16 +477,15 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 		.cmd = QCOM_SCM_MP_RESTORE_SEC_CFG,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = device_id;
 	desc.args[1] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
@@ -505,18 +496,17 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = spare;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
 	if (size)
-		*size = res.a1;
+		*size = desc.result[0];
 
-	return ret ? : res.a2;
+	return ret ? : desc.result[1];
 }
 
 int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
@@ -527,7 +517,6 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = addr;
@@ -536,7 +525,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -552,13 +541,12 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc, &res);
+	return qcom_scm_call(dev, &desc);
 }
 
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
@@ -569,15 +557,14 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 		.cmd = QCOM_SCM_IO_READ,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = addr;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 	if (ret >= 0)
-		*val = res.a1;
+		*val = desc.result[0];
 
 	return ret < 0 ? ret : 0;
 }
@@ -589,13 +576,12 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 		.cmd = QCOM_SCM_IO_WRITE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = addr;
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc, &res);
+	return qcom_scm_call(dev, &desc);
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
@@ -605,11 +591,10 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
 	desc.args[1] = en;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(dev, &desc, &res);
+	return qcom_scm_call_atomic(dev, &desc);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

