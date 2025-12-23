Return-Path: <linux-arm-msm+bounces-86381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E020CDA0DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FF4F308D0CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D270D346782;
	Tue, 23 Dec 2025 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ri3GIgfU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2XGZmAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4781346A18
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509716; cv=none; b=OpLUvJEcQBGiM1xUvlm1wo+LxydYV3jn5rjCCScnJYs1ptKHhMX2mGTYT5up2vp6P9+fsdxjtY3GZRLL16I9GOUyeOBbKpZsGPe8zfSIjewh5Ra3WSQBeA6RErOPSxYjbNC81/BhRgeKKFZj/Gt2cLbPmLt4TQ18hqtCdeo2ZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509716; c=relaxed/simple;
	bh=r+dClbF+NRAB6/JduYUiH5LaoOpV4jm0Feyp3PXQ6Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=savWCtNYy3pgV2WsmRv2KC6DpHeqeFbTG8zeEsPzquMAaeVaNlm/D6Oti76xs/0EeUz3bwfOZg4nUznb88CUyKAoVigX5lDzuecT9d8HH7L7lgjljSUKQPhvRs5Ga7S2uXJSeYZXZNggkeQ50Dc7EnxNrXHXOlUyk7dxIJSuV0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ri3GIgfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2XGZmAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBTdSn1358168
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=; b=Ri3GIgfUjCRNAkLb
	dQ6q2+iSFQfLIFnWHovJK+zjDmxFULErFFy5HbLh79B9bRLWnGsZwMsnz7n6yum1
	Gddd04L0m801OelnTqSnUBuuKhq9uzNnPm1tTPIXFMsGjVyVAtEEVs1xlFMu9vWT
	y+sdrj3WCdUKx9EUXCDeNpEvxUsB2yrhk1/RHNiXu4v7e+FjnMmX/TD5SX1iWXjZ
	AYfhFlC3LvN6wyMeIFlEzqcL3Qvcill7GYR88HzbHmSFVAKvmQ+nl8kTaX5JJfO7
	wZ4LtPUTNp6o8p7a8kN3q0xe/5m+ujJjotYnquF7J8aqZJJs0j0CCoW2QXCf3l+k
	ZKjzIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc40cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a31087af17so78698265ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509712; x=1767114512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=M2XGZmAegBJcLRD+YZn0QYK29z8n5QBSDsd+f3g14hmLOzF8ObIXMhOw1xjJaoYn0Q
         Fz84WKEuXtlkliPYMQV6A9e68IoRL5uoPkjccTzWNVfVuT8MuCoOzUmn/YRA0ndLumcY
         6esZ2x5e5MgtaZam82lJGIUNL8eTSFct5GAILN/ruxubG/DtSh6XEV/fuftAo1kTIZYG
         +Z1+MOCMBX9JByDVq68lkcAhfV9V89hY8zIvfTYIVkFLl2X28dV232GtuP+56crg5kLq
         ql3Z+m81KuzjuO3I/DQjc5Xhz6tfNamPEw/cufIePyIhTUgaQFgyymyAr1E/GOnvu1gI
         rVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509712; x=1767114512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r831Wd4WfqmDnI6RCOW6V71GyT3JAOrlUY36xWWaPTo=;
        b=rtIsMxw5qDhyP769E+3w2Pbs6znfhxXommm1JBKOh65Y2VMkxcRD7LULTYnF5Gaw5O
         ZmAFSogZ+Hf+u7gh6EoyhhqpUdp/0xEEv0ADvwaeS9mWgQ0i3qFaVn1Xg9aaD9vgpbR2
         iULD+b2VfKGY3uISk/Z7yd222XsaS+HeBdV7r1+IFxodiGvLufxMY0XnNGO348wP1UrV
         C3Rd3n1hQfu2yOy7EOGAWmd8g5KHwTd5xPJUp0AgnX4NihBwLsC745NPKD5ar8EJLX/s
         DDLz1dfvhv0r/kTiOqZVwGyIhfD+O0mNSTiHkodRxEW2innRROi5ZdcP+RotvHB21QGf
         wOvA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNbhXdI/xXXaVw9g21oudoCFIILgYgpqymavUhvDNnSserIkn4/yrA011lQnOZuEKGtkIJ0vG+BQiCaGG@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRKfnMSxM0E/3Jl0SVcwNO1F16lbx0ABeflQ+b+kXVlTg1S4o
	lVR7KcimHYc+RRfT5ZbhPuVel/pR4ioTgws7KOaOIaD2fhZXfnExi7lliRglKrc69I9uJtJoKWZ
	L+jndFFpVORhwX61cvqqg1i50w+Mq9Ux33euwA0I6HnepvItGdFtkrgzpdkeRQPtBWdhg
