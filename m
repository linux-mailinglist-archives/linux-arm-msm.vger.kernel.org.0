Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 732A66B16F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 00:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjCHX6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 18:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjCHX63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 18:58:29 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B626783E;
        Wed,  8 Mar 2023 15:58:27 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 328CnQeB009701;
        Wed, 8 Mar 2023 23:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yjp4aqhIqwGAO8kWmAEbQXlwYvpNOdYRm2TambEfhsg=;
 b=ItKUJcXxAjxmFkwL7n4X77dPq+pTFJROPyuuGZwoiYuraggdYgGaIwFLYOi5qEdvgk/n
 6hVLM4eM4kY3TViGUbp2pKEo+XTquJhBPWVax71X3Rn3K2WdqPOgbKnywjzwvw5J3ON4
 Q2pjYzTczbVBRATHoq6tXXwjNz9gwOU8B6+JmVX//bGE4vESAlLcSF1vQQBg73GxxVe0
 QdTxpmerWHGeN9M/pMH0v5kgOGPKSiwlDmrD+NNx8prazZSQI/QmmFI3Pq2VHbLERCuR
 8Fww2FGYMwXbC+1oJfQIyQzMevlKodjQMZ2sL0P3O6EzYX352c60dpCbjrYcOn6JJqsb rA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p6fetu62p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 08 Mar 2023 23:58:08 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 328Nw7MV019884
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 8 Mar 2023 23:58:07 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 8 Mar 2023 15:58:06 -0800
From:   Wesley Cheng <quic_wcheng@quicinc.com>
To:     <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v3 08/28] ASoC: qcom: Add USB backend ASoC driver for Q6
Date:   Wed, 8 Mar 2023 15:57:31 -0800
Message-ID: <20230308235751.495-9-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230308235751.495-1-quic_wcheng@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E7dq2VQg-pYpvXmYPQowWYk1JPRLTBg6
X-Proofpoint-ORIG-GUID: E7dq2VQg-pYpvXmYPQowWYk1JPRLTBg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080200
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Create a USB BE component that will register a new USB port to the ASoC USB
framework.  This will handle determination on if the requested audio
profile is supported by the USB device currently selected.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/q6usboffload.h  |  20 ++++
 sound/soc/qcom/Kconfig        |   4 +
 sound/soc/qcom/qdsp6/Makefile |   1 +
 sound/soc/qcom/qdsp6/q6usb.c  | 208 ++++++++++++++++++++++++++++++++++
 4 files changed, 233 insertions(+)
 create mode 100644 include/sound/q6usboffload.h
 create mode 100644 sound/soc/qcom/qdsp6/q6usb.c

diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
new file mode 100644
index 000000000000..4fb1912d9f55
--- /dev/null
+++ b/include/sound/q6usboffload.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * linux/sound/q6usboffload.h -- QDSP6 USB offload
+ *
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/**
+ * struct q6usb_offload
+ * @dev - dev handle to usb be
+ * @sid - streamID for iommu
+ * @intr_num - usb interrupter number
+ * @domain - allocated iommu domain
+ **/
+struct q6usb_offload {
+	struct device *dev;
+	long long sid;
+	u32 intr_num;
+	struct iommu_domain *domain;
+};
diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e7b00d1d9e99..bb285af6bb04 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -114,6 +114,9 @@ config SND_SOC_QDSP6_APM
 config SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 	tristate
 
+config SND_SOC_QDSP6_USB
+	tristate
+
 config SND_SOC_QDSP6_PRM
 	tristate
 	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
@@ -134,6 +137,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_QDSP6_APM
 	select SND_SOC_QDSP6_PRM
+	select SND_SOC_QDSP6_USB
 	help
 	 To add support for MSM QDSP6 Soc Audio.
 	 This will enable sound soc platform specific
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 3963bf234664..c9457ee898d0 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI) += q6apm-lpass-dais.o
 obj-$(CONFIG_SND_SOC_QDSP6_PRM) += q6prm.o
 obj-$(CONFIG_SND_SOC_QDSP6_PRM_LPASS_CLOCKS) += q6prm-clocks.o
