Return-Path: <linux-arm-msm+bounces-64066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD3AFD032
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5E173A55A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C30F2E5B02;
	Tue,  8 Jul 2025 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lZuDGWr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDB22FDE8;
	Tue,  8 Jul 2025 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990941; cv=none; b=U6jAMZC+M3SmjRZ4zvuG8lNz3eU74gyjBTEOxvthyqbxoHxFxvuA2FnNruOBH/YpwC/0EqA8pYS00GiW7z1Z7SuVgzoFbIVajyf4s6yAbeHkCdXjKkxckQuJ5R1piGBNcDpyW/wbLFKG/+So8nLnOfrXvUBktkpkDGGlhyyrRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990941; c=relaxed/simple;
	bh=E1XNJwW3BrTwevuvMGtePENPxfdIEg4WnI7LQeUBvm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tvW5TaEyN85SjgPVw8dctcuPTjls4K2IuWtIpKvk0T67f2EP8aMJ/N0VXwJqpACy31FR977hgLE0z7gHVDho7Bv7SKwtZx3NGFZKhQz8kV5gzBNH1heM85sE4rYvrVDv9f63xuf5SRd84P9U/gNfVytUnZx0PNbLkvQrxFZT3iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lZuDGWr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568EbfuO006230;
	Tue, 8 Jul 2025 16:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DC1D6igSqBK1ID/1bd8ZrzQBsN/iFbBWMyoa4ABgCLc=; b=lZuDGWr731X/3msk
	Y7Fp9WilTMto/9T+kDQPeA/ZG4ya/nUsG7GTvrW5QPkHjpMCitFTO2rzjwdsWThb
	kbZ56sW9tXCC4rbVZG6g7NBzs1NZP+AljjzYDcl4Ie+nESNefXNHideKX5K7el2Y
	Ffxel2I5kXa3mUn0kHFoU+hLy5LJKrbv31AI8WK2umw73XXmg8k4idsSL19y7xWC
	6Pb4MEC+HbZlx9j9us417jWgh5FzvzQET4gZg4peOxvTvcnYOxVp3PZZQEMFxDjN
	942g+D4JL8LZTNIpJDWzn/hU7KinYMaDHZOB9IUaKTg0+J9xkM0cYj1WtvxG7yyV
	WhX2jg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b7r71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 16:08:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 568G8lUF010182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 16:08:47 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 09:08:45 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 9 Jul 2025 00:07:57 +0800
Subject: [PATCH net-next 2/3] net: phy: qcom: qca808x: Support PHY counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-qcom_phy_counter-v1-2-93a54a029c46@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751990919; l=1285;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=E1XNJwW3BrTwevuvMGtePENPxfdIEg4WnI7LQeUBvm4=;
 b=wvOMJML3Fr+Tmx5TZbM8XRMZ+9eBeLFqRNhZa29hgCKPH0FGhWjeffTsZzEoxTLmYrY3Hm79j
 NqZD4uKL9yTAKI2RjaxpiPY4v3ND1cu5LeGAe5WJYP/j32ej3+BCPiA
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX4dxhcu+4lGwW
 5jfQV8i6eUBiEczA8JMoOlwtkC6kv2x1mRgwAPZ7NzUCQUYJ5AaVXBJWQHRhhxBn/+LLwrvIYDp
 +cJyjFjm+Old3Fr5D2K0H88hlHfVajrfujd6lJxZ6DSLxmiGAFWPbjEfn3R988UV9BRtV1fDPaS
 j9kQx5Fd1FPmk5df93MSOl6U+vpFYlSApXFTaKhfzdmCSu2uYJTR0qBdOSqVtj6lRmq/z0kFFsC
 ckYwSFU+lSj/XUkQaXn8SD7mD3S9k05JAJD5yo/4AfMFo/i9alDiBCw0QLwyrhMcHBcs28bwYq4
 D0MUEwTnUWpKz3W5uJlHc5owtbrr5+VDfxDrmTEKsxwJBGcdhMm3U6KGRkjvntpEL3XN8Re42Jj
 n+ilFe5rvHZKX3uCnqyzFXtP3qEsLXVWox5DVMSoG+qOYgLHzMmhW54SAuOAsPnK8gLd/jsJ
X-Proofpoint-ORIG-GUID: czHBwM4UwTvMFz6NRKw_YCk7OHY1_kQr
X-Proofpoint-GUID: czHBwM4UwTvMFz6NRKw_YCk7OHY1_kQr
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d4290 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=VwXRJrvAj_jGHEK00D4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080136

Enable CRC checking for received and transmitted frames within the
config_init() function to support counter recording, and incorporate
PHY counter operations.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca808x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 71498c518f0f..06967ce54036 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -243,6 +243,10 @@ static int qca808x_config_init(struct phy_device *phydev)
 
 	qca808x_fill_possible_interfaces(phydev);
 
+	ret = qcom_phy_counter_crc_check_en(phydev);
+	if (ret)
+		return ret;
+
 	/* Configure adc threshold as 100mv for the link 10M */
 	return at803x_debug_reg_mask(phydev, QCA808X_PHY_DEBUG_ADC_THRESHOLD,
 				     QCA808X_ADC_THRESHOLD_MASK,
@@ -651,6 +655,9 @@ static struct phy_driver qca808x_driver[] = {
 	.led_hw_control_set	= qca808x_led_hw_control_set,
 	.led_hw_control_get	= qca808x_led_hw_control_get,
 	.led_polarity_set	= qca808x_led_polarity_set,
+	.get_sset_count		= qcom_phy_get_sset_count,
+	.get_strings		= qcom_phy_get_strings,
+	.get_stats		= qcom_phy_get_stats,
 }, };
 
 module_phy_driver(qca808x_driver);

-- 
2.34.1


