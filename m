Return-Path: <linux-arm-msm+bounces-68773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92194B226D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CAD13AA1E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A02D2586CE;
	Tue, 12 Aug 2025 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="akTWYC0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44223C51D;
	Tue, 12 Aug 2025 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001778; cv=none; b=ro1DI0FGqssUaLpZKY3K86gK5DaySr25LsT9Zcicc6OvcJd7kW6HzRjWAG4W9/8qBj4HFlhQz6y7pY4mPok/cs4NwOcC7u+pttgZddUm7lDa6U0Go7SzlNjjyd96OWFEmenbxD3zRHjzaLcvUltsNpmzgbzIG0QqL1CBqQjh4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001778; c=relaxed/simple;
	bh=SaMSFJlSUA/TKOaYtVC8VjuwlstFx+NMKGplVc9OLEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NEVQc2sgKywl7uWEpiyKxawOiP9/vKVfkmjcLw69hAastBphQ1uDjmJZ6D999ol/z4EYXhvPdkVrumtOuLNQPEIiuDo5zmDFqJNnKemzrzFsNe7lu1vfcZL6AwtZuaORi92qd8zIEHPN6lZMi1HhAicroGSDeM8V2rjTo3OecMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=akTWYC0Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvor7006035;
	Tue, 12 Aug 2025 12:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8GbN+cpWDP2
	apTqVmzRhRD6nAKNH5glGbxrioeo9ZdY=; b=akTWYC0ZQTlR0gA+vPAO4+lMJ9b
	wiPzFnvLFtUw/5tQ+f2Nh7Hez2ZBinH+QFcGd6a4+3Gg2VZS0hle/qi0JEyS1gEG
	ndUk2tuMVdGNbgdq6cLGsMy6XR48MGZ73S8SrIowBBdLcf3Y8SB7A7Q+RxrGoLkt
	Gh51clbjh9+R+ZaSRu/JBj5aiYNlvDoBQ8IUfqktzDgpmu6Lfgvc/ZO2kLqZlNmJ
	OfYggxcYE9s0gvV0Mf+mL0iBGzEzw3u5Xz+Kf4kaOZO0EbJDrLAeulGaYK2hWWg8
	jv/9QScB0hcALWKYeV087jNst/y40btkluTGhCy9JjmuZlxdyq1CgyCmPEg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkx7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCTVBw026162;
	Tue, 12 Aug 2025 12:29:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm4yc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:31 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CCTVoI026159;
	Tue, 12 Aug 2025 12:29:31 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57CCTVpl026158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:31 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id B9C2422B1F; Tue, 12 Aug 2025 20:29:30 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
Date: Tue, 12 Aug 2025 20:29:24 +0800
Message-Id: <20250812122927.3183257-2-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
References: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX8kJHmnd8vfJB
 IuyML3ZSjbzpxnBYWLVeRzilXKLHxCBiLvTbZc/W06O6rfCBB9+y1X0w9sjfb8v5Jjilh5xVGbb
 KwQ62FrXZhkiyjd2bxc5KmZ/Vsy0JXR8ekGia0GjjAPpHv4MFqh785SFrGfsV5VAEiMtaYf7q+Y
 cFya0rCIri8TAlAdyOIHsyOPcXf9oMJQS/eqDfYi+UukohlGviUYNqtzwzJ2SMGTbqEbYCgnl/o
 sCq2jJ1kLMTPe1+bKZglwB2PF1ULAz3cOr+rV3+btVwxVIbyNgVdWh/kvvD/uM022x3YSmpc2Nr
 0uYSBr4dcQNaJJu77CqUVeYjprxx1BSnpWQBzYslHAjV7S9fLuWpfzfMgVKr36gpMuuyiLEOZhv
 Z+E0oaPJ
X-Proofpoint-GUID: SLRxqVyvRUq4CHlOER1BKo8s6UwPNGH1
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b33af cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=zxD9FIJ19wtIjsr7aRAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SLRxqVyvRUq4CHlOER1BKo8s6UwPNGH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

When the host actively triggers SSR and collects coredump data,
the Bluetooth stack sends a reset command to the controller. However,due
to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
the reset command times out.

For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
commit: 740011cfe94859df8d05f5400d589a8693b095e7.

The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
because this quirk is associated with BT_EN, and can be used to
determine whether BT_EN is present in the device tree (DTS).

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4e56782b0..14b2d1bee 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/* If the BT chip's bt_en pin is always pulled high by a dedicated 3.3V
+	 * power supply via hardware the driver
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


