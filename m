Return-Path: <linux-arm-msm+bounces-62671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3863FAEA0E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E889E4E5242
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420AE2EBDEA;
	Thu, 26 Jun 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bNVbcLqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A72F0C73;
	Thu, 26 Jun 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948358; cv=none; b=A1ADWPrbebCuBOh8cNGIGWLmO1BakX6XbeasFGGwH2B4W4cfv1AKCLkFaSZ3/NACHYvo9G042cSOdMRPV0x4Bbzbx0AINIszS+6kopKCFu1LbDY/diACxB/kZzW94zQya8VpCAV+cCfEiO8iJIEIohSP6BQogORK02lUcMO/Fb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948358; c=relaxed/simple;
	bh=qgfhS8rcfdp9Qsqi8Pwsh8O8L9JbHSE59yiio9tGP5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=a9/cqzsToFuLGZJjpxkXyElVpfDDEOn9D1mZ3noF4FhZpQWLiHitUmJ9U6Ou26RKRER9M+iViAeKV3nvjq6PmkAC69o2gS2xBujpGmUpqSmA+yvctwCBN+DOGKe8pjt9AKYjn8M+V0SPU9qJjcsvzgjmXzbT4/dyGtuR+Xf1KL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bNVbcLqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9YFCg021523;
	Thu, 26 Jun 2025 14:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVEU4FMB7/KL4huAeWzzozYZI7ATF4mRC5i/rf+NK2U=; b=bNVbcLqOoM9/Kq6n
	6e0sU6LLqq1b/Cc520IwxIsrSHOV4ZiEnTE/HTVm3U/iHnchFGUXddiOI3WTRYHR
	DqjkwKRtAbEOp00kLjBvk2L9ShhiARLzXc07gSN9kEysOULHTbGD8VgCU7aTIBQy
	C+Rxzu6vMtBIvSsagBwGIgWgrzm0hjl3uhd7FUaMV9aELQUYRGOnvD8XXjqpMa+R
	OKVSE0DO/JN2lRr3fGeTeWUBDVjYA2ujziMSy5IIRdcXU2hK0GkUEshN74eSPbGw
	5+f0mZrEsfIGLqAZPpLjTe2S5ElorQr3YShT7cHJaFe0SZFuS8rbpFYcQqyp5pjS
	az0Qdw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1x2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEWOlk028086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:32:24 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 07:32:19 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 26 Jun 2025 22:31:11 +0800
Subject: [PATCH net-next v5 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250626-qcom_ipq_ppe-v5-12-95bdc6b8f6ff@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750948277; l=7562;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Z/IXsRftK0q9z9DNYCXaFy+7yOzBFNuGdhFxPvnvi/w=;
 b=Y6jB91d7bzmbTCxrA0UngfDgl6z1YKdwagjjRspj275JBUet9n1F2OcZ3bt7cjlC1C21plGUP
 xUee6dg4C09ArAp+huagWraawNYa5Tou5pGBRS1psanHSuyul6Vpb4H
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ozCMdiUcpOzxUZiU5IMVMDLKmKDPUwuA
X-Proofpoint-ORIG-GUID: ozCMdiUcpOzxUZiU5IMVMDLKmKDPUwuA
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d59f9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=kjK3jMQdVcNyYKlBoqoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMyBTYWx0ZWRfX103GYztvl3U3
 XKY/qpv6GmivN0R1CSaeQcIb3hE6nl6HM/KhGfx5piMP8gguIP3VSlMgJFSbufuTgbs29NzSIWP
 hrbnYPlxrr7BIHmdvgD/VWPJ9eBQ24Wl0oFmLbcv3bqGf2oDmFYXFkoLWFneg9boPwvYze2e9Gw
 L5ZoAFJjhEcM/QU8P3p6CdKF5beCWZF7muB1+AeKKKHdqyHZP8TyDa1vqnNGHa1sSLnJ/xGELQy
 DKza+dupn8viJ01IEw8j9RYNmJMhiVPRP25aZOiMIOg1MND1JCPL45JbEpJYujoTrvMtxARhvvK
 AzWCv0X8qybVn4zcMmt2LeI/qRsjzJ/jPkcJNB+7Av58FhECI78L2o75BJ/EI4lIEOP4ymYw51l
 sn/NiP+6YjNWQPLkR7J5ElvROLHVcbqg9oL8nW6Or4HesOBUcKrvXQPGHhXzj8UdcVTagoVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260123

From: Lei Wei <quic_leiwei@quicinc.com>

Initialize the L2 bridge settings for the PPE ports to only enable
L2 frame forwarding between CPU port and PPE Ethernet ports.

The per-port L2 bridge settings are initialized as follows:
For PPE CPU port, the PPE bridge TX is enabled and FDB learning is
disabled. For PPE physical ports, the default L2 forwarding action
is initialized to forward to CPU port only.

L2/FDB learning and forwarding will not be enabled for PPE physical
ports yet, since the port's VSI (Virtual Switch Instance) and VSI
membership are not yet configured, which are required for FDB
forwarding. The VSI and FDB forwarding will later be enabled when
switchdev is enabled.

Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 80 +++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 50 ++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 29d0af091854..6a32f09c02ef 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1915,6 +1915,80 @@ static int ppe_queues_to_ring_init(struct ppe_device *ppe_dev)
 	return ppe_ring_queue_map_set(ppe_dev, 0, queue_bmap);
 }
 
