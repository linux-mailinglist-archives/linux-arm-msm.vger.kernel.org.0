Return-Path: <linux-arm-msm+bounces-19429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF658BEDA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 22:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECDAF2821B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 20:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145C184473;
	Tue,  7 May 2024 19:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iUYhpJ7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910A170842;
	Tue,  7 May 2024 19:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715111536; cv=none; b=tynAbF4IWNnnfc3gPBwCNxlSWZvffAm0ipHhn7Sf8cUA+n+MbSOFwMArcSJbHEsVpeqYZ44xFjNT68v4bCkMN2YSD80iPi0f0U7Jh+TYEMH2lDuxDl19lRYlae0pL7L6IY+T9t9aa+/v7yZ4i5ErqVJxJ5jW39sqxe4oN1h6D6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715111536; c=relaxed/simple;
	bh=riaGz2qwxT11ef31fQe/QoEpneoqJfuH8of9lRg1Bus=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C7dv1P6rqvV4dUxSdyaCEVG3I8KDu+vVj+5hf2zE+Z/Jm7XiN/5ql+GlLamz/SPj9q7j9M8/jlfp6BPXzZ/XIw7vbgUlarAtTuMIskurFsYeRJXdPPO0WJSqFIM34a65mQMSFTqorETIIQtnwfKcMQAGaMxT76id11f2PsUD9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iUYhpJ7D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IL7dh003324;
	Tue, 7 May 2024 19:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=5DYwyoppJeKModZO4lY2
	uNFm4PJCeEPfC+2Hvj26/88=; b=iUYhpJ7DYVRSo3V2kkXxm+iOswzQZWgiUxKK
	o549cDeNnstXiWCuoAOSuy5EvoNHeOW6ZfvV+oztgPWqG7TIT+LNPJoyYutZsbyX
	AS7/0+3PX5dTKKWKpFiaCXdASeCuAYfLgM5oAyfU6hG4qVIT7jL9g/SZGMQakvDE
	Qxc6Tcx5K8mHaoPu7BO3gY4VB3A00UshuuTZL8vuAnnFjaKzjjVgZyIHNxIMhCj5
	hPQ3hJ7ZXTZIQYtZ0OyYoJ69DIaS3NbjGoUSGAxHjHbQrRXwyHBIm5DDGu78MUc4
	4tpF05A7YjnDtYFkgjMm0G2e5wgpnNxW3qwZx1qgqUCjTi1vLA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg405v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:51:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447Jpcw1019852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:51:38 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 May 2024 12:51:37 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
Date: Tue, 7 May 2024 12:51:15 -0700
Message-ID: <20240507195116.9464-39-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507195116.9464-1-quic_wcheng@quicinc.com>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: LnV0cjgPHK976TXw_NCWLw4CAmizo544
X-Proofpoint-ORIG-GUID: LnV0cjgPHK976TXw_NCWLw4CAmizo544
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405070138

For userspace to know about certain capabilities of the current platform
card, add tags to the components string that it can use to enable support
for that audio path.  In case of USB offloading, the "usboffldplybk: 1" tag
is added to the string.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/sm8250.c            |  3 +++
 sound/soc/qcom/usb_offload_utils.c | 22 ++++++++++++++++++++++
 sound/soc/qcom/usb_offload_utils.h |  7 +++++++
 3 files changed, 32 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 6f156c94de01..dc17f7fd3a2b 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -39,6 +39,9 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 						&data->usb_offload_jack_setup);
 	else
 		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	qcom_snd_add_components_string(rtd);
+
 	return ret;
 }
 
diff --git a/sound/soc/qcom/usb_offload_utils.c b/sound/soc/qcom/usb_offload_utils.c
index a84394a9b772..2d2ce0687b01 100644
--- a/sound/soc/qcom/usb_offload_utils.c
+++ b/sound/soc/qcom/usb_offload_utils.c
@@ -52,4 +52,26 @@ int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
+
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	const char *prev = card->components;
+
+	switch (cpu_dai->id) {
+	case USB_RX:
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s %s",
+					  card->components,
+					  snd_soc_usb_get_components_tag(true));
+	default:
+		break;
+	}
+
+	if (prev && prev != card->components)
+		devm_kfree(card->dev, prev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_add_components_string);
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/usb_offload_utils.h b/sound/soc/qcom/usb_offload_utils.h
index d44f78569b47..814fbfa26d36 100644
--- a/sound/soc/qcom/usb_offload_utils.h
+++ b/sound/soc/qcom/usb_offload_utils.h
@@ -13,6 +13,8 @@ int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 
 int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *rtd,
 					bool *jack_setup);
+
+int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd);
 #else
 static inline int qcom_snd_usb_offload_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
@@ -25,5 +27,10 @@ static inline int qcom_snd_usb_offload_jack_remove(struct snd_soc_pcm_runtime *r
 {
 	return -ENODEV;
 }
+
+static inline int qcom_snd_add_components_string(struct snd_soc_pcm_runtime *rtd)
+{
+	return -ENODEV;
+}
 #endif /* IS_ENABLED(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) */
 #endif /* __QCOM_SND_USB_OFFLOAD_UTILS_H__ */

