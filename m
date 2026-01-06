Return-Path: <linux-arm-msm+bounces-87662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 220DECF79E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA8FD3011B18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D415E320A14;
	Tue,  6 Jan 2026 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OA2rVyeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE246BF;
	Tue,  6 Jan 2026 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692602; cv=none; b=IDE8/55mRtxHAmb6fQATr5vvhwy/DbdGgqFf09KtQgRBmRHdcvxagH7QQ46lFfHARdE5kj9ilx47CBLPrvVhJU1UxwdVUxnnx/jAvDlCfd2tILuJ5x6oNkxXNsnlsixdYOjgEgK9EmSbd8anYZCdM2qjn4eS5KC41ba/+dvgF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692602; c=relaxed/simple;
	bh=CfWlifTNY1fN3FSNN/t5ceMFiMGwpQt10j5HjSd18P8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hiklvaSisZ9j4KM80KetVet1ePZOSmFI1XztDvNgKXJK3pEcTAXyXOFPA+Q4bG/B/UBSlXmQiy5IyOH0Y9pEMlC5RfCO9MZl52XV5x95sfiu4x5ZbKMcc69Ap4i1b4RCDBuiQ5YWmKIMSg95U0BLWBGXg5jXhWEVF6RBdlOLUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OA2rVyeI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q4wV3052752;
	Tue, 6 Jan 2026 09:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dtqd4Qr5jI6JNOAQS3FHoD/4P6QXKuuCJDG
	/vlkAhC4=; b=OA2rVyeIFeQqr7duRugTetTC3hCD9A+ZX0mVgWYytiXN0HF3GXj
	odPvIA7mqWYj9qnJOccLEJd6gfcn8fBLFeQ5PMxuEyEAuEIhoAowEGcZAKA2XXYc
	Badt8ENZ3bXBWe9IDSaqrIeIdLxhXs9aHeNJrheOnw5YYTdd0KQfxpsLyiAJawC2
	W8qIXdzkamkKiq6/rs0AR1Mx9EOhk+Qaj9bmsHYNTHyuCsLwvo4yCEtcg8VYTwZe
	+QxcBmOOcfDP2OMZjt0Dw18XG6U5H4wKBmSmDhlBFRD1kbD6tJtnIdpvMDVofduZ
	D57wBLFqw0JuErLngBht7/TVehoIvIil0Eg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgpn9sjjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 09:43:15 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6069hD6N024211;
	Tue, 6 Jan 2026 09:43:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6m055h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 09:43:13 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6069hCrl024205;
	Tue, 6 Jan 2026 09:43:12 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6069hC6a024203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 09:43:12 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 6A145235D4; Tue,  6 Jan 2026 17:43:11 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH v4] Bluetooth: hci_qca: Cleanup on all setup failures
Date: Tue,  6 Jan 2026 17:43:10 +0800
Message-Id: <20260106094310.784564-1-jinwang.li@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HTNrST9CvgA1SYWgZnA6tlFzqbNcQkbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX1hozePJ8tIw0
 3uhyOutUM5IjhiT3Iue5MOp9Zrh+WnRvlSdrDhEBJ1SHi+SHNIK/B3qcn3IJFqQiF/TKbb79YoQ
 5qQMWUlbTdhNE+bzT13VlmGc8mAGJQGJdsz3uDXz11JtCKOIJ6L7viLUb/nBTT8qyEL/UUvTuVo
 U/q/oGb8P5aZp6eodv7E1PeT7hMMQOShNTOVntltopf14YoNpF7aIaE+zA3jJKTsCeZ/zb58VI8
 W4jfZtGSlYDpYDAkaz38o6E8mYt5n0IwjZ1sgdoVSEO0zx6EE+YOKVIgobdZTjHyMI80CZFMzn0
 P7LK1XEG7i/TX0CpctQK7KbdV6QGtVGi6MJSY9CgWD/gmqSEp3lwwFReSR2acNwsMEqtI1LKIN4
 ehjXi9JkjOiM9HkcGNf7IVQu/HzJNxDUMI5/egCn5Ni0UQCgqGbHYntx3pALvN8S4PzAEfE+DdC
 ewpSzyro9r5bugIRdfg==
X-Proofpoint-GUID: HTNrST9CvgA1SYWgZnA6tlFzqbNcQkbl
X-Authority-Analysis: v=2.4 cv=KfnfcAYD c=1 sm=1 tr=0 ts=695cd933 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=TShSeRwDY6ZUq1BdFX4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

The setup process previously combined error handling and retry gating
under one condition. As a result, the final failed attempt exited
without performing cleanup.

Update the failure path to always perform power and port cleanup on
setup failure, and reopen the port only when retrying.

Fixes: 9e80587aba4c ("Bluetooth: hci_qca: Enhance retry logic in qca_setup")
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
V3 -> V4: 
- Add 'Fixes:' tag.
- Link to v3
  https://lore.kernel.org/all/20260105141427.196411-1-jinwang.li@oss.qualcomm.com/

V2 -> V3:
- Update git name.
- Link to v2
  https://lore.kernel.org/all/20251226102707.3449789-1-jinwang.li@oss.qualcomm.com/

V1 -> V2:
- Only reopen the serdev port when retrying.
- Return on the final failure.
- Update commit.
- Link to v1
  https://lore.kernel.org/all/20251222123824.3000167-1-jinwang.li@oss.qualcomm.com/

 drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index b54350317a43..8414fa75e540 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2045,19 +2045,24 @@ static int qca_setup(struct hci_uart *hu)
 	}
 
 out:
-	if (ret && retries < MAX_INIT_RETRIES) {
-		bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+	if (ret) {
 		qca_power_shutdown(hu);
-		if (hu->serdev) {
+		if (hu->serdev)
 			serdev_device_close(hu->serdev);
-			ret = serdev_device_open(hu->serdev);
-			if (ret) {
-				bt_dev_err(hdev, "failed to open port");
-				return ret;
+
+		if (retries < MAX_INIT_RETRIES) {
+			bt_dev_warn(hdev, "Retry BT power ON:%d", retries);
+			if (hu->serdev) {
+				ret = serdev_device_open(hu->serdev);
+				if (ret) {
+					bt_dev_err(hdev, "failed to open port");
+					return ret;
+				}
 			}
+			retries++;
+			goto retry;
 		}
-		retries++;
-		goto retry;
+		return ret;
 	}
 
 	/* Setup bdaddr */
-- 
2.34.1


