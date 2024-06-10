Return-Path: <linux-arm-msm+bounces-22243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE734902CDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 02:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DC6AB23801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5FC156251;
	Mon, 10 Jun 2024 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IAm3aPGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5896D152E17;
	Mon, 10 Jun 2024 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718063925; cv=none; b=bmVvzUV9mKuwhAfUXIv3HMmXeQdrHnkRjsmVWmBJUAjFYAjNyWp8Lk97TXkvEiCB9DQk6gBXVpdv1dt8rby776Ybt5tTn34yBDccoex0U9DWC9CrKwCT40kHMrTa3+0HihubpN0A53pCpPbb86eXtNB5tGUEZgPnG1RfEFzSgIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718063925; c=relaxed/simple;
	bh=rXPLEQhsF6LjB8jiAx2EEDlxLNJvrGko5bNmlAsstP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVBSuFP3U2N3RR9GcswPl7dLHg9466x3StdovzuHm49L8OSAgF4Qx6yadSGgXnUjWTaiop7RqkXz6huscFvDw6IaazUxnMP8tq7GWtzkjGBEBWqg7rjw2jpTbHeZrvC+9Ogz0d1LC/+aJXdBhjFO6miLJ++vuCeEXsM+wZalx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IAm3aPGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AE1OHJ008099;
	Mon, 10 Jun 2024 23:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8kOIijrR+xsbvX9jT6KejS/F
	U9YuWlz3cXkjI1zjiy4=; b=IAm3aPGYa2A13VEGF9pbguOb4F9fySIy+S7a4Qgv
	d75rLxxsGJbY5Tzz5CEFPagxHu5lCe2R3prpREQuTwirl1GUeulHAjZI0bLxnPlP
	jJnwbrByLEDATVYLEGRIb8nVk7SJdYfE9MiESeOXPR/bxPVcS1drdgiBXwfJ9LDK
	biPhVvcD52Cfx8Le905+Y5N7JVuQNbLssMpRzO5yBx2bFlPsDxtSn8CGoDF0RaL+
	LzYQivZ9YuuBQabc0AYkwaZCdT6Y4XLv7mKpJygThazbrjDLEwuPOfG8xzNEdefR
	swtoT+0Q2yzN13A008tf+RT+cT2CpivkICp9TBjjuGa2Jw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmvtya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ANwQtq001593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 16:58:26 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v23 26/32] ASoC: qcom: qdsp6: Add headphone jack for offload connection status
Date: Mon, 10 Jun 2024 16:58:02 -0700
Message-ID: <20240610235808.22173-27-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240610235808.22173-1-quic_wcheng@quicinc.com>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KpPm8rpuz9wEj8b4IZLETtBx3nWc4Wrv
X-Proofpoint-ORIG-GUID: KpPm8rpuz9wEj8b4IZLETtBx3nWc4Wrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_07,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100176

The headphone jack framework has a well defined infrastructure for
notifying userspace entities through input devices.  Expose a jack device
that carries information about if an offload capable device is connected.
Applications can further identify specific offloading information through
other SND kcontrols.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/Kconfig             |  5 +++
 sound/soc/qcom/Makefile            |  2 ++
 sound/soc/qcom/qdsp6/q6usb.c       | 40 +++++++++++++++++++++
 sound/soc/qcom/sm8250.c            | 23 +++++++++++-
 sound/soc/qcom/usb_offload_utils.c | 56 ++++++++++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h | 29 ++++++++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/qcom/usb_offload_utils.c
 create mode 100644 sound/soc/qcom/usb_offload_utils.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a1beafe2b1dd..e5284a93cf9a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -118,9 +118,14 @@ config SND_SOC_QDSP6_PRM
 	tristate
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
+config SND_SOC_QCOM_OFFLOAD_UTILS
+	tristate
+
 config SND_SOC_QDSP6_USB
     tristate "SoC ALSA USB offloading backing for QDSP6"
     depends on SND_SOC_USB
+    select SND_SOC_QCOM_OFFLOAD_UTILS
+
     help
       Adds support for USB offloading for QDSP6 ASoC
       based platform sound cards.  This will enable the
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 16db7b53ddac..985ce2ae286b 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -30,6 +30,7 @@ snd-soc-sc8280xp-y := sc8280xp.o
 snd-soc-qcom-common-y := common.o
 snd-soc-qcom-sdw-y := sdw.o
 snd-soc-x1e80100-y := x1e80100.o
+snd-soc-qcom-offload-utils-objs := usb_offload_utils.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -42,6 +43,7 @@ obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
 obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 obj-$(CONFIG_SND_SOC_X1E80100) += snd-soc-x1e80100.o
+obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 2715ac920273..8a29a5bd1479 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 
 #include <sound/asound.h>
+#include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/q6usboffload.h>
@@ -38,6 +39,7 @@ struct q6usb_status {
 struct q6usb_port_data {
 	struct q6afe_usb_cfg usb_cfg;
 	struct snd_soc_usb *usb;
+	struct snd_soc_jack *hs_jack;
 	struct q6usb_offload priv;
 	struct mutex mutex;
 	unsigned long available_card_slot;
@@ -252,6 +254,9 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 
 	mutex_lock(&data->mutex);
 	if (connected) {
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack->jack, 1);
+
 		/*
 		 * Select the latest USB headset plugged in, if session is
 		 * idle, and if no index selected by the kcontrol.
@@ -274,11 +279,45 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 					ffs(data->available_card_slot) - 1 : 0;
 			data->sel_pcm_idx = 0;
 		}
+
+		if (!data->available_card_slot)
+			snd_jack_report(data->hs_jack->jack, 0);
 	}
 	mutex_unlock(&data->mutex);
 
 	return 0;
 }
+static void q6usb_component_disable_jack(struct q6usb_port_data *data)
+{
+	/* Offload jack has already been disabled */
+	if (!data->hs_jack)
+		return;
+
+	snd_jack_report(data->hs_jack->jack, 0);
+	data->hs_jack = NULL;
+}
+
+static void q6usb_component_enable_jack(struct q6usb_port_data *data,
+				struct snd_soc_jack *jack)
+{
+	snd_jack_report(jack->jack, data->available_card_slot ? 1 : 0);
+	data->hs_jack = jack;
+}
+
+static int q6usb_component_set_jack(struct snd_soc_component *component,
+			struct snd_soc_jack *jack, void *priv)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+
+	mutex_lock(&data->mutex);
+	if (jack)
+		q6usb_component_enable_jack(data, jack);
+	else
+		q6usb_component_disable_jack(data);
+	mutex_unlock(&data->mutex);
+
+	return 0;
+}
 
 static int q6usb_component_probe(struct snd_soc_component *component)
 {
@@ -309,6 +348,7 @@ static void q6usb_component_remove(struct snd_soc_component *component)
 
 static const struct snd_soc_component_driver q6usb_dai_component = {
 	.probe = q6usb_component_probe,
+	.set_jack = q6usb_component_set_jack,
 	.remove = q6usb_component_remove,
 	.name = "q6usb-dai-component",
 	.dapm_widgets = q6usb_dai_widgets,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..a132a814ceb4 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "usb_offload_utils.h"
 #include "sdw.h"
 
 #define DRIVER_NAME		"sm8250"
@@ -22,14 +23,33 @@ struct sm8250_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack usb_offload_jack;
+	bool usb_offload_jack_setup;
 	bool jack_setup;
 };
 
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (cpu_dai->id == USB_RX)
+		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
+						&data->usb_offload_jack_setup);
+	else
+		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	return ret;
+}
+
+static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	if (cpu_dai->id == USB_RX)
+		qcom_snd_usb_offload_jack_remove(rtd, &data->usb_offload_jack_setup);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -129,6 +149,7 @@ static void sm8250_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = sm8250_snd_init;
+			link->exit = sm8250_snd_exit;
 			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
 			link->ops = &sm8250_be_ops;
 		}
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
new file mode 100644
index 000000000000..2d35d87d1519
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/module.h>
+#include <sound/jack.h>
+#include <sound/soc-usb.h>
+
+#include "usb_offload_utils.h"
+
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (!*jack_setup) {
+		ret = snd_soc_usb_setup_offload_jack(codec_dai->component, jack);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret = 0;
+
+	if (cpu_dai->id != USB_RX)
+		return -EINVAL;
+
+	if (*jack_setup) {
+		ret = snd_soc_usb_disable_offload_jack(codec_dai->component);
+		if (ret)
+			return ret;
+	}
+
+	*jack_setup = false;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
+MODULE_DESCRIPTION("ASoC Q6 USB offload controls");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
new file mode 100644
index 000000000000..d44f78569b47
--- /dev/null
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __QCOM_SND_USB_OFFLOAD_UTILS_H__
+#define __QCOM_SND_USB_OFFLOAD_UTILS_H__
+
+#include <sound/soc.h>
+
+#if IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS)
+int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
+
+int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+					bool *jack_setup);
+#else
+static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	return -ENODEV;
+}
+
+static inline int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
+							bool *jack_setup)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
+#endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */

