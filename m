Return-Path: <linux-arm-msm+bounces-68763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C03B225FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BA5118950A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C732EE286;
	Tue, 12 Aug 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c1z4yeE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB32EBB97;
	Tue, 12 Aug 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998591; cv=none; b=iyKfbpRSiviQFiqPUEYgVJs7P2MAFULIeCdRJuXCqRwt9hngs51fYS2/04Z2UWzXGvWfN6VeMpIvZb9CKewnOO3UVxLqE6ZtW60+6kKa4cSCW4k1L3HRfRERknz3DxHu/sODxJz3OyFvAdqmtQnNg/7vNl9AjOsu6N942j7UtJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998591; c=relaxed/simple;
	bh=/oP2+a2aEzOIXE/jalTy5HvnQWWnZG07n635j/5ri3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZTVyr8X9rs9Jd5Kd1YG52aSvJgFqWHa/vwKHjmUcMATGw/iBvB5HEKgmhiMLFqOlF9XlkFUrxVnf19a3qYxWKAcra+D7rzfOrVxB+kZCVn8cAgbLuZlRxHHEHGXpGJn2jYc3BxY+Dvu9rnb3eKYU4osgZb2B6Sb/ksk8F1Apa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c1z4yeE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvp0v032388;
	Tue, 12 Aug 2025 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E2Db8sgz1JO
	npK0C/euhkpHXxph8RB5WRTnzKyVIrrA=; b=c1z4yeE8Zw0ACe05WBX3T0+HeIu
	ngdh1DXCHmey7SoRr7PaK6MEdR030m+3tBhC/4wAl4Yn0DscadqCmplmhB0Hqp4Q
	aLCsCUakd3vW8JoyYN5tRaro5QkJHrhmEohuACE16EDfOTwG/Z8B83LB6KuKa9G1
	wpMhjaU7+7SS2vK8LEhrwgNnGktume2Yc3LNnkQlffCuURqEn0VO3EgWA3cBRJ/O
	gGkvCxTNgPEYqeFtXKD5Rrm0MUQzRQ6DQ4Tm3G1gH8EsSiG92mfR2HNN3YNk+kCX
	jxbFi9Rih+bpnQAw07hXwJ8UW5fLl2XTLoGsVINsIJFauhxalzHYVjbncCg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vju0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:28 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CBaQFX007955;
	Tue, 12 Aug 2025 11:36:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 48dydkvfpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:26 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CBaQuA007952;
	Tue, 12 Aug 2025 11:36:26 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 57CBaQnS007951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:26 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 3DEDD2289D; Tue, 12 Aug 2025 19:36:25 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 3/4] driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one coredump file
Date: Tue, 12 Aug 2025 19:36:19 +0800
Message-Id: <20250812113620.3135226-4-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4a/lx8JFdzV1
 D7RrARnqJ2sqhCkW6cSaFC+i/HmwLUo314mcH+/6Z+mtUTw6HU4WUF8t1xyaSxamafEVBmoG2us
 26TkIy/3Xxr6j4Vv0oKwy3qKdiorPiZTRZ8ol1ntXQEZ7+mutK7gX2zjAS/rCqZSjrxgG07oKwN
 czIW4Pbw85GLBEfApEh5iV+xnzjF4upFPyGwrXcOn2zQ8ZqEi5jeqlqLE4nEyfZVLt/CYDzf4fY
 toVFTHUvF76Wwlrxf1lQzguWUJ1naxPTZLcYilp1ayhbgTXfZDH6id/5Wjln/9fDAcKm3TgvBY5
 GStgBVGaKrbsL3Gu9Duvh4qDmuNRuCpIhY6quuHDuWWpjhdpEKC3jvKISUxmmuWghLMW67gB7qG
 ynMSzFE1
X-Proofpoint-GUID: WQ9Pg3IfxMvcLf2tbiluenDX3iUr6Krd
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b273c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z2vcJYTkWAVNmr-hFscA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WQ9Pg3IfxMvcLf2tbiluenDX3iUr6Krd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 50ec9b155..33c2dd7b8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1662,11 +1662,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 *
 	 * Host will not download the firmware after SSR, controller to remain
 	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * clear memcoredump_flag to ensure next submission of coredump date.
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
 	}
 
-- 
2.34.1


