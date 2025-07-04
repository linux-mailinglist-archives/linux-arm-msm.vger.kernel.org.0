Return-Path: <linux-arm-msm+bounces-63603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45404AF8749
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97DEF584158
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 05:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9E7220685;
	Fri,  4 Jul 2025 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LUTtABhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFE218AAD;
	Fri,  4 Jul 2025 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607111; cv=none; b=Ym2l4f4q6W4kc6s1F+HZZ2HQs71b9VrLfv8Wja0dqfXxPkn4uMOl8Tg0W869lAMyrWSWuyAqFV/atXJAOKXuSfCtcGX694Tsrphk7U4bgOJ8tQxLBAOVlhu8awvXDWwBDU1AQVRluYg757k+bgAWNu2PCzlUm9iLqkd4zot6NdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607111; c=relaxed/simple;
	bh=p57Arrg/ytvCIG/QGXz+S5ndqRcPSjPIJz6EPCT03zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OjeU6CQRqpPVaGYTKt+The7HFRc7WCTTj3d4xo0XnrvuA9gJg9bwJKmIOapNGzVnXYJdFN2HYN5HM8SjfLxUsS9/RYdRWlBIlzbWQH6hX3XO1OH6Y0hRsx+VszRPOURN2mONkEJ76kAlD5nrjedStcKISFqlmoSA6so/kZ+mfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LUTtABhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644NNAS003315;
	Fri, 4 Jul 2025 05:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTWLOLbKSx1OSGDbXz/uuwviBVxE6OYJ5/9D+yBWLl8=; b=LUTtABhVlCadVMHE
	aErEXR+HZ0xzHZA2Ih+F3ChJT50opRHTB01iWlFp+hUu07Q+NJrh6nqesQgotVUw
	lFo81MO924dHB61v2f6ixuXvkbZEcb/l5LeVIQS1IZAOuj3EBINVztfJxiwKolsZ
	uXCLARzYj4YRqtfbHm9WHKbfN5m8YrZJCkn2Z+IqEakETh19I8LLkQ9jmr5HFPsb
	ukG//gQnfJ4jUc6lNZJ6QoBQI1g6GRBDz6lReD0wKC2Nqoag4VDK50gKp+Tjzu18
	7wieauL0rOLCi5/N4oTrXaJmSnp/KZ6Nb2K8am13XyGRura8ISz+q5hk+D6FoCSb
	tmvl6w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut03x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 05:31:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5645VXOl012707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 05:31:33 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 22:31:29 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 4 Jul 2025 13:31:15 +0800
Subject: [PATCH RESEND net 3/3] net: phy: qcom: qca807x: Enable WoL support
 using shared library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751607078; l=1220;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=p57Arrg/ytvCIG/QGXz+S5ndqRcPSjPIJz6EPCT03zg=;
 b=G/sVnR02VL8gVnomoNMuffAptvEycEbPYpuaJvScL1YR7O1LUc/T1VamclvE77Ylo2MQfu9kn
 GrQOxEoogEXBY//Y9nEYvmC0mMGTvtVgcdUlORbKZJQEiF04U/Prk98
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0MCBTYWx0ZWRfXyfP1o1NqzE+t
 LnicO3HtLJOdaESoS80P1LF/sue9f3vMJw+SZRvQYbl1BEihKJi9zPBfzr5ztn37HcRfSG9F617
 EhLtD4jcYWqCrMWExoB8W6e793Lr+GEysHL4RcHCMuzpsCPIirf6dF1/siJs/h6qVsV4xh4AuJv
 tq0vVp6CZPeJb+h3+PR4KG3CHauno6VvBotRqcxg+xqh1BDG1v4Rvr0CyHeaMS67xpPoZHoEiXW
 ajzpm1Ujcubi8Ky83uh0uyTFK5p03j3ReVaNcr+NK296T8mE7ORPuuTpjtJFzUWUOcDrQK3/lNl
 kWDoNEzGdAEBWk36VxJH087t4V7b1SvIF7EKWp+9yeJICKNYkwYq+WVmLJBZr4OniC18fI7lnd0
 3hrI4N6y+FKXmRdQ8YS3whCxbCgr9ylOGvtCN3lejZtHdR1mJNoZjP+6qzrvTYpsm3FbzqfN
X-Proofpoint-GUID: sPyUFoCPlIppj0OluhSOinq6yEJzQkth
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=68676735 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=yGB2eTQ9lww0Q2wdzLUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sPyUFoCPlIppj0OluhSOinq6yEJzQkth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=933 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040040

The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
to that of the AT8031. WoL support for QCA807x is enabled by utilizing
the at8031_set_wol() function provided in the shared library.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/qca807x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 1af6b5ead74b..f946aa8e92ee 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -799,6 +799,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca808x_cable_test_get_status,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -822,6 +824,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_is_supported = qca807x_led_hw_is_supported,
 		.led_hw_control_set = qca807x_led_hw_control_set,
 		.led_hw_control_get = qca807x_led_hw_control_get,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 };
 module_phy_driver(qca807x_drivers);

-- 
2.34.1


