Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27BBAE9045
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbfJ2TmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:42:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732589AbfJ2TlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9E9BF60EC7; Tue, 29 Oct 2019 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378075;
        bh=mwG0otl1m0KkcBEjjWxO1Pt2VtjKrDfNrsPsF8LcWBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HPyAtj1YJ2tu83KUibMeFKj5EqawoX5ordew7lkZMFBKmhxSd/Lf4RJzgpkHwAHIk
         wP6NVuv1h2TKLj7H/P8GXhBNQZ/avRqZKiU/EWeZ3pHDygKLr2doSy52loPVuQsnnr
         5C8rePp214aDrGcrguezxv82vZ39PWInJXF/OwhQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8386E60EC7;
        Tue, 29 Oct 2019 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378072;
        bh=mwG0otl1m0KkcBEjjWxO1Pt2VtjKrDfNrsPsF8LcWBA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BdHdK83c6+8sEy8b2akFoLw2YWsJsR3GIE5+WxLknd0iu7nreMBCKkE+VF1+WQq3W
         5fE79OR9CgBqsrZU9sBlqTvfEd4XS/tuWvUBWB/ux6tuccgrExlHnf/k3r3iyT48+O
         Bmb1adN4bL8fdP58oZoT2/l0u9Avns6ZBh9jg8C0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8386E60EC7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 03/17] firmware: qcom_scm: Order functions, definitions by service/command
Date:   Tue, 29 Oct 2019 12:40:51 -0700
Message-Id: <1572378065-4490-4-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Definitions throughout qcom_scm are loosely grouped and loosely ordered.
Sort all the functions/definitions by service ID/command ID to improve
sanity when needing to add new functionality to this driver.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 104 +++++++++----------
 drivers/firmware/qcom_scm-64.c | 192 +++++++++++++++++------------------
 drivers/firmware/qcom_scm.c    | 224 ++++++++++++++++++++---------------------
 drivers/firmware/qcom_scm.h    | 107 ++++++++++----------
 include/linux/qcom_scm.h       |  72 ++++++-------
 5 files changed, 350 insertions(+), 349 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index dee2129..240adfd 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -419,33 +419,28 @@ void __qcom_scm_cpu_power_down(u32 flags)
 			flags & QCOM_SCM_FLUSH_FLAG_MASK);
 }
 
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
+int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 {
+	struct {
+		__le32 state;
+		__le32 id;
+	} req;
+	__le32 scm_ret = 0;
 	int ret;
-	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
-	__le32 ret_val = 0;
-
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL,
-			    &svc_cmd, sizeof(svc_cmd), &ret_val,
-			    sizeof(ret_val));
-	if (ret)
-		return ret;
 
-	return le32_to_cpu(ret_val);
-}
+	req.state = cpu_to_le32(state);
+	req.id = cpu_to_le32(id);
 
-int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
-			u32 req_cnt, u32 *resp)
-{
-	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
-		return -ERANGE;
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
+			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
-		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
+	return ret ? : le32_to_cpu(scm_ret);
 }
 
-void __qcom_scm_init(void)
+int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
+				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -550,35 +545,37 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	return ret ? : le32_to_cpu(out);
 }
 
-int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
-{
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
-				     enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0, 0);
-}
-
-int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
+			unsigned int *val)
 {
-	struct {
-		__le32 state;
-		__le32 id;
-	} req;
-	__le32 scm_ret = 0;
 	int ret;
 
-	req.state = cpu_to_le32(state);
-	req.id = cpu_to_le32(id);
+	ret = qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
+	if (ret >= 0)
+		*val = ret;
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
-			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
+	return ret < 0 ? ret : 0;
+}
 
-	return ret ? : le32_to_cpu(scm_ret);
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+{
+	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+				     addr, val);
 }
 
