Return-Path: <linux-arm-msm+bounces-80692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC2C3E5F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA453A6462
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436C7287505;
	Fri,  7 Nov 2025 03:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R7NCxVhJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886CA1E32D3;
	Fri,  7 Nov 2025 03:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486776; cv=none; b=Ah1WY1mz8wi1PDJgF//5RFMQ4dTR4R62Mf7rYzpTTMsUMvgWA9eCxXVbDjVmaPThM6wH/fON1IWtlB2Vm8ZkZarEt+LJoKokzawwheghbq8aG5szxkg3AQStGdK1Es9C7sZjWY/rBIkaDG7mGdmwqPGrK3xowrfwxca6b6RBZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486776; c=relaxed/simple;
	bh=TY6AfTS9IE25kyf1VzFS8t6tVnHe0Sw2zjiBp2xWaG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7TQu9kaYw5edix00C/GQyATPejBiQPSJIuMHvgBcGjBlb8b++9Ha+VDWXdSpm9UIyWIekWoKsaIS1Jug5b4GY8MNHTA+idDzmAdyAr9Wtfx3MFDcMdyw49O2To75YkqslQfgrGVeNPVa2IVmv4kvDVDwHkHppxjBNJO+0wKd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R7NCxVhJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A718bOn1710787;
	Fri, 7 Nov 2025 03:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CG/kbwf3jm9
	5G/VIBAhWTxS8SVIJcY0oCufgRxYh/C0=; b=R7NCxVhJFSg5+Ua4QpWGJmIQ1WY
	/tkcVLbqqbkg9mPtzTFblDNQHgPJBb3M1gJiL9sJ1AzO9lFI8KS8f4MFx0IXzmbd
	X76bgI6rIL2VHKCAUNnUL4yg7EE3CtAql6XH+/n8ECjud2HmDFP/HUkbMOctNHPI
	dXnZB4KuwUIx9kgo+p2slk+ljmo/g5bKKKzMfNOHVpQwpmZXfe83MSqU2Z9VVr2g
	3UipdLapVeW3N38jNlCsU5BVkKcxfNQLCS00BPxwTKzDFphkVZWNyPVIuAMTCCL7
	Bx9b6SPcbLIh6wzFb7bvl2uG4uzOj17eBNWbO5c3xASVUtlUQ7fksn9batA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue0cn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A73dSQO014121;
	Fri, 7 Nov 2025 03:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9nc06k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:28 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A73dReN014107;
	Fri, 7 Nov 2025 03:39:27 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A73dRSk014104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 03:39:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 6A7982327E; Fri,  7 Nov 2025 11:39:26 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        quic_chejiang@quicinc.com, quic_jiaymao@quicinc.com,
        quic_chezhou@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 2/2] Bluetooth: hci_qca: Convert timeout from jiffies to ms
Date: Fri,  7 Nov 2025 11:39:24 +0800
Message-Id: <20251107033924.3707495-3-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690d69f3 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=70vrXUCaxUCbDeWopUYA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: P9ihKIfk0fy5gtb6RslSXp3mdUvzT4Ex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNiBTYWx0ZWRfX7sQrYpMphNb9
 bvFOr7V6IdrMJCO768yxvsFdHpe+Jg1k8wEoPSBvV670oZ7ieTndH/lHawMa93YnH55+cRp70Pv
 JKE8zM1CeUVF7YBKKj2qEpf/XR4SncKey56DVBDWSgAw8fl9X/cUpPWjff9mo1YV25H5CzPavRc
 BL4MNSPCjwQeOZCeyyknb+kzIt7cbrbi5Q2iKMnjLb+8PQO+MeEYJGi0lNiv4O234kZJap1jZND
 fVwuZDiVedNbu88/PEN3ADcpLIE6I6hz2yOlh8wsUeYde0TjVvEAceNelKQDsw/sFr1f9bRC5o2
 y0wjUYUUL5WhbSsC7PkChh+pG2ReUazzZOXd9EHrcF3rTatOpK7TwWMeQHxxy4k+z+k220IqdCF
 xHjkhHVYkF0/C5k/UTEjaUoV2w7KNQ==
X-Proofpoint-GUID: P9ihKIfk0fy5gtb6RslSXp3mdUvzT4Ex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070026

Since the timer uses jiffies as its unit rather than ms, the timeout value
must be converted from ms to jiffies when configuring the timer. Otherwise,
the intended 8s timeout is incorrectly set to approximately 33s.

Cc: stable@vger.kernel.org
Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index fa6be1992..c14b2fa9d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1602,7 +1602,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
 	struct qca_data *qca = hu->priv;
 
 	wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
-			    TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
+			    TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
 
 	clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 }
-- 
2.34.1


