Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7D4F9C25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfKLVX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:29 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39404 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbfKLVX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:28 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EA9AA60EC7; Tue, 12 Nov 2019 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593807;
        bh=OweLmDKIb+NOEidQTgGNOokTWlrBfkD4d0RRcT5W/Q0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NDYUP6ZhzWp1RfO1LamD6c9ujcXz+ZUAK3W+X6LyvZzmBJpwQi/00To3iK5B2xTju
         8R1MZ3E7EQaaKUKMat2BBmu4CIF/AIKiF9Q4zP8GjVsTYtWoENPWiAukSiKRLnkMdT
         bpNMKQs0UjBer9bnmpNZv1YN3ImCVCxTIF+knmMY=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C47F560DA7;
        Tue, 12 Nov 2019 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593795;
        bh=OweLmDKIb+NOEidQTgGNOokTWlrBfkD4d0RRcT5W/Q0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kP+J0+w4GYFh+l7/oqZ/61qrjxqUKL7ptc+qkZSXRu/0rYIPGpKzvwK72qxhsb2H/
         IzvAUkhqKHuRfGQ25cJwada0uc9VQ4W7RFYxS0niUJprpDNrQN8yl0vRPDCR/uYnZf
         er63bS/12C0FQANa/MKPVvLuMm0diAYgME4LdGc4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C47F560DA7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/18] firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
Date:   Tue, 12 Nov 2019 13:22:48 -0800
Message-Id: <1573593774-12539-13-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use qcom_scm_desc in non-atomic calls to remove legacy convention
details from every SCM wrapper function.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 283 +++++++++++++++++++++++++----------------
 1 file changed, 172 insertions(+), 111 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index c3aeccf..4c287f6 100644
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
+	u64 result[MAX_QCOM_SCM_RETS];
+	u32 owner;
+};
+
 #define LEGACY_FUNCNUM(s, c)	(((s) << 10) | ((c) & 0x3ff))
 
 /**
@@ -135,16 +175,8 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
 }
 
 /**
- * qcom_scm_call() - Send an SCM command
- * @dev: struct device
- * @svc_id: service identifier
- * @cmd_id: command identifier
- * @cmd_buf: command buffer
- * @cmd_len: length of the command buffer
- * @resp_buf: response buffer
- * @resp_len: length of the response buffer
- *
- * Sends a command to the SCM and waits for the command to finish processing.
+ * qcom_scm_call() - Sends a command to the SCM and waits for the command to
+ * finish processing.
  *
  * A note on cache maintenance:
  * Note that any buffers that are expected to be accessed by the secure world
@@ -153,15 +185,19 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
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
 	struct qcom_scm_legacy_command *cmd;
 	struct qcom_scm_legacy_response *rsp;
+	const size_t cmd_len = arglen * sizeof(__le32);
+	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
 	dma_addr_t cmd_phys;
+	__le32 *arg_buf;
+	__le32 *res_buf;
 
 	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
 	if (!cmd)
@@ -170,10 +206,11 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
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
 
@@ -196,13 +233,13 @@ static int qcom_scm_call(struct device *dev, u32 svc_id, u32 cmd_id,
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
+		desc->result[i] = le32_to_cpu(res_buf[i]);
 out:
 	dma_unmap_single(dev, cmd_phys, alloc_len, DMA_TO_DEVICE);
 	kfree(cmd);
@@ -305,10 +342,10 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
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
+	};
 
 	/*
 	 * Reassign only if we are switching from hotplug entry point
@@ -324,10 +361,11 @@ int __qcom_scm_set_warm_boot_addr(struct device *dev, void *entry,
 	if (!flags)
 		return 0;
 
-	cmd.addr = cpu_to_le32(virt_to_phys(entry));
-	cmd.flags = cpu_to_le32(flags);
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
-			    &cmd, sizeof(cmd), NULL, 0);
+	desc.args[0] = flags;
+	desc.args[1] = virt_to_phys(entry);
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, &desc);
 	if (!ret) {
 		for_each_cpu(cpu, cpus)
 			qcom_scm_wb[cpu].entry = entry;
@@ -353,26 +391,47 @@ void __qcom_scm_cpu_power_down(u32 flags)
 int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 {
 	int ret;
-	__le32 svc_cmd = cpu_to_le32(LEGACY_FUNCNUM(svc_id, cmd_id));
-	__le32 ret_val = 0;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_INFO,
+		.cmd = QCOM_SCM_INFO_IS_CALL_AVAIL,
+		.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id),
+		.arginfo = QCOM_SCM_ARGS(1),
+	};
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_INFO, QCOM_SCM_INFO_IS_CALL_AVAIL,
-			    &svc_cmd, sizeof(svc_cmd), &ret_val,
-			    sizeof(ret_val));
-	if (ret)
-		return ret;
+	ret = qcom_scm_call(dev, &desc);
 
-	return le32_to_cpu(ret_val);
+	return ret ? : desc.result[0];
 }
 
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
+	desc.arginfo = QCOM_SCM_ARGS(10);
+
+	ret = qcom_scm_call(dev, &desc);
+	*resp = desc.result[0];
+
+	return ret;
 }
 
 void __qcom_scm_init(void)
@@ -381,104 +440,107 @@ void __qcom_scm_init(void)
 
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
+	return ret ? false : !!desc.result[0];
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
+	return ret ? : desc.result[0];
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
+	return ret ? : desc.result[0];
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
+	return ret ? : desc.result[0];
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
 
-	return ret ? : le32_to_cpu(out);
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.result[0];
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
 
-	return ret ? : le32_to_cpu(out);
+	ret = qcom_scm_call(dev, &desc);
+
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
@@ -489,20 +551,19 @@ int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
 
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
 
-	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_REMOTE_STATE,
-			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
+	ret = qcom_scm_call(dev, &desc);
 
-	return ret ? : le32_to_cpu(scm_ret);
+	return ret ? : desc.result[0];
 }
 
 int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

