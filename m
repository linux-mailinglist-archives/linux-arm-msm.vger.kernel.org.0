Return-Path: <linux-arm-msm+bounces-57686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724B6AB50DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE97E861EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0120E2512EB;
	Tue, 13 May 2025 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Aux8wGVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF124EF76;
	Tue, 13 May 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130400; cv=none; b=pYqHg5HbR+zgzaqgRZ3M9TjHis55+Gwz3rxw72rdm7HUAzq+SMt8jGydOXVYTWrY0K1i+yY7Zcnj4JBpyQA9QTWvYtI7mPsqRI/qlO/Ns8W5xCtXLVqwxPE3rOdLVKwp2WCMoAVRIE/t+3Gfu1G5Ca8qSXyiLrSoSxP4XPbFCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130400; c=relaxed/simple;
	bh=qgfhS8rcfdp9Qsqi8Pwsh8O8L9JbHSE59yiio9tGP5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Qvl1AjYNV5FF+/yHQyldxzUsBhyKVR93pIyyDwzTlOnWGbwya3Ie+oSu47Nmqfg4+Ah8hPgoebEwz0t8QfqwJGQUQUhYqGgEJS0LpSvaRGKGGJZqB6gxWyqeNhRjLtYIE0B+2bNBnfOoaYegP4WgK/8niS6mqqA+hZTYwZdkNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Aux8wGVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D7QRDn014272;
	Tue, 13 May 2025 09:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVEU4FMB7/KL4huAeWzzozYZI7ATF4mRC5i/rf+NK2U=; b=Aux8wGVt8by824jh
	wQ4jp6Wr8aB1OQrndCY9dHBHt37VdwP7XYCH18XT2qTbykdKqgvVcXMImK/NJak4
	OaG+Wu74DudVRPq+vcP9RV/R/uGK4F/qXJIBvz3fcSv+5+ke03jj5NpL7c5WyZil
	Xe+XLtuw1NGxTCZSz/dRvoCxCXx+5P/ZliKE/rOSHUqGc4AZLyXDxBMijJwMIFO7
	+K7f+0fRfWAEG8mCt+Jj8fV1J7nwUCq/VkGcyI+p+e/pzF5gD9R0IIHiut+PAHyc
	4cwfG5J+AtDngBL8cywzYAGjZhEeqD5+/qw1+my+R3Cu47H6ETagpk8E/ON8m+nR
	OSxDig==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjq7cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9xifg009690
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:44 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:59:38 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:32 +0800
Subject: [PATCH net-next v4 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-12-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
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
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130311; l=7562;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Z/IXsRftK0q9z9DNYCXaFy+7yOzBFNuGdhFxPvnvi/w=;
 b=ncR8/CJXAaC7oP00NS0HnA/bL9gfRJJkeA92/aJgW8VgYjLBd7Qceq8TlZ0UUW85oAVjhAoVE
 32g+KbsEcUgClrWFi32i/V6G9ZQ40t3NEOXycjfAYZq2WFmKijIsLSh
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5MyBTYWx0ZWRfX9BADdP+QD7Kf
 JG8mYnf2fsPSz2C7T8nYo89ElN8nNr24E5QQtu7eK0k41HCAtbLZu2E2TayQqV0XWtMwOBfQiHf
 8aqXqVyHWqYJmaLLlJgvjfW6hvqvP9VwKLLN5F9OKn8edGlYfYHmM90GpE2Sjq6dYXa2xaL3rJC
 GR+heggMGO8XqglLNPZcHkgMxV7ZqHGmx/c3DqA/SI4RkgWuBY5SeqWLy4bQdbxOIcx5Br2NWsF
 kyRahNQ1GvdcCw5VAvaDedtHJ9x0/yw79PiWcaZCDqUMUrNQtNLlSMtZZzTY1SwiwxZw/IvHI8m
 ZuNfy6YnwtP53ApTQJBzrV7JWrzNJe01eYjwHyoTr8TRwhuDN07QSuqD8yJxaoGqhuunJ1eZV1k
 Zlcy5KQmJRwoJZMHka3WLW1Hhn3UKyABVQ2uKfV4upoo2BFCmZRwCDCzHPEzbAGt5INN+lLT
X-Proofpoint-GUID: 0dj56iTnmsbwWZHSEpTzehKM3A3N7jTc
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68231810 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=kjK3jMQdVcNyYKlBoqoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0dj56iTnmsbwWZHSEpTzehKM3A3N7jTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130093

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


