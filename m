Return-Path: <linux-arm-msm+bounces-70622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74139B33E35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 13:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F86189C03B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6286D2EAB7F;
	Mon, 25 Aug 2025 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cA9AuFCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5492EA741;
	Mon, 25 Aug 2025 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756121949; cv=none; b=hF8g4uY8V6T56MgxSg8PgcBCRm5Wc+CqkARnXs9/7C2e6Tnp8oX530SHP5iinUK3lostS2uVX9Ngwuqie5n/Mw7l7pjGZp89hoVXhuzNFBh8wAvrirJPmaLUzlXyLAMUw6/rRORZ2w0fPf0/dYqEUvQB6c0gtx1ftF/VOBd9M9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756121949; c=relaxed/simple;
	bh=Dd64tH2C/anRhlI56SfA7nQHik6qZJ5IimIUY4B060M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KX9tBZS2QggwED6btdR2ZdJEHTXT9DYhJyGn7wUS5EQoLwUEwHpI8DdEGnZ2rDNxpVIcpmOQLgpXvNBRp+S0uGOFtEN0Gdxijrr/JnTB1e/PxIungFnI2AOoYGb2jnhK0sVvT5HgwSwWF3OSdJZJls4o8U5Ho6vim4Q8+qiuMvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cA9AuFCa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P85xC6006924;
	Mon, 25 Aug 2025 11:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=efHdpw6MZigXbTvjxJT2D/SB8ccWQ+VoVAO
	UhEsFy0A=; b=cA9AuFCaJK0N3e7IzZXMVeBneLw3Co9gfDZq684+XPWfXNpLnup
	LutkiHQHzckADx37iVEFumu4PWTcesgattDnDsZLtHWJrXVA4Fq8uOCSJu9QPiT1
	/XaqGcv1ix612+geDLqoJC30WRYrkNNx/QWOscFWL2vhnntM5BY5Xm8a1aAeRYRI
	B7hpKtbAg3Bp1pN16yiBYVp4eLdhgmG7avglmxuT3Hp5Wa5Omvylm4WNcfuDzA+q
	ZvMuht8RlfllgcrzMh1BUPl02ETwgiNIRx6ruOGF0Awl8SZSe+6GsfCGxcjo7WVr
	C86jW7nlrazK/vBNL/7fE7tI05Q5n9JYB5Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unmv0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:39:03 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57PBd1F3013545;
	Mon, 25 Aug 2025 11:39:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48q6qkm58m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:39:01 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57PBd0V2013535;
	Mon, 25 Aug 2025 11:39:00 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57PBd0qs013533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 11:39:00 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id A97CB22A9B; Mon, 25 Aug 2025 19:38:59 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chejiang@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v10] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
Date: Mon, 25 Aug 2025 19:38:58 +0800
Message-Id: <20250825113858.4017780-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-GUID: l8eD72juh49j3hINidIq_b9KFYpq9Ifs
X-Proofpoint-ORIG-GUID: l8eD72juh49j3hINidIq_b9KFYpq9Ifs
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ac4b58 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Zh3eq0SbisOj6M6HGuUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX4vZYMzZU/TZ8
 ahfYmyhgS8l8RQ3Tph6nlkjdkHrmedjTzOK523lUa53nMyT0qyDIIViKGfig4eBJXg09C1Zus7p
 ClYtyuhMBT0xG4jRvRebeO2KvhjsCnGygykXbiR5YnrVWE+CPQLVFFurEtn0cxfzcvF6tWag1rd
 N8fNoYOiUfpZqsh4J9JRmvdIVSYKkPgjmEsGPhggL7CbPFaePP5xys+IgSgPvGv5D4Ix17AJf6/
 SaAV3lDF9/s+vfbcBx7lWhRzkyxcPvmdUktxNoJE0uDi9BRZfHzoK/BLraMr7L7OPECMCYyNIb3
 uhCD/44rQDtUFiNagIFsME25Voe4DEXA0ellg9ucvXj/+MAzYPSEUzNG25jaZCSW9A56Ryw00Tv
 OYInK80t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

When the host actively triggers SSR and collects coredump data,
the Bluetooth stack sends a reset command to the controller. However, due
to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
the reset command times out.

To address this, this patch clears the QCA_SSR_TRIGGERED and
QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
completes the SSR process when BT_EN is always high due to hardware.

For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
the comment in `include/net/bluetooth/hci.h`.

The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
and its presence can be used to determine whether BT_EN is defined in DTS.

After SSR, host will not download the firmware, causing
controller to remain in the IBS_WAKE state. Host needs
to synchronize with the controller to maintain proper operation.

Multiple triggers of SSR only first generate coredump file,
due to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

When the SSR duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.

---
Changs since v8-v9:
-- Update base patch to latest patch.
-- add Cc stable@vger.kernel.org on signed-of.

Changes since v6-7:
- Merge the changes into a single patch.
- Update commit.

Changes since v1-5:
- Add an explanation for HCI_QUIRK_NON_PERSISTENT_SETUP.
- Add commments for msleep(50).
- Update format and commit.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: stable@vger.kernel.org
---
 drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 4cff4d9be..97aaf4985 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 		skb_queue_purge(&qca->rx_memdump_q);
 	}
 
+	/*
+	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
+	 * hardware and always stays high, driver cannot control the bt_en pin.
+	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
+	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
+	 * command timeout.
+	 * Add an msleep delay to ensure controller completes the SSR process.
+	 *
+	 * Host will not download the firmware after SSR, controller to remain
+	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * Since the bluetooth chip has been reset, clear the memdump state.
+	 */
+	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
+		/*
+		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_delay, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sleep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+				  msecs_to_jiffies(qca->tx_idle_delay));
+
+		/* Controller reset completion time is 50ms */
+		msleep(50);
+
+		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
+		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+
+		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
+	}
+
 	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
 }
 
-- 
2.34.1