-int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-			  size_t mem_sz, phys_addr_t src, size_t src_sz,
-			  phys_addr_t dest, size_t dest_sz)
+int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
-	return -ENODEV;
+	int ret;
+	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
+	__le32 ret_val = 0;
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL,
+			    &svc_cmd, sizeof(svc_cmd), &ret_val,
+			    sizeof(ret_val));
+	if (ret)
+		return ret;
+
+	return le32_to_cpu(ret_val);
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
@@ -599,25 +596,28 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	return -ENODEV;
 }
 
-int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
-			unsigned int *val)
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
 {
-	int ret;
-
-	ret = qcom_scm_call_atomic1(QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ, addr);
-	if (ret >= 0)
-		*val = ret;
-
-	return ret < 0 ? ret : 0;
+	return -ENODEV;
 }
 
-int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
+			u32 req_cnt, u32 *resp)
 {
-	return qcom_scm_call_atomic2(QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
-				     addr, val);
+	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
+		return -ERANGE;
+
+	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
+		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
 {
 	return -ENODEV;
 }
+
+void __qcom_scm_init(void)
+{
+}
\ No newline at end of file
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 520925d..ee0c950 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -246,68 +246,33 @@ void __qcom_scm_cpu_power_down(u32 flags)
 {
 }
 
-int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
+int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 {
-	int ret;
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
+	int ret;
 
-	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
-			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+	desc.args[0] = state;
+	desc.args[1] = id;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
 			    &desc, &res);
 
 	return ret ? : res.a1;
 }
 
-int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
-			u32 req_cnt, u32 *resp)
+int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 {
-	int ret;
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
-		return -ERANGE;
-
-	desc.args[0] = req[0].addr;
-	desc.args[1] = req[0].val;
-	desc.args[2] = req[1].addr;
-	desc.args[3] = req[1].val;
-	desc.args[4] = req[2].addr;
-	desc.args[5] = req[2].val;
-	desc.args[6] = req[3].addr;
-	desc.args[7] = req[3].val;
-	desc.args[8] = req[4].addr;
-	desc.args[9] = req[4].val;
-	desc.arginfo = QCOM_SCM_ARGS(10);
-
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
-			    &res);
-	*resp = res.a1;
-
-	return ret;
-}
-
-void __qcom_scm_init(void)
-{
-	u64 cmd;
-	struct arm_smccc_res res;
-	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL);
-
-	/* First try a SMC64 call */
-	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
-				 ARM_SMCCC_OWNER_SIP, function);
-
-	arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd & (~BIT(ARM_SMCCC_TYPE_SHIFT)),
-		      0, 0, 0, 0, 0, &res);
+	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
+	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	if (!res.a0 && res.a1)
-		qcom_smccc_convention = ARM_SMCCC_SMC_64;
-	else
-		qcom_smccc_convention = ARM_SMCCC_SMC_32;
+	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
+			     &desc, &res);
 }
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
@@ -408,44 +373,48 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 	return ret ? : res.a1;
 }
 
-int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
+int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
+			unsigned int *val)
 {
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 	int ret;
 
-	desc.args[0] = state;
-	desc.args[1] = id;
-	desc.arginfo = QCOM_SCM_ARGS(2);
+	desc.args[0] = addr;
+	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ,
 			    &desc, &res);
+	if (ret >= 0)
+		*val = res.a1;
 
-	return ret ? : res.a1;
+	return ret < 0 ? ret : 0;
 }
 
-int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-			  size_t mem_sz, phys_addr_t src, size_t src_sz,
-			  phys_addr_t dest, size_t dest_sz)
+int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 {
-	int ret;
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	desc.args[0] = mem_region;
-	desc.args[1] = mem_sz;
-	desc.args[2] = src;
-	desc.args[3] = src_sz;
-	desc.args[4] = dest;
-	desc.args[5] = dest_sz;
-	desc.args[6] = 0;
+	desc.args[0] = addr;
+	desc.args[1] = val;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
-				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
-				     QCOM_SCM_VAL, QCOM_SCM_VAL);
+	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
+			     &desc, &res);
+}
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
-			    QCOM_MP_ASSIGN,
+int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
+{
+	int ret;
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
+			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL,
 			    &desc, &res);
 
 	return ret ? : res.a1;
