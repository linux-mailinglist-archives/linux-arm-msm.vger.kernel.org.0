Return-Path: <linux-arm-msm+bounces-20342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832108CDE3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4B8B22608
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE824AECA;
	Fri, 24 May 2024 00:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/CDhL5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9402417578;
	Fri, 24 May 2024 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716509483; cv=none; b=qmSbI2WaiSCsHBDPhKDvaF/i1H5tkW3V62CLuvmn7Fhd+Rjhd1AdiHlQRf2KzQlYUOD+ibORBJffp784ae1Ep+0HCVYFLnFXrz8woY/MuRPrPM++OpD2GyV00COirIOb3Sa5V3kL7CedQMMZ2JNOE/3+9waS4sL4Ne2la32iVFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716509483; c=relaxed/simple;
	bh=eMS1NYlWBx4Xr+jDx9r6ZlaT5PUaCkyEkKtgaXZKm/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VGtihSwuGGoWOQpFTsNk2vaGD9kw766lsJkH3BdH0T8StG6tqO+5VFbXJTl1ghP8sR7yn1f8Zq1nuWMbGDfXudFqDxV18ZnuaHwGsNNyZ3odNjZDkk5RkkiuSoH0uCh7t2qtEXcX6LO5bIaVpcBzuqfcGyQaFTBIl6+N8m/N360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/CDhL5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPEdW012063;
	Fri, 24 May 2024 00:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IXJO7yXzSLsMU/g4w222/gEb
	HXiu6OkBLpbLYr8D3Hs=; b=K/CDhL5VnHKMHDsQiwEKdUqgHuzu5t9qMYJOe1ZW
	LtLtRwFGDsq1br5dK6UNrURncwRto+YBG1EbD+eCwrLuz0CZ/QM8lXjputTcdapi
	IHtSuhCzrZIIXTS1jZPch49k0rgREfFUb2sqOWtvXZwWUV77QC02IsbhGfUEORZZ
	QGaZp1YOPJrmMdcpaYxQlI782D+fIqzeRejwkV4DnYA2h09FqTaeeNOxY1O+C4ER
	PDEqbW20n38ElODCnJthDF1FK1KYBDRehk0zZEyZ1WnZADJ2urnxtRIP54Fu+821
	CfnERkC3BkBQBfsfXgX5TIEfQrRr1tltuMqWpbs1FVZcVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa97rqnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O0B3us009888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:03 GMT
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
Subject: [PATCH v22 29/38] ASoC: Introduce SND kcontrols to track USB offloading state
Date: Thu, 23 May 2024 17:10:34 -0700
Message-ID: <20240524001043.10141-30-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: IEaFK964PW3W0yNznEnbzlIEmVjLNAM7
X-Proofpoint-ORIG-GUID: IEaFK964PW3W0yNznEnbzlIEmVjLNAM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405230166

Expose helpers in the SoC USB layer so components can update and keep track
of the offloading sessions.  This exposes a kcontrol to userspace, so that
applications can be aware of what the current USB offloading status is.
An example output using tinymix is:

USB offloading idle:
tinymix -D 0 get 'USB Offload Playback Route Card Status'
-->-1 (range -1->32)
tinymix -D 0 get 'USB Offload Playback Route PCM Status'
-->-1 (range -1->255)

