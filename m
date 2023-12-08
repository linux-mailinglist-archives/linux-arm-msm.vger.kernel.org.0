Return-Path: <linux-arm-msm+bounces-3863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F056809C55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094A91F2117F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B40D79D9;
	Fri,  8 Dec 2023 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XLqX4/W2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C8BC6;
	Thu,  7 Dec 2023 22:25:27 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B85rbG6020850;
	Fri, 8 Dec 2023 06:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=kHS3iDkjfDGySwPowkkkoMU4rcVuWKrEPEnZpFHvaHU=;
 b=XLqX4/W20VM42GYeHY6LoRLFShRcgXKBswjf7CoWd57+2gr+tm7Swruv2BKGnXDgA0E0
 WG8Ygg08wPkbBJL7X/GoQ/I7f9IT1Yn4HqvPUW6KEWvuxa+VZuPAWdBEZ/E7Bk0+1leB
 wIDVrceVi1368gNnZiVAS7bvypT80A1DNEKTZ8e2EcTRj9wagQzaOBFFQy3xzHaZ0yvr
 o8Hwg0nOySE8DKGnjdTKXk79zyBW1U7DaW20ShiyySUtr7h7bsfN/4CNe+5KFMo4CATv
 7pUCRXFOwMY8uBMJqOQIvzlW8i4v+24ZX5qiMU2zYkpqLmRdZSTUC3W/wO5F3Ki8+SgJ dw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu2trkpa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:25:09 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3B86P4BP025384;
	Fri, 8 Dec 2023 06:25:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3uqwnm042e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 08 Dec 2023 06:25:04 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B86P4ca025377;
	Fri, 8 Dec 2023 06:25:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-snehshah-hyd.qualcomm.com [10.147.246.35])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3B86P4ZX025376;
	Fri, 08 Dec 2023 06:25:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2319345)
	id 9E89F5001C6; Fri,  8 Dec 2023 11:55:03 +0530 (+0530)
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
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH net v3] net: stmmac: update Rx clk divider for 10M SGMII
Date: Fri,  8 Dec 2023 11:55:02 +0530
Message-Id: <20231208062502.13124-1-quic_snehshah@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7SyVwrW3062--thdidHXDeUqdsxn5TST
X-Proofpoint-ORIG-GUID: 7SyVwrW3062--thdidHXDeUqdsxn5TST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=844
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080049
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
Update configure SGMII function with rx clk divider programming.

Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
---
v3 changelog:
- Added comment to explain why MAC needs to be reconfigured for SGMII
v2 changelog:
- Use FIELD_PREP to prepare bifield values in place of GENMASK
- Add fixes tag
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d3bf42d0fceb..ab2245995bc6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -34,6 +34,7 @@
 #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
 #define RGMII_CONFIG_PROG_SWAP			BIT(1)
 #define RGMII_CONFIG_DDR_MODE			BIT(0)
+#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
 
 /* SDCC_HC_REG_DLL_CONFIG fields */
 #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
@@ -598,6 +599,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+/* On interface toggle MAC registetrs gets reset.
+ * Configure MAC block for SGMII on ethernet phy link up
+ */
 static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 {
 	int val;
@@ -617,6 +621,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 	case SPEED_10:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL;
 		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
+		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
+			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
+			      RGMII_IO_MACRO_CONFIG);
 		break;
 	}
 
-- 
2.17.1


