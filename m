Return-Path: <linux-arm-msm+bounces-33140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C01990986
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 18:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467941C20C14
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505FB1C8317;
	Fri,  4 Oct 2024 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N4XAVk1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836521CACD9;
	Fri,  4 Oct 2024 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728060062; cv=none; b=sju+482k4gEv/C1OaLvk6DdP+zizIiQKseoS5MeJSkQyXp6JuJcdrzxRV9gZWFCfC9jPZc1G5o7UwigMqcPjXMUUgqZgtjr8zHXiIizIZn4sElGIxMyD8ze3b78q5fhHQXgxqcEJVhrWA4NcXkAsEBkn+VLHVXyy15VRHn/BhPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728060062; c=relaxed/simple;
	bh=cW6o8k7+XVR348Ey8E9O9uFb7YnIrhTusMcLksIwmmI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t3txVS2GGNelML1yqMJ0XSuNxsLRbs48j6UENb8un9o1WMcTrz9Z5os7LgsBW/bqvBfhPNauBS3I15vqchRj4vRvEXS0OjsDnBAodbR/j5li04yOjwk3R8OOV8+7E1Cm6rLQqeVrkU/as11L0g4Wg/kkqzl6MC7O9v5vcCRGKt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N4XAVk1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494A4gkf031989;
	Fri, 4 Oct 2024 16:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+DwclTRQXi12Iy/IFCIuX6
	KK+qMJ7HYg0Ca6ffeDp2A=; b=N4XAVk1+AGEv9DY+5EE9W7iMeRMW6H6nKcJtWd
	aar9Dx2XjBvGzQMGseZ/KCOZMocAWeGqzbQ1alMiLqLrzVho0LeqmR79XfJN3FtM
	AVuxl5LVpM2nYNIrJqDyV4gmVXgI1MvGjdPwbIlmbGuet3kA322H53Q5w75y8PEW
	b4C1M0U+Yf7B/eLAX01eyYK0ULLxFpfFXBM30tM14mW5q9HouLJFRjGCJs1OQ4aO
	hse1UlRqIltOEl8FzyApsC6IyVGWpTAVb99O7j92RHT9GczaHgGeyytyF3bTGwhO
	yr8JgCeA59o1bqUP/W41nIGv21bH4fVQfw7cBwhfvRAspOCg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f2pw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 16:40:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494GesWQ026237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 16:40:54 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 09:40:54 -0700
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <corbet@lwn.net>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
        <jacek.lawrynowicz@linux.intel.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/qaic: Add ipc_router channel
Date: Fri, 4 Oct 2024 10:40:33 -0600
Message-ID: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LGR06R6LCh_XdSeJB5k_XYpJp4cJJY3d
X-Proofpoint-ORIG-GUID: LGR06R6LCh_XdSeJB5k_XYpJp4cJJY3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040115

The ipc_router channel allows AF_QIPCRTR clients and services to
communicate with the AIC100 device. The ipc_router MHI transport layer
expects the channel to be named exactly "IPCR".

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 Documentation/accel/qaic/aic100.rst |  2 ++
 drivers/accel/qaic/mhi_controller.c | 32 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
index 590dae77ea12..273da6192fb3 100644
--- a/Documentation/accel/qaic/aic100.rst
+++ b/Documentation/accel/qaic/aic100.rst
@@ -229,6 +229,8 @@ of the defined channels, and their uses.
 | _PERIODIC      |         |          | timestamps in the device side logs with|
 |                |         |          | the host time source.                  |
 +----------------+---------+----------+----------------------------------------+
+| IPCR           | 24 & 25 | AMSS     | AF_QIPCRTR clients and servers.        |
++----------------+---------+----------+----------------------------------------+
 
 DMA Bridge
 ==========
diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index ada9b1eb0787..8ab82e78dd94 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -405,6 +405,38 @@ static const struct mhi_channel_config aic100_channels[] = {
 		.auto_queue = false,
 		.wake_capable = false,
 	},
+	{
+		.name = "IPCR",
+		.num = 24,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_TO_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = false,
+		.wake_capable = false,
+	},
+	{
+		.name = "IPCR",
+		.num = 25,
+		.num_elements = 32,
+		.local_elements = 0,
+		.event_ring = 0,
+		.dir = DMA_FROM_DEVICE,
+		.ee_mask = MHI_CH_EE_AMSS,
+		.pollcfg = 0,
+		.doorbell = MHI_DB_BRST_DISABLE,
+		.lpm_notify = false,
+		.offload_channel = false,
+		.doorbell_mode_switch = false,
+		.auto_queue = true,
+		.wake_capable = false,
+	},
 };
 
 static struct mhi_event_config aic100_events[] = {
-- 
2.34.1


