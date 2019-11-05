Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C045BEF2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387442AbfKEB2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:10 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38096 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387399AbfKEB2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:09 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0BF0C60F8D; Tue,  5 Nov 2019 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917288;
        bh=ofhKsNnKQaZlPnuXspJNGImc9UspEeJOyaTAH0M9q1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c/q+3qvc5Vw+km+9nXMMt2JBWBw1OJ9VluenI/JStsEG4F87Id1NQlPxupswgqx+C
         A8hp1b9J00ucD6mXeSrQ1h6Yrv3bCfpzDRJ392RqAORG8lI8H4EcrignUOmid3KKn1
         v2VWbH0OIhmyOcRn8pJkVDjxItsMkQ58GtQ0nZK0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93AF960F94;
        Tue,  5 Nov 2019 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917278;
        bh=ofhKsNnKQaZlPnuXspJNGImc9UspEeJOyaTAH0M9q1g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ePBIVFpn9K/UiOng5jIcqOgjwIR+FQiX14PTdlTaZCN/OSdDJyuyASyTfljbSXmM+
         H8lIlWbSZPqlL9w6e1fSsT2bUBOWv4WUj1+k6vddpsWe4JPHRJsPT36/7qR1y2r/S+
         CTJaHHKPVD4Ho5VYunrX5bs8TPGjAD2T+qle9gKg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93AF960F94
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 11/17] firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
Date:   Mon,  4 Nov 2019 17:27:30 -0800
Message-Id: <1572917256-24205-12-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use qcom_scm_desc in non-atomic calls to remove legacy convention
details from every SCM wrapper function.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 271 ++++++++++++++++++++++++++---------------
 1 file changed, 170 insertions(+), 101 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index e3dc9a7..33effed 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -39,6 +39,46 @@ static struct qcom_scm_entry qcom_scm_wb[] = {
 
 static DEFINE_MUTEX(qcom_scm_lock);
 
+#define MAX_QCOM_SCM_ARGS 10
+#define MAX_QCOM_SCM_RETS 3
+
+enum qcom_scm_arg_types {
+	QCOM_SCM_VAL,
+	QCOM_SCM_RO,
+	QCOM_SCM_RW,
+	QCOM_SCM_BUFVAL,
+};
+
+#define QCOM_SCM_ARGS_IMPL(num, a, b, c, d, e, f, g, h, i, j, ...) (\
+			   (((a) & 0x3) << 4) | \
+			   (((b) & 0x3) << 6) | \
+			   (((c) & 0x3) << 8) | \
+			   (((d) & 0x3) << 10) | \
+			   (((e) & 0x3) << 12) | \
+			   (((f) & 0x3) << 14) | \
+			   (((g) & 0x3) << 16) | \
+			   (((h) & 0x3) << 18) | \
+			   (((i) & 0x3) << 20) | \
+			   (((j) & 0x3) << 22) | \
+			   ((num) & 0xf))
+
+#define QCOM_SCM_ARGS(...) QCOM_SCM_ARGS_IMPL(__VA_ARGS__, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
+
+/**
+ * struct qcom_scm_desc
+ * @arginfo:	Metadata describing the arguments in args[]
+ * @args:	The array of arguments for the secure syscall
+ * @res:	The values returned by the secure syscall
+ */
+struct qcom_scm_desc {
+	u32 svc;
+	u32 cmd;
+	u32 arginfo;
+	u64 args[MAX_QCOM_SCM_ARGS];
+	u64 res[MAX_QCOM_SCM_RETS];
+	u32 owner;
+};
+
 #define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
 
 /**
@@ -150,15 +190,19 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
  * and response buffers is taken care of by qcom_scm_call; however, callers are
  * responsible for any other cached buffers passed over to the secure world.
  */
-static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
-			 const void *cmd_buf, size_t cmd_len, void *resp_buf,
-			 size_t resp_len)
+static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
+	int arglen = desc->arginfo & 0xf;
 	int ret;
