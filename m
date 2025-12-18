Return-Path: <linux-arm-msm+bounces-85739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E85CCD1A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 19:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A1B53011AB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F035505B;
	Thu, 18 Dec 2025 18:03:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA72355051;
	Thu, 18 Dec 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081004; cv=none; b=tj/T+XMpECQfzx4WPJ/DheYgI6C0DJQ3/6EAPdbxnaCci1beIl46gnBMhcreDcBkc9360JO5LDwa5Iw5O/AKsZ/8AlB2q58fzoISlM0iKmxxzEIWv24IozPGox4JCjt9Cx5s9jQqhinAgsGFCkvFsqOS1qsQitQ6v+sZJoBuAwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081004; c=relaxed/simple;
	bh=wfVBD4Vc3yV/0KYBjXQ5OKWNculmXF3g7gDq4yoK9/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoF/Od5mbRnPXDgzwLcPTjfTn+DugrgPakAtIAZJ29lUHKdIsYkyPF6btKuoudPY//+d6pcX5RA6u4NLHoutlSodCPjgOF6YlOwe1rEiKR+iOFBWM9k7yTAk8ppZNmFyVLJHLylysNZ8gZadvB51bO+VtElT3EwCFKgW18Dyn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz12t1766080957t6cdf7b4c
X-QQ-Originating-IP: 1O3gaj4ACK8WXXkB2Iw1cUX0B1+/aacB837MLA5+Y80=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8351619728533894091
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface support
Date: Fri, 19 Dec 2025 02:02:04 +0800
Message-ID: <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218180205.930961-1-bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NEaes6yu2o+m2o0BdQ9UqVNgONfAeMXAwpxXDAHIAxija5m2FORdHhGc
	zv1wEOgGq61CMOZwDW5fBJ9gPXKsoWTCwnxyf3RMVXrIBVAsHjDvOO9LzM53Nj6ihc96xMS
	RiAfMIPlB0MPDXTPThFl595NKtbs7PF7bWeE8BA/p7FhDgTZiO1h07y6a+2U+5Ce5Dic5Sy
	94nu5q06OeZbBbST1+/B4AMmBjpb5mY8JkPrb+2Hkq/6C+K+Z4n8z950OqKbeM3gUPxjXwI
	CnNZUua5VvgmnSGvptSt+yMN53v48fReKdtts1TKkMzqgRckK7xU/NU+6PfDMfvLOpUDIOB
	wprfTrGhv2k5ax43Rn39gBAXCzA3ryv2626Tw1jP99VQXqxMSJxsUHx58I2duBwYWjOQ7Wf
	KflV858OecnX3CODjHebk6K0Hq5LuI49rzb+cyBtzO+DYGFkp27+2PVm1NcygfRvrMrPt3P
	4AUDdBIvoLvgMb9ijipPv8O/nD4hheL08AETSSk0A8054PmZMDvzNLo1/T0gqjklu5TOEWE
	N1Yz1MDMgFVKzMIfNqODl0u5Jv8ANEwYUX/YRyZ8SpnI6uDDVFg4llyIYgpL6lC7r0AOs17
	yEq329sfUghuFmqolpfFlJ5bTzqWbCINuJXKx5f077ATCV1PSdRFo0Qbv+o3lsh3jORv3Q1
	/bQIj+yTkXr4S8ElBf3BHX0xRhqQU1w0Nb3aUDdMxtdLq916ssZIZdaYNZqqWo6LyMcEXLb
	0PE3Rgt+DANDhP46bDG+VeUNtJiHvA7m9aeOhunuqvFhjKgMll0aboWXRfxvJCUbx7t4gxT
	3DaTHQQFACKMbGRVHm+cu7aZe73g/XSA0Ssvo1o/6tC9XvNuGhbjzTQYrrNRIEfs/3riaSa
	k5ZwyWJVUsoZ1XKHeRI9R9p/vMH5GtKbYgXhrFMAcG5FdszjX+brQMF/+MYoaJaQ9uSZ64T
	qSv6Sp1PI8b3UxuDIHPftcFWdPaitiv6GDRfFSdUXTY2kVcTK4Eg5/FVshIyvmISxtgw=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Add infrastructure to support accessing TrustZone-protected storage
devices through SCM (Secure Channel Manager) calls. Some Qualcomm
platforms protect their firmware storage (typically SPI NOR flash)
via TrustZone, making it inaccessible from the non-secure world.

Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
validated. Additional platforms can be added as they are tested.

Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |   3 +
 include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
 3 files changed, 233 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 731074ca1ebbe..b117e1b58e363 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
 	__le64 mem_size;
 };
 
