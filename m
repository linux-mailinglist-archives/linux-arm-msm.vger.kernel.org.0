Return-Path: <linux-arm-msm+bounces-660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78E7EBBC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 04:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00E3AB20ADF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 03:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB7810F7;
	Wed, 15 Nov 2023 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HvPX18w0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D74404;
	Wed, 15 Nov 2023 03:26:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D7418C;
	Tue, 14 Nov 2023 19:26:04 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF3Ojid020450;
	Wed, 15 Nov 2023 03:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ae2yAtRlK5xXy4WO3WeisxvPENGoh7piidmHeS8xxN0=;
 b=HvPX18w0sBwkJdTZeylV8RCj2eR9/YGM35Gw74Zx/4Q+ncCIurc6u3AkBMOcGQYHioeG
 mkuGnaMGZQEvlGOW6enP9ae1kTuLczL78TGI69sBYtFm4KjmXT4w03tOBH3357IQwnpR
 Ef8cup74aYWaGcltTZCgKyQDA4luV2SP2b3JGfO7IYUPizFL37ojLAExeTAk6ErV8rxs
 wQp/gxVnVIP4ouYdypfZQ6/gpRdNZP0TR7W+PxWA+z9gUGAtS8uPIRck6sFaZFKfbhNl
 Kvszge4VyRIHaAf6FzyN4KyUBIzslgAox0zBL38GloYmzjWHFNa5LiXMwD1LfKLJC/Tc 0w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uc6nujbda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:52 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF3PpDq026882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:25:51 GMT
Received: from akronite-sh-dev02.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 14 Nov 2023 19:25:47 -0800
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
Subject: [PATCH 5/9] net: mdio: ipq4019: support MDIO clock frequency divider
Date: Wed, 15 Nov 2023 11:25:11 +0800
Message-ID: <20231115032515.4249-6-quic_luoj@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Yn8tRo-Bwc-iLrmWU7cRIMRRpz2pQE-h
X-Proofpoint-GUID: Yn8tRo-Bwc-iLrmWU7cRIMRRpz2pQE-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_01,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150027

The MDIO clock frequency can be divided according to the
register value.

The MDIO system clock is fixed to 100MHZ, the working
frequency is 100MHZ/(divider + 1), the divider value
is from the bit[7:0] of control register 0x40.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/mdio/mdio-ipq4019.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
index ca9cda98d1f8..44a8a866f8ee 100644
--- a/drivers/net/mdio/mdio-ipq4019.c
+++ b/drivers/net/mdio/mdio-ipq4019.c
@@ -30,6 +30,9 @@
 /* 0 = Clause 22, 1 = Clause 45 */
 #define MDIO_MODE_C45				BIT(8)
 
+/* MDC frequency is SYS_CLK/(MDIO_CLK_DIV + 1), SYS_CLK is 100MHz */
+#define MDIO_CLK_DIV_MASK			GENMASK(7, 0)
+
 #define IPQ4019_MDIO_TIMEOUT			10000
 #define IPQ4019_MDIO_SLEEP			10
 
@@ -65,6 +68,7 @@ struct ipq4019_mdio_data {
 	void __iomem *eth_ldo_rdy[ETH_LDO_RDY_CNT];
 	struct clk *clk[MDIO_CLK_CNT];
 	struct gpio_descs *reset_gpios;
+	int clk_div;
 };
 
 const char *const mdio_clk_name[] = {
@@ -98,6 +102,7 @@ static int ipq4019_mdio_read_c45(struct mii_bus *bus, int mii_id, int mmd,
 	data = readl(priv->membase + MDIO_MODE_REG);
 
 	data |= MDIO_MODE_C45;
+	data |= FIELD_PREP(MDIO_CLK_DIV_MASK, priv->clk_div);
 
 	writel(data, priv->membase + MDIO_MODE_REG);
 
@@ -139,6 +144,7 @@ static int ipq4019_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
 	data = readl(priv->membase + MDIO_MODE_REG);
 
 	data &= ~MDIO_MODE_C45;
+	data |= FIELD_PREP(MDIO_CLK_DIV_MASK, priv->clk_div);
 
 	writel(data, priv->membase + MDIO_MODE_REG);
 
@@ -171,6 +177,7 @@ static int ipq4019_mdio_write_c45(struct mii_bus *bus, int mii_id, int mmd,
 	data = readl(priv->membase + MDIO_MODE_REG);
 
 	data |= MDIO_MODE_C45;
+	data |= FIELD_PREP(MDIO_CLK_DIV_MASK, priv->clk_div);
 
 	writel(data, priv->membase + MDIO_MODE_REG);
 
@@ -214,6 +221,7 @@ static int ipq4019_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
 	data = readl(priv->membase + MDIO_MODE_REG);
 
 	data &= ~MDIO_MODE_C45;
+	data |= FIELD_PREP(MDIO_CLK_DIV_MASK, priv->clk_div);
 
 	writel(data, priv->membase + MDIO_MODE_REG);
 
@@ -431,6 +439,9 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset_gpios),
 				     "mii_bus %s couldn't get reset GPIO\n", bus->id);
 
+	/* MDIO default frequency is 6.25MHz */
+	priv->clk_div = 0xf;
+
 	bus->name = "ipq4019_mdio";
 	bus->read = ipq4019_mdio_read_c22;
 	bus->write = ipq4019_mdio_write_c22;
-- 
2.42.0