+	size_t i;
 	struct legacy_command *cmd;
 	struct legacy_response *rsp;
+	const size_t cmd_len = arglen * sizeof(__le32);
+	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
 	dma_addr_t cmd_phys;
+	__le32 *arg_buf;
+	__le32 *res_buf;
 
 	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
 	if (!cmd)
@@ -167,10 +211,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 	cmd->len = cpu_to_le32(alloc_len);
 	cmd->buf_offset = cpu_to_le32(sizeof(*cmd));
 	cmd->resp_hdr_offset = cpu_to_le32(sizeof(*cmd) + cmd_len);
+	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(desc->svc, desc->cmd));
 
-	cmd->id = cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
-	if (cmd_buf)
-		memcpy(legacy_get_command_buffer(cmd), cmd_buf, cmd_len);
+	arg_buf = legacy_get_command_buffer(cmd);
+	for (i = 0; i < arglen; i++)
+		arg_buf[i] = cpu_to_le32(desc->args[i]);
 
 	rsp = legacy_command_to_response(cmd);
 
@@ -193,13 +238,13 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
 					sizeof(*rsp), DMA_FROM_DEVICE);
 	} while (!rsp->is_complete);
 
-	if (resp_buf) {
-		dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
-					le32_to_cpu(rsp->buf_offset),
-					resp_len, DMA_FROM_DEVICE);
-		memcpy(resp_buf, legacy_get_response_buffer(rsp),
-		       resp_len);
-	}
+	dma_sync_single_for_cpu(dev, cmd_phys + sizeof(*cmd) + cmd_len +
+				le32_to_cpu(rsp->buf_offset),
+				resp_len, DMA_FROM_DEVICE);
+
+	res_buf = legacy_get_response_buffer(rsp);
+	for (i = 0; i < MAX_QCOM_SCM_RETS; i++)
+		desc->res[i] = le32_to_cpu(res_buf[i]);
 out:
 	dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
 	kfree(cmd);
@@ -301,10 +346,11 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 	int ret;
 	int flags = 0;
 	int cpu;