@@ -509,48 +478,60 @@ int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
 	return ret;
 }
 
-int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
+int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
+			  size_t mem_sz, phys_addr_t src, size_t src_sz,
+			  phys_addr_t dest, size_t dest_sz)
 {
+	int ret;
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	desc.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE;
-	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
-	desc.arginfo = QCOM_SCM_ARGS(2);
-
-	return qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_DLOAD_MODE,
-			     &desc, &res);
-}
-
-int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
-			unsigned int *val)
-{
-	struct qcom_scm_desc desc = {0};
-	struct arm_smccc_res res;
-	int ret;
+	desc.args[0] = mem_region;
+	desc.args[1] = mem_sz;
+	desc.args[2] = src;
+	desc.args[3] = src_sz;
+	desc.args[4] = dest;
+	desc.args[5] = dest_sz;
+	desc.args[6] = 0;
 
-	desc.args[0] = addr;
-	desc.arginfo = QCOM_SCM_ARGS(1);
+	desc.arginfo = QCOM_SCM_ARGS(7, QCOM_SCM_RO, QCOM_SCM_VAL,
+				     QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_RO,
+				     QCOM_SCM_VAL, QCOM_SCM_VAL);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_READ,
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
+			    QCOM_MP_ASSIGN,
 			    &desc, &res);
-	if (ret >= 0)
-		*val = res.a1;
 
-	return ret < 0 ? ret : 0;
+	return ret ? : res.a1;
 }
 
-int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
+int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
+			u32 req_cnt, u32 *resp)
 {
+	int ret;
 	struct qcom_scm_desc desc = {0};
 	struct arm_smccc_res res;
 
-	desc.args[0] = addr;
-	desc.args[1] = val;
-	desc.arginfo = QCOM_SCM_ARGS(2);
+	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
+		return -ERANGE;
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_IO, QCOM_SCM_IO_WRITE,
-			     &desc, &res);
+	desc.args[0] = req[0].addr;
+	desc.args[1] = req[0].val;
+	desc.args[2] = req[1].addr;
+	desc.args[3] = req[1].val;
+	desc.args[4] = req[2].addr;
+	desc.args[5] = req[2].val;
+	desc.args[6] = req[3].addr;
+	desc.args[7] = req[3].val;
+	desc.args[8] = req[4].addr;
+	desc.args[9] = req[4].val;
+	desc.arginfo = QCOM_SCM_ARGS(10);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE, &desc,
+			    &res);
+	*resp = res.a1;
+
+	return ret;
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
@@ -565,3 +546,22 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 	return qcom_scm_call_atomic(dev, QCOM_SCM_SVC_SMMU_PROGRAM,
 				    QCOM_SCM_SMMU_CONFIG_ERRATA1, &desc, &res);
 }
+
+void __qcom_scm_init(void)
+{
+	u64 cmd;
+	struct arm_smccc_res res;
+	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, QCOM_INFO_IS_CALL_AVAIL);
+
+	/* First try a SMC64 call */
+	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
+				 ARM_SMCCC_OWNER_SIP, function);
+
+	arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd & (~BIT(ARM_SMCCC_TYPE_SHIFT)),
+		      0, 0, 0, 0, 0, &res);
+
+	if (!res.a0 && res.a1)
+		qcom_smccc_convention = ARM_SMCCC_SMC_64;
+	else
+		qcom_smccc_convention = ARM_SMCCC_SMC_32;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0fc5c94..7244236 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -129,47 +129,33 @@ void qcom_scm_cpu_power_down(u32 flags)
 }
 EXPORT_SYMBOL(qcom_scm_cpu_power_down);
 
