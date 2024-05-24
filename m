Return-Path: <linux-arm-msm+bounces-20389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D608CE5C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C8E1F218B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CC086AE7;
	Fri, 24 May 2024 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZR8KkIba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82186146;
	Fri, 24 May 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556076; cv=none; b=HL3wP5bM8pxf1tsr+a8QFHrFZJx2ZqwKxDef1/xd10y4jvXrSFDgMXtX+tUBU4+K9CNnhBgpEnS7IRTDJ3jxbNZRhsVPmo800VPmJEMmiTYf+ioX+xZFTs9o3Ybb68sqg/STz1TS2nPe04EzM2Hf42tSX/r7sFBCn0CZKdKE30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556076; c=relaxed/simple;
	bh=5HrwaYjVKWI31671q2QyY56I5QcUD02r+iKcol55U1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ehrjct3BH7tMK6IUF+4K7owuYSzwq4arlIr6ZxUKS5KLezHzQ/zuKFVchWbEmbaea7RW2oIHhDSLa3ZqoG4SjbAMeDbBm3G5pz/8DE6boMpsqmE+v3WoAiW8ElxRi59zYCrCS42nchKPNxPl4vV6XkQ8ozINmmKIX3VTh6j974M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZR8KkIba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44OA3cTs004407;
	Fri, 24 May 2024 13:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=U6LfJRZ69tJELkQow2T90K4dj8s3g65UkcpWeUxp53w=; b=ZR
	8KkIbaKTshdx/+ci4OHtENEYH7ETIAn2rL6b+4SIvIakVZR4wKXEPpnLwu5cUHTs
	mY36xZ7oAGv7UzQdQWf86fQPxixYIGaPpPxoff6Nta8DaZtwn1EUM1UyveAKJDN/
	pFhCo1lGT7xAzWeCFi6Mnxuo0r0e+BnoFjUfPmxIa7uM9tu6VzNrA5ieccUpoo5K
	DVZxJ7fUkxA7dp1pWEy+KF/JjxmIyIgggWPvc2ScsgMzYuA/8WTxg6n13SpPJz+7
	YjzyESjcTitOduwbi8Qu9vodG1F6ign8ak43JXDxn5CHJjZSvrqabvf1PAlJ4BBU
	uj6Vp8vpQc73jZ8PT8Vw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8kjfbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:07:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44OD7AWE013849;
	Fri, 24 May 2024 13:07:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3y9qgsns62-1;
	Fri, 24 May 2024 13:07:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44OD7Hqi014302;
	Fri, 24 May 2024 13:07:17 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com [10.147.246.35])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 44OD7H3T014301;
	Fri, 24 May 2024 13:07:17 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
	id 0E0EC5006A4; Fri, 24 May 2024 18:37:16 +0530 (+0530)
From: Sneh Shah <quic_snehshah@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Andrew Halaney <ahalaney@redhat.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-qcom-ethqos: Enable support for 2500BASEX
Date: Fri, 24 May 2024 18:36:53 +0530
Message-Id: <20240524130653.30666-3-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524130653.30666-1-quic_snehshah@quicinc.com>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i1FNlcwi3B_zQ9k7EToeSWHmwJDZKw__
X-Proofpoint-GUID: i1FNlcwi3B_zQ9k7EToeSWHmwJDZKw__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240090
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

With integrated PCS qcom mac supports both SGMII and 2500BASEX mode.
Implement get_interfaces to add support for 2500BASEX.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e254b21fdb59..dad6e2448475 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -731,6 +731,13 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_get_interfaces(struct stmmac_priv *priv)
+{
+	if (priv->plat->phy_interface == PHY_INTERFACE_MODE_SGMII)
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  priv->phylink_config.supported_interfaces);
+};
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -786,6 +793,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_2500BASEX:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
 	default:
@@ -851,6 +859,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
+	if (plat_dat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS)
+		plat_dat->get_interfaces = ethqos_get_interfaces;
+
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.17.1


