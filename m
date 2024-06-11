Return-Path: <linux-arm-msm+bounces-22278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACA90343F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 09:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FCE128A5B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 07:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A38175564;
	Tue, 11 Jun 2024 07:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b1L7DrE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA45174EFE;
	Tue, 11 Jun 2024 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092036; cv=none; b=j1EVEpA1uDK6+vdHeoY7eIddVZGKQTB/BwoQ2L3AkB3/UvUBlcnCuFuF+IXdxmFu8Xe2EkcDTKTNlC6DRPvJrwfyC/eGWnPqCiYBjih8SIsLcc8QXnmWTrh6+BJ8WThye87AL8xO5EE+kt07bTITeKAmJn6NhQh9m5PmzBq1kKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092036; c=relaxed/simple;
	bh=EPOf6UQp2hHyq5RAW12K2zU7Sn4jlLp9JPGb9s1xKSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=leRfhU5agKHkK6krwY7HyuUBKSClRmnWFvQTvxzxfd+/Ix/GkfA7OqZRehbHUHug1RiDSO/cC5STRfBv1aNZdy6dVOpuJO0rVZIN0YxEIXf4JSSM/3KD5/sXASffpr389y/2cJ0XdY4f3YUq4PdUFotvBlAEB5XiKwFFaQZyB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b1L7DrE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B0BbCO018285;
	Tue, 11 Jun 2024 07:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x2Q89o88fi+D5TptacwxxTVY3WRA3wJOrYnfBHG2y9I=; b=b1L7DrE0aA+NbqRf
	5p55pQLVMGHt0mjXKgp1LbYfCIyLr27gDv/YgROkDD2DGHcmUZ0L/HYplIWHufT1
	x3omL/4z0RqJqlu9v1yrxC/xHclLmkEGK/idNlKBbEmJo/SkbzChEYK/Cql55FLV
	wS8H98X9NQ9k8mkR5rraJ3Wv3ONjR57KHwb2UJsLhom8n/y+/dS0gJOk++ijblpI
	QVlY05QVinNlZW1LWw+8dAWMnokoW+8SZiR8Kg4VpkZhhR2sr9zXdA+jgcGr/fCk
	UmXqTfzym0eOfqcqd8ES9ETkkSgmozvdwELieib2dezYFZkAf3/g4GUOyJsEYfVM
	RNLeJg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh36eug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 07:47:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B7l1ZS012551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 07:47:01 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 00:46:56 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v6 7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
Date: Tue, 11 Jun 2024 13:15:57 +0530
Message-ID: <20240611074557.604250-8-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611074557.604250-1-quic_mohs@quicinc.com>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: BCQqYgQcu_5_VzU-xCd-Fwp_kXKlCfAw
X-Proofpoint-GUID: BCQqYgQcu_5_VzU-xCd-Fwp_kXKlCfAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_03,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110058

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds audio routing for both playback and capture and
Makefile and Kconfigs changes for wcd937x.

Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/Kconfig   | 20 ++++++++++
 sound/soc/codecs/Makefile  |  7 ++++
 sound/soc/codecs/wcd937x.c | 80 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 3621781d63c4..7b99556f24d3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -279,6 +279,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_WCD937X_SDW
 	imply SND_SOC_WCD938X_SDW
 	imply SND_SOC_WCD939X_SDW
 	imply SND_SOC_LPASS_MACRO_COMMON
@@ -2111,6 +2112,25 @@ config SND_SOC_WCD934X
 	  The WCD9340/9341 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SDM845.
 
+config SND_SOC_WCD937X
+	depends on SND_SOC_WCD937X_SDW
+	tristate
+	depends on SOUNDWIRE || !SOUNDWIRE
+	select SND_SOC_WCD_CLASSH
+
+config SND_SOC_WCD937X_SDW
+	tristate "WCD9370/WCD9375 Codec - SDW"
+	select SND_SOC_WCD937X
+	select SND_SOC_WCD_MBHC
+	select REGMAP_IRQ
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	help
+	  The WCD9370/9375 is an audio codec IC used with SoCs
+	  like SC7280 or QCM6490 chipsets, and it connected
+	  via soundwire.
+	  To compile this codec driver say Y or m.
+
 config SND_SOC_WCD938X
 	depends on SND_SOC_WCD938X_SDW
 	tristate
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d343d23c8f0f..ca69f35cc0f7 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -318,6 +318,8 @@ snd-soc-wcd-classh-y := wcd-clsh-v2.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
+snd-soc-wcd937x-objs := wcd937x.o
+snd-soc-wcd937x-sdw-objs := wcd937x-sdw.o
 snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
@@ -714,6 +716,11 @@ obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
 obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
+obj-$(CONFIG_SND_SOC_WCD937X)	+= snd-soc-wcd937x.o
+ifdef CONFIG_SND_SOC_WCD937X_SDW
+# avoid link failure by forcing sdw code built-in when needed
+obj-$(CONFIG_SND_SOC_WCD937X) += snd-soc-wcd937x-sdw.o
+endif
 obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
 ifdef CONFIG_SND_SOC_WCD938X_SDW
 # avoid link failure by forcing sdw code built-in when needed
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 97356f73eac5..4fd7dad810b5 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2391,6 +2391,77 @@ static const struct snd_soc_dapm_widget wcd9375_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("DMIC6_OUTPUT"),
 };
 
+static const struct snd_soc_dapm_route wcd937x_audio_map[] = {
+	{ "ADC1_OUTPUT", NULL, "ADC1_MIXER" },
+	{ "ADC1_MIXER", "Switch", "ADC1 REQ" },
+	{ "ADC1 REQ", NULL, "ADC1" },
+	{ "ADC1", NULL, "AMIC1" },
+
+	{ "ADC2_OUTPUT", NULL, "ADC2_MIXER" },
+	{ "ADC2_MIXER", "Switch", "ADC2 REQ" },
+	{ "ADC2 REQ", NULL, "ADC2" },
+	{ "ADC2", NULL, "ADC2 MUX" },
+	{ "ADC2 MUX", "INP3", "AMIC3" },
+	{ "ADC2 MUX", "INP2", "AMIC2" },
+
+	{ "IN1_HPHL", NULL, "VDD_BUCK" },
+	{ "IN1_HPHL", NULL, "CLS_H_PORT" },
+	{ "RX1", NULL, "IN1_HPHL" },
+	{ "RDAC1", NULL, "RX1" },
+	{ "HPHL_RDAC", "Switch", "RDAC1" },
+	{ "HPHL PGA", NULL, "HPHL_RDAC" },
+	{ "HPHL", NULL, "HPHL PGA" },
+
+	{ "IN2_HPHR", NULL, "VDD_BUCK" },
+	{ "IN2_HPHR", NULL, "CLS_H_PORT" },
+	{ "RX2", NULL, "IN2_HPHR" },
+	{ "RDAC2", NULL, "RX2" },
+	{ "HPHR_RDAC", "Switch", "RDAC2" },
+	{ "HPHR PGA", NULL, "HPHR_RDAC" },
+	{ "HPHR", NULL, "HPHR PGA" },
+
+	{ "IN3_AUX", NULL, "VDD_BUCK" },
+	{ "IN3_AUX", NULL, "CLS_H_PORT" },
+	{ "RX3", NULL, "IN3_AUX" },
+	{ "RDAC4", NULL, "RX3" },
+	{ "AUX_RDAC", "Switch", "RDAC4" },
+	{ "AUX PGA", NULL, "AUX_RDAC" },
+	{ "AUX", NULL, "AUX PGA" },
+
+	{ "RDAC3_MUX", "RX3", "RX3" },
+	{ "RDAC3_MUX", "RX1", "RX1" },
+	{ "RDAC3", NULL, "RDAC3_MUX" },
+	{ "EAR_RDAC", "Switch", "RDAC3" },
+	{ "EAR PGA", NULL, "EAR_RDAC" },
+	{ "EAR", NULL, "EAR PGA" },
+};
+
+static const struct snd_soc_dapm_route wcd9375_audio_map[] = {
+	{ "ADC3_OUTPUT", NULL, "ADC3_MIXER" },
+	{ "ADC3_OUTPUT", NULL, "ADC3_MIXER" },
+	{ "ADC3_MIXER", "Switch", "ADC3 REQ" },
+	{ "ADC3 REQ", NULL, "ADC3" },
+	{ "ADC3", NULL, "AMIC4" },
+
+	{ "DMIC1_OUTPUT", NULL, "DMIC1_MIXER" },
+	{ "DMIC1_MIXER", "Switch", "DMIC1" },
+
+	{ "DMIC2_OUTPUT", NULL, "DMIC2_MIXER" },
+	{ "DMIC2_MIXER", "Switch", "DMIC2" },
+
+	{ "DMIC3_OUTPUT", NULL, "DMIC3_MIXER" },
+	{ "DMIC3_MIXER", "Switch", "DMIC3" },
+
+	{ "DMIC4_OUTPUT", NULL, "DMIC4_MIXER" },
+	{ "DMIC4_MIXER", "Switch", "DMIC4" },
+
+	{ "DMIC5_OUTPUT", NULL, "DMIC5_MIXER" },
+	{ "DMIC5_MIXER", "Switch", "DMIC5" },
+
+	{ "DMIC6_OUTPUT", NULL, "DMIC6_MIXER" },
+	{ "DMIC6_MIXER", "Switch", "DMIC6" },
+};
+
 static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
 {
 	int vout_ctl[3];
@@ -2527,6 +2598,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 			dev_err(component->dev, "Failed to add snd_ctls\n");
 			return ret;
 		}
+
+		ret = snd_soc_dapm_add_routes(dapm, wcd9375_audio_map,
+					      ARRAY_SIZE(wcd9375_audio_map));
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to add routes\n");
+			return ret;
+		}
 	}
 
 	ret = wcd937x_mbhc_init(component);
@@ -2570,6 +2648,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
 	.num_controls = ARRAY_SIZE(wcd937x_snd_controls),
 	.dapm_widgets = wcd937x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd937x_dapm_widgets),
+	.dapm_routes = wcd937x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd937x_audio_map),
 	.set_jack = wcd937x_codec_set_jack,
 	.endianness = 1,
 };
-- 
2.25.1


