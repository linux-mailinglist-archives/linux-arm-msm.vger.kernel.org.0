Return-Path: <linux-arm-msm+bounces-20337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70C48CDE23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 591AF287A58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992313D0D9;
	Fri, 24 May 2024 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ROdIYsQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0879C8;
	Fri, 24 May 2024 00:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716509483; cv=none; b=rC2q0ZZoDHQDreY1/g0Nvo23d/dB9cEBHbahbQ4tXS8CYYBzkD7/LTrxdU5TFm+GgWcFqaZeappkpVa6a+Fa4qo3KtAGL9Ij6XgEEGgZ2XpfEPBYInzKvssvZ2qeth7kaiYyqdYeeG7oLhNBzNWbZ/CQMfxaM8J9x9JfZuPmfpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716509483; c=relaxed/simple;
	bh=eq9B7wvPHHy8ITaHjmVpk1TMWrJ8tV6O5YMzPlM5Tn4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=myhKMwcN5ThEB2NiKSmwf6w8Iu1VNyKgp0k1C+1YhT4uBfbjIw8ZnC3v756hoXv7SL+9XtAK1Hi3bZp3jnANKbGl+1nY4f/ztsU7d70dOHkE47OqWdYR8yAwQzwVViqjYIBwY1jTfCPrN7omSsEXOo7ETFhbHEXAjo8Zmn/ei5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ROdIYsQ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPDef004294;
	Fri, 24 May 2024 00:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ljRFKHzHBdtdLh7sNzOKjhzu
	HqqNrvTbosJU34+TiKU=; b=ROdIYsQ8UR93u6iQB7PMTGsqt9h7pxHd++ZNbYd9
	bAQjdEs9a0K19EQicM+ZR3WmNRW9P/rJXbVfVVzxdFqRQUp1G4V2PTn0K5yq+sRF
	ZG4ofjGMMsQbcRMC/3TmvrlunlzQMkybE2XdNTO2sVpwjGyzCVX9WDdjTbrEzbXQ
	Rf0sotWfYskcB3RjWVH4DpmCKu47K5kfn63LWy1DjhuDoaPKzWK7/jREnnTMuLjl
	Zlg+j/Drxkyp62kgukB2Cfg0q6fpMvRbruUb+J/SOD5PbHCInxXJ8N73dJTft7y2
	y1dHIzXpiT2SjQLET73kEa1OO4PZrDuk0WvTuU0p8yGvjg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaabq0q44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O0B2Pq008082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:02 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 17:11:02 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v22 27/38] ASoC: Introduce SND kcontrols to select sound card and PCM device
Date: Thu, 23 May 2024 17:10:32 -0700
Message-ID: <20240524001043.10141-28-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524001043.10141-1-quic_wcheng@quicinc.com>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g-vcBfm_Z6eioVq6b0idSWfPht9_7Cvy
X-Proofpoint-ORIG-GUID: g-vcBfm_Z6eioVq6b0idSWfPht9_7Cvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405230166

Add SND kcontrol to SOC USB, which will allow for userpsace to determine
which USB card number and PCM device to offload.  This allows for userspace
to potentially tag an alternate path for a specific USB SND card and PCM
device.  Previously, control was absent, and the offload path would be
enabled on the last USB SND device which was connected.  This logic will
continue to be applicable if no mixer input is received for specific device
selection.

An example to configure the offload device using tinymix:
tinymix -D 0 set 'USB Offload Playback Route Card Select' 1
tinymix -D 0 set 'USB Offload Playback Route PCM Select' 0

The above command will configure the offload path to utilize card#1 and PCM
stream#0.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  16 ++++
 sound/soc/soc-usb.c     | 167 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 183 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 4b1b992c8b27..495de5143db8 100644
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
index 3bb66808f196..ef84957014dd 100644
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
@@ -57,6 +60,162 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 	return ctx ? ctx : NULL;
 }
 
+/* SOC USB sound kcontrols */
+static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
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
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++)
+		ucontrol->value.integer.value[i] = -1;
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
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
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
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++)
+		ucontrol->value.integer.value[i] = -1;
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
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
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
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = ctx->num_supported_streams;
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
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
@@ -152,6 +311,12 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
  */
 void snd_soc_usb_add_port(struct snd_soc_usb *usb)
 {
+	int ret;
+
+	ret = snd_soc_usb_control_init(usb);
+	if (ret < 0)
+		return;
+
 	mutex_lock(&ctx_mutex);
 	list_add_tail(&usb->list, &usb_ctx_list);
 	mutex_unlock(&ctx_mutex);
@@ -178,6 +343,8 @@ void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
 		}
 	}
 	mutex_unlock(&ctx_mutex);
+
+	snd_soc_usb_control_remove(usb);
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
 

