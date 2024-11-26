Return-Path: <linux-arm-msm+bounces-39219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923A9D9BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 17:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64269B25CD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 16:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687381DB958;
	Tue, 26 Nov 2024 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aUwlLP6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6C1DA0E9;
	Tue, 26 Nov 2024 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639506; cv=none; b=Nwg9k2xCbTJpOu9/T8GHg2nC4e69wqA4u1o6VGvEjozkN7hUwmJo4dL/Qbuf0xWO+gYcK37ylhIgdPazPMax7cBEakd9YbyRDHHSuCqA4k6Q5PDSm1f2pD6/GHuqcsanjplaC0yXKQp0ZeQxxZSvvKx3YQlaa4XrSgx9iidHSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639506; c=relaxed/simple;
	bh=VO6j+9JSmEWH/c9izQYqa+WqG/zaXkWGtfKm7mO9gJw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6/1vsrOygb/a/QQBdEy5bCWX6RbBB2JiuDPv+ynp7/G+hoLo/A3X0MGMlTpt1coqT5L503ZbLY+qJ4B00MqIw/38h5shs4HkvtVvj7GUObxpbWXXNoutJsZHzCtQgZnhsuLWI+lrmmPp5XeDWofqjh3G0UG95tXEmHTj0mQWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aUwlLP6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQCp1dR030143;
	Tue, 26 Nov 2024 16:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKl+0ubv8VowRjVXUwlZbx2EIROoMF2aIe4KOhhoqVo=; b=aUwlLP6Fcyuck1yl
	Q1ur1dDJgLB3vJWqMIwab3/iRKabJVU1LGK6noqd71oxE8qjwYntuotRxbEGWcTu
	c/h4hJ4MD65vqn86hrdi1I3FXIg5e9ZwojJAtD4M3/LySkgQRsJ5gack9YP2chld
	8MlYveoxaWz6opJAVLPqdmmmcBYuOQLME1McIBjE5L3+njBC0dF2XQJF0rFwVLSt
	3iZ2+3MhlqZ+T5FTUyjUypuoV71Yc+2ZRXXidalDRm4p07nn7n6UndvZzfPdX4cs
	vKJsgCUM2hwQovX4Wqr8BjTPU3Prw+oB1QHAz9BDxbzFQj9brR4sskW4lp0lhDp6
	ML93Bg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435epq8jpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQGinlM030672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 16:44:49 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 08:44:41 -0800
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
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v3 3/5] ASoC: codecs: wcd937x: Add static channel mapping support in wcd937x-sdw
Date: Tue, 26 Nov 2024 22:12:58 +0530
Message-ID: <20241126164300.3305903-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126164300.3305903-1-quic_mohs@quicinc.com>
References: <20241126164300.3305903-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9Z1enW34_N0fJQJyKdXNb4QD6OKQh7-
X-Proofpoint-ORIG-GUID: C9Z1enW34_N0fJQJyKdXNb4QD6OKQh7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260134

Add static channel mapping between master and slave ports in
wcd937x-sdw driver.

Currently, the channel mask for each soundwire port is hardcoded in the
wcd937x-sdw driver, and the same channel mask value is configured in the
soundwire master.

The Qualcomm boards like the QCM6490-IDP require different channel mask
settings for the soundwire master and slave ports.

Implemented logic to read TX/RX channel mappings from device tree
properties (qcom,tx-channel-mapping and qcom,rx-channel-mapping).

Modified the wcd937x_connect_port to handle master channel masks during
port enable/disable operations.

Added wcd937x_get_channel_map api to retrieve the current master
channel map for TX and RX paths.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 38 +++++++++++++++++++++---
 sound/soc/codecs/wcd937x.c     | 53 ++++++++++++++++++++++++++++++++--
 sound/soc/codecs/wcd937x.h     |  6 +++-
 3 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 0c33f7f3dc25..3263bdf25d86 100644
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
@@ -1019,7 +1019,9 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct wcd937x_sdw_priv *wcd;
-	int ret;
+	u8 master_ch_mask[WCD937X_MAX_SWR_CH_IDS];
+	int master_ch_mask_size = 0;
+	int ret, i;
 
 	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
 	if (!wcd)
@@ -1048,10 +1050,36 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 				   SDW_SCP_INT1_PARITY;
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
+
+	memset(master_ch_mask, 0, WCD937X_MAX_SWR_CH_IDS);
+
+	if (wcd->is_tx) {
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
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS - 1, 0);
+		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
+
+		for (i = 0; i < master_ch_mask_size; i++)
+			wcd->ch_info[i].master_ch_mask = master_ch_mask[i];
+
 		pdev->prop.wake_capable = true;
 
 		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd937x_regmap_config);
@@ -1065,6 +1093,8 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
+		for (i = 0; i < master_ch_mask_size; i++)
+			wcd->ch_info[i].master_ch_mask = master_ch_mask[i];
 	}
 
 
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index c9d5e67bf66e..e8d3fddbc7b1 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1197,13 +1197,21 @@ static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch
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
@@ -2689,10 +2697,51 @@ static int wcd937x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int wcd937x_get_channel_map(const struct snd_soc_dai *dai,
+				   unsigned int *tx_num, unsigned int *tx_slot,
+				   unsigned int *rx_num, unsigned int *rx_slot)
+{
+	struct wcd937x_priv *wcd937x = dev_get_drvdata(dai->dev);
+	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[dai->id];
+	int i;
+
+	switch (dai->id) {
+	case AIF1_PB:
+		if (!rx_slot || !rx_num) {
+			dev_err(dai->dev, "Invalid rx_slot %p or rx_num %p\n",
+				rx_slot, rx_num);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < SDW_MAX_PORTS; i++)
+			rx_slot[i] = wcd->master_channel_map[i];
+
+		*rx_num = i;
+		break;
+	case AIF1_CAP:
+		if (!tx_slot || !tx_num) {
+			dev_err(dai->dev, "Invalid tx_slot %p or tx_num %p\n",
+				tx_slot, tx_num);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < SDW_MAX_PORTS; i++)
+			tx_slot[i] = wcd->master_channel_map[i];
+
+		*tx_num = i;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops wcd937x_sdw_dai_ops = {
 	.hw_params = wcd937x_codec_hw_params,
 	.hw_free = wcd937x_codec_free,
 	.set_stream = wcd937x_codec_set_sdw_stream,
+	.get_channel_map = wcd937x_get_channel_map,
 };
 
 static struct snd_soc_dai_driver wcd937x_dais[] = {
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 4afa48dcaf74..a17851f23d18 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -510,12 +510,14 @@ enum wcd937x_rx_sdw_ports {
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
@@ -524,9 +526,11 @@ struct wcd937x_sdw_priv {
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


