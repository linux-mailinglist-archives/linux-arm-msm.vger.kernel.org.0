Return-Path: <linux-arm-msm+bounces-22251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B578C902D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 02:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F6E61F22CAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55241581E6;
	Mon, 10 Jun 2024 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p4NEYZFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D33E15625D;
	Mon, 10 Jun 2024 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718063928; cv=none; b=cMpkg8Y5sTC/P62asUMQ/azvA5pSok+K7GgU5LSKW37oRqr6x4aqXMqUu2VXNW0iHiHG3ZbMm8vsWtLCrGvARPa2k9AE9/Kv4UWwYWx0SrgZiChhnCrEEBW1BIehmF99uVfs7v2JK7cDk+lliAaJxQTDOcAS+aHcJs2GF9yxTAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718063928; c=relaxed/simple;
	bh=0dpxZQ4LBCHMtV64pxGbugE9fxOT6rBxbjLJxwnhXm4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnAFc6NHPWhmYmP+cPq3PivsBUUAvfdnxNxvBx0TBn3GtN7zv/xyMDeHup4GFXkRHAbXxG+OtYC+bxCycdrkeCZIjwS5IcI4H2jTT0pMdxbDi1NIgsEtl78yb8nQXB/+hhk7b+uZcnuF2KHo7K1Q76AijE1GYazgx5K8ZvJZDZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p4NEYZFM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ADjsJD009027;
	Mon, 10 Jun 2024 23:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7fyqlGR2x7IukUd7gn2AMFj7
	oHPwjjIvxgOf1sH4COE=; b=p4NEYZFMm4xrRmTgvDBpzRhddChpOL7/gA/VodEX
	cgdDONmYLYA/SBg/61zk0YX2mXrZRWYaBH71m69sk+0Gjhc9ViQkUPo7/irLiool
	UgUPYHxrNSK2nTP0KpHRbJYzA/G1OkFOQEIoTZpafHFH5orwBIvSqQTCwWgF+2oD
	7moT14m/KQ8KRCoAEJZnP0MiddHPGUylMsdmcVfXR0RYc5t0HnHrOM4esoer3bsa
	Uk+YA8WxUSMIcMXDA25KICDeN0iL7DWLyQRbcvtHC5TO4SrrCQFCiDtK/c1qO1HS
	pD5X8r3vsAyAy1GFfBy7qS3fNpc/qPj3rnMA7FAE3eh35Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rwbyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ANwQvL001579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 16:58:25 -0700
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
Subject: [PATCH v23 25/32] ASoC: usb: Create SOC USB SND jack kcontrol
Date: Mon, 10 Jun 2024 16:58:01 -0700
Message-ID: <20240610235808.22173-26-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LT62pxzUl6U4yQN1x5v9mjXqEQW09h4S
X-Proofpoint-GUID: LT62pxzUl6U4yQN1x5v9mjXqEQW09h4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_07,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=927 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100177

Expose API for creation of a jack control for notifying of available
devices that are plugged in/discovered, and that support offloading.  This
allows for control names to be standardized across implementations of USB
audio offloading.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h | 16 +++++++++++
 sound/soc/soc-usb.c     | 62 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index c5aecdd0b006..8e94c1991819 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -6,6 +6,8 @@
 #ifndef __LINUX_SND_SOC_USB_H
 #define __LINUX_SND_SOC_USB_H
 
+#include <sound/soc.h>
+
 enum snd_soc_usb_kctl {
 	SND_SOC_USB_KCTL_CARD_ROUTE,
 	SND_SOC_USB_KCTL_PCM_ROUTE,
@@ -88,6 +90,9 @@ int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_i
 int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
 int snd_soc_usb_set_session_state(struct snd_soc_usb *usb, int session_id,
 				  enum snd_soc_usb_dai_state state);
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack);
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
 
 struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
 					      int num_streams, void *data);
@@ -143,6 +148,17 @@ static inline int snd_soc_usb_set_session_state(struct snd_soc_usb *usb,
 	return -EINVAL;
 }
 
+static inline int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+						 struct snd_soc_jack *jack)
+{
+	return -ENODEV;
+}
+
+static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	return -ENODEV;
+}
+
 static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
 					      struct snd_soc_component *component,
 					      int num_streams, void *data)
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index faacae8a6a5c..0baba34910b5 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -4,8 +4,10 @@
  */
 #include <linux/of.h>
 #include <linux/usb.h>
-#include <sound/soc.h>
+
+#include <sound/jack.h>
 #include <sound/soc-usb.h>
+
 #include "../usb/card.h"
 
 static DEFINE_MUTEX(ctx_mutex);
@@ -61,6 +63,64 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
 }
 
 /* SOC USB sound kcontrols */
+/**
+ * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: jack structure to create
+ *
+ * Creates a jack device for notifying userspace of the availability
+ * of an offload capable device.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
+					struct snd_soc_jack *jack)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(component->card, "USB Offload Playback Jack",
+					SND_JACK_HEADPHONE, jack);
+	if (ret < 0) {
+		dev_err(component->card->dev, "Unable to add USB offload jack\n");
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
+
+/**
+ * snd_soc_usb_disable_offload_jack() - Disables USB offloading jack
+ * @component: USB DPCM backend DAI component
+ * @jack: jack structure to disable
+ *
+ * Disables the offload jack device, so that further connection events
+ * won't be notified.
+ *
+ * Returns 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = snd_soc_component_set_jack(component, NULL, NULL);
+	if (ret) {
+		dev_err(component->card->dev, "Failed to disable jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
+
 static int snd_soc_usb_get_offload_card_status(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {

