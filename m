Return-Path: <linux-arm-msm+bounces-80228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B84EFC2F773
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 07:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42CB54E86D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 06:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D672877E3;
	Tue,  4 Nov 2025 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4+FiNRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8VA5x6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D742D9498
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238531; cv=none; b=a9gJW2m3o8k8riN8Avw39xI07reEJ6K+N2+cAL8Px/rGBrCkhb2lMcs6yLj9weDgGRRfTKstlRI+GqTkN3yP3BMZ9YM7+pDih8Vn3shyWqGKgRTNZqV5md/WaOAO4nj1RqnMurqGQWUEDRBtvFyznY+UjND4ua1hC4bn/iVbqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238531; c=relaxed/simple;
	bh=iFMkLHOZLW8SIYftwSx+gYKzSOGpNA5tiwZuq0SpB1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNg0mlLAioJlR7KgH/ScCvYr3rlf9sB7jF7cKPGWjY1blZrEdEIg/x4XV9LnVdukU0D+DApL0I7iTFuW1DaiOmcIdnH/w37FYTJajkGcJunV7jOgAMLPE2rvaUcmQzsVJAm8/o15G54TGwAh9kj5CZK1wY6i6JLCBo6zbZZSeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4+FiNRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8VA5x6b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42QaWX3682801
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 06:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vCa8IXhKeKJ
	0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=; b=S4+FiNRpZptuxhur9iX5G3/VkUI
	NRcJUNkUArzIgVKn41qNJlmRdE/d8In7j6B/gVhpoLFhJN8aebGvtoB2FC5rwdqu
	fSYk6dya8WUeAJqd0OS3dq1j7lKK0o8rWgkn4ZuieOvCsxawZ96nX5tsTbYGs8yr
	ZofmoiYe1Cwydm6/kKu8HoR0SlYxDcxbHXnkJCJGw1Kb7dkdZPH38+6ptb/PhD3i
	rgEkWWM9qmZwQI/JfuadEauytV5rwRO+mEVMMlF76DDTAsQ2LCz3ygtwdobgqRFJ
	ypXFdAYEw4GayPczKcnVomvRc9ttPC9zfqkygqpEbBlelzYLi9p/+eEjRFw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqtct9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:42:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34029b3dbfeso6438913a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 22:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238527; x=1762843327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCa8IXhKeKJ0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=;
        b=G8VA5x6bz0JJwQ3/uRV1Uhm6OfM+1Enom9oVsAbVLc2+vhLXR0lmIGxGBcYBh8/8Gh
         K4z0lzjaqkEe2oqCkF2ofqQoEkhzEjK/o4S4klDBCo+/dFFuKIMArUlgYTPJSd67uwlO
         GvTdQxUuRTyi+NLiipG4WQTVYbeedp/lsssXX4MyjNo8xsPTVvdXOR7RyMB7pX0D7cF4
         saxyezR+uCeVxhfsCVekZYjH9su8l2AvmMv6e3weeCETqEnKC3sCpPbSmtdV0wm60wyJ
         fXKbKdke/2+M08KT3zC5VdP/Zg2Rl40Wnpb+2ksFpChPiAC8FkJlf8sa9+tNOl5SpMz5
         ljTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238527; x=1762843327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCa8IXhKeKJ0v/SnPBnY5ntVOWUU4OkDq/A7IolgLnc=;
        b=wzXe/GDbz++DGumZDaeAZPw9B2Vas2HeFDeJgWDb4BVAn+gElRjAZbyIYWNcIbGMHf
         31fFDfV8s4yEryBce5JTLIHM0wzIAKb67TXnmoIWaCBkGQwmbe8sP5QL5MlbQ1SX5hkD
         vgpo+/ex+vPfNfZI5hlX6Une+vdHfRCLcBdS5hZNCUrgn1Tk7dXkVAHnJMecBsxCy64M
         aSdu7SH/pNVGRyDhmtkrC2dIurzcbORlD30i4W2BtEUzr/uW3UoqYyOkb53MHziGu6bX
         UwZm8HYrM58Mc8D9jQi/CpHvMjw/ArwC1lgp5ZOHlS5NhPO1btmtVn0K307d2bVumEC+
         Iwmw==