-	struct {
-		__le32 flags;
-		__le32 addr;
-	} cmd;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_ADDR,
+		.arginfo = QCOM_SCM_ARGS(2),
+	};
 
 	/*
 	 * Reassign only if we are switching from hotplug entry point
@@ -320,10 +366,9 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 	if (!flags)
 		return 0;
 
-	cmd.addr = cpu_to_le32(virt_to_phys(entry));
-	cmd.flags = cpu_to_le32(flags);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
-			    &cmd, sizeof(cmd), NULL, 0);
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	ret = qcom_scm_call(dev, &desc);
 	if (!ret) {
 		for_each_cpu(cpu, cpus)
 			qcom_scm_wb[cpu].entry = entry;
@@ -348,20 +393,20 @@ void __qcom_scm_cpu_power_down(u32 flags)
 
 int __qcom_scm_set_remote_state(struct device *dev, u32 state, u32 id)
 {
-	struct {
-		__le32 state;
-		__le32 id;
-	} req;
-	__le32 scm_ret = 0;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_BOOT,
+		.cmd = QCOM_SCM_BOOT_SET_REMOTE_STATE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	int ret;
 
-	req.state = cpu_to_le32(state);
-	req.id = cpu_to_le32(id);
+	desc.args[0] = state;
+	desc.args[1] = id;
+	desc.arginfo = QCOM_SCM_ARGS(2);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
-			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(scm_ret);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
@@ -372,104 +417,107 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 
 bool __qcom_scm_pas_supported(struct device *dev, u32 peripheral)
 {
-	__le32 out;
-	__le32 in;
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
-	in = cpu_to_le32(peripheral);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PIL_PAS_IS_SUPPORTED,
-			    &in, sizeof(in),
-			    &out, sizeof(out));
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
 
-	return ret ? false : !!out;
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? false : !!desc.res[0];
 }
 
 int __qcom_scm_pas_init_image(struct device *dev, u32 peripheral,
 			      dma_addr_t metadata_phys)
 {
-	__le32 scm_ret;
 	int ret;
-	struct {
-		__le32 proc;
-		__le32 image_addr;
-	} request;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
-	request.proc = cpu_to_le32(peripheral);
-	request.image_addr = cpu_to_le32(metadata_phys);
+	desc.args[0] = peripheral;
+	desc.args[1] = metadata_phys;
+	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PIL_PAS_INIT_IMAGE,
-			    &request, sizeof(request),
-			    &scm_ret, sizeof(scm_ret));
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(scm_ret);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_mem_setup(struct device *dev, u32 peripheral,
-			     phys_addr_t addr, phys_addr_t size)
+			      phys_addr_t addr, phys_addr_t size)
 {
-	__le32 scm_ret;
 	int ret;
-	struct {
-		__le32 proc;
-		__le32 addr;
-		__le32 len;
-	} request;
-
-	request.proc = cpu_to_le32(peripheral);
-	request.addr = cpu_to_le32(addr);
-	request.len = cpu_to_le32(size);
-
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PIL_PAS_MEM_SETUP,
-			    &request, sizeof(request),
-			    &scm_ret, sizeof(scm_ret));
-
-	return ret ? : le32_to_cpu(scm_ret);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	desc.args[0] = peripheral;
+	desc.args[1] = addr;
+	desc.args[2] = size;
+	desc.arginfo = QCOM_SCM_ARGS(3);
+
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral)
 {
-	__le32 out;
-	__le32 in;
 	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 
-	in = cpu_to_le32(peripheral);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
-			    &in, sizeof(in),
-			    &out, sizeof(out));
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(out);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral)
 {
-	__le32 out;
-	__le32 in;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	int ret;
 
-	in = cpu_to_le32(peripheral);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL,
-			    QCOM_SCM_PIL_PAS_SHUTDOWN,
-			    &in, sizeof(in),
-			    &out, sizeof(out));
+	desc.args[0] = peripheral;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(out);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
-	__le32 out;
-	__le32 in = cpu_to_le32(reset);
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_MSS_RESET,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
 	int ret;
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_PIL, QCOM_SCM_PIL_PAS_MSS_RESET,
-			&in, sizeof(in),
-			&out, sizeof(out));
+	desc.args[0] = reset;
+	desc.args[1] = 0;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(out);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
@@ -493,16 +541,16 @@ int __qcom_scm_io_writel(struct device *dev, phys_addr_t addr, unsigned int val)
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
-	__le32 svc_cmd = cpu_to_le32((svc_id << 10) | cmd_id);
-	__le32 ret_val = 0;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.args[0] = (svc_id << 10) | cmd_id,
+		.arginfo = QCOM_SCM_ARGS(1),
+	};
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
-			    &svc_cmd, sizeof(svc_cmd), &ret_val,
-			    sizeof(ret_val));
-	if (ret)
-		return ret;
+	ret = qcom_scm_call(dev, &desc);
 
-	return le32_to_cpu(ret_val);
+	return ret ? : desc.res[0];
 }
 
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
@@ -533,11 +581,32 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 			u32 req_cnt, u32 *resp)
 {
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_HDCP,
+		.cmd = QCOM_SCM_HDCP_INVOKE,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
 	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
 		return -ERANGE;
 
-	return qcom_scm_call(dev, QCOM_SCM_SVC_HDCP, QCOM_SCM_HDCP_INVOKE,
-		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
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
+	desc.arginfo = QCOM_SCM_ARGS(req_cnt * 2);
+
+	ret = qcom_scm_call(dev, &desc);
+	*resp = desc.res[0];
+
+	return ret;
 }
 
 int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool enable)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