-/**
- * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
- *
- * Return true if HDCP is supported, false if not.
- */
-bool qcom_scm_hdcp_available(void)
+int qcom_scm_set_remote_state(u32 state, u32 id)
 {
-	int ret = qcom_scm_clk_enable();
-
-	if (ret)
-		return ret;
-
-	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
-						QCOM_SCM_HDCP_INVOKE);
-
-	qcom_scm_clk_disable();
-
-	return ret > 0 ? true : false;
+	return __qcom_scm_set_remote_state(__scm->dev, state, id);
 }
-EXPORT_SYMBOL(qcom_scm_hdcp_available);
+EXPORT_SYMBOL(qcom_scm_set_remote_state);
 
-/**
- * qcom_scm_hdcp_req() - Send HDCP request.
- * @req: HDCP request array
- * @req_cnt: HDCP request array count
- * @resp: response buffer passed to SCM
- *
- * Write HDCP register(s) through SCM.
- */
-int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
+static void qcom_scm_set_download_mode(bool enable)
 {
-	int ret = qcom_scm_clk_enable();
+	bool avail;
+	int ret = 0;
 
-	if (ret)
-		return ret;
+	avail = __qcom_scm_is_call_available(__scm->dev,
+					     QCOM_SCM_SVC_BOOT,
+					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
+	if (avail) {
+		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
+	} else if (__scm->dload_mode_addr) {
+		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
+					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
+	} else {
+		dev_err(__scm->dev,
+			"No available mechanism for setting download mode\n");
+	}
 
-	ret = __qcom_scm_hdcp_req(__scm->dev, req, req_cnt, resp);
-	qcom_scm_clk_disable();
-	return ret;
+	if (ret)
+		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
-EXPORT_SYMBOL(qcom_scm_hdcp_req);
 
 /**
  * qcom_scm_pas_supported() - Check if the peripheral authentication service is
@@ -327,30 +313,6 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 	.deassert = qcom_scm_pas_reset_deassert,
 };
 
-int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
-{
-	return __qcom_scm_restore_sec_cfg(__scm->dev, device_id, spare);
-}
-EXPORT_SYMBOL(qcom_scm_restore_sec_cfg);
-
-int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
-{
-	return __qcom_scm_iommu_secure_ptbl_size(__scm->dev, spare, size);
-}
-EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_size);
-
-int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
-{
-	return __qcom_scm_iommu_secure_ptbl_init(__scm->dev, addr, size, spare);
-}
-EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
-
-int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
-{
-	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
-}
-EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
-
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
 {
 	return __qcom_scm_io_readl(__scm->dev, addr, val);
@@ -363,68 +325,23 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
 }
 EXPORT_SYMBOL(qcom_scm_io_writel);
 
-static void qcom_scm_set_download_mode(bool enable)
-{
-	bool avail;
-	int ret = 0;
-
-	avail = __qcom_scm_is_call_available(__scm->dev,
-					     QCOM_SCM_SVC_BOOT,
-					     QCOM_SCM_BOOT_SET_DLOAD_MODE);
-	if (avail) {
-		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
-	} else if (__scm->dload_mode_addr) {
-		ret = __qcom_scm_io_writel(__scm->dev, __scm->dload_mode_addr,
-					   enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
-	} else {
-		dev_err(__scm->dev,
-			"No available mechanism for setting download mode\n");
-	}
-
-	if (ret)
-		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
-}
-
-static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
+int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 {
-	struct device_node *tcsr;
-	struct device_node *np = dev->of_node;
-	struct resource res;
-	u32 offset;
-	int ret;
-
-	tcsr = of_parse_phandle(np, "qcom,dload-mode", 0);
-	if (!tcsr)
-		return 0;
-
-	ret = of_address_to_resource(tcsr, 0, &res);
-	of_node_put(tcsr);
-	if (ret)
-		return ret;
-
-	ret = of_property_read_u32_index(np, "qcom,dload-mode", 1, &offset);
-	if (ret < 0)
-		return ret;
-
-	*addr = res.start + offset;
-
-	return 0;
+	return __qcom_scm_restore_sec_cfg(__scm->dev, device_id, spare);
 }
+EXPORT_SYMBOL(qcom_scm_restore_sec_cfg);
 
-/**
- * qcom_scm_is_available() - Checks if SCM is available
- */
-bool qcom_scm_is_available(void)
+int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
-	return !!__scm;
+	return __qcom_scm_iommu_secure_ptbl_size(__scm->dev, spare, size);
 }
-EXPORT_SYMBOL(qcom_scm_is_available);
+EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_size);
 
