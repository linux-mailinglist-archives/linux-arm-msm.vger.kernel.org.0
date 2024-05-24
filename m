Return-Path: <linux-arm-msm+bounces-20379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B68CE012
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 05:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4B5C2814FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 03:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FA339ADD;
	Fri, 24 May 2024 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AfuSv9FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC903F8ED;
	Fri, 24 May 2024 03:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716523056; cv=none; b=mT+K2dogwInLRqCwDhoUF0y8aDCmkhQuzrTFdcFg7RDu4521BNJhRuAzlZbWca3Ry52cA/Pzs08LYJcjPZD7W+jrxrhpbwhj6Lq5PHFAq/uHGvlVO1ljf+YbfEVNdBT7FsAAgpuW3votp+t0uxjMoyH4b5bEFkyD7E50BiRIbu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716523056; c=relaxed/simple;
	bh=RzJSUjNo54LBcZDhzkQKhl5uvNHLWtVsL+CZhItyYcM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNhVhjsgi0QsYqXoLq/rmKS5tSckVHl2bGk3WPWgIXwwIXdDk2BGh7IVEpMA326PNZyX20ki/6g4A/UvkApxX7ushh6b7gQiNyqxeiTPsByioad0G3iv67h940503TGgtgED2aGl8yf/194obMJigft/Sr0ttjyZ2CK5bSphyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AfuSv9FC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPD0h004299;
	Fri, 24 May 2024 03:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gi2/mWlhb1BJ7odbdv6QVbpuiW4Cio+11QcF3t9wJZ4=; b=AfuSv9FCoRZYEpTn
	oAqWIVOuCrwfcKSSqlLL2V5ZKFFuMZo6sTA4mOwPdTMTi4mI76UIDl9ds0LkXlLA
	MwmBTlATVg97BLqjpUHk7mhIxO/QWiI5vNW/xscj/lPjtemqTMZawHqxisE850vf
	noGf+jMhGN8PUVUEcRATRBD2r9K1qOOV4VAq82uwTQMgrVvIN0pboKke8cKz69xV
	h3KObRgu1tFcG/EgtMGaN93+TlZysx8faPsCuaG5IhYg5fXPyi484mbnO9zYP7gI
	kTy8fMqXPhUsr8SkmhbJCHFyxYSOdea99br8J/oA3Nl3G2tx1IyPpL5EhVNvUl9A
	3Q/eQw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaabq13m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:57:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O3vKGM024590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 03:57:20 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 20:57:15 -0700
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
        <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v5 6/7] ASoC: codecs: wcd937x: add capture dapm widgets
Date: Fri, 24 May 2024 09:25:34 +0530
Message-ID: <20240524035535.3119208-7-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524035535.3119208-1-quic_mohs@quicinc.com>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: lo5hV9Uc0gGtQk1vAhSETVDCUCOuliZg
X-Proofpoint-ORIG-GUID: lo5hV9Uc0gGtQk1vAhSETVDCUCOuliZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240026

From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

This patch adds required dapm widgets for capture path.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/codecs/wcd937x.c | 404 +++++++++++++++++++++++++++++++++++++
 1 file changed, 404 insertions(+)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b0e4bd4eb4f..f8b57f47ad55 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -915,6 +915,145 @@ static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
 	return (micb_mv - 1000) / 50;
 }
 
