Return-Path: <linux-arm-msm+bounces-74496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FDB94959
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 08:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DBF4839FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 06:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E621D311588;
	Tue, 23 Sep 2025 06:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2JwHXt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB030FC3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758609477; cv=none; b=c1E7oBV9+hWLnGPZ/wgQIPbefTIWlMLt8yOdSbe3eRBbF7pBK7rWGdEghadSftRcn3F/Vn0M8IM7GyKDik41hKvELdGaIKOt6gpIqzRzT8cmK5ahLoLzfGQvZgOprc4kV/Y8ZikHI5LoH1f6RjApxzHarILPvprcR0QacX8H1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758609477; c=relaxed/simple;
	bh=/XZjxMDsdlsb2hd1V1q563apP/LGTaw7IP8VKfFQNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YEZN53rs4TXUlhe1Tk4NIugut1qk+B7VX61abIYzjgHZ/JxrzU6AbhoojhHWaG6LQXEOW2UtmRKrI1g3UhxuHrvMOzSEFd0c6SbH2rrv9/5JfFiRV0fwRy8pCzifh+GzE0xXsbM6s6w/EuUJwWQCwJ/gVtv6Tjj0mJ9fe9GsBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2JwHXt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N6a0xR016051
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2i5gCewt8z3E3EoPGc+LEWHh1OOCMfCgomgDxGz2IM=; b=b2JwHXt2hQ1DXyan
	h1uTZL0FqtBJiQTpA/mZv2s8MtvjISRn3gXI8oeK9shy9r+2yiKiIOY+Z1QKGU5c
	QdRe+gNUZDJtQTubzho4XUP0ArR0dq12H3xJ6YYuj0KiEB7z/TXTXSpcHUSxrZMC
	lTWqnrRBouwA8kwzkwoGbnJ1cvlC1CC6SNtZja22IDVs6ivl221IjmUoeandSJmS
	ByftprOWqB6asnCHkQXdTXSUHsJmviBgQUbwGFcHEaMH+Jy77drSfz0YV4bjhq4M
	rO3zbK2CnacrnA4g+l9cRg/z8dW1abi+4hz+gB/whYBFmgaXtIaJsWBHvziWcFwV
	PjFuDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajesw2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 06:37:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b552f91033cso4270692a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758609474; x=1759214274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2i5gCewt8z3E3EoPGc+LEWHh1OOCMfCgomgDxGz2IM=;
        b=YtQFLaKr7776K8KkwWWmWxOPJFPSgvwo30xIcOltJo22+MrSZFRJJDSVXYSmT0RaTi
         nz4luPZJSVLzHVxmqlF8f3a9OwoBrAvNnXchXmlvRtW8MWgogKId3/8ElIuqyy42MScv
         2gi1TG6KPmMVA6e1bak+M613F0vO/AkYi29ibqupAD/iPhvW53et73ZAlbDcvlPsmM+z
         bPR8MaPhQ+G1j3ZFNMXN6cqTTp17R7AcJxVuMw/fQUlFvVvboUgQHOKj2z4oF/EgGoyO
         Mi/62fj+SsOhdr0ECWc38n6oYRgjcoZG2XZWSC8HIyC7zagJtzTOOAurPZcd85wAMEW/
         9Hpw==
X-Forwarded-Encrypted: i=1; AJvYcCVStiy/cFT81r+llUqOOFL7coJumxkrFn7j5geSwRT/KtvU5wdRpwgdbNipaVK5CW25xcZQAvPmmbuYDRFn@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4sO9IDBGzR+kdnQtS3WjYaWJLy6dGJdu7pG8VOuGbfFwSmbi
	X8mkwLvD3DFSCE1XToRzTbwayCSvoD8Z7JcVWC+JvoohYWh5e6pSWXmCWtYSPCpe8V69x5YX5/5
	xXXgG+T0mLjHq4pwcoCCY0liyvP2sc83e4le0F+3mP7j7Bfec5gr/8zp54VzfkRLHcAsY
X-Gm-Gg: ASbGncsw77innFXVLXq91BUviqXj2IaRhQOZ2MhA0Ayaywa3ulA2j/ZXXmEvlqIoFQ4
	YGIjZehoHNtB873iAz+s46v/RoCISLZdZeq682aLYuRDwpKXsyGCuMcex1wz2QeMNy7jcM4508Z
	6J+rWrybQ437PlViyAHQ2TVrMIttrMy1bLJaqFcZiG4lpgP0mXUO00hQ95W/tL5ovO35wUlqdPQ
	X1zwKuCpQHl7kH7WOcRuZLFwFDCYdonzl3ebZRP2dSkF96+3lvVYMQfPnTvPDqUf+WdegX0tXaG
	9M1JeOH2PdhYCfsTogqkglqdWj330ooz+TfZWcQcYtO/wDvhEQj6GRJxvvdFhsqmjA==
