Return-Path: <linux-arm-msm+bounces-86517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF49CDBBF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 406D93006DB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A4032F77B;
	Wed, 24 Dec 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRKyBh2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZG2Q/j9V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AD30FC26
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567255; cv=none; b=iJnpB2JC6MqIsOvGIQWTtmqgmm8OYIVS10hYwc4c5ft7ntjy70hS6wqZkG7a0wT13ZhOPFipV9W2B9z7+TGfX//ZGqoHPMQm3LcNNKxPZUQxQDfTQv9jRWCF9PAEKtoRPo0H4m43FNyFKNQnOGigI4GiweIylV3Aj5UZE/ouaH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567255; c=relaxed/simple;
	bh=3Dl2DBkAgYX9zBHeNaof/UbPQ1QTq8c4q8PPipBTEdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myYaw+YVBCgWZLcb8TL163H+OX03p/hWfpBPvyDnkjEIaiDdeoPmEnw/wZzW7hmCzJlZZ4+BIiTmsTBCqELQ93azLOtpoZAJFWDB7Y8svIYOe5q7j1/DBIOKJsjiHtQEsGB6Gp3eqB7uXWqeJ1t/gv8fyF6a3dG7gPjfCxaU7SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRKyBh2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZG2Q/j9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO04oHH559752
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zftXLZejHschfaqV+Tjhewh8xeTRL6I8Q+dOwBPpAGg=; b=oRKyBh2x4xYMX1VI
	Upb1tfFJ4c/faXBW/WPCJu8ovzA6r4dtZ7gErp6inpuBFOdeuPvmtWPR+fqCnq1I
	tQc2FdybYXtLpEpJ7B6gs3gXfh/MIZZDWVh0BCi+KKjOgl2eSQBrPzBFBolhlhkd
	AocPxg0hqwKZ515XFOhg/nV5pYXpCp+ywq01pb5tnUz5K1LAchcxWRWOMW0X3YQd
	SjccRsoGHDUKMj8Hwp62PLQD4FssG1oQSX2I1bGnx32bj4haEaM5GvzzUJiiG/0a
	8TbXNLI/zNflbZnVlbwqf/lHxAwF3pAiiNK21RYIt9ZeOJKNHhQ4/HCNSv5jygzK
	S7D9TA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu2ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so151665165ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567251; x=1767172051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zftXLZejHschfaqV+Tjhewh8xeTRL6I8Q+dOwBPpAGg=;
        b=ZG2Q/j9VAxNHTN6g/860CYuv8X+amnk8w9JY478MKSBZ4GoxU8sWLSE+VgG5CFWty9
         j+1OQyyeWy5Qtn12B55OF2Aa4TNg/zDamuZWQ3mikphezzSW/66IlctC6MFgdjmVO0jv
         LqcH8Rq6NBdH4sw/TsyGZR3wt0hv1cey6C0qZW+Xsh3VIYhCTXgEkD+Ww16Vq5HcP68G
         Bn9lmFtCIX0Az7lcHDmIoxFMKb0kkQlJFTKqjo9Yi4SjNrk3njUo3nuF8COvMPj1szaw
         Dkk3K6XbEnHWHm1E53nCfJ+L4aC+mFfdu7uIZQTaDo6hQsJmaIfjw9W5CA280MClTTaG
         1jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567251; x=1767172051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zftXLZejHschfaqV+Tjhewh8xeTRL6I8Q+dOwBPpAGg=;
        b=lyLery7vb5y19Dr5yg+FMJjcBsNFSMVuLfDo9uae/WeH06Ey9NzeQ+pVd4mVdZUFEI
         JSnD/H2geas9udpHcgDuRNieAfIUG+aZDgtm8wo1+ii9IYuj25zpyGzW0GKBZPQbXwWk
         uTVifcDNTIkeOcJedx3U8NWvbvb4QSeM0C6oTJHN5pBgn74OPcyT48oClePhOLMfXdqC
         h2F9teKx2DwSX8rv74+gi2fAxFAkV2LgPl4O5FbHoyOIAQzJ0A53UbeyPNFazbGa0SUp
         Tww0qtAdR9Gh2iSY/HBUi1YOOsUZckLqUdq0bWXZB9MtvsOcLbcDMOFlJjHCZHNyjNMn
         TdxA==