+struct qcom_scm_storage_cmd {
+	__le64 storage_type;
+	__le64 slot_num;
+	__le64 lun;
+	__le64 guid_ptr;
+	__le64 storage_cmd;
+};
+
+struct qcom_scm_storage_cmd_details {
+	__le64 lba;
+	__le64 length;
+	__le64 data_ptr;
+	__le64 data_size;
+};
+
 /**
  * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
  * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
@@ -111,6 +126,15 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_storage_result {
+	STORAGE_RESULT_SUCCESS			= 0,
+	STORAGE_RESULT_NO_MEMORY		= 1,
+	STORAGE_RESULT_INVALID_PARAMETER	= 2,
+	STORAGE_RESULT_STORAGE_ERROR		= 3,
+	STORAGE_RESULT_ACCESS_DENIED		= 4,
+	STORAGE_RESULT_NOT_SUPPORTED		= 5,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 #define SHMBRIDGE_RESULT_NOTSUPP		4
 
@@ -2214,6 +2238,159 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
 	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
 }
 
+#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
+
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *payload, size_t size)
+{
+	struct qcom_scm_res scm_res = {};
+	struct qcom_scm_desc desc = {};
+	struct qcom_scm_storage_cmd *cmd;
+	struct qcom_scm_storage_cmd_details *details;
+	size_t buf_size;
+	void *payload_buf;
+	int ret;
+
+	buf_size = sizeof(*cmd) + sizeof(*details);
+	if (payload)
+		buf_size += size;
+	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							 buf_size,
+							 GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	memset(data, 0, buf_size);
+	if (payload) {
+		payload_buf = data + sizeof(*cmd) + sizeof(*details);
+		memcpy(payload_buf, payload, size);
+	}
+
+	cmd = data;
+	cmd->storage_type = storage_type;
+	cmd->storage_cmd = cmd_id;
+
+	details = data + sizeof(*cmd);
+	details->lba = lba;
+	if (payload)
+		details->data_ptr = qcom_tzmem_to_phys(payload_buf);
+	details->length = size;
+
+	desc.svc = QCOM_SCM_SVC_STORAGE;
+	desc.cmd = QCOM_SCM_STORAGE_CMD;
+	desc.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RO, QCOM_SCM_VAL,
+				     QCOM_SCM_RW, QCOM_SCM_VAL);
+	desc.args[0] = qcom_tzmem_to_phys(cmd);
+	desc.args[1] = sizeof(*cmd);
+	desc.args[2] = qcom_tzmem_to_phys(details);
+	desc.args[3] = sizeof(*details);
+	desc.owner = ARM_SMCCC_OWNER_SIP;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &scm_res);
+	if (ret)
+		return ret;
+
+	if (payload)
+		memcpy(payload, payload_buf, size);
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
+	default:
+		return -EIO;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_scm_storage_send_cmd);
+
+/*
+ * Allowlist of platforms known to support and have tested SCM storage interface.
+ * This is a safety mechanism to prevent exposing potentially dangerous firmware
+ * access on untested platforms. New platforms should be added here after validation.
+ */
+static const struct of_device_id qcom_scm_storage_allowlist[] = {
+	{ .compatible = "radxa,dragon-q6a" },
+	{ }
+};
+
+static bool qcom_scm_storage_machine_is_allowed(void)
+{
+	struct device_node *np;
+	bool match;
+
+	np = of_find_node_by_path("/");
+	if (!np)
+		return false;
+
+	match = of_match_node(qcom_scm_storage_allowlist, np);
+	of_node_put(np);
+
+	return match;
+}
+
+static void qcom_scm_storage_free(void *data)
+{
+	struct platform_device *storage_dev = data;
+
+	platform_device_unregister(storage_dev);
+}
+
+static int qcom_scm_storage_init(struct qcom_scm *scm)
+{
+	struct qcom_scm_storage_info info;
+	struct platform_device *storage_dev;
+	int ret;
+
+	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					QCOM_SCM_STORAGE_GET_INFO,
+					0, &info, sizeof(info));
+	if (ret < 0) {
+		dev_info(scm->dev, "scm storage not available: %d\n", ret);
+		return 0;
+	}
+
+	if (!qcom_scm_storage_machine_is_allowed()) {
+		dev_info(scm->dev, "scm storage untested, skipping\n");
+		return 0;
+	}
+
+	dev_info(scm->dev, "scm storage size %llu bytes\n",
+		 info.total_blocks * info.block_size);
+
+	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
+	if (!storage_dev)
+		return -ENOMEM;
+
+	storage_dev->dev.parent = scm->dev;
+
+	ret = platform_device_add(storage_dev);
+	if (ret) {
+		platform_device_put(storage_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
+					storage_dev);
+}
+
+#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
+static int qcom_scm_storage_init(struct qcom_scm *scm)
+{
+	return 0;
+}
+
+#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
 /**
  * qcom_scm_is_available() - Checks if SCM is available
  */
@@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	/* Initialize the QTEE object interface. */
 	qcom_scm_qtee_init(scm);
 
+	/*
+	 * Initialize the SCM storage interface.
+	 */
+	ret = qcom_scm_storage_init(scm);
+	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c4..3b68b33c5ccc3 100644
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
index a55ca771286bf..41f799d8de54f 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
 	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
 };
 
+enum qcom_scm_storage_cmd_id {
+	QCOM_SCM_STORAGE_INIT      = 0,
+	QCOM_SCM_STORAGE_READ      = 1,
+	QCOM_SCM_STORAGE_WRITE     = 2,
+	QCOM_SCM_STORAGE_ERASE     = 3,
+	QCOM_SCM_STORAGE_GET_INFO  = 4,
+	QCOM_SCM_STORAGE_DEINIT    = 5,
+};
+
+enum qcom_scm_storage_type {
+	QCOM_SCM_STORAGE_NULL    = 0,
+	QCOM_SCM_STORAGE_SPINOR  = 1,
+};
+
+#define QCOM_SCM_STORAGE_FW_VER_LEN	32
+#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
+#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
+
+struct qcom_scm_storage_info {
+	u64 total_blocks;
+	u32 block_size;
+	u32 page_size;
+	u32 num_physical;
+	u64 manufacturer_id;
+	u64 serial_num;
+	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
+	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
+	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];
+} __packed;
+
 #define QCOM_SCM_PERM_READ       0x4
 #define QCOM_SCM_PERM_WRITE      0x2
 #define QCOM_SCM_PERM_EXEC       0x1
@@ -181,4 +211,21 @@ int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
 int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
 				    u64 *result, u64 *response_type);
 
+#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
+
+int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+			      enum qcom_scm_storage_cmd_id cmd_id,
+			      u64 lba, void *payload, size_t size);
+
+#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
+static inline int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
+					    enum qcom_scm_storage_cmd_id cmd_id,
+					    u64 lba, void *payload, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
+
 #endif
-- 
2.51.2


