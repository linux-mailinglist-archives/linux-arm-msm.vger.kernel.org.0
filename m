Return-Path: <linux-arm-msm+bounces-88156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F33D06CE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 03:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 869853043799
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 02:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A24326E6F8;
	Fri,  9 Jan 2026 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clPwd6/j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdTpVKk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC8226F29C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 02:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767924732; cv=none; b=ms0WSLHS9Dx0D9CBBdAwG9ERUT79sheQhjO53+lxMUz1bN2InKXagwxGW/ti1wxbWDekgYI1wOP7pGkRLVPUKbmjjkuH7vl67wcAn/+1i0mTWM/K4FFNDQFXoTsyl07I/L2uBEzszB2RwSoJFaiHDOHkEqkRf7KUXUK9VWnRfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767924732; c=relaxed/simple;
	bh=Rowm9zTzZd7jesJkLKCtr441qAQBYmk3KmDiCL7ueII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvSUdx7HdWLEF4xbAJoyDIkwwgAoUUUtJAWMwrJHquu/BI0DLyFQXiq4peuiY2FlDZQf5px20uX9hml8gIMKuH5IxpTbhUWGso7WxmzMP446HhU0/IaXHFcdyGnyLnsyce/3okfuClDxQEdMf6SV+NyE/FR4alDs8oM6wuwZkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clPwd6/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdTpVKk5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MpEDG3629109
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 02:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DjHq4ZWbcdh
	EjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=; b=clPwd6/jgzzD+uPfxtp4JrDVC1q
	cYFw+saXREJDGqa91ZdYEUsAMtWIs12nwmRU/W2QlcabZ2Clhu1Z8Sd2FeWjupYV
	xsBEInPeMccCbUT5zSDGNJ7kNXLf2DC+C32hNrMGlbaPHtfCWMVjnjkqxytnMRqZ
	0jTu4hcW7LgP7IbAabDYopvzvcbP1jyLczuChOrLheXMSaQzh5YVXgErMuWOCiqI
	vQPILW+GZ0IKENUjNd9WU6SgzIaNXiYa6/siKJOB+FWc3SpklpukRKeGj/dKJJJI
	LQiVjF0lowNbnJ9/KeKh/TDPgarYK74K7Pm/zqyTbt1VC5Av3Guc8bp1eRw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j0yd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 02:12:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0530846d3so3158538eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 18:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924728; x=1768529528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjHq4ZWbcdhEjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=;
        b=PdTpVKk5EVpZdBKhl/pPyJxx3fP7D2i+Gfh8kAlDkTvspJpBA7UvGpW0xxBTRb4DpU
         1XR2sKFL8o3KFoOxTVB4Z/4Dc6Q888SceLvACKuGh7PXBE+kKvcX8dp2Yp4jtpICL0H/
         tIZqqKNW52pzMLsVkJcnLRRGIGxFhLlYAAvHmnFxPo2vBv/Ly0HGigNy5T9Ln2feJ3L9
         xBah88oD+dphX2mJ1dqIuPVqJouSVHBUPUCeTN05pFNlBw3gkTs3AeHFDkYCMTIaRvoI
         lnOR7yEQIJN3rTsqq3LzUJdda8WpTMw+Moh6O66CDyz8+DVv7rHlRTTs6uo8FJIK/ys2
         wA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924728; x=1768529528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjHq4ZWbcdhEjTc1QLjuBRN0uHmH39hKhk5mtr7alUE=;
        b=FOtqPNJoBCGLy635G3cLXz37x0MOf+zKfm6hVtRhgItP2s3O/Ft0XHAa12GrqGi2vA
         67Vdq66myKthdFVLFFIqGFbhrKs7nvrQs0dezTxnqeyJJW5JcPrIRhZxYRUOKom0YeP8
         2/Ln3SRhhCHCHWP8pqHx30kxK09Stva5PlvlGikMhaUqF2qBoJrCnmCjU/S30trtelpD
         EqX78RgnH0msW4D/cKBh91zJ268QEDuuEe5PKTOHgokB+OiUnZNuJuG0fR4TyVqMnPM2
         pOkXmgWastRvAmOCeDMuIA9HXrxgEwRTbLufkuFaXfuxhOIbXzlxfbvEQTw4VS35nMQF
         t4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW5sLlQ2Q3VmNWnr1OgIyJG8hmoZBOs1spmphYHtCuB0Wz/P7iIOI52/EeXyAK9KNM/647usRldvJt0LZZW@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZnyY/r0oKI6Z1yaRtEb87W3sX8bmmJTjqTGiXFxylZmPaVOs
	tTTLrJfak8DkrIe6gyZ5SnV8KK/7PDXj4HmgqKfwxazhCU6jXMcpq9i1Q3B1L1P07v7vx4DChCd
	SvAMWQTXvlgjjVcbSJnaUgXXz8JHMyfmm0PpS2wz0VmPl2R/If9ASWCRYtXnTzc9IGPWj
