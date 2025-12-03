Return-Path: <linux-arm-msm+bounces-84174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D310C9E5F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E765534AD55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7583229B217;
	Wed,  3 Dec 2025 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDkTHQ4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz9a6HOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F58E2D8377
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752504; cv=none; b=CcKi+JRiVJSYb9lBCGu3cXJvOguRi1wlhvAO3RomwZo1pnk9txagrm8eS2xpeGpIekdbOhPERW9z1Mm5X7B0VuYNOvZiOcchq54M9SsXv6v0ZeJX9cv2p9JYZo7KQ2nFIpGVxi+wcatjU3AUcbA3lrR93Vk+ZhYimVYgzsFrMh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752504; c=relaxed/simple;
	bh=/wB8K03Qe+c4rlberk6ek5Ojzv4VCmDj9foHAXM7V9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6Tg74haUyE+pmevjrRQWfcCLrruU9QGIVHt/H9KlLyc3DAbg/nANbQScnaBoQJfpBcZ2gmqnDCCaRSU479Ukvw8/USEdfA0FGz76sQKIrHPW0wPziw7w29bpy+PgFHKhMxF2/LsFCRXNpwnJb46LsrfXOVY3S0Dl1/Mui9nQDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDkTHQ4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz9a6HOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34jJlb4130466
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 09:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YcpW6FT5Ml5
	cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=; b=IDkTHQ4EeCZUvX3Q/Dn1kCvB9yP
	GXOAXbZ4oG2DSNSasGeydwHopMVeGaMI7c4b7Sj+qDUCoQEGGGMe88ZsV+biXo1w
	dv3CTMOP5qersqGJY00iKodSAn/EeTOGLFNMEd1nZlIxH6IOVUjBsiMoAudfNhXh
	NJzOS8pTsWou7HbTGXoCYCWCdcIJSB3aP+sniU0ijGsmteLM3VYL46OXLvTw//x9
	1m5MiOIfMJFgantvj2EAcTvvJkdG0MXkQMYw5OedxW8RwBTqavzoHsqWqfhv/+06
	Wem12B6tYI//9T7ibC2p9hc3VFNwYx1eoESNbHS4Eh5GMRn2UM+CVsNZIHw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5e7a946-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 09:01:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2a45fea6efbso927677eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 01:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752501; x=1765357301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcpW6FT5Ml5cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=;
        b=bz9a6HOZJthXMckxQBjhCHhFpEYuDwV8dxVzvP2YHna//PAzNE6wfy3fcZjUJKOa9d
         Qu91EWxK5o2oGMcxyDGBOIBB0VtbPg926Ld/asSDg7szE0Dx9yJCNiCfWCnItF68gmi1
         Bz7MM08fK8AvRT3AetVhCpqCG0SAAMFW6Jm2iEHnX2ZpaSSt3XwLAMhBOR307sAYmOi3
         lA8MnsiHvsDmFZVMjezRmGNaBi0BxP4tfUypwqKuzCgApEDCZI+1y4p3ufHq3WpbM8Ct
         nzvEdE8/zz93OThoDdWxR0b9GC7KguMA6WfrVYyu89pR2HRAkRAS9/qQqlKd+6Fe5sIw
         g/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752501; x=1765357301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcpW6FT5Ml5cqNh4K+ZAcJVN/SL/nqamGuWANGIsHQ8=;
        b=wzl0sC69dvvSpokbFoJHeywkxAAlnri7Ggo///yMXp+PNI6Av6Rz9DInjo+4xL+j/H
         MfEyOh5QJ9sCJ3b5K+E7lz62lO+MY9vBFvJI7UcKLFK4wzjccRx/m5tnnG7t9NV4jDCP
         u0FU1NDro9+0HhxGEmRl6TBljvfU8oeOj2kdtfAiQ5lvXrqI5hL0vScFIFLsoMxWoWgO
         eAe/RGAI9jJHz+OOtMwTk4iWKST2b17KJMCPFieDLTOSk7WQF103qr+5AKzN+A60Kfz6
         xXqBKdW1J5QjL7pRkPEVWCN63n4qd5rxt1C0Xp987LGiMH52cSKBIYbxZXrnXXuGaDbt
         gjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaj0w14k7mreLWLA377IWvSyCTLifYgmuzIgfklFj1T/4HeU9ao5gXIez93H/lv4ZnsY2W/450QTF8j4Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YxOeQ51Gn9iGnPB73v+wZllkGEZ46Ux90dLpj6E+RbU/ZZYYgWT
	iwKsZEt/cgaw3CnmR6KtInqAHRLKtCc5Yv20oqzQNNIWhf63hb2tjWe/0HHltD0wBCGejmqpyQI
	pa27LfFbvbpN5SieNb2i7RiRTzq1pR/c+2oDdzM5cTSYZGQcqJ+mXI1QvmotGTKOm8gLj
X-Gm-Gg: ASbGncu8H1OiHjOWrBas65z0zdZZOTcF3WBXVvXw05N8Zu7OYux4RPX8neW/gVRfXmB
	YixRd4qZZfzO+QxTr/PMnkfJyzgyEN1OrjiIP7lxrOUU6b0pB/ODZRfzkNXmzAlVduHUr22M4Zi
	eXSgrxuwA+JZYE3zElqXNAkN37T0b2J9cLrvlyH3xH4aLSQTI8HmEUIeg1PnzQVKx88WpFHUTYk
	TwJuRoVh/d57we+CZlwjHi6NeyeNZLXl7+5cD1vUI5f7VkGkmvAyxvg2+pPuI3Q5KRhT3kaaFEo
	TYdbpjlpr2Zsq70GMlyeZ5wXddhfjqHw1L0T5DdxY7FCJ+Y/npGby4ddqlwp7mI2H9NsW303L1F
	q+8CkGm4o/Py/E5V84X393Zv/6v1vmxwzl2h5UgfdEqWLkEKStLFcgYv3qTcwaTgP
