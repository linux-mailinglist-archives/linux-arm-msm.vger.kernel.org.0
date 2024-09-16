Return-Path: <linux-arm-msm+bounces-31811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4B979D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC691F23708
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE11487DF;
	Mon, 16 Sep 2024 08:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KpB34tPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FCE1465AB;
	Mon, 16 Sep 2024 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477113; cv=none; b=VKJy8F2lJ3zKy7LrzWpqctqWmPYvXaZnLajrg2mbwhFLd09lMpwSekqdxdBR3j3CWmHczl2CQcLxb1f7CuLNgoTDo8xcd6Oc0lK3ScH4bE7xvl09qbsjQ0O+zE6sUSQ8+9WziQyYeY1qw6FpcKobWb7A6Fy5o1q3IlQ+NPiX2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477113; c=relaxed/simple;
	bh=kfmNI7t+mXtlDq4rnA9DLI4/9lz7ejYy9PMlDjZfUZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLR565eIH9Dl46IXnYfEARLfib73MjYYUAmuAJPDPLJ87eD2TRBzIWCy5vq+fRAkc8ifXpBSDcGSxiu+hRLloz8dr+sNHRpZQk3sAzPb69LUoP1Yc3gw8d/X4uwSj/wvEt9xvE5D3qINTf+AjqcL7pBY28tWUEDshF9S/cWX/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KpB34tPP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FMktaB019745;
	Mon, 16 Sep 2024 08:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRRmfJgp0h78Ygo0XZfbEophI+bvaQFaUDIwKSuIpMQ=; b=KpB34tPPLl+5FTU9
	6PtqhhbX/jHRAor1R1/lstVUX5IEAdYX2OgeganxugBck1adYtBQKBD8WbxvqG9n
	b/nW/vCL/bBg6SsAZREDj0qcLCGKIcQv1HYwBdk3wa8enFsKu47xZocEGo41SDve
	RmOpRb3Jqmg+eD6R2+TrcrpJf0CWXRSCkvXpN5iPo/hD/Fz+NBCRKbUtUV1H9ym8
	+/qhC7faC6uT1mFHMTUybyrX7Vl2ul1iy7OP4Ucxh2844kQ1OEkiMHvqjSOVFHPU
	hullUyoTG9KBDXjcJSoA3i/1wYrogBTsct7dMwS4s2SG/DbjHmpp4nE4YYonecDU
	a70G2w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4k0kdm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48G8wAOQ017834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 08:58:10 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Sep 2024 01:58:03 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <axboe@kernel.dk>, <song@kernel.org>, <yukuai3@huawei.com>,
        <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>,
        <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ritesh.list@gmail.com>, <ulf.hansson@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <kees@kernel.org>,
        <gustavoars@kernel.org>, <linux-block@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-raid@vger.kernel.org>,
        <dm-devel@lists.linux.dev>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Date: Mon, 16 Sep 2024 14:27:39 +0530
Message-ID: <20240916085741.1636554-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
References: <20240916085741.1636554-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qrADd5VqLVcjvylWOBOGQpNGuP_HkYXr
X-Proofpoint-GUID: qrADd5VqLVcjvylWOBOGQpNGuP_HkYXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160056

QCOM SDCC controller supports Inline Crypto Engine
This driver will enables inline encryption/decryption
for ICE. The algorithm supported by ICE are XTS(AES)
and CBC(AES).

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Added dm-inlinecrypt driver support

* squash the patch blk-crypto: Add additional algo modes for Inline
  encryption and md: dm-crypt: Add additional algo modes for inline
  encryption and added in this

Change in [v1]

