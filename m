Return-Path: <linux-arm-msm+bounces-90539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBgrJHtUd2nMeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:48:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62F87CF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E0CD3004419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF54332EBF;
	Mon, 26 Jan 2026 11:47:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564EB3314C3;
	Mon, 26 Jan 2026 11:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428046; cv=none; b=LNrSi4vyBvJF7kqQ3wXRcbpMSHrnCY4+CEsh0tLXmCIRKDYDkxBNfG9ktTbZe9QQUmsDJJJDwGOXnthBlSEfBXoVTzf+P7P9Bjytfef2jL7TTTjM9k2YXJrJtSm4ayKjZ3J+EDgtqAWyPR+rh0nJHc5Of+dkMacmkcFgiBuPOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428046; c=relaxed/simple;
	bh=Q21Fx2Hu+D4JMyClzSR8puOfoq/ZqCVjMicA/UeaWhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z53wa+KDXfAKsv3ZVSLOUIbA0MRk5F0Z3qOi/p+ZYJLVe3ujRFFhf53srzIsQqb1tdXLUQ07c7DDTOCj40NBR20AiHxEPGwOjAIqs+rEFf8hWF1dnzcSEtTlJZHEBoIHNQjKOxhMRqVggvTiIBV3yvxQEx30KQo/SHO60Wlbx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1769427932tbb02073a
X-QQ-Originating-IP: wCXjarD80Q/CugS2IJGugSN3M4crF9NufmwewRf1LH8=
Received: from [127.0.1.1] ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Jan 2026 19:45:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7763489091627574520
EX-QQ-RecipientCnt: 10
From: Junhao Xie <bigfoot@radxa.com>
Date: Mon, 26 Jan 2026 19:44:51 +0800
Subject: [PATCH v2 1/2] firmware: qcom: scm: Add SCM storage interface
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
In-Reply-To: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>, 
 Junhao Xie <bigfoot@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769427927; l=8225;
 i=bigfoot@radxa.com; s=20251219; h=from:subject:message-id;
 bh=Q21Fx2Hu+D4JMyClzSR8puOfoq/ZqCVjMicA/UeaWhI=;
 b=LLjAFG49tx2yhebjw5CB8Jkoftv/XfVb2Vds1+ntvYKrFuMfwFFyVHXYgbl2qVMCsq96mu507
 pB33+dbgI2NDdxEhRV4jEbFyZRrcxhg1/mnh98TOt5Su3ao8eD35Aok
X-Developer-Key: i=bigfoot@radxa.com; a=ed25519;
 pk=aP5LX0jneuAa4pTVEww/6IbMlyp5VzzCwzcbMt1cpeI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OOpR7IuvaX669XBnab+uQ46wiCETEozsJGyVA2nr0p2tZIq75OpenzHQ
	VdaunM2sMfRK8qoPu3NloYMzIBb3iyr+1Zxtg+Zpwn1PuFWnN0VqBoYkC78aemX2mLv/5VS
	F2W8/DO99SNQvOkkTTBV/FeTgShxS7STXPLArvQ2DlY05VV1PSWopSI0FRzi2mxu8gOf6qD
	lRkXcglRmt3r1JQ96gRRc4YwJieLrhWOS67ZoxqMH/NLBsrqQnfPOLgmJptochDwwE4UVeH
	WALQ8Acm6QEZFTtWEQBTuFgmgyceXCuEVo13GczOrv6WVbmW9ILsTz8gNzK+WwXJYkntDcm
	i4TPfaDERlHr3idABIMMVIaQ3YNHwttDpdGdT/nhP0BOPehFDXyL4lHE2GjWMJA7RTuqjUk
	wHDC4+nGl7qtyfBkUwwH+c21IVnIECkgDPEQ1CZotNkk0EeVJAr0N2RI2HR2tuNeXewcXvF
	/pcA1cSDFMH8tE4h1Kc0uIjAPUXKlBKYJQCVch0nPfsNQq9yu1OBebdd/2pyLnyu2fdvKcE
	6YkjB4SVZgCjM2t3BFww9ja5H3EmWHIn9eosbmM9Kp1spMNvUzooTKBMQcvDpF7/d+Gk+AO
	9CGPm7cnlgTaVBLO6YDq5hU/IyTf6sKdzq3W57tOr9tdFkcCQi1hSxgf5I1sJ7+WvYNYW6m
	+bsEE4smQr2PiabD5SIpbpGww2jD4xJ8o6ZFsNP5Z9JSMhTi3eWEXa3hP1Bka+Te23ixeCg
	IfG9qkVb8oa7GpA7OnLSd5mD9DVKIAuz6um9qRwf8rPAe2KbEB24kJQMt7X97IsbTeFuxoZ
	8POL7tD/gB5b8zqiSxqywoQ9HG2k1aAcCwkqhhl3iIs8jnVhg523pjuk67qYuFAlUHXnUuu
	qcRfUy580uS3pshD/DfCa7GcHXL5SLRVSF12Ou3n5JTd/0dxRmA8v+iigYiWFLFSxuV7p/n
	taTF2qgoCQrYrOm+XBrpTzjA2vk+lrK52HQ1isLia4eSfd+Dv61Q5xxVQwd6noPjb0IQ5GY
	BTdFBLIp0AiRhQWOSIuZmrUS10s+fojcL+0sBi25aGrsBddqYIq2TdCSW2OQhp06WibegEI
	Wyp/nr0wsEP/HsyTgeX3GA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-90539-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 9B62F87CF7
