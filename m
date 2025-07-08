Return-Path: <linux-arm-msm+bounces-64065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57168AFD034
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C533188ED87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8322E427D;
	Tue,  8 Jul 2025 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IdNfk+Y8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C11D5CD1;
	Tue,  8 Jul 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990939; cv=none; b=ncd8lUIhIirRM2Y576p73pxk8154TnnxeEIJX5wOPRHK1hNHtQZxpj+OBhJGHGJRsk/lQluXLkoUBDJjgBtbUMr+E8MSHApZJWBd8/d776Flb2usqy1AQZ6Iv5g9hDtwK7VNSw3sO8/vXl3lwHgjiTLzQqDrTxGTF+XBhdTP9Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990939; c=relaxed/simple;
	bh=nrgLWfVt4wM5C0iLRI369JH4fwXe2URvBmZYKaQKPFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YBkdh8/FyiYkXvnFIDv2Mh/WHCFHbDoExuW659G3pKtSXmrmr+1IeWW9hL1CZanqP8GL0hdmYvJU/XYk1SA4xQD8kCTUsHplEtce54W2EDMr0wIiNLavOeyhEvSt9HFdG/ZKe0tV8J1/F1n6+QKSHwdQX1mKlRgayNwPqS4+GUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IdNfk+Y8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAXwQ029138;
	Tue, 8 Jul 2025 16:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5loTR2ktold+chD/k6krm4Esz9jXCWiEOA8i7K/4i4=; b=IdNfk+Y8s2svjHMc
	UtGdCYPlJkB9OgHA2l5J6o2ZkcimQG8KhTN8OZzSjrHXQrdw99vjNxk4YhAwbV+D
	yac0QdaIGfdvxdfbqPuHg4H4gI5MvspXT1MguXEps4oGr9+CJuYQNMbmk54fK5GU
	Fnw/yNK/gOKSnCkzLoOu0HvFGAagyQt0e7ClVTC6wemCQlENMXWU9Vc1Rhd2rNFu
	HDwGwjZ9GuSBoaMH9VwUbuREPHXSTAqil+5ZYcljV9QV1RHfKAflByhxI6MCaINh
	tlPBu+9wizlovFclIkBA6rw6XXHSe7BO1rHzBLOls4X8JtZqJp1D6ZFWSFKK1DwZ
	C//yCg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b7r66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 16:08:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 568G8jAL016684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 16:08:45 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 09:08:42 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 9 Jul 2025 00:07:56 +0800
Subject: [PATCH net-next 1/3] net: phy: qcom: Add PHY counter support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-qcom_phy_counter-v1-1-93a54a029c46@quicinc.com>
References: <20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com>
In-Reply-To: <20250709-qcom_phy_counter-v1-0-93a54a029c46@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751990919; l=4430;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=nrgLWfVt4wM5C0iLRI369JH4fwXe2URvBmZYKaQKPFA=;
 b=6CEh6k1fLgeU2fP/zBkszsMV/qQ3DJvfrLZBHQwbbHWc+Hw2/Qruk8d6LSMXUil1x2+CKHF4M
 xGWMk9A+SJpBi2AqKoEHlvZRD4rgJgRxe0UxvW4UxJvDZALW1FkXKxJ
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX0M//0lu4RoYH
 mdu11v+wPiDldWvxgyUyQMiUibf/TU6aeub7N50bwUup5y4LxV/EjR09mik4XrKZmY2voIsujht
 2xaNIIRYzuPnYrYbZE1rs+sDyxoZ8sseT1lRGmWhiZuYZbW0QZbqqhVQ5liAl2brvHoehrWnDcp
 ExjYCMOWw+BZMBpjp4amLGWAlxYvApsYydE1BWRm2wBf1PBNmloV+bnpOVnDafCZEf43oX0j7Q5
 Ass4eGgRL4BHgGXrKi3cSMxay3dvu7bKmG15XscL3sbMSuscj2uBv2H2YFholZRizwfMzHGxEgI
 hjJHdk1qhusqcHv2nPGh6UPZvxRgIFBeAwVxMjOASy1Gvrn9SfggcUrtcAJ/bF16Xf3qgXGK4SW
 FYM0wrsj82Tx+Ir5WIhmqbBZRKPzblV4CG7k8cdX+DCnyMnMllWUg45ryAO2YhJsyzW/m1dV
X-Proofpoint-ORIG-GUID: gKGtL5XB25PbQ7qZfOZC1hEJBwr7O1u4
X-Proofpoint-GUID: gKGtL5XB25PbQ7qZfOZC1hEJBwr7O1u4
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d428e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=qZhSqy8QcDR0uRVn7pwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080136

Add PHY counter functionality to the shared library. The implementation
is identical for the current QCA807X and QCA808X PHYs.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qcom-phy-lib.c | 82 +++++++++++++++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         | 16 ++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/net/phy/qcom/qcom-phy-lib.c b/drivers/net/phy/qcom/qcom-phy-lib.c
index d28815ef56bb..6447e590539b 100644
--- a/drivers/net/phy/qcom/qcom-phy-lib.c
+++ b/drivers/net/phy/qcom/qcom-phy-lib.c
@@ -14,6 +14,40 @@ MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
 MODULE_LICENSE("GPL");
 
