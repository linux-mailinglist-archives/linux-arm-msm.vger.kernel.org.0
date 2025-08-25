Return-Path: <linux-arm-msm+bounces-70610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BBEB33C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D675E1895A35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8AA2D061B;
	Mon, 25 Aug 2025 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4p/m88n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28722D640E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117192; cv=none; b=AUAncQ7sGtd/QjOw+TdsDWRMcx84Zk4pm1OxUJy8+Fxm8UCgggKuwM6ttiRQ+adJIIquR8caJQMgEEKA7ukC8TsAO8AdOS035aAsIzg0L4p3zcDK9xeXk6XTNslMC+YsfQ9Tzpa6fBTOnoP8nA1nte44/8KX8qAf/JcOTU1NI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117192; c=relaxed/simple;
	bh=cnpWXud08nd1IlkT2f/1Hbk5TQdMiMibPkx11kKQt4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qw0scFN26f/T5SxXQ7OSIGhjuOHArPJWkvza/AsHVTjZQgYRk0wdxuMUA6PVZ5uf9C7vWMNYiCurHqpWk5Wyw2Vrq6i/k92sjQXIdo+kKmsjuAY2bxThDcBHCSeF0+xbXBxKGLVw6GTlyFDtAmfTPaGXpDDdlNicf/0SMITxcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4p/m88n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8jWha014572
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kcayMLt1OCe
	PIsxYtzKnutWLQV/z29qgRNc2tXGcFqM=; b=V4p/m88n2JVUUkobICWP6pNfcrG
	PBtn5HoVqyop/4vXk+iM/E5nM6joWEhqtDCldz6p3M9yK7N8xJm2+kO6FVnTbgp1
	wesjxEfyEeC+hl9GhA0tDvHQpv7vdt5XWOqg51vsrUkqljVI6m52uoe0Yg1ogOt1
	GOQZqHhKQyTGokvGsNpV8F2X3mgeLPR3BkXplMzLBJCedE34QIGX8UvnoCECvbOi
	QrC0ev7xScPBRPBqF0ttfdfZ9hPZelR9b46XG1aXENNM5OLexlFpbFWrZ8PEc1ue
	k2rCyaK3GRDTcHSDnfKExDxgM8ZoCkOrHtlhHETJhnep+boJjUoXdNj3EgA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5cmyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b49c4e7ba85so1250961a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117187; x=1756721987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcayMLt1OCePIsxYtzKnutWLQV/z29qgRNc2tXGcFqM=;
        b=RB6rf2Tmygz3Kz4PxmijcmVqNgj6MzbfY5USY7Hk5SyHSItoRJQva6ot5fAUkzy04b
         FA8wVtTR7Ica0wNA63qcTT1z8OKX3mp0A9MzEoNW4zTLWVk4KqykLft3LqhX1k/9fKvZ
         X0DuI4F1DVMN9i2v8kwIAC1GKLEYHJTsQwxRFQPeyEm3GaKaIiVkeHGT260kezIa96OO
         AvIFhiSpuLCVYxNGPbyuXReXVe5lB4Op1JvsVuXKVqmhk0rUEDVWWeQ0GYUpERPuPiNa
         2chgvsSKv6UjkrJyUWsm7mr03r4q3JI+rNsicpQKedjCKPqIsp8bpeyZLdnVN+mRhkri
         HFvg==
X-Forwarded-Encrypted: i=1; AJvYcCV6+8PAeJZvR4FVRLD2gRs2rmn6I8RxuXpTFBDJRefIdR8xBrDZRCz1ZgoJ4A8HCS+ZZZcJuYiB+dZWQuSA@vger.kernel.org
X-Gm-Message-State: AOJu0YyzENIj34hEPaxfQiLbhFE8zBjAjc0Q1CMqSwUhVNecWMeQiLGV
	Hu/VfF/Oqsi0zeKGa97vdY6H61ivvD6/tTb5cMP1c5i0LfdrcI3TKCYCV5i8czX/tNcixhy8/ek
	GdEzy4OByzHeZ+h7lDikI/ZJg57PY0qLdKAgv7+X0WpLRJvRE4S1bANsEpZZPAPQ2u5te
X-Gm-Gg: ASbGncvWzc3C54SQBBJUakRkDTlQG/up9xLiTjxf8zd6wbzCls/8w4MvsF9s/ID2t6y
	mkGc204OQZd/N8iL5bqwKxirhtNNl+MAxcPyvWr2ijBWgV4DGK6e006SVKziCcYF73f1s4CZA3Y
	Ar+pAzTnRuzfEXtvnJfbA6DkVGM5cS8jPf3BvNrWziHlflFh7CcQvmpH8DtpqBb6hrqg5zzQziS
	jy3KxBt/HqCKI1Bx8xkqyM5Oj8VG/o0VRJuvkPipQwFUeuBZkr9KgvwmwC6NF7rN7Wosya68j2p
	qQFhFhmTvq207ZeVxo8KokFoBVI5OMn2i3OnAtY7qdGDD2wBIwWOfGKM9vxdkq+vVayTHQ==
