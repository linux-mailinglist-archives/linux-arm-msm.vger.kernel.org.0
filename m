Return-Path: <linux-arm-msm+bounces-3648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF780849B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B164D1F227BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61EF3419C;
	Thu,  7 Dec 2023 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DzD81Jgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D8210F1;
	Thu,  7 Dec 2023 01:27:20 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B78o16n013248;
	Thu, 7 Dec 2023 09:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=5s+XJup/qfsjEaVoEpyuVSOCEB1HvAHAnjOVB/KlAME=;
 b=DzD81Jgm5LZUpjqzNY9O88NHE5mVu4IK9WVP3pKxMKYw3T0dN56Qkn1bDZ+9uqZ2HOoK
 La1hglBI6V3FyRcQhAZVoHQcJy/is12KhlFxVlMl9ZZkQV/YLDlOYTjB5r2LWIwUBoOG
 xS3ximo+Q2Yb6+CynZWxFwcyETP0m0SmTdfuzpB90SZx9YvuVlQ10CY2fOnyOvTa+naG
 cPFhpfuMrXenszi3idfUUOkwJ84JyVcVp5dDuCG79Ti0Svy59hQPBkIXimPwdAWe8sKL
 gnqDMv3wQrNdUpALV3C8fPpvTPzzBeEvhpNingua5c7BT7PdL1q/FESTKCbasSiM2Jj1 3g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu6qr0jxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Dec 2023 09:27:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B79R5Bo030191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Dec 2023 09:27:05 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 01:26:55 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
CC: <kernel@quicinc.com>
Subject: [PATCH net-next v4 3/3] net: stmmac: Add driver support for DWMAC5 safety IRQ Support
Date: Thu, 7 Dec 2023 14:51:27 +0530
Message-ID: <64edc073307ef9cb1bebf2c999cf2b5f56f3d906.1701939695.git.quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1701939695.git.quic_jsuraj@quicinc.com>
References: <cover.1701939695.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rU9UePHy3ejFvtd4S07eZgUR7XuRX_Eb
X-Proofpoint-ORIG-GUID: rU9UePHy3ejFvtd4S07eZgUR7XuRX_Eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_07,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070076

Add IRQ support to listen HW safety IRQ like ECC,DPP,FSM
fault and print the fault information in the kernel
log.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h   |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c  |  9 +++++++++
 4 files changed, 30 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 721c1f8e892f..cb9645fe16d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -347,6 +347,7 @@ enum request_irq_err {
 	REQ_IRQ_ERR_SFTY_UE,
 	REQ_IRQ_ERR_SFTY_CE,
 	REQ_IRQ_ERR_LPI,
+	REQ_IRQ_ERR_SAFETY,
 	REQ_IRQ_ERR_WOL,
 	REQ_IRQ_ERR_MAC,
 	REQ_IRQ_ERR_NO,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 9f89acf31050..aa2eda6fb927 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -33,6 +33,7 @@ struct stmmac_resources {
 	int irq;
 	int sfty_ce_irq;
 	int sfty_ue_irq;
+	int safety_common_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
 };
@@ -299,6 +300,7 @@ struct stmmac_priv {
 	unsigned long active_vlans[BITS_TO_LONGS(VLAN_N_VID)];
 	int sfty_ce_irq;
 	int sfty_ue_irq;
+	int safety_common_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
 	/*irq name */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 47de466e432c..e4a0d9ec8b3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3592,6 +3592,10 @@ static void stmmac_free_irq(struct net_device *dev,
 		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
 			free_irq(priv->wol_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SAFETY:
+		if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq)
+			free_irq(priv->safety_common_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;
@@ -3798,6 +3802,18 @@ static int stmmac_request_irq_single(struct net_device *dev)
 		}
 	}
 
+	if (priv->safety_common_irq > 0 && priv->safety_common_irq != dev->irq) {
+		ret = request_irq(priv->safety_common_irq, stmmac_safety_interrupt,
+				  0, "safety", dev);
+		if (unlikely(ret < 0)) {
+			netdev_err(priv->dev,
+				   "%s: alloc safety failed %d (error: %d)\n",
+				   __func__, priv->safety_common_irq, ret);
+			irq_err = REQ_IRQ_ERR_SAFETY;
+			goto irq_error;
+		}
+	}
+
 	return 0;
 
 irq_error:
@@ -7464,6 +7480,8 @@ int stmmac_dvr_probe(struct device *device,
 	priv->lpi_irq = res->lpi_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
+	priv->safety_common_irq = res->safety_common_irq;
+
 	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
 		priv->rx_irq[i] = res->rx_irq[i];
 	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1ffde555da47..41a4a253d75b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -726,6 +726,15 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
 	}
 
+	stmmac_res->safety_common_irq =
+		platform_get_irq_byname_optional(pdev, "safety");
+
+	if (stmmac_res->safety_common_irq < 0) {
+		if (stmmac_res->safety_common_irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "IRQ safety IRQ not found\n");
+	}
+
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
 	return PTR_ERR_OR_ZERO(stmmac_res->addr);
-- 
2.25.1