X-Received: by 2002:a05:6a21:6d97:b0:2b5:769f:2542 with SMTP id adf61e73a8af0-2cfe8990c69mr2570925637.36.1758609474175;
        Mon, 22 Sep 2025 23:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcdgMOz1PL6eB9rEDeqp235HhjD28WXRHTyz1Aw/HjM+cmU/CEZqbyYKplL/kpmh4rWvdwEQ==
X-Received: by 2002:a05:6a21:6d97:b0:2b5:769f:2542 with SMTP id adf61e73a8af0-2cfe8990c69mr2570886637.36.1758609473642;
        Mon, 22 Sep 2025 23:37:53 -0700 (PDT)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551905bb4csm10792840a12.29.2025.09.22.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 23:37:53 -0700 (PDT)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 12:07:42 +0530
Subject: [PATCH 2/2] bus: mhi: ep: Add loopback driver for data path
 testing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-loopback_mhi-v1-2-8618f31f44aa@oss.qualcomm.com>
References: <20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com>
In-Reply-To: <20250923-loopback_mhi-v1-0-8618f31f44aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758609464; l=5830;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=/XZjxMDsdlsb2hd1V1q563apP/LGTaw7IP8VKfFQNnM=;
 b=WD/6L5VbKB2D38KzJB8gQHdyMsWs2SrkdKIoQaD+MAq6ui8rTHJuvnjhuIKISlRT070gQF1N3
 pruOysrtJ/wAkO1k8tjM0ZDaLdRVlVYLCVovKtsMY741Oxd/fHtv4u/
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: 9eVHBqNn06uEXRfINp1y4A0XLnp3MzCx
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d24043 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RyQsIt2LcgCPV6mEHuQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXwL1MysU8Yb3t
 zoaYX/N/vYQ3v/1FYPtEMTa1xP++ms8BqhvEo59zmTsz52VmUTdUAx6yteRDdvDsvh34Al61qmL
 Id6LqdzFqZFkz5S56DhiwA8jpHYNvbMV6EJ2ZcAhOIJamNjk4fiFYX1BMiKP66xW/OWBFKBkaed
 1geFGmEnvqnwSrO0F8HoX9r0pGSJKt0eL0Dg+E6cVCL1YKP83rzLs5Z/KZt2zh9P8JrEBAwXB+m
 53JydYMWFFjoEMHzg0S6Zdr3L7D3VXwHjWa9wYMBvHhA3EpDLDf8AKoC0Fbvp8rdF9QsI3A4roJ
 2sl2HoOThofrM4dn8BLm5+9oKjC/SFK82KZ2twlXeo4NxXFUX9v5H29S+MEZ6NKC7w053TA37Co
 wohsSJXz
X-Proofpoint-ORIG-GUID: 9eVHBqNn06uEXRfINp1y4A0XLnp3MzCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

Add loopback driver for MHI endpoint devices. The driver receives
data on the uplink channel and echoes it back on the downlink
channel using a workqueue for asynchronous processing.

The driver is useful for testing MHI endpoint data path functionality
and debugging communication issues.

Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
 drivers/bus/mhi/ep/Kconfig           |   8 +++
 drivers/bus/mhi/ep/Makefile          |   1 +
 drivers/bus/mhi/ep/mhi_ep_loopback.c | 132 +++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)

diff --git a/drivers/bus/mhi/ep/Kconfig b/drivers/bus/mhi/ep/Kconfig
index 90ab3b040672e0f04181d4802e3062afcc7cf782..ce7b63c2da82a6ca49528517687f4910552c35bb 100644
--- a/drivers/bus/mhi/ep/Kconfig
+++ b/drivers/bus/mhi/ep/Kconfig
@@ -8,3 +8,11 @@ config MHI_BUS_EP
 
 	  MHI_BUS_EP implements the MHI protocol for the endpoint devices,
 	  such as SDX55 modem connected to the host machine over PCIe.
+
+config MHI_BUS_EP_LOOPBACK
+	tristate "MHI Endpoint loopback driver"
+	depends on MHI_BUS_EP
+	help
+	  MHI endpoint loopback driver for data path testing.
+	  This driver receives data on the uplink channel and echoes
+	  it back on the downlink channel for testing purposes.
diff --git a/drivers/bus/mhi/ep/Makefile b/drivers/bus/mhi/ep/Makefile
index aad85f180b707fb997fcb541837eda9bbbb67437..02e4700e8dc3f860d40290476b0a852286683f8f 100644
--- a/drivers/bus/mhi/ep/Makefile
+++ b/drivers/bus/mhi/ep/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_MHI_BUS_EP) += mhi_ep.o
 mhi_ep-y := main.o mmio.o ring.o sm.o