X-Forwarded-Encrypted: i=1; AJvYcCUPg+fB15uNE4ofccvsWurMcMGwSSCLd1V4LhYjwp+scV/xWw0NDyMgiIl0FlSytpyvu4htyThBggyDxcmM@vger.kernel.org
X-Gm-Message-State: AOJu0Yygf12lxYH1qzXaS1tNx92uxF33Xed4Ag88TLM+Ur6jRiS3tDel
	VEXIuHavsex0V67qJSiDcSMA8cHew4kgSyGO/tHhMtLL5uvoZNutpDa7ARU7bYJdkG9vZAN0AMW
	sd+l98t2zhD+N8IvLJ5zfAurzTM3ev6kCMvUsdUDtqxmXyQ5R0ajgNe4uy5cO5zFSmdtCsqQ8Rk
	Jo
X-Gm-Gg: AY/fxX4YMniUvkLPeNNbSRyGq351vT2YRalo0CPtpANQ2hJWkNrW/gIVRIdZ3VsMmgM
	09lyP/qrrSw+BrEJUlO6zc0xwm9ldjh0zC4Xuc6F9JVxrEUnfExZ4wN0PhTd7JlaNUzPGXbyCQo
	nxOZpJMOoXWI2lNnYU8slH9tLt9VtXKftzx+qhGo5MWTUEnHIwXs6nZ3+TXgLaoBd7KDq+bAQuz
	kw0DAzKzrWlmMUOxk35ME8M53JTbWqyjXX9c2GfnkQUJgPejOCaI2nBrdBVLUKnZSfj/JZVtR6k
	PA6G8fX5egR1iKSbRHV4JMRluNrpCDYX+pYZo91KLnVh8DOtt/ol+S3QacIIlkidklPaQB4GKqI
	FeOj3z+qNuBjFLoi5yxpoHo5hvX6usipIh3KIjnDcyLVQCLVgBtk2lkdw70U8Oweg8OeuqrBx
X-Received: by 2002:a17:903:41c5:b0:2a0:d662:7282 with SMTP id d9443c01a7336-2a2f272c829mr190794685ad.37.1766567250384;
        Wed, 24 Dec 2025 01:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcrgUGDs1E9yfx0rYvFU3bBWyOf69lj/01yxHJnebRf+VxWPtP+/oV08kvYYd9Y+jV0wHKGw==
X-Received: by 2002:a17:903:41c5:b0:2a0:d662:7282 with SMTP id d9443c01a7336-2a2f272c829mr190794205ad.37.1766567249767;
        Wed, 24 Dec 2025 01:07:29 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:29 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:16 +0800
