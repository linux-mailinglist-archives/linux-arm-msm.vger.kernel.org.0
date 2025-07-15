Return-Path: <linux-arm-msm+bounces-64918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5C9B050B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 136FA4A35FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7501B85FD;
	Tue, 15 Jul 2025 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AQPl0erT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCA7260578;
	Tue, 15 Jul 2025 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752556599; cv=none; b=CytrbJ3js7ofuyno8hwoPXgaqDDLs2GYmTYBb1QY16avHppcaCDjmkDSk8D+gxn6UEEAURcywdm8YCvRtugCpx1WrdecBDCCZcqV9c8JdetPoWY4WB0nav+vBaFA0p+nHiwIKPshq9b+BhJBCME3QcdshUDi9uT94LqO452aznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752556599; c=relaxed/simple;
	bh=1HwJzPKIbaO8mpHLQXY0zlLfbmNBzjR/vlknkFJXaTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CooL4Qb1Lj/8s2EmS7hYf+RVYrNBNSJ5xZqBMRV4G8Juo3ggS/cze1qXLEsEYLbzpK6N+8MgBwfIoJ2LLEe+5Uhjeo+WdQyRObzdmBEOS4765+9HkwkRO2KU1Cr6mpdGSE9YIrM53ruiEu7Ya/DZ37FfxkFyQHbUdEySFardnAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AQPl0erT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F441YS024867;
	Tue, 15 Jul 2025 05:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M6dX+Ti2wGQ
	oVSUnY4zXJdLYaVpp0x32zS3tKmnlcQw=; b=AQPl0erTTtP9vD+lDOPvkvGUfTO
	PtyhzGF64kSDIbmpK8s2NvpRs4/UNaUgFbE9Q5tz+AZnLYMPpsTV4TdpF5DSmp9Y
	jJ0C7FVKQNmLnMqMIcmCwvZ41u56q2UMgbCHv3Ewp3VvUVOtiuFptXjT5gxUh9JQ
	L1NuBk587Z8pCUg71MlkDAcvh2ACQe1u39+MhTTDmhGZhq7VMF9oHBVprStX4pz3
	yBGDOQlUm1mnF/2Su/vvDbDxnaXlVQFWMd92LCYhIJOiPQjjTPRnUf9ID3dnLKul
	1XPP1zuYzXpJrqxEhHk4dIZo5QExvTD/sdfTpn2+hlVU8Qlv6VddIWGS59g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut6tam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:36 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5GXcG005836;
	Tue, 15 Jul 2025 05:16:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugsmbjjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:33 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56F5GXR9005833;
	Tue, 15 Jul 2025 05:16:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 56F5GXSp005830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:33 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id C5DCC22B2B; Tue, 15 Jul 2025 13:16:32 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 1/3] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
Date: Tue, 15 Jul 2025 13:16:16 +0800
Message-Id: <20250715051618.724475-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715051618.724475-1-quic_shuaz@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=6875e434 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=uf5ZM2I4KraoWwpNZ7cA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: btpQuv-IehleAbi9H30HWrp8nGNnzVkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NiBTYWx0ZWRfX+VkrjMIqTdib
 Xjnl19u00kh/IZe93s8QNRqFHBuk2xZ/A+UMK9aN9p3qhQ0hw9zPAO2Toaogu7+JFh0m62l71+Q
 j/XZFY54Sq3RUrKSwn2a1leVrcPNxE75l2PeVMoNEmm0qM1OFcP9tUwN5n4Z/PP1WP5w4hmY1xa
 UqE4L1tl/W+8TwkxV3oHgNLiPg1oA5f7BUntpJHWVnvQhTl1hww4iBq8+tq4a/PlW30fLzfLTFV
 wIHtrq1D0MkK5+TO+B3sWhOzzmtOmNU65Yd593gegA00V83Ck7fQnl9aOhXQ6qW9JelrNMqua1i
 PyHMzrreeFk/AjjFvZbrtbqDASq3DTIQ4EAT16VcNQjSN1b9Nis/45I6XQ0OjL2Qlbd5AIpXYuK
 8IVDQz8+s7GbgUerCZ8b+Mb5aC/xDteVgXh2Um01ve0tJwFELrWxjRz3DfLCzT9L5Uq+3Zjw
X-Proofpoint-ORIG-GUID: btpQuv-IehleAbi9H30HWrp8nGNnzVkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150046

the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
This leads to reset command timeout.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4e56782b0..791f8d472 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/* If the SoC always enables the bt_en pin via hardware and the driver
+	 * cannot control the bt_en pin of the SoC chip, then during SSR,
+	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
+	 * This leads to a reset command timeout failure.
+	 * Also, add msleep delay to wait for controller to complete SSR.
+	 */
+	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		msleep(50);
+	}
+
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-- 
2.34.1