+static int wcd937x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+	bool use_amic3 = snd_soc_component_read(component, WCD937X_TX_NEW_TX_CH2_SEL) & BIT(7);
+
+	/* Enable BCS for Headset mic */
+	if (event == SND_SOC_DAPM_PRE_PMU && strnstr(w->name, "ADC", sizeof("ADC")))
+		if (w->shift == 1 && !use_amic3)
+			set_bit(AMIC2_BCS_ENABLE, &wcd937x->status_mask);
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_adc(struct snd_soc_dapm_widget *w,
+				    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		atomic_inc(&wcd937x->ana_clk_count);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL, BIT(7), BIT(7));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(3), BIT(3));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(4), BIT(4));
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (w->shift == 1 && test_bit(AMIC2_BCS_ENABLE, &wcd937x->status_mask))
+			clear_bit(AMIC2_BCS_ENABLE, &wcd937x->status_mask);
+
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL, BIT(3), 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_enable_req(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_REQ_CTL, BIT(1), BIT(1));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_REQ_CTL, BIT(0), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH2, BIT(6), BIT(6));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH3_HPF, BIT(6), BIT(6));
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL, 0x70, 0x70);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH1, BIT(7), BIT(7));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH2, BIT(6), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH2, BIT(7), BIT(7));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH3, BIT(7), BIT(7));
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH1, BIT(7), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH2, BIT(7), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_TX_CH3, BIT(7), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL, BIT(4), 0x00);
+
+		atomic_dec(&wcd937x->ana_clk_count);
+		if (atomic_read(&wcd937x->ana_clk_count) <= 0) {
+			snd_soc_component_update_bits(component,
+						      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
+						      BIT(4), 0x00);
+			atomic_set(&wcd937x->ana_clk_count, 0);
+		}
+
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(7), 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_dmic(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *kcontrol,
+				     int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	u16 dmic_clk_reg;
+
+	switch (w->shift) {
+	case 0:
+	case 1:
+		dmic_clk_reg = WCD937X_DIGITAL_CDC_DMIC1_CTL;
+		break;
+	case 2:
+	case 3:
+		dmic_clk_reg = WCD937X_DIGITAL_CDC_DMIC2_CTL;
+		break;
+	case 4:
+	case 5:
+		dmic_clk_reg = WCD937X_DIGITAL_CDC_DMIC3_CTL;
+		break;
+	default:
+		dev_err(component->dev, "Invalid DMIC Selection\n");
+		return -EINVAL;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component,
+					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
+					      BIT(7), BIT(7));
+		snd_soc_component_update_bits(component,
+					      dmic_clk_reg, 0x07, BIT(1));
+		snd_soc_component_update_bits(component,
+					      dmic_clk_reg, BIT(3), BIT(3));
+		snd_soc_component_update_bits(component,
+					      dmic_clk_reg, 0x70, BIT(5));
+		break;
+	}
+
+	return 0;
+}
+
 static int wcd937x_micbias_control(struct snd_soc_component *component,
 				   int micb_num, int req, bool is_dapm)
 {
@@ -1026,6 +1165,82 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 	return 0;
 }
 
+static int __wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					  int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num;
+
+	if (strnstr(w->name, "MIC BIAS1", sizeof("MIC BIAS1")))
+		micb_num = MIC_BIAS_1;
+	else if (strnstr(w->name, "MIC BIAS2", sizeof("MIC BIAS2")))
+		micb_num = MIC_BIAS_2;
+	else if (strnstr(w->name, "MIC BIAS3", sizeof("MIC BIAS3")))
+		micb_num = MIC_BIAS_3;
+	else
+		return -EINVAL;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_micbias_control(component, micb_num,
+					MICB_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd937x_micbias_control(component, micb_num,
+					MICB_DISABLE, true);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	return __wcd937x_codec_enable_micbias(w, event);
+}
+
+static int __wcd937x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
+						 int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	int micb_num;
+
+	if (strnstr(w->name, "VA MIC BIAS1", sizeof("VA MIC BIAS1")))
+		micb_num = MIC_BIAS_1;
+	else if (strnstr(w->name, "VA MIC BIAS2", sizeof("VA MIC BIAS2")))
+		micb_num = MIC_BIAS_2;
+	else if (strnstr(w->name, "VA MIC BIAS3", sizeof("VA MIC BIAS3")))
+		micb_num = MIC_BIAS_3;
+	else
+		return -EINVAL;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		wcd937x_micbias_control(component, micb_num, MICB_PULLUP_ENABLE, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		wcd937x_micbias_control(component, micb_num, MICB_PULLUP_DISABLE, true);
+		break;
+	}
+
+	return 0;
+}
+
+static int wcd937x_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
+					       struct snd_kcontrol *kcontrol,
+					       int event)
+{
+	return __wcd937x_codec_enable_micbias_pullup(w, event);
+}
+
 static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch_id, bool enable)
 {
 	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
@@ -1912,6 +2127,42 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 };
 
+static const struct snd_kcontrol_new adc1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new adc3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic1_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic2_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic3_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic4_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic5_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
+static const struct snd_kcontrol_new dmic6_switch[] = {
+	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
+};
+
 static const struct snd_kcontrol_new ear_rdac_switch[] = {
 	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
 };
@@ -1928,22 +2179,76 @@ static const struct snd_kcontrol_new hphr_rdac_switch[] = {
 	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0)
 };
 
+static const char * const adc2_mux_text[] = {
+	"INP2", "INP3"
+};
+
 static const char * const rdac3_mux_text[] = {
 	"RX1", "RX3"
 };
 