X-Received: by 2002:a17:902:cec2:b0:240:3db8:9adc with SMTP id d9443c01a7336-2462edd7472mr156683545ad.4.1756117186513;
        Mon, 25 Aug 2025 03:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXa2Jkkb6WgM/Y+9xfLen1VNO4j6m44nxu9b8pZ68P5Tl8l8VoliKGNvugXeVNG02X4ydUGg==
X-Received: by 2002:a17:902:cec2:b0:240:3db8:9adc with SMTP id d9443c01a7336-2462edd7472mr156683255ad.4.1756117185968;
        Mon, 25 Aug 2025 03:19:45 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:45 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 05/12] drivers: soc: qcom: Move Sahara driver to drivers/soc/qcom directory.
Date: Mon, 25 Aug 2025 15:49:19 +0530
Message-Id: <20250825101926.2160554-6-kishore.batta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXyMbbZTtaJTtb
 jG632Ju244oP5GUhgmp/qzTTJ+WgeS7DPFi5jgs8WoYwY4orJboFprkksLTtAUMQeM83VimC8cb
 3bUAmHe6f79qmuOi6iREqN/e8tF/au9Eu9GcCDAnVzuddEG6mLJfuXWGV38N6Wpb1y8v7VZbSwJ
 GYSH5YkfuIb8og0e6TkalAcb/Xyb9lGp29G0aXVbcmfkOmvqfXSBnElUqMLYQtKETpOXyV22nwL
 Ba1atovQC10SxJMymkD4jqAj55XbOqMAloJFPiKN+rr6NxMcCgCsYhau9vmbiaPR+JnKR2Psjr7
 yI08DPOmkLEzZBkWylQ8UrhgAlKQtPDUIyiLKM1EVA6lKh1LpstQuu/u6uguYH6ojW2DKQO5e2F
 Q5ZbHR5N
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68ac38c3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lCT90aD2z10161gL8pEA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: mTn2VvLlgA99rCZjoCSR9i4osrvKRFlt
X-Proofpoint-ORIG-GUID: mTn2VvLlgA99rCZjoCSR9i4osrvKRFlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Move the Sahara protocol driver from the "drivers/accel" directory
to the "drivers/soc/qcom" directory. This change makes the Sahara
driver applicable to all Qualcomm devices, not just Qualcomm Accelerator
devices. It also facilitates adding support for new devices. Client drivers
can use the registration and deregistration functionalities of the Sahara
driver as needed.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                      |  1 +
 drivers/accel/qaic/Makefile                     |  4 +---
 drivers/accel/qaic/mhi_controller.c             |  2 +-
 drivers/accel/qaic/qaic_drv.c                   |  9 +--------
 drivers/soc/qcom/Kconfig                        |  6 ++++--
 drivers/soc/qcom/Makefile                       |  1 +
 drivers/soc/qcom/sahara/Kconfig                 | 17 +++++++++++++++++
 drivers/soc/qcom/sahara/Makefile                |  6 ++++++
 .../{accel/qaic => soc/qcom/sahara}/sahara.c    | 11 ++++++++---
 .../qcom/sahara}/sahara_image_table.c           |  7 ++++++-
 {drivers/accel/qaic => include/linux}/sahara.h  |  0
 .../linux}/sahara_image_table_ops.h             |  0
 12 files changed, 46 insertions(+), 18 deletions(-)
 create mode 100644 drivers/soc/qcom/sahara/Kconfig
 create mode 100644 drivers/soc/qcom/sahara/Makefile
 rename drivers/{accel/qaic => soc/qcom/sahara}/sahara.c (99%)
 rename drivers/{accel/qaic => soc/qcom/sahara}/sahara_image_table.c (94%)
 rename {drivers/accel/qaic => include/linux}/sahara.h (100%)
 rename {drivers/accel/qaic => include/linux}/sahara_image_table_ops.h (100%)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 5e405a19c157..5e2ac1ecede3 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	select QCOM_SAHARA_PROTOCOL
 	select CRC32
 	help
 	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 586a6877e568..4ad84f7e2162 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -11,8 +11,6 @@ qaic-y := \
 	qaic_data.o \
 	qaic_drv.o \
 	qaic_ras.o \
-	qaic_timesync.o \
-	sahara.o \
-	sahara_image_table.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 16c346e0e3b5..76beef6018a7 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -9,11 +9,11 @@
 #include <linux/mhi.h>
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
+#include <linux/sahara_image_table_ops.h>
 #include <linux/sizes.h>
 
 #include "mhi_controller.h"
 #include "qaic.h"
-#include "sahara_image_table_ops.h"
 
 #define MAX_RESET_TIME_SEC 25
 
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 5c4fab328003..a55e279411c3 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -15,6 +15,7 @@
 #include <linux/msi.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sahara.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/wait.h>