Subject: [PATCH v9 6/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-6-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=24608;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3Dl2DBkAgYX9zBHeNaof/UbPQ1QTq8c4q8PPipBTEdI=;
 b=QjRdB64sXaKj+w4CrbMYAcGK9P7balSx8NYz3SSOg32gwryeYaRAVaUNUvJ9jmcT/vZqLIzMh
 ZiR6YJt16VbBdSizbJIrWzQAJYuLSY5fXb/6Bqg/0xdgk1HJsUUC2Ak
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: nCbeiM5lIhlZ7JIRkgmcVw2OW22TJEDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX6apCtN2RoqZ1
 GOKAdCyCDPGaxcKA3WiE6h/XZtBLbMGQnJXTckDPzmPVb8mShR6gTUVYul/BND27R6V6INCMf2W
 FWdbbQo2vlala99hQkzt1/qw9TJpt2Vm1AGk+k2kM2OXCON2MRY42WQHRdd2i9JsQUVBL2zCDML
 +Is45Wuzqipm5EPlXUfRJo34PrjpargsV6Lp7NnINR8XMH5lczGHCXJJWnh++nB0C09RkVBVPbe
 Vta5VgVq/jmxCyOIM0LFAss5R5iPoYk+9Xo9nRnI8kx+mFO1hTWqH/i5EA6y5MRYeBBTdsTNZPW
 2ph8cBsJSwsWRb9fAwfVO3AgH0aIrKEKvT/dTSQQAKoCXf5sM1/d2H8R8Qt73RH9dbIe/LpkLr5
 DdqDWEahcBqq0qQETpaQr0jDAEmXZ46WyUtjj3YEGP2IFLQyT3Lf8kvuhcUyVd9nA59ixLZMJiy
 yrdxy+p2PmZASXgod+w==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bad54 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TrPPj8Ph-2G9coJyck8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: nCbeiM5lIhlZ7JIRkgmcVw2OW22TJEDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078

The byte-cntr function provided by the CTCU device is used to transfer data
from the ETR buffer to the userspace. An interrupt is triggered if the data
size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions and the read function
will read the data from the synced ETR buffer.

Switching the sysfs_buf when current buffer is full or the timeout is
triggered and resets rrp and rwp registers after switched the buffer.
The synced buffer will become available for reading after the switch.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 366 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 103 +++++-
 drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    |  18 +
 drivers/hwtracing/coresight/coresight-tmc.h        |   1 +
 7 files changed, 562 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
new file mode 100644
index 000000000000..3230c19dc701
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
@@ -0,0 +1,8 @@
+What:           /sys/bus/coresight/devices/<ctcu-name>/irq_threshold[0:1]
+Date:           Dec. 2025
+KernelVersion:  6.20
+Contact:        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>; Jinlong Mao <jinlong.mao@oss.qualcomm.com>; Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the byte-cntr IRQ register for the specified ETR device
+		based on its port number. An interrupt is generated when the data size
+		exceeds the value set in the IRQ register.
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index ab16d06783a5..821a1b06b20c 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -55,5 +55,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
-coresight-ctcu-y := coresight-ctcu-core.o
+coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
 obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
new file mode 100644
index 000000000000..6842b3d3daa0
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/uaccess.h>
+
+#include "coresight-ctcu.h"
+#include "coresight-priv.h"
+#include "coresight-tmc.h"
+
+static irqreturn_t byte_cntr_handler(int irq, void *data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
+
+	atomic_inc(&byte_cntr_data->irq_cnt);
+	wake_up(&byte_cntr_data->wq);
+
+	return IRQ_HANDLED;
+}
+
+static void ctcu_reset_sysfs_buf(struct tmc_drvdata *drvdata)
+{
+	u32 sts;
+
+	CS_UNLOCK(drvdata->base);
+	tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
+	tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
+	sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
+	writel_relaxed(sts, drvdata->base + TMC_STS);
+	CS_LOCK(drvdata->base);
+}
+
+static void ctcu_cfg_byte_cntr_reg(struct tmc_drvdata *drvdata, u32 val, u32 offset)
+{
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	/* A one value for IRQCTRL register represents 8 bytes */
+	ctcu_program_register(ctcu_drvdata, val / 8, offset);
+}
+
+static struct ctcu_byte_cntr *ctcu_get_byte_cntr_data(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	return byte_cntr_data;
+}
+
+static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
+					 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct etr_buf_node *nd, *next, *curr_node, *picked_node;
+	struct etr_buf *curr_buf = drvdata->sysfs_buf;
+	bool found_free_buf = false;
+
+	if (WARN_ON(!drvdata || !byte_cntr_data))
+		return found_free_buf;
+
+	/* Stop the ETR before we start the switch */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		tmc_etr_enable_disable_hw(drvdata, false);
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		/* curr_buf is free for next round */
+		if (nd->sysfs_buf == curr_buf) {
+			nd->is_free = true;
+			curr_node = nd;
+		}
+
+		if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
+			picked_node = nd;
+			found_free_buf = true;
+		}
+	}
+
+	if (found_free_buf) {
+		curr_node->pos = 0;
+		drvdata->reading_node = curr_node;
+		drvdata->sysfs_buf = picked_node->sysfs_buf;
+		drvdata->etr_buf = picked_node->sysfs_buf;
+		picked_node->is_free = false;
+		/* Reset irq_cnt for next etr_buf */
+		atomic_set(&byte_cntr_data->irq_cnt, 0);
+		/* Reset rrp and rwp when the system has switched the buffer*/
+		ctcu_reset_sysfs_buf(drvdata);
+		/* Restart the ETR when we find a free buffer */
+		if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+			tmc_etr_enable_disable_hw(drvdata, true);
+	}
+
+	return found_free_buf;
+}
+
+/*
+ * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+static ssize_t ctcu_byte_cntr_get_data(struct tmc_drvdata *drvdata, loff_t pos,
+				       size_t len, char **bufpp)
+{
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	ssize_t actual, size = sysfs_buf->size;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	size_t thresh_val;
+	atomic_t *irq_cnt;
+	int ret;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	thresh_val = byte_cntr_data->thresh_val;
+	irq_cnt = &byte_cntr_data->irq_cnt;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_buf) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_buf = true;
+		} else {
+			/*
+			 * TMC-ETR has been disabled, so directly reads data from
+			 * the drvdata->sysfs_buf.
+			 */
+			actual = drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+			if (actual > 0) {
+				byte_cntr_data->total_size += actual;
+				return actual;
+			}
+
+			/* Exit byte-cntr reading */
+			return 0;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
+		/*
+		 * Unlikely to find a free buffer to switch, so just disable
+		 * the ETR for a while.
+		 */
+		if (!ctcu_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
+			dev_warn(dev, "No available buffer to store data, disable ETR\n");
+
+	pos = drvdata->reading_node->pos;
+	actual = drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+	if (actual <= 0) {
+		/* Reset flags upon reading is finished or failed */
+		byte_cntr_data->reading_buf = false;
+		drvdata->reading_node = NULL;
+
+		/*
+		 * Nothing in the buffer, waiting for the next buffer
+		 * to be filled.
+		 */
+		if (actual == 0)
+			goto wait_buffer;
+	} else
+		byte_cntr_data->total_size += actual;
+
+	return actual;
+}
+
+static int ctcu_read_prepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	/*
+	 * Byte counter reading should start only after the TMC-ETR has been
+	 * enabled, which implies that the sysfs_buf has already been setup
+	 * in drvdata.
+	 */
+	if (!drvdata->sysfs_buf)
+		return -EINVAL;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Setup an available etr_buf_list for byte-cntr */
+	ret = tmc_create_etr_buf_list(drvdata, 2);
+	if (ret)
+		goto out;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	/* Configure the byte-cntr register to enable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, byte_cntr_data->thresh_val,
+			       byte_cntr_data->irq_ctrl_offset);
+	enable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->total_size = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+static int ctcu_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata)
+{
+	struct device *dev = &drvdata->csdev->dev;
+	struct ctcu_byte_cntr *byte_cntr_data;
+	unsigned long flags;
+
+	byte_cntr_data = ctcu_get_byte_cntr_data(drvdata);
+	if (!byte_cntr_data)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	/* Configure the byte-cntr register to disable IRQ */
+	ctcu_cfg_byte_cntr_reg(drvdata, 0, byte_cntr_data->irq_ctrl_offset);
+	disable_irq_wake(byte_cntr_data->irq);
+	byte_cntr_data->reading = false;
+	byte_cntr_data->reading_buf = false;
+	drvdata->reading_node = NULL;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	dev_dbg(dev, "send data total size:%llu bytes\n", byte_cntr_data->total_size);
+	tmc_clean_etr_buf_list(drvdata);
+
+	return 0;
+}
+
+static const struct sysfs_read_ops byte_cntr_sysfs_read_ops = {
+	.read_prepare	= ctcu_read_prepare_byte_cntr,
+	.read_unprepare	= ctcu_read_unprepare_byte_cntr,
+	.get_trace_data	= ctcu_byte_cntr_get_data,
+};
+
+/* Start the byte-cntr function when the path is enabled. */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	if (!sink)
+		return;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	/* Don't start byte-cntr function when threshold is not set. */
+	if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
+		return;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = true;
+	byte_cntr_data->reading_buf = false;
+}
+
+/* Stop the byte-cntr function when the path is disabled. */
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
+{
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct ctcu_byte_cntr *byte_cntr_data;
+	int port_num;
+
+	if (!sink || coresight_get_mode(sink) == CS_MODE_SYSFS)
+		return;
+
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0)
+		return;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port_num];
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	byte_cntr_data->enable = false;
+}
+
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct device_node *nd = dev->of_node;
+	int irq_num, ret, i;
+
+	drvdata->byte_cntr_sysfs_read_ops = &byte_cntr_sysfs_read_ops;
+	for (i = 0; i < etr_num; i++) {
+		byte_cntr_data = &drvdata->byte_cntr_data[i];
+		irq_num = of_irq_get(nd, i);
+		if (irq_num < 0) {
+			dev_err(dev, "Failed to get IRQ from DT for port%d\n", i);
+			continue;
+		}
+
+		ret = devm_request_irq(dev, irq_num, byte_cntr_handler,
+				       IRQF_TRIGGER_RISING | IRQF_SHARED,
+				       dev_name(dev), byte_cntr_data);
+		if (ret) {
+			dev_err(dev, "Failed to register IRQ for port%d\n", i);
+			continue;
+		}
+
+		byte_cntr_data->irq = irq_num;
+		init_waitqueue_head(&byte_cntr_data->wq);
+	}
+}
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 78be783b3cb2..0e5cadaac350 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/sizes.h>
 
 #include "coresight-ctcu.h"
 #include "coresight-priv.h"