+obj-$(CONFIG_SND_SOC_QDSP6_USB) += q6usb.o
diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
new file mode 100644
index 000000000000..3d480550b3f3
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/iommu.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
+
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-usb.h>
+#include <sound/pcm_params.h>
+#include <sound/asound.h>
+#include <sound/q6usboffload.h>
+
+#include "q6dsp-lpass-ports.h"
+#include "q6afe.h"
+
+#define SID_MASK	0xF
+
+struct q6usb_port_data {
+	struct q6afe_usb_cfg usb_cfg;
+	struct snd_soc_usb *usb;
+	struct q6usb_offload priv;
+	int active_idx;
+};
+
+static const struct snd_soc_dapm_widget q6usb_dai_widgets[] = {
+	SND_SOC_DAPM_HP("USB_RX_BE", NULL),
+};
+
+static const struct snd_soc_dapm_route q6usb_dapm_routes[] = {
+	{"USB Playback", NULL, "USB_RX_BE"},
+};
+
+static int q6usb_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
+{
+	return 0;
+}
+static const struct snd_soc_dai_ops q6usb_ops = {
+	.hw_params = q6usb_hw_params,
+};
+
+static struct snd_soc_dai_driver q6usb_be_dais[] = {
+	{
+		.playback = {
+			.stream_name = "USB BE RX",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
+				SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+				SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
+				SNDRV_PCM_RATE_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
+				SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
+				SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
+				SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
+			.channels_min = 1,
+			.channels_max = 2,
+			.rate_max =     192000,
+			.rate_min =	8000,
+		},
+		.id = USB_RX,
+		.name = "USB_RX_BE",
+		.ops = &q6usb_ops,
+	},
+};
+
+static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *component,
+					const struct of_phandle_args *args,
+					const char **dai_name)
+{
+	int id = args->args[0];
+	int ret = -EINVAL;
+	int i;
+
+	for (i = 0; i  < ARRAY_SIZE(q6usb_be_dais); i++) {
+		if (q6usb_be_dais[i].id == id) {
+			*dai_name = q6usb_be_dais[i].name;
+			ret = 0;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
+			int connected)
+{
+	struct snd_soc_dapm_context *dapm;
+	struct q6usb_port_data *data;
+
+	dapm = snd_soc_component_get_dapm(usb->component);
+	data = dev_get_drvdata(usb->component->dev);
+
+	if (connected) {
+		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
+		/* We only track the latest USB headset plugged in */
+		data->active_idx = card_idx;
+	} else {
+		snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
+	}
+	snd_soc_dapm_sync(dapm);
+
+	return 0;
+}
+
+static int q6usb_component_probe(struct snd_soc_component *component)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+
+	snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
+	snd_soc_dapm_sync(dapm);
+
+	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);
+	if (IS_ERR(data->usb)) {
+		dev_err(component->dev, "failed to add usb port\n");
+		return -ENODEV;
+	}
+
+	data->usb->component = component;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver q6usb_dai_component = {
+	.probe = q6usb_component_probe,
+	.name = "q6usb-dai-component",
+	.dapm_widgets = q6usb_dai_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(q6usb_dai_widgets),
+	.dapm_routes = q6usb_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(q6usb_dapm_routes),
+	.of_xlate_dai_name = q6usb_audio_ports_of_xlate_dai_name,
+};
+
+static int q6usb_dai_dev_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct q6usb_port_data *data;
+	struct device *dev = &pdev->dev;
+	struct of_phandle_args args;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(node, "qcom,usb-audio-intr-num",
+				&data->priv.intr_num);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to read intr num.\n");
+		return ret;
+	}
+
+	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
+	if (ret < 0)
+		data->priv.sid = -1;
+	else
+		data->priv.sid = args.args[0] & SID_MASK;
+
+	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
+
+	data->priv.dev = dev;
+	dev_set_drvdata(dev, data);
+
+	ret = devm_snd_soc_register_component(dev, &q6usb_dai_component,
+					q6usb_be_dais, ARRAY_SIZE(q6usb_be_dais));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int q6usb_dai_dev_remove(struct platform_device *pdev)
+{
+	snd_soc_usb_remove_port(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id q6usb_dai_device_id[] = {
+	{ .compatible = "qcom,q6usb-dais" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6usb_dai_device_id);
+
+static struct platform_driver q6usb_dai_platform_driver = {
+	.driver = {
+		.name = "q6usb-dai",
+		.of_match_table = of_match_ptr(q6usb_dai_device_id),
+	},
+	.probe = q6usb_dai_dev_probe,
+	.remove = q6usb_dai_dev_remove,
+};
+module_platform_driver(q6usb_dai_platform_driver);
+
+MODULE_DESCRIPTION("Q6 USB backend dai driver");
+MODULE_LICENSE("GPL");
