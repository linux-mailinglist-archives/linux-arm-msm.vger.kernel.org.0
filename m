Return-Path: <linux-arm-msm+bounces-63521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 876DBAF7380
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0E21C472EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1022E7186;
	Thu,  3 Jul 2025 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ihX6FDtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C52E6D0D;
	Thu,  3 Jul 2025 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544903; cv=none; b=GurSPxWpWOjanma0E1MAwjnSBDyNg/DqikA/UTTipH4OuUIzgwyerUFnoeU12GS+LUqClz1fxtRWrPHT/uI8x19wQ9ToAvHqU5mGhV2bQTgc1SL40I1Z2OHJBBdRKZcUR87BGIa2l2OAGHzS0zPt8tN8ifYKGRvxHF3FDvoGp7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544903; c=relaxed/simple;
	bh=uCJ+CKNkcMrdBKA6492L65E5VwkreHxED9nsiuxODzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nMimuo77L2LBvWAPcd2JBrgAIfYMZFMT7QSLbyc+5StggiPyu3fbxlGnsvZimFsiAc6R7RtjI65Ilud2bZLKgG06a6Fm5K5FdFQBY5wdzq0k07rOQ1SrHUXl5h25zA8Z4t6hHES6YjfFMYk/+zDLHJj4onMazJP/2x+P+AqBM/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ihX6FDtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563AsexZ032762;
	Thu, 3 Jul 2025 12:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L6Z8OKqeZuaOwvi35dbacGVDIyKHA6hEBwyM876w3RU=; b=ihX6FDtZQlEW29ti
	KS4tBjaDLn0ai5lbNuAbO5uuyPigodP+wwgEuBY5nlXGImW/Yjqtm4ZxzjEqcFRo
	KObffwls4muJ6VMwSgzlESeWjFgyNn2NCcjW/68Eqh/++g/3hmd5cDcc0vax1y5t
	QKwCDR3L9wHmsa3kGweLfwEO+DGaH7lkClxwDfFWW12Csh2BnkGWa5lbVLLfaNsL
	oBlh5fqnhxaw1Spc+Mht4tST8XPBnyKvh4E8NDfZm8Loy9Xl74uXACsNBjS8hhbo
	mP+QIFU0tBkhiB8p3mg4u2StOwQBk0dUBXwOHtBBznuMByp++Metn013xZn7Huly
	lyiVfQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmg9f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 12:14:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563CEmTq002557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 12:14:48 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 05:14:44 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 3 Jul 2025 20:14:29 +0800
Subject: [PATCH net-next 2/3] net: phy: qcom: qca808x: Fix WoL issue by
 utilizing at8031_set_wol()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-qcom_phy_wol_support-v1-2-83e9f985b30a@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
In-Reply-To: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        Wei Fang <wei.fang@nxp.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <luoj@qti.qualcomm.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751544877; l=1169;
 i=luoj@qti.qualcomm.com; s=20250209; h=from:subject:message-id;
 bh=uCJ+CKNkcMrdBKA6492L65E5VwkreHxED9nsiuxODzU=;
 b=a0WabVbzbP5kK9grTrlkGLzVIJXDyF/KIuszHB1rQ3S0HAhbwrMSUYqToOfoAoVfAvDfy7fId
 WvoEpw5+o6sBAbEOwiKUMCwzj9pcUfsuei++60htjCpapvU4OURIZFe
X-Developer-Key: i=luoj@qti.qualcomm.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68667439 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=ETsMY3Suay4yqmZ1JtkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QEgxGHWFmFDXn3ZNAJmwseB8Av7_ZX56
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX6FbF2tjpT6Lg
 +q6iuCQFGHBl1eODJBX0nfKEioclZVvSEdmnW5+UH2/lhdgn75EfemZUDrJ7+CP0KygMvS1KYXN
 5ouWwf7FHeeqPTQ1o7bxa/hsNbPqqvUDRgASlafipRmB1y4VJYSNc6S68wQZpZMlqYd01EVk599
 60xM3y+4WXGYs7/LXfIE84e1etqR9he2rdlOSlpVhWexGMzg9g5hllk17dBmUXBM4kEYIfPaWNW
 xzL01iHUBSwdEGj7dQ9Lr7l3cckJRASxU15EvwkHUD0Cq1d40BwtdNDAWyz966fFUTKG+JckQdF
 OdycLbCAPabzCPLIsKVbgpV5ts/6kpCd7bI4lJKja48L9nf9t7aZHZVBGCp6jNI5Io1MEjL13BZ
 nr8NLBB1Bh4Gkt3Nu09iY278R3908Y4gl2zjQwyZnDS0aSD3VjgHPe0odKlqeC5+XMhcmS2i
X-Proofpoint-GUID: QEgxGHWFmFDXn3ZNAJmwseB8Av7_ZX56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=843
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101

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


