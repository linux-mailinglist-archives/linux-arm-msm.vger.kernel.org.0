Return-Path: <linux-arm-msm+bounces-31273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3B9715D4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8233A2844B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CBB1B5ED2;
	Mon,  9 Sep 2024 10:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RSW1Xpc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A631B5EB8;
	Mon,  9 Sep 2024 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879442; cv=none; b=Og3hvLjuy09GYREUXK3CSkSDLPsq7JTPrSAB1Mw15SzlaXmUSmMxGlP8kc9Mhu2zq6kBkJhTskG8Ad5BeFKr/sTZQZlDratJjpl16a3MvQWOe4XvPzBFak4PUdhJnkEMCA00clemqxOYW4iH+ZbTdzVAjxbDfleJpCW2TmuoTCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879442; c=relaxed/simple;
	bh=JLfY+arwF4dp3t4qJQb1VChfqJ0RphWrYUH6ndMG2Yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsGeBYuRtbJuXEg/x/A5zjpv7oQpNH27gPaZth8F9blHBuInsS7pfeevn0HpPfJ0MxpzGNrJFZN+orglp1KO+/qoJr0kNUuEBgxyWKlx8qXBRYAri/9dFDOIHNAm/Xbwy9VCwgAn65o03JZQ9L9PKWvxqldW+/RESRdwCp2XyVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RSW1Xpc0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4899Josw031502;
	Mon, 9 Sep 2024 10:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89RSjvdnN7rZnnF34fyr60IHhkqzMd96vIuSoX78uYA=; b=RSW1Xpc0WWFlxyIJ
	yfW79gld2itdbGliwml6vw5EkIiiODir8Zo6NBd6WtxU0JIw/RnVDqCPEXUKtXJr
	L+rJmTQ4bx7bO83FQJsH0FGkz8jNXz695ttTqsEurjROmu08fAD2gx94b5Q1bGAC
	+fnmHGA7mvPsuc1Ll1Xm9DiAmCTpL4t0JTrocECczKTHP9iVAiucKco5pE4+4qOg
	bKKhgx5pPDfLvQzn/NsCs3tiGakGdy9Mh73GWSXY0G17QZGxaDh+v3rQfPNx6moq
	F7z9h+thBj3to4zgciBXWXL3dlSoowav6BlmPm+tv8R0MICE8122R8Sm6FRdDyQs
	8tqhAw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6p2hxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:57:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489Av62t003960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:57:06 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:58 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 4/4] ASoC: codecs: wcd937x: Add static channel mapping support in wcd937x-sdw
Date: Mon, 9 Sep 2024 16:25:47 +0530
Message-ID: <20240909105547.2691015-5-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: arQSjMQkvccejxdZJgUepOkICTBsHUL_
X-Proofpoint-GUID: arQSjMQkvccejxdZJgUepOkICTBsHUL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090087

Add static channel mapping between master and slave ports in
wcd937x-sdw. This patch will resolve the channel mask mismatch
between master and slave.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 52 ++++++++++++++++++++++++++++------
 sound/soc/codecs/wcd937x.c     | 12 ++++++--
 sound/soc/codecs/wcd937x.h     |  6 +++-
 3 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 0c33f7f3dc25..f59068ddc26f 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -19,7 +19,7 @@
 #include <sound/soc.h>
 #include "wcd937x.h"
 
-static const struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
+static struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_HPH_L, WCD937X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_HPH_R, WCD937X_HPH_PORT, BIT(1)),
 	WCD_SDW_CH(WCD937X_CLSH, WCD937X_CLSH_PORT, BIT(0)),
@@ -30,7 +30,7 @@ static const struct wcd937x_sdw_ch_info wcd937x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_DSD_R, WCD937X_DSD_PORT, BIT(1)),
 };
 
