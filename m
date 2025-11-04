Return-Path: <linux-arm-msm+bounces-80221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A09F0C2F637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 849094E5B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C202D46DD;
	Tue,  4 Nov 2025 05:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETmTyWbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xdj8W3xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB32D47EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762234760; cv=none; b=K9T8H8dSuJs5IcvfrVee8+hgCnnV7z4GJdrMSGK6+Ch4P9qbj23PV31Kzg+wIM8jC4BXrYAy8NcsQfFon3PRyEH3CKKwRooq/1EphRNC8KSAZ0QNEwK5ZFDp0H9gi+1xjDKuHlxklXnH5GT5/rMpvEtOJTljKTeCJlyDjkV/Bhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762234760; c=relaxed/simple;
	bh=kaPZfxDmcOGlouBOCCGfzoFVA+IiVr7/OjA0nNyoRvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxXE71zrO7DhghXjSU2KOpZf94UFt9hTgttYvc228oefBjzcjzT9cyrCljlMjFaIDq5YHfntQVVGaqrDwrhVR3XYxmicMpfhTlYdd9TV6oTUbyOwmsF9ee+RAZo9YF1cFQR12j5J9BNuwXvW8wI+u1MbiSg8FGDOYYWP9uu1R54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETmTyWbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xdj8W3xz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43jH0j3693546
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBxNszv/E0Kr5cUurGe5uw2qNNxsAhWhxVOI99s9tns=; b=ETmTyWbjVedQgQvP
	B7Vb1cTBMFp3nIe71MJVLqq0vXtI33gHNttj0ExUCAStrNcl0E3qimG8ChryMvXh
	29xLY6XsTp4iUfPaPXgA+d1hQVKZpKoC/OfgvVn+BpZaOqqfnpNBgS1SAG4TGSW6
	jTJUhoDKvgKpxN9cuXYh6IcxtY7dnWYapfrEbHbs/RJ8aGpjGHFSiHRJ4uSczchS
	C2CXvN0xRbtggaBUK5UwH6lh47PqE41B3rWJL34vzLuiM/esYdyObq6E/nBWVNdt
	VmpNJYdvPO6rmqyuv4OT3NICD/R8uG24L1zvjvI4H2bWmWpWhXMkAaUq4mV6aFEo
	66ayiw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70gm9rg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:39:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781253de15aso12646731b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762234757; x=1762839557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBxNszv/E0Kr5cUurGe5uw2qNNxsAhWhxVOI99s9tns=;
        b=Xdj8W3xzY1CvUThzXBw4E+8xLcRSE91fDtfW/T4rHbHHM/WtwxFdBSjGL359cUTDJM
         sqTKqT/ir3AeHYFrgKrGF0TUo7IkmSYOAgVVniPNgoAK/Beb385oOw5TwpPYdlLAR9oa
         Jdldm52ZPQs18TvcpMNJsM2VTChOXpkNNEZYz6ZH80yvFDyo4tn5DX511T3gmZoW4y8N
         xBpk0SbBXzmGdi3vVJkfAkkzhkhLG4TA+h1SADfkzj61rpeAWfUkrsXb6hoy/r4xjq0u
         231QAUmI5QbdVotDXQyBu65DdI30UPZOgjeubTK5YbIyZ5/vSc6MEZaDKNEMWKxJz3At
         IBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762234757; x=1762839557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBxNszv/E0Kr5cUurGe5uw2qNNxsAhWhxVOI99s9tns=;
        b=TcG/MMKa4ReinzghVx7+tVuBstpGjIZxVsqN0PBK0uCUkzV8N8/F48QC0mFcI3nmpp
         vJGpUBxPmse5Gkxc6qTN+o/myosOtGhdRAl/4nFbTzWIYAvyIZbQClJUTL+B+XapCGgy
         1Ib3v+N4UwR/txqVWTgRQHfHQRxU4ejdnub8zyMFdO0oIVXp1vCst589pJZumYm5D1Yd
         qixUh0Ufnaj0nWJS7QF3KxmPK+7hzhAi9bcuLgYaXmIy8iF8k45gvgupIg97oNo0Wx/m
         7008rbcpk6TugTzt3cj5ipSEaPxd49MUYCwgBB3eQGpmKGH8PMCUHaDyHe43QhOQVROz
         rgCA==
