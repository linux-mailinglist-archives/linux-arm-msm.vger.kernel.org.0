Return-Path: <linux-arm-msm+bounces-68762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D4B225F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 952BB3A9984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799BD2ED870;
	Tue, 12 Aug 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gLbpccFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F541EF0A6;
	Tue, 12 Aug 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998591; cv=none; b=mDeRV6xIMqhYJNv0qHksD2FpTsZXCqofpL/U/r4Wy4fnz30Jk2HengOC8PFzVpmC+nKjO3nd9K4m7a5NlRJz4TIMfo+anS97wEPB2mjIBj/g+Le2Q/fb3zNCdPlfOOJ/WXHYmdA84x5EoYxIZ8P/oyy46NJGotiiU5awShn52l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998591; c=relaxed/simple;
	bh=XrrTaQC2x0LJ3m2PgZHSfof9kgFnUUKG0+ebuJ2ih6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5DPhpoz04CGihtY9FCE1Ut0JqUg76eZFGW1wspHmKWuZ4ZDM4U4//Nv1YigAqFOeBz/ip/WHl7K3t8UAZuZFHvtAC/JXb2f1oG7ZKaActXfcQVPqXCIKYrfI2JCbxsbiODdwsjTDVfzQbWpsB9baBtkNTgTpGjxBffKy/uyfOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gLbpccFc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAveog029539;
	Tue, 12 Aug 2025 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OZJdTzgLVZQ
	H3wPGatNmiWGfzAWQMrSyZVVHIlxHMIM=; b=gLbpccFcnNI2nxI2XaRLGRIBzjs
	bsvPxrcWueQrctuP/MP+yWy32T7v5g01Oywsf4Qmh9YXWJJ/GS1OciSFgcfSSPa9
	YKgD9MCl58X7BnZU30OdtpaGctykztkfe/+xzK/hHJv7yLDB0k9Mkc/Hto2hIeYJ
	GJHB1B0WzfryLyrJSgghaVg6RBdP0CJOgO6wqKdCYgyf1PD44TbJqfEhhNimSH0S
	aNdYjd9zeJyJP+WwE1onD0Fg1J1PRF84y9FCuIyMpKXBJycMk55uWoUSiZorXknQ
	1vONEaVz7/SQpOlbq4JQHLiba0C2AvK43MjyQMieSNPxex0QsGh1dD+HIlg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g7wtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CBaPli003754;
	Tue, 12 Aug 2025 11:36:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm4r5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:27 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CBaRQH003777;
	Tue, 12 Aug 2025 11:36:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57CBaQCY003776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id E25DF223D5; Tue, 12 Aug 2025 19:36:25 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 4/4] driver: bluetooth: hci_qca: SSR(Sub-System Restart)process failed due to tx_idle_timer timeout
Date: Tue, 12 Aug 2025 19:36:20 +0800
Message-Id: <20250812113620.3135226-5-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
References: <20250812113620.3135226-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689b273d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=7-08G_DUf5nQLP0U7KQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX6iCg/U+xMisO
 nCfqn5Vk0BU6JaHDYckcH7rUMeFXl7EQELTk5cejeT2m0fVw0GvEW+h7b1i88qL7l6mywLgVjeW
 YgDSJ9mzALC/QfhcI7BsAu+0GKdYUkmiYWxQtSdohrULnAetNAJk07s93vIds025aRsdIGimK1g
 R4u+0QP5aRW5TAgvSap2H4bWAgP1TcmAEJN8kFLTyvPaCawzr7zFWTTHApxaP1f0OL4eWd8m1HN
 d9XEbz7Tj/Lhfdt1NxJJ0RLcm0r4dLjB9MtZFAaXA8pNLYZmW+UkIchPnQLP7vYMNzgvpay5TWH
 a+nwBAGiPIExF0laUDQebhPCZA8JSKf9u/fLjNNz9VW47c5a0mqUVZTPzERjUJp8ZMck/PWEedy
 FkSmRNXq
X-Proofpoint-GUID: g9Gl2Wc0gu724vWVMWraWnzUklCVYqJ9
X-Proofpoint-ORIG-GUID: g9Gl2Wc0gu724vWVMWraWnzUklCVYqJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

When the SSR (Sub-System Restart) duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 33c2dd7b8..1fb8eea09 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1668,6 +1668,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		/*
+		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_timeout, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sloeep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+			  msecs_to_jiffies(qca->tx_idle_delay));
+
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
-- 
2.34.1