-int qcom_scm_set_remote_state(u32 state, u32 id)
+int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 {
-	return __qcom_scm_set_remote_state(__scm->dev, state, id);
+	return __qcom_scm_iommu_secure_ptbl_init(__scm->dev, addr, size, spare);
 }
-EXPORT_SYMBOL(qcom_scm_set_remote_state);
+EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
 
 /**
  * qcom_scm_assign_mem() - Make a secure call to reassign memory ownership
@@ -508,6 +425,89 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 }
 EXPORT_SYMBOL(qcom_scm_assign_mem);
 
+/**
+ * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
+ *
+ * Return true if HDCP is supported, false if not.
+ */
+bool qcom_scm_hdcp_available(void)
+{
+	int ret = qcom_scm_clk_enable();
+
+	if (ret)
+		return ret;
+
+	ret = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
+						QCOM_SCM_HDCP_INVOKE);
+
+	qcom_scm_clk_disable();
+
+	return ret > 0 ? true : false;
+}
+EXPORT_SYMBOL(qcom_scm_hdcp_available);
+
+/**
+ * qcom_scm_hdcp_req() - Send HDCP request.
+ * @req: HDCP request array
+ * @req_cnt: HDCP request array count
+ * @resp: response buffer passed to SCM
+ *
+ * Write HDCP register(s) through SCM.
+ */
+int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
+{
+	int ret = qcom_scm_clk_enable();
+
+	if (ret)
+		return ret;
+
+	ret = __qcom_scm_hdcp_req(__scm->dev, req, req_cnt, resp);
+	qcom_scm_clk_disable();
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_hdcp_req);
+
+int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+{
+	return __qcom_scm_qsmmu500_wait_safe_toggle(__scm->dev, en);
+}
+EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
+
+/**
+ * qcom_scm_is_available() - Checks if SCM is available
+ */
+bool qcom_scm_is_available(void)
+{
+	return !!__scm;
+}
+EXPORT_SYMBOL(qcom_scm_is_available);
+
+static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
+{
+	struct device_node *tcsr;
+	struct device_node *np = dev->of_node;
+	struct resource res;
+	u32 offset;
+	int ret;
+
+	tcsr = of_parse_phandle(np, "qcom,dload-mode", 0);
+	if (!tcsr)
+		return 0;
+
+	ret = of_address_to_resource(tcsr, 0, &res);
+	of_node_put(tcsr);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32_index(np, "qcom,dload-mode", 1, &offset);
+	if (ret < 0)
+		return ret;
+
+	*addr = res.start + offset;
+
+	return 0;
+}
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_scm *scm;
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 7bc8566..6f63ca6 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -4,54 +4,74 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
-#define QCOM_SCM_SVC_BOOT		0x1
-#define QCOM_SCM_BOOT_SET_ADDR		0x1
+#define QCOM_SCM_SVC_BOOT			0x01
+#define QCOM_SCM_BOOT_SET_ADDR			0x01
+#define QCOM_SCM_BOOT_TERMINATE_PC		0x02
+#define QCOM_SCM_BOOT_SET_REMOTE_STATE		0x0a
 #define QCOM_SCM_BOOT_SET_DLOAD_MODE		0x10
-#define QCOM_SCM_BOOT_SET_REMOTE_STATE	0xa
-extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
-extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
-
+extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 extern int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 		const cpumask_t *cpus);
-extern int __qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
-
-#define QCOM_SCM_BOOT_TERMINATE_PC	0x2
-#define QCOM_SCM_FLUSH_FLAG_MASK	0x3
 extern void __qcom_scm_cpu_power_down(u32 flags);
