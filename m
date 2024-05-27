Return-Path: <linux-arm-msm+bounces-20601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39068CFEDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 13:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 035131C2084C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5171613C80B;
	Mon, 27 May 2024 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n1AdncgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3213DDDF;
	Mon, 27 May 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716808907; cv=none; b=UsKjFAym6yyIpZy5ksQZSZJP7utu0hIkU6DKXsAMRFp2h0lIC1TQ/SLh/zAQw9O+/v6L6LXqrtPkjS3F2tdEfoy0ZxGUHr4NRK311esOJbCL1mUL07gh3Fm9eao4PYourc0YCmAsBCpdwVMojMPTLSffHer6ByyQCmuRSWj4mvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716808907; c=relaxed/simple;
	bh=OS5MSzcbBQ7ZMcHYY64PkaLDe5X8hNrcrVRe1HmwDaE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bM4n7aZRswXh443b4HvUSGoUkoRsQ8AX9hnRX80hGkUAf9qFVRMarQjYFER+cmCT1TE1yArV1zQS8xNUEDWkbpFdhZOdtrmXn8r6uCPMcJi4icJLm38zqCaMQTCNHgViKnQa/l1qYC0pUrCXC1lOuWjQCsrNM5O8rw4LY/dJ44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n1AdncgO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44RAq7pY020041;
	Mon, 27 May 2024 11:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKImBEUAhMXEL4iLiIXWuWHCFP8rOWfIpyIny+N1N9U=; b=n1AdncgOnfMVwc4X
	eWwlNAnnt3uTdmOKuGpkuLd7ARzSeDv0D0pLO9xHj4+fr9RKdbaUBfcuXbHdVC0y
	3IjabaDt8u3s0MDZWatvYIrM9gPxrbYJwB9+k40uMF8GsIlTeiQN12KdWgWBuB5l
	6bbgkVuhC9XDXf7eu+yPQ1JUEKA8iOsPOhKgiFnWa1Yo754vKmA9CyqMx6yD3Zpu
	GWi22fIeFvLsetwYa6pIGZmiLYZj7zdmlVaIozKB8Cy0i+jbPrlyvqp2eMR3t7PW
	NJdJKN/WMw/2eHg48RdoxoJATvbHE9x7QcLOI7joSxRtogVeqLoT1ECsBPFhA07a
	wZITbg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h3mpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 11:21:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44RBLWUP014916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 11:21:32 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 27 May 2024 04:21:27 -0700
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
Subject: [RESEND v5 7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
Date: Mon, 27 May 2024 16:49:56 +0530
Message-ID: <20240527111956.444425-8-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240527111956.444425-1-quic_mohs@quicinc.com>
References: <20240527111956.444425-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: WuRzhBrqvxJYyAj8ivRUnEsHGDSUXSHZ
X-Proofpoint-ORIG-GUID: WuRzhBrqvxJYyAj8ivRUnEsHGDSUXSHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-27_01,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270093

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
index 4afc43d3f71f..a6bb5716632d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -278,6 +278,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_WCD937X_SDW
 	imply SND_SOC_WCD938X_SDW
 	imply SND_SOC_WCD939X_SDW
 	imply SND_SOC_LPASS_MACRO_COMMON
@@ -2100,6 +2101,25 @@ config SND_SOC_WCD934X
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
index b4df22186e25..c6f0cd5815f2 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -316,6 +316,8 @@ snd-soc-wcd-classh-y := wcd-clsh-v2.o
 snd-soc-wcd-mbhc-y := wcd-mbhc-v2.o
 snd-soc-wcd9335-y := wcd9335.o
 snd-soc-wcd934x-y := wcd934x.o
+snd-soc-wcd937x-objs := wcd937x.o
+snd-soc-wcd937x-sdw-objs := wcd937x-sdw.o
 snd-soc-wcd938x-y := wcd938x.o
 snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
 snd-soc-wcd939x-y := wcd939x.o
@@ -710,6 +712,11 @@ obj-$(CONFIG_SND_SOC_WCD_CLASSH)	+= snd-soc-wcd-classh.o
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
index f8b57f47ad55..ef649ed77fb2 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2409,6 +2409,77 @@ static const struct snd_soc_dapm_widget wcd9375_dapm_widgets[] = {
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
@@ -2545,6 +2616,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
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
@@ -2588,6 +2666,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd937x = {
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