USB offloading active(USB card#1 pcm#0):
tinymix -D 0 get 'USB Offload Playback Route Card Status'
-->1 (range -1->32)
tinymix -D 0 get 'USB Offload Playback Route PCM Status'
-->0 (range -1->255)

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  46 ++++++++++
 sound/soc/soc-usb.c     | 193 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 239 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 495de5143db8..c5aecdd0b006 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -9,9 +9,29 @@
 enum snd_soc_usb_kctl {
 	SND_SOC_USB_KCTL_CARD_ROUTE,
 	SND_SOC_USB_KCTL_PCM_ROUTE,
+	SND_SOC_USB_KCTL_CARD_STATUS,
+	SND_SOC_USB_KCTL_PCM_STATUS,
 	SND_SOC_USB_KCTL_MAX,
 };
 
+enum snd_soc_usb_dai_state {
+	SND_SOC_USB_IDLE,
+	SND_SOC_USB_PREPARED,
+	SND_SOC_USB_RUNNING,
+};
+
+/**
+ * struct snd_soc_usb_session
+ * @active_card_idx - active offloaded sound card
+ * @active_pcm_idx - active offloaded PCM device
+ * @state - USB BE DAI link PCM state
+ */
+struct snd_soc_usb_session {
+	int active_card_idx;
+	int active_pcm_idx;
+	enum snd_soc_usb_dai_state state;
+};
+
 /**
  * struct snd_soc_usb_device
  * @card_idx - sound card index associated with USB device
@@ -31,6 +51,7 @@ struct snd_soc_usb_device {
  * @list - list head for SND SOC struct list
  * @component - reference to ASoC component
  * @kctl - list of kcontrols created
+ * @active_list - active sessions
  * @num_supported_streams - number of supported concurrent sessions
  * @connection_status_cb - callback to notify connection events
  * @put_offload_dev - callback to select USB sound card/PCM device
@@ -41,6 +62,7 @@ struct snd_soc_usb {
 	struct list_head list;
 	struct snd_soc_component *component;
 	struct snd_kcontrol *kctl[SND_SOC_USB_KCTL_MAX];
+	struct snd_soc_usb_session *active_list;
 	unsigned int num_supported_streams;
 	int (*connection_status_cb)(struct snd_soc_usb *usb,
 			struct snd_soc_usb_device *sdev, bool connected);
@@ -62,6 +84,11 @@ int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
 
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state);
+
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      int num_streams, void *data);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb);
@@ -97,6 +124,25 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx,
+						int pcm_idx)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb,
+						int session_id)
+{
+	return -EINVAL;
+}
+
+static inline int snd_soc_usb_set_session_state(struct snd_soc_usb *usb,
+						int session_id,
+						enum snd_soc_usb_dai_state state)
+{
+	return -EINVAL;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      int num_streams, void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index ef84957014dd..faacae8a6a5c 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -61,6 +61,79 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 }
 
 /* SOC USB sound kcontrols */
+static int snd_soc_usb_get_offload_card_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int control_idx = 0;
+	int card_idx;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++) {
+		card_idx = -1;
+
+		if (ctx->active_list[i].state == SND_SOC_USB_RUNNING)
+			card_idx = ctx->active_list[i].active_card_idx;
+
+		ucontrol->value.integer.value[control_idx] = card_idx;
+		control_idx++;
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_offload_card_status_info(struct snd_kcontrol *kcontrol,
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
+static int snd_soc_usb_get_offload_pcm_status(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_usb *ctx = snd_soc_usb_ctx_lookup(component->dev->of_node);
+	int control_idx = 0;
+	int pcm_idx;
+	int i;
+
+	for (i = 0; i < ctx->num_supported_streams; i++) {
+		pcm_idx = -1;
+
+		if (ctx->active_list[i].state == SND_SOC_USB_RUNNING)
+			pcm_idx = ctx->active_list[i].active_pcm_idx;
+
+		ucontrol->value.integer.value[control_idx] = pcm_idx;
+		control_idx++;
+	}
+
+	return 0;
+}
+
+static int snd_soc_usb_offload_pcm_status_info(struct snd_kcontrol *kcontrol,
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
 static int soc_usb_put_offload_pcm_dev(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
@@ -181,6 +254,22 @@ static const struct snd_kcontrol_new soc_usb_kcontrols[] = {
 		.get = soc_usb_get_offload_pcm_dev,
 		.put = soc_usb_put_offload_pcm_dev,
 	},
+	[SND_SOC_USB_KCTL_CARD_STATUS] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.name = "USB Offload Playback Route Card Status",
+		.info = snd_soc_usb_offload_card_status_info,
+		.get = snd_soc_usb_get_offload_card_status,
+		.put = NULL,
+	},
+	[SND_SOC_USB_KCTL_PCM_STATUS] = {
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ,
+		.name = "USB Offload Playback Route PCM Status",
+		.info = snd_soc_usb_offload_pcm_status_info,
+		.get = snd_soc_usb_get_offload_pcm_status,
+		.put = NULL,
+	},
 };
 
 static int snd_soc_usb_control_remove(struct snd_soc_usb *usb)
@@ -216,6 +305,102 @@ static int snd_soc_usb_control_init(struct snd_soc_usb *usb)
 	return ret;
 }
 
+/**
+ * snd_soc_usb_set_session_state() - Set the session state for a session
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ * @state: USB PCM device index
+ *
+ * Set the session state for an entry in active_list.  This should be only
+ * called after snd_soc_usb_prepare_session.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
+				  enum snd_soc_usb_dai_state state)
+{
+	if (session_id < 0 || session_id >= usb->num_supported_streams)
+		return -EINVAL;
+
+	mutex_lock(&ctx_mutex);
+	if (usb->active_list[session_id].state == state) {
+		mutex_unlock(&ctx_mutex);
+		return 0;
+	}
+
+	usb->active_list[session_id].state = state;
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_set_session_state);
+
+/**
+ * snd_soc_usb_prepare_session() - Find and prepare a session
+ * @usb: SOC USB device
+ * @card_idx: USB card index
+ * @pcm_idx: USB PCM device index
+ *
+ * Find an open active session slot on the SOC USB device.  If all slots
+ * are busy, return an error.  If not, claim the slot and place it into
+ * the SND_SOC_USB_PREPARED state.  This should be called first before
+ * calling snd_soc_usb_set_session_state or snd_soc_usb_shutdown_session.
+ *
+ * Returns the session id (index) to active_list, negative on error.
+ *
+ */
+int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx)
+{
+	int i;
+
+	mutex_lock(&ctx_mutex);
+	for (i = 0; i < usb->num_supported_streams; i++) {
+		if (usb->active_list[i].state == SND_SOC_USB_IDLE) {
+			usb->active_list[i].active_card_idx = card_idx;
+			usb->active_list[i].active_pcm_idx = pcm_idx;
+			usb->active_list[i].state = SND_SOC_USB_PREPARED;
+			mutex_unlock(&ctx_mutex);
+			return i;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+
+	return -EBUSY;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_prepare_session);
+
+/**
+ * snd_soc_usb_shutdown_session() - Set USB SOC to idle state
+ * @usb: SOC USB device
+ * @session_id: index to active_list
+ *
+ * Place the session specified by session_id into the idle/shutdown state.
+ *
+ */
+int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id)
+{
+	return snd_soc_usb_set_session_state(usb, session_id, SND_SOC_USB_IDLE);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_shutdown_session);
+
+/**
+ * snd_soc_usb_get_components_tag() - Retrieve SOC USB component tag
+ * @playback: direction of audio stream
+ *
+ * Returns the USB offload component tag used in the ASoC components
+ * string.
+ *
+ */
+const char *snd_soc_usb_get_components_tag(bool playback)
+{
+	if (playback)
+		return "usbplaybackoffload: 1";
+	else
+		return "usbcaptureoffload : 1";
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_get_components_tag);
+
 /**
  * snd_soc_usb_find_priv_data() - Retrieve private data stored
  * @dev: device reference
@@ -277,6 +462,13 @@ struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *componen
 	if (!usb)
 		return ERR_PTR(-ENOMEM);
 
+	usb->active_list = kcalloc(num_streams, sizeof(struct snd_soc_usb_session),
+				   GFP_KERNEL);
+	if (!usb->active_list) {
+		kfree(usb);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	usb->component = component;
 	usb->priv_data = data;
 	usb->num_supported_streams = num_streams;
@@ -295,6 +487,7 @@ EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
 void snd_soc_usb_free_port(struct snd_soc_usb *usb)
 {
 	snd_soc_usb_remove_port(usb);
+	kfree(usb->active_list);
 	kfree(usb);
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);

