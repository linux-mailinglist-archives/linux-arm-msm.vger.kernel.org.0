Return-Path: <linux-arm-msm+bounces-23311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99B90F93F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 00:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632221F213C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA7E15CD7B;
	Wed, 19 Jun 2024 22:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DSMn3vrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D415B128;
	Wed, 19 Jun 2024 22:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718836930; cv=none; b=QaK43oROnjb1gqI5Ix010+4Ld2RENwlt/OJg7p7vbkzh/fLB1aSX5vQytsQ4kyiqo+cjWeSUwpa1IMQHoOolRP70tlvqa+u44oiQmOs4eSix3Halh1OE7/lPZsvs3PW04rl5kkeNTEIpIqjtOtX0TGpsG+Ya5X6YKnmuCqYXdRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718836930; c=relaxed/simple;
	bh=NbLmnPZolDV6xbJIsOgsyWa+Gr4eZ+QNM+e8FgQ/PXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DaGoOzjn0LAnI3MOuuKXlfJTf/XPXTxYOtkupnoY8vIRphF7Ppi63nvDHrVakiHzTyhn3oQLMyeGZ6IAW/FbdkJ7ejsfLRMdRuHCFTwQRKtZmdcU6n+zExQzuHMJuPtBRJ8uPM8yHMEhG9rBda5688K2cdVYlHCdwGmYNLeJT4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DSMn3vrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JEwP8w025323;
	Wed, 19 Jun 2024 22:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVBosD0cckDDDukS9FRgBe5KOHuw90QrGmNULCbI7Ig=; b=DSMn3vrBPlN8x8dG
	kzv4PInqwET2pJsy7mkHqw33wJaxFeU4RWjvqMqiinYcSF5Zvr6fAt0oyGsXOdOg
	/FirBeuUHJGeQIbnK5i0OSlFDX4Bd+NkgoCKbT6GBkL3ORBwEQlEIXm5heBcbLDW
	cDEErZYXb+dqp/6ji8eHkktvj8q4EOKHE4xwqTdY6IQFC5ckdnHdy3LF9mhNYe/7
	qrXaqkB46ZywKXLHma9Y78hYEozyGuHzspg3sVM1nNN6ElG0ub4AC+6WtZv0zIDC
	yFpqBS3lWt8v2PjZTEQKt5vQZLumkKNabuyur7VNAP3av3cBb+vj4LgQDSkhiaQ6
	Mblhaw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv1j90ugq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:41:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JMfePc014344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 22:41:40 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 15:41:37 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Wed, 19 Jun 2024 15:41:29 -0700
Subject: [PATCH 1/3] net: stmmac: Add interconnect support in qcom-ethqos
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
In-Reply-To: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
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
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Sagar Cheluvegowda <quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: duFoa2E8woNImEbeTdxGkeC2A237LtLj
X-Proofpoint-GUID: duFoa2E8woNImEbeTdxGkeC2A237LtLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190170

Add interconnect support in qcom-ethqos driver to vote for bus
bandwidth based on the current speed of the driver.
This change adds support for two different paths - one from ethernet
to DDR and the other from Apps to ethernet.
Vote from each interconnect client is aggregated and the on-chip
interconnect hardware is configured to the most appropriate
bandwidth profile.

Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e254b21fdb59..682e68f37dbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/interconnect.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -113,6 +114,9 @@ struct qcom_ethqos {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+
+	struct icc_path *axi_icc_path;
+	struct icc_path *ahb_icc_path;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -668,12 +672,19 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	return ethqos->configure_func(ethqos);
 }
 
+static void ethqos_set_icc_bw(struct qcom_ethqos *ethqos, unsigned int speed)
+{
+	icc_set_bw(ethqos->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
+	icc_set_bw(ethqos->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
+}
+
 static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
 	ethqos->speed = speed;
 	ethqos_update_link_clk(ethqos, speed);
+	ethqos_set_icc_bw(ethqos, speed);
 	ethqos_configure(ethqos);
 }
 
@@ -813,6 +824,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
 
+	ethqos->axi_icc_path = devm_of_icc_get(dev, "axi_icc_path");
+	if (IS_ERR(ethqos->axi_icc_path))
+		return PTR_ERR(ethqos->axi_icc_path);
+
+	ethqos->ahb_icc_path = devm_of_icc_get(dev, "ahb_icc_path");
+	if (IS_ERR(ethqos->axi_icc_path))
+		return PTR_ERR(ethqos->axi_icc_path);
+
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
 		return ret;

-- 
2.34.1


