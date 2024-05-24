Return-Path: <linux-arm-msm+bounces-20390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1C8CE5C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA77F2828BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587C126F38;
	Fri, 24 May 2024 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OEeR9oZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E53A27B;
	Fri, 24 May 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556076; cv=none; b=LjxIT6FYjGtvxQPJptvNlyBt26E6N/7hNboK32sMHtkwdeXp03jvWtOPcBka/QvZAeaBf5q6L5ubIvw9Pm3I8lnYlK+U8VT6cN6VdPvNc3kR6A017w1FcAiuBTeukvq/yI0Z5r72tuSfcblhzkZSiKP8KEjlU8yVgXjDnlddLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556076; c=relaxed/simple;
	bh=3TKNiwuYd2GlEXiS2UQd/rgtaSNOcPHex5g4P+GYLuU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iIfpl7+H+n16vf/In2elJ2DiXrM7xlfH6RueVJjFHiLc8wKnjpZcp5qj7TctBgZjYv1AbaUzULC+cQJsX6tK1FmXqxpuSDYPU7zBifyog5fyHvaQKp66JbpQFVQHdri5YPFGL1IzlchN8cGxnXbceQLVrexD98f+MqvYkiWOW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OEeR9oZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9D8Id030711;
	Fri, 24 May 2024 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=W8sNC6W+iwkfiYQwlHEPYl3bQ9BxvSAI9mxtUFUNzOE=; b=OE
	eR9oZ0HKZge1vYjaLn6jtSggYxuJGqzS4oKhN+xT/4bhskzt3oGNjTw/+f0BdFbv
	8sJ/pPpPSuM4FI7jaRipdiHkMiP34BPY6/Irr5+jM5uP5UmNtHOd66L1wstc+L/o
	IBlFQu8vzbxtw4Unixs8Hd7Z+ZchtcX83CYrJHELF9QG2JitSw1ME1L68ZFMlTCK
	xAclqhPlm4hjfNzve26bN3vQEnIBe7S2ExVg4bnmor3hJ6JJLrKQCZV2BDHgiavs
	CmK3DrwBmSV6nemULTsPtOWg9ddBGV5bgua54zP9mZ4yA3weG9C/TrJa3bEA5OMy
	1yeBPuVX/dS+Z1r3S8Pw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j2gu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:07:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44OD7ASM013850;
	Fri, 24 May 2024 13:07:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3y9qgsns5u-1;
	Fri, 24 May 2024 13:07:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44OD7AgD013842;
	Fri, 24 May 2024 13:07:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com [10.147.246.35])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 44OD79hM013841;
	Fri, 24 May 2024 13:07:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
	id 9CF6B5006A4; Fri, 24 May 2024 18:37:08 +0530 (+0530)
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
Subject: [PATCH net-next 1/2] net: stmmac: Add support for multiple phy interface for integrated PCS
Date: Fri, 24 May 2024 18:36:52 +0530
Message-Id: <20240524130653.30666-2-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524130653.30666-1-quic_snehshah@quicinc.com>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LiwpX87s8GKgEgMYZGqNei1eIGMS7Dbw
X-Proofpoint-GUID: LiwpX87s8GKgEgMYZGqNei1eIGMS7Dbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240090
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In case of integrated PCS ethernet does't have external PCS driver.
Currently stmmac supports multiple phy interfaces if there is external PCS.
Add a function to support mupliple phy interfaces when PCS is integrated.

Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 include/linux/stmmac.h                            | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fe3498e86de9..765332627ad0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1231,6 +1231,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	 */
 	__set_bit(mode, priv->phylink_config.supported_interfaces);
 
+	if (priv->plat->get_interfaces)
+		priv->plat->get_interfaces(priv);
+
 	/* If we have an xpcs, it defines which PHY interfaces are supported. */
 	if (priv->hw->xpcs)
 		xpcs_get_interfaces(priv->hw->xpcs,
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dfa1828cd756..66f8205b331e 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -278,6 +278,7 @@ struct plat_stmmacenet_data {
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
 	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
 	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
+	void (*get_interfaces)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
-- 
2.17.1