+obj-$(CONFIG_MHI_BUS_EP_LOOPBACK) += mhi_ep_loopback.o
diff --git a/drivers/bus/mhi/ep/mhi_ep_loopback.c b/drivers/bus/mhi/ep/mhi_ep_loopback.c
new file mode 100644
index 0000000000000000000000000000000000000000..89244aca684ffc959a38f8a0c3ad577b2d127c48
--- /dev/null
+++ b/drivers/bus/mhi/ep/mhi_ep_loopback.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/mhi_ep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/skbuff.h>
+
+struct mhi_ep_loopback {
+	struct workqueue_struct *loopback_wq;
+	struct mhi_ep_device *mdev;
+};
+
+struct mhi_ep_loopback_work {
+	struct mhi_ep_device *mdev;
+	struct work_struct work;
+	struct sk_buff *skb;
+};
+
+static void mhi_ep_loopback_work_handler(struct work_struct *work)
+{
+	int ret;
+	struct mhi_ep_loopback_work *mhi_ep_lb_work = container_of(work,
+								struct mhi_ep_loopback_work, work);
+
+	ret = mhi_ep_queue_skb(mhi_ep_lb_work->mdev, mhi_ep_lb_work->skb);
+	if (ret) {
+		dev_err(&mhi_ep_lb_work->mdev->dev, "Failed to send the packet\n");
+		kfree_skb(mhi_ep_lb_work->skb);
+	}
+
+	kfree(mhi_ep_lb_work);
+}
+
+static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+	struct mhi_ep_loopback_work *mhi_ep_lb_work;
+	struct sk_buff *skb;
+
+	if (!(mhi_res->transaction_status)) {
+		skb = alloc_skb(mhi_res->bytes_xferd, GFP_KERNEL);
+		if (!skb) {
+			dev_err(&mhi_dev->dev, "Failed to allocate skb\n");
+			return;
+		}
+
+		skb_put_data(skb, mhi_res->buf_addr, mhi_res->bytes_xferd);
+
+		mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
+		if (!mhi_ep_lb_work) {
+			dev_err(&mhi_dev->dev, "Unable to allocate the work structure\n");
+			kfree_skb(skb);
+			return;
+		}
+
+		INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
+		mhi_ep_lb_work->mdev = mhi_dev;
+		mhi_ep_lb_work->skb = skb;
+
+		queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
+	}
+}
+
+static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
+					struct mhi_result *mhi_res)
+{
+	struct sk_buff *skb;
+
+	if (mhi_res->transaction_status)
+		return;
+
+	skb = mhi_res->buf_addr;
+	if (skb)
+		kfree_skb(skb);
+}
+
+static int mhi_ep_loopback_probe(struct mhi_ep_device *mhi_dev, const struct mhi_device_id *id)
+{
+	struct mhi_ep_loopback *mhi_ep_lb;
+
+	mhi_ep_lb = devm_kzalloc(&mhi_dev->dev, sizeof(struct mhi_ep_loopback), GFP_KERNEL);
+	if (!mhi_ep_lb)
+		return -ENOMEM;
+
+	mhi_ep_lb->loopback_wq = alloc_ordered_workqueue("mhi_loopback", WQ_MEM_RECLAIM);
+	if (!mhi_ep_lb->loopback_wq) {
+		dev_err(&mhi_dev->dev, "Failed to create workqueue.\n");
+		return -ENOMEM;
+	}
+
+	mhi_ep_lb->mdev = mhi_dev;
+	dev_set_drvdata(&mhi_dev->dev, mhi_ep_lb);
+
+	return 0;
+}
+
+static void mhi_ep_loopback_remove(struct mhi_ep_device *mhi_dev)
+{
+	struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
+
+	destroy_workqueue(mhi_ep_lb->loopback_wq);
+	dev_set_drvdata(&mhi_dev->dev, NULL);
+}
+
+static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
+	{ .chan = "LOOPBACK"},
+	{}
+};
+MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);
+
+static struct mhi_ep_driver mhi_ep_loopback_driver = {
+	.probe = mhi_ep_loopback_probe,
+	.remove = mhi_ep_loopback_remove,
+	.dl_xfer_cb = mhi_ep_loopback_dl_callback,
+	.ul_xfer_cb = mhi_ep_loopback_ul_callback,
+	.id_table = mhi_ep_loopback_id_table,
+	.driver = {
+		.name = "mhi_ep_loopback",
+		.owner = THIS_MODULE,
+	},
+};
+
+module_mhi_ep_driver(mhi_ep_loopback_driver);
+
+MODULE_AUTHOR("Krishna chaitanya chundru <krishna.chundru@oss.qualcomm.com>");
+MODULE_AUTHOR("Sumit Kumar <sumit.kumar@oss.qualcomm.com>");
+MODULE_DESCRIPTION("MHI Endpoint Loopback driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