X-Rspamd-Action: no action

Add infrastructure to support accessing TrustZone-protected storage
devices through SCM (Secure Channel Manager) calls. Some Qualcomm
platforms protect their firmware storage (typically SPI NOR flash)
via TrustZone, making it inaccessible from the non-secure world.

Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 161 +++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 include/linux/firmware/qcom/qcom_scm.h |  34 +++++++
 3 files changed, 198 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e46..f6e643cb1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -66,6 +66,27 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
+struct qcom_scm_storage_cmd {
+	__le64 storage_type;
+	__le64 slot_num;
+	__le64 lun;
+	__le64 guid_ptr;
+	__le64 storage_cmd;
+} __packed;
+
+struct qcom_scm_storage_cmd_details {
+	__le64 lba;
+	__le64 length;
+	__le64 data_ptr;
+	__le64 data_size;
+} __packed;
+
+struct qcom_scm_storage_payload {
+	struct qcom_scm_storage_cmd cmd;
+	struct qcom_scm_storage_cmd_details details;
+	u8 data[];
+};
+
 /**
  * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
  * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
@@ -111,6 +132,17 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+#define STORAGE_RESULT_SUCCESS			0
+#define STORAGE_RESULT_NO_MEMORY		1
+#define STORAGE_RESULT_INVALID_PARAMETER	2
+#define STORAGE_RESULT_STORAGE_ERROR		3
+#define STORAGE_RESULT_ACCESS_DENIED		4
+#define STORAGE_RESULT_NOT_SUPPORTED		5
+#define STORAGE_RESULT_MAC_MISMATCH		6
+#define STORAGE_RESULT_ALREADY_RUNNING		7
+#define STORAGE_RESULT_PARTITION_NOT_FOUND	8
+#define STORAGE_RESULT_READONLY			9
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -2198,6 +2230,132 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
 	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
 }
 
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *data, size_t size)
+{
+	struct qcom_scm_storage_payload *payload __free(qcom_tzmem) = NULL;
+	struct qcom_scm_res scm_res = {};
+	struct qcom_scm_desc desc = {};
+	phys_addr_t payload_addr;
+	size_t buf_size;
+	int ret;
+
+	buf_size = sizeof(*payload);
+	if (data)
+		buf_size += size;
+
+	payload = qcom_tzmem_alloc(__scm->mempool, buf_size, GFP_KERNEL);
+	if (!payload)
+		return -ENOMEM;
+
+	memset(payload, 0, buf_size);
+	if (data)
+		memcpy(payload->data, data, size);
+
+	payload->cmd.storage_type = cpu_to_le64(storage_type);
+	payload->cmd.storage_cmd = cpu_to_le64(cmd_id);
+
+	payload->details.lba = cpu_to_le64(lba);
+	if (payload) {
+		payload_addr = qcom_tzmem_to_phys(payload->data);
+		payload->details.data_ptr = cpu_to_le64(payload_addr);
+	}
+	payload->details.length = cpu_to_le64(size);
+
+	desc.svc = QCOM_SCM_SVC_STORAGE;
+	desc.cmd = QCOM_SCM_STORAGE_CMD;
+	desc.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RO, QCOM_SCM_VAL,
+				     QCOM_SCM_RW, QCOM_SCM_VAL);
+	desc.args[0] = qcom_tzmem_to_phys(&payload->cmd);
+	desc.args[1] = sizeof(payload->cmd);
+	desc.args[2] = qcom_tzmem_to_phys(&payload->details);
+	desc.args[3] = sizeof(payload->details);
+	desc.owner = ARM_SMCCC_OWNER_SIP;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &scm_res);
+	if (ret)
+		return ret;
+
+	if (data)
+		memcpy(data, payload->data, size);
+
+	switch (scm_res.result[0]) {
+	case STORAGE_RESULT_SUCCESS:
+		return 0;
+	case STORAGE_RESULT_NO_MEMORY:
+		return -ENOMEM;
+	case STORAGE_RESULT_INVALID_PARAMETER:
+		return -EINVAL;
+	case STORAGE_RESULT_STORAGE_ERROR:
+		return -EIO;
+	case STORAGE_RESULT_ACCESS_DENIED:
+		return -EACCES;
+	case STORAGE_RESULT_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case STORAGE_RESULT_MAC_MISMATCH:
+		return -EBADMSG;
+	case STORAGE_RESULT_ALREADY_RUNNING:
+		return -EALREADY;
+	case STORAGE_RESULT_PARTITION_NOT_FOUND:
+		return -ENOENT;
+	case STORAGE_RESULT_READONLY:
+		return -EROFS;
+	default:
+		return -EIO;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_scm_storage_send_cmd);
+
+static void qcom_scm_storage_free(void *data)
+{
+	struct platform_device *storage_dev = data;
+
+	platform_device_unregister(storage_dev);
+}
+
+static void qcom_scm_storage_init(struct qcom_scm *scm)
+{
+	struct qcom_scm_storage_info info;
+	struct platform_device *storage_dev;
+	u64 total_blocks;
+	u32 block_size;
+	int ret;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_STORAGE,
+					 QCOM_SCM_STORAGE_CMD))
+		return;
+
+	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					QCOM_SCM_STORAGE_GET_INFO,
+					0, &info, sizeof(info));
+	if (ret < 0) {
+		dev_warn(scm->dev, "scm storage get info failed: %d\n", ret);
+		return;
+	}
+
+	total_blocks = le64_to_cpu(info.total_blocks);
+	block_size = le32_to_cpu(info.block_size);
+
+	dev_dbg(scm->dev, "scm storage size %llu bytes\n",
+		total_blocks * block_size);
+
+	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
+	if (!storage_dev)
+		return;
+
+	storage_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(storage_dev);
+	if (ret) {
+		platform_device_put(storage_dev);
+		return;
+	}
+
+	devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
+				 storage_dev);
+}
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2433,6 +2591,9 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the QTEE object interface. */
 	qcom_scm_qtee_init(scm);
 
