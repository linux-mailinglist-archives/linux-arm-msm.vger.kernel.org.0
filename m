Return-Path: <linux-arm-msm+bounces-18610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCE8B2B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 23:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0900E1F2731D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 21:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751EC178CC1;
	Thu, 25 Apr 2024 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HxdgGHT9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D9171663;
	Thu, 25 Apr 2024 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081933; cv=none; b=ou+7iKnkyh4Ftj4dn0UTVcXMm0uMMstYy0xOfmRBMKIX4rdE5RiFIpHJm4IZrP8O6AYAFrpmjKhboj/dvp6vqtHy1bDAP/7G/eKbvuOXjCNz7YndrvIOK68FhEdXGrBRmWAFB8mRABkbb2tWUDj3G5TAWJquytwDTpDoV4oYcVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081933; c=relaxed/simple;
	bh=mNGYCfbVjv1RkgO1ltuiv0AvcvnAFu5EcL4uKtFiNjo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9IEcIj39EM5VwcPGn4S7fYNbnY9H2i6jZL9PKXf8qe39fD+Y4e4C5aX2ZR9ZfUrbDskC0OsKHPxKDxSeQ/1MR4XFcApYTcIAoBHwxBYLDzVoyR1rM+KKBGESuUjyJTTLwHkFMG2CSIo8xRYhg9dRanMM0oR6unF7R6je9eT/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HxdgGHT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PKHkUn001483;
	Thu, 25 Apr 2024 21:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Rkv9f88Rww7ljRWsPJlk
	3Lnpj1OGecXVn5H1NkvCJBM=; b=HxdgGHT9LNuyrWOGhgV4wlvWMYZ3mIGlBf3h
	KieT4HW4K1JYTkZvkwCKbe1BOYDCXW2bE4oLe3BRjywyYHS8/4ahBKarsRXKDBAN
	GtpZy0MfAKoOOqGgz0L43v+s1nS5nvBvzML5Ei6PmQo6J1/DqoqfLYPNbUyW3wFJ
	D/m3w6E2cZPxMKwpJaS1lmzklOTZC37+IJZSztP9TVH6uH1EG+PaZRzB8wGZzKEG
	iVXulGOA1GPTtsjy2Pe2xWScf37CFE72NNJYbmEQLNXzLbqG92Bqm0nCA8Fta2HM
	zmbroPwydwcGYaWqAsc+YDcBiULwkS/ELeCc+2bnZmHA+AKS0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqqtf15jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLpjgt024619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:51:45 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 14:51:44 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v20 29/41] ASoC: Introduce SND kcontrols to select sound card and PCM device
Date: Thu, 25 Apr 2024 14:51:13 -0700
Message-ID: <20240425215125.29761-30-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425215125.29761-1-quic_wcheng@quicinc.com>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 9rXCgfF8ot51FXzbzvtJMNMc9aZB3v_6
X-Proofpoint-ORIG-GUID: 9rXCgfF8ot51FXzbzvtJMNMc9aZB3v_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404250159

Add SND kcontrol to SOC USB, which will allow for userpsace to determine
which USB card number and PCM device to offload.  This allows for userspace
to potentially tag an alternate path for a specific USB SND card and PCM
device.  Previously, control was absent, and the offload path would be
enabled on the last USB SND device which was connected.  This logic will
continue to be applicable if no mixer input is received for specific device
selection.

An example to configure the offload device using tinymix:
tinymix -D 0 set 'USB Offload Playback Route Select' 1 0

The above command will configure the offload path to utilize card#1 and PCM
stream#0.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  16 ++++
 sound/soc/soc-usb.c     | 157 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 8f2d3064b520..18cdc59df9aa 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -6,6 +6,12 @@
 #ifndef __LINUX_SND_SOC_USB_H
 #define __LINUX_SND_SOC_USB_H
 