X-Received: by 2002:a05:7022:3844:b0:119:e569:f875 with SMTP id a92af1059eb24-11df0c51742mr1342269c88.18.1764752500965;
        Wed, 03 Dec 2025 01:01:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGczBS18cVnxW4Bd6f5klSTSp0HnIu7NJ00x9oYdzJHtAvarBMpszrTSCdZO4jtjV255/JWBQ==
X-Received: by 2002:a05:7022:3844:b0:119:e569:f875 with SMTP id a92af1059eb24-11df0c51742mr1342242c88.18.1764752500343;
        Wed, 03 Dec 2025 01:01:40 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:39 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 2/7] qcom-tgu: Add TGU driver
Date: Wed,  3 Dec 2025 01:00:50 -0800
Message-Id: <20251203090055.2432719-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX9NqcDiZyvadP
 C4LMvgV/1NkfiyJZV1Y7LAlV1D1VPCgAA5YQ1u9smrBSF6+WbvpQdD8Q996wLniq0QhHa4ohhIP
 Be9gCOKnJ3qF9AT01R12K0kvNS7EPkm2atqJPiD2taxkVg0j9GpyQZLxZNbNdCK7UPeTqW35ufX
 ggwtUZmJa1ictwJTvRiXcyGYRxTRwTDoEGlGT+2He5CNn/5otreR7J9zVsdINqLhdVdCecuuk4m
 8zc/6vaTpCdpXvyPIl42hKh3lpT8eXAf66+8/f7/4jS7vDIAC3DmAuQx9qZgmVuUnU9p6fKArRg
 w4GhPMEDOl27/DLW0u0R5U5t0zLQhJ9YTVpZ+V5Z5zwJOkwJP0Pa8nduQlZkghsrGd3IIuDl+yL
 qAM8fZFhVpxDl9wc4iVpbhT2WXB3lg==
X-Authority-Analysis: v=2.4 cv=KcrfcAYD c=1 sm=1 tr=0 ts=692ffc75 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WK88BcU0M5CY8gCeEUdP0Ad1XS-eXsY7
X-Proofpoint-ORIG-GUID: WK88BcU0M5CY8gCeEUdP0Ad1XS-eXsY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 210 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  33 +++
 7 files changed, 276 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
new file mode 100644
index 000000000000..ccc2bc92edcd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 20eb17596b89..46cd62aabfe8 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-y				+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..d6f6d4b0f28e
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..368bb196b984
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "../coresight/coresight-priv.h"
+#include "tgu.h"
+
+DEFINE_CORESIGHT_DEVLIST(tgu_devs, "tgu");
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
+		      void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	guard(spinlock)(&drvdata->lock);
+	if (drvdata->enable)
+		return -EBUSY;
+
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enable = true;
+
+	return 0;
+}
+
+static int tgu_disable(struct coresight_device *csdev, void *data)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	spin_lock(&drvdata->lock);
+	if (drvdata->enable) {
+		CS_UNLOCK(drvdata->base);
+		writel(0, drvdata->base + TGU_CONTROL);
+		CS_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+	spin_unlock(&drvdata->lock);
+	return 0;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	bool enabled;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	spin_lock(&drvdata->lock);
+	enabled = drvdata->enable;
+	spin_unlock(&drvdata->lock);
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
+		ret = tgu_enable(drvdata->csdev, CS_MODE_SYSFS, NULL);
+		if (ret)
+			pm_runtime_put(dev->parent);
+	} else {
+		ret = tgu_disable(drvdata->csdev, NULL);
+		pm_runtime_put(dev->parent);
+	}
+
+	if (ret)
+		return ret;
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static const struct coresight_ops_helper tgu_helper_ops = {
+	.enable = tgu_enable,
+	.disable = tgu_disable,
+};
+
+static const struct coresight_ops tgu_ops = {
+	.helper_ops = &tgu_helper_ops,
+};
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+	NULL,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	int ret = 0;
+	struct device *dev = &adev->dev;
+	struct coresight_desc desc = { 0 };
+	struct coresight_platform_data *pdata;
+	struct tgu_drvdata *drvdata;
+
+	desc.name = coresight_alloc_device_name(&tgu_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	adev->dev.platform_data = pdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (!drvdata->base)
+		return -ENOMEM;
+
+	spin_lock_init(&drvdata->lock);
+
+	drvdata->enable = false;
+	desc.type = CORESIGHT_DEV_TYPE_HELPER;
+	desc.pdata = adev->dev.platform_data;
+	desc.dev = &adev->dev;
+	desc.ops = &tgu_ops;
+	desc.groups = tgu_attr_groups;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err;
+	}
+
+	pm_runtime_put(&adev->dev);
+	return 0;
+err:
+	pm_runtime_put(&adev->dev);
+	return ret;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
+
+	coresight_unregister(drvdata->csdev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+		.data = "TGU",
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm TGU driver");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..1a55da90f521
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL 0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @csdev: Pointer to the associated coresight device
+ * @lock: Spinlock for handling concurrent access
+ * @enable: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointers, clock, spinlock for
+ * synchronization, trigger data pointers, maximum limits for various
+ * trigger-related parameters, and enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct coresight_device *csdev;
+	spinlock_t lock;
+	bool enable;
+};
+
+#endif
-- 
2.34.1


