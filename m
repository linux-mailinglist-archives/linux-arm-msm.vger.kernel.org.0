Return-Path: <linux-arm-msm+bounces-68875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCBB23F08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7606B626E88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ECF1F3BAB;
	Wed, 13 Aug 2025 03:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HuDzDf1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A341A275;
	Wed, 13 Aug 2025 03:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056115; cv=none; b=n1fhlBSKUvffXXEaVHHtGW5cLlS9oS3/ftqJP93UlawvobFxAI0aod1ETHAqfgX/4U7fKXooARId/8XUC/saf2Yln0q8Lq8KM1wJaPQNi7yuhas6TimPIjKxEFXjRFtiw91oGiQB6MKXPCETbXbnuxG1kOTIihbS4B8H+77pLHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056115; c=relaxed/simple;
	bh=sAJrDqktkOOAcZeZFXAD7sFJwcoemUteBsMDRMNq0nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A9MrzM+1aBAg0Y5+6c/AbHVvC9SfXG5odvWYPpoWCc/wkqgh4nj7slRHlAzxFkbStic6tXyVUbopGqkKe22ZgoT99slM0iKckrw/Bx7mxe0jaJtnJpCWfuIVHwFjoUDRQU3+xH4POBBNBBZeynrQWGXr8HWSdfmKYgqRWEMDGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HuDzDf1p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLFHIc013315;
	Wed, 13 Aug 2025 03:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e3vf8W7LhRh
	4J4rwYoBuKKQ/5Hcwqd2wr5wdSxxq5yM=; b=HuDzDf1pAVMFRW9mNFIwkq/ULsl
	JTOqYeC0ykOYg/GZLJWvpB+jdsNl+D0LASVt17SDObU3EGWR2RSsG5+N4ENQbAI7
	cK2K1cIqasbSX88WnI66dRJARuR2N9FpenH3HaRYDCXBPsy1qhTvD71il4mIgkjT
	vDExUeqcTw5ZgHblTuHXhxOoxRcl0vh0WGjpwH0Axw+uzFsowKypzcnd/Dgh/g82
	r4jDXrrYOuJfn2tljcOgB/s+du8Aqol2WkMgVw1Sp1TpOJpG3bHJ/h5SGWBqGgow
	6y5BUStlRhNqYlqdS7YPF3XAydknoryRxHi/yk0hY1Aoey4Ujsy5FLJ9PAQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv29uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:12 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3Z97R004582;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm8qjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3Z9UF004570;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57D3Z9r7004568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id A2D6022930; Wed, 13 Aug 2025 11:35:08 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 4/4] driver: bluetooth: hci_qca: SSR(SubSystem Restart)process failed due to tx_idle_timer timeout
Date: Wed, 13 Aug 2025 11:35:05 +0800
Message-Id: <20250813033505.3868781-5-quic_shuaz@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c07f0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=7-08G_DUf5nQLP0U7KQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qUuQkx8TRVje3Gy7l43BBommqFhG8FpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXxUstiin9RugT
 KFDxmPB2N5aZZT1lIeh36UR9Oe7lPgOBjOadjeYYE00yGl4yOgDNMQbjXCHcuDQ5aAo/M/wv6or
 RlY2D2EV0VwphY+N9Y6nikLO53TbSCxqyK6BktEg8FIVozvEwSlEvfn6KmFWENLJHPX3dyOlubo
 zohxd1YjVnPRqDorvLNudcvpgPwqIWvnKof/nS+bkYxg67STsqzt69cMUcHfmztIfzLWKiSes3u
 lLhNhI5gUeTV1u24zUfIWGViGLXmFPYYWhoBMRPkaG19QJX+lhpnh79WRWxQWKcy/SQIVDrdp0N
 nToAZblUgj3/cdE3oJbcBIcXzq8ieNiHQVFOs20UJVN8yIb0GDVFHWS1iN3H7YFrnhemz7ovDMN
 3XECRnCk
X-Proofpoint-GUID: qUuQkx8TRVje3Gy7l43BBommqFhG8FpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

When the SSR (SubSystem Restart) duration exceeds 2 seconds, it triggers
host tx_idle_timeout, which sets host TX state to sleep. due to the
hardware pulling up bt_en, the firmware is not downloaded after the SSR.
As a result, the controller does not enter sleep mode. Consequently,
when the host sends a command afterward, it sends 0xFD to the controller,
but the controller does not respond, leading to a command timeout.

So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 33c2dd7b8..1fb8eea09 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1668,6 +1668,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
+		/*
+		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
+		 * it triggers host tx_idle_timeout, which sets host TX state
+		 * to sleep. Reset tx_idle_timer after SSR to prevent
+		 * host enter TX IBS_Sloeep mode.
+		 */
+		mod_timer(&qca->tx_idle_timer, jiffies +
+			  msecs_to_jiffies(qca->tx_idle_delay));
+
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
 		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
-- 
2.34.1


