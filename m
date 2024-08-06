Return-Path: <linux-arm-msm+bounces-27971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90881948823
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 05:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B31441C221F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 03:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BC71BA88F;
	Tue,  6 Aug 2024 03:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="buSzIbI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0F1B9B5F;
	Tue,  6 Aug 2024 03:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722916605; cv=none; b=U1eh/GJ8ttIwy4UuOPiiAQXxi1CBvnlGmTqlFzmMZyR/t0Yn2+dMZ4jdf/aTgwFZHYvbK4Rdwpa5m5IyWi5W6dXAJ1cP+2bRFLwTFQoeZjiL0mWfQlnHk70iY1LeKRM0GadyzRrH78VK+rtirdiF7L2rJRqPSnpRVDVoeN2XPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722916605; c=relaxed/simple;
	bh=Nkco8xde0TNvbmmDf73VeRHcF7dEl3OY9wZ74afj6yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aW1FzreXEgHVLAZOizu553pcCjxfvZqFDv129aeBOFk2wpa/n8G9ouH9CRkCr4Cmmvp3XFHk5na4T94hcODVcPAlwynpRgnVojEZA5c9sgJxxpBUdY/sElgwNYkvxOnQQ6me1QX3Xi4/TKMBWBn8uVAZg6LDGDgnzPB5Zy7feX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=buSzIbI8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4761Z22o024983;
	Tue, 6 Aug 2024 03:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bQYWplSVoTcIPlxth7T5VwajWHjd2c1xBYGMayBnGyI=; b=buSzIbI8wMJyXWy6
	fK+4/dmrndwdZNP21EhSjpDDQooswR/t8qwiwXIeqrgXrWK+LKUxYMLqV2QSCuWl
	mT28PATKB0HUzToasIyDwhIhKyEpnbgOzKmHSxTgkBKmDzAEZW5EewPVl3x/94Cp
	OJxrIFgKoGmAyptDvRkhXCvvGuqtOBm7cq0JfUk3wYtbG5LoeqOGWt2gq3//aH4M
	mW5+09H4+zxzIO2bU6u8LDouq5KJIDW0nZzodQDElhLhMDXrODkWWxhTGv3QR49W
	JdqUIdJjr/Ell8na2sBrWYCCtNYOIqF4DfX7np9ehi7y5YOc0JOuA8BSyPlLDvNL
	vN5dlw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sa8ex1wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 03:56:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4763uRpi026887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 03:56:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 5 Aug 2024 20:56:26 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Mon, 5 Aug 2024 20:56:25 -0700
Subject: [PATCH 1/3] rpmsg: glink: Tidy up RX advance handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240805-glink-tracepoints-v1-1-a5f3293fb09e@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722916586; l=3928;
 i=quic_bjorande@quicinc.com; s=20230915; h=from:subject:message-id;
 bh=Nkco8xde0TNvbmmDf73VeRHcF7dEl3OY9wZ74afj6yk=;
 b=1mPrvldlRChxI94Uwd+5SzYIZd6Uzw8YvwJ9q4LYgAx6sfbAe48RNHWbnLPxxjc2M52eiW/RN
 OoYQvl43dJJDJvFg3mzlTqkfrhSt9PHzFlsXtI48f3uR7Z1sBq1MRut
X-Developer-Key: i=quic_bjorande@quicinc.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CSuC7H172qn4aUDFxGQsvhfd8HGqqegF
X-Proofpoint-ORIG-GUID: CSuC7H172qn4aUDFxGQsvhfd8HGqqegF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_02,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060026

The operation of advancing the FIFO receive pointer is sprinkled between
the interrupt handler itself, and functions being called from this.

Push all the RX advancement operations to the individual handlers, to
unify the style across the handling of the various messages.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/rpmsg/qcom_glink_native.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 82d460ff4777..e764ea8a290c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -424,6 +424,8 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
 	struct glink_channel *channel;
 	unsigned long flags;
 
+	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
+
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
@@ -745,6 +747,8 @@ static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
 	struct glink_channel *channel;
 	unsigned long flags;
 
+	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
+
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, cid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
@@ -952,6 +956,12 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
 	return ret;
 }
 
+static void qcom_glink_rx_read_notif(struct qcom_glink *glink)
+{
+	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
+	qcom_glink_tx_kick(glink);
+}
+
 static void qcom_glink_handle_intent(struct qcom_glink *glink,
 				     unsigned int cid,
 				     unsigned int count,
@@ -1022,6 +1032,8 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 {
 	struct glink_channel *channel;
 
+	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
+
 	spin_lock(&glink->idr_lock);
 	channel = idr_find(&glink->lcids, lcid);
 	spin_unlock(&glink->idr_lock);
@@ -1067,6 +1079,8 @@ static void qcom_glink_handle_signals(struct qcom_glink *glink,
 	unsigned long flags;
 	bool enable;
 
+	qcom_glink_rx_advance(glink, ALIGN(sizeof(struct glink_msg), 8));
+
 	spin_lock_irqsave(&glink->idr_lock, flags);
 	channel = idr_find(&glink->rcids, rcid);
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
@@ -1114,7 +1128,6 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
 			break;
 		case GLINK_CMD_OPEN_ACK:
 			ret = qcom_glink_rx_open_ack(glink, param1);
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
 		case GLINK_CMD_OPEN:
 			ret = qcom_glink_rx_defer(glink, param2);
@@ -1124,27 +1137,22 @@ void qcom_glink_native_rx(struct qcom_glink *glink)
 			ret = qcom_glink_rx_data(glink, avail);
 			break;
 		case GLINK_CMD_READ_NOTIF:
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
-			qcom_glink_tx_kick(glink);
+			qcom_glink_rx_read_notif(glink);
 			break;
 		case GLINK_CMD_INTENT:
 			qcom_glink_handle_intent(glink, param1, param2, avail);
 			break;
 		case GLINK_CMD_RX_DONE:
 			qcom_glink_handle_rx_done(glink, param1, param2, false);
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
 		case GLINK_CMD_RX_DONE_W_REUSE:
 			qcom_glink_handle_rx_done(glink, param1, param2, true);
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
 		case GLINK_CMD_RX_INTENT_REQ_ACK:
 			qcom_glink_handle_intent_req_ack(glink, param1, param2);
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
 		case GLINK_CMD_SIGNALS:
 			qcom_glink_handle_signals(glink, param1, param2);
-			qcom_glink_rx_advance(glink, ALIGN(sizeof(msg), 8));
 			break;
 		default:
 			dev_err(glink->dev, "unhandled rx cmd: %d\n", cmd);

-- 
2.34.1