X-Forwarded-Encrypted: i=1; AJvYcCXZiWSQonatyJqR54OT5LOEncRxuhthPs3PCjxsSVqUBSHvUqfgAeNVOoVtQQPoMENOxfnVGfKHzrekVO0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrl0VT/PTjN1RGMKGgkbv28tZ+S2rd/Em6cbngTRmFw/S1Uzmp
	rLd6LeVLhArnBenxTUI998BNh7DTCFF5S+CfbMkS33mGXBPaVy3ikmfubEeySwQ6/IuuvFtjYIx
	18lKldbXpAdk3KcXjCnamvVY/QtkiAi628tbrBLz0Hdv5ArbRz9G8P99kyep1vo0jCoIwOBcVD9
	TB
X-Gm-Gg: ASbGncs99bEtliYvzeX1bK+OwNeFhxQ7BMpSAOUfci+eqLTgFBW4CU7e8pLFnDcTR4x
	On24KyyKITkPLHC8sm2xa06UUCRmLlcPn9UoyyGcd+3ZIeXO4OIQPEZ4pWD80rcaLWjTHIxTH9y
	y7S49ZltU/JleOaBfdYMzpiJWzDcwlUqUJbDcUpBJNqzaL+1W+yjot4EGhGoL31QpuSnt/GKStf
	q4JrZ3ujRaO4R/qT1j+ULXdkmfAU2C146+yTeHrobmZeBBdj780k1WuBBztpG7K9VNsum+V22Vd
	Dk5cI5Lz+Z4cHMSFuR952ryY3td5L2Pc2S26jYau73+KAXQdqJwv23xHiEnoaZ4Odl094r3ClZT
	LdZSgeTKiCkzIJ3OQnpaLbTqW
X-Received: by 2002:a05:6a00:94db:b0:7a2:6485:f336 with SMTP id d2e1a72fcca58-7a7788ffe7cmr19239445b3a.16.1762234756717;
        Mon, 03 Nov 2025 21:39:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXM4m2XR8dijko5+Hh4DhL2QdvemJAkeUf3MHkWwUCsB0vre3ViPGThhyyqTAsTZOKoHAARw==
X-Received: by 2002:a05:6a00:94db:b0:7a2:6485:f336 with SMTP id d2e1a72fcca58-7a7788ffe7cmr19239425b3a.16.1762234756110;
        Mon, 03 Nov 2025 21:39:16 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd3150f0asm1462402b3a.2.2025.11.03.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 21:39:15 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 11:09:05 +0530
Subject: [PATCH v2 1/3] bus: mhi: host: Add loopback driver with sysfs
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-loopback_mhi-v2-1-727a3fd9aa74@oss.qualcomm.com>
References: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
In-Reply-To: <20251104-loopback_mhi-v2-0-727a3fd9aa74@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762234749; l=12222;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=kaPZfxDmcOGlouBOCCGfzoFVA+IiVr7/OjA0nNyoRvo=;
 b=wt0kgpOwING3qGfkHdjF/YUzDgEHSacUP+qtyPJeF2mYZiBJt0qFJ3hcrPydCUL2wvSaa0RBW
 Oqd8WdTqHLECW7tz6e/yqBA723qAXEqrNVTHxv18VL+CBZTcpcf2nSk
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-ORIG-GUID: 8eSDpeGxu0y202b8W1It1xAbmEFxHXOv
X-Proofpoint-GUID: 8eSDpeGxu0y202b8W1It1xAbmEFxHXOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0NCBTYWx0ZWRfXwKKrz2zO0ie0
 mllV+Lt2wUFE6Uo7G0lMq8dQgRkgTcnELp1OENPKqgRrgyByNmn+gUDPYdTxvcOxeCE8TVQeYjS
 yFzjbRVDfrWyrTqiDZNxt9Ob6ZmXvv3YSqgFRK4eKEVHtgKge5is8JyTLQNrJJLHXRXfOQ2a+fH
 ItX7LTcbtqrpTNoDUfaeumTEJLh/Th4hlcETA6Xhrbqcc3RuO4SHzoDoozzG8nf+VJ7aDE5WBaC
 cr2GZXmcYqw3B056RMvctYwVsenzhNlJmhjz46j83kLuYUWGlxk4wfSmHzqBNII+xSesv8FNmgO
 K1lR7hiSn2pUVq7apb8TItdMS4/CmOyJ3/a98/zRYlGUpPeMCZsbpdyP9pQbTr6f5uIAXCxLe0A
 MSuMeezIJjQj18wTonJoZzM2ZV8e1Q==