X-Forwarded-Encrypted: i=1; AJvYcCV2P0oNWSObMHlPyccDr384kBnJTNW7Vp3K7CQIbuA6jG+mQylKwAglNLmC8KgjtSxtJloPkuW1myYyRClE@vger.kernel.org
X-Gm-Message-State: AOJu0YyWF1rIzXBCHyH7ZXAXKLGWPcHdJs2RRdlloGm8CvHxr/n2UdP3
	b0f1NJvS5rk5XYTsOcpYN/yKcKHiFfGOQGmoKoHqfqvURyAF8nGQ7smz2i3OABqQJ2JsAT683Gl
	pyhlCR5BBa4YORxzDnTAZQHklGulk5I13u7jV52q0Z4VghXScVw983rgZ5y9eFAoTTGua
X-Gm-Gg: ASbGncsIT5kJLC4nCqo97Dap+aJpvTSLgmlp3baiU+YiJCXKyw/kDYrPmG1hQtdpo/4
	C8pkZMPs+OQMI/gkh8RNhPdJazUYxMNowyKSq8HAbzT3AsX0XqZydEUXhWp70PJ470Qai3dmc+z
	0pvktC61DIg8JAXbKNgdi4gYZ34vw7g8CtaZjeP0zFVv8dkOOZOrYUaGoS6CanINTKp7qclE5re
	ptssPsgw7qDB4x3vNShI7N0H4T74pj0kTH3R8ElUrwgOP93p7LLX8aM4v/HVA8z0wF6wKfUBQ4R
	533k55blRlBpUPN8W/Ov2oBcyYNNFBARp6Z4VhBiMPUcZV1q7dPgc71R/tjU8VuYAxU2zwgOHNE
	SdUFJVgXoIKVrhWlxjecULZAUxB9k5iEuNY+8oNeNpbCgvJE61D117A==
X-Received: by 2002:a17:90b:35d2:b0:340:ad5e:c9 with SMTP id 98e67ed59e1d1-340ad5e0260mr17124915a91.16.1762238526881;
        Mon, 03 Nov 2025 22:42:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRln/rdS9DbesaBJxZYysVMohCnniDIWiz4GR3mFRqdR3XiQrFBGwvPeL7OtsIqP4UkwMmAg==
X-Received: by 2002:a17:90b:35d2:b0:340:ad5e:c9 with SMTP id 98e67ed59e1d1-340ad5e0260mr17124872a91.16.1762238525758;
        Mon, 03 Nov 2025 22:42:05 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:05 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 2/7] qcom-tgu: Add TGU driver
Date: Mon,  3 Nov 2025 22:40:38 -0800
Message-Id: <20251104064043.88972-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S_YO9RSFERIw3tTbqxIXZWOhXeIKqvm8
X-Proofpoint-ORIG-GUID: S_YO9RSFERIw3tTbqxIXZWOhXeIKqvm8
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=6909a040 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfXwPy3AOb3eNEM
 LPKlOslFOpnoeALEu0bUR/27HJLzqM1S2i1h8wkE1POHYu2Z74X1toThY8M0356OJU230mrDKqq
 MMRNJvqbU4c37dSPUsvp4alMADMQ9ymX3l0nkXj7Zwo3e6PQKlr04x7oG2RiLcf2XfMhdQqbcI+
 rXQeDsHOcgzfNdp059L4SR8bO30MpRwZMnfGNysdTCQuRD4uD6aasnjwCOC3fbhb3ZsrjrsKzSt
 IyxxGmRNPD+4Y7ryAglb/wqGS07MMRxM3hNWkCSfYqzNnUP+0/XyHUGV5AzpwNH5NkjcM27/YMD
 FGjv1p7gYtMLqNxhDCT62izB5sVagK3QHwqluqicEjqREKGEpQJG10gzN05ZMGLe5kQIqEm1smm
 yus1caY3meGcsPsSqTt6J/85oWJuzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040053

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
index 000000000000..17d8449599a1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/coresight/devices/<tgu-name>/enable_tgu
+Date:		November 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index 8e1ffa4358d5..acade03f5942 100644
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


