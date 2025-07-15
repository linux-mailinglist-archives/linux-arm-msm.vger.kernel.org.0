Return-Path: <linux-arm-msm+bounces-65027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DDEB0584D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C271A60F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E192D8790;
	Tue, 15 Jul 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d87qbOM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5E26E709;
	Tue, 15 Jul 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577387; cv=none; b=KlaGrT+OPFBNeO1A+SBizH4HXlInfeeXL+1SZqRZG+uRpI1x0jITrQBxmm/NXZrcsTEVlSRouVJXSkywtGpt4UxCrLo3UF654TyP9zdwWZb2FhiDdEoOjn9nXooV6d55PIA5lzxqqew8lnfJWNH1x7fVBuwM6WyfAoHGOwJ/RJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577387; c=relaxed/simple;
	bh=/sWPCINMaB60z+bkwQT0KPa0xCV+8eHOxXwRIeUpWyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jAgEqSGqHp5K4o/hg6XutmcHrIZv75w7vd/bMza5KOWGF2KvU4ixmRQs55vJ6q54KEkraQtNc37KMjniOmnok4RJZj2leq7p0Qhin9oD3yXIncAH0mMfEg0ppVovlmCJV306FZr4x2sYND627E1riGrHKQLaZLdbBQEvrRUvBvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d87qbOM9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6DVWX027570;
	Tue, 15 Jul 2025 11:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfKbUjLBxQqOR5D9PPmzAy01j447i+pxPpHwBfLBPtU=; b=d87qbOM9oggaIm8h
	o0XMs1L/wgeNqgYmrsdVQ1MukFWNv4uWvWzskOos+DcVs7MMjKOoINFqih+1vW6r
	PXHL84Jlx+M+z+JQWvtk92uOxOLdWwVds4n7A4n2sWsSGbba6XTtex3mxIYjmTf9
	dz6PZOqcCBwGPzupdwozumx1Yqd6H8MsQ2ddyFTR/lkU1QAM7nasEGL0/NEKez1v
	gHPc1CycUiSQcde5ju03nlpUCdtLh+qlUJ1/Ckr/+ghFmYWHxyPzlzhS8gGhNvBp
	SNCUXOlSh9hIWxmdndcGlhYW8EiH3JpqCuVyzaRfqs2rBl+5fT9OmvvElEhFzEMu
	QW5GYQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drjr81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56FB2ha1019611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 11:02:43 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 04:02:40 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 15 Jul 2025 19:02:26 +0800
Subject: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
In-Reply-To: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752577357; l=4815;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=/sWPCINMaB60z+bkwQT0KPa0xCV+8eHOxXwRIeUpWyM=;
 b=2/asqrrW99u8254YRit7CLwqMSB6ahyZCPp5QKRYAy+SMiOTU7V1JQEK0ypqdezZF26JLKFX4
 sn9bjiQ9vEZD7DSK2Syzftp/P/KWrZ43/GI/xx4RvM3tjLjPcMyTFCN
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q4AUgMI1g-7NGhPOVanCM--I47mw8AGN
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68763553 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=xSRD5RxY1kXmWiYytnYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q4AUgMI1g-7NGhPOVanCM--I47mw8AGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEwMCBTYWx0ZWRfXws5NkR7ZBMG2
 f66rINwb0uQhbt36JMsNt87Tvpc2V2nRWU9idh98VVmD4ZTOoZI9p+fLYJ96E12Y19LTi3Dvwfn
 Y7EfUFo9HJipmRTGr/gycWMGsVRjjS4IOs3sz+fGNSB2/UIQZ7PYyVmAwGP16pIOqB2R8b8PTuk
 kpOLUoh13Gq25vQVLEhLqyDSwX8kh14BtFxbSsVcaLifzaf9MXzBTRhNzL8P2BU3RpFt6fohTbL
 tETdY/5CXw7MfM3YypgmgN0tdfNTwjNCoOhdAjZojiDkVzrZNeqTi5NzZGVJt76tIsCYHjkvPrH
 iM8eTEm0jOukMHwlRmDYZ/KJVNpUcDMbCfQLL577c025MTtKxxDovuyHgzM/RLH0fmQu55DYqo/
 Oehs4v5Y2hth94lYYYTlBsKllA6zzj1a9Sxj48tGpiC7X3UMgcEGTzP2KkBATOkDqU62/d/o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150100

Add PHY counter functionality to the shared library. The implementation
is identical for the current QCA807X and QCA808X PHYs.

The PHY counter can be configured to perform CRC checking for both received
and transmitted packets. Additionally, the packet counter can be set to
automatically clear after it is read.

