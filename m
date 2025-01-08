Return-Path: <linux-arm-msm+bounces-44393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF735A05D91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E12D3A8459
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633DF1FFC65;
	Wed,  8 Jan 2025 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EGjIPz8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333321FE443;
	Wed,  8 Jan 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344143; cv=none; b=uE6sLBjAV8HyBMr0cJh7q/BMqg5uUgPahK9T6scYCux5V1D6Qt4RvMaxnzJfanDvVVMyZ6c8ZtojnXH8NTLLPWPK2qh6aRUmL6s/uwb04m0GYOnHXiUczPDfEeedis2cwd4jn1iZHGozNgFBIIx1pJPPX/oaXVDF4PP/sapurQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344143; c=relaxed/simple;
	bh=vbspJJJnA8gEHhvz1yP/hiYVAM/XAh4addcphIs4XNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iyjZOjDBT15zNCVioR5AUiklsxUnfNZiMjnqQwQLoy20cjgEdhva3OBFMLRjK3YbJoiUJxXVYf0J+CXKB2Um8prmE6lJvurWaBkNjH4rWmOf+hyxf8jOHM0j9oF7kSi3P9WCB5ahbaYZgNg4Upgar3u0yT8vnizYOLXKQcSHz88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EGjIPz8P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Bklug003049;
	Wed, 8 Jan 2025 13:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3C8g3Jg7aHGL7o0vvHluxjUlCW/txUfZeETKya4sPlA=; b=EGjIPz8PnBcN9Z6/
	BLJ/4rCt9PFKNdUMCbaHbPHr207/Khii9xvkvAx3fRu8lO87kiiyLMKnC0vakCVa
	cU1/e6jXWlqYGickATZY/x5xbed3zgsPXO6+DIR4jpLBa+F+3FuU31QRRdCUZ6ma
	TdsprCTUUGsfsJWldnm5QrFsK2d5NsNeJLATVWYtDQCoBHxOVg1LPdU+W7YEk+2s
	4ml/jfmBwTh5oZr7tb64to1dWhYboicCxZyI+2c/WIMujFoSkgvoBe2gOO2+0C5S
	Gf1oiJBms/EQtzuBH/D0hPDcf/aj2T3uaEciMI6BnfgMqvJjFyPEdz7dZB68iNSX
	2PL3YA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441md310ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:48:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Dml1R027502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:48:47 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:48:40 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:17 +0800
Subject: [PATCH net-next v2 10/14] net: ethernet: qualcomm: Initialize PPE
 RSS hash settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-10-7394dbda7199@quicinc.com>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=12088;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=vbspJJJnA8gEHhvz1yP/hiYVAM/XAh4addcphIs4XNo=;
 b=Jq9SckN2o86POb0QI9vAprJ4eL+tXjkBe34io+ZbJhdvwjMk+YX+aFej/UiyWJXCvrXpmowwV
 7sGE5AI87cRA3t+KaXnmlnVdaRz3JSojNPvm4QzSB6a4xHgT6AONEjr
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O_FLHOJRKSqwCEsLwEm47n4X4Ral861V
X-Proofpoint-ORIG-GUID: O_FLHOJRKSqwCEsLwEm47n4X4Ral861V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080114

PPE RSS hash is generated during PPE receive, based on the packet
content (3 tuples or 5 tuples) and as per the configured RSS seed.
The hash is then used to select the queue to transmit the packet
to the ARM CPU.

This patch initializes the RSS hash settings that are used to
generate the hash for the packet during PPE packet receive.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 194 ++++++++++++++++++++++++-
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  39 +++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  40 +++++
 3 files changed, 272 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index d3633cf12f81..1f180784a330 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1195,6 +1195,143 @@ int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port, bool enable)
 				  val);
 }
 
