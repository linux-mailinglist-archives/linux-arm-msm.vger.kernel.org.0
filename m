Return-Path: <linux-arm-msm+bounces-70611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A280BB33C72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56C817AD52F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DFA2DAFB1;
	Mon, 25 Aug 2025 10:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzlVZzg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA5413D891
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117194; cv=none; b=jWJvvcNUlDgY+LL/tgjhqHRjJo5GBKzMjDC3Rf3cO43CqgvxNxD2W19xApgXlvYKiojIkD8l1tP+6j0Iz9eF202sz6bh7PqjpW5OLcWQqNhhhzNlYhUGi2Xu89nL0/m4244F1RKmw6BsNJQMeNgGflH0cbWBFGwSrNzwsn7VoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117194; c=relaxed/simple;
	bh=WjK+sjBq9iv6cja5cC4KCPkiYgaTxTFKhaWsrXY3lRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=taTaJXS+WNugofF02v+GTxPO9meACPksuFgmo44JWESexUl6cNm5OmFFjzTu3i+ZlZD4Ut7o9oq4P4IY3OoGnBn4msCVW11z5Lo2xttNGpKzCJgwiw2pRPlKtmxwVXJQu3paBIf9xBVpF3jNCfK5DVufaaU23mCIVfEFj7UoBV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzlVZzg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8uMPU028160
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZQglKj048IV
	27zKWrG9fW/y2Bx813+e0lbvmeG0IEV4=; b=DzlVZzg+/M5KWNejQQ87zsfOvPW
	JYMahtS8w9cE5O8YaPZ9axMkHEFWcF48LEmQMpQKF59PQE/qCGknv+n1BJRO83Ru
	TcVb/mYxEqIsmdeOLdBUS4/yPQlTM25R48ICpHT6a40S3pEWAsCclzMATnRG0aLo
	tFnXLUlc78aRPX+Xsjc8PDF4vjPG1ywHsC5HMmMquw3cOdG3pj0MSG6197SXubiR
	8SykyvKCtY6nGEIVqIrLvAZJmm2xn2HksWpwsZyqs8N9FY0BLKTZWxfPsRMkcW8Y
	xi7WiYg9QaN7FNqi/XhVwmGuv/Ip9J1ekX1rxjmsFN9TQnQsRcKKFE+Fy/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4mj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24680b1905fso17610495ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117189; x=1756721989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQglKj048IV27zKWrG9fW/y2Bx813+e0lbvmeG0IEV4=;
        b=vRN3PWtQgbCjQAjztIFZAULoILgPXE4QPE1yhorxnPgBVnV0obCSOKVcsKQJ4z8v5X
         2se1Ay7EwOCtPVi0dTH8iuPXJbw9F9XYTi71WN1MsWhvbDF2BXK0c7FnSpjM+o7Nynua
         uwFCRjs4e7ZTOIKo/c54cp4EtFqTxJHCFX3PFxk9LRZlrOjJRenFsW9I6KfJ4Yxosaiy
         Yw3mvuxKrdJPQE7xIJAwRPeb35KTbnPQM1xRLCU66q8QUYTHAoMHu3FxSt5YRb2uEk6g
         bSTuKSL36pYVL41SbY6R/ufukrjWPJ66kSy27n1EvOELQ+RdOhmpW0xfQg4AvDZIQo3q
         YdtA==
X-Forwarded-Encrypted: i=1; AJvYcCWrJ1eCBemgasLl+ZBEikW0gArBaKLd8cI5Z6eKt5dy/LfNegwwwkJtXKxV1y1UCotKMDZGssTGOscSueQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJu7xXMsScMC7fO/jlAetuhPhhCpZsjDi2LwrXVJl+jzctkWh
	+yuZfljMYK+Ep9WIVvh7XfnVV3D7usH5t8CTwkoFmAN0F+3zO8hoJrm6hoBoDr2zLEK+rlUJy5c
	jfMNbOUiDRcsOd/M5paGJLCYBFx9S3qRyYp0RhvQ+rxmuy+6hbPQtELmg1lPLghdoaFt+
X-Gm-Gg: ASbGncuXlBBfUJREGh30OHUuSKUzsX9dbw5L7wnxoh3J0OW5lWBUiXC7oCDNavRus57
	bEP1I/imnTvg2j59Gnl8BK/Q2n1ZbUJLgAyB0VEBoUA5zEXhL/Pd181/DwyvP57Y8VOr3WyKjhn
	dLrXFKjaybOXztktQgk4ko9Zg92h+dfmrPyK5xtVrisj9C1cv2+Ax58sRZQfKmL+XZysb66/Aa1
	uPCowQhbUSu1KgRK1OufIwbXUSWyduV6vRiDJJrTH5Vj9APMKGM+dwgd0l8yT2ye8p6u8n9jSdT
	uzR/nJa3K8Thrb6fEhyjkHQN89M2WESHSo1WOPYNN0yMxnlv+r2QLdBT3+rO0tygXYOIRg==
