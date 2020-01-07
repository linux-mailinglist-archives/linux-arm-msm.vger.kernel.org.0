Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCA2133388
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgAGVTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:19:46 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:16165 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729090AbgAGVEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431087; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JcwYPYacYT78+Fl5rj+GKwkrygWFLpWWVyOYWzFIJ3c=; b=PUvV/aMn/6Gx9k0eofvISGjxAqs3tAoulydgA/Z3BzOhxDY/hgNsxAvPRGCEfjBs9SlHL0s6
 7fCvm0FPlkNxPl64u7YgpNM4V26ixvc4eYyHkv1o7EPf3PBhTEVCBSgLtCRNVY2+xp6goRz4
 fkYwWKzCsp4Zz98mtvpR65b27jM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f26d.7fb3768c54c8-smtp-out-n03;
 Tue, 07 Jan 2020 21:04:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27D15C447B1; Tue,  7 Jan 2020 21:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 954BBC447A3;
        Tue,  7 Jan 2020 21:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 954BBC447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/17] firmware: qcom_scm-64: Add SCM results struct
Date:   Tue,  7 Jan 2020 13:04:15 -0800
Message-Id: <1578431066-19600-7-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove knowledge of arm_smccc_res struct from client wrappers so that
client wrappers only work QCOM SCM data structures. SCM calls may have
up to 3 arguments, so qcom_scm_call_smccc is responsible now for filling
those 3 arguments accordingly. This is necessary to support merging
legacy and SMC conventions in an upcoming patch.

Change-Id: I9712f75f6bea0a6528ccd5a69bc1602493574e19
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 93 +++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 43 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 7b7aa88..e0e6530 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -45,7 +45,6 @@ enum qcom_scm_arg_types {
  * struct qcom_scm_desc
  * @arginfo:	Metadata describing the arguments in args[]
  * @args:	The array of arguments for the secure syscall
- * @res:	The values returned by the secure syscall
  */
 struct qcom_scm_desc {
 	u32 svc;
@@ -55,6 +54,14 @@ struct qcom_scm_desc {
 	u32 owner;
 };
 
+/**
+ * struct qcom_scm_res
+ * @result:	The values returned by the secure syscall
+ */
+struct qcom_scm_res {
+	u64 result[MAX_QCOM_SCM_RETS];
+};
+
 static u64 qcom_smccc_convention = -1;
 static DEFINE_MUTEX(qcom_scm_lock);
 
@@ -116,7 +123,7 @@ static void __scm_smc_do(const struct qcom_scm_desc *desc,
 }
 
 static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
-			  struct arm_smccc_res *res, bool atomic)
+			  struct qcom_scm_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
@@ -125,6 +132,7 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	void *args_virt = NULL;
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
+	struct arm_smccc_res smc_res;
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
 		alloc_len = SCM_SMC_N_EXT_ARGS * sizeof(u64);
@@ -158,17 +166,20 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		x5 = args_phys;
 	}
 
-	__scm_smc_do(desc, res, x5, atomic);
+	__scm_smc_do(desc, &smc_res, x5, atomic);
 
 	if (args_virt) {
 		dma_unmap_single(dev, args_phys, alloc_len, DMA_TO_DEVICE);
 		kfree(args_virt);
 	}
 
-	if ((long)res->a0 < 0)
-		return qcom_scm_remap_error(res->a0);
+	if (res) {
+		res->result[0] = smc_res.a1;
+		res->result[1] = smc_res.a2;
+		res->result[2] = smc_res.a3;
+	}
 
-	return 0;
+	return (long)smc_res.a0 ? qcom_scm_remap_error(smc_res.a0) : 0;
 }
 
 /**
@@ -182,7 +193,7 @@ static int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
  * This should *only* be called in pre-emptible context.
  */
 static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
-			 struct arm_smccc_res *res)
+			 struct qcom_scm_res *res)
 {
 	might_sleep();
 	return __scm_smc_call(dev, desc, res, false);
@@ -201,7 +212,7 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  */
 static int qcom_scm_call_atomic(struct device *dev,
 				const struct qcom_scm_desc *desc,
-				struct arm_smccc_res *res)
+				struct qcom_scm_res *res)
 {
 	return __scm_smc_call(dev, desc, res, true);
 }
