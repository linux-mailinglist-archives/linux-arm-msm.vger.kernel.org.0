Return-Path: <linux-arm-msm+bounces-69487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD57B29A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F8371767EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA8528134F;
	Mon, 18 Aug 2025 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P73PMqtQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88F1280025
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500189; cv=none; b=b7LdeJ/nt+RPfkvT/tp67kSdcN480PiA6eOwsBGqKnRHK+RVyDs8mY4dQsRuqMFsyqS/oufio8jehOVmyUlbC6/92ECMQU1GUxHf9z0+yE3QRTjxBvG2F/kvneLHLsNGS4opgWLihapZ9QH+00WyDDT9FTEC8Lazuz0cl6jftDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500189; c=relaxed/simple;
	bh=k15o+IDWGA/QOCR8g1Vorrcmn3O5DokaZ/2Z2ge0u7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/V8YWRzFK6Nbyp2ykqkSQBw/bwqEgy6KrRl5hAjPyHSg1HDVQW3FWFZNHbRwbhaSU4u8cCZBacJPddbMUhSJGodtYL1WQIDK+U+0Os11cL4keIHUagoqlAjCmOjGVv18v1/w/eGTRjOpsOBOg9vaZpe2c4ACpsUoyKuq+NIhFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P73PMqtQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HKOJIE030849
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQxawJBbh+ffyUuHfLreyBYNkNE4uXGWQ6mSd0Oas+M=; b=P73PMqtQIvpKRaaX
	rTh7LqopME2CTVQUBnG9BhqoLRtM5rg+B34dNdsRFd1S5l1cqKI4ZP6RB6FrNmGg
	aYeKXj78HAD+c+KMS+awJ1xQtbeWT7QA9WgBVFELTpbZ5YRi9mHEA/petw4F10iY
	ZwSNSt1iE409CtxHxj0LxPVlRhE1U5XZl/IGzmqGuGbHLvta+Sbc7WuGUNe6RADI
	3jn7ccjdT8Nr71P56xnhSJiyoQVnjlAUQpu69TeJho/OomAAnlsL8vzejSGizq7/
	jg+LFokIl5XpKOZKousN8+sap2MCAUhmdWsw+r3Q1mXjNMEi21myH+pDbPIkINrM
	z8Icng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfuhsm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445823e49fso37313725ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 23:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500186; x=1756104986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQxawJBbh+ffyUuHfLreyBYNkNE4uXGWQ6mSd0Oas+M=;
        b=Koj9Oi1mxYeBeYHwUl2N4Gu/n/yYvGxiBPJZonCZITPFgqYKwuCzjYVyGXPEoe9BMS
         AXEsI8LutQMn2ITTHwA+3rD0COrcovyl9VkX1oS4BHVTw6NWihf0Ssh+RZK18tq/3rmi
         IIhTUWR3ApH0WZAu+1GKlXWtbNKD9D7LkZJCTHx97t0VGvQbSz75ZbxZ4qzUf3cuKh/n
         VTCleEg59icYerv0KAUzmRQcyagDEbJqd7R0ybJW1uh9w6me9n5DvAnhCPkPPA1bOjdz
         tSbGS9yqvK3Wk4nVxzupxgaDDTSSfV+uNGt8/g3mRkakLkIuamviDIp65OrHdy0tLXKD
         qy9g==
X-Forwarded-Encrypted: i=1; AJvYcCUcvfEyG6AXEVXWp57fckU0YDsOTTFVd7CmgcPHkTnyKAgw/+/dznfz8PNx0sPyp3K4/UmwSmEP7pw6rT8P@vger.kernel.org
X-Gm-Message-State: AOJu0YzO26p6CSpoCMsMcMlCJGtZaO1RCZveeYXo+whlAuJ3mWt4AUjO
	0Z7MSusk0upLiT0iDOI36B1EAeikfq09NHYlp1yUm/XUBIieVNTK+l0DYyBTNVv0dN7IK8Rf2ot
	GNMMiqIhSNXaLPA72EZv9T1TTZMwCW9BHgWymKYJ1qArMndBmtrVjJqcjUMEDf8J0N+8U
