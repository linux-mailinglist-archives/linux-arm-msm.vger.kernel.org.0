Return-Path: <linux-arm-msm+bounces-57684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EE8AB50D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352904A2176
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1993A24C66A;
	Tue, 13 May 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T1mwuupV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBDD24C09C;
	Tue, 13 May 2025 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130389; cv=none; b=dXNoiamKkOvz7Qgk3dJBmykbcMPfiJAiNDNdiohCU9lyUsnAJT8jGMtIcjCccl16WiY38+9ql9KqowPx00VdJWbal4X2d8+19ouN9OoZL++2dx8qe17WPGldi1Kt7J1XlWAsiOEUmmjlBlNrBAPxMbLDhS37vq0AZv/6ueqTsmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130389; c=relaxed/simple;
	bh=TLSsBDITjLO7Lx+0IBbDuzwSaTFOxzxAv4CO9MvruIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WxuGT776ZKoz2ZBZq3yXDRH54dSwJOpRO0m6ZFR4Itn0JTbpmdM3guAMWJ+O2kL+DCFNOJIKmtyiP5dtN9HkWH09fAg3ZBSWKoK7y/Ts4RjJrwtfZ/YyxCaQmvYMupA3GHk5t3Sby/cOTAmgtwSC4xF3ICA8ZE1VDx3AKjl4bJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T1mwuupV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D71p14006783;
	Tue, 13 May 2025 09:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDbj3ZkMPGkWx5iNavKHnLjfaJ8qQdQenL2RqdfvsHI=; b=T1mwuupVN1YHDQVp
	QLeNMREzM7wKFicMg/gAgJffrsrmAIneO1jo9NvepA+kpTyud0NsQ7wCcxx0x2H8
	Am1IUySCDqA/enIUfc2E4LTynuA/pToXIjg8TRTA67oIjcCXy88tzhh64B17ACLp
	JYiCL2203p2uriiCQKVso/x12b+a1PLR9m8vqzKBjYJcvDmVhyt3/ezIYGC1DVXa
	X0nPzHIYHksFQh0Zae2AkNS27Oyy5ymI1YyHJxtGxIaUWyiOK4OO9Mrv2oKXRo6l
	XUKVTNHpX85wscNsHQjftLgo3n1CHDQKf+g8fYFTIt0jXu9WTnFFbW3bUS60WB6B
	Yp5sCw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyjjq7c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9xWg2007725
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:59:32 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:59:26 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:30 +0800
Subject: [PATCH net-next v4 10/14] net: ethernet: qualcomm: Initialize PPE
 RSS hash settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-10-4fbe40cbbb71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130311; l=12132;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=TLSsBDITjLO7Lx+0IBbDuzwSaTFOxzxAv4CO9MvruIU=;
 b=uFSvyWCrLMjloxjG2L8dmDV1TLNeUd82NEWsUsrxBog+blZpGUKfAGPFpSkBwKG8F7cWZEux8
 pe2DJKltPQkCHl8nrbMHQG/HHIHAIUMk2Chz1G0Ynv00ezYowl+9J8u
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5MyBTYWx0ZWRfX5/IWFWl8qG+O
 R6VwIaZirhTGNwfDQFoq+iMcOJ2JLiC19ttcnuh2YCdhOUIwfqilBEOaMWMNJv6/bsjMpIhvsQd
 UGevacXPIYn/DrVXmM71nABYx7uWzXaH9mvsjwDDH3bBl+fKwznDLyIJaK3WoEhFZJsuZo8xNjT
 WAKgN8fM/HZ5KdNptjf2QoWh7wjk/pUWhMtTwwEColjjv+DWI09nN2PQht6uRXY35hgfb095KYU
 sq2G+FB3ehRaMBiIgwBEmpRna3xypiW7RrJ+C4N8+KBDC0LbC/03o/BcNUEb6gDRERH59sXnnLn
 uQLT6rvd2cD9ZbuFRZy5Lh2pMgC92Cvi0icy6M0kSnZVDObRKZ05xryIsfjw67d5ua1pyGn/XIs
 8s5EtVrF3o7Q0Q4dXsPe2acKM9n/RD4HyFmP417yORHjY7orPAfVGqwrMFvZubWOQqYRreC8
X-Proofpoint-GUID: MzEUZamoLMRud5K3_qmdwUTRELFugR_P
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=68231805 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=yIKwQdIoj9ZhpUI_W6AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MzEUZamoLMRud5K3_qmdwUTRELFugR_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130093

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
index dd7a4949f049..3b290eda7633 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1216,6 +1216,143 @@ int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port)
 	return regmap_set_bits(ppe_dev->regmap, reg, PPE_PORT_EG_VLAN_TBL_TX_COUNTING_EN);
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
+ * @ppe_dev: PPE device.
+ * @mode: Configure RSS hash for the packet type IPv4 and IPv6.
+ * @cfg: RSS hash configuration.
+ *
+ * PPE RSS hash settings are configured for the packet type IPv4 and IPv6.
+ *
+ * Return: 0 on success, negative error code on failure.
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
 				   const struct ppe_bm_port_config port_cfg)
 {
@@ -1686,6 +1823,57 @@ static int ppe_port_config_init(struct ppe_device *ppe_dev)
 	return ppe_counter_enable_set(ppe_dev, 0);
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
@@ -1710,5 +1898,9 @@ int ppe_hw_config(struct ppe_device *ppe_dev)
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
index 277a77257b85..fedcb9d9602f 100644
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
@@ -247,6 +253,37 @@ enum ppe_action_type {
 	PPE_ACTION_REDIRECT_TO_CPU = 3,
 };
 
+/**
+ * struct ppe_rss_hash_cfg - PPE RSS hash configuration.
+ * @hash_mask: Mask of the generated hash value.
+ * @hash_fragment_mode: Hash generation mode for the first fragment of TCP,
+ * UDP and UDP-Lite packets, to use either 3 tuple or 5 tuple for RSS hash
+ * key computation.
+ * @hash_seed: Seed to generate RSS hash.
+ * @hash_sip_mix: Source IP selection.
+ * @hash_dip_mix: Destination IP selection.
+ * @hash_protocol_mix: Protocol selection.
+ * @hash_sport_mix: Source L4 port selection.
+ * @hash_dport_mix: Destination L4 port selection.
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
@@ -269,4 +306,6 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc,
 		      struct ppe_sc_cfg cfg);
 int ppe_counter_enable_set(struct ppe_device *ppe_dev, int port);
+int ppe_rss_hash_config_set(struct ppe_device *ppe_dev, int mode,
+			    struct ppe_rss_hash_cfg hash_cfg);
 #endif
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 82716c3d42e9..ef1602674ec4 100644
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