+/* Initialize PPE bridge settings to only enable L2 frame receive and
+ * transmit between CPU port and PPE Ethernet ports.
+ */
+static int ppe_bridge_init(struct ppe_device *ppe_dev)
+{
+	u32 reg, mask, port_cfg[4], vsi_cfg[2];
+	int ret, i;
+
+	/* Configure the following settings for CPU port0:
+	 * a.) Enable Bridge TX
+	 * b.) Disable FDB new address learning
+	 * c.) Disable station move address learning
+	 */
+	mask = PPE_PORT_BRIDGE_TXMAC_EN;
+	mask |= PPE_PORT_BRIDGE_NEW_LRN_EN;
+	mask |= PPE_PORT_BRIDGE_STA_MOVE_LRN_EN;
+	ret = regmap_update_bits(ppe_dev->regmap,
+				 PPE_PORT_BRIDGE_CTRL_ADDR,
+				 mask,
+				 PPE_PORT_BRIDGE_TXMAC_EN);
+	if (ret)
+		return ret;
+
+	for (i = 1; i < ppe_dev->num_ports; i++) {
+		/* Enable invalid VSI forwarding for all the physical ports
+		 * to CPU port0, in case no VSI is assigned to the physical
+		 * port.
+		 */
+		reg = PPE_L2_VP_PORT_TBL_ADDR + PPE_L2_VP_PORT_TBL_INC * i;
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       port_cfg, ARRAY_SIZE(port_cfg));
+
+		if (ret)
+			return ret;
+
+		PPE_L2_PORT_SET_INVALID_VSI_FWD_EN(port_cfg, true);
+		PPE_L2_PORT_SET_DST_INFO(port_cfg, 0);
+
+		ret = regmap_bulk_write(ppe_dev->regmap, reg,
+					port_cfg, ARRAY_SIZE(port_cfg));
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < PPE_VSI_TBL_ENTRIES; i++) {
+		/* Set the VSI forward membership to include only CPU port0.
+		 * FDB learning and forwarding take place only after switchdev
+		 * is supported later to create the VSI and join the physical
+		 * ports to the VSI port member.
+		 */
+		reg = PPE_VSI_TBL_ADDR + PPE_VSI_TBL_INC * i;
+		ret = regmap_bulk_read(ppe_dev->regmap, reg,
+				       vsi_cfg, ARRAY_SIZE(vsi_cfg));
+		if (ret)
+			return ret;
+
+		PPE_VSI_SET_MEMBER_PORT_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_UUC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_UMC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_BC_BITMAP(vsi_cfg, BIT(0));
+		PPE_VSI_SET_NEW_ADDR_LRN_EN(vsi_cfg, true);
+		PPE_VSI_SET_NEW_ADDR_FWD_CMD(vsi_cfg, PPE_ACTION_FORWARD);
+		PPE_VSI_SET_STATION_MOVE_LRN_EN(vsi_cfg, true);
+		PPE_VSI_SET_STATION_MOVE_FWD_CMD(vsi_cfg, PPE_ACTION_FORWARD);
+
+		ret = regmap_bulk_write(ppe_dev->regmap, reg,
+					vsi_cfg, ARRAY_SIZE(vsi_cfg));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1947,5 +2021,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_queues_to_ring_init(ppe_dev);
+	ret = ppe_queues_to_ring_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_bridge_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 8a89d9aa82ae..e990a9409598 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -117,6 +117,14 @@
 #define PPE_EG_SERVICE_SET_TX_CNT_EN(tbl_cfg, value)	\
 	FIELD_MODIFY(PPE_EG_SERVICE_W1_TX_CNT_EN, (tbl_cfg) + 0x1, value)
 
+/* PPE port bridge configuration */
+#define PPE_PORT_BRIDGE_CTRL_ADDR		0x60300
+#define PPE_PORT_BRIDGE_CTRL_ENTRIES		8
+#define PPE_PORT_BRIDGE_CTRL_INC		4
+#define PPE_PORT_BRIDGE_NEW_LRN_EN		BIT(0)
+#define PPE_PORT_BRIDGE_STA_MOVE_LRN_EN		BIT(3)
+#define PPE_PORT_BRIDGE_TXMAC_EN		BIT(16)
+
 /* PPE port control configurations for the traffic to the multicast queues. */
 #define PPE_MC_MTU_CTRL_TBL_ADDR		0x60a00
 #define PPE_MC_MTU_CTRL_TBL_ENTRIES		8
@@ -125,6 +133,36 @@
 #define PPE_MC_MTU_CTRL_TBL_MTU_CMD		GENMASK(15, 14)
 #define PPE_MC_MTU_CTRL_TBL_TX_CNT_EN		BIT(16)
 
+/* PPE VSI configurations */
+#define PPE_VSI_TBL_ADDR			0x63800
+#define PPE_VSI_TBL_ENTRIES			64
+#define PPE_VSI_TBL_INC				0x10
+#define PPE_VSI_W0_MEMBER_PORT_BITMAP		GENMASK(7, 0)
+#define PPE_VSI_W0_UUC_BITMAP			GENMASK(15, 8)
+#define PPE_VSI_W0_UMC_BITMAP			GENMASK(23, 16)
+#define PPE_VSI_W0_BC_BITMAP			GENMASK(31, 24)
+#define PPE_VSI_W1_NEW_ADDR_LRN_EN		BIT(0)
+#define PPE_VSI_W1_NEW_ADDR_FWD_CMD		GENMASK(2, 1)
+#define PPE_VSI_W1_STATION_MOVE_LRN_EN		BIT(3)
+#define PPE_VSI_W1_STATION_MOVE_FWD_CMD		GENMASK(5, 4)
+
+#define PPE_VSI_SET_MEMBER_PORT_BITMAP(tbl_cfg, value)		\
+	FIELD_MODIFY(PPE_VSI_W0_MEMBER_PORT_BITMAP, tbl_cfg, value)
+#define PPE_VSI_SET_UUC_BITMAP(tbl_cfg, value)			\
+	FIELD_MODIFY(PPE_VSI_W0_UUC_BITMAP, tbl_cfg, value)
+#define PPE_VSI_SET_UMC_BITMAP(tbl_cfg, value)			\
+	FIELD_MODIFY(PPE_VSI_W0_UMC_BITMAP, tbl_cfg, value)
+#define PPE_VSI_SET_BC_BITMAP(tbl_cfg, value)			\
+	FIELD_MODIFY(PPE_VSI_W0_BC_BITMAP, tbl_cfg, value)
+#define PPE_VSI_SET_NEW_ADDR_LRN_EN(tbl_cfg, value)		\
+	FIELD_MODIFY(PPE_VSI_W1_NEW_ADDR_LRN_EN, (tbl_cfg) + 0x1, value)
+#define PPE_VSI_SET_NEW_ADDR_FWD_CMD(tbl_cfg, value)		\
+	FIELD_MODIFY(PPE_VSI_W1_NEW_ADDR_FWD_CMD, (tbl_cfg) + 0x1, value)
+#define PPE_VSI_SET_STATION_MOVE_LRN_EN(tbl_cfg, value)		\
+	FIELD_MODIFY(PPE_VSI_W1_STATION_MOVE_LRN_EN, (tbl_cfg) + 0x1, value)
+#define PPE_VSI_SET_STATION_MOVE_FWD_CMD(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_VSI_W1_STATION_MOVE_FWD_CMD, (tbl_cfg) + 0x1, value)
+
 /* PPE port control configurations for the traffic to the unicast queues. */
 #define PPE_MRU_MTU_CTRL_TBL_ADDR		0x65000
 #define PPE_MRU_MTU_CTRL_TBL_ENTRIES		256
@@ -163,6 +201,18 @@
 #define PPE_IN_L2_SERVICE_TBL_RX_CNT_EN		BIT(30)
 #define PPE_IN_L2_SERVICE_TBL_TX_CNT_EN		BIT(31)
 
+/* L2 Port configurations */
+#define PPE_L2_VP_PORT_TBL_ADDR			0x98000
+#define PPE_L2_VP_PORT_TBL_ENTRIES		256
+#define PPE_L2_VP_PORT_TBL_INC			0x10
+#define PPE_L2_VP_PORT_W0_INVALID_VSI_FWD_EN	BIT(0)
+#define PPE_L2_VP_PORT_W0_DST_INFO		GENMASK(9, 2)
+
+#define PPE_L2_PORT_SET_INVALID_VSI_FWD_EN(tbl_cfg, value)	\
+	FIELD_MODIFY(PPE_L2_VP_PORT_W0_INVALID_VSI_FWD_EN, tbl_cfg, value)
+#define PPE_L2_PORT_SET_DST_INFO(tbl_cfg, value)		\
+	FIELD_MODIFY(PPE_L2_VP_PORT_W0_DST_INFO, tbl_cfg, value)
+
 /* PPE service code configuration for the tunnel packet. */
 #define PPE_TL_SERVICE_TBL_ADDR			0x306000
 #define PPE_TL_SERVICE_TBL_ENTRIES		256

-- 
2.34.1