X-Received: by 2002:a17:902:db0c:b0:246:2591:88b1 with SMTP id d9443c01a7336-2462edd7e2fmr125698905ad.3.1756117189306;
        Mon, 25 Aug 2025 03:19:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYpQrPIhIUruKR4cTukkOeu+YQSDvVqgm++nubkUVpFH+D4oFfpKkmdZYex92YXGvtAfzzng==
X-Received: by 2002:a17:902:db0c:b0:246:2591:88b1 with SMTP id d9443c01a7336-2462edd7e2fmr125698755ad.3.1756117188781;
        Mon, 25 Aug 2025 03:19:48 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:48 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU device.
Date: Mon, 25 Aug 2025 15:49:20 +0530
Message-Id: <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfXxYy+LlIqYYpF
 PLqJFjSGHFH9Ech9Q0hx33H27oMaUUZx3rQD6CIOV+z+zDqyKV7zhLKBFj6qnT5lfZxZCSUfdsM
 8WvahF85GwLaenEg0eDgoQ6coInc/3Z2MDg2kCU1itwVFatuJaVXUOBZPfd08DGL4X0NJ2zvmrI
 cRWuX4BJrItcLmM6KpCGMoauf/pidudB/G9HS5myYSRzP9XIEk/yqGKFYMvRpcbpK3SwwYgfvrD
 03m/uNx3G8LFXnGxq82Lqnm/E67yX4KZLy7PVD+phllvHW8rQ+J7nJIr2hpPQcZq9NeoiLHY0uC
 j2/u/GUceTsshdlQ6dfifphMBEwQUsfBfewSgfaro0DEusv0jK/NXdFB8M3im9HL6SCslV9JfVg
 5YPaojWy
X-Proofpoint-ORIG-GUID: cZGfHP-n3rhSVd90R_lSmAtXhLTwjI3e
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac38c6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pNPtQT0SkJn8u5nYD4AA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: cZGfHP-n3rhSVd90R_lSmAtXhLTwjI3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Add support for the Qualcomm QDU device. The Qualcomm QDU driver acts
as a client driver to the Sahara protocol, including the QDU100-specific
image table and registering it during device initialization. The
registration of the image table is required to transfer the QDU100
specific firmware back to the device using Sahara protocol packets. The
MHI driver exposes a new channel name for the Qualcomm QDU100 device in
the pci_generic.c file, and the same channel support is added in the
Sahara driver.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig         | 14 ++++++
 drivers/soc/qcom/Makefile        |  1 +
 drivers/soc/qcom/qdu.c           | 85 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/sahara/sahara.c |  1 +
 4 files changed, 101 insertions(+)
 create mode 100644 drivers/soc/qcom/qdu.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 7ea4cff9a679..ffaaf6261c35 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -303,6 +303,20 @@ config QCOM_UBWC_CONFIG
 	  with coherent configuration data. This module functions as a single
 	  source of truth for that information.
 
+config QCOM_QDU
+	tristate "Qualcomm QDU driver"
+	select QCOM_SAHARA_PROTOCOL
+	help
+	  This is a client driver which registers the device specific operations
+	  with sahara protocol which is used to download firmware to Qualcomm
+	  distributed unit device.
+	  The Qualcomm QDU driver facilitates the registration of device
+	  specific operations with the sahara protocol, enabling firmware
+	  download to the QDU device.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called qdu.
+
 source "drivers/soc/qcom/sahara/Kconfig"
 
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 99e490e3174e..8d036edf304a 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
 obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
 obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
+obj-$(CONFIG_QCOM_QDU) += qdu.o
diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
new file mode 100644
index 000000000000..afd8011793fa
--- /dev/null
+++ b/drivers/soc/qcom/qdu.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sahara_image_table_ops.h>
+
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[43] = "qcom/qdu100/kernel_boot.elf",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
+static struct sahara_image_table_provider qdu100_provider = {
+	.image_table = qdu100_image_table,
+	.image_table_size = ARRAY_SIZE(qdu100_image_table),
+	.dev_name = "qcom-qdu100",
+	.fw_folder_name = "qdu100",
+	.list = LIST_HEAD_INIT(qdu100_provider.list)
+};
+
+static struct sahara_image_table_provider *qdu_providers[] = {
+	&qdu100_provider,
+};
+
+static int __init qdu_init(void)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
+		ret = sahara_register_image_table_provider(qdu_providers[i]);
+		if (ret) {
+			pr_err("qdu: Failed to register image table %d\n", ret);
+
+			/* Rollback previously registered providers */
+			while (--i >= 0)
+				sahara_unregister_image_table_provider(qdu_providers[i]);
+			return ret;
+		}
+	}
+	return 0;
+}
+module_init(qdu_init);
+
+static void __exit qdu_exit(void)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
+		ret = sahara_unregister_image_table_provider(qdu_providers[i]);
+		if (ret)
+			pr_err("qdu: Failed to unregister image table %d\n", ret);
+	}
+}
+module_exit(qdu_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm distributed unit driver");
diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
index 5e17d71a2d34..b07f6bd0e19f 100644
--- a/drivers/soc/qcom/sahara/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -795,6 +795,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA", },
 	{},
 };
 
-- 
2.34.1


