Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3936EF2A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730410AbfKEB2A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:00 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbfKEB17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:59 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CF78860F35; Tue,  5 Nov 2019 01:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917278;
        bh=ElU3vjD1dUNh9uiYL0QrA8Uws9unwwY30YGTTSP/uHU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A+7obadOqASBM+TG1LMHBG61chPu8mxlJzKMO/tynmhWMNyIOI3XX/lxzcDJN1x+n
         8cLTHatPmZf3aVV5RgooTmdE8Qgki0zkzoxDRqMrik1e1mUmZjG8SMP+7xtKAGxKqv
         NSCQqTHDjWCcFfhV2QwosqhuwHYd28IhAnvtfNSk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 946F560EB7;
        Tue,  5 Nov 2019 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917272;
        bh=ElU3vjD1dUNh9uiYL0QrA8Uws9unwwY30YGTTSP/uHU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSdkQ4ONHfltNuwumTisQYgQ5IAKF3FaZoFpN3+4YOVgT9t7V7q1CZ2dvhpfYm8DH
         48BV6ASBh6ggSQvZye8u2n2qG6q0Y5u4PRxx2h/EUBgYw/IWULXEpuEjSxW/l8IYtM
         ILWMLSCTF3xai9TKamQZHojCuqRase6PZAPDTlSQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 946F560EB7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 06/17] firmware: qcom_scm-64: Add SCM results to descriptor
Date:   Mon,  4 Nov 2019 17:27:25 -0800
Message-Id: <1572917256-24205-7-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
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
index 76412a5..f6536fa 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -50,6 +50,7 @@ struct qcom_scm_desc {
 	u32 cmd;
 	u32 arginfo;
 	u64 args[MAX_QCOM_SCM_ARGS];
+	u64 res[MAX_QCOM_SCM_RETS];
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
+	desc->res[0] = res.a1;
+	desc->res[1] = res.a2;
+	desc->res[2] = res.a3;
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
@@ -253,16 +255,15 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
@@ -272,13 +273,12 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
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
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -289,14 +289,13 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? false : !!res.a1;
+	return ret ? false : !!desc.res[0];
 }
 
 int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
@@ -308,15 +307,14 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
@@ -328,16 +326,15 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
@@ -348,14 +345,13 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
@@ -366,14 +362,13 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
@@ -383,16 +378,15 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
@@ -403,15 +397,14 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
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
+		*val = desc.res[0];
 
 	return ret < 0 ? ret : 0;
 }
@@ -423,13 +416,12 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
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
 
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
@@ -440,15 +432,14 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
@@ -458,16 +449,15 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
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
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
@@ -478,18 +468,17 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
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
+		*size = desc.res[0];
 
-	return ret ? : res.a2;
+	return ret ? : desc.res[1];
 }
 
 int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
@@ -500,7 +489,6 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = addr;
@@ -509,7 +497,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -528,7 +516,6 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 		.cmd = QCOM_SCM_MP_ASSIGN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = mem_region;
 	desc.args[1] = mem_sz;
@@ -542,9 +529,9 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
 				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : res.a1;
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
@@ -556,7 +543,6 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 		.cmd = QCOM_SCM_HDCP_INVOKE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
@@ -573,8 +559,8 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.args[9] = req[4].val;
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
-	ret = qcom_scm_call(dev, &desc, &res);
-	*resp = res.a1;
+	ret = qcom_scm_call(dev, &desc);
+	*resp = desc.res[0];
 
 	return ret;
 }
@@ -586,13 +572,12 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
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
 
 void __qcom_scm_init(void)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

