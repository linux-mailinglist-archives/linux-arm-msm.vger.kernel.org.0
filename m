Return-Path: <linux-arm-msm+bounces-24184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955339174FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 01:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7912817A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 23:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAF518132B;
	Tue, 25 Jun 2024 23:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dEBNzrY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534614A60C;
	Tue, 25 Jun 2024 23:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359419; cv=none; b=NL/+7sFtOmYMZMzljCEaIuL1Jo2MH0gB7LySEK8jzGG0wmOU9bKMEf7Y9GDz9eUy+NQOKb7Fr98gaPzWNBuN39dsOTEvh3RWfu2/voMxaNxWSeC05ltwPfUvlg9M80Wjq6WOe9qduhPY3Yd8U31q7ey5LMcJ9LF8ObPIVHcrAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359419; c=relaxed/simple;
	bh=AQM+WPboXO9tamMmTGiuk7iQ5CRM7DKgobj7iFE47gQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fNrLMxbgyc1nB880iHq9FP0xX/uBByKntWs0phGaqBOZHCi/osTXySjN9uLoD2c6iia5THkjdq+cEsQRjbBTaj0mFpHdfT/RFqYfh/GUEWXKmnUmRv5N1rLY9R+IqMegLP1WoRRSIU1HcBp+AeHlR8PeaPPV+SyJnovid08qFeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dEBNzrY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PH4j51018178;
	Tue, 25 Jun 2024 23:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLSbP+R0CEdDhPOE3qNQkMQzAE8hi6whxHCMBFtTT4U=; b=dEBNzrY6uOkJQKkB
	E/V0wM1W3lW66TGqU2obb1VhS6CE9uPFUKhAIn+AEqaBOoV24YxnCUOOxuSMgM9k
	4h8Okhx/r4vw3hAc/OR2N2Wc+l8SVn8ZVlC9/YEUIvxMK1FP2d778+48UfvTltSj
	cEc2iL9JtU9JT7LgS7AO1kLFIQQgHo1FSOzMUoUFCOh6iZ6GV76Hn5n6k35QHKVu
	Rb1dV3Y6vJnkzN+Ta5LAWddLDWfQlg4W+T0X8JOddy9dB1ZJjImu+A3GAHlsgXaI
	iaV57TDKQLc9b4gCQ7dCHdWWXTJRWg/9O7a9Ls6bRpVuiSiAgHtD+x3SSUXIArsM
	g3Ml3g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn82e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PNnh6c004279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 23:49:43 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 16:49:40 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 25 Jun 2024 16:49:29 -0700
Subject: [PATCH v2 2/3] net: stmmac: Add interconnect support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
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
X-Proofpoint-ORIG-GUID: OnJ8A9uhw5moDN0ij_Ka1IdF-RkQ7LyY
X-Proofpoint-GUID: OnJ8A9uhw5moDN0ij_Ka1IdF-RkQ7LyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_18,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250177

Add interconnect support to vote for bus bandwidth based
on the current speed of the driver.This change adds support
for two different paths - one from ethernet to DDR and the
other from Apps to ethernet.
Vote from each interconnect client is aggregated and the on-chip
interconnect hardware is configured to the most appropriate
bandwidth profile.

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
index 54797edc9b38..e46c94b643a3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
 	}
 
+	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
+	if (IS_ERR(plat->axi_icc_path)) {
+		ret = (void *)plat->axi_icc_path;
+		goto error_hw_init;
+	}
+
+	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "ahb");
+	if (IS_ERR(plat->ahb_icc_path)) {
+		ret = (void *)plat->ahb_icc_path;
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


