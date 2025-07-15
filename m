Return-Path: <linux-arm-msm+bounces-64920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F77B050B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C541AA7761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 05:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8504F2D3A90;
	Tue, 15 Jul 2025 05:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QK9Vtmf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA6260578;
	Tue, 15 Jul 2025 05:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752556602; cv=none; b=Pq1TdhBzwYaDxldk0JI4hO7OuSPOmsAk4ZQM76ZJAPYbCFJABOgh9XcXZdiAumBXYyntZWK6HzW7T9UTrgFKnYAWHWNEV3Lq7de5QERGlyJTftTp/rf/7tIekC4bvQbbDTaDFxM2AGYo2nn4TXg43zbe3FdU8xkp92L2swa0exU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752556602; c=relaxed/simple;
	bh=sY9pu2ogm43vJ4NnKOBf+5GH+r8PMk3DD9th7ZW8SWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkodNYnNEY1krK31QkYKcfhNAn55a/sa/0D33EqbHbrnrGF6WhjPuZG59/syBBhngMe7280gexPz0q1zUoYJazzyL923Wga38Koe8dmCDFYITvU2JQXv68NevxwXcyBud7192aPBCqdA3/KgpEGX9Jjp9TYynF3aiTfO50ZCumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QK9Vtmf9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJ3Xoi028887;
	Tue, 15 Jul 2025 05:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fSzP6W8ihmW
	HUkvqBTgzPG/jY9NBQt+LyZwmTd3MEoY=; b=QK9Vtmf9neXulj5vikqk6RBR2VE
	rTARrjZtpkkP7mhs/G2xLrTM1+aZB40zuPXKyGbECUAo4kFFP/qWlo+8mQC8dYgb
	ZZEnDEaRRap3lHyyCaajrP89auchXgDSrAG4kVfoVXN/5JRaYC45WdJQr/PCt9IB
	IutVrjp0Kb2EmSb6qLQsqlf2/JhL7DJlZE/8DOMc4CxnpAYR2vamIPuaFwxdXSYe
	jq3DLty7fTvJaPj+7F5hdtbCOSZt3URWM2n9VFHmGvO/lsOvejTdVadgxA2NKqCH
	WiGVizU0TzD9dxf2Z3lFuId1lfZeITlhQjYQuYkKkbWub4VofBqy9wWP/eA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu86v50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:39 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5Gbbq005877;
	Tue, 15 Jul 2025 05:16:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 47ugsmbjk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:37 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56F5Ga5E005874;
	Tue, 15 Jul 2025 05:16:36 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 56F5Ga3d005873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 05:16:36 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id C1CB422B2B; Tue, 15 Jul 2025 13:16:35 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 3/3] driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one coredump file
Date: Tue, 15 Jul 2025 13:16:18 +0800
Message-Id: <20250715051618.724475-4-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715051618.724475-1-quic_shuaz@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA0NiBTYWx0ZWRfX+ujE536d/UG1
 d0KrIYSU/T/ayRPf+u5l8bC5SMsugttxw4aOk40Ppv9NW9okfEW+ByMlk2lkWGWsBRUIXStb9VX
 7jQ0Fu2u9fOUapSTmODHoPeddUalMNPdfY/vuvw7gOqWoVishmCY+7nbagIbHFsNf4pJX3yvWVb
 TeT75r7odMZ+YzHbHcs8zeQCMoRWyzEKAJ7B60RwVg3SBPdtD2sz1agyF/vtNNGXqxDuZT79Ivw
 JQGniOvPhvV1npM4UheNvZi2J2LP6LoJ3RBLe9pf7GFn3ZGuKf1/htQRkyI4ZDE8qEO0k+oFuZ2
 jrZO7rgshQ4neEGXTIn10G/Deayw7ZKHTC3zPEWcME44+5qdNukQofrE58lGSYkUWHgfjPtVYri
 CGWT2B8EbglAKvuTuHBDuNwILYCe0V04rzdYrkYzBtnPvjtGbd/TkNxdrwXl9JhCedSf9jRf
X-Proofpoint-ORIG-GUID: BZ1sg6cmAskbpMGj13gjtm27jQKOXtd8
X-Proofpoint-GUID: BZ1sg6cmAskbpMGj13gjtm27jQKOXtd8
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6875e437 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Z2vcJYTkWAVNmr-hFscA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150046

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index a17d3f7ae..e836b2c29 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1661,11 +1661,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 *
 	 * Host will not download the firmware after SSR, controller to remain
 	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * clear memcoredump_flag to ensure next submission of coredump date.
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
 	}
 
-- 
2.34.1