-static const struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
+static struct wcd937x_sdw_ch_info wcd937x_sdw_tx_ch_info[] = {
 	WCD_SDW_CH(WCD937X_ADC1, WCD937X_ADC_1_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC2, WCD937X_ADC_2_3_PORT, BIT(0)),
 	WCD_SDW_CH(WCD937X_ADC3, WCD937X_ADC_2_3_PORT, BIT(0)),
@@ -91,7 +91,7 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 {
 	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
 	unsigned long ch_mask;
-	int i, j;
+	int i, j, ret = 0;
 
 	wcd->sconfig.ch_count = 1;
 	wcd->active_ports = 0;
@@ -112,9 +112,15 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 	wcd->sconfig.direction = wcd->is_tx ? SDW_DATA_DIR_TX : SDW_DATA_DIR_RX;
 	wcd->sconfig.type = SDW_STREAM_PCM;
 
-	return sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
-				    &port_config[0], wcd->active_ports,
-				    wcd->sruntime);
+	ret = sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
+				   &port_config[0], wcd->active_ports,
+				   wcd->sruntime);
+	if (!ret)
+		sdw_set_channel_map_stream(wcd->sruntime,
+					   wcd->master_channel_map,
+					   wcd->active_ports);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(wcd937x_sdw_hw_params);
 
@@ -1019,7 +1025,9 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct wcd937x_sdw_priv *wcd;
-	int ret;
+	u8 master_ch_mask[WCD937X_MAX_SWR_CH_IDS];
+	int master_ch_mask_size = 0;
+	int ret, i;
 
 	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
 	if (!wcd)
@@ -1048,10 +1056,36 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 				   SDW_SCP_INT1_PARITY;
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
+
+	memset(master_ch_mask, 0, WCD937X_MAX_SWR_CH_IDS);
+
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS - 1, 0);
+		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
+								 "qcom,tx-channel-mapping");
+
+		if (master_ch_mask_size)
+			ret = of_property_read_u8_array(dev->of_node, "qcom,tx-channel-mapping",
+							master_ch_mask, master_ch_mask_size);
+	} else {
+		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
+								 "qcom,rx-channel-mapping");
+
+		if (master_ch_mask_size)
+			ret = of_property_read_u8_array(dev->of_node, "qcom,rx-channel-mapping",
+							master_ch_mask, master_ch_mask_size);
+	}
+
+	if (ret < 0)
+		dev_info(dev, "Static channel mapping not specified using device channel maps\n");
+
+	if (wcd->is_tx) {
+		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
+
+		for (i = 0; i < master_ch_mask_size; i++)
+			wcd->ch_info[i].master_ch_mask = master_ch_mask[i];
+
 		pdev->prop.wake_capable = true;
 
 		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd937x_regmap_config);
@@ -1065,6 +1099,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
+		for (i = 0; i < master_ch_mask_size; i++)
+			wcd->ch_info[i].master_ch_mask = master_ch_mask[i];
 	}
 
 
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index af296b77a723..404effb8c31f 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1192,13 +1192,21 @@ static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch
 	const struct wcd937x_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
 	u8 port_num = ch_info->port_num;
 	u8 ch_mask = ch_info->ch_mask;
+	u8 mstr_port_num, mstr_ch_mask;
+	struct sdw_slave *sdev = wcd->sdev;
 
 	port_config->num = port_num;
 
-	if (enable)
+	mstr_port_num = sdev->m_port_map[port_num];
+	mstr_ch_mask = ch_info->master_ch_mask;
+
+	if (enable) {
 		port_config->ch_mask |= ch_mask;
-	else
+		wcd->master_channel_map[mstr_port_num] |= mstr_ch_mask;
+	} else {
 		port_config->ch_mask &= ~ch_mask;
+		wcd->master_channel_map[mstr_port_num] &= ~mstr_ch_mask;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 35f3d48bd7dd..850aa943b7ab 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -506,12 +506,14 @@ enum wcd937x_rx_sdw_ports {
 struct wcd937x_sdw_ch_info {
 	int port_num;
 	unsigned int ch_mask;
+	unsigned int master_ch_mask;
 };
 
 #define WCD_SDW_CH(id, pn, cmask)	\
 	[id] = {			\
 		.port_num = pn,		\
 		.ch_mask = cmask,	\
+		.master_ch_mask = cmask,	\
 	}
 
 struct wcd937x_priv;
@@ -520,9 +522,11 @@ struct wcd937x_sdw_priv {
 	struct sdw_stream_config sconfig;
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WCD937X_MAX_SWR_PORTS];
-	const struct wcd937x_sdw_ch_info *ch_info;
+	struct wcd937x_sdw_ch_info *ch_info;
 	bool port_enable[WCD937X_MAX_SWR_CH_IDS];
+	unsigned int master_channel_map[SDW_MAX_PORTS];
 	int active_ports;
+	int num_ports;
 	bool is_tx;
 	struct wcd937x_priv *wcd937x;
 	struct irq_domain *slave_irq;
-- 
2.25.1


