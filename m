Return-Path: <linux-arm-msm+bounces-63602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B675BAF8745
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1512F17B984
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 05:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9446211479;
	Fri,  4 Jul 2025 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VDhnzXqk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE2620CCE5;
	Fri,  4 Jul 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607108; cv=none; b=hQUXwfGo26JgRXkpfDuAcuVQ08AJodslDkq5mGzY4t5Kx2eKsvUfyjVm0yOO91idq/5gO4gRPLNuXfgCN/UDMTPNaB1PgSm+Q0JQEdfIps0MUaOIGNdzqG34mNLhZK/dGXqxNxLz2GbiLk0a3kAd7Ln+6V+vVOsI0r8ZdXuNdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607108; c=relaxed/simple;
	bh=uCJ+CKNkcMrdBKA6492L65E5VwkreHxED9nsiuxODzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YNK4d4pzD1cOLZzA2hqHmKgwADDG95UxUFEGdUeYHsKQ+UJjtNzjf7L00Iq+61G6/c1SwqRkx0JDi9Rh91lgTHMd1++C+0Ari1IMhBEQWZtx4s9eXcXpCsJ1e7JYM5MXSMnPDL2Q9JJ1teiNOqJQZzS5kRW5ZSkN5q5e6P5BZVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VDhnzXqk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563MwiVZ022207;
	Fri, 4 Jul 2025 05:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6Z8OKqeZuaOwvi35dbacGVDIyKHA6hEBwyM876w3RU=; b=VDhnzXqkBcZjHtG1
	q5tm3Y8aqyyRX0arxga3bGbWlGOHYkr6aObmUGp7VXIlI/DPFO1k1Jf+EJ7auJYm
	ZnAbAkL43xpw44pB77EmLmbFXeKlJ+ca0uTjEFZa/LlXK6h1DKyNpFjKEQKSslWV
	9oxhALwYyk1q1DDzvltPBwSWKMUDClvrJK4l+Rp7yCbXRFaKlniW1TjwVyXz0uC5
	Eti2suJL+KParkoaapmjG6BBgfBqL9zgwLaZjsQwWbYr6p2N9ivkHPVO3YNsIu5m
	KRRpWMlTQPCfBJGzPd8ZDaKCH9Ap16QflRw/W0WJu7t2A9ByB9Mb+Fu+2lK4q8CW
	ywUcew==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw2rjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 05:31:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5645VTu8027355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 05:31:29 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 22:31:26 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 4 Jul 2025 13:31:14 +0800
Subject: [PATCH RESEND net 2/3] net: phy: qcom: qca808x: Fix WoL issue by
 utilizing at8031_set_wol()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-qcom_phy_wol_support-v1-2-053342b1538d@quicinc.com>
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
In-Reply-To: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Viorel Suman
	<viorel.suman@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Wei Fang <wei.fang@nxp.com>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <maxime.chevallier@bootlin.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751607078; l=1169;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=uCJ+CKNkcMrdBKA6492L65E5VwkreHxED9nsiuxODzU=;
 b=EQFrV/1emsqtHWYgNZewLlrssVReA6iqXInix5aDal+bW1cAzxDGjtQIy2sIT4WsdCIz1ZApj
 W0QSSTZmjteDwKBXSyV8wud5meawfCNN7kGVx4H3ZMog0cJ7Q1dP1SF
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pI03g9vWKZfctMS8sGhUkcTLPJYEDmZq
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68676732 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=ETsMY3Suay4yqmZ1JtkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pI03g9vWKZfctMS8sGhUkcTLPJYEDmZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0MCBTYWx0ZWRfX5WNQkCmypv1O
 1X9v5h1vlh2QKWhWDK0O7HYRjljME69JbX5Q8wgsiOhiC6n6/U1EqIawQ5n3C8C8zs5N0cADmGq
 ofXONd41woCYSsypyS6tCLMcqYhS+a3+81offtFd+PMLL1CL8HyZSp9B9gVFdAlWqjDSF0R3/NL
 +qzv7NJEjJm8xI/b0eNVQdOEf8mIEL/rQD7gS0UqUMLVL/n52AJ0R/T472uHpqCo6nIrhotOZVz
 fDXmasLetF8BlVm3UZvz2viDL6kj5C1FFSztq/pP2Za50hBm36mgWPNxnPktPIoDszZQoNHXn0g
 gXUi89mEn3wM5PEydhUmIW3yo1iMbUXUXjBviRBegQHP9xhi2Dn/sQOua8TlwHdedLe5YQW18lf
 iNlAtvTcJAlnpLaMdEj3mGzYw46PphItcg7KuQ2LTAMpjAeNtg8pK/5qsiAPidC0H8fxRcRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=848 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040040

The previous commit unintentionally removed the code responsible for
enabling WoL via MMD3 register 0x8012 BIT5. As a result, Wake-on-LAN
(WoL) support for the QCA808X PHY is no longer functional.

The WoL (Wake-on-LAN) feature for the QCA808X PHY is enabled via MMD3
register 0x8012, BIT5. This implementation is aligned with the approach
used in at8031_set_wol().

Fixes: e58f30246c35 ("net: phy: at803x: fix the wol setting functions")
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca808x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index 71498c518f0f..6de16c0eaa08 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -633,7 +633,7 @@ static struct phy_driver qca808x_driver[] = {
 	.handle_interrupt	= at803x_handle_interrupt,
 	.get_tunable		= at803x_get_tunable,
 	.set_tunable		= at803x_set_tunable,
-	.set_wol		= at803x_set_wol,
+	.set_wol		= at8031_set_wol,
 	.get_wol		= at803x_get_wol,
 	.get_features		= qca808x_get_features,
 	.config_aneg		= qca808x_config_aneg,

-- 
2.34.1