X-Gm-Gg: AY/fxX4F53dqMy7B2E7yvdYOXrR/F0zkBlafdbfW7mfynLYM798bZ/888ZQKORswr1l
	VbKOSG7fMFpxJ9GKBFha+gJHZEUYeSLhPu7yYju8+0ghllKgif6bO4PikceUrEXxMKfbwEaM3l9
	FYQLe8C8BCtOgSpDUJ0rc8Z6hzTeH6ITbqqAxLyKcRcOHUgq/1ZRQeOApzIjDFSHjswmCppDrdp
	YtNl3r0KRfRqUClJM9ybmtm8/jkvOSkIYr4TdRe/ULgCTFY3s0YSTOgSu22PewGAeAf12cVzXw3
	zsXUypJosv6O45gYBqbcl/X8AFrCBnbp9u0jUtcGNPQb9JeFKP7jnr8UNfLgP9kt93ChLhT1f4+
	E7G1FbuHWzIkaqzeQ8DThOgfJXbwnf8L4q5f4sgaI4Jlffw==
X-Received: by 2002:a17:903:2b04:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a2f2736e52mr159188915ad.31.1766509712342;
        Tue, 23 Dec 2025 09:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrQog1VHIkGG+EnkxQZPPrzkqb+aSWUlvAc+fbV4yVB71uMgrSalEFFWa7D8otCTGnxzqucA==
X-Received: by 2002:a17:903:2b04:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a2f2736e52mr159188575ad.31.1766509711815;
        Tue, 23 Dec 2025 09:08:31 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:31 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:37 +0530
Subject: [PATCH v18 06/10] power: reset: Add psci-reboot-mode driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-6-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=6151;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=r+dClbF+NRAB6/JduYUiH5LaoOpV4jm0Feyp3PXQ6Ss=;
 b=ywL7AR34h/F5vPYXYHRoR5r4E5A0R6/OCTRjTLWkgDzQjyLz3DmASCMeZ0R0ceNKdHAEiZa3X
 gr8qdWhZzEiA0EkTSVa1wnnqVsmMrF1/yOOYTuodbz6IP0gziePP3MP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: YwXKnfwOx6G_gvl3o1EBdTNI_XpLwezC
X-Proofpoint-ORIG-GUID: YwXKnfwOx6G_gvl3o1EBdTNI_XpLwezC
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694acc91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y0Vp-ry0QnGiofiFOe0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX3jO5qbk5QcIf
 edAa0L2o15udyTOe4PAlI740zsZn6v396YoR5kPc5aZyFn31wvbYiCD0uMGmVT9/ugU/HWwSrgZ
 EcTsuO3HHiw2OQwqdLAdjHJbtmw0qx2FGljfF+fWBHbotIfB9+7NS0MCGN3xiOerDkNrdJSKlT1
 3FX5+IcWMVYZ1HM3t6y1PIOU6XjGwH8qiWz5ZKw+mTGZ1wggQfmktwcwaCVHxWf5/zoxDAVnK3D
 k+ljgm+1X+1AK3L5xUTxLGk8mcQmT8RB0ESQe8Prtylyq7hJr8rrPJVlFI9oju4UZfm2V/haMrn
 l8nP0Y8PSaUoI35RT8wmGZYsxxbt+m2mNrVX5v9lFNJ4kWKsX4M+4n05MS9HqAxLrym1q6BHzwn
 JUVx8yCpAutyZMmjWd5ltsKZ2DSROhdXgxeQvrTPk36uQd+dmhb0aOUCvp7dQwSdw8/Zc/iExi4
 Acro4rl9seUmrep/8ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

PSCI supports different types of resets like COLD reset, ARCH WARM
reset, vendor-specific resets. Currently there is no common driver that
handles all supported psci resets at one place. Additionally, there is
no common mechanism to issue the supported psci resets from userspace.

