Return-Path: <linux-arm-msm+bounces-24181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C479174EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 01:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D766B1F22013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AB117994D;
	Tue, 25 Jun 2024 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ftvZU6DL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE991DA58;
	Tue, 25 Jun 2024 23:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359418; cv=none; b=oloOJcMcv6RzpehPm0iQQK4s9666g5OYo3bv3t61Cmgb5gjDs4mXRFGwPu76boGcWtn+WdKrYIy2YGQ5ASxPfcqRqb5BeGd+P0S83fLxFbBrU2AowXUs01hWtRjEn1KtZvJKUvye7fAHUzCSIDtEa36rOVJW1FGk35lvaNIfQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359418; c=relaxed/simple;
	bh=2W2fU2amyD3NeRWHSIp47FPr2bw+8QoaWEiHbokTMjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nuOOpLck+0RdPnZy/AMKpsX1B6pCisSGzBouWaURMOY8pMpTcaABFUg4Mk8XyH/lMSLlVrqBSkD4XRcVA2TVQQIXyE8PR/pBCnLflRKbxAoy07S9izQNC/rLxJD/i236CuCBhMkQQZOreIR0AsqHmZgPT1GgESYVWp7msborMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ftvZU6DL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PG0cu3001505;
	Tue, 25 Jun 2024 23:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O43sibDg+dMXQKePxUuuoJG91U2ze1ldrF9Fvd3uN5g=; b=ftvZU6DLvDRBPN7t
	N10UNHO8sZ3Bm+uJwPnTFu8jX9N4yJ5XB7hIgEWYDcfAcBgK8UM5xN5Mppvzroh2
	eO8u5mpsi/QFujSUbRbEHmc2OsjhcROSHBGPpinscOGdsWU2dMou6OTVXW5hRjaA
	6A3bXlcYbR352BQlrmV1DFLLzCxTjTcU56Bj3n7vnzvdGCWDxqJlIQnsE1fCTDfx
	qSGWL+mVAuhqPzSBgzWvUBlYOEndfhts6wYWqCXSyzyeWdpgI8RsoFFyzh7aTn91
	hrlvfEXK16Z3793LzQcCsrGVOGNnIZ/3OWMYH6ReSFYGSZPXwirle0eaJtqxR2ZV
	3pdhnw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaf0anf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PNniiG019459
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:44 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 16:49:41 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 25 Jun 2024 16:49:30 -0700
Subject: [PATCH v2 3/3] net: stmmac: Bring down the clocks to lower
 frequencies when mac link goes down
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Russell King <linux@armlinux.org.uk>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
        Andrew Lunn
	<andrew@lunn.ch>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fm7vUTx5GK8DQoBwG72MZPU5HNOJh1mn
X-Proofpoint-GUID: fm7vUTx5GK8DQoBwG72MZPU5HNOJh1mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_18,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250176

When mac link goes down we don't need to mainitain the clocks to operate
at higher frequencies, as an optimized solution to save power when
the link goes down we are trying to bring down the clocks to the
frequencies corresponding to the lowest speed possible.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ec7c61ee44d4..f0166f0bc25f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 {
 	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
 
+	if (priv->plat->fix_mac_speed)
+		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
+
 	stmmac_mac_set(priv, priv->ioaddr, false);
 	priv->eee_active = false;
 	priv->tx_lpi_enabled = false;
@@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
 
 	if (priv->dma_cap.fpesel)
 		stmmac_fpe_link_state_handle(priv, false);
+
+	stmmac_set_icc_bw(priv, SPEED_10);
+
+	if (priv->plat->fix_mac_speed)
+		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
 }
 
 static void stmmac_mac_link_up(struct phylink_config *config,

-- 
2.34.1


