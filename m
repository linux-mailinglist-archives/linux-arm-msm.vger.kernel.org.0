Return-Path: <linux-arm-msm+bounces-87999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11DD04A00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB5D34DEDCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C0936C0A7;
	Thu,  8 Jan 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+B+EyV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772736B071;
	Thu,  8 Jan 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858301; cv=none; b=vA5rLAAtTghMszsSTBZljHCYxJUHOMKaHHxh9tMsFa/2ujq6tSv3aAqKWlnaPBIdKK4r9LTD4kv3EEqENgVFsBI7fLbHes96HxTqtQwdfCpsZvdwqEOg7oDCihzXkRjZpFYeUC28s+kX8UJU/XWX9oEkeFqS22+QwgA1YChWQsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858301; c=relaxed/simple;
	bh=m3gMLRxPKbsUtvt6CWgtd5bNPhWycsw38uLmRL2hME4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kt1Nq4h+F9US31DVFj+5lKJk8oKPQeSEzyk41mMvM4/+BZgXuZpOooEw888FGaCFzuEqqMaQFY265bi7iIngMiNpp1RLr5zFr7ctJwTSA7CESK1okDqgmsBfiw0keH1vtbR5mlMc65tVmJrhA0+clRb9ULwrGYCxmA5G+kq/sbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+B+EyV1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085U9UT3890457;
	Thu, 8 Jan 2026 07:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pSi4ogZirCStVwGq0i6Hks6fhl+3DHoBDrW
	DQdXQzxE=; b=F+B+EyV1hu59lC8sa5j5SDawwPlHBpAMIJEsm5Z7YS55UfwGuSl
	j1xwFW5QMy6wbwpKk2IAIsHMZIluLunytOmZ/Lb+xr3ZpFGS+rIeUU1xFifyOCWE
	SORWOb3JZsIMNOCu3gdVUcDr5nAgpKvUDS1LZ6pdZXkcOZSo4HDk/9iRO1XPUiW0
	IoiFwGuYrG18qvHdhye5UyhJZf+c0ZcUOpATxR3oIjYb74g+OvPPp7LhkxsEXChs
	BgCKCCy13DevmnD8n3kYh6mxrfR+Zf18vGC5BTphNSh9l8Yb5PDLHbFAUXdFVMdH
	AXw5WtD1HaXrWjaDg/muGfmk3EIk8ZZHKpg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy7272t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 07:44:38 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6087euWe007468;
	Thu, 8 Jan 2026 07:44:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bev6meg3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 07:44:35 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6087iZIq010974;
	Thu, 8 Jan 2026 07:44:35 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6087iZ9a010973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 07:44:35 +0000
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 37C055BC; Thu,  8 Jan 2026 15:44:34 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when version matches
Date: Thu,  8 Jan 2026 15:43:53 +0800
Message-Id: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sK7kBtM9Npfopx2148fp9YtezrFMBxw2
X-Proofpoint-GUID: sK7kBtM9Npfopx2148fp9YtezrFMBxw2
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695f6066 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s_TqnAvjE5RFW65GVocA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1MSBTYWx0ZWRfX8fVeuJX4L3/c
 zm7/7Z1pnlyRB2eDAdFZJMDkeDHMWNjhrOpMgCW7TwzpHmc64eDlhbqMziU5hZ4bFS6Kcjf2VNK
 NMCVYXmRbKzNWBFGoKzN7INnHhj4N68oVFR/SQa5glQzEeDqKLHhx4fgTWdSP3C8l3lLsNCYGYI
 bv9tYjTsn0jLsL56i+aiHNjhGVsWk7TXZ0gmnNMbfZFab1TP0RhwBLfr8XC1gnNVOyO7v/eHeJB
 +qTNYJAzSaY6OUUOtIYay8AfCMTTzN+dTPKiUNNCo5OZr5hSX6X7hhD1dlj+nSolI9k1Oa1Wgqg
 bGyl9D7ltaPPYm4mqbmlnYBKjX5DdRfs+/zpT3lUzya7LdWR7wbhG0OJVsiyZV5cZvPGJe9BcWV
 fN2aoZyXm/2h8PIyl002hdzKnLPjfa0EiSVPmSAhr85AKvhPoa32aMaSG7yLs0gLzW43xGe9Vjy
 d7kitTsFdpXbR+V8cXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080051

Since USB can disconnect at any time, if it disconnects during
the BT firmware download, the BT controller firmware version may still
be updated even without completing the download.

When USB reconnects, the BT host detects the same version as in the
firmware file, which prevents the firmware from being downloaded again.

Therefore, remove the equality check to ensure that after
USB reconnection, the BT host can still download the firmware.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 646de80c7..991064a25 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
 		    "firmware rome 0x%x build 0x%x",
 		    rver_rom, rver_patch, ver_rom, ver_patch);
 
-	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
+	/* Allow rampatch if version is greater than or equal to firmware version.
+	 * Equal versions are acceptable for re-flashing or recovery scenarios.
+	 */
+	if (rver_rom != ver_rom || rver_patch < ver_patch) {
 		bt_dev_err(hdev, "rampatch file version did not match with firmware");
 		err = -EINVAL;
 		goto done;
-- 
2.34.1