+static const struct soc_enum adc2_enum =
+	SOC_ENUM_SINGLE(WCD937X_TX_NEW_TX_CH2_SEL, 7,
+			ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
+
 static const struct soc_enum rdac3_enum =
 	SOC_ENUM_SINGLE(WCD937X_DIGITAL_CDC_EAR_PATH_CTL, 0,
 			ARRAY_SIZE(rdac3_mux_text), rdac3_mux_text);
 
+static const struct snd_kcontrol_new tx_adc2_mux = SOC_DAPM_ENUM("ADC2 MUX Mux", adc2_enum);
+
 static const struct snd_kcontrol_new rx_rdac3_mux = SOC_DAPM_ENUM("RDAC3_MUX Mux", rdac3_enum);
 
 static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
 	/* Input widgets */
+	SND_SOC_DAPM_INPUT("AMIC1"),
+	SND_SOC_DAPM_INPUT("AMIC2"),
+	SND_SOC_DAPM_INPUT("AMIC3"),
 	SND_SOC_DAPM_INPUT("IN1_HPHL"),
 	SND_SOC_DAPM_INPUT("IN2_HPHR"),
 	SND_SOC_DAPM_INPUT("IN3_AUX"),
 
+	/* TX widgets */
+	SND_SOC_DAPM_ADC_E("ADC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("ADC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd937x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("ADC1 REQ", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd937x_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2 REQ", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd937x_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &tx_adc2_mux),
+
+	/* TX mixers */
+	SND_SOC_DAPM_MIXER_E("ADC1_MIXER", SND_SOC_NOPM, 0, 0,
+			     adc1_switch, ARRAY_SIZE(adc1_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC2_MIXER", SND_SOC_NOPM, 1, 0,
+			     adc2_switch, ARRAY_SIZE(adc2_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+
+	/* MIC_BIAS widgets */
+	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+
 	SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0,
 			    wcd937x_codec_enable_vdd_buck,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
@@ -2007,11 +2312,101 @@ static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
 			   hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
 
+	/* TX output widgets */
+	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("WCD_TX_OUTPUT"),
+
 	/* RX output widgets */
 	SND_SOC_DAPM_OUTPUT("EAR"),
 	SND_SOC_DAPM_OUTPUT("AUX"),
 	SND_SOC_DAPM_OUTPUT("HPHL"),
 	SND_SOC_DAPM_OUTPUT("HPHR"),
+
+	/* MIC_BIAS pull up widgets */
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, 0, 0,
+			    wcd937x_codec_enable_micbias_pullup,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_widget wcd9375_dapm_widgets[] = {
+	/* Input widgets */
+	SND_SOC_DAPM_INPUT("AMIC4"),
+
+	/* TX widgets */
+	SND_SOC_DAPM_ADC_E("ADC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd937x_codec_enable_adc,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER_E("ADC3 REQ", SND_SOC_NOPM, 0, 0,
+			     NULL, 0, wcd937x_enable_req,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_ADC_E("DMIC1", NULL, SND_SOC_NOPM, 0, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC2", NULL, SND_SOC_NOPM, 1, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC3", NULL, SND_SOC_NOPM, 2, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC4", NULL, SND_SOC_NOPM, 3, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC5", NULL, SND_SOC_NOPM, 4, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_ADC_E("DMIC6", NULL, SND_SOC_NOPM, 5, 0,
+			   wcd937x_codec_enable_dmic,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* TX mixer widgets */
+	SND_SOC_DAPM_MIXER_E("DMIC1_MIXER", SND_SOC_NOPM, 0,
+			     0, dmic1_switch, ARRAY_SIZE(dmic1_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC2_MIXER", SND_SOC_NOPM, 1,
+			     0, dmic2_switch, ARRAY_SIZE(dmic2_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC3_MIXER", SND_SOC_NOPM, 2,
+			     0, dmic3_switch, ARRAY_SIZE(dmic3_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC4_MIXER", SND_SOC_NOPM, 3,
+			     0, dmic4_switch, ARRAY_SIZE(dmic4_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC5_MIXER", SND_SOC_NOPM, 4,
+			     0, dmic5_switch, ARRAY_SIZE(dmic5_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("DMIC6_MIXER", SND_SOC_NOPM, 5,
+			     0, dmic6_switch, ARRAY_SIZE(dmic6_switch),
+			     wcd937x_tx_swr_ctrl, SND_SOC_DAPM_PRE_PMU |
+			     SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER_E("ADC3_MIXER", SND_SOC_NOPM, 2, 0, adc3_switch,
+			     ARRAY_SIZE(adc3_switch), wcd937x_tx_swr_ctrl,
+			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* Output widgets */
+	SND_SOC_DAPM_OUTPUT("DMIC1_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC2_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC3_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC4_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC5_OUTPUT"),
+	SND_SOC_DAPM_OUTPUT("DMIC6_OUTPUT"),
 };
 
 static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
@@ -2143,6 +2538,15 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
 	disable_irq_nosync(wcd937x->aux_pdm_wd_int);
 
+	if (wcd937x->chipid == CHIPID_WCD9375) {
+		ret = snd_soc_dapm_new_controls(dapm, wcd9375_dapm_widgets,
+						ARRAY_SIZE(wcd9375_dapm_widgets));
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to add snd_ctls\n");
+			return ret;
+		}
+	}
+
 	ret = wcd937x_mbhc_init(component);
 	if (ret)
 		dev_err(component->dev, "mbhc initialization failed\n");
-- 
2.25.1


