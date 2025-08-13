Return-Path: <linux-arm-msm+bounces-68879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC8B23F0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DFFA583F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1542BE036;
	Wed, 13 Aug 2025 03:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XjLQXyXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541682BD588;
	Wed, 13 Aug 2025 03:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056125; cv=none; b=lWo3rACQ1Od7w8shcHRgt+DNuHCWETQ/6kXVngmr6dyxCpTnU+OUuQiM4wN6YUiQakwU+1w7NZLxgmVjFjISjXVjeNeASK2u5L5yVZQ06DpECG+wDAuu5JQz9h8Ky5wY2kSxsIN3w0Cclu0EvK7zpWyD+Mt0WSrOLrRrQE8NPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056125; c=relaxed/simple;
	bh=SaMSFJlSUA/TKOaYtVC8VjuwlstFx+NMKGplVc9OLEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p+FNOaECY2161iI8hxhKpkGGoD3G0GihT6AkWIeBIhL+k9Telz+uyZDpHe93C0Tu3sCRvSL+7r0/ipDArnYr9wd1Vw3P0jmFHEGqIlEliaeLyptMHKFswvNBC5N6MTgQPRtzvKTe+MkEPdB8dOBCqSJg7Ut1t+s3h5VRI85T4II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XjLQXyXh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CL2KSq020820;
	Wed, 13 Aug 2025 03:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8GbN+cpWDP2
	apTqVmzRhRD6nAKNH5glGbxrioeo9ZdY=; b=XjLQXyXhFgo+7qrwnZcZYOsuSnN
	loLISICnE87LGtmaJJNPAJAd4k8uSjwp1K06YlpiXkTYL9MR9DZKx9eWJv91YEfv
	hRQLhxmmkHCCYVRrqz1LiRotBfDt4uXvo+RRDfwYBmQhH6N4mnD0RNTLoaEp8y7C
	uwfKOh+nnE+buqIeK+uTonrjQSuCKf97MoeVwXbrWFpowc6r5OjHWaTJsGiM2Tcm
	YZmvUlQAPuFBqGVw2AScCOaqkSFF94Z98sXPKbLGPQIgz5q9TOyf1aabf/RycEa/
	MVfRzptYxpmVUEZWSNBNstb7MiPCALgKqKusRiyIdLIVldueQBDpQ9PSaGw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx8fqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3Z92b004584;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm8qjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3Z9YH004572;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57D3Z9qf004566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 97902223EC; Wed, 13 Aug 2025 11:35:08 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 1/4] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is pulled up by hw
Date: Wed, 13 Aug 2025 11:35:02 +0800
Message-Id: <20250813033505.3868781-2-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfXx4Cq7uAPbVi1
 l6GfX+jdrzgujDgoo7+Fjb+qYtz7V/2NDbpHXZ+1A2TkOgtkLXDB0zhMs3C7cm5VFPfWvX/SjxX
 A9UcjR1qLNmTia8M78FHEXmLdTD89PnFthcW4tvHN3BbdtqNNiEk/Oc60ERFgSbtV/6eIMrkk4Q
 rh7J4ga4RCXD0cFqrgYUABlQZ4SXb/uaqErSSMa2cfV/hm6gTo46X3vS05VGFV+kDKbAn0JgbBK
 s87WRPR4vhrhySfBnZzgWSCOaRLxh6EI5hmWxSn260xwfILosYO7OQiPx+W4WkN5lNe82WWxsPE
 ghC/qNR7Jv2c2VdNpyA+Q19gsjt5FZJXuDH3vzh/XXgSbt527TOIUvZxaow2G3lPUZSOMKcX6Nc
 sWbXfLe6
X-Proofpoint-GUID: MwhYc7tQvXx5-9sGvo8H3RXVVd7Dunn6
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c07fb cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=zxD9FIJ19wtIjsr7aRAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MwhYc7tQvXx5-9sGvo8H3RXVVd7Dunn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

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


