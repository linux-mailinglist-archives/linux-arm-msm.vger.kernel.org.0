Return-Path: <linux-arm-msm+bounces-63601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05FAF8741
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E3C3BBB3A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 05:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F10B20B81B;
	Fri,  4 Jul 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzMgWM2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46011CA9;
	Fri,  4 Jul 2025 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607106; cv=none; b=CcO4+K96yhijSVHm9SQL/gK4x8rkHhkgcQgxI3GBBtGyiB85bhjkzlOvnZSTWj73G0CWRwBjyTiUhQQg0WSWWUuoEu53HbHyoV8QYsexDailkox9DHLuSU12rEEC1pHxqLRF1KCpJMbs8g2H4SjZPZma+rjgWD7I9FYwYQfSPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607106; c=relaxed/simple;
	bh=PuuAbc8gvzLohHlv8nZClwELwGilHUwLqbnwmvoRMq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wwi2586Slnv2Q9fX2XUyfa7r10Q7MN1/Pwjp33C+OMB+IeGpHesylUSZRmkeoEMn2tnacJelNkwKMMfTHuEXMQZtEXRMSqr22gCh7/SxRO75sFs1sX9HC8edmXjrPm0mP9v/q8xSwAJMDB2tk/XCLNi5bLv5fV46MzeGAxcBerI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzMgWM2R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644Pp1m010383;
	Fri, 4 Jul 2025 05:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COu1AYCYj+BPzIVaYF1rOKTqUQEObh2cMgSVeEtLJMY=; b=lzMgWM2RtC4CRKxV
	+L78ReWn5GTfvwJLcQuAcAb1L7h1o9cOWDMphk49cRmK2dZMgIe2rk+kKuOvsH/a
	yPx2VHkIJ8dE9u9XAlFtr2+g70SEI4jUE8CWR20y9vFdF9xeO3VstGFye94c4yt1
	d3QwD9fiEn5IAOYN5p2F5fJIpUf4lGjovPbMD15Ug2UE2FzCTlcZsC5Qj9YWU4Kl
	iwSftAcfMC22kS/xinoyO9yLQv6v3xSsJ/C7xxzsWcfFNAiEt4TGu2BOUHwev4Vz
	0BCF/zJTuDUC+dzNZN5sUGcg0ybjP8VTFlgqJpXGoSnYUfDEq8MwomIxuEakYoFC
	5p+MaA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30fpt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 05:31:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5645VP9B028770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 05:31:25 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 22:31:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 4 Jul 2025 13:31:13 +0800
Subject: [PATCH RESEND net 1/3] net: phy: qcom: move the WoL function to
 shared library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-qcom_phy_wol_support-v1-1-053342b1538d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751607078; l=3830;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=PuuAbc8gvzLohHlv8nZClwELwGilHUwLqbnwmvoRMq0=;
 b=OE0IbzfOlbfARcj68vtl9QPYjXX9WmrPtAKyy4Rk1OL8U4QQjKDA/qwa6ZFiscwpKsxMbIp3J
 TGfcZ08SVOyACHEiZ0EzLl/GWOyU6s4CtqmywJgI9k7AaGso0dNsd6G
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6867672e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8
 a=COk6AnOGAAAA:8 a=_nt0bXS9cE6sRtUw5vwA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UxuBq9P2zGuqWF3cKWYNIk9epnKtzil2
X-Proofpoint-GUID: UxuBq9P2zGuqWF3cKWYNIk9epnKtzil2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0MCBTYWx0ZWRfXy2O0oBdhqk0G
 6AjV+z8yJw6ab24YG6og/JmJr5YQwFVLazPtjcDxfbMAT2N7WexDtXiZyhQtWzLBtlXTU9+/KlB
 9tB3i1totRI58SCFVOED+BO1NtBtd4wk9/7H2xEyRxhFNu83u8dyVPmm0/+5wNbm4UdG4aAY4a6
 cH07IxzznXAPJVWhTZTRh8pntRaVgArjFaenj1Tipj8T3WozczTuDJrt+lRbVQXEalbPqOaM26R
 NqOVifiNw0/r25na8n9VTYufa2zCyLOdvunxlW7ytOmFl03SWEpvwvUB9H9MDu/xjcQrx7pm0QO
 iOtY591DuKZrL7S4cjZLaA6OguRqOCFT235SVt5k6Xkfecmv7zifwWD6iy5SMYiVGf+PouCHnbB
 iivmt4NaepqBok8UtF+g95rRARMSI+cchTyCclgpBTBYH2ziD+FhS7hhLYF9/Eew2McoWith
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040040

