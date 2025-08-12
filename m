Return-Path: <linux-arm-msm+bounces-68761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989FB225FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 13:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A86D71892EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A852E9ED8;
	Tue, 12 Aug 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C9DeQN1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8A2EA162;
	Tue, 12 Aug 2025 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998591; cv=none; b=FfPILiQO8Z0rB5fHdiblEe3P4ZDL/q9nSJQO3Fo5mis0IL7YKpSWfMIH5l8PXGpJCOhcBkG3i73l/hX21ZRqcq5pZ3W62Hh+2ozG8L0SdFEGZP894rsgh5jeBviik+5sCuRY0xNMMGE1NAsnLVYGnvCDWl5/9cmzRvA+QyzKneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998591; c=relaxed/simple;
	bh=SaMSFJlSUA/TKOaYtVC8VjuwlstFx+NMKGplVc9OLEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G127vTVnOpyr6AZAgwmX0zw1PCNK5J2HD4i3c3WCJEEyW1UhdYj4JprmySkKlkQnegVPn63mLa4Ao1uXW/hncuH0U1zr3V+deW4OLCrKThhN/V2DXuTHtCnMWzP/rqLT5uWHT0+prb5S0ij43T6DVRVLStT5Rbq/AcjfF3knQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C9DeQN1I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvhg7021043;
	Tue, 12 Aug 2025 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8GbN+cpWDP2
	apTqVmzRhRD6nAKNH5glGbxrioeo9ZdY=; b=C9DeQN1IKk/qi613K5uXTqOGu9d
	unKiBrKDtwlgDuDLtEmFe6OJoiVf7LrYYKZciX+5Dde2Na6HeIyrK2Bg+tmzfyy9
	BruDfX1ousMkPvkndSuwKIy2Zb+wPzeUj9xc5Y1WkZuqPy2vjpvMb3FZW94L/ubi
	abt5xwAqMpIP2pKhaASXKb66C2lKk0E/qbUOPSYmmWCnOmTt0v1oXEmfJF3CY0NQ
	YgG8Mwo74MwwDdjYERj+k5KkGs1Ri84P16RJ48FsXzoRKRS2tkSC1wgPZFoLo4JE
	XY2J9GXV99auuD0MIfYgYDZ9LeWRwL1fUgMGAZn+XWSOnjkIgKDs3MYdF3Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6kt6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:26 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CBaPlh003754;
	Tue, 12 Aug 2025 11:36:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm4r51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:25 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CBaPVN003751;
	Tue, 12 Aug 2025 11:36:25 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57CBaOBX003750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 11:36:25 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 003112289D; Tue, 12 Aug 2025 19:36:23 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
Date: Tue, 12 Aug 2025 19:36:17 +0800
Message-Id: <20250812113620.3135226-2-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX4+cRy3bAFm4s
 +Q2bnqq3etpwDoVbEChhAkPA52M9jGZLnbELHVfesQ1SDdx4dzjCDfO0GJTgtvRYdwIwUQOpAYS
 mW9pzHAfFYaF1qNpKP6KtEMoB2IVG8FoJ8qxxNMNEQpPt1wrBFK1bHiDYNctnOuC2Q/e9vxu1Zm
 pVB275uRrKssf9AVXRrVIlOS8D5GH2fXKi0uxDo7Z2DAaXkCOvey1xCgEpIMQuzzHa+EHMvl2tB
 Rf0yT6sbWbYt4LzD58YOaGei+oX8AXfE3PsNl3vY2ISnthAU7+ui5Ml7UNrqGjs5GXkiw7tGgZ+
 b7mdnN51UyEAelofIRnT8hd2vWd2k6nEauytXACtqLTvrDq9AVJl9f7AgngHO4wzypAOPUSL32E
 2J5utQSa
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689b273b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=zxD9FIJ19wtIjsr7aRAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q_2LAIcnAPh3weevDiM44-QPPe4f1CCw
X-Proofpoint-ORIG-GUID: Q_2LAIcnAPh3weevDiM44-QPPe4f1CCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

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


