Return-Path: <linux-arm-msm+bounces-32865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A9998BB57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 13:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D25E1F20F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 11:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0431BFE03;
	Tue,  1 Oct 2024 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YoTrGRp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780719DF53;
	Tue,  1 Oct 2024 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782686; cv=none; b=hiKxn/ADTE0KGv4lHtHxrGjfaBsR8lCJ6+PXapJo1vU8bPS55JGulb5Af+Fd8fkqUQjXeOZnWUxI7YfHM9wgiE9PqGPvfb5wJRmFkleCTQ+Kl71r4p7KVXKHBjb3HrPpUhLGGXeKW/XYHNgzasugb+tBrEOuWqLcx9b3EFV6rts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782686; c=relaxed/simple;
	bh=8GGy2t+zDlmFEH1+BK+kXfBif5WBL+v0s/d0M+5d6AA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u4vFW+oQl/29apo/iHBbkkFJPh3SjOvaacCYDusAwtxqJsd4qf92Y7R0xWG8Jz5TKDc6v/EK7t5ztnOoyPZ5sP1dhiSBQiilaifrmEgVJvoTF777rXYx0VVDysaeJWlslBjFYCji0bNPcj4beEXANOKbyR6WZe0m80MAF8MKi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YoTrGRp1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491AC8OX001985;
	Tue, 1 Oct 2024 11:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FCgPRX2Lc/rLHJ6D7iOORv7rJsF1yr5pgyC
	NDwjUY0I=; b=YoTrGRp1xbB1YyIH4OhWFaSK74Box4yUZMNT/h7PzOlCkUBu5PT
	Jhn8RKTy4wdNiWMtfWKzq4pH+tBQ0V38BJR63I0POvaeYqXGbfFN0P6ah5KNKeVW
	8hnjX89oFftYUIqrPQMW5gq0ZCKw9uARyyZo3DkyX5VTxuaZMkNYCMbb25VzHgIk
	0msjkJlGhu8QFm/qL3kRxROcLcK8hsAVnAbfO+KG7BcaAHHNL0l3cBwHNI15jMmt
	F8l+i2iLPiLWUp0nSeciESvTS8UgLJs2mn4/mGvnbvqt6td7U0wU6ch2NStBVNx7
	26EDYujbt0fLQywq1/89/r281MsxsstYErQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xte0xseu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:37:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 491BbkNZ002799;
	Tue, 1 Oct 2024 11:37:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41xavm1wrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:37:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 491BbjUO002793;
	Tue, 1 Oct 2024 11:37:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.96.82])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 491BbjWV002790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 11:37:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2370923)
	id 52A2353F; Tue,  1 Oct 2024 17:07:44 +0530 (+0530)
From: Vivek Pernamitta <quic_vpernami@quicinc.com>
To: mhi@lists.linux.dev
Cc: quic_qianyu@quicinc.com, manivannan.sadhasivam@linaro.org,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_skananth@quicinc.com, mrana@quicinc.com,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Slark Xiao <slark_xiao@163.com>,
        Fabio Porcedda <fabio.porcedda@gmail.com>,
        Mank Wang <mank.wang@netprisma.us>,
        linux-arm-msm@vger.kernel.org (open list:MHI BUS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] bus: mhi: host: pci_generic: Add support for QDU100 device
Date: Tue,  1 Oct 2024 17:07:35 +0530
Message-Id: <20241001113738.152467-1-quic_vpernami@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HA-iO2LzxR8uE8Ptc_-sEAJaWS0yY6ad
X-Proofpoint-GUID: HA-iO2LzxR8uE8Ptc_-sEAJaWS0yY6ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010075

Add MHI controller configuration for QDU100 device.

This Qualcomm QDU100 device is inline accelerator card
which is an extension to QRU100 5G RAN platform.
which is designed to simplify 5G deployments by offering
a turnkey solution for ease of deployment with O-RAN
fronthaul and 5G NR layer 1 High (L1 High) processing,
and to accelerate operator and infrastructure vendor
adoption of virtualized RAN platforms.

https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/bus/mhi/host/pci_generic.c | 49 ++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9938bb034c1c..1153697fa858 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -245,6 +245,52 @@ struct mhi_pci_dev_info {
 		.channel = ch_num,		\
 	}
 
+static const struct mhi_channel_config modem_qcom_qdu100_mhi_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
+	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
+	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
+	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
+	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_SW2", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_SW2", 256, 7),
+};
+
+static struct mhi_event_config modem_qcom_qdu100_mhi_events[] = {
+	/* first ring is control+data ring */
+	MHI_EVENT_CONFIG_CTRL(0, 64),
+	/* SAHARA dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(1, 256),
+	/* Software channels dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(2, 64),
+	MHI_EVENT_CONFIG_SW_DATA(3, 256),
+	MHI_EVENT_CONFIG_SW_DATA(4, 256),
+	/* Software IP channels dedicated event ring */
+	MHI_EVENT_CONFIG_SW_DATA(5, 512),
+	MHI_EVENT_CONFIG_SW_DATA(6, 512),
+	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+};
+
+static const struct mhi_controller_config modem_qcom_qdu100_mhi_config = {
+	.max_channels = 128,
+	.timeout_ms = 120000,
+	.num_channels = ARRAY_SIZE(modem_qcom_qdu100_mhi_channels),
+	.ch_cfg = modem_qcom_qdu100_mhi_channels,
+	.num_events = ARRAY_SIZE(modem_qcom_qdu100_mhi_events),
+	.event_cfg = modem_qcom_qdu100_mhi_events,
+};
+
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
@@ -822,6 +868,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* NETPRISMA FCUN69 (SDX6X) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
 		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
+	/* QDU100, x100-DU */
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
+		.driver_data = (kernel_ulong_t)&modem_qcom_qdu100_mhi_config },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.34.1