X-Gm-Gg: ASbGncslS5kaN7cteBRmYtijcEaAKJQA3GCcvYxeu1HzniDBgfIr/tBkCv4H3oAh7kh
	+jSJBXioqFOKo9HahyDWqMtndO4rHqQT/HQdlsQnchuDtta/y0O4P88WWeJdQfvR6/g0m1L2I8E
	cIAh1J93MTUgaHH0XL+XZLpsF5jKeKob3nOFBeluOAkA9k90DEu6BOKKyT6O1eZa9liOjbOfhmg
	pucrmFjgrTSPyL+0v8cdIKDlD6phuB8e+m4djPHyEN6rKHX5xrLaRRDJAIiL1xfOVADO6GHfAvF
	yAPJbf+16sPhoQs0UGXk1P7FhcnlYKnOytHI3fFZcL2froXeDHN0de/167NzgzVHg+gR8jVmjfQ
	=
X-Received: by 2002:a17:902:cece:b0:234:b41e:37a4 with SMTP id d9443c01a7336-2446d5af49bmr144868115ad.6.1755500185543;
        Sun, 17 Aug 2025 23:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENLs/2DXWw6n2QYO+Dy+o9rM78zROmEACTjY1xmYluv4fGvsS6yVVxa55/rDJyDdgXusgkEw==
X-Received: by 2002:a17:902:cece:b0:234:b41e:37a4 with SMTP id d9443c01a7336-2446d5af49bmr144867755ad.6.1755500184972;
        Sun, 17 Aug 2025 23:56:24 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:25:50 +0530
Subject: [PATCH 5/5] bus: mhi: host: mhi_phc: Add support for PHC over MHI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-tsc_time_sync-v1-5-2747710693ba@oss.qualcomm.com>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=10510;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lprUMA3aRVKAkI/z8xUwyXnE0Wfz+nlLZM3f13TiTlg=;
 b=ykhgoxUZ1uuf/GHTu+aGhtJ09jxArwk1DN64he+xrfoJpdIYU1LsiAI179tf6VVn8Bss9+Qg+
 0ieMK1kZiU+CNqtmm0ms8ZTQYuRPOBWoGOwARE0kUPhd3t1QTfIsafy
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZmOdyt-3jN5H4xJ5jJyH-WcW9jS4SI5c
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a2ce9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jCSRyOxDxnWW8XvuXboA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX2SO2/1C+5//A
 U3tEunjpeMpAwwpz7Wk7hT7ZSdI65X1E8PFVsuQSnX0Pxx8xh+BteDJYyNK5pW+BFK7E3XbCiQr
 iSMa+XpMOPx/z7On6w7dWjUJnGwOYbDjsQafPdar2x4Yu7nJq1CD1ZpFZWRBk9q5ETBdNm8QocG
 JfQmK874pxgxPn17fGe+WkWyOfKLXHVgcvMxN7EJIMrzdvdKJiqtKP6rUCX7kPT30nBJvXoTxPe
 Lxs6PYq6IKWPjk+HeUB9N9KovGV+72PK78GD7YpX9xhYCDgTB0//UguYoPmPqq2KR2hRxAzGEYp
 yHK1K5kGzZEJ94uYC+OyEZ6pmZ6E3OK5kIGVsrnCt5sCvDzwPUWOGuZEC0NTSp3g7snK4MDbUoi
 2cyIiVLw
X-Proofpoint-ORIG-GUID: ZmOdyt-3jN5H4xJ5jJyH-WcW9jS4SI5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

From: Imran Shaik <imran.shaik@oss.qualcomm.com>

This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
registers a PTP (Precision Time Protocol) clock and communicates with
the MHI core to get the device side timestamps. These timestamps are
then exposed to the PTP subsystem, enabling precise time synchronization
between the host and the device.

The following diagram illustrates the architecture and data flow:

 +-------------+    +--------------------+    +--------------+
 |Userspace App|<-->|Kernel PTP framework|<-->|MHI PHC Driver|
 +-------------+    +--------------------+    +--------------+
                                                     |
                                                     v
 +-------------------------------+         +-----------------+
 | MHI Device (Timestamp source) |<------->| MHI Core Driver |
 +-------------------------------+         +-----------------+

- User space applications use the standard Linux PTP interface.
- The PTP subsystem routes IOCTLs to the MHI PHC driver.
- The MHI PHC driver communicates with the MHI core to fetch timestamps.
- The MHI core interacts with the device to retrieve accurate time data.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/bus/mhi/host/Kconfig       |   8 ++
 drivers/bus/mhi/host/Makefile      |   1 +
 drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
 drivers/bus/mhi/host/pci_generic.c |  23 ++++++
 5 files changed, 210 insertions(+)

diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..b4eabf3e5c56907de93232f02962040e979c3110 100644
--- a/drivers/bus/mhi/host/Kconfig
+++ b/drivers/bus/mhi/host/Kconfig
@@ -29,3 +29,11 @@ config MHI_BUS_PCI_GENERIC
 	  This driver provides MHI PCI controller driver for devices such as
 	  Qualcomm SDX55 based PCIe modems.
 
+config MHI_BUS_PHC
+	bool "MHI PHC driver"
+	depends on MHI_BUS_PCI_GENERIC
+	help
+	  This driver provides Precision Time Protocol (PTP) clock and
+	  communicates with MHI PCI driver to get the device side timestamp,
+	  which enables precise time synchronization between the host and
+	  the device.
diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
index 859c2f38451c669b3d3014c374b2b957c99a1cfe..5ba244fe7d596834ea535797efd3428963ba0ed0 100644
--- a/drivers/bus/mhi/host/Makefile
+++ b/drivers/bus/mhi/host/Makefile
@@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
 
 obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
 mhi_pci_generic-y += pci_generic.o
+mhi_pci_generic-$(CONFIG_MHI_BUS_PHC) += mhi_phc.o
diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
new file mode 100644
index 0000000000000000000000000000000000000000..fa04eb7f6025fa281d86c0a45b5f7d3e61f5ce12
--- /dev/null
+++ b/drivers/bus/mhi/host/mhi_phc.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mhi.h>
+#include <linux/ptp_clock_kernel.h>
+#include "mhi_phc.h"
+
+#define NSEC 1000000000ULL
+
+/**
+ * struct mhi_phc_dev - MHI PHC device
+ * @ptp_clock: associated PTP clock
+ * @ptp_clock_info: PTP clock information
+ * @mhi_dev: associated mhi device object
+ * @lock: spinlock
+ * @enabled: Flag to track the state of the MHI device
+ */
+struct mhi_phc_dev {
+	struct ptp_clock *ptp_clock;
+	struct ptp_clock_info  ptp_clock_info;
+	struct mhi_device *mhi_dev;
+	spinlock_t lock;
+	bool enabled;
+};
+
+static int qcom_ptp_gettimex64(struct ptp_clock_info *ptp, struct timespec64 *ts,
+			       struct ptp_system_timestamp *sts)
+{
+	struct mhi_phc_dev *phc_dev = container_of(ptp, struct mhi_phc_dev, ptp_clock_info);
+	struct mhi_timesync_info time;
+	ktime_t ktime_cur;
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	if (!phc_dev->enabled) {
+		ret = -ENODEV;
+		goto err;
+	}
+
+	ret = mhi_get_remote_tsc_time_sync(phc_dev->mhi_dev, &time);
+	if (ret)
+		goto err;
+
+	ktime_cur = time.t_dev_hi * NSEC + time.t_dev_lo;
+	*ts = ktime_to_timespec64(ktime_cur);
+
+	dev_dbg(&phc_dev->mhi_dev->dev, "TSC time stamps sec:%u nsec:%u current:%lld\n",
+		time.t_dev_hi, time.t_dev_lo, ktime_cur);
+
+	/* Update pre and post timestamps for PTP_SYS_OFFSET_EXTENDED*/
+	if (sts != NULL) {
+		sts->pre_ts = ktime_to_timespec64(time.t_host_pre);
+		sts->post_ts = ktime_to_timespec64(time.t_host_post);
+		dev_dbg(&phc_dev->mhi_dev->dev, "pre:%lld post:%lld\n",
+			time.t_host_pre, time.t_host_post);
+	}
+
+err:
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return ret;
+}
+
+int mhi_phc_start(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+	unsigned long flags;
+
+	if (!phc_dev) {
+		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
+		return -ENODEV;
+	}
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	phc_dev->enabled = true;
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return 0;
+}
+
+int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+	unsigned long flags;
+
+	if (!phc_dev) {
+		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
+		return -ENODEV;
+	}
+
+	spin_lock_irqsave(&phc_dev->lock, flags);
+	phc_dev->enabled = false;
+	spin_unlock_irqrestore(&phc_dev->lock, flags);
+
+	return 0;
+}
+
+static struct ptp_clock_info qcom_ptp_clock_info = {
+	.owner    = THIS_MODULE,
+	.gettimex64 =  qcom_ptp_gettimex64,
+};
+
+int mhi_phc_init(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	struct mhi_phc_dev *phc_dev;
+	int ret;
+
+	phc_dev = devm_kzalloc(&mhi_dev->dev, sizeof(*phc_dev), GFP_KERNEL);
+	if (!phc_dev)
+		return -ENOMEM;
+
+	phc_dev->mhi_dev = mhi_dev;
+
+	phc_dev->ptp_clock_info = qcom_ptp_clock_info;
+	strscpy(phc_dev->ptp_clock_info.name, mhi_dev->name, PTP_CLOCK_NAME_LEN);
+
+	spin_lock_init(&phc_dev->lock);
+
+	phc_dev->ptp_clock = ptp_clock_register(&phc_dev->ptp_clock_info, &mhi_dev->dev);
+	if (IS_ERR(phc_dev->ptp_clock)) {
+		ret = PTR_ERR(phc_dev->ptp_clock);
+		dev_err(&mhi_dev->dev, "Failed to register PTP clock\n");
+		phc_dev->ptp_clock = NULL;
+		return ret;
+	}
+
+	dev_set_drvdata(&mhi_dev->dev, phc_dev);
+
+	dev_dbg(&mhi_dev->dev, "probed MHI PHC dev: %s\n", mhi_dev->name);
+	return 0;
+};
+
+void mhi_phc_exit(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
+
+	if (!phc_dev)
+		return;
+
+	/* disable the node */
+	ptp_clock_unregister(phc_dev->ptp_clock);
+	phc_dev->enabled = false;
+}
diff --git a/drivers/bus/mhi/host/mhi_phc.h b/drivers/bus/mhi/host/mhi_phc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e6b0866bc768ba5a8ac3e4c40a99aa2050db1389
--- /dev/null
+++ b/drivers/bus/mhi/host/mhi_phc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifdef CONFIG_MHI_BUS_PHC
+int mhi_phc_init(struct mhi_controller *mhi_cntrl);
+int mhi_phc_start(struct mhi_controller *mhi_cntrl);
+int mhi_phc_stop(struct mhi_controller *mhi_cntrl);
+void mhi_phc_exit(struct mhi_controller *mhi_cntrl);
+#else
+static inline int mhi_phc_init(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline int mhi_phc_start(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
+{
+	return 0;
+}
+
+static inline void mhi_phc_exit(struct mhi_controller *mhi_cntrl) {}
+#endif
diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e6c13c1a35253e6630b193827f8dadcd22a6198a..5ba760b2db43fb86b241b89d96e4b4354672bec3 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -16,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/timer.h>
 #include <linux/workqueue.h>
+#include "mhi_phc.h"
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
@@ -1037,6 +1038,7 @@ struct mhi_pci_device {
 	struct work_struct recovery_work;
 	struct timer_list health_check_timer;
 	unsigned long status;
+	bool mhi_phc_init_done;
 };
 
 #ifdef readq
@@ -1077,6 +1079,7 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 			      enum mhi_callback cb)
 {
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 
 	/* Nothing to do for now */
 	switch (cb) {
@@ -1084,9 +1087,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	case MHI_CB_SYS_ERROR:
 		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
 		pm_runtime_forbid(&pdev->dev);
+		/* Stop PHC */
+		if (mhi_cntrl->tsc_timesync)
+			mhi_phc_stop(mhi_cntrl);
 		break;
 	case MHI_CB_EE_MISSION_MODE:
 		pm_runtime_allow(&pdev->dev);
+		/* Start PHC */
+		if (mhi_cntrl->tsc_timesync) {
+			if (!mhi_pdev->mhi_phc_init_done) {
+				mhi_phc_init(mhi_cntrl);
+				mhi_pdev->mhi_phc_init_done = true;
+			}
+
+			mhi_phc_start(mhi_cntrl);
+		}
 		break;
 	default:
 		break;
@@ -1227,6 +1242,10 @@ static void mhi_pci_recovery_work(struct work_struct *work)
 	timer_delete(&mhi_pdev->health_check_timer);
 	pm_runtime_forbid(&pdev->dev);
 
+	/* Stop PHC */
+	if (mhi_cntrl->tsc_timesync)
+		mhi_phc_stop(mhi_cntrl);
+
 	/* Clean up MHI state */
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, false);
@@ -1427,6 +1446,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	timer_delete_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
+	/* Remove PHC */
+	if (mhi_cntrl->tsc_timesync)
+		mhi_phc_exit(mhi_cntrl);
+
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
 		mhi_power_down(mhi_cntrl, true);
 		mhi_unprepare_after_power_down(mhi_cntrl);

-- 
2.34.1