+struct qcom_phy_hw_stat {
+	const char *string;
+	int devad;
+	u16 cnt_31_16_reg;
+	u16 cnt_15_0_reg;
+};
+
+static const struct qcom_phy_hw_stat qcom_phy_hw_stats[] = {
+	{
+		.string		= "phy_rx_good_frame",
+		.devad		= MDIO_MMD_AN,
+		.cnt_31_16_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_31_16,
+		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_GOOD_CRC_15_0,
+	},
+	{
+		.string		= "phy_rx_bad_frame",
+		.devad		= MDIO_MMD_AN,
+		.cnt_31_16_reg	= 0xffff,
+		.cnt_15_0_reg	= QCA808X_MMD7_CNT_RX_BAD_CRC,
+	},
+	{
+		.string		= "phy_tx_good_frame",
+		.devad		= MDIO_MMD_AN,
+		.cnt_31_16_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_31_16,
+		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_GOOD_CRC_15_0,
+	},
+	{
+		.string		= "phy_tx_bad_frame",
+		.devad		= MDIO_MMD_AN,
+		.cnt_31_16_reg	= 0xffff,
+		.cnt_15_0_reg	= QCA808X_MMD7_CNT_TX_BAD_CRC,
+	},
+};
+
 int at803x_debug_reg_read(struct phy_device *phydev, u16 reg)
 {
 	int ret;
@@ -674,3 +708,51 @@ int qca808x_led_reg_blink_set(struct phy_device *phydev, u16 reg,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qca808x_led_reg_blink_set);
+
+/* Enable CRC checking for both received and transmitted frames to support
+ * accurate counter recording.
+ */
+int qcom_phy_counter_crc_check_en(struct phy_device *phydev)
+{
+	return phy_set_bits_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_CTRL,
+				QCA808X_MMD7_CNT_CTRL_CRC_CHECK_EN);
+}
+EXPORT_SYMBOL_GPL(qcom_phy_counter_crc_check_en);
+
+int qcom_phy_get_sset_count(struct phy_device *phydev)
+{
+	return ARRAY_SIZE(qcom_phy_hw_stats);
+}
+EXPORT_SYMBOL_GPL(qcom_phy_get_sset_count);
+
+void qcom_phy_get_strings(struct phy_device *phydev, u8 *data)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_phy_hw_stats); i++)
+		ethtool_puts(&data, qcom_phy_hw_stats[i].string);
+}
+EXPORT_SYMBOL_GPL(qcom_phy_get_strings);
+
+void qcom_phy_get_stats(struct phy_device *phydev, struct ethtool_stats *stats,
+			u64 *data)
+{
+	struct qcom_phy_hw_stat stat;
+	unsigned int i;
+	int ret, cnt;
+
+	for (i = 0; i < ARRAY_SIZE(qcom_phy_hw_stats); i++) {
+		stat = qcom_phy_hw_stats[i];
+		data[i] = U64_MAX;
+
+		ret = phy_read_mmd(phydev, stat.devad, stat.cnt_15_0_reg);
+		if (ret >= 0) {
+			cnt = ret;
+
+			ret = phy_read_mmd(phydev, stat.devad, stat.cnt_31_16_reg);
+			if (ret >= 0)
+				data[i] = cnt | ret << 16;
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_phy_get_stats);
diff --git a/drivers/net/phy/qcom/qcom.h b/drivers/net/phy/qcom/qcom.h
index 4bb541728846..ee2eb11d8d7e 100644
--- a/drivers/net/phy/qcom/qcom.h
+++ b/drivers/net/phy/qcom/qcom.h
@@ -192,6 +192,17 @@
 #define AT803X_MIN_DOWNSHIFT			2
 #define AT803X_MAX_DOWNSHIFT			9
 
+#define QCA808X_MMD7_CNT_CTRL			0x8029
+#define QCA808X_MMD7_CNT_CTRL_READ_CLEAR_EN	BIT(1)
+#define QCA808X_MMD7_CNT_CTRL_CRC_CHECK_EN	BIT(0)
+
+#define QCA808X_MMD7_CNT_RX_GOOD_CRC_31_16	0x802a
+#define QCA808X_MMD7_CNT_RX_GOOD_CRC_15_0	0x802b
+#define QCA808X_MMD7_CNT_RX_BAD_CRC		0x802c
+#define QCA808X_MMD7_CNT_TX_GOOD_CRC_31_16	0x802d
+#define QCA808X_MMD7_CNT_TX_GOOD_CRC_15_0	0x802e
+#define QCA808X_MMD7_CNT_TX_BAD_CRC		0x802f
+
 enum stat_access_type {
 	PHY,
 	MMD
@@ -241,3 +252,8 @@ int qca808x_led_reg_brightness_set(struct phy_device *phydev,
 int qca808x_led_reg_blink_set(struct phy_device *phydev, u16 reg,
 			      unsigned long *delay_on,
 			      unsigned long *delay_off);
+int qcom_phy_counter_crc_check_en(struct phy_device *phydev);
+int qcom_phy_get_sset_count(struct phy_device *phydev);
+void qcom_phy_get_strings(struct phy_device *phydev, u8 *data);
+void qcom_phy_get_stats(struct phy_device *phydev, struct ethtool_stats *stats,
+			u64 *data);

-- 
2.34.1