The PHY counter includes 32-bit packet counters for both RX (received) and
TX (transmitted) packets, as well as 16-bit counters for recording CRC
error packets for both RX and TX.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qcom-phy-lib.c | 75 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         | 23 ++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/net/phy/qcom/qcom-phy-lib.c b/drivers/net/phy/qcom/qcom-phy-lib.c
index af7d0d8e81be..965c2bb99a9b 100644
--- a/drivers/net/phy/qcom/qcom-phy-lib.c
+++ b/drivers/net/phy/qcom/qcom-phy-lib.c
@@ -699,3 +699,78 @@ int qca808x_led_reg_blink_set(struct phy_device *phydev, u16 reg,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qca808x_led_reg_blink_set);
+
+/* Enable CRC checking for both received and transmitted frames to ensure
+ * accurate counter recording. The hardware supports a 32-bit counter,
+ * configure the counter to clear after it is read to facilitate the
+ * implementation of a 64-bit software counter
+ */
+int qcom_phy_counter_config(struct phy_device *phydev)
+{
+	return phy_set_bits_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_CTRL,
+				QCA808X_MMD7_CNT_CTRL_CRC_CHECK_EN |
+				QCA808X_MMD7_CNT_CTRL_READ_CLEAR_EN);
+}
+EXPORT_SYMBOL_GPL(qcom_phy_counter_config);
+
+int qcom_phy_update_stats(struct phy_device *phydev,
+			  struct qcom_phy_hw_stats *hw_stats)
+{
+	int ret;
+	u32 cnt;
+
+	/* PHY 32-bit counter for RX packets. */
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
+	if (ret < 0)
+		return ret;
+
+	cnt = ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
+	if (ret < 0)
+		return ret;
+
+	cnt |= ret << 16;
+	hw_stats->rx_pkts += cnt;
+
+	/* PHY 16-bit counter for RX CRC error packets. */
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_ERR_PKT);
+	if (ret < 0)
+		return ret;
+
+	hw_stats->rx_err_pkts += ret;
+
+	/* PHY 32-bit counter for TX packets. */
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_TX_PKT_15_0);
+	if (ret < 0)
+		return ret;
+
+	cnt = ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_TX_PKT_31_16);
+	if (ret < 0)
+		return ret;
+
+	cnt |= ret << 16;
+	hw_stats->tx_pkts += cnt;
+
+	/* PHY 16-bit counter for TX CRC error packets. */
+	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_TX_ERR_PKT);
+	if (ret < 0)
+		return ret;
+
+	hw_stats->tx_err_pkts += ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_phy_update_stats);
+
+void qcom_phy_get_stats(struct ethtool_phy_stats *stats,
+			struct qcom_phy_hw_stats hw_stats)
+{
+	stats->tx_packets = hw_stats.tx_pkts;
+	stats->tx_errors = hw_stats.tx_err_pkts;
+	stats->rx_packets = hw_stats.rx_pkts;
+	stats->rx_errors = hw_stats.rx_err_pkts;
+}
+EXPORT_SYMBOL_GPL(qcom_phy_get_stats);
diff --git a/drivers/net/phy/qcom/qcom.h b/drivers/net/phy/qcom/qcom.h
index 7f7151c8baca..5071e7149a11 100644
--- a/drivers/net/phy/qcom/qcom.h
+++ b/drivers/net/phy/qcom/qcom.h
@@ -195,6 +195,17 @@
 #define AT803X_MIN_DOWNSHIFT			2
 #define AT803X_MAX_DOWNSHIFT			9
 
+#define QCA808X_MMD7_CNT_CTRL			0x8029
+#define QCA808X_MMD7_CNT_CTRL_READ_CLEAR_EN	BIT(1)
+#define QCA808X_MMD7_CNT_CTRL_CRC_CHECK_EN	BIT(0)
+
+#define QCA808X_MMD7_CNT_RX_PKT_31_16		0x802a
+#define QCA808X_MMD7_CNT_RX_PKT_15_0		0x802b
+#define QCA808X_MMD7_CNT_RX_ERR_PKT		0x802c
+#define QCA808X_MMD7_CNT_TX_PKT_31_16		0x802d
+#define QCA808X_MMD7_CNT_TX_PKT_15_0		0x802e
+#define QCA808X_MMD7_CNT_TX_ERR_PKT		0x802f
+
 enum stat_access_type {
 	PHY,
 	MMD
@@ -212,6 +223,13 @@ struct at803x_ss_mask {
 	u8 speed_shift;
 };
 
+struct qcom_phy_hw_stats {
+	u64 rx_pkts;
+	u64 rx_err_pkts;
+	u64 tx_pkts;
+	u64 tx_err_pkts;
+};
+
 int at803x_debug_reg_read(struct phy_device *phydev, u16 reg);
 int at803x_debug_reg_mask(struct phy_device *phydev, u16 reg,
 			  u16 clear, u16 set);
@@ -246,3 +264,8 @@ int qca808x_led_reg_brightness_set(struct phy_device *phydev,
 int qca808x_led_reg_blink_set(struct phy_device *phydev, u16 reg,
 			      unsigned long *delay_on,
 			      unsigned long *delay_off);
+int qcom_phy_counter_config(struct phy_device *phydev);
+int qcom_phy_update_stats(struct phy_device *phydev,
+			  struct qcom_phy_hw_stats *hw_stats);
+void qcom_phy_get_stats(struct ethtool_phy_stats *stats,
+			struct qcom_phy_hw_stats hw_stats);

-- 
2.34.1