@@ -45,17 +46,21 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
 
 #define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
 #define CTCU_ATID_REG_SIZE		0x10
+#define CTCU_ETR0_IRQCTRL               0x6c
+#define CTCU_ETR1_IRQCTRL               0x70
 #define CTCU_ETR0_ATID0			0xf8
 #define CTCU_ETR1_ATID0			0x108
 
 static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
 	{
-		.atid_offset	= CTCU_ETR0_ATID0,
-		.port_num	= 0,
+		.atid_offset		= CTCU_ETR0_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR0_IRQCTRL,
+		.port_num		= 0,
 	},
 	{
-		.atid_offset	= CTCU_ETR1_ATID0,
-		.port_num	= 1,
+		.atid_offset		= CTCU_ETR1_ATID0,
+		.irq_ctrl_offset	= CTCU_ETR1_IRQCTRL,
+		.port_num		= 1,
 	},
 };
 
@@ -64,6 +69,88 @@ static const struct ctcu_config sa8775p_cfgs = {
 	.num_etr_config	= ARRAY_SIZE(sa8775p_etr_cfgs),
 };
 
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
+{
+	CS_UNLOCK(drvdata->base);
+	ctcu_writel(drvdata, val, offset);
+	CS_LOCK(drvdata->base);
+}
+
+static ssize_t irq_threshold_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (!drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%u\n",
+			(unsigned int)drvdata->byte_cntr_data[port].thresh_val);
+}
+
+static ssize_t irq_threshold_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t size)
+{
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	/* Threshold 0 disables the interruption. */
+	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
+	/* A small threshold will result in a large number of interruptions */
+	if (val && val < SZ_4K)
+		return -EINVAL;
+
+	if (drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		drvdata->byte_cntr_data[port].thresh_val = val;
+
+	return size;
+}
+
+static umode_t irq_threshold_is_visible(struct kobject *kobj,
+					struct attribute *attr, int n)
+{
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct ctcu_byte_cntr_irq_attribute *irq_attr =
+		container_of(dev_attr, struct ctcu_byte_cntr_irq_attribute, attr);
+	struct device *dev = kobj_to_dev(kobj);
+	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u8 port = irq_attr->port;
+
+	if (drvdata && drvdata->byte_cntr_data[port].irq_ctrl_offset)
+		return attr->mode;
+
+	return 0;
+}
+
+static struct attribute *ctcu_attrs[] = {
+	ctcu_byte_cntr_irq_rw(0),
+	ctcu_byte_cntr_irq_rw(1),
+	NULL,
+};
+
+static struct attribute_group ctcu_attr_grp = {
+	.attrs = ctcu_attrs,
+	.is_visible = irq_threshold_is_visible,
+};
+
+static const struct attribute_group *ctcu_attr_grps[] = {
+	&ctcu_attr_grp,
+	NULL,
+};
+
 static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
 				       u8 bit, bool enable)
 {
@@ -142,11 +229,15 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		       struct coresight_path *path)
 {
+	ctcu_byte_cntr_start(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, true);
 }
 
 static int ctcu_disable(struct coresight_device *csdev, struct coresight_path *path)
 {
+	ctcu_byte_cntr_stop(csdev, path);
+
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
@@ -197,7 +288,10 @@ static int ctcu_probe(struct platform_device *pdev)
 			for (i = 0; i < cfgs->num_etr_config; i++) {
 				etr_cfg = &cfgs->etr_cfgs[i];
 				drvdata->atid_offset[i] = etr_cfg->atid_offset;
+				drvdata->byte_cntr_data[i].irq_ctrl_offset =
+					etr_cfg->irq_ctrl_offset;
 			}
+			ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
 		}
 	}
 
