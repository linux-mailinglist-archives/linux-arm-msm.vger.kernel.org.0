Return-Path: <linux-arm-msm+bounces-80279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB81C30BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 12:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF43C4F2D69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 11:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2235C2E6CDA;
	Tue,  4 Nov 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qu15sv9v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F52E7162;
	Tue,  4 Nov 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762255587; cv=none; b=oXionCeyKerVWE2jsbya/O4YNaeNOuA5Lly60KDeUu3jNB2ytLVWD1FVkeIT4dNQZdomk+Xfhpm6d+EpenwEt0iV4YQ+kFs+1EVRafJS0c1f0Qjb9zUs69G2QYgLQF0d9OMYlqclNZ9nhA3O/KQb8HhE9DpJ8BNmkm0RAM9cbLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762255587; c=relaxed/simple;
	bh=Bh/fZvNVUtpZqy1iphbeFcZdiiDFYAV8+2UoBhrjjSE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zk52ShMgJRyE//DaoZ/lbbkUlzw02T90RCHDF3+YOifBkvyO78EzCcRTPPuUIjRaXv/8M04Cyn3ipuJjsDkl8mkGMomCWasVQfzwqPiIO0Lzxc4AI16BoT9DwX71YBBHgX6JdQEwN2wpNPUpkgJ+RcdgECTWDYSxw49y5+qZ/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qu15sv9v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A49H7s31546418;
	Tue, 4 Nov 2025 11:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q/klRFV2JYcdv2I+EPFZJCIcBLeZhyHI4B/
	2zgli4t8=; b=Qu15sv9vUozWLnYwybE+yfmo/MH19YP6Vj8wIFlbQ/+j6iWZx4q
	SxXA9C9wHpypqqubX2ZvVV5rc5SLYiWfFtNkiv+EqHPaIHI07HMzMBhgekxJn/ay
	CpOOLnzLbXsUy5lUfgKbPNmQ3D+S2F2RSNKc2kdpLkZXErMy5d9pwrVrSEsOuxJe
	RBtanESk0RoRqBgpqZcnxamHOT5k06no0/sPTJ19Tx0f3kxmAOwzN7lUTWj3ccFe
	Co6pKRB/uHzsNnsDvARBbIo3v2WtWqDjfF/uUl8VK5wMp/dXr9vnpMl+eNku6vq1
	MALuL0TDqnFTT3Wxo7fYFNBo/zq1uSnN4yw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffjrb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:26:20 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BQIan025409;
	Tue, 4 Nov 2025 11:26:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a5b9mgnwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:26:18 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A4BQH0a025342;
	Tue, 4 Nov 2025 11:26:17 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5A4BQH6a025244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 11:26:17 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 8016B231FA; Tue,  4 Nov 2025 19:26:16 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v1] Bluetooth: hci_qca: Fix SSR unable to wake up bug
Date: Tue,  4 Nov 2025 19:26:01 +0800
Message-Id: <20251104112601.2670019-1-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909e2dc cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=m-5Lm1s-rEeNAmgHswEA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: T_Y0BoeFCouHW9qlutsqwqBjlMeDcuxU
X-Proofpoint-ORIG-GUID: T_Y0BoeFCouHW9qlutsqwqBjlMeDcuxU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA5NCBTYWx0ZWRfX9TFlU7s4e38N
 SUX/Y3ZehtRKBsv8w8HbRhJlnHnPdo8f6ruDVR8Khb6fpHY2X8Aq95dl+ulyHEK/7LlKlchtfoZ
 JskGO0qgw7bs6uDQX46dLSwcxvL/AtE12Oz5NCzrMnjk+fBVlp3prwq7DoBMiBSPfCkOTOctzzE
 G0R5EMmZU1r4XDad2/6TDx5OowWpnxO99DHpZq7HugeX5kUclkjbAcBKYolySXPdTzRP3Fohtay
 npZe682d2wY3UuC6s3odFK4FZsjpI7kzauXPC43jcSuEJZ0UvTXqIH9uiaDBPAvLlXWzgi2wnG3
 21RqMJwnH28dCKyNU+QJpVRuIzHqkRn5xFXclv/en4ecp+2ryc0SMXUBdlG09WYqahOnn4E83dn
 c8iMnC/jEo8+x28EhFoWqyyZoXFDJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040094

During SSR data collection period, the processing of hw_error events
must wait until SSR data Collected or the timeout before it can proceed.
The wake_up_bit function has been added to address the issue
where hw_error events could only be processed after the timeout.

The timeout unit has been changed from jiffies to milliseconds (ms).

Cc: stable@vger.kernel.org
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 888176b0f..a2e3c97a8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1105,6 +1105,7 @@ static void qca_controller_memdump(struct work_struct *work)
 				cancel_delayed_work(&qca->ctrl_memdump_timeout);
 				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 				clear_bit(QCA_IBS_DISABLED, &qca->flags);
+				wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
 				mutex_unlock(&qca->hci_memdump_lock);
 				return;
 			}
@@ -1182,6 +1183,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
 			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+			wake_up_bit(&qca->flags, QCA_MEMDUMP_COLLECTION);
 		}
 
 		mutex_unlock(&qca->hci_memdump_lock);
@@ -1602,7 +1604,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
-			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
+			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 }
-- 
2.34.1