@@ -254,7 +265,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
 	desc.args[0] = SCM_SMC_FNID(svc_id, cmd_id) |
@@ -262,7 +273,7 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
@@ -274,7 +285,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 		.cmd = QCOM_SCM_HDCP_INVOKE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
@@ -292,7 +303,7 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	desc.arginfo = QCOM_SCM_ARGS(10);
 
 	ret = qcom_scm_call(dev, &desc, &res);
-	*resp = res.a1;
+	*resp = res.result[0];
 
 	return ret;
 }
@@ -336,14 +347,14 @@ bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? false : !!res.a1;
+	return ret ? false : !!res.result[0];
 }
 
 int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
@@ -355,7 +366,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = peripheral;
 	desc.args[1] = metadata_phys;
@@ -363,7 +374,7 @@ int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
@@ -375,7 +386,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = peripheral;
 	desc.args[1] = addr;
@@ -384,7 +395,7 @@ int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
@@ -395,14 +406,14 @@ int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
@@ -413,14 +424,14 @@ int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = peripheral;
 	desc.arginfo = QCOM_SCM_ARGS(1);
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
@@ -430,7 +441,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 	int ret;
 
 	desc.args[0] = reset;
@@ -439,7 +450,7 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
@@ -449,7 +460,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 	int ret;
 
 	desc.args[0] = state;
@@ -458,7 +469,7 @@ int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
@@ -471,7 +482,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 		.cmd = QCOM_SCM_MP_ASSIGN,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 
 	desc.args[0] = mem_region;
 	desc.args[1] = mem_sz;
@@ -487,7 +498,7 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
@@ -497,7 +508,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 		.cmd = QCOM_SCM_MP_RESTORE_SEC_CFG,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 	int ret;
 
 	desc.args[0] = device_id;
@@ -506,7 +517,7 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id, u32 spare)
 
 	ret = qcom_scm_call(dev, &desc, &res);
 
-	return ret ? : res.a1;
+	return ret ? : res.result[0];
 }
 
 int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
@@ -517,7 +528,7 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 	int ret;
 
 	desc.args[0] = spare;
@@ -526,9 +537,9 @@ int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
 	ret = qcom_scm_call(dev, &desc, &res);
 
 	if (size)
-		*size = res.a1;
+		*size = res.result[0];
 
-	return ret ? : res.a2;
+	return ret ? : res.result[1];
 }
 
 int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
@@ -539,7 +550,6 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 		.cmd = QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 	int ret;
 
 	desc.args[0] = addr;
@@ -548,7 +558,7 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
 				     QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, &desc, &res);
+	ret = qcom_scm_call(dev, &desc, NULL);
 
 	/* the pg table has been initialized already, ignore the error */
 	if (ret == -EPERM)
@@ -564,13 +574,12 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
 	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc, &res);
+	return qcom_scm_call(dev, &desc, NULL);
 }
 
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
@@ -581,7 +590,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 		.cmd = QCOM_SCM_IO_READ,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
+	struct qcom_scm_res res;
 	int ret;
 
 	desc.args[0] = addr;
@@ -589,7 +598,7 @@ int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
 
 	ret = qcom_scm_call(dev, &desc, &res);
 	if (ret >= 0)
-		*val = res.a1;
+		*val = res.result[0];
 
 	return ret < 0 ? ret : 0;
 }
@@ -601,13 +610,12 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 		.cmd = QCOM_SCM_IO_WRITE,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = addr;
 	desc.args[1] = val;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call(dev, &desc, &res);
+	return qcom_scm_call(dev, &desc, NULL);
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
@@ -617,11 +625,10 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 		.cmd = QCOM_SCM_SMMU_CONFIG_ERRATA1,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
-	struct arm_smccc_res res;
 
 	desc.args[0] = QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL;
 	desc.args[1] = en;
 	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	return qcom_scm_call_atomic(dev, &desc, &res);
+	return qcom_scm_call_atomic(dev, &desc, NULL);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