+enum snd_soc_usb_kctl {
+	SND_SOC_USB_KCTL_CARD_ROUTE,
+	SND_SOC_USB_KCTL_PCM_ROUTE,
+	SND_SOC_USB_KCTL_MAX,
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -24,16 +30,26 @@ struct snd_soc_usb_device {
  * struct snd_soc_usb
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
+ * @kctl - list of kcontrols created
  * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
+ * @put_offload_dev - callback to select USB sound card/PCM device
+ * @get_offload_dev - callback to fetch selected USB sound card/PCM device
  * @priv_data - driver data
  **/
 struct snd_soc_usb {
 	struct list_head list;
 	struct snd_soc_component *component;
+	struct snd_kcontrol *kctl[SND_SOC_USB_KCTL_MAX];
 	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
+	int (*put_offload_dev)(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol,
+			       enum snd_soc_usb_kctl type);
+	int (*get_offload_dev)(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol,
+			       enum snd_soc_usb_kctl type);
 	void *priv_data;
 };
 
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index bc77204fd2db..ade09b416d45 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -15,6 +15,9 @@ static struct device_node *snd_soc_find_phandle(struct device *dev)
 {
 	struct device_node *node;
 
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
 	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);
 	if (!node)
 		return ERR_PTR(-ENODEV);
@@ -38,6 +41,152 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device_node *node)
 	return NULL;
 }
 
+/* SOC USB sound kcontrols */
+static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->put_offload_dev)
+		ret = ctx->put_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_PCM_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+
+static int soc_usb_get_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	ucontrol->value.integer.value[0] = -1;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->get_offload_dev)
+		ret = ctx->get_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_PCM_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+
+}
+
+static int soc_usb_put_offload_card_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->put_offload_dev)
+		ret = ctx->put_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_CARD_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+}
+
+static int soc_usb_get_offload_card_dev(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_find_usb_ctx(component->dev->of_node);
+	int ret = 0;
+
+	ucontrol->value.integer.value[0] = -1;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx && ctx->get_offload_dev)
+		ret = ctx->get_offload_dev(kcontrol, ucontrol,
+						SND_SOC_USB_KCTL_CARD_ROUTE);
+	mutex_unlock(&ctx_mutex);
+
+	return ret;
+
+}
+
+static int soc_usb_offload_pcm_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -1;
+	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
+	uinfo->value.integer.max = 0xff;
+
+	return 0;
+}
+
+static int soc_usb_offload_card_info(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = -1;
+	uinfo->value.integer.max = SNDRV_CARDS;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new soc_usb_kcontrols[] = {
+	[SND_SOC_USB_KCTL_CARD_ROUTE] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.name = "USB Offload Playback Route Card Select",
+		.info = soc_usb_offload_card_info,
+		.get = soc_usb_get_offload_card_dev,
+		.put = soc_usb_put_offload_card_dev,
+	},
+	[SND_SOC_USB_KCTL_PCM_ROUTE] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.name = "USB Offload Playback Route PCM Select",
+		.info = soc_usb_offload_pcm_info,
+		.get = soc_usb_get_offload_pcm_dev,
+		.put = soc_usb_put_offload_pcm_dev,
+	},
+};
+
+static int snd_soc_usb_control_remove(struct snd_soc_usb *usb)
+{
+	struct snd_soc_component *component = usb->component;
+	int i;
+
+	for (i = 0; i < SND_SOC_USB_KCTL_MAX; i++) {
+		if (usb->kctl[i]) {
+			snd_ctl_remove(component->card->snd_card,
+					usb->kctl[i]);
+			snd_ctl_free_one(usb->kctl[i]);
+			usb->kctl[i] = NULL;
+		}
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_control_init(struct snd_soc_usb *usb)
+{
+	struct snd_soc_component *component = usb->component;
+	int ret;
+	int i;
+
+	for (i = 0; i < SND_SOC_USB_KCTL_MAX; i++) {
+		usb->kctl[i] = snd_ctl_new1(&soc_usb_kcontrols[i], component);
+		ret = snd_ctl_add(component->card->snd_card, usb->kctl[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
 /**
  * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
  * @playback: direction of audio stream
@@ -158,6 +307,12 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
  */
 int snd_soc_usb_add_port(struct snd_soc_usb *usb)
 {
+	int ret;
+
+	ret = snd_soc_usb_control_init(usb);
+	if (ret < 0)
+		return ret;
+
 	mutex_lock(&ctx_mutex);
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
@@ -187,6 +342,8 @@ int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
 	}
 	mutex_unlock(&ctx_mutex);
 
+	snd_soc_usb_control_remove(usb);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);

