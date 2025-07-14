Return-Path: <linux-arm-msm+bounces-64835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A0B04262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33FB618940D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D9325C6F1;
	Mon, 14 Jul 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k6obcYIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A75258CF2;
	Mon, 14 Jul 2025 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505178; cv=none; b=N0McramoUpGy/KSXoMwPsmrOIimmZbGcXTwWgqjTJdvDjJxzttp1qWor60lexHugQOlUyb2Tak39pGmEU9jBDWXg2ZP9a91CBGdYuTVvS7Qw11A0CkCT4RAVXeQh38EYgfW6lE9ulrwpOBoSwYJYufewqG9VphIsA/15LHBO1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505178; c=relaxed/simple;
	bh=zdIA1OrZ3QwuE1iTyT9RAIBjGDyxK+dHldknrTLLHLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C2lKphpp/zAsdwTMueY5fy7VxWNAq8/u6GFD1W5D5mVwdnDSWgPDU4LwyALm/7G5VQbosnjoUiaWDjka8Tur7l/l9G9Tk5XYK2iGQiGok/nrq/BlKMh9XM8b1541lCXpYppXFI9siL2yyeHlQ8q3mwDlgKRAR0H5gc89BfxdFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k6obcYIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9rYvw004879;
	Mon, 14 Jul 2025 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxWZKZdiJDX0DMRAQWw1ZpYiBrf/IfhPklk9LZUV/sw=; b=k6obcYIq8QPiPF6D
	1Glu3uLOaLiBFhXPFKMdpnAi9yusHq3lzS2Osgp88/eFtR5EGr93I7nxt1/up0Wb
	ilpNWHh3BVUY4017Lixt92wvO1DtOJFIBynfBc1hC5ZuKL4q4RPM8WJ6XVWU73gh
	7j6m/SqcbgKzyS1jkWy/g0LpvtrEMo+5kskudy1gAE7ie9l67UjzQ/CoFhLuvVVp
	01JzkGjUySrfYWSRVaE5DGByVYHfGnCwMMjsavMWGvkko8NS2AsTIjTRq8He0akd
	iJfTDhgXmFarHE/lKcSlJkDC3g73SCxvvefiVSkKxLOg7bO3bixKoTS+wQ/iwSLM
	pP7KQQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaw19d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56EExMVU010472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 14:59:22 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 14 Jul 2025 07:59:20 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 14 Jul 2025 22:58:56 +0800
Subject: [PATCH net-next v2 2/3] net: phy: qcom: qca808x: Support PHY
 counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250714-qcom_phy_counter-v2-2-94dde9d9769f@quicinc.com>
References: <20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com>
In-Reply-To: <20250714-qcom_phy_counter-v2-0-94dde9d9769f@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752505154; l=2215;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=zdIA1OrZ3QwuE1iTyT9RAIBjGDyxK+dHldknrTLLHLA=;
 b=JX1f5ezzhLbuBLwQYxqQSAPSQP6dfGPdEa8q5z1pEn6eKx/+sM8mjCW/MzVJ6RSLsRFlYcJpK
 x7EQ8HJk3b9Cwm1eGU/omvhFs6lDyM56GmZMtRAF08s9kUF+jgfAfcA
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x-xXOVSIxoh_vZae32JroFRfs-Pzcn9y
X-Proofpoint-ORIG-GUID: x-xXOVSIxoh_vZae32JroFRfs-Pzcn9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4OCBTYWx0ZWRfX3yTmPeLt/tPV
 U2a8hfGitmMrJyYGu2DQIo+bE0IWdMQuuK2d4IzNGqpkRRQro7A4CBE2QRCasPJLqRvesyGf/Sw
 92FOWkrsG9sO6sLtmODbo56eh/I5dAJj+3Gp55SLtnt4tjUbG0bD1WZPJ8AOK2wVPR8GkXyZ5G/
 bx1QDKh0elL+X/fkvPIzDCZcR4uygD0EiPE97wBEQ0hShMnbkjmjmYvD+/i8lc14eo/VbtHbtan
 U7/7mCD3/JJVBBnQNAsduTN42rGQtaOPh7NMUCn+efZ1TPHDt6EMQuBDD62qFliKytdHub9ftPy
 w+c9NLb/W1yKlJxYcKWsS81KBUIy7ylORcaFYCcgd7JvtzqsxHMF1d8qEZGUhm4ASmLOV4LtatC
 dpkqM9an8g8YuEe5OoNyJiTEjIL7ljb3E4bdoY0m+dTW2u9G3Bii66Rq+sMlKqDUKivOnu8J
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68751b4b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=_JwSswBLOsKPZBXwtL4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140088

Enable CRC checking for received and transmitted frames, and configure
counters to clear after being read within config_init() for accurate
counter recording. Additionally, add PHY counter operations and integrate
shared functions.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca808x.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 6de16c0eaa08..8eb51b1a006c 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -93,6 +93,7 @@ MODULE_LICENSE("GPL");
 
 struct qca808x_priv {
 	int led_polarity_mode;
+	struct qcom_phy_hw_stats hw_stats;
 };
 
 static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
@@ -243,6 +244,10 @@ static int qca808x_config_init(struct phy_device *phydev)
 
 	qca808x_fill_possible_interfaces(phydev);
 
+	ret = qcom_phy_counter_config(phydev);
+	if (ret)
+		return ret;
+
 	/* Configure adc threshold as 100mv for the link 10M */
 	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_ADC_THRESHOLD,
 				     QCA808X_ADC_THRESHOLD_MASK,
@@ -622,6 +627,22 @@ static int qca808x_led_polarity_set(struct phy_device *phydev, int index,
 			      active_low ? 0 : QCA808X_LED_ACTIVE_HIGH);
 }
 
+static int qca808x_update_stats(struct phy_device *phydev)
+{
+	struct qca808x_priv *priv = phydev->priv;
+
+	return qcom_phy_update_stats(phydev, &priv->hw_stats);
+}
+
+static void qca808x_get_phy_stats(struct phy_device *phydev,
+				  struct ethtool_eth_phy_stats *eth_stats,
+				  struct ethtool_phy_stats *stats)
+{
+	struct qca808x_priv *priv = phydev->priv;
+
+	qcom_phy_get_stats(stats, priv->hw_stats);
+}
+
 static struct phy_driver qca808x_driver[] = {
 {
 	/* Qualcomm QCA8081 */
@@ -651,6 +672,8 @@ static struct phy_driver qca808x_driver[] = {
 	.led_hw_control_set	= qca808x_led_hw_control_set,
 	.led_hw_control_get	= qca808x_led_hw_control_get,
 	.led_polarity_set	= qca808x_led_polarity_set,
+	.update_stats		= qca808x_update_stats,
+	.get_phy_stats		= qca808x_get_phy_stats,
 }, };
 
 module_phy_driver(qca808x_driver);

-- 
2.34.1