+extern int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id);
+extern int __qcom_scm_set_dload_mode(struct device *dev, bool enable);
+#define QCOM_SCM_FLUSH_FLAG_MASK	0x3
+
+#define QCOM_SCM_SVC_PIL			0x02
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE		0x01
+#define QCOM_SCM_PIL_PAS_MEM_SETUP		0x02
+#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET		0x05
+#define QCOM_SCM_PIL_PAS_SHUTDOWN		0x06
+#define QCOM_SCM_PIL_PAS_IS_SUPPORTED		0x07
+#define QCOM_SCM_PIL_PAS_MSS_RESET		0x0a
+extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
+		dma_addr_t metadata_phys);
+extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
+		phys_addr_t addr, phys_addr_t size);
+extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
+extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
 
-#define QCOM_SCM_SVC_IO			0x5
-#define QCOM_SCM_IO_READ		0x1
-#define QCOM_SCM_IO_WRITE		0x2
+#define QCOM_SCM_SVC_IO				0x05
+#define QCOM_SCM_IO_READ			0x01
+#define QCOM_SCM_IO_WRITE			0x02
 extern int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr, unsigned int *val);
 extern int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val);
 
-#define QCOM_SCM_SVC_INFO		0x6
-#define QCOM_INFO_IS_CALL_AVAIL		0x1
+#define QCOM_SCM_SVC_INFO			0x06
+#define QCOM_INFO_IS_CALL_AVAIL			0x01
 extern int __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 		u32 cmd_id);
 
-#define QCOM_SCM_SVC_HDCP		0x11
-#define QCOM_SCM_HDCP_INVOKE		0x01
+#define QCOM_SCM_SVC_MP				0x0c
+#define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
+#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
+#define QCOM_MP_ASSIGN				0x16
+extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
+				      u32 spare);
+extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
+					     size_t *size);
+extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
+					     u32 size, u32 spare);
+extern int  __qcom_scm_assign_mem(struct device *dev,
+				  phys_addr_t mem_region, size_t mem_sz,
+				  phys_addr_t src, size_t src_sz,
+				  phys_addr_t dest, size_t dest_sz);
+
+#define QCOM_SCM_SVC_HDCP			0x11
+#define QCOM_SCM_HDCP_INVOKE			0x01
 extern int __qcom_scm_hdcp_req(struct device *dev,
 		struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp);
 
-extern void __qcom_scm_init(void);
+#define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
+extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
+						bool enable);
+#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
 
-#define QCOM_SCM_SVC_PIL		0x2
-#define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x1
-#define QCOM_SCM_PIL_PAS_MEM_SETUP	0x2
-#define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x5
-#define QCOM_SCM_PIL_PAS_SHUTDOWN	0x6
-#define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x7
-#define QCOM_SCM_PIL_PAS_MSS_RESET		0xa
-extern bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
-		dma_addr_t metadata_phys);
-extern int  __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-		phys_addr_t addr, phys_addr_t size);
-extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
-extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
+extern void __qcom_scm_init(void);
 
 /* common error codes */
 #define QCOM_SCM_V2_EBUSY	-12
@@ -80,25 +100,4 @@ static inline int qcom_scm_remap_error(int err)
 	return -EINVAL;
 }
 
-#define QCOM_SCM_SVC_MP			0xc
-#define QCOM_SCM_MP_RESTORE_SEC_CFG	2
-extern int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
-				      u32 spare);
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	3
-#define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	4
-#define QCOM_SCM_SVC_SMMU_PROGRAM	0x15
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x3
-#define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x2
-extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
-					     size_t *size);
-extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
-					     u32 size, u32 spare);
-extern int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev,
-						bool enable);
-#define QCOM_MP_ASSIGN	0x16
-extern int  __qcom_scm_assign_mem(struct device *dev,
-				  phys_addr_t mem_region, size_t mem_sz,
-				  phys_addr_t src, size_t src_sz,
-				  phys_addr_t dest, size_t dest_sz);
-
 #endif
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 122cca6..a4dfab0 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -37,10 +37,8 @@ struct qcom_scm_vmperm {
 #if IS_ENABLED(CONFIG_QCOM_SCM)
 extern int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus);
 extern int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus);
