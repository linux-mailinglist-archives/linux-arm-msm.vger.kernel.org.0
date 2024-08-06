Return-Path: <linux-arm-msm+bounces-27970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 347FA948826
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 05:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79ED0B20E32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 03:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6E81BA893;
	Tue,  6 Aug 2024 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LjOwOe+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A61BA866;
	Tue,  6 Aug 2024 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722916605; cv=none; b=sb48UQQrw2FOTT7Fe41XrNr4sh1gSJJPo7BPIbL41pRndn8tQwE4s91Brn1RMAWNhtbqymLVDOxCm/y52+SftRjOZSWVDxUbebWnXFPgME2GJlGBNwSK1ud4NSigiDT3nQ8eKr3z8yOZn/7MraFwCMbllwA0dvVY2FA11xF2Pmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722916605; c=relaxed/simple;
	bh=cN2OSJlDQH7X0nl05NR0kCFhR3u1rz3cnnPT1YXbtW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UqB4LM5oc74gZgcFuyXuhgUxgBvq3gafKVYsJ24BlpGZ2v5ytUOBGEKu74QvDYRk8c6L/J4qINus4pln4E6Rno8qgaqboh2d/PlTOh+FEIMtSGV1Ojg9njVPcxnZHiZonqqZ1GRzZlgpXxoqzIybRV8CPJDFUL4opVzpyB4Uoso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LjOwOe+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475IpAsr025785;
	Tue, 6 Aug 2024 03:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xG7PSfrwJeM4mD1B0cKC6DTkiu/eSKGxigXFIL+/u8=; b=LjOwOe+9L7GkjHQp
	G3Vqs44IG6mBZdlowtUgdHRsVNs/mWaJs7T585RFqwV2oWwZeGjQyXNwhM6BuBja
	tYMXwqbD8jHs379u1QvcXW8WB97/5CARlobMPtJ4c+HaHXlmBv6kF2Dyi0xbrchN
	wPceJInMr/NlA9iNdA2O61XVGChGm/qLQKC/WEs6fhz4n6UYoxG68pugw6QGhgE+
	93VbUqkX3ZKppXBtrjHrUJD5+KSutwVm/Dp3J1Zp5kk3gmcYRBOL31gTnLW1azAi
	fqsI2QEElEwRkKorTIz5B9SAgwU7Q4DfpwRuNGGA8mL8eV6gbSiNKAvXlt88uVU5
	JjgstA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40u4cpgx4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 03:56:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4763uRpj026887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 03:56:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 20:56:26 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 5 Aug 2024 20:56:26 -0700
Subject: [PATCH 2/3] rpmsg: glink: Pass channel to
 qcom_glink_send_close_ack()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240805-glink-tracepoints-v1-2-a5f3293fb09e@quicinc.com>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
In-Reply-To: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722916586; l=1367;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=cN2OSJlDQH7X0nl05NR0kCFhR3u1rz3cnnPT1YXbtW8=;
 b=Sg3gq6tL8GxFAoRMF1NzHi6rN9pAB1virgFguuHXOpEaSR8n3myrbpkoHwwlMmlgfyvd0o9zG
 TX3SK4n3XC2Apr9lERIrNuNIhszEJz6lG6YZrbCszIbHZ438/z6nfJe
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7FCBuT6F-yf0spVDwHJ57qIqjzpXPg0l
X-Proofpoint-GUID: 7FCBuT6F-yf0spVDwHJ57qIqjzpXPg0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=948 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408060026

Align the qcom_glink_send_close_ack() arguments with other functions to
take the struct glink_channel, so that the upcoming tracepoint patch can
access the channel attributes.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/rpmsg/qcom_glink_native.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index e764ea8a290c..ba0ea28df821 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -511,12 +511,12 @@ static void qcom_glink_send_close_req(struct qcom_glink *glink,
 }
 
 static void qcom_glink_send_close_ack(struct qcom_glink *glink,
-				      unsigned int rcid)
+				      struct glink_channel *channel)
 {
 	struct glink_msg req;
 
 	req.cmd = cpu_to_le16(GLINK_CMD_CLOSE_ACK);
-	req.param1 = cpu_to_le16(rcid);
+	req.param1 = cpu_to_le16(channel->rcid);
 	req.param2 = 0;
 
 	qcom_glink_tx(glink, &req, sizeof(req), NULL, 0, true);
@@ -1628,7 +1628,7 @@ static void qcom_glink_rx_close(struct qcom_glink *glink, unsigned int rcid)
 	}
 	channel->rpdev = NULL;
 
-	qcom_glink_send_close_ack(glink, channel->rcid);
+	qcom_glink_send_close_ack(glink, channel);
 
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	idr_remove(&glink->rcids, channel->rcid);

-- 
2.34.1


