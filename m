Return-Path: <linux-arm-msm+bounces-68876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57149B23F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0DB07B5F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD9A2405FD;
	Wed, 13 Aug 2025 03:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RbuzeaEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1B1A275;
	Wed, 13 Aug 2025 03:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755056121; cv=none; b=KQNoVatFayU4W8gqTLsuvb6Gzhycf/ujl9MJwFD2zo9VutnpOdcYYddxPVMJbFRZJqYfLm5eCwFdMTFtPLCGtZdds0gs/W9vurcPo/EC4qwE4IR1mqhEEB/fgdMePHKrZRlgjQEnC5iz0+bm7KhrNlNJtrDAba65NrntQaXiNzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755056121; c=relaxed/simple;
	bh=/oP2+a2aEzOIXE/jalTy5HvnQWWnZG07n635j/5ri3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q9MjGrP2ewHBV3HIWvLM7SoUGqj1cwF6w5suNsScFAJVCEt4plD8/jbyhbTWvP+zn83bvc2jX6pluWgHkrhG3U7XxhEl4CYXh4d0Tzi+K/tPfembR4kQbI3mctusCarlhFUo9B1lk3XGzg7LxfGNIvCeBVKfS+36t5aUDo0o4aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RbuzeaEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D1hZDW006925;
	Wed, 13 Aug 2025 03:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E2Db8sgz1JO
	npK0C/euhkpHXxph8RB5WRTnzKyVIrrA=; b=RbuzeaEz42eVu/3JUOrN+Ai9d+J
	Js8JT7s77TCCuh0yFNFkZoJuMQLbzbMEkk3Ame+2JfoFS2RH+73zwGg+Yf1Dwzi+
	k6/ZbcC2lS5nxxLWa+Pio8I4tZqVgsHulQmSfwlsPBKTWZTn70asUlsih8y42gzG
	bC1od+sdjyoSeEUL1Lqw61g23IOVwHVIG9Gcq4WAnWEWBx0qQ6PVU6SxbBmTTBDo
	lGGFqHCjnTBG2pjgoGfitpUbppqyuiNMLntAgp2FQY86wwrrion6mGbzTOKVoxyk
	EplfB4MdN2Bx5gwQ0OL/YQXE0hCcV+dgFb82XAhACuypMK6s2EUERuNXbYw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjp4dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:17 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3Z9Kc004585;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm8qjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57D3Z9No004573;
	Wed, 13 Aug 2025 03:35:09 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57D3Z90D004567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:35:09 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 9EE49228FA; Wed, 13 Aug 2025 11:35:08 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH v3 3/4] driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one coredump file
Date: Wed, 13 Aug 2025 11:35:04 +0800
Message-Id: <20250813033505.3868781-4-quic_shuaz@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX9kchtJ7AsSuE
 n6FjNcJHPAJtfYDHFTVx1JCeD5sE2tgRb3241HBOqVYCBTzJAufRkBJW8SF8VhwDI6WrIMZiLKC
 rXe3UD2SHYWss6TODkoWgmQqdUr3U2OuwVCaUgwrCPwntxZiD+lqpl5mpCMZKyU+Azvc347VmaD
 3nioFkvf2NeR9okZ0pTjei5W1s8WEbuQpLpdtAF9+HD2CbP8vqDo5E9iOKipE+ju+Oa1e+Xva9Z
 Ct/y3nKRT0TlWvoVNIYlJI6LRAVrtp5wgflNoBrD0J/wGZu98Vk2Vno2ge3TpmqdBQpDBW+bs/a
 AthruuD1ZkGswPLL44N9JrthCqV+AknezlKczknvOxiXwE3Hr0/z2w44CyOEDuGELRp7lUbP+Na
 aX+l2Fu3
X-Proofpoint-GUID: SKmovGPMGnsY9YmwZ4WBDuOX-M1itbOn
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689c07f5 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z2vcJYTkWAVNmr-hFscA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SKmovGPMGnsY9YmwZ4WBDuOX-M1itbOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 50ec9b155..33c2dd7b8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1662,11 +1662,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
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


