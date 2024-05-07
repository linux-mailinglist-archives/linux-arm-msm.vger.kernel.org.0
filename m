Return-Path: <linux-arm-msm+bounces-19290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831B8BDB79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1189FB2319C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 06:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678FA393;
	Tue,  7 May 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klPOq7Bf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D9970CC9;
	Tue,  7 May 2024 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715063425; cv=none; b=Lj0BAQ3jVIDHfdBZ9oBotOjfn7WwdmWBh7D2p132+V/YKI6p7Bv4Q2WivpuUp7iRmxN8s+PhUlxziU1V2EAVdSwNPbCfiCt3T3+F7g2WkjjUn4aYCE7sM+v45uqhHf6lFD1jzTGg0e5r/cfie2rj34ckTfDBE+AdwyigWJ5HbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715063425; c=relaxed/simple;
	bh=yI1QXgpwkkvbEH1Ku7BMujWu9zmZZy/s+Vkj0FGX0Gs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=lKMt3qXMXf/eAAoVndobYxniO9MC1VejsLOaMZjKTnnML0nop1PWK1w/PMPZ79jIx89K2KgTHvuy1twnzW4pw2/U28Ii67kKkEeyJZYp1DleElDy56ozPbu5MZyvpKf+3C8NZpixa6bdUOd1keXmSj3syTxqS0IeLnIIawKfGeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klPOq7Bf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4475lvkK002610;
	Tue, 7 May 2024 06:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=D+m2+YkQlZgk
	Ucb7R1YJIcsm/RN8EUqn1RxqnRme4WU=; b=klPOq7Bfm+Z89TQEUWyOywGJW4ov
	qMsom6vflRVtTuD2Pd8nV5MtnRhK7f5pU3ckYOicDlU/SD35hwCiHsOJ7JoSNUgt
	pnBIdGPAiJPzguWCLbsK3D6FIVIg4O/jVwF1jFcE8xnoOA7fhREuO9zfb0LzfqBK
	sNoo51b0buPMKgy5+d4avHA6NCWTLeiS7FmYeez4R+AIwAe1uZ7OyDm6Su777RsR
	X/kNoI81eJ7v38YCVgGqQ0j5yvMOkkYpUO6bkTrPRdkVDSDccFPXCaeRMP/SOKF9
	cWunjdhJnfsZ+AXAwfMONSfEhpw6Vpwvps/u/HjnbGk9qJpZIezdPXDMJA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyc03gapn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 06:30:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4476U8Wm031230;
	Tue, 7 May 2024 06:30:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3xwe3kbws4-1;
	Tue, 07 May 2024 06:30:08 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4476U8ds031221;
	Tue, 7 May 2024 06:30:08 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 4476U7je031215;
	Tue, 07 May 2024 06:30:08 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 219685000AB; Tue,  7 May 2024 12:00:06 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] slimbus: qcom-ngd-ctrl: Add stream disable support
Date: Tue,  7 May 2024 12:00:04 +0530
Message-Id: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bzMpiYyZ9pHrJJCAj_lHQ_qhkwR4rM0g
X-Proofpoint-GUID: bzMpiYyZ9pHrJJCAj_lHQ_qhkwR4rM0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_02,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405070044
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Currently slimbus driver doesn't support stream disable
callback, it only supports stream enable callback.

In slimbus usecase, client is switching to new frequency
with same channel and calling enable stream callback for
new frequency but DSP subsystem is crashing as we are switching
to new frequency with same channel without disabling stream
for older frequency.

Ideally, before switching to another frequency, client should
call disable stream callback and then enable stream for newer frequency.

Hence add support to disable stream via qcom_slim_ngd_disable_stream().

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 70 +++++++++++++++++++++++++++++++++
 drivers/slimbus/slimbus.h       | 13 ++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index e0b21f0f79c1..d952827d2e12 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
 // Copyright (c) 2018, Linaro Limited
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/irq.h>
 #include <linux/kernel.h>
@@ -1084,6 +1085,74 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
 	return ret;
 }
 
+static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
+{
+	struct slim_device *sdev = rt->dev;
+	struct slim_controller *ctrl = sdev->ctrl;
+	struct slim_val_inf msg =  {0};
+	u8 wbuf[SLIM_MSGQ_BUF_LEN];
+	u8 rbuf[SLIM_MSGQ_BUF_LEN];
+	struct slim_msg_txn txn = {0,};
+	int i, ret;
+
+	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
+	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
+	txn.la = SLIM_LA_MGR;
+	txn.ec = 0;
+	txn.msg = &msg;
+	txn.msg->num_bytes = 0;
+	txn.msg->wbuf = wbuf;
+	txn.msg->rbuf = rbuf;
+
+	for (i = 0; i < rt->num_ports; i++) {
+		struct slim_port *port = &rt->ports[i];
+
+		if (txn.msg->num_bytes == 0) {
+			wbuf[txn.msg->num_bytes++] = (u8)(SLIM_CH_REMOVE << 6)
+							| (sdev->laddr & 0x1f);
+
+			ret = slim_alloc_txn_tid(ctrl, &txn);
+			if (ret) {
+				dev_err(&sdev->dev, "Fail to allocate TID\n");
+				return -ENXIO;
+			}
+			wbuf[txn.msg->num_bytes++] = txn.tid;
+		}
+		wbuf[txn.msg->num_bytes++] = port->ch.id;
+	}
+
+	txn.mc = SLIM_USR_MC_CHAN_CTRL;
+	txn.rl = txn.msg->num_bytes + 4;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x ret:%d\n",
+			txn.mc,	txn.mt, ret);
+		return ret;
+	}
+
+	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
+	txn.msg->num_bytes = 2;
+	wbuf[1] = sdev->laddr;
+	txn.rl = txn.msg->num_bytes + 4;
+
+	ret = slim_alloc_txn_tid(ctrl, &txn);
+	if (ret) {
+		dev_err(ctrl->dev, "Fail to allocate TID ret:%d\n", ret);
+		return ret;
+	}
+
+	wbuf[0] = txn.tid;
+	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
+	if (ret) {
+		slim_free_txn_tid(ctrl, &txn);
+		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x ret:%d\n",
+			txn.mc,	txn.mt, ret);
+	}
+
+	return ret;
+}
+
 static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
 				   struct slim_eaddr *ea, u8 *laddr)
 {
@@ -1642,6 +1711,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
 	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
 	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
+	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
 	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
 	ctrl->ctrl.wakeup = NULL;
 	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 00a7f112574b..21543d125614 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2011-2017, The Linux Foundation
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DRIVERS_SLIMBUS_H
@@ -316,6 +317,18 @@ enum slim_transport_protocol {
 	SLIM_PROTO_EXT_HALF_DUP,
 };
 
+/*
+ * enum slim_ch_control: Channel control.
+ * Activate will schedule channel and/or group of channels in the TDM frame.
+ * Suspend will keep the schedule but data-transfer won't happen.
+ * Remove will remove the channel/group from the TDM frame.
+ */
+enum slim_ch_control {
+	SLIM_CH_ACTIVATE,
+	SLIM_CH_SUSPEND,
+	SLIM_CH_REMOVE,
+};
+
 /**
  * struct slim_stream_runtime  - SLIMbus stream runtime instance
  *
-- 
2.17.1