X-Authority-Analysis: v=2.4 cv=CeMFJbrl c=1 sm=1 tr=0 ts=69099185 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bacY0d_NKaLyk7ydmrwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040044

Add loopback driver for MHI host controllers that provides sysfs based
testing interface for data path validation. The driver supports the
"LOOPBACK" channel and offers configurable test parameters.

Sysfs interface provides:
- size: Configure TRE size
- num_tre: Set number of TREs for chained transfers
- start: Initiate loopback test
- status: Read test results

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/host/Kconfig        |   7 +
 drivers/bus/mhi/host/Makefile       |   1 +
 drivers/bus/mhi/host/mhi_loopback.c | 347 ++++++++++++++++++++++++++++++++++++
 3 files changed, 355 insertions(+)

diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..08a39ecb47f585bf39721c101ed5e2ff44bdd5f8 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,10 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+config MHI_BUS_LOOPBACK
+	tristate "MHI loopback driver"
+	depends on MHI_BUS
+	help
+	  MHI loopback driver for data path testing. This driver
+	  provides a mechanism to test MHI data transfer functionality
+	  by implementing an echo service between host and endpoint.
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..e5d6dccf5a976eaeb827c47924ad0614c9958f8b 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+obj-$(CONFIG_MHI_BUS_LOOPBACK) += mhi_loopback.o
diff --git a/drivers/bus/mhi/host/mhi_loopback.c b/drivers/bus/mhi/host/mhi_loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..980ace675718a79c97d9b2968ccef04c992a6c20
--- /dev/null
+++ b/drivers/bus/mhi/host/mhi_loopback.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/completion.h>
+#include <linux/string.h>
+#include <linux/random.h>
+#include <linux/kernel.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/mutex.h>
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
+#include <linux/sizes.h>
+
+#define MHI_LOOPBACK_DEFAULT_TRE_SIZE   32
+#define MHI_LOOPBACK_DEFAULT_NUM_TRE    1
+#define MHI_LOOPBACK_TIMEOUT_MS         5000
+#define MHI_LOOPBACK_MAX_TRE_SIZE       SZ_64K
+
+struct mhi_loopback {
+	struct mhi_device *mdev;
+	struct mutex lb_mutex;
+	struct completion comp;
+	atomic_t num_completions_received;
+	char result[32];
+	u32 num_tre;
+	u32 size;
+	bool loopback_in_progress;
+};
+
+static ssize_t size_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", mhi_lb->size);
+}
+
+static ssize_t size_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val)) {
+		dev_err(dev, "Invalid size value\n");
+		return -EINVAL;
+	}
+
+	if (val == 0 || val > MHI_LOOPBACK_MAX_TRE_SIZE) {
+		dev_err(dev, "Size must be between 1 and %u bytes\n",
+			MHI_LOOPBACK_MAX_TRE_SIZE);
+		return -EINVAL;
+	}
+
+	guard(mutex)(&mhi_lb->lb_mutex);
+	if (mhi_lb->loopback_in_progress)
+		return -EBUSY;
+
+	mhi_lb->size = val;
+	return count;
+}
+static DEVICE_ATTR_RW(size);
+
+static ssize_t num_tre_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", mhi_lb->num_tre);
+}
+
+static ssize_t num_tre_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+	u32 val;
+	int el_num;
+
+	if (kstrtou32(buf, 0, &val)) {
+		dev_err(dev, "Invalid num_tre value\n");
+		return -EINVAL;
+	}
+
+	if (val == 0) {
+		dev_err(dev, "Number of TREs cannot be zero\n");
+		return -EINVAL;
+	}
+
+	guard(mutex)(&mhi_lb->lb_mutex);
+	if (mhi_lb->loopback_in_progress)
+		return -EBUSY;
+
+	el_num = mhi_get_free_desc_count(mhi_lb->mdev, DMA_TO_DEVICE);
+	if (val > el_num) {
+		dev_err(dev, "num_tre (%u) exceeds ring capacity (%d)\n", val, el_num);
+		return -EINVAL;
+	}
+
+	mhi_lb->num_tre = val;
+	return count;
+}
+static DEVICE_ATTR_RW(num_tre);
+
+static ssize_t start_store(struct device *dev,
+			   struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+	void *send_buf __free(kfree) = NULL;
+	void *recv_buf __free(kfree) = NULL;
+	u32 total_size, tre_count, tre_size;
+	int ret, i;
+
+	guard(mutex)(&mhi_lb->lb_mutex);
+
+	if (mhi_lb->loopback_in_progress)
+		return -EBUSY;
+
+	atomic_set(&mhi_lb->num_completions_received, 0);
+	mhi_lb->loopback_in_progress = true;
+
+	tre_size = mhi_lb->size;
+	tre_count = mhi_lb->num_tre;
+
+	strscpy(mhi_lb->result, "Loopback started", sizeof(mhi_lb->result));
+
+	total_size = tre_count * tre_size;
+
+	recv_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!recv_buf) {
+		strscpy(mhi_lb->result, "Memory allocation failed", sizeof(mhi_lb->result));
+		mhi_lb->loopback_in_progress = false;
+		return -ENOMEM;
+	}
+
+	send_buf = kzalloc(total_size, GFP_KERNEL);
+	if (!send_buf) {
+		strscpy(mhi_lb->result, "Memory allocation failed", sizeof(mhi_lb->result));
+		mhi_lb->loopback_in_progress = false;
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < tre_count; i++) {
+		ret = mhi_queue_buf(mhi_lb->mdev, DMA_FROM_DEVICE, recv_buf + (i * tre_size),
+				    tre_size, MHI_EOT);
+		if (ret) {
+			dev_err(dev, "Unable to queue read TRE %d: %d\n", i, ret);
+			strscpy(mhi_lb->result, "Queue tre failed", sizeof(mhi_lb->result));
+			mhi_lb->loopback_in_progress = false;
+			return ret;
+		}
+	}
+
+	get_random_bytes(send_buf, total_size);
+
+	reinit_completion(&mhi_lb->comp);
+
+	for (i = 0; i < tre_count - 1; i++) {
+		ret = mhi_queue_buf(mhi_lb->mdev, DMA_TO_DEVICE, send_buf + (i * tre_size),
+				    tre_size, MHI_CHAIN);
+		if (ret) {
+			dev_err(dev, "Unable to queue send TRE %d (chained): %d\n", i, ret);
+			strscpy(mhi_lb->result, "Queue send failed", sizeof(mhi_lb->result));
+			mhi_lb->loopback_in_progress = false;
+			return ret;
+		}
+	}
+
+	ret = mhi_queue_buf(mhi_lb->mdev, DMA_TO_DEVICE, send_buf + (i * tre_size),
+			    tre_size, MHI_EOT);
+	if (ret) {
+		dev_err(dev, "Unable to queue final TRE: %d\n", ret);
+		strscpy(mhi_lb->result, "Queue final tre failed", sizeof(mhi_lb->result));
+		mhi_lb->loopback_in_progress = false;
+		return ret;
+	}
+
+	if (!wait_for_completion_timeout(&mhi_lb->comp,
+					 msecs_to_jiffies(MHI_LOOPBACK_TIMEOUT_MS))) {
+		strscpy(mhi_lb->result, "Loopback timeout", sizeof(mhi_lb->result));
+		dev_err(dev, "Loopback test timed out\n");
+		mhi_lb->loopback_in_progress = false;
+		return -ETIMEDOUT;
+	}
+
+	ret = memcmp(send_buf, recv_buf, total_size);
+	if (!ret) {
+		strscpy(mhi_lb->result, "Loopback successful", sizeof(mhi_lb->result));
+		dev_info(dev, "Loopback test passed\n");
+	} else {
+		strscpy(mhi_lb->result, "Loopback data mismatch", sizeof(mhi_lb->result));
+		dev_err(dev, "Loopback test failed\n");
+		ret = -EIO;
+	}
+
+	mhi_lb->loopback_in_progress = false;
+	return ret;
+}
+
+static DEVICE_ATTR_WO(start);
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", mhi_lb->result);
+}
+static DEVICE_ATTR_RO(status);
+
+static void mhi_loopback_dl_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!mhi_res->transaction_status) {
+		if (atomic_inc_return(&mhi_lb->num_completions_received) >= mhi_lb->num_tre) {
+			atomic_set(&mhi_lb->num_completions_received, 0);
+			complete(&mhi_lb->comp);
+		}
+	} else {
+		dev_err(&mhi_dev->dev, "DL callback error: status %d\n",
+			mhi_res->transaction_status);
+		atomic_set(&mhi_lb->num_completions_received, 0);
+		complete(&mhi_lb->comp);
+	}
+}
+
+static void mhi_loopback_ul_callback(struct mhi_device *mhi_dev,
+				     struct mhi_result *mhi_res)
+{
+}
+
+static int mhi_loopback_probe(struct mhi_device *mhi_dev,
+			      const struct mhi_device_id *id)
+{
+	struct mhi_loopback *mhi_lb;
+	int rc;
+
+	mhi_lb = devm_kzalloc(&mhi_dev->dev, sizeof(*mhi_lb), GFP_KERNEL);
+	if (!mhi_lb)
+		return -ENOMEM;
+
+	mhi_lb->mdev = mhi_dev;
+
+	dev_set_drvdata(&mhi_dev->dev, mhi_lb);
+
+	mhi_lb->size = MHI_LOOPBACK_DEFAULT_TRE_SIZE;
+	mhi_lb->num_tre = MHI_LOOPBACK_DEFAULT_NUM_TRE;
+	mhi_lb->loopback_in_progress = false;
+
+	mutex_init(&mhi_lb->lb_mutex);
+	strscpy(mhi_lb->result, "Loopback not started", sizeof(mhi_lb->result));
+
+	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to create size sysfs file\n");
+		goto out;
+	}
+
+	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to create num_tre sysfs file\n");
+		goto del_size_sysfs;
+	}
+
+	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to create start sysfs file\n");
+		goto del_num_tre_sysfs;
+	}
+
+	rc = sysfs_create_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to create status sysfs file\n");
+		goto del_start_sysfs;
+	}
+
+	rc = mhi_prepare_for_transfer(mhi_lb->mdev);
+	if (rc) {
+		dev_err(&mhi_dev->dev, "failed to prepare for transfers\n");
+		goto del_status_sysfs;
+	}
+
+	init_completion(&mhi_lb->comp);
+
+	return 0;
+
+del_status_sysfs:
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
+del_start_sysfs:
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
+del_num_tre_sysfs:
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
+del_size_sysfs:
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
+out:
+	return rc;
+}
+
+static void mhi_loopback_remove(struct mhi_device *mhi_dev)
+{
+	struct mhi_loopback *mhi_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	if (mhi_lb)
+		complete(&mhi_lb->comp);
+
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_status.attr);
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_start.attr);
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_num_tre.attr);
+	sysfs_remove_file(&mhi_dev->dev.kobj, &dev_attr_size.attr);
+	mhi_unprepare_from_transfer(mhi_dev);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_loopback_id_table);
+
+static struct mhi_driver mhi_loopback_driver = {
+	.probe = mhi_loopback_probe,
+	.remove = mhi_loopback_remove,
+	.dl_xfer_cb = mhi_loopback_dl_callback,
+	.ul_xfer_cb = mhi_loopback_ul_callback,
+	.id_table = mhi_loopback_id_table,
+	.driver = {
+		.name = "mhi_loopback",
+	},
+};
+
+module_mhi_driver(mhi_loopback_driver);
+
+MODULE_AUTHOR("Krishna chaitanya chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Host Loopback Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


