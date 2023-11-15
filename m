Return-Path: <linux-arm-msm+bounces-658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A87EBBC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 04:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3513DB20BD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 03:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92AF4658;
	Wed, 15 Nov 2023 03:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ye0LBeIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1418928F1;
	Wed, 15 Nov 2023 03:25:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDE1E4;
	Tue, 14 Nov 2023 19:25:52 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AELobgR025640;
	Wed, 15 Nov 2023 03:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=wEIeVH/JUTYsKX98+jAp94M88ARF24QQm86idVJCH0g=;
 b=Ye0LBeIBao8X/Yp01dmbWaNaI1aolrwixiNs61hKToSKviQ6i29tf2Gz7BhRZgOxFE9l
 x7qHvGKBBOracstOgqW2bIHQX3rNIv7EkPSZD0EdwoSasZAziY0Ump/MxgFWLX03IygV
 nvbXpO4hUTF7vshw7sinzmS8Qbz2WEvmP5778NVvlNTIj/MpOxcsvkkdeA3dP5Ijv3bH
 vIBEOM4rU7ROQA80nM0Zno1nCdCE6NlXoU9cosidO2P6EWaScu+e58DPRgiFXLukw71o
 hBuGGZgPZDQzhAR60q/cMOJMF2aHQ0EDo52T1YU45hTst8uByYzwZN1pk0q/aJnrQf67 eg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucfka8u83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:39 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF3PdaH016200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:39 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 14 Nov 2023 19:25:34 -0800
From: Luo Jie <quic_luoj@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH 2/9] net: mdio: ipq4019: Enable the clocks for ipq5332 platform
Date: Wed, 15 Nov 2023 11:25:08 +0800
Message-ID: <20231115032515.4249-3-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115032515.4249-1-quic_luoj@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FOHgjdOsE8aPEiwjEgtTyPlMMSho_lpP
X-Proofpoint-GUID: FOHgjdOsE8aPEiwjEgtTyPlMMSho_lpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_01,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150027

For the platform ipq5332, the related GCC clocks need to be enabled
to make the GPIO reset of the MDIO slave devices taking effect.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/mdio/mdio-ipq4019.c | 67 +++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 7 deletions(-)

diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
index 9d444f5f7efb..a77982a1a1e1 100644
--- a/drivers/net/mdio/mdio-ipq4019.c
+++ b/drivers/net/mdio/mdio-ipq4019.c
@@ -34,16 +34,35 @@
 
 /* MDIO clock source frequency is fixed to 100M */
 #define IPQ_MDIO_CLK_RATE			100000000
+#define IPQ_UNIPHY_AHB_CLK_RATE			100000000
+#define IPQ_UNIPHY_SYS_CLK_RATE			24000000
 
 #define IPQ_PHY_SET_DELAY_US			100000
 
 /* Maximum SOC PCS(uniphy) number on IPQ platform */
 #define ETH_LDO_RDY_CNT				3
 
+enum mdio_clk_id {
+	MDIO_CLK_MDIO_AHB,
+	MDIO_CLK_UNIPHY0_AHB,
+	MDIO_CLK_UNIPHY0_SYS,
+	MDIO_CLK_UNIPHY1_AHB,
+	MDIO_CLK_UNIPHY1_SYS,
+	MDIO_CLK_CNT
+};
+
 struct ipq4019_mdio_data {
 	void __iomem *membase;
 	void __iomem *eth_ldo_rdy[ETH_LDO_RDY_CNT];
-	struct clk *mdio_clk;
+	struct clk *clk[MDIO_CLK_CNT];
+};
+
+const char *const mdio_clk_name[] = {
+	"gcc_mdio_ahb_clk",
+	"gcc_uniphy0_ahb_clk",
+	"gcc_uniphy0_sys_clk",
+	"gcc_uniphy1_ahb_clk",
+	"gcc_uniphy1_sys_clk"
 };
 
 static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
@@ -212,6 +231,38 @@ static int ipq_mdio_reset(struct mii_bus *bus)
 	u32 val;
 	int ret;
 
+	/* For the platform ipq5332, there are two uniphy available to connect the
+	 * ethernet devices, the uniphy gcc clock should be enabled for resetting
+	 * the connected device such as qca8386 switch or qca8081 PHY effectively.
+	 */
+	if (of_device_is_compatible(bus->parent->of_node, "qcom,ipq5332-mdio")) {
+		int i;
+		unsigned long rate = 0;
+
+		for (i = MDIO_CLK_UNIPHY0_AHB; i < MDIO_CLK_CNT; i++) {
+			switch (i) {
+			case MDIO_CLK_UNIPHY0_AHB:
+			case MDIO_CLK_UNIPHY1_AHB:
+				rate = IPQ_UNIPHY_AHB_CLK_RATE;
+				break;
+			case MDIO_CLK_UNIPHY0_SYS:
+			case MDIO_CLK_UNIPHY1_SYS:
+				rate = IPQ_UNIPHY_SYS_CLK_RATE;
+				break;
+			default:
+				break;
+			}
+
+			ret = clk_set_rate(priv->clk[i], rate);
+			if (ret)
+				return ret;
+
+			ret = clk_prepare_enable(priv->clk[i]);
+			if (ret)
+				return ret;
+		}
+	}
+
 	/* To indicate CMN_PLL that ethernet_ldo has been ready if platform resource 1
 	 * or more resource are specified in the device tree.
 	 */
@@ -225,11 +276,11 @@ static int ipq_mdio_reset(struct mii_bus *bus)
 	}
 
 	/* Configure MDIO clock source frequency if clock is specified in the device tree */
-	ret = clk_set_rate(priv->mdio_clk, IPQ_MDIO_CLK_RATE);
+	ret = clk_set_rate(priv->clk[MDIO_CLK_MDIO_AHB], IPQ_MDIO_CLK_RATE);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(priv->mdio_clk);
+	ret = clk_prepare_enable(priv->clk[MDIO_CLK_MDIO_AHB]);
 	if (ret == 0)
 		mdelay(10);
 
@@ -253,10 +304,6 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->membase))
 		return PTR_ERR(priv->membase);
 
-	priv->mdio_clk = devm_clk_get_optional(&pdev->dev, "gcc_mdio_ahb_clk");
-	if (IS_ERR(priv->mdio_clk))
-		return PTR_ERR(priv->mdio_clk);
-
 	/* The platform resource is provided on the chipset IPQ5018/IPQ5332 */
 	/* This resource is optional */
 	for (ret = 0; ret < ETH_LDO_RDY_CNT; ret++) {
@@ -266,6 +313,12 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 							      res->start, resource_size(res));
 	}
 
+	for (ret = 0; ret < MDIO_CLK_CNT; ret++) {
+		priv->clk[ret] = devm_clk_get_optional(&pdev->dev, mdio_clk_name[ret]);
+		if (IS_ERR(priv->clk[ret]))
+			return PTR_ERR(priv->clk[ret]);
+	}
+
 	bus->name = "ipq4019_mdio";
 	bus->read = ipq4019_mdio_read_c22;
 	bus->write = ipq4019_mdio_write_c22;
-- 
2.42.0


