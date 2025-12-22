Return-Path: <linux-arm-msm+bounces-86235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DACD600A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 13:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6826E300E454
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 12:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE4B29B79B;
	Mon, 22 Dec 2025 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbQuBHVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F129B783;
	Mon, 22 Dec 2025 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407118; cv=none; b=PxkAKc8gRdQNwyPmZTl8Jhv5o6hyOKUWAv2I9JGtoRodOQpfCEOJR0iDrZUMLdP6/9yD89f1KR15Z8yOraxf6Q7CTX0O1zBMQduMMrvkJTHIuwTY4eM6EomK7D2w/AIYDmUrpLXA6W2ZmI1F/xTYi+VEJjUM8auCgBFr/9pq+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407118; c=relaxed/simple;
	bh=X01Y/w67otFw11UpoGzF5F8XTE13bbfr8SG5SnkWWLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sz3pgE5osW5ao4pWe2Mvxr3ToVRutPS8FO+3w9si2+QEkZk4p6gPNr+WXiUKBdqgaJY53C3OAXBeyvIM4HLi9XgdVZg732IdigQmy0tN0IPZ2FHvykztHLzeYkDVG8598od4mJ30MMiXRtBURCCJKPnrZhMyuy3I4LrBvxmMlnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbQuBHVB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMCLs8m2189489;
	Mon, 22 Dec 2025 12:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r+oPJd0s+Q/6vNwQ1Hu2Jb9Bet4TtOBE38w
	xre0eeeA=; b=PbQuBHVBPlQRMhR6fHs32gJxXoTBas1VfSXVADtN5QMKzGMVl+0
	kMEDYYNEd2lbbXFn+z+3l01pnSYr/tbdusGt+ppS/bFGmrngXDLgGgPGMMCxlBR9
	rUWArZbuq2NfBi1j+XZTUQKaz3SmTq+o0JC0t5cMcKMvyhR58t2864d2wbmSqbM3
	CGlZJySz8TcE4P3gVFfdW8/FLGPySD4eQZa8jZCo1CS2mV7FvkwtIgKzRQX+Jh/U
	vKYcs9Hge02N5Oo8yE+alIziuinhfDkUYJMC9Mh63DrctQwXB1tvoult/e0ATdoq
	ggnIsLjmbTTNP023guNCMiroQpkPz7MZKng==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t96v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:38:31 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BMCcSQW025329;
	Mon, 22 Dec 2025 12:38:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvksftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:38:28 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BMCcRoS025323;
	Mon, 22 Dec 2025 12:38:28 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BMCcR7h025319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:38:27 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id CF54821D34; Mon, 22 Dec 2025 20:38:26 +0800 (CST)
From: jinwli <jinwang.li@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v1] FROMLIST: driver: bluetooth: hci_qca: Always perform cleanup on every setup failure
Date: Mon, 22 Dec 2025 20:38:24 +0800
Message-Id: <20251222123824.3000167-1-jinwang.li@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69493bc7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=aAzMGln4x-MfedFZepYA:9
X-Proofpoint-ORIG-GUID: C0HBAyB6G5jKe3uq77IzH3KN3hWMPtMD
X-Proofpoint-GUID: C0HBAyB6G5jKe3uq77IzH3KN3hWMPtMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExMyBTYWx0ZWRfX9Ze6J5kujqlD
 nNi29Kir3EryH7xg6AVR0KaUI60sGMtoEQPHVCd7OV+dCNbX5+SxYk7NY0y1LAED2r/o8OS5gZp
 PR3FtdwreReG8LWl0MZWMSk1UM8iZbL/ow/3B4/GYlsf74M7qd442ytu01PShzwtWuY05xKZfUx
 /oh+fNMpAPbTaY7kGsCAzBkJm1q7USzQvFXxzhSg2Y/EfoN+c9KnIRbqCSs9K+K5hAFjGh9AlmU
 nAMIsN4CHanDuWK5Wf0l9v7kw+jknU7GpqVqfd7Tj83ei2BO6a91XsDwtwUlKXZt+udhkn/OncJ
 hHupFM5D7zCbSTdTHrLKN9GvzphQ9v6HPvCDUWdDY15aZemNDIZ3/Xla0SVJupayUo2HdVU61d/
 JIJXPsolD7Idp0QX94ZHVMbfZuAH/Y+UNsD9V9NNnuF3Rv1glhNVQLnj4z9fnFuhwqIFgiWYmnz
 iGIWT+maDVrTy+gPYkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220113

The retry logic in qca_setup combined error handling and
retry gating under a single condition. This caused the final failed
attempt (when retries reached MAX_INIT_RETRIES) to return without
performing cleanup.

So only jumping to retry when there is a error and retries have not
reached MAX_INIT_RETRIES.

Signed-off-by: jinwli <jinwang.li@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1d3b62579..b695577f8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2026,7 +2026,7 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 out:
-	if (ret && retries < MAX_INIT_RETRIES) {
+	if (ret) {
 		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
 		qca_power_shutdown(hu);
 		if (hu->serdev) {
@@ -2037,8 +2037,10 @@ static int qca_setup(struct hci_uart *hu)
 				return ret;
 			}
 		}
-		retries++;
-		goto retry;
+		if (retries < MAX_INIT_RETRIES) {
+			retries++;
+			goto retry;
+		}
 	}
 
 	/* Setup bdaddr */
-- 
2.34.1


