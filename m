Return-Path: <linux-arm-msm+bounces-32436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF3398541F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 09:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115ED1F21244
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 07:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6172A15C136;
	Wed, 25 Sep 2024 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oOBiE37b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0115852E;
	Wed, 25 Sep 2024 07:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249035; cv=none; b=MlfByUVkHZlc0dvwN0EJwaUzyEOl1Rc1ec0XKPntQWe7iGf3kgfj8JvI4J3WXY3YSEJuBtNhr7hRtg+kVc7y6l5YhqXvvSE2DrkxtnveG6uTg77pqwCbDD88KAAnsqptaTfLvKdGPk4K152BoduBDGVdrucXB1tDvmH6cxK6cO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249035; c=relaxed/simple;
	bh=vrJLRTaM8vLQbQvHYHMUqyBvqO0BZuVwMB/6a3RGmP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6hJiGGv5/qIpL+AqN/aJpUV21U/GrfpiGX0AoQx9RMcU91X5ivfyQOwD1Q+1xQ7MjTV2x56qrcwHqqrU3NKeXBc7OIYAzTJGfFfZlH3adkT4VTHM1JgxtqfrEV26oQqrfepzpQ3/kQkvlNfM46w/F5HE0NnMb87dZyfTk7SrNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oOBiE37b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIu8I8017406;
	Wed, 25 Sep 2024 07:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RW9uqI2u7e537Jy88OFRJu
	5D/8fSuY3/wdo7VX82wrY=; b=oOBiE37bYFBZB1YC2PSmpDc84QRaucNqgjEGNT
	0JvClgtbqF1EL1iDcMYwO8zT8uyGaHqoCg6NhCUTg9e8nKMCYqNvlpijMFBQjPIV
	Kz847Q2fl2DlZaON1DmUQPVuYUjSPnYn87zffeMgHxxcd8GLjiX71ff177DVbhhZ
	TyLpRfvn03BEOtgw+bNI3tqv13Uwoq1IFFDCdw7Jj1+fx7Q9AbgHqZ6l754uGMk8
	VQ32KWViiRRpkM4zHY5sGyhahEcY8rOPVxtMDLr2QDIHKEUKpejxCAuyZjaxAqxE
	uC9Tv8OSdteEDSRKHkY+Rkz5qhx2xLSkg323NMW4hCqKxVsA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyka4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:23:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P7Nmrq000420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 07:23:48 GMT
Received: from hu-deesin-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 00:23:44 -0700
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_sarannya@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <stable@vger.kernel.org>, Deepak Kumar Singh <quic_deesin@quicinc.com>
Subject: [PATCH V2] rpmsg: glink: Add abort_tx check in intent wait
Date: Wed, 25 Sep 2024 12:53:28 +0530
Message-ID: <20240925072328.1163183-1-quic_deesin@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: dF6Huu5oJ8GGHAu5Q5qQUqkjRK83dJ9O
X-Proofpoint-ORIG-GUID: dF6Huu5oJ8GGHAu5Q5qQUqkjRK83dJ9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250051

From: Sarannya S <quic_sarannya@quicinc.com>

On remote susbsystem restart rproc will stop glink subdev which will
trigger qcom_glink_native_remove, any ongoing intent wait should be
aborted from there otherwise this wait delays glink send which potentially
delays glink channel removal as well. This further introduces delay in ssr
notification to other remote subsystems from rproc.

Currently qcom_glink_native_remove is not setting channel->intent_received,
so any ongoing intent wait is not aborted on remote susbsystem restart.
abort_tx flag can be used as a condition to abort in such cases.

Adding abort_tx flag check in intent wait, to abort intent wait from
qcom_glink_native_remove.

Fixes: c05dfce0b89e ("rpmsg: glink: Wait for intent, not just request ack")
Cc: stable@vger.kernel.org
Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
---
 drivers/rpmsg/qcom_glink_native.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 82d460ff4777..ff828531c36f 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -438,7 +438,6 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
 
 static void qcom_glink_intent_req_abort(struct glink_channel *channel)
 {
-	WRITE_ONCE(channel->intent_req_result, 0);
 	wake_up_all(&channel->intent_req_wq);
 }
 
@@ -1354,8 +1353,9 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
 		goto unlock;
 
 	ret = wait_event_timeout(channel->intent_req_wq,
-				 READ_ONCE(channel->intent_req_result) >= 0 &&
-				 READ_ONCE(channel->intent_received),
+				 (READ_ONCE(channel->intent_req_result) >= 0 &&
+				 READ_ONCE(channel->intent_received)) ||
+				 glink->abort_tx,
 				 10 * HZ);
 	if (!ret) {
 		dev_err(glink->dev, "intent request timed out\n");
-- 
2.34.1