-extern bool qcom_scm_is_available(void);
-extern bool qcom_scm_hdcp_available(void);
-extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
-			     u32 *resp);
+extern void qcom_scm_cpu_power_down(u32 flags);
+extern int qcom_scm_set_remote_state(u32 state, u32 id);
 extern bool qcom_scm_pas_supported(u32 peripheral);
 extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 				   size_t size);
@@ -48,58 +46,62 @@ extern int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 				  phys_addr_t size);
 extern int qcom_scm_pas_auth_and_reset(u32 peripheral);
 extern int qcom_scm_pas_shutdown(u32 peripheral);
-extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
-			       unsigned int *src,
-			       const struct qcom_scm_vmperm *newvm,
-			       unsigned int dest_cnt);
-extern void qcom_scm_cpu_power_down(u32 flags);
-extern u32 qcom_scm_get_version(void);
-extern int qcom_scm_set_remote_state(u32 state, u32 id);
+extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
+extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
+extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
+			       unsigned int *src,
+			       const struct qcom_scm_vmperm *newvm,
+			       int dest_cnt);
+extern bool qcom_scm_hdcp_available(void);
+extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
+			     u32 *resp);
 extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
-extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
-extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
+extern u32 qcom_scm_get_version(void);
+extern bool qcom_scm_is_available(void);
 #else
 
 #include <linux/errno.h>
 
 static inline
 int qcom_scm_set_cold_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	return -ENODEV;
-}
+		{ return -ENODEV; }
 static inline
 int qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
-{
-	return -ENODEV;
-}
-static inline bool qcom_scm_is_available(void) { return false; }
-static inline bool qcom_scm_hdcp_available(void) { return false; }
-static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
-				    u32 *resp) { return -ENODEV; }
+		{ return -ENODEV; }
+static inline void qcom_scm_cpu_power_down(u32 flags) {}
+static inline u32 qcom_scm_set_remote_state(u32 state, u32 id)
+		{ return -ENODEV; }
 static inline bool qcom_scm_pas_supported(u32 peripheral) { return false; }
 static inline int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 					  size_t size) { return -ENODEV; }
 static inline int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr,
 					 phys_addr_t size) { return -ENODEV; }
-static inline int
-qcom_scm_pas_auth_and_reset(u32 peripheral) { return -ENODEV; }
+static inline int qcom_scm_pas_auth_and_reset(u32 peripheral)
+		{ return -ENODEV; }
 static inline int qcom_scm_pas_shutdown(u32 peripheral) { return -ENODEV; }
+static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
+		{ return -ENODEV; }
+static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
+		{ return -ENODEV; }
+static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
+		{ return -ENODEV; }
+static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
+		{ return -ENODEV; }
+static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
+		{ return -ENODEV; }
 static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 				      unsigned int *src,
 				      const struct qcom_scm_vmperm *newvm,
-				      unsigned int dest_cnt) { return -ENODEV; }
-static inline void qcom_scm_cpu_power_down(u32 flags) {}
+				      int dest_cnt) { return -ENODEV; }
+static inline bool qcom_scm_hdcp_available(void) { return false; }
+static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
+				    u32 *resp) { return -ENODEV; }
+static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
+		{ return -ENODEV; }
 static inline u32 qcom_scm_get_version(void) { return 0; }
-static inline u32
-qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
-static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
-static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
-static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en) { return -ENODEV; }
-static inline int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val) { return -ENODEV; }
-static inline int qcom_scm_io_writel(phys_addr_t addr, unsigned int val) { return -ENODEV; }
+static inline bool qcom_scm_is_available(void) { return false; }
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