+	/* Initialize the SCM storage interface. */
+	qcom_scm_storage_init(scm);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212c..3b68b33c5 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
 
+#define QCOM_SCM_SVC_STORAGE			0x1a
+#define QCOM_SCM_STORAGE_CMD			0x01
+
 #define QCOM_SCM_SVC_WAITQ			0x24
 #define QCOM_SCM_WAITQ_RESUME			0x02
 #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca7712..644c3cf46 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
 	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
 };
 
+enum qcom_scm_storage_type {
+	QCOM_SCM_STORAGE_NULL    = 0,
+	QCOM_SCM_STORAGE_SPINOR  = 1,
+};
+
+enum qcom_scm_storage_cmd_id {
+	QCOM_SCM_STORAGE_INIT      = 0,
+	QCOM_SCM_STORAGE_READ      = 1,
+	QCOM_SCM_STORAGE_WRITE     = 2,
+	QCOM_SCM_STORAGE_ERASE     = 3,
+	QCOM_SCM_STORAGE_GET_INFO  = 4,
+	QCOM_SCM_STORAGE_DEINIT    = 5,
+};
+
+#define QCOM_SCM_STORAGE_FW_VER_LEN	32
+#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
+#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
+
+struct qcom_scm_storage_info {
+	__le64 total_blocks;
+	__le32 block_size;
+	__le32 page_size;
+	__le32 num_physical;
+	__le64 manufacturer_id;
+	__le64 serial_num;
+	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
+	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
+	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];
+} __packed;
+
 #define QCOM_SCM_PERM_READ       0x4
 #define QCOM_SCM_PERM_WRITE      0x2
 #define QCOM_SCM_PERM_EXEC       0x1
@@ -181,4 +211,8 @@ int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
 int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
 				    u64 *result, u64 *response_type);
 
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *payload, size_t size);
+
 #endif

-- 
2.52.0


