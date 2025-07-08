Return-Path: <linux-arm-msm+bounces-64067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7501AFD039
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 18:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A9F3A646F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 16:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3955C2E6116;
	Tue,  8 Jul 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C7Hq8Ffm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9DA2E5B3A;
	Tue,  8 Jul 2025 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990944; cv=none; b=t0+X0H2ZJoT56QyzCVRyNMDXBeeYc8bvkxOCnQ5mcBGvUlto/aIXskEGrEzoPTfQbzXqK3OSfgV6bgKk3/WEvdrWgyBk59ROCI/fS580LfRmNfaV7KEzShec2yte1a/n1C1tZXoNBYWll3VLcQ0PCn1lmeuhuAbftk+q2Cza1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990944; c=relaxed/simple;
	bh=ZyaCKaQXI0uLhbZ/KKtzrJ/do4HoeAgRPraqtt4s6QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ikC/iniynOaV220ACpuuej+uK6tFH1/+LixXMdLVS4aTBHjrHcb5AvfcaVciLJ+9yHjnxOeKqSc5JmSAD8W8s78dRgRVflyUNvBhRUQOlG7oMDQ8SvysbTRpSxH4HceURCvzIXnToLatlizRg8auGYKQ8G0O07PxrfgIPArq9pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C7Hq8Ffm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAFBU008271;
	Tue, 8 Jul 2025 16:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZVj0+/oodglGDIZOrIveVBem+sp+h3oPXacN8rq34Q=; b=C7Hq8FfmrclS7ZHC
	u3O/2Ye5XWMpAd/2yRdtVinFs4iH97c39ecKaD/0wXgizuDrZxSbSle1GtsioYE3
	IEvPzdYFYUKzdjsf9XbC96jaRfSS0v2DT1b4qyYKAeiyKSvYcSZc55Losq1S4vim
	PujDzbAHf2X0wd8Q5YWmlIr4R2EQoUw9IeFZ+4EQlHo8hed1VcGZDHLZ2doZ0mCR
	Iio7kBrssNAyd1MsFPFyBIBwxgLlGCwFLi9oZTyRzNbbvP3bzTSFly2LEqGE9S3d
	Ttt7R4ISb3Lv937cMcOsYTkK0OSZYgx6s/BqHj6ptknkXO8ytvvESN+LIl3zapGp
	7BvcYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmywh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 16:08:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 568G8o4J016775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 16:08:50 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 09:08:47 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 9 Jul 2025 00:07:58 +0800
Subject: [PATCH net-next 3/3] net: phy: qcom: qca807x: Support PHY counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250709-qcom_phy_counter-v1-3-93a54a029c46@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751990919; l=1670;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=ZyaCKaQXI0uLhbZ/KKtzrJ/do4HoeAgRPraqtt4s6QY=;
 b=t3w9y1dCUgg5eeC4/2crzPz/R52eDMP16ISxFSl9SVOC4O0prBFP3ouMTYkCmU7yvyM0E494P
 G/6QgEF5eQHBo9Vd1wc0CuZROANzIjo10NZ+nRZjSZ7krAqAgamkyJC
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686d4293 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=gK5dAuqeCtZj7zEIbdkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LAOH6BJQrgGdi_sUYhw2ABYeB5I16xrz
X-Proofpoint-ORIG-GUID: LAOH6BJQrgGdi_sUYhw2ABYeB5I16xrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEzNiBTYWx0ZWRfX8MbFRl3w7aIB
 h/YL90g3EipBJK3qzYf3fAv0d6V0T00rcyygYmAMhKpHZ+ztdhL6cb88aBdgO0lm5WUZPVcrWW1
 UQGPJiuMyRU16bYfp/O8sZz51CwRo9o2YAhoTwgGplm5cJSjJk6ViQ07LvAUcyEOb2e4vv3aBMV
 GOetfBft1+0jcOKBUbdJXTazAxkjGMVsfspiaHvSxAIctHnarx54ZkXkURunXvj/1iflzVsOkQn
 c5OTOAAO3zSuDvzL5Atm3MfXK2c5rKxX3NSd/zL1QFTomdFuoqKEOwpS/TEibwa7M0/GWRvkbWx
 QsJFmTBEndhOivnMmFuTuw6VFW5hN8Y+0LlNQTzya6zXHsCGbbelGpKhI8iVPNJQepWUl0/O+kY
 hOA1lfrg2HJ1P/WCvfP16bSlrrkhLLSgOR9WK2iSbUhH17nAi5fInKXuBVIrVXCEw45ou1Px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080136

Within the QCA807X PHY operation's config_init() function, enable CRC
checking for received and transmitted frames to support counter recording,
and add PHY counter operations

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca807x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 6d10ef7e9a8a..51101d009dce 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -768,6 +768,10 @@ static int qca807x_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
+	ret = qcom_phy_counter_crc_check_en(phydev);
+	if (ret)
+		return ret;
+
 	control_dac = phy_read_mmd(phydev, MDIO_MMD_AN,
 				   QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH);
 	control_dac &= ~QCA807X_CONTROL_DAC_MASK;
@@ -800,6 +804,9 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca808x_cable_test_get_status,
+		.get_sset_count		= qcom_phy_get_sset_count,
+		.get_strings		= qcom_phy_get_strings,
+		.get_stats		= qcom_phy_get_stats,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -823,6 +830,9 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_is_supported = qca807x_led_hw_is_supported,
 		.led_hw_control_set = qca807x_led_hw_control_set,
 		.led_hw_control_get = qca807x_led_hw_control_get,
+		.get_sset_count		= qcom_phy_get_sset_count,
+		.get_strings		= qcom_phy_get_strings,
+		.get_stats		= qcom_phy_get_stats,
 	},
 };
 module_phy_driver(qca807x_drivers);

-- 
2.34.1


