Return-Path: <linux-arm-msm+bounces-25530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDD92AB42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50FCB282F95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 21:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDF01509B0;
	Mon,  8 Jul 2024 21:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gIRKfcFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F91EB44;
	Mon,  8 Jul 2024 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474246; cv=none; b=pNOEdDGfdj50HIv2sC6P1BJCgb1ATRKb/1KlLOBiVqSOg7P67Pfg7+hx7Me143DHfOeVHGwgM6ZucXdpOkpkcMHmAhOCO/xyHPTQaolHRoYnaz1eGZrUNnDQns2jWS447sRVpZxN4PE+W7DFINqdXmTf5q3hn+N7qgINL+zg4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474246; c=relaxed/simple;
	bh=UQd0EeHvwuiEjQaFcAKp5z898/9I3p67P2UNvkMBYmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KPvY/PaD+PFTBYbpRbX/vLW3sEWzx8k6ShWiCjU1UYFqM/pALyTZQ2HxjPh7ONA42fK/yr0ZuonV9Rz8AdAgeUM27ZgzfzPbfVuis+uVGh5WExxNiYenACjdQH8O1rnBHIMWbX8W68g0oK6uBbL24Zj6oqejV3RHNtuIc7HY0zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gIRKfcFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BVxft006674;
	Mon, 8 Jul 2024 21:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KS606ZWf5wW3Nf/IpnMfTERzoRSsXb3f/8SaJ+eoiwA=; b=gIRKfcFeQdkovkkA
	AazRKLKefZJp8jTu4dV+WWI8n21FEqLuEQwAr06YjhQN320lWN0h/4tMAFX0Ffip
	3GahY04NzhFRzg29Zd1nFTA3tR4qRPbWtmL5NPyU/Fk7sjfSNwtVK07BRTDoU2pk
	ATG1qLfij2pJD7c3JJKVjRMACxnG+svPuw9X9F8lQNK9XxaMiXVq15BvimXt+vg1
	zfkIXtY95GfqXUifdU9bevcEcS3rFfeUytNWRt5xVZcaQ8d565WvQzs1+fm9tPZB
	UkwgdzSfZjoLzZDGz1IXjeHW/BmwvgcEzBLpSc6/Xg5gUkMjqo70YPP3oSj+i9zu
	ZcKbxQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wjn4txx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 21:30:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468LUJg2019360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 21:30:19 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 14:30:15 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Mon, 8 Jul 2024 14:30:01 -0700
Subject: [PATCH v4 2/2] net: stmmac: Add interconnect support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
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
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zfAhGpNLOw1bMQx9XUBga-F_rOwxdG52
X-Proofpoint-GUID: zfAhGpNLOw1bMQx9XUBga-F_rOwxdG52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080159

Add interconnect support to vote for bus bandwidth based
on the current speed of the driver.
Adds support for two different paths - one from ethernet to
DDR and the other from CPU to ethernet, Vote from each
interconnect client is aggregated and the on-chip interconnect
hardware is configured to the most appropriate bandwidth profile.

Suggested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 12 ++++++++++++
 include/linux/stmmac.h                                |  2 ++
 4 files changed, 23 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index b23b920eedb1..56a282d2b8cd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -21,6 +21,7 @@
 #include <linux/ptp_clock_kernel.h>
 #include <linux/net_tstamp.h>
 #include <linux/reset.h>
+#include <linux/interconnect.h>
 #include <net/page_pool/types.h>
 #include <net/xdp.h>
 #include <uapi/linux/bpf.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b3afc7cb7d72..ec7c61ee44d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -985,6 +985,12 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
 	}
 }
 
+static void stmmac_set_icc_bw(struct stmmac_priv *priv, unsigned int speed)
+{
+	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
+	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
+}
+
 static void stmmac_mac_link_down(struct phylink_config *config,
 				 unsigned int mode, phy_interface_t interface)
 {
@@ -1080,6 +1086,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 	if (priv->plat->fix_mac_speed)
 		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
 
+	stmmac_set_icc_bw(priv, speed);
+
 	if (!duplex)
 		ctrl &= ~priv->hw->link.duplex;
 	else
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9b38..201f9dea6da9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
 	}
 
+	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "mac-mem");
+	if (IS_ERR(plat->axi_icc_path)) {
+		ret = ERR_CAST(plat->axi_icc_path);
+		goto error_hw_init;
+	}
+
+	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "cpu-mac");
+	if (IS_ERR(plat->ahb_icc_path)) {
+		ret = ERR_CAST(plat->ahb_icc_path);
+		goto error_hw_init;
+	}
+
 	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
 							   STMMAC_RESOURCE_NAME);
 	if (IS_ERR(plat->stmmac_rst)) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f92c195c76ed..385f352a0c23 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -283,6 +283,8 @@ struct plat_stmmacenet_data {
 	struct reset_control *stmmac_rst;
 	struct reset_control *stmmac_ahb_rst;
 	struct stmmac_axi *axi;
+	struct icc_path *axi_icc_path;
+	struct icc_path *ahb_icc_path;
 	int has_gmac4;
 	int rss_en;
 	int mac_port_sel_speed;

-- 
2.34.1