+static int ppe_rss_hash_ipv4_config(struct ppe_device *ppe_dev, int index,
+				    struct ppe_rss_hash_cfg cfg)
+{
+	u32 reg, val;
+
+	switch (index) {
+	case 0:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sip_mix[0]);
+		break;
+	case 1:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dip_mix[0]);
+		break;
+	case 2:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_protocol_mix);
+		break;
+	case 3:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_dport_mix);
+		break;
+	case 4:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_IPV4_VAL, cfg.hash_sport_mix);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	reg = PPE_RSS_HASH_MIX_IPV4_ADDR + index * PPE_RSS_HASH_MIX_IPV4_INC;
+
+	return regmap_write(ppe_dev->regmap, reg, val);
+}
+
+static int ppe_rss_hash_ipv6_config(struct ppe_device *ppe_dev, int index,
+				    struct ppe_rss_hash_cfg cfg)
+{
+	u32 reg, val;
+
+	switch (index) {
+	case 0 ... 3:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_VAL, cfg.hash_sip_mix[index]);
+		break;
+	case 4 ... 7:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_VAL, cfg.hash_dip_mix[index - 4]);
+		break;
+	case 8:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_VAL, cfg.hash_protocol_mix);
+		break;
+	case 9:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_VAL, cfg.hash_dport_mix);
+		break;
+	case 10:
+		val = FIELD_PREP(PPE_RSS_HASH_MIX_VAL, cfg.hash_sport_mix);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	reg = PPE_RSS_HASH_MIX_ADDR + index * PPE_RSS_HASH_MIX_INC;
+
+	return regmap_write(ppe_dev->regmap, reg, val);
+}
+
+/**
+ * ppe_rss_hash_config_set - Configure the PPE hash settings for the packet received.
+ * @ppe_dev: PPE device
+ * @mode: Configure RSS hash for the packet type IPv4 and IPv6.
+ * @hash_cfg: RSS hash configuration
+ *
+ * PPE RSS hash settings are configured for the packet type IPv4 and IPv6.
+ *
+ * Return 0 on success, negative error code on failure.
+ */
+int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
+			    struct ppe_rss_hash_cfg cfg)
+{
+	u32 val, reg;
+	int i, ret;
+
+	if (mode & PPE_RSS_HASH_MODE_IPV4) {
+		val = FIELD_PREP(PPE_RSS_HASH_MASK_IPV4_HASH_MASK, cfg.hash_mask);
+		val |= FIELD_PREP(PPE_RSS_HASH_MASK_IPV4_FRAGMENT, cfg.hash_fragment_mode);
+		ret = regmap_write(ppe_dev->regmap, PPE_RSS_HASH_MASK_IPV4_ADDR, val);
+		if (ret)
+			return ret;
+
+		val = FIELD_PREP(PPE_RSS_HASH_SEED_IPV4_VAL, cfg.hash_seed);
+		ret = regmap_write(ppe_dev->regmap, PPE_RSS_HASH_SEED_IPV4_ADDR, val);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < PPE_RSS_HASH_MIX_IPV4_ENTRIES; i++) {
+			ret = ppe_rss_hash_ipv4_config(ppe_dev, i, cfg);
+			if (ret)
+				return ret;
+		}
+
+		for (i = 0; i < PPE_RSS_HASH_FIN_IPV4_ENTRIES; i++) {
+			val = FIELD_PREP(PPE_RSS_HASH_FIN_IPV4_INNER, cfg.hash_fin_inner[i]);
+			val |= FIELD_PREP(PPE_RSS_HASH_FIN_IPV4_OUTER, cfg.hash_fin_outer[i]);
+			reg = PPE_RSS_HASH_FIN_IPV4_ADDR + i * PPE_RSS_HASH_FIN_IPV4_INC;
+
+			ret = regmap_write(ppe_dev->regmap, reg, val);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (mode & PPE_RSS_HASH_MODE_IPV6) {
+		val = FIELD_PREP(PPE_RSS_HASH_MASK_HASH_MASK, cfg.hash_mask);
+		val |= FIELD_PREP(PPE_RSS_HASH_MASK_FRAGMENT, cfg.hash_fragment_mode);
+		ret = regmap_write(ppe_dev->regmap, PPE_RSS_HASH_MASK_ADDR, val);
+		if (ret)
+			return ret;
+
+		val = FIELD_PREP(PPE_RSS_HASH_SEED_VAL, cfg.hash_seed);
+		ret = regmap_write(ppe_dev->regmap, PPE_RSS_HASH_SEED_ADDR, val);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < PPE_RSS_HASH_MIX_ENTRIES; i++) {
+			ret = ppe_rss_hash_ipv6_config(ppe_dev, i, cfg);
+			if (ret)
+				return ret;
+		}
+
+		for (i = 0; i < PPE_RSS_HASH_FIN_ENTRIES; i++) {
+			val = FIELD_PREP(PPE_RSS_HASH_FIN_INNER, cfg.hash_fin_inner[i]);
+			val |= FIELD_PREP(PPE_RSS_HASH_FIN_OUTER, cfg.hash_fin_outer[i]);
+			reg = PPE_RSS_HASH_FIN_ADDR + i * PPE_RSS_HASH_FIN_INC;
+
+			ret = regmap_write(ppe_dev->regmap, reg, val);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int ppe_config_bm_threshold(struct ppe_device *ppe_dev, int bm_port_id,
 				   struct ppe_bm_port_config port_cfg)
 {
@@ -1666,6 +1803,57 @@ static int ppe_port_config_init(struct ppe_device *ppe_dev)
 	return ppe_counter_enable_set(ppe_dev, 0, true);
 }
 
+/* Initialize the PPE RSS configuration for IPv4 and IPv6 packet receive.
+ * RSS settings are to calculate the random RSS hash value generated during
+ * packet receive. This hash is then used to generate the queue offset used
+ * to determine the queue used to transmit the packet.
+ */
+static int ppe_rss_hash_init(struct ppe_device *ppe_dev)
+{
+	u16 fins[PPE_RSS_HASH_TUPLES] = { 0x205, 0x264, 0x227, 0x245, 0x201 };
+	u8 ips[PPE_RSS_HASH_IP_LENGTH] = { 0x13, 0xb, 0x13, 0xb };
+	struct ppe_rss_hash_cfg hash_cfg;
+	int i, ret;
+
+	hash_cfg.hash_seed = get_random_u32();
+	hash_cfg.hash_mask = 0xfff;
+
+	/* Use 5 tuple as RSS hash key for the first fragment of TCP, UDP
+	 * and UDP-Lite packets.
+	 */
+	hash_cfg.hash_fragment_mode = false;
+
+	/* The final common seed configs used to calculate the RSS has value,
+	 * which is available for both IPv4 and IPv6 packet.
+	 */
+	for (i = 0; i < ARRAY_SIZE(fins); i++) {
+		hash_cfg.hash_fin_inner[i] = fins[i] & 0x1f;
+		hash_cfg.hash_fin_outer[i] = fins[i] >> 5;
+	}
+
+	/* RSS seeds for IP protocol, L4 destination & source port and
+	 * destination & source IP used to calculate the RSS hash value.
+	 */
+	hash_cfg.hash_protocol_mix = 0x13;
+	hash_cfg.hash_dport_mix = 0xb;
+	hash_cfg.hash_sport_mix = 0x13;
+	hash_cfg.hash_dip_mix[0] = 0xb;
+	hash_cfg.hash_sip_mix[0] = 0x13;
+
+	/* Configure RSS seed configs for IPv4 packet. */
+	ret = ppe_rss_hash_config_set(ppe_dev, PPE_RSS_HASH_MODE_IPV4, hash_cfg);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(ips); i++) {
+		hash_cfg.hash_sip_mix[i] = ips[i];
+		hash_cfg.hash_dip_mix[i] = ips[i];
+	}
+
+	/* Configure RSS seed configs for IPv6 packet. */
+	return ppe_rss_hash_config_set(ppe_dev, PPE_RSS_HASH_MODE_IPV6, hash_cfg);
+}
+
 int ppe_hw_config(struct ppe_device *ppe_dev)
 {
 	int ret;
@@ -1690,5 +1878,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
 	if (ret)
 		return ret;
 
-	return ppe_port_config_init(ppe_dev);
+	ret = ppe_port_config_init(ppe_dev);
+	if (ret)
+		return ret;
+
+	return ppe_rss_hash_init(ppe_dev);
 }
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index d5ffc48460df..6190e2d53aa8 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -23,6 +23,12 @@
 /* The service code is used by EDMA port to transmit packet to PPE. */
 #define PPE_EDMA_SC_BYPASS_ID			1
 
+/* The PPE RSS hash configured for IPv4 and IPv6 packet separately. */
+#define PPE_RSS_HASH_MODE_IPV4			BIT(0)
+#define PPE_RSS_HASH_MODE_IPV6			BIT(1)
+#define PPE_RSS_HASH_IP_LENGTH			4
+#define PPE_RSS_HASH_TUPLES			5
+
 /**
  * enum ppe_scheduler_frame_mode - PPE scheduler frame mode.
  * @PPE_SCH_WITH_IPG_PREAMBLE_FRAME_CRC: The scheduled frame includes IPG,
@@ -243,6 +249,37 @@ enum ppe_action_type {
 	PPE_ACTION_REDIRECT_TO_CPU = 3,
 };
 
+/**
+ * struct ppe_rss_hash_cfg - PPE RSS hash configuration.
+ * @hash_mask: Mask of the generated hash value.
+ * @hash_fragment_mode: Hash generation mode for the first fragment of
+ * TCP, UDP and UDP-Lite packets, to use either 3 tuple or 5 tuple for
+ * RSS hash key computation.
+ * @hash_seed: Seed to generate RSS hash.
+ * @hash_sip_mix: Source IP selection.
+ * @hash_dip_mix: Destination IP selection.
+ * @hash_protocol_mix: Protocol selection.
+ * @hash_sport_mix: Source L4 port selection.
+ * @hash_sport_mix: Destination L4 port selection.
+ * @hash_fin_inner: RSS hash value first selection.
+ * @hash_fin_outer: RSS hash value second selection.
+ *
+ * PPE RSS hash value is generated for the packet based on the RSS hash
+ * configured.
+ */
+struct ppe_rss_hash_cfg {
+	u32 hash_mask;
+	bool hash_fragment_mode;
+	u32 hash_seed;
+	u8 hash_sip_mix[PPE_RSS_HASH_IP_LENGTH];
+	u8 hash_dip_mix[PPE_RSS_HASH_IP_LENGTH];
+	u8 hash_protocol_mix;
+	u8 hash_sport_mix;
+	u8 hash_dport_mix;
+	u8 hash_fin_inner[PPE_RSS_HASH_TUPLES];
+	u8 hash_fin_outer[PPE_RSS_HASH_TUPLES];
+};
+
 int ppe_hw_config(struct ppe_device *ppe_dev);
 int ppe_queue_scheduler_set(struct ppe_device *ppe_dev,
 			    int node_id, bool flow_level, int port,
@@ -265,4 +302,6 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 		      struct ppe_sc_cfg cfg);
 int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port, bool enable);
+int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
+			    struct ppe_rss_hash_cfg hash_cfg);
 #endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index e4596ffe04f6..5aa46c41e066 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -16,6 +16,46 @@
 #define PPE_BM_SCH_CTRL_SCH_OFFSET		GENMASK(14, 8)
 #define PPE_BM_SCH_CTRL_SCH_EN			BIT(31)
 
