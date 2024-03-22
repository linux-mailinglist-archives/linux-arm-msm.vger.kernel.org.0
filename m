Return-Path: <linux-arm-msm+bounces-14884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0338B887265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 18:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962D11F25044
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 17:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7AF60DC3;
	Fri, 22 Mar 2024 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UT7pT0u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B460EDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711130294; cv=none; b=VbeFZj5SAApiC3dlBLuQkNh51XBH657om7MLdYtyPALH9kD5Dq1KS2dHj8lANPzbbhYjW/yWoJxbRabvdP/pXwySNEg89gPKvA2dsNFyE0G3hNBp/aH3gztfEiIscyr4yUHKpQBs07LJ0NPqsXv6oo2TDPopREkxt9X0Io+OVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711130294; c=relaxed/simple;
	bh=c/dblCiO4Px9RToF9oEe7+7sLqcXxI8BNqtnUyFQ2Rw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XOpC1ulZAdtQKKdL6SRs5Xurw0bdxVDouPx+1aLY4/Wrrl1eVkVmLti4cFPScq7U8G4L8Lj98z/GTmCZJJCzCQmtgh9VE8KfA5Ro+xjVGD+yZ0q2PDTPaS4+xRvy9W7PlaN2aEeIDUHjNxoLIdOq0b7BxUtrPeI3X2kCdyRC1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UT7pT0u0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42MFf8gT016836;
	Fri, 22 Mar 2024 17:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=1BmID4H4QsVqtQQ6kMfotqLyQWAUbfgKs25L03DSIUU=; b=UT
	7pT0u0dvSlrFRNELrt3SQdCcoyPYRz7SeE0GDjk0Mi0mPU4uD1WXqqsaU5Ov3/3i
	4lrjseArj2siQkKAM0aZARkgRhrz028bo/2p2YjF/gSkMGG9QiJOrU3j1betl24L
	UJMgzgO0f+RZ8OXpEYlsoksMFHxSK2QEwsrpsRVBtYg58JtO5MCxh528wZPbXinv
	WtMScwsCljz6XPKxOsNVImwBU936TetSZZp7+JM4+Lzv464cHekNlhAG2jlOPbSC
	SLyEh1l+pkK2tlpBInOOdNUZl73opEepjI40b56FtgF/fuGWaFShF2b0gbWDwrfb
	hSS7MWsArvH6/utrnBdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1ajartx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 17:57:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42MHvujn029370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 17:57:56 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Mar 2024 10:57:55 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH v2 2/3] accel/qaic: Add fifo size debugfs
Date: Fri, 22 Mar 2024 11:57:29 -0600
Message-ID: <20240322175730.3855440-3-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
References: <20240322175730.3855440-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J43izIf96v8y-iIAa4_zUstT_Nk9NB1O
X-Proofpoint-GUID: J43izIf96v8y-iIAa4_zUstT_Nk9NB1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-22_10,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220129

Each DMA Bridge Channel (dbc) has a unique configured fifo size which is
specified by the userspace client of that dbc. Since the fifo is
circular, it is useful to know the configured size when debugging
issues.

Add a per-dbc subdirectory in debugfs and in each subdirectory add a
fifo_size entry that will display the size of that dbc's fifo when read.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 9d0d43fb5b8f..b362960941d7 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -12,6 +12,7 @@
 #include <linux/overflow.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
+#include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
@@ -21,6 +22,7 @@
 
 #define BOOTLOG_POOL_SIZE		16
 #define BOOTLOG_MSG_SIZE		512
+#define QAIC_DBC_DIR_NAME		9
 
 struct bootlog_msg {
 	/* Buffer for bootlog messages */
@@ -75,14 +77,47 @@ static const struct file_operations bootlog_fops = {
 	.release = single_release,
 };
 
+static int read_dbc_fifo_size(struct seq_file *s, void *unused)
+{
+	struct dma_bridge_chan *dbc = s->private;
+
+	seq_printf(s, "%u\n", dbc->nelem);
+	return 0;
+}
+
+static int fifo_size_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, read_dbc_fifo_size, inode->i_private);
+}
+
+static const struct file_operations fifo_size_fops = {
+	.owner = THIS_MODULE,
+	.open = fifo_size_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 void qaic_debugfs_init(struct qaic_drm_device *qddev)
 {
 	struct qaic_device *qdev = qddev->qdev;
 	struct dentry *debugfs_root;
+	struct dentry *debugfs_dir;
+	char name[QAIC_DBC_DIR_NAME];
+	u32 i;
 
 	debugfs_root = to_drm(qddev)->debugfs_root;
 
 	debugfs_create_file("bootlog", 0400, debugfs_root, qdev, &bootlog_fops);
+	/*
+	 * 256 dbcs per device is likely the max we will ever see and lets static checking see a
+	 * reasonable range.
+	 */
+	for (i = 0; i < qdev->num_dbc && i < 256; ++i) {
+		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
+		debugfs_dir = debugfs_create_dir(name, debugfs_root);
+		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
+	}
 }
 
 static struct bootlog_page *alloc_bootlog_page(struct qaic_device *qdev)
-- 
2.34.1