@@ -31,7 +32,6 @@
 #include "qaic_debugfs.h"
 #include "qaic_ras.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -682,12 +682,6 @@ static int __init qaic_init(void)
 		goto free_pci;
 	}
 
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
-		goto free_mhi;
-	}
-
 	ret = qaic_sahara_register_image_tables();
 	if (ret) {
 		pr_debug("qaic: Image table registration failed %d\n", ret);
@@ -737,7 +731,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..7ea4cff9a679 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -295,8 +295,6 @@ config QCOM_PBS
 	  This module provides the APIs to the client drivers that wants to send the
 	  PBS trigger event to the PBS RAM.
 
-endmenu
-
 config QCOM_UBWC_CONFIG
 	tristate
 	help
@@ -304,3 +302,7 @@ config QCOM_UBWC_CONFIG
 	  (UBWC) engines across various IP blocks, which need to be initialized
 	  with coherent configuration data. This module functions as a single
 	  source of truth for that information.
+
+source "drivers/soc/qcom/sahara/Kconfig"
+
+endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a57367..99e490e3174e 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -40,3 +40,4 @@ qcom_ice-objs			+= ice.o
 obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
 obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
 obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
+obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
diff --git a/drivers/soc/qcom/sahara/Kconfig b/drivers/soc/qcom/sahara/Kconfig
new file mode 100644
index 000000000000..4be90959736e
--- /dev/null
+++ b/drivers/soc/qcom/sahara/Kconfig
@@ -0,0 +1,17 @@
+config QCOM_SAHARA_PROTOCOL
+	tristate "Qualcomm Sahara protocol"
+	depends on MHI_BUS
+	select FW_LOADER_COMPRESS
+	select FW_LOADER_COMPRESS_XZ
+	select FW_LOADER_COMPRESS_ZSTD
+	help
+	  The sahara protocol is primarily designed for transferring software
+	  images from a host device to a target device using a simplified data
+	  transfer mechanism over any physical link. However, the sahara
+	  protocol does not support any authentication/validation of data sent
+	  between devices. Such mechanism is beyond the scope of protocol.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called qcom_sahara.
diff --git a/drivers/soc/qcom/sahara/Makefile b/drivers/soc/qcom/sahara/Makefile
new file mode 100644
index 000000000000..ad3922b30a31
--- /dev/null
+++ b/drivers/soc/qcom/sahara/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) := qcom_sahara.o
+
+qcom_sahara-y := sahara.o \
+		sahara_image_table.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/soc/qcom/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/soc/qcom/sahara/sahara.c
index 7eae329396be..5e17d71a2d34 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/soc/qcom/sahara/sahara.c
@@ -9,13 +9,12 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/overflow.h>
+#include <linux/sahara.h>
+#include <linux/sahara_image_table_ops.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-#include "sahara_image_table_ops.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -814,8 +813,14 @@ int sahara_register(void)
 {
 	return mhi_driver_register(&sahara_mhi_driver);
 }
+module_init(sahara_register);
 
 void sahara_unregister(void)
 {
 	mhi_driver_unregister(&sahara_mhi_driver);
 }
+module_exit(sahara_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Qualcomm Innovation Center, Inc");
+MODULE_DESCRIPTION("Sahara driver");
diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/soc/qcom/sahara/sahara_image_table.c
similarity index 94%
rename from drivers/accel/qaic/sahara_image_table.c
rename to drivers/soc/qcom/sahara/sahara_image_table.c
index dd0793a33727..18f9b7a59f25 100644
--- a/drivers/accel/qaic/sahara_image_table.c
+++ b/drivers/soc/qcom/sahara/sahara_image_table.c
@@ -5,8 +5,8 @@
 #include <linux/device.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/sahara_image_table_ops.h>
 
-#include "sahara_image_table_ops.h"
 
 struct sahara_image_table_context {
 	struct list_head provider_list;
@@ -49,6 +49,7 @@ int sahara_register_image_table_provider(struct sahara_image_table_provider
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sahara_register_image_table_provider);
 
 /**
  * sahara_get_image_table - Get the image table for a given device name
@@ -78,6 +79,7 @@ const char * const *sahara_get_image_table(const char *dev_name)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(sahara_get_image_table);
 
 /**
  * sahara_get_image_table_size - Get the size of the image table for a given
@@ -109,6 +111,7 @@ size_t sahara_get_image_table_size(const char *dev_name)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sahara_get_image_table_size);
 
 /**
  * sahara_unregister_image_table_provider - Unregister an image table provider.
@@ -139,6 +142,7 @@ int sahara_unregister_image_table_provider(struct sahara_image_table_provider
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(sahara_unregister_image_table_provider);
 
 /**
  * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
@@ -171,3 +175,4 @@ char *sahara_get_fw_folder_name(const char *dev_name)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(sahara_get_fw_folder_name);
diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
similarity index 100%
rename from drivers/accel/qaic/sahara.h
rename to include/linux/sahara.h
diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/include/linux/sahara_image_table_ops.h
similarity index 100%
rename from drivers/accel/qaic/sahara_image_table_ops.h
rename to include/linux/sahara_image_table_ops.h
-- 
2.34.1