* This patch was not included in [v1]

 block/blk-crypto.c           |  21 +++
 drivers/md/Kconfig           |   8 +
 drivers/md/Makefile          |   1 +
 drivers/md/dm-inline-crypt.c | 316 +++++++++++++++++++++++++++++++++++
 include/linux/blk-crypto.h   |   3 +
 5 files changed, 349 insertions(+)
 create mode 100644 drivers/md/dm-inline-crypt.c

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 4d760b092deb..e5bc3c7a405b 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -19,6 +19,12 @@
 #include "blk-crypto-internal.h"
 
 const struct blk_crypto_mode blk_crypto_modes[] = {
+	[BLK_ENCRYPTION_MODE_AES_128_XTS] = {
+		.name = "AES-128-XTS",
+		.cipher_str = "xts(aes)",
+		.keysize = 32,
+		.ivsize = 16,
+	},
 	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
 		.name = "AES-256-XTS",
 		.cipher_str = "xts(aes)",
@@ -43,6 +49,18 @@ const struct blk_crypto_mode blk_crypto_modes[] = {
 		.keysize = 32,
 		.ivsize = 16,
 	},
+	[BLK_ENCRYPTION_MODE_AES_128_CBC] = {
+		.name = "AES-128-CBC",
+		.cipher_str = "cbc(aes)",
+		.keysize = 16,
+		.ivsize = 16,
+	},
+	[BLK_ENCRYPTION_MODE_AES_256_CBC] = {
+		.name = "AES-256-CBC",
+		.cipher_str = "cbc(aes)",
+		.keysize = 32,
+		.ivsize = 16,
+	},
 };
 
 /*
@@ -106,6 +124,7 @@ void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
 
 	bio->bi_crypt_context = bc;
 }
+EXPORT_SYMBOL_GPL(bio_crypt_set_ctx);
 
 void __bio_crypt_free_ctx(struct bio *bio)
 {
@@ -356,6 +375,7 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(blk_crypto_init_key);
 
 bool blk_crypto_config_supported_natively(struct block_device *bdev,
 					  const struct blk_crypto_config *cfg)
@@ -398,6 +418,7 @@ int blk_crypto_start_using_key(struct block_device *bdev,
 		return 0;
 	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
+EXPORT_SYMBOL_GPL(blk_crypto_start_using_key);
 
 /**
  * blk_crypto_evict_key() - Evict a blk_crypto_key from a block_device
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 1e9db8e4acdf..272a6a3274bb 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -270,6 +270,14 @@ config DM_CRYPT
 
 	  If unsure, say N.
 
+config DM_INLINE_CRYPT
+	tristate "Inline crypt target support"
+	depends on BLK_DEV_DM || COMPILE_TEST
+	help
+	  This inline crypt device-mapper target allows to create a device
+	  that transparently encrypts the data on it using inline crypto HW
+	  engine.
+
 config DM_SNAPSHOT
        tristate "Snapshot target"
        depends on BLK_DEV_DM
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index 476a214e4bdc..0e09b7665803 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_DM_UNSTRIPED)	+= dm-unstripe.o
 obj-$(CONFIG_DM_BUFIO)		+= dm-bufio.o
 obj-$(CONFIG_DM_BIO_PRISON)	+= dm-bio-prison.o
 obj-$(CONFIG_DM_CRYPT)		+= dm-crypt.o
+obj-$(CONFIG_DM_INLINE_CRYPT)  += dm-inline-crypt.o
 obj-$(CONFIG_DM_DELAY)		+= dm-delay.o
 obj-$(CONFIG_DM_DUST)		+= dm-dust.o
 obj-$(CONFIG_DM_FLAKEY)		+= dm-flakey.o
diff --git a/drivers/md/dm-inline-crypt.c b/drivers/md/dm-inline-crypt.c
new file mode 100644
index 000000000000..e94f86a3a5e0
--- /dev/null
+++ b/drivers/md/dm-inline-crypt.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024, Qualcomm Innovation Center, Inc. All rights reserved
+ *
+ * Based on work by Israel Rukshin file: dm-crypt.c
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/crypto.h>
+#include <linux/blk-crypto.h>
+#include <linux/device-mapper.h>
+
+#define DM_MSG_PREFIX "inline-crypt"
+
+struct inlinecrypt_config {
+	struct dm_dev *dev;
+	sector_t start;
+	u64 iv_offset;
+	unsigned int iv_size;
+	unsigned short sector_size;
+	unsigned char sector_shift;
+	unsigned int key_size;
+	enum blk_crypto_mode_num crypto_mode;
+	struct blk_crypto_key *blk_key;
+	u8 key[] __counted_by(key_size);
+};
+
+#define DM_CRYPT_DEFAULT_MAX_READ_SIZE		131072
+#define DM_CRYPT_DEFAULT_MAX_WRITE_SIZE		131072
+
+static unsigned int get_max_request_size(struct inlinecrypt_config *cc, bool wrt)
+{
+	unsigned int val, sector_align;
+
+	val = !wrt ? DM_CRYPT_DEFAULT_MAX_READ_SIZE : DM_CRYPT_DEFAULT_MAX_WRITE_SIZE;
+	if (wrt) {
+		if (unlikely(val > BIO_MAX_VECS << PAGE_SHIFT))
+			val = BIO_MAX_VECS << PAGE_SHIFT;
+	}
+	sector_align = max(bdev_logical_block_size(cc->dev->bdev), (unsigned int)cc->sector_size);
+	val = round_down(val, sector_align);
+	if (unlikely(!val))
+		val = sector_align;
+	return val >> SECTOR_SHIFT;
+}
+
+static int crypt_select_inline_crypt_mode(struct dm_target *ti, char *cipher,
+					  char *ivmode)
+{
+	struct inlinecrypt_config *cc = ti->private;
+
+	if (strcmp(cipher, "xts(aes128)") == 0) {
+		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_128_XTS;
+	} else if (strcmp(cipher, "xts(aes256)") == 0) {
+		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_256_XTS;
+	} else if (strcmp(cipher, "cbc(aes128)") == 0) {
+		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_128_CBC;
+	} else if (strcmp(cipher, "cbc(aes256)") == 0) {
+		cc->crypto_mode = BLK_ENCRYPTION_MODE_AES_256_CBC;
+	} else {
+		ti->error = "Invalid cipher for inline_crypt";
+		return -EINVAL;
+	}
+
+	cc->iv_size = 4;
+
+	return 0;
+}
+
+static int crypt_prepare_inline_crypt_key(struct inlinecrypt_config *cc)
+{
+	int ret;
+
+	cc->blk_key = kzalloc(sizeof(*cc->blk_key), GFP_KERNEL);
+	if (!cc->blk_key)
+		return -ENOMEM;
+
+	ret = blk_crypto_init_key(cc->blk_key, cc->key, cc->crypto_mode,
+				  cc->iv_size, cc->sector_size);
+	if (ret) {
+		DMERR("Failed to init inline encryption key");
+		goto bad_key;
+	}
+
+	ret = blk_crypto_start_using_key(cc->dev->bdev, cc->blk_key);
+	if (ret) {
+		DMERR("Failed to use inline encryption key");
+		goto bad_key;
+	}
+
+	return 0;
+bad_key:
+	kfree_sensitive(cc->blk_key);
+	cc->blk_key = NULL;
+	return ret;
+}
+
+static void crypt_destroy_inline_crypt_key(struct inlinecrypt_config *cc)
+{
+	if (cc->blk_key) {
+		blk_crypto_evict_key(cc->dev->bdev, cc->blk_key);
+		kfree_sensitive(cc->blk_key);
+		cc->blk_key = NULL;
+	}
+}
+
+static void crypt_inline_encrypt_submit(struct dm_target *ti, struct bio *bio)
+{
+	struct inlinecrypt_config *cc = ti->private;
+	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
+
+	bio_set_dev(bio, cc->dev->bdev);
+	if (bio_sectors(bio)) {
+		memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
+		bio->bi_iter.bi_sector = cc->start +
+			dm_target_offset(ti, bio->bi_iter.bi_sector);
+		dun[0] = le64_to_cpu(bio->bi_iter.bi_sector + cc->iv_offset);
+		bio_crypt_set_ctx(bio, cc->blk_key, dun, GFP_KERNEL);
+	}
+
+	submit_bio_noacct(bio);
+}
+
+static int inlinecrypt_setkey(struct inlinecrypt_config *cc)
+{
+	crypt_destroy_inline_crypt_key(cc);
+
+	return crypt_prepare_inline_crypt_key(cc);
+
+	return 0;
+}
+
+static int inlinecrypt_set_key(struct inlinecrypt_config *cc, char *key)
+{
+	int r = -EINVAL;
+	int key_string_len = strlen(key);
+
+	/* Decode key from its hex representation. */
+	if (cc->key_size && hex2bin(cc->key, key, cc->key_size) < 0)
+		goto out;
+
+	r = inlinecrypt_setkey(cc);
+out:
+	memset(key, '0', key_string_len);
+
+	return r;
+}
+
+static void inlinecrypt_dtr(struct dm_target *ti)
+{
+	struct inlinecrypt_config *cc = ti->private;
+
+	ti->private = NULL;
+
+	if (!cc)
+		return;
+
+	crypt_destroy_inline_crypt_key(cc);
+
+	if (cc->dev)
+		dm_put_device(ti, cc->dev);
+
+	kfree_sensitive(cc);
+}
+
+static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
+{
+	struct inlinecrypt_config *cc;
+	char *cipher_api = NULL;
+	char *cipher, *chainmode;
+	unsigned long long tmpll;
+	char *ivmode;
+	int key_size;
+	char dummy;
+	int ret;
+
+	if (argc < 5) {
+		ti->error = "Not enough arguments";
+		return -EINVAL;
+	}
+
+	key_size = strlen(argv[1]) >> 1;
+
+	cc = kzalloc(struct_size(cc, key, key_size), GFP_KERNEL);
+	if (!cc) {
+		ti->error = "Cannot allocate encryption context";
+		return -ENOMEM;
+	}
+	cc->key_size = key_size;
+	cc->sector_size = (1 << SECTOR_SHIFT);
+	cc->sector_shift = 0;
+
+	ti->private = cc;
+
+	if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
+	    (tmpll & ((cc->sector_size >> SECTOR_SHIFT) - 1))) {
+		ti->error = "Invalid iv_offset sector";
+		goto bad;
+	}
+	cc->iv_offset = tmpll;
+
+	ret = dm_get_device(ti, argv[3], dm_table_get_mode(ti->table),
+			    &cc->dev);
+	if (ret) {
+		ti->error = "Device lookup failed";
+		goto bad;
+	}
+
+	ret = -EINVAL;
+	if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) != 1 ||
+	    tmpll != (sector_t)tmpll) {
+		ti->error = "Invalid device sector";
+		goto bad;
+	}
+
+	cc->start = tmpll;
+
+	cipher = strsep(&argv[0], "-");
+	chainmode = strsep(&argv[0], "-");
+	ivmode = strsep(&argv[0], "-");
+
+	cipher_api = kmalloc(CRYPTO_MAX_ALG_NAME, GFP_KERNEL);
+	if (!cipher_api)
+		goto bad;
+
+	ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
+		       "%s(%s)", chainmode, cipher);
+	if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
+		kfree(cipher_api);
+		ret = -ENOMEM;
+		goto bad;
+	}
+
+	ret = crypt_select_inline_crypt_mode(ti, cipher_api, ivmode);
+
+	/* Initialize and set key */
+	ret = inlinecrypt_set_key(cc, argv[1]);
+	if (ret < 0) {
+		ti->error = "Error decoding and setting key";
+		return ret;
+	}
+
+	return 0;
+bad:
+	ti->error = "Error in inlinecrypt mapping";
+	inlinecrypt_dtr(ti);
+	return ret;
+}
+
+static int inlinecrypt_map(struct dm_target *ti, struct bio *bio)
+{
+	struct inlinecrypt_config *cc = ti->private;
+	unsigned int max_sectors;
+
+	/*
+	 * If bio is REQ_PREFLUSH or REQ_OP_DISCARD, just bypass crypt queues.
+	 * - for REQ_PREFLUSH device-mapper core ensures that no IO is in-flight
+	 * - for REQ_OP_DISCARD caller must use flush if IO ordering matters
+	 */
+	if (unlikely(bio->bi_opf & REQ_PREFLUSH ||
+		     bio_op(bio) == REQ_OP_DISCARD)) {
+		bio_set_dev(bio, cc->dev->bdev);
+		if (bio_sectors(bio))
+			bio->bi_iter.bi_sector = cc->start +
+				dm_target_offset(ti, bio->bi_iter.bi_sector);
+		return DM_MAPIO_REMAPPED;
+	}
+
+	/*
+	 * Check if bio is too large, split as needed.
+	 */
+	max_sectors = get_max_request_size(cc, bio_data_dir(bio) == WRITE);
+	if (unlikely(bio_sectors(bio) > max_sectors))
+		dm_accept_partial_bio(bio, max_sectors);
+
+	/*
+	 * Ensure that bio is a multiple of internal sector eninlinecryption size
+	 * and is aligned to this size as defined in IO hints.
+	 */
+	if (unlikely((bio->bi_iter.bi_sector & ((cc->sector_size >> SECTOR_SHIFT) - 1)) != 0))
+		return DM_MAPIO_KILL;
+
+	if (unlikely(bio->bi_iter.bi_size & (cc->sector_size - 1)))
+		return DM_MAPIO_KILL;
+
+	crypt_inline_encrypt_submit(ti, bio);
+		return DM_MAPIO_SUBMITTED;
+
+	return 0;
+}
+
+static int inlinecrypt_iterate_devices(struct dm_target *ti,
+				       iterate_devices_callout_fn fn, void *data)
+{
+	struct inlinecrypt_config *cc = ti->private;
+
+	return fn(ti, cc->dev, cc->start, ti->len, data);
+}
+
+static struct target_type inlinecrypt_target = {
+	.name   = "inline-crypt",
+	.version = {1, 0, 0},
+	.module = THIS_MODULE,
+	.ctr    = inlinecrypt_ctr,
+	.dtr    = inlinecrypt_dtr,
+	.map    = inlinecrypt_map,
+	.iterate_devices = inlinecrypt_iterate_devices,
+};
+module_dm(inlinecrypt);
+
+MODULE_AUTHOR("Md Sadre Alam <quic_mdalam@quicinc.com>");
+MODULE_DESCRIPTION(DM_NAME " target for inline encryption / decryption");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 5e5822c18ee4..da503a05c5f6 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -10,10 +10,13 @@
 
 enum blk_crypto_mode_num {
 	BLK_ENCRYPTION_MODE_INVALID,
+	BLK_ENCRYPTION_MODE_AES_128_XTS,
 	BLK_ENCRYPTION_MODE_AES_256_XTS,
 	BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV,
 	BLK_ENCRYPTION_MODE_ADIANTUM,
 	BLK_ENCRYPTION_MODE_SM4_XTS,
+	BLK_ENCRYPTION_MODE_AES_128_CBC,
+	BLK_ENCRYPTION_MODE_AES_256_CBC,
 	BLK_ENCRYPTION_MODE_MAX,
 };
 
-- 
2.34.1


