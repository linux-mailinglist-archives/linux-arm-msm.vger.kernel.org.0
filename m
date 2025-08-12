Return-Path: <linux-arm-msm+bounces-68764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6313CB225FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A28A1738E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C2B2EE5F7;
	Tue, 12 Aug 2025 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZiHxeTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4C1EF0A6;
	Tue, 12 Aug 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998593; cv=none; b=tovCuvGbgKUPJdIRaH2m+3C0xj2i9RrVs5D+hAgBnRvuHWwb3GUWvlDeYPR1Xh1fBwGTw64QxWqEJXvNp2jepoDl+ROwEDRBjZ0wD7/ab8K+JkT/Rjwve6DTfQBMKO01uOVzOIG4MctLCAjanmLl5/aO2pr/2CD7zqXnHspGl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998593; c=relaxed/simple;
	bh=/W1adCOJv3wLmC7VVdXsAo7RT4d/Lhpub4y9rZR0qCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RcoF/QAvmzU7GHvl5F+BponrCXetcIIEPPXhhJOg1BmZRCZtmtnc472l+OZrn06Uo+Z3H0q04QDw/wIK4vIFurNAcwkseJlTLaq4n+S8qq2vypoZZ83XhRGQfnejfu63YYVW26QCh7+ksj8gCmEi4sygAzZZxO7fQLYzEJNi4Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZiHxeTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvf5S020372;
	Tue, 12 Aug 2025 11:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ONTm9qg7SPn
	VL/0BSObVUW367PVMY6bzajqeS8dDjHQ=; b=QZiHxeTgZ/N091UJaUn6eXUf+5U
	Oh5QJugCBwCT+tC/yrlDFD2/30s3ijnbimS+9scdejuSenri7wO1MX1kUvHIAiiQ
	vyKH8S0U5KQT/zZceEQBWSXLvTOazPocoA4kjkItcZ01FrsUmwk5M57dUonoNRZP
	gFYYPXpL7psSVochkCf2UoFo3+agehxAm5WGcgJ21ue8I0OfqeUU0kKdDV/oRoGp
	i6p58gfrTNzAAPZGZjaa6O+9qRGUvB81wztilxjxDdp+1xxrU7TvA9iPu6Dz7tRT
	ZtoX7o0faAQh0KaDB2BDxP5KuyJB1rnjjk/dpArj0/wmKi0uK329d5G3q9A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx64j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CBaPEj003767;
	Tue, 12 Aug 2025 11:36:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm4r57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:25 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CBaP2Y003764;
	Tue, 12 Aug 2025 11:36:25 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57CBaPeX003761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:25 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9C27B223D5; Tue, 12 Aug 2025 19:36:24 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 2/4] driver: bluetooth: hci_qca: fix host IBS state after SSR
Date: Tue, 12 Aug 2025 19:36:18 +0800
Message-Id: <20250812113620.3135226-3-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX0e+Qo2dHitsE
 35ew8hgPIFOuEUR7pTW5bOShGOSZTTYOY4/6g8cjMy2Myuyp5P5olFUzBAZ9UncdySW2WYnXY2y
 2BRKvVWt7lNm3H5hEDEKgEz15Wagi3vWZwc81t0mE+HLRGIF3lyWebVTVAcIPWdzhs4/9BS4gK5
 wSaPa8fCyK76v2xyErHfJKnuo7z6YLorZrhhpBnBU6uDuW4MMboxoj6/hImfurWmP9tloCwWS4o
 xQS1iFT1Oj9C6lNg3ifAdEAFpBEDwaiuBZDpWwIxhZTrREbhBLdyrBxyvuRh4mIcRSlEjIVxplZ
 GO/4hHK2rnQoZVM4FSw3Ne/5hedSSmEK6uefhN053BMJlYtxTHjICxsooRdbpcgK4IvljRG5m77
 aI0SjTpi
X-Proofpoint-GUID: Tgt5aRlOnyluRHDSK8aJ1HR7pqXXFhXq
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b273f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=0QvOL7ISX7D0ise33CwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Tgt5aRlOnyluRHDSK8aJ1HR7pqXXFhXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
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