Move the WoL (Wake-on-LAN) functionality to a shared library to enable
its reuse by the QCA808X PHY driver, incorporating support for WoL
functionality similar to the implementation in at8031_set_wol().

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/phy/qcom/at803x.c       | 27 ---------------------------
 drivers/net/phy/qcom/qcom-phy-lib.c | 25 +++++++++++++++++++++++++
 drivers/net/phy/qcom/qcom.h         |  5 +++++
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 26350b962890..8f26e395e39f 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -26,9 +26,6 @@
 
 #define AT803X_LED_CONTROL			0x18
 
-#define AT803X_PHY_MMD3_WOL_CTRL		0x8012
-#define AT803X_WOL_EN				BIT(5)
-
 #define AT803X_REG_CHIP_CONFIG			0x1f
 #define AT803X_BT_BX_REG_SEL			0x8000
 
@@ -866,30 +863,6 @@ static int at8031_config_init(struct phy_device *phydev)
 	return at803x_config_init(phydev);
 }
 
-static int at8031_set_wol(struct phy_device *phydev,
-			  struct ethtool_wolinfo *wol)
-{
-	int ret;
-
-	/* First setup MAC address and enable WOL interrupt */
-	ret = at803x_set_wol(phydev, wol);
-	if (ret)
-		return ret;
-
-	if (wol->wolopts & WAKE_MAGIC)
-		/* Enable WOL function for 1588 */
-		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
-				     AT803X_PHY_MMD3_WOL_CTRL,
-				     0, AT803X_WOL_EN);
-	else
-		/* Disable WoL function for 1588 */
-		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
-				     AT803X_PHY_MMD3_WOL_CTRL,
-				     AT803X_WOL_EN, 0);
-
-	return ret;
-}
-
 static int at8031_config_intr(struct phy_device *phydev)
 {
 	struct at803x_priv *priv = phydev->priv;
diff --git a/drivers/net/phy/qcom/qcom-phy-lib.c b/drivers/net/phy/qcom/qcom-phy-lib.c
index d28815ef56bb..af7d0d8e81be 100644
--- a/drivers/net/phy/qcom/qcom-phy-lib.c
+++ b/drivers/net/phy/qcom/qcom-phy-lib.c
@@ -115,6 +115,31 @@ int at803x_set_wol(struct phy_device *phydev,
 }
 EXPORT_SYMBOL_GPL(at803x_set_wol);
 
+int at8031_set_wol(struct phy_device *phydev,
+		   struct ethtool_wolinfo *wol)
+{
+	int ret;
+
+	/* First setup MAC address and enable WOL interrupt */
+	ret = at803x_set_wol(phydev, wol);
+	if (ret)
+		return ret;
+
+	if (wol->wolopts & WAKE_MAGIC)
+		/* Enable WOL function for 1588 */
+		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
+				     AT803X_PHY_MMD3_WOL_CTRL,
+				     0, AT803X_WOL_EN);
+	else
+		/* Disable WoL function for 1588 */
+		ret = phy_modify_mmd(phydev, MDIO_MMD_PCS,
+				     AT803X_PHY_MMD3_WOL_CTRL,
+				     AT803X_WOL_EN, 0);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(at8031_set_wol);
+
 void at803x_get_wol(struct phy_device *phydev,
 		    struct ethtool_wolinfo *wol)
 {
diff --git a/drivers/net/phy/qcom/qcom.h b/drivers/net/phy/qcom/qcom.h
index 4bb541728846..7f7151c8baca 100644
--- a/drivers/net/phy/qcom/qcom.h
+++ b/drivers/net/phy/qcom/qcom.h
@@ -172,6 +172,9 @@
 #define AT803X_LOC_MAC_ADDR_16_31_OFFSET	0x804B
 #define AT803X_LOC_MAC_ADDR_32_47_OFFSET	0x804A
 
+#define AT803X_PHY_MMD3_WOL_CTRL		0x8012
+#define AT803X_WOL_EN				BIT(5)
+
 #define AT803X_DEBUG_ADDR			0x1D
 #define AT803X_DEBUG_DATA			0x1E
 
@@ -215,6 +218,8 @@ int at803x_debug_reg_mask(struct phy_device *phydev, u16 reg,
 int at803x_debug_reg_write(struct phy_device *phydev, u16 reg, u16 data);
 int at803x_set_wol(struct phy_device *phydev,
 		   struct ethtool_wolinfo *wol);
+int at8031_set_wol(struct phy_device *phydev,
+		   struct ethtool_wolinfo *wol);
 void at803x_get_wol(struct phy_device *phydev,
 		    struct ethtool_wolinfo *wol);
 int at803x_ack_interrupt(struct phy_device *phydev);

-- 
2.34.1


