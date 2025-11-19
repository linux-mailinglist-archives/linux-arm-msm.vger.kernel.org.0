Return-Path: <linux-arm-msm+bounces-82554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D5C6FDC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 92C983567A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8993A8D5C;
	Wed, 19 Nov 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbcbpaj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC373A1D02
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567162; cv=none; b=tF3bRCwBhXNGzuKcyfAmwJ43e5WCwOSgMA+Tb+3ZLTO+Wrgmmhb5eWEozNFyuSukkoPG3ikjEN4HJ3kOgQHnoAHHoxq3VH/z7+IhJVSZ+2WIN8u8DIwmqhrsHi9t5XLLj/JxtSXb3nDXqwUewLWYwRjtg9tjtnAnvBHbnq9yRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567162; c=relaxed/simple;
	bh=oMOJLuZhCOnY0w0cY4R3cwCR+B/zhszgawQsUmZz21o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twpgQexlCjm891ghWfBSOv8LEFTMKRyX+FQQZ0DLmSqvkpX9l5QxLacjVVfXbOBiwL7FWCMnBMxrfu01/WgFiPfwxPq1KtkjOjjsukWvje5JGQsaKrWjamTjMb0+1hagyH5jQcDUFjnsLcOB8ML83JDaK03cRzaO1feG1w3W9U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbcbpaj9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so36718315e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567155; x=1764171955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=nbcbpaj9MDGTBG2ZCwZwK3LgPpIz0tMB0ap1DqlvjBXvufiLgu5rtDDVtwkPLgNqfI
         o4NYkoWEt3FLcXmu6dL9PZGRVuqNh3UNpSsGeY8BCZo63wuPKa5E8f4eGYYhnQyQJZam
         08AaKGKIGbZeT5a1zhT1ZcZwHo/C4fK+VV8OHvXI8MH3lFWpdLrebSZ2Z58hKizgokp0
         Ai5/abu78NWX1TtrOUL2CREoPN1OgJfR/Sa8iKztlpiTwBs531ZQYTlKrnjuH8q8i7WE
         +47cckejnY2EfW+rEn1EnfXX32XQjCAWv6+sRahgUTSZsPxPqNllZ5eE+T9BA6gFU6Pr
         zfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567155; x=1764171955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CEWvhI86IGkr275YCXI4U9akHZM2f251P0zZm4c5HV0=;
        b=dNPjfCnSqtSdNjYgLwzxf5/vgYwT5PEmTTctjDQ9U4ZavknrRB0rCaCfsUNdeF1f1F
         w3J3Xgm7n5/ZM0o8PbqJ1j7qQZfd6jzEWnXETQLZhXO2ecR+EC58vPt0qPhaZvDPPTEB
         93Rlu37fDf9mq988UgEflsKZyuQTjQ87ODA8oU6cYcweDP0ObUlYMuVZVpO7yMYU2wdy
         MMdxvXIbQvgbE277H0oM1nQO6SjuWf7iDs2qjQKEvXQHrCvBAjBBK+p8xPYCRk6EVvSX
         Uf0tlQRNin15lgTYvBbMpExSzGcQdHr0M7r5TwbYgQ9CJK9i/07wobT5NEVm8qjmw8Ng
         aIHA==
X-Gm-Message-State: AOJu0Yz2tyN8Wuci4baIpfqznHQ2giCNescZwLmIi2rXcUE0igTlp31a
	QIaiUiwRFI+B1RerkDGL8ihnQ2HVedAEmYC515qK8hEYIq2mq+OQHEmavb5dOyE68y6dBfLq+O9
	oI0vg76UbBg==
X-Gm-Gg: ASbGnctDFUU2YzyFXrKONFCQwSiQO4DHVWeCqbf//zd7WG/BNZ+VNUG4Zc8WpYwFgNx
	1wSqcl0MW5LgRzWOnCd+ss6X7ByLvaqQdWgRy9kJzFuVTHTLlbU1wlw2CkPiSUZ2nEGuIwt9Ufb
	FcDwSnScnYmpcMUTcOmXZwp8R90e1f23F4GyXBI/ibWpYbnux2pOIutJnBnU7flRsTF77WukhLN
	Hyr9Gk3yhLg3/ziJHQQPjbFazugdpiNwBctuxnykbHF0KFayFvj1RGb7Zj7D3ZzLxp8D1/hTh4r
	nKqTBgKpbTgrbc5HlHJQgiMxTnD+7NPnvBsiqjslwOBbvMAjbBc5kUv16mBa50R6SMpfyPubUaX
	1kZqCSc/5zNoEWkfIM7SpFk69lYXXZ69YBFHYRYWka0xQWjQP8OTjDHzl7rAyvLW8Na8ddQDEif
	dRnTbS+lS2r4MUEiYsYVlF7V+oxz2PxI/d72zH0wQt
X-Google-Smtp-Source: AGHT+IGkk7cUbQZnXjGag8yPABXUYogSDTvlv9CsdaEjFL1fCOMxhsVRR8P5cnyld7ERa3Ar7rkUkQ==
X-Received: by 2002:a05:6000:22c1:b0:42b:3ab7:b8a4 with SMTP id ffacd0b85a97d-42b5938b4b1mr19940877f8f.33.1763567155275;
        Wed, 19 Nov 2025 07:45:55 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:54 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 22/26] remoteproc: qcom: Extract minidump definitions into a header
Date: Wed, 19 Nov 2025 17:44:23 +0200
Message-ID: <20251119154427.1033475-23-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the minidump definitions into a header such that the
definitions can be reused by other drivers.
No other change, purely moving the definitions.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/remoteproc/qcom_common.c  | 56 +------------------------
 include/linux/soc/qcom/minidump.h | 68 +++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 55 deletions(-)
 create mode 100644 include/linux/soc/qcom/minidump.h

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..4f1c8d005c97 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/minidump.h>
 #include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
@@ -28,61 +29,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
new file mode 100644
index 000000000000..25247a6216e2
--- /dev/null
+++ b/include/linux/soc/qcom/minidump.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Minidump definitions
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H__
+#define __QCOM_MINIDUMP_H__
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+#endif
-- 
2.43.0