@@ -209,6 +303,7 @@ static int ctcu_probe(struct platform_device *pdev)
 	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
 	desc.pdata = pdata;
 	desc.dev = dev;
+	desc.groups = ctcu_attr_grps;
 	desc.ops = &ctcu_ops;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
index e9594c38dd91..4ff01f697903 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu.h
+++ b/drivers/hwtracing/coresight/coresight-ctcu.h
@@ -5,19 +5,26 @@
 
 #ifndef _CORESIGHT_CTCU_H
 #define _CORESIGHT_CTCU_H
+
+#include <linux/time.h>
 #include "coresight-trace-id.h"
 
 /* Maximum number of supported ETR devices for a single CTCU. */
 #define ETR_MAX_NUM	2
 
+#define BYTE_CNTR_TIMEOUT	(5 * HZ)
+
 /**
  * struct ctcu_etr_config
  * @atid_offset:	offset to the ATID0 Register.
- * @port_num:		in-port number of CTCU device that connected to ETR.
+ * @port_num:		in-port number of the CTCU device that connected to ETR.
+ * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
+ * @irq_name:           IRQ name in dt node.
  */
 struct ctcu_etr_config {
 	const u32 atid_offset;
 	const u32 port_num;
+	const u32 irq_ctrl_offset;
 };
 
 struct ctcu_config {
@@ -25,15 +32,69 @@ struct ctcu_config {
 	int num_etr_config;
 };
 
-struct ctcu_drvdata {
-	void __iomem		*base;
-	struct clk		*apb_clk;
-	struct device		*dev;
-	struct coresight_device	*csdev;
+/**
+ * struct ctcu_byte_cntr
+ * @enable:		indicates that byte_cntr function is enabled or not.
+ * @reading:		indicates that byte-cntr reading is started.
+ * @reading_buf:	indicates that byte-cntr is reading data from the buffer.
+ * @thresh_val:		threshold to trigger a interruption.
+ * @total_size:		total size of transferred data.
+ * @irq:		allocated number of the IRQ.
+ * @irq_cnt:		IRQ count number for triggered interruptions.
+ * @wq:			waitqueue for reading data from ETR buffer.
+ * @spin_lock:		spinlock of byte_cntr_data.
+ * @irq_ctrl_offset:	offset to the BYTECNTVAL Register.
+ */
+struct ctcu_byte_cntr {
+	bool			enable;
+	bool                    reading;
+	bool			reading_buf;
+	u32			thresh_val;
+	u64			total_size;
+	int			irq;
+	atomic_t		irq_cnt;
+	wait_queue_head_t	wq;
 	raw_spinlock_t		spin_lock;
-	u32			atid_offset[ETR_MAX_NUM];
+	u32			irq_ctrl_offset;
+};
+
+struct ctcu_drvdata {
+	void __iomem			*base;
+	struct clk			*apb_clk;
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct ctcu_byte_cntr		byte_cntr_data[ETR_MAX_NUM];
+	raw_spinlock_t			spin_lock;
+	u32				atid_offset[ETR_MAX_NUM];
 	/* refcnt for each traceid of each sink */
-	u8			traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	u8				traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
+	const struct sysfs_read_ops	*byte_cntr_sysfs_read_ops;
 };
 
+/**
+ * struct ctcu_irq_thresh_attribute
+ * @attr:	The device attribute.
+ * @idx:	port number.
+ */
+struct ctcu_byte_cntr_irq_attribute {
+	struct device_attribute	attr;
+	u8			port;
+};
+
+#define ctcu_byte_cntr_irq_rw(port)					\
+	(&((struct ctcu_byte_cntr_irq_attribute[]) {			\
+	   {								\
+		__ATTR(irq_threshold##port, 0644, irq_threshold_show,	\
+		irq_threshold_store),					\
+		port,							\
+	   }								\
+	})[0].attr.attr)
+
+void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset);
+
+/* Byte-cntr functions */
+void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
+void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
+
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 18981b6cc172..9440c1cb155d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1173,6 +1173,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buffer from the buf_node if it exists*/
+	if (drvdata->reading_node)
+		etr_buf = drvdata->reading_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1236,6 +1240,20 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_enable_disable_hw - enable/disable the ETR hw.
+ * @drvdata:	drvdata of the TMC device.
+ * @enable:	indicates enable/disable.
+ */
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable)
+{
+	if (enable)
+		__tmc_etr_enable_hw(drvdata);
+	else
+		__tmc_etr_disable_hw(drvdata);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_enable_disable_hw);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 7690a70069da..5e827bb00386 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -482,5 +482,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+void tmc_etr_enable_disable_hw(struct tmc_drvdata *drvdata, bool enable);
 
 #endif

-- 
2.34.1


