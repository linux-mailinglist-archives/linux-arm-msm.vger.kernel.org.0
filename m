Return-Path: <linux-arm-msm+bounces-84778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E3CB02F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 15:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03ADB3065018
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 14:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189DF2D23B8;
	Tue,  9 Dec 2025 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJeb7uxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB92D5A14;
	Tue,  9 Dec 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289038; cv=none; b=GNUrjMQTZwdc+X70ERnYUuAsMSCLHdNqH3tWElBFRw6/swz4JPPs+28LuJjRFP3LBEdh1KMVgMB/W9LW1czfJrbdfEK6xF30UFGEKlkd92rB0/VSqSed1bSEFgLhVm/6mhi5TFrOUE7gvBYWJJj24YXun6C5gTwB3wxgnqjSnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289038; c=relaxed/simple;
	bh=+mN5an9diG7bR76g4jZGjKg7N8HQ17p8lSsVL91Hotw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fp+bg30Kdy6Ll03lwSUm/gQJFSIIyT0kLvr1Gs4CUY+Nj/Am6ZEs86+kSUTBGTpHS3m2AcPYSZrMR4Dtl3lYLpZtDYBLPxQuF7OZlL1n32nTyYdzu3uaTaaG7wL9TsldYu52Ct8guDrRVu+vVXubshwubvXzr/GHC1Uq76+3fPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJeb7uxi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99N0IK2992079;
	Tue, 9 Dec 2025 14:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jInow6dFN/wx1W92249bMrHB3odea764Tv8
	McjHJ2l8=; b=oJeb7uxiydlpd4J7rpYXjOFDmBAwpeUxdC2j/L1XA3eiHIpdceR
	LDysRPEqfyBs+O+gJ5qVP5VzVZYA99V/ttCy0EOmg8Pg6dhlY/cETU3T03XcacMA
	+/yz+O0bqD4VbpIC9l5qMO/L3I9yRVAqQI2N/xjR2JjuvrNkAnqQcvFuVIan1hsZ
	keO2ULLn4JueXPSIcItuReVMEwG5dVQHKMbkXgFH9lvh8bgZVys9//uA4x7rGSEE
	kd0bzN7SooA5cXAcYDef6rt8mecAavRgfDK2w3B9xmhx0uzk+kc02C3bDEOFhBQI
	kM2YLcia8S7KZzc1KJG54QmtXy1j7DrvuCQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqr8xdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 14:03:52 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B9E3oGe025450;
	Tue, 9 Dec 2025 14:03:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4avdjm1hup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 14:03:50 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B9E3nwi025444;
	Tue, 9 Dec 2025 14:03:49 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B9E3nsu025441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 14:03:49 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 8C06E5AE; Tue,  9 Dec 2025 22:03:48 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v1] Bluetooth: hci_sync: Fix not clearing cmd_sync_work_list on power off
Date: Tue,  9 Dec 2025 22:03:47 +0800
Message-Id: <20251209140347.2816326-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-GUID: Ll4vqRGp8P8NcuPR0ifpyAgLOwMJMIP6
X-Authority-Analysis: v=2.4 cv=UrBu9uwB c=1 sm=1 tr=0 ts=69382c48 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=_4_lt5sjua-W6scmGk8A:9
X-Proofpoint-ORIG-GUID: Ll4vqRGp8P8NcuPR0ifpyAgLOwMJMIP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEwMyBTYWx0ZWRfX3KTQ/9+GnTjB
 aJRTmWa5QnFXA0rvm3ikLrYYUbvR8JhzUtQ8iY956FaccvL6dLuc/TczJa4Py6SVjTIECp2efW5
 ULtJW/jna23SlqE7wSYGjIXg+pCw7NOWfQr21v7ryzdhCeyHqoADuqOqE18WgZIHKRDXNhfDpzr
 m2dHG6VuM7N2JBrxluBH7p3SmCYK5TyekS4omc1InqvVqp9OZzlq2rd2D4UpX1FgLpeCqfmZ/wN
 wA+72wB2s1sXHN9Fwhmwq5gNczyX+ud7wSB3WLKIz9PMM8tWwe/saAqzsdF0JWad3z9XllbEWvc
 /1GiFNZvhhtakELuLiB3M+H/DUlDfL56JSmfKUMsTgbMCFIyBlcUPLpI+y3Fkk5eG4OPaV1Owk6
 +C0+VI8CmV80GT0kRpLW4824wNy/+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090103

When powering off the cmd_sync_work_list may contain items which shall
be cleared during power off as they shouldn't be run during power off
sequence.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 net/bluetooth/hci_sync.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index a9f5b1a68..45b593ec7 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -648,16 +648,22 @@ static void _hci_cmd_sync_cancel_entry(struct hci_dev *hdev,
 	kfree(entry);
 }
 
-void hci_cmd_sync_clear(struct hci_dev *hdev)
+/* Clear remaining entries in cmd_sync_work_list */
+static void hci_cmd_sync_list_clear(struct hci_dev *hdev)
 {
 	struct hci_cmd_sync_work_entry *entry, *tmp;
 
+	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
+		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
+}
+
+void hci_cmd_sync_clear(struct hci_dev *hdev)
+{
 	cancel_work_sync(&hdev->cmd_sync_work);
 	cancel_work_sync(&hdev->reenable_adv_work);
 
 	mutex_lock(&hdev->cmd_sync_work_lock);
-	list_for_each_entry_safe(entry, tmp, &hdev->cmd_sync_work_list, list)
-		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
+	hci_cmd_sync_list_clear(hdev);
 	mutex_unlock(&hdev->cmd_sync_work_lock);
 }
 
@@ -678,6 +684,7 @@ EXPORT_SYMBOL(hci_cmd_sync_cancel);
  *
  * - Set result and mark status to HCI_REQ_CANCELED
  * - Wakeup command sync thread
+ * - Clear cmd_sync_work_list if the interface is down
  */
 void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
 {
@@ -692,6 +699,9 @@ void hci_cmd_sync_cancel_sync(struct hci_dev *hdev, int err)
 
 		wake_up_interruptible(&hdev->req_wait_q);
 	}
+
+	if (err == EHOSTDOWN || err == -EHOSTDOWN)
+		hci_cmd_sync_list_clear(hdev);
 }
 EXPORT_SYMBOL(hci_cmd_sync_cancel_sync);
 
@@ -5260,14 +5270,14 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 		disable_delayed_work(&hdev->power_off);
 		disable_delayed_work(&hdev->ncmd_timer);
 		disable_delayed_work(&hdev->le_scan_disable);
+		hci_cmd_sync_cancel_sync(hdev, ENODEV);
 	} else {
 		cancel_delayed_work(&hdev->power_off);
 		cancel_delayed_work(&hdev->ncmd_timer);
 		cancel_delayed_work(&hdev->le_scan_disable);
+		hci_cmd_sync_cancel_sync(hdev, EHOSTDOWN);
 	}
 
-	hci_cmd_sync_cancel_sync(hdev, ENODEV);
-
 	cancel_interleave_scan(hdev);
 
 	if (hdev->adv_instance_timeout) {
-- 
2.34.1


