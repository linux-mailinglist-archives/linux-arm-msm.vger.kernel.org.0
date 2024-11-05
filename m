Return-Path: <linux-arm-msm+bounces-36990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B519BC293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 02:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC6C28321D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 01:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BE91CF96;
	Tue,  5 Nov 2024 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RXbq5GUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBBE1CABA;
	Tue,  5 Nov 2024 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730770266; cv=none; b=DEC/HdOPlEMGEfRj/nOZy32Wqs/aUf8ogghXbs04wFMVEqZPEPUzzRGlgCWMXCoTJZ31LMb/dJbiEarP5Ej5TISL9cR8TUM6FLbViTdLO1eDJmv/oODIgXwNQtOVRqEf2FYZMGUkgXRZruDloKWPDmhBagPORU32sa4ZACT4CsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730770266; c=relaxed/simple;
	bh=HE0Z3PdKCdARQTSpQnr3tQHQ+p3SRWB8GBHMNvVTmWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=JlMNvgkKlxnEXzfnZtfBiocTD8VDFV5zkVy9uT02b196h82FYxhpJ/yHRXa5xi4kTYeBvH0IQcfOOUV72JGTxjMV1mLXZBdvo9Ry/J+e4WYSqqDeK4xTwZTDiHursAdCMtEF5HUrkMZQODN+Zy55TTEQH8ir6hDe9tknCnsVFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RXbq5GUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIlvh009195;
	Tue, 5 Nov 2024 01:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SGfY4xcVJjM84r0YsAPvG1
	hVrTz+bA8oYOJiz362C8c=; b=RXbq5GUXs0e3ke+y14PG1gBZysIvdtWzkPrTGN
	JHbHxyYKlzDl3LYi7y4dl7IEXQ/kYnodaYJazRKMvHrViuTzjDdojDSuwXhwBF2q
	aaUzTKt89v5cc4/4yBfLLdHYh2YS7aUNZfv87/vOdEZQvykkixHcI30bqhCLmWGI
	/73W9MWD1taoPYRELfERQWRD0DA9XyjGXWxalkfSHmHiGBEch0GOW4ratqb3GQS1
	D6rBk781wFQf77Wci2Czpz9tHcla5ZpP3rrmY2hyUjsl9CWewxeGhlaJddnYo2Tz
	mv//etZUjc2BC4YPIn3NpWx5CSFVXepWnJ13rxGf6F+ch/Cg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4unye2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 01:30:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A51UQcw014305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 01:30:26 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 17:30:25 -0800
From: Chris Lew <quic_clew@quicinc.com>
Date: Mon, 4 Nov 2024 17:29:37 -0800
Subject: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAB1KWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwMT3cKikqL43IxM3ZS01GRjU2MDY4PENCWg8oKi1LTMCrBR0bG1tQB
 RBdbMWgAAAA==
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman
	<horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Loic Poulain
	<loic.poulain@linaro.org>,
        Maxim Kochetkov <fido_max@inbox.ru>
CC: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bhaumik Bhatt
	<bbhatt@codeaurora.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew
	<quic_clew@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730770225; l=2100;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=l/2R1bFTH1P6r02ldFAB/Su/VVR10tVU+0qSK5qySvM=;
 b=/79qRr0F+lIQoeAb9KFZVcP4ODBJoBFOJEnNVYG0fXfeumbmctYkOXfAuodPxupRM7paHl2H7
 3Vq79Y84drZDxrM+MFvjaLZYLCYgE7aUYfDedZWwxDQEI8oVSs9Ns+G
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wp-EMW0fy4hDk3Pfut9U-pAFgIahto6M
X-Proofpoint-ORIG-GUID: wp-EMW0fy4hDk3Pfut9U-pAFgIahto6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=816 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050010

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

The call to qrtr_endpoint_register() was moved before
mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
callback can occur before the qrtr endpoint is registered.

Now the reverse can happen where qrtr will try to send a packet
before the channels are prepared. Add a wait in the sending path to
ensure the channels are prepared before trying to do a ul transfer.

Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 net/qrtr/mhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 69f53625a049..5b7268868bbd 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
 	struct qrtr_endpoint ep;
 	struct mhi_device *mhi_dev;
 	struct device *dev;
+	struct completion prepared;
 };
 
 /* From MHI to QRTR */
@@ -53,6 +54,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	if (skb->sk)
 		sock_hold(skb->sk);
 
+	rc = wait_for_completion_interruptible(&qdev->prepared);
+	if (rc)
+		goto free_skb;
+
 	rc = skb_linearize(skb);
 	if (rc)
 		goto free_skb;
@@ -85,6 +90,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->mhi_dev = mhi_dev;
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
+	init_completion(&qdev->prepared);
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
@@ -97,6 +103,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 		qrtr_endpoint_unregister(&qdev->ep);
 		return rc;
 	}
+	complete_all(&qdev->prepared);
 
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 

---
base-commit: 1ffec08567f426a1c593e038cadc61bdc38cb467
change-id: 20241104-qrtr_mhi-dfec353030af

Best regards,
-- 
Chris Lew <quic_clew@quicinc.com>


