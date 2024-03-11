Return-Path: <linux-arm-msm+bounces-13853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBE08785EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 17:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F94528139B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651F6482E5;
	Mon, 11 Mar 2024 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pAeU8lo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F24594B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710176352; cv=none; b=C8VDphaKjbr2XLPA6ZKArcVa/D2Y20NhKF3tUgcL/huD3N/lLtARDsS2oL0pxFrKMa+AHfKvBSWIFKzDHIo+cEASxPJdk/ZebhTkzbD6BzUVZJC4AvDpr47S03nyXJ0RcfYpqwo6OWQv1NugSDzI0eX5epcyoLnFIH8SRw152Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710176352; c=relaxed/simple;
	bh=7wywrml0GPP4J30onGE/e1ziNjJIscQqcQdtPG1OpW0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VIEPY5lj1FFduEB0ys7/vLIy1VjoNZuiA3PqgsxbFBPQC03FsD5XBKWmYr19adVZcYWK1tUmF3C2B8SllLFN87GCikP5f3ieMyqTCigZEPvssYWBwaErdnNfrijuoVQ6ZpEseVwoBTAnINzSgwgpUkgh5l2zbXbpPtS6kANj1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pAeU8lo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BDsqMp022165;
	Mon, 11 Mar 2024 16:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=W8uYy4xRp7tjhrZUpf7592lfbzGvMCzWmpJMGMRM7pM=; b=pA
	eU8lo0uXagkJ16f/4tw1e7cWF6RAIZi1qV5fHlrGJGj0Slmn56RI2PwDUweKIYwl
	m6lt4C8g6uqplAzYSjjLOW3Pq7N172jPc7Uojd4jChxU+eoyMrysKgV8+B5EMEIN
	3FD0XvQoxKmJGM7LvitV5Sk+5g1xu98VZHg7UzQ8a+wmVM/8ILuiXxyZF1JUhlJt
	E36szw1q+nLXbjhr0JUfcovoP8ZTKj0/bWgZ1xRhe1hXvbgfuaaGVf8hv8gDNf+T
	vmujEilS3HfqMnA5ukBSpd6ymSpgJTc5TQOjyIxxc51/eg0IUdZuwlcYLnMWx8a/
	8qxwfNMj4VGTazJ/nmQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wssgv9w93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 16:59:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42BGx4CW014985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 16:59:04 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Mar 2024 09:59:03 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 3/3] accel/qaic: Add fifo queued debugfs
Date: Mon, 11 Mar 2024 10:58:26 -0600
Message-ID: <20240311165826.1728693-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
References: <20240311165826.1728693-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: GoqHTIGHfsuXMS1djK1k6un8LBHDXfC1
X-Proofpoint-ORIG-GUID: GoqHTIGHfsuXMS1djK1k6un8LBHDXfC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110129

When debugging functional issues with workload input processing, it is
useful to know if requests are backing up in the fifo, or perhaps
getting stuck elsewhere. To answer the question of how many requests are
in the fifo, implement a "queued" debugfs entry per-dbc that returns the
number of pending requests when read.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/qaic/qaic.h         |  1 +
 drivers/accel/qaic/qaic_data.c    |  9 +++++++++
 drivers/accel/qaic/qaic_debugfs.c | 31 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 03d9c9fbffb3..02561b6cecc6 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -288,6 +288,7 @@ int disable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
 void enable_dbc(struct qaic_device *qdev, u32 dbc_id, struct qaic_user *usr);
 void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail);
 
 void wake_all_cntl(struct qaic_device *qdev);
 void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 2459fe4a3f95..e86e71c1cdd8 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1981,3 +1981,12 @@ void release_dbc(struct qaic_device *qdev, u32 dbc_id)
 	dbc->in_use = false;
 	wake_up(&dbc->dbc_release);
 }
+
+void qaic_data_get_fifo_info(struct dma_bridge_chan *dbc, u32 *head, u32 *tail)
+{
+	if (!dbc || !head || !tail)
+		return;
+
+	*head = readl(dbc->dbc_base + REQHP_OFF);
+	*tail = readl(dbc->dbc_base + REQTP_OFF);
+}
diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 9d56cd451b64..12a65b98701d 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -97,6 +97,36 @@ static const struct file_operations fifo_size_fops = {
 	.release = single_release,
 };
 
+static int read_dbc_queued(struct seq_file *s, void *unused)
+{
+	struct dma_bridge_chan *dbc = s->private;
+	u32 tail = 0, head = 0;
+
+	qaic_data_get_fifo_info(dbc, &head, &tail);
+
+	if (head == U32_MAX || tail == U32_MAX)
+		seq_printf(s, "%u\n", 0);
+	else if (head > tail)
+		seq_printf(s, "%u\n", dbc->nelem - head + tail);
+	else
+		seq_printf(s, "%u\n", tail - head);
+
+	return 0;
+}
+
+static int queued_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, read_dbc_queued, inode->i_private);
+}
+
+static const struct file_operations queued_fops = {
+	.owner = THIS_MODULE,
+	.open = queued_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
 void qaic_debugfs_init(struct qaic_drm_device *qddev)
 {
 	struct qaic_device *qdev = qddev->qdev;
@@ -112,6 +142,7 @@ void qaic_debugfs_init(struct qaic_drm_device *qddev)
 		snprintf(name, QAIC_DBC_DIR_NAME, "dbc%03u", i);
 		debugfs_dir = debugfs_create_dir(name, debugfs_root);
 		debugfs_create_file("fifo_size", 0400, debugfs_dir, &qdev->dbc[i], &fifo_size_fops);
+		debugfs_create_file("queued", 0400, debugfs_dir, &qdev->dbc[i], &queued_fops);
 	}
 }
 
-- 
2.34.1


