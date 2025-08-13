Return-Path: <linux-arm-msm+bounces-68878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D0B23F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16061AA6649
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5532BE02B;
	Wed, 13 Aug 2025 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXHpgWqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541CF2BD5B2;
	Wed, 13 Aug 2025 03:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056125; cv=none; b=QYUk1EokaNf+9E3B0nPR5LMT8iexNOwy1BLaUxO1utdD2ZlasLxYHYB8LikJYe6tG0PMT7bWd8AI7vj7dxiP+jix2eA0pONcXqPZd0PnLgPldKE3NU4VMRkCxRMvKpn//6lJas1Uu5czzbF5ECP1VK2pDzwlZZzLk6R272LN5tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056125; c=relaxed/simple;
	bh=/W1adCOJv3wLmC7VVdXsAo7RT4d/Lhpub4y9rZR0qCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L3VkiO4Z+UjWXTMQPu7Tu0zAFY5orMTCpIhftLIF45NPMxkbcSCnHHAmLsS/4VmbEc/6z9J0Ba0DnH2Wi5RipFJARY3gGy9jI03AHB1RZ0dX4rmMKkVXs8RIt6Yu5lKsdRPu2TIiYWeVekkilU8LTostfIwikyopvnRRjxG+lVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXHpgWqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKNAq5020444;
	Wed, 13 Aug 2025 03:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ONTm9qg7SPn
	VL/0BSObVUW367PVMY6bzajqeS8dDjHQ=; b=NXHpgWqzqSu6YEtWfPQIfrV/YQA
	lq4z6iZmX225b7OocPluNFY5/fpdwAvjgyNDI/Np1Asj6qMED00o5Pb8vXtFwj7a
	mCuljqVvlbJEiau9w7w84IbI2ssTZftQIboj7ghPKSedDOE1IBu/wI5l/d2kiJGQ
	kQ7kN4Y+QlCZXIq2hx5Ieg2oWXWDcz1cEDCXDp4xJ6YvV4WK5nB0mlbulFKScw6+
	Ii4yD1cIZz49y1WzDsZS0c2PZ9hm3vUJhCtEfZaC6BAr7+lnKN9PYGPNJI1Dftgp
	zMBbil9QYHY5389R5wNBrFSeGahD+wNgl5qbODTorOjMeQf152g+MekFbmg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx8fqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3Z9uF009458;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydm0fjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3Z9vC009455;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57D3Z9g0009453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9B3CF2242D; Wed, 13 Aug 2025 11:35:08 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 2/4] driver: bluetooth: hci_qca: fix host IBS state after SSR
Date: Wed, 13 Aug 2025 11:35:03 +0800
Message-Id: <20250813033505.3868781-3-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX2hBbK3cRVJgN
 uwaQWkp0QhARqpY/8P0ZaXq2BwStxza19KgxTnkllnFmzTW/XVyZRjTCEIBKoHTUtcAb2CYb0K1
 a2CdpEhiuQHaQIY1rrH+AuJolC3ZYSJolCzyxF1iYfszsOWFtJ/+Ye5lt2QOMovLrBA24QoAlnQ
 HBqQpQ3P5358/yMQr+Wi+DME/m2mt5fTz1Bcv4BJzZoYs/Rp8PAKZW0y4H62jUsRYaS4jZMWPmt
 tjav4qz75HHGVkAYP+p0njGp+OZ9HBvR0YJaeBOJXdGIMXSDnk8JcMMCdE6g7DkS2HWO/ckmLrU
 xg2B7zt7HxUatF74Kuz8Pu7E4JiYwf7vcqv51M6QBrXNrP5U0JqyWqm6XX5CTftAxYlFV0so818
 J6HkW9kM
X-Proofpoint-GUID: 9PwnCK1sUvlKgCXDvZyHRMxoMG4ObcUo
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c07fb cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=0QvOL7ISX7D0ise33CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9PwnCK1sUvlKgCXDvZyHRMxoMG4ObcUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 14b2d1bee..50ec9b155 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1659,10 +1659,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
 	 * This leads to a reset command timeout failure.
 	 * Also, add msleep delay to wait for controller to complete SSR.
+	 *
+	 * Host will not download the firmware after SSR, controller to remain
+	 * in the IBS_WAKE state, and the host needs to synchronize with it
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		msleep(50);
 	}
 
-- 
2.34.1