X-Gm-Gg: AY/fxX7k7wRALyrzRtdr0Y7ZkNeORQchfYYZQiTMFmUs5K6hzqnLizBszzu3dVO7g9f
	edmYUHeGEis6RTgziCrqMZu6qS03tCRR45y9WRcoT7Czq9c0Y17UTK3WrowN9OsQg6hRsPSpWoq
	FC3DwOCXOsV3kTgyYzR/wUp0YIToPC+P8/pDcIJbAELx1UolQPyh5f9lPtb/14dCY4X3EnOcb2k
	sBrpgKpCNXae8g3eeZIGIJBvvMOPcbcaprJwwUdluNQWilo5bzNiafIiEwHU0mlauRU1ny2ILEn
	n8DKacoz6HitvUfKpx5YhLmD1ah5eceC+Pk9JyjxnofU1RXYE39ZHsIm+KvgogladGlAyG4nFEI
	flZRDegNJv0K/d1b6e4bCE9nLjovUFN1kDLonZEeAoYWNaU3vFZJUuUKieh3+SAE0
X-Received: by 2002:a05:693c:4143:10b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2b17d2aa0ffmr6543977eec.25.1767924728071;
        Thu, 08 Jan 2026 18:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEduvwLb5uIwn75t/emerE+73GzcjtqDlkmld1CqwFACGdsJBfZbUUotBYC5bj9Y4HLVZ00BQ==
X-Received: by 2002:a05:693c:4143:10b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2b17d2aa0ffmr6543939eec.25.1767924727243;
        Thu, 08 Jan 2026 18:12:07 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:06 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 2/7] qcom-tgu: Add TGU driver
Date: Thu,  8 Jan 2026 18:11:36 -0800
Message-Id: <20260109021141.3778421-3-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfXxIPrP/G9ba/W
 LAxwSLJY4Nm92BhkYJSH9s6gvMLBRT0LhRlHbvpMj8LEP9pEScFAs1GojZtaa9hxFkGiVJJqSkz
 8DiuyEsIvcnMln6EDQwcyMfdl+x2CROD9ZIHSXvqlsnQ9bA9eoCmSKMGAeXU4pL35257OFl1eV0
 LM2h9sxQoCI+En11G6/GJDW/x9t8EizVXAUbEYZLWZ4bfW83plF9wVHi8oZIYu7YaB3Z1gi/duK
 lByrTeQo96tbtK8h+iXhD3VfwpizdEhTfiT1jZamAijPgKx8nn7+BmJ8cLI4hiNfP9TfO2aceIE
 5G8x8SRl2NwXHi845GLq8M6b9JueRIIHk1iHzqPNdLnWO9qLzDjr/43dBbG9UfSlOVm9qdYXQvp
 UsCUc/S9Axs0cL2Gyk0ZfIjMhPtpj8famomZHhpZfgAi1L8EDcJ/9tnzfeze4OTXh9qmpbngOUk
 8Hvd9izYzngUiOwf91g==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696063f9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=h99DN6MNysFgGb7_OMAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: oedMHUB7_dWiu0v0mL8W6M6ifDAH4sNB
X-Proofpoint-ORIG-GUID: oedMHUB7_dWiu0v0mL8W6M6ifDAH4sNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  18 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 176 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  51 +++++
 7 files changed, 260 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..56ec3f5ab5d6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/drivers/Makefile b/drivers/Makefile
index ccc05f1eae3e..9608a3debb1f 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -177,6 +177,7 @@ obj-$(CONFIG_RAS)		+= ras/
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
index 000000000000..c5b2b384e6ae
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	TGU_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	TGU_LOCK(drvdata->base);
+}
+
+static int tgu_enable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
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
+static void tgu_disable(struct device *dev)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	guard(spinlock)(&drvdata->lock);
+	if (drvdata->enable) {
+		TGU_UNLOCK(drvdata->base);
+		writel(0, drvdata->base + TGU_CONTROL);
+		TGU_LOCK(drvdata->base);
+
+		drvdata->enable = false;
+	}
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	guard(spinlock)(&drvdata->lock);
+	enabled = drvdata->enable;
+
+	return sysfs_emit(buf, "%d\n", enabled ? 1 : 0);
+}
+
+/* enable_tgu_store - Configure Trace and Gating Unit (TGU) triggers. */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	unsigned long val;
+	int ret = 0;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+		ret = tgu_enable(dev);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+	} else {
+		tgu_disable(dev);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
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
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	spin_lock_init(&drvdata->lock);
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->enable = false;
+
+	pm_runtime_put(&adev->dev);
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	tgu_disable(dev);
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
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
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..b11cfb28261d
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL 0x0000
+#define TGU_LAR		0xfb0
+#define TGU_UNLOCK_OFFSET	0xc5acce55
+
+static inline void TGU_LOCK(void __iomem *addr)
+{
+	do {
+		/* Wait for things to settle */
+		mb();
+		writel_relaxed(0x0, addr + TGU_LAR);
+	} while (0);
+}
+
+static inline void TGU_UNLOCK(void __iomem *addr)
+{
+	do {
+		writel_relaxed(TGU_UNLOCK_OFFSET, addr + TGU_LAR);
+		/* Make sure everyone has seen this */
+		mb();
+	} while (0);
+}
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
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
+	spinlock_t lock;
+	bool enable;
+};
+
+#endif
-- 
2.34.1