Add a PSCI reboot mode driver and define two types of PSCI resets in the
driver as reboot-modes: predefined resets controlled by Linux
reboot_mode and customizable resets defined by SoC vendors in their
device tree under the psci:reboot-mode node.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/Kconfig            |  10 +++
 drivers/power/reset/Makefile           |   1 +
 drivers/power/reset/psci-reboot-mode.c | 111 +++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index f6c1bcbb57deff3568d6b1b326454add3b3bbf06..529d6c7d3555601f7b7e6199acd29838030fcef2 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on OF && ARM_PSCI_FW
+	select REBOOT_MODE
+	help
+	  Say y here will enable PSCI reboot mode driver. This gets
+          the PSCI reboot mode arguments and passes them to psci
+	  driver. psci driver uses these arguments for issuing
+	  device reset into different boot states.
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 0e4ae6f6b5c55729cf60846d47e6fe0fec24f3cc..49774b42cdf61fd57a5b70f286c65c9d66bbc0cb 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -40,4 +40,5 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000000000000000000000000000000..499cf504071e88022fa5b5b32e26b7a674da8691
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device/faux.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/of.h>
+#include <linux/psci.h>
+#include <linux/reboot.h>
+#include <linux/reboot-mode.h>
+#include <linux/types.h>
+
+/*
+ * Predefined reboot-modes:
+ * reset_type(arg1) is zero; cookie(arg2) is stored in magic.
+ * psci_reboot_mode_set_predefined_modes to move values to higher 32 bit of magic.
+ */
+static struct mode_info psci_resets[] = {
+	{ .mode = "warm", .magic = REBOOT_WARM},
+	{ .mode = "soft", .magic = REBOOT_SOFT},
+	{ .mode = "cold", .magic = REBOOT_COLD},
+};
+
+static void psci_reboot_mode_set_predefined_modes(struct reboot_mode_driver *reboot)
+{
+	INIT_LIST_HEAD(&reboot->predefined_modes);
+	for (u32 i = 0; i < ARRAY_SIZE(psci_resets); i++) {
+		/* Move values to higher 32 bit of magic */
+		psci_resets[i].magic = FIELD_PREP(GENMASK_ULL(63, 32), psci_resets[i].magic);
+		INIT_LIST_HEAD(&psci_resets[i].list);
+		list_add_tail(&psci_resets[i].list, &reboot->predefined_modes);
+	}
+}
+
+/*
+ * magic is 64 bit.
+ * arg1 - reset_type(Low 32 bit of magic).
+ * arg2 - cookie(High 32 bit of magic).
+ * arg2(cookie) decides the mode, If arg1(reset_type) is 0;
+ */
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
+{
+	u32 reset_type = FIELD_GET(GENMASK_ULL(31, 0), magic);
+	u32 cookie = FIELD_GET(GENMASK_ULL(63, 32), magic);
+
+	if (reset_type == 0) {
+		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
+			psci_set_reset_cmd(true, 0, 0);
+		else
+			psci_set_reset_cmd(false, 0, 0);
+	} else {
+		psci_set_reset_cmd(true, reset_type, cookie);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int psci_reboot_mode_probe(struct faux_device *fdev)
+{
+	struct reboot_mode_driver *reboot;
+	struct device_node *psci_np;
+	struct device_node *np;
+	int ret;
+
+	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
+	if (!psci_np)
+		return -ENODEV;
+
+	/*
+	 * Find the psci:reboot-mode node.
+	 * If NULL, continue to register predefined modes.
+	 * np refcount to be handled by dev;
+	 * psci_np refcount is decremented by of_find_node_by_name;
+	 */
+	np = of_find_node_by_name(psci_np, "reboot-mode");
+	fdev->dev.of_node = np;
+
+	reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
+	if (!reboot)
+		return -ENOMEM;
+
+	psci_reboot_mode_set_predefined_modes(reboot);
+	reboot->write = psci_reboot_mode_write;
+	reboot->dev = &fdev->dev;
+
+	ret = devm_reboot_mode_register(&fdev->dev, reboot);
+	if (ret) {
+		dev_err(&fdev->dev, "devm_reboot_mode_register failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct faux_device_ops psci_reboot_mode_ops = {
+	.probe = psci_reboot_mode_probe,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	struct faux_device *fdev;
+
+	fdev = faux_device_create("psci-reboot-mode", NULL, &psci_reboot_mode_ops);
+	if (!fdev)
+		return -ENODEV;
+
+	return 0;
+}
+device_initcall(psci_reboot_mode_init);

-- 
2.34.1