+/* RSS settings are to calculate the random RSS hash value generated during
+ * packet receive to ARM cores. This hash is then used to generate the queue
+ * offset used to determine the queue used to transmit the packet to ARM cores.
+ */
+#define PPE_RSS_HASH_MASK_ADDR			0xb4318
+#define PPE_RSS_HASH_MASK_HASH_MASK		GENMASK(20, 0)
+#define PPE_RSS_HASH_MASK_FRAGMENT		BIT(28)
+
+#define PPE_RSS_HASH_SEED_ADDR			0xb431c
+#define PPE_RSS_HASH_SEED_VAL			GENMASK(31, 0)
+
+#define PPE_RSS_HASH_MIX_ADDR			0xb4320
+#define PPE_RSS_HASH_MIX_ENTRIES		11
+#define PPE_RSS_HASH_MIX_INC			4
+#define PPE_RSS_HASH_MIX_VAL			GENMASK(4, 0)
+
+#define PPE_RSS_HASH_FIN_ADDR			0xb4350
+#define PPE_RSS_HASH_FIN_ENTRIES		5
+#define PPE_RSS_HASH_FIN_INC			4
+#define PPE_RSS_HASH_FIN_INNER			GENMASK(4, 0)
+#define PPE_RSS_HASH_FIN_OUTER			GENMASK(9, 5)
+
+#define PPE_RSS_HASH_MASK_IPV4_ADDR		0xb4380
+#define PPE_RSS_HASH_MASK_IPV4_HASH_MASK	GENMASK(20, 0)
+#define PPE_RSS_HASH_MASK_IPV4_FRAGMENT		BIT(28)
+
+#define PPE_RSS_HASH_SEED_IPV4_ADDR		0xb4384
+#define PPE_RSS_HASH_SEED_IPV4_VAL		GENMASK(31, 0)
+
+#define PPE_RSS_HASH_MIX_IPV4_ADDR		0xb4390
+#define PPE_RSS_HASH_MIX_IPV4_ENTRIES		5
+#define PPE_RSS_HASH_MIX_IPV4_INC		4
+#define PPE_RSS_HASH_MIX_IPV4_VAL		GENMASK(4, 0)
+
+#define PPE_RSS_HASH_FIN_IPV4_ADDR		0xb43b0
+#define PPE_RSS_HASH_FIN_IPV4_ENTRIES		5
+#define PPE_RSS_HASH_FIN_IPV4_INC		4
+#define PPE_RSS_HASH_FIN_IPV4_INNER		GENMASK(4, 0)
+#define PPE_RSS_HASH_FIN_IPV4_OUTER		GENMASK(9, 5)
+
 #define PPE_BM_SCH_CFG_TBL_ADDR			0xc000
 #define PPE_BM_SCH_CFG_TBL_ENTRIES		128
 #define PPE_BM_SCH_CFG_TBL_INC			0x10

-- 
2.34.1


