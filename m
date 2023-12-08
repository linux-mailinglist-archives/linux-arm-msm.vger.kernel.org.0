Return-Path: <linux-arm-msm+bounces-4017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E7A80A91F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 17:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FBB2B209B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB9138DF2;
	Fri,  8 Dec 2023 16:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ur+WgTde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01921BC1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 08:35:20 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8FKgPh015425;
	Fri, 8 Dec 2023 16:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=5A0bPxu6WhLRUSRcmjb1N/qZpnogW+kDprXjbzMYVeg=;
 b=Ur+WgTdeMDWMHk1PTWHinn79iKeCBhhQT683fKHJfDe9wnfQwDVTbAc6UHJGNZxuJzFr
 TfTsGcdid1SIYO3BkbRJVUq2KZpYUkyizkOUle/BOSoWW45u5NVAQVYmZws3XDsv5iqm
 mxJ/b0vK+fLWMUM55VNpc+WTiaXVL2+ol/SqzCK9V+PmFJKpm/Dm3IqLCIE9GcCARO4m
 AIVDjWIki2FQqplhQXuMwYhGB3wfI0VER0Rb88mOGSW7dXQffVlFeirAGOldblG4/SrI
 4WIA8toldxChsDqQRo8jKQiZfraii6KBmOTzmVpXrP7VaVnkIAeFbAoxtRUJwNgglby5 dQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uubd83xwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 16:35:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GZHAp019973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 16:35:17 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 8 Dec 2023 08:35:16 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
        <stanislaw.gruszka@linux.intel.com>,
        <jacek.lawrynowicz@linux.intel.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 3/7] accel/qaic: Fix MHI channel struct field order
Date: Fri, 8 Dec 2023 09:34:53 -0700
Message-ID: <20231208163457.1295993-4-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
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
X-Proofpoint-GUID: huP8e4fgcOGNpz0d-NffpwL9yAtHK-z_
X-Proofpoint-ORIG-GUID: huP8e4fgcOGNpz0d-NffpwL9yAtHK-z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080137

The timesync channels have their struct fields out of order with the rest
of the channels. Fix them so there is a consistent style in the file.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/mhi_controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 832464f2833a..364eede0ac02 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -358,8 +358,8 @@ static struct mhi_channel_config aic100_channels[] = {
 		.wake_capable = false,
 	},
 	{
-		.num = 21,
 		.name = "QAIC_TIMESYNC",
+		.num = 21,
 		.num_elements = 32,
 		.local_elements = 0,
 		.event_ring = 0,
@@ -390,8 +390,8 @@ static struct mhi_channel_config aic100_channels[] = {
 		.wake_capable = false,
 	},
 	{
-		.num = 23,
 		.name = "QAIC_TIMESYNC_PERIODIC",
+		.num = 23,
 		.num_elements = 32,
 		.local_elements = 0,
 		.event_ring = 0,
-- 
2.34.1


