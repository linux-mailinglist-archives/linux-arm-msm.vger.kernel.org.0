Return-Path: <linux-arm-msm+bounces-65668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4EB0A5AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92267A4585B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277372C2AB2;
	Fri, 18 Jul 2025 13:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VNU8SOdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7AEEBB;
	Fri, 18 Jul 2025 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847101; cv=none; b=kjRPjwuAWcmzXpAPKj3ASL+7mhOK7qEsReVRLP3JBmNsYz+9yVjuJb7ofkkuji//f+gdJEAwnEZxteX/mFTX8TIyr1EmQVAyROpG5m32g7GSHHFkvN49gw6apIlVZ+N5IC7C04pU3dUYxplvHYJMS33ctowOEsfRGXgbf20oOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847101; c=relaxed/simple;
	bh=vA3Uqg62DsrdC/AkJVK/Z7Ri2Txyb//fbU1EU1nfb78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=EUaX2HkTONWZnciaLW+b0LyPRu7WKHniMohZsr6j2lkUsRaiL+grmesu7TJl1t9eUMsKN1prHVGmyNL9N6FdDqc+Ym23tka51qNweiyZOE8VhySxJLDnoF9qBUW9EojjxjwuipUNaQhhv5zJfROzuEdb7u8LQOvuYto2ODNfrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VNU8SOdN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6cQm5022228;
	Fri, 18 Jul 2025 13:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xMyq+UQmXdmON5vC6TMOcg
	vkWqD1TDJ9VR4LnTeguYk=; b=VNU8SOdN+6tOHj9GEVgIOh8D/jx+/UmRY0nTf/
	Gspyb2JcwSrBarWoyhLuwLjqNH3W1QBcGRHjzOhBL4yIfqE7/EfOZEqpTn6zjBtP
	3eO+4kOhQWApqcAZq+LCQXiqjFvDAp0sMrPdSG/HVJH3BT1f9NIa3zRGD08OM2op
	p/11KGFeukWr/kfLZfmwQ4yaXLdw2960k1AZJLHNsINkrmoYTEIJwhCqKQr0sBUd
	oPHHprOIcxDfwyTRAyMCgSVAsVzokBYIiUIbEFnEq8JJri902TIfV7672KrDdJ+B
	//YVqrrPS6ieIPG6+uPodxfSSYJR6xT2Yo1RuuFYjUHjhY8w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsybs5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 13:57:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56IDvxbW024042
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 13:57:59 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 18 Jul 2025 06:57:56 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 18 Jul 2025 21:57:48 +0800
Subject: [PATCH net-next] net: phy: qcom: qca807x: Enable WoL support using
 shared library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250718-qca807x_wol_support-v1-1-cfe323cbb4e8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIANtSemgC/x3MWwqAIBBA0a3EfCfYQ3psJSJCpxoINbUSor0nf
 Z6Pex/w6Ag99NkDDi/yZHRCkWcgt1mvyEglQ8lLwZuiZoecW97E6Tb75E9rjQtMSdF1sq2EEhW
 k0jpcKP7XATQGpjEGGN/3A7Yu1+ZvAAAA
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Maxime Chevallier
	<maxime.chevallier@bootlin.com>,
        Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752847076; l=1769;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=vA3Uqg62DsrdC/AkJVK/Z7Ri2Txyb//fbU1EU1nfb78=;
 b=8MtE5Ncy+wb01AQQCz2HizZNF21Alvu0a2lOXnFsQx3Q4lEtQukGnMsL9w1u+d/vREQunGKJA
 40qiZGXNGYkCIxe/hNiJIjLnIyhT9nl9OHnN4Z/DfWCpjc5CHGcf17i
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNyBTYWx0ZWRfX3VZ0o3Ugrmyc
 3pf7OviD53cIhbcVvI/3eClOxL2cx1TIgw4pgZHmeE0vvxRlfx0Zsg1/6r9EfW4pnkCc2MjhV85
 vphO5vPPiv6bD9VLsBDUKglIalRgnJQT06WsrRagzA3XeAklfvbRPrMq/pa/R2MiAwZJUoc6Xft
 Hmm7Z5gYwrNz95WMUi1XNM//KNfb1yNvd84zya5zPHCUGOxPTsPnlIMCHro9SkNTw6KpbHfS3Lc
 cKTmZPT8ZwBxsS7+Q0ZlH0GiLUmrqZpPSlZP5qZ3ERcVtceMpR2S+lgGEWkUqTp5BjKmILe6d30
 xFbG1wTxB8u+O7Q/RNmBcPynAsMD+yeGObEKi3rb1lBWMPtbgC00uvvow7LPUDpX7ZSEzUATrTF
 tqEIXLqb8e6F+sBWXbnH6HFw8zvcsQpLAele7cj/xXFe/Z4eKh2igiWrqHK2w6W4r+MK4qtZ
X-Proofpoint-GUID: N4mxiNQ-lAJpaCiuEXsHo6yqurbRt5_d
X-Proofpoint-ORIG-GUID: N4mxiNQ-lAJpaCiuEXsHo6yqurbRt5_d
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a52e7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=P-IC7800AAAA:8 a=r5RVRYFPawynfPqA4o4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180107

The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
to that of the AT8031. WoL support for QCA807x is enabled by utilizing
the at8031_set_wol() function provided in the shared library.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
This patch is split from patch series [1] for the net tree. The first two
patches from that series have already been merged into net and propagated
to net-next. Based on Jakub's suggestion, the third patch should be
submitted to net-next.

1 - https://lore.kernel.org/all/20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com/
---
 drivers/net/phy/qcom/qca807x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 291f052ea53c..04e84ebb646c 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -823,6 +823,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.cable_test_get_status	= qca808x_cable_test_get_status,
 		.update_stats		= qca807x_update_stats,
 		.get_phy_stats		= qca807x_get_phy_stats,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -848,6 +850,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_control_get = qca807x_led_hw_control_get,
 		.update_stats		= qca807x_update_stats,
 		.get_phy_stats		= qca807x_get_phy_stats,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 };
 module_phy_driver(qca807x_drivers);

---
base-commit: d61f6cb6f6ef3c70d2ccc0d9c85c508cb8017da9
change-id: 20250714-qca807x_wol_support-dc599c835d53

Best regards,
-- 
Luo Jie <quic_luoj@quicinc.com>


