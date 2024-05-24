Return-Path: <linux-arm-msm+bounces-20339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5B8CDE32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A71D1C2178E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFD143AA2;
	Fri, 24 May 2024 00:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pCL+1hkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621A3399B;
	Fri, 24 May 2024 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716509484; cv=none; b=YdZGijlZdN4EBSlOn+lMsK4f1W9V0Oji/gKk7QpD1FCSj1UTt/07NOkVF689wgYJ/bo6r7/sGjMtbnKXkmBCgf8v/D+AOkJbHS1mtqfW4kvvc2pQ/sM5JfEUGbnxFVv6TLzCLS8XHOY0hlewngg0NV0reVV7LV7ndyGCkM2ajPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716509484; c=relaxed/simple;
	bh=gFU1ePwlYhlzYWUxRjQ4ycd26Pc8/+kgoUs3ozS2g5M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7fufDZRd68AHRmCYjQCGTTxPI3Np6qGFMjAfUymZrWnSd4A/RNRnCnUv1sNb5aMxLUUGCaLqs3ECkC8IvQPixTjAFC86TAMCGNmU5ndeb2EDx9kO198OkEx/v2X6Wy/c04ZPyA1N44QPaYMd3eiGx8SYd3zppXBRfcXNbOOIjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pCL+1hkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNPDoc007621;
	Fri, 24 May 2024 00:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkgwHI3kwei94J8pWmry7o76
	uKy5cIhhnmC7ddLvP80=; b=pCL+1hkNVqrd6p/nBmcP/Ezg8kxtfkdbtezztK7T
	1lIc2AUOEbA5pttpAL+XI986vuWgB22qRr1WiOu7LjXxzNsXSMKI2Ed/dEN/Xliq
	wD1yEsbgGdEx7fU5DBXY8J28EsHYdF8zO9WkfpZeIxfnii3lSHBNVVsvqGTFjorJ
	lwmv1g956d3Mtw0TwIL0Dxm389cV9nUw4hXJgvqTN7BNPsDSsKp/i+fevLCRc5HU
	CVV0UVU57jF3PqbWCNNA4M2TgjGg+fOrN4ZbgPcxPNTC9RuWp8cARrXptqFhFM6W
	Wxb8Q62Cr7eqCh5IGDcGtiA2pm1z0aV7UiMsNx3589HhuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9trqa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O0B0mc020552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:11:00 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 17:11:00 -0700
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
Subject: [PATCH v22 20/38] ASoC: usb: Add PCM format check API for USB backend
Date: Thu, 23 May 2024 17:10:25 -0700
Message-ID: <20240524001043.10141-21-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: z7cC5dN7uyN6nB_s6JeeLD932y-pbrxP
X-Proofpoint-ORIG-GUID: z7cC5dN7uyN6nB_s6JeeLD932y-pbrxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405230166

Introduce a helper to check if a particular PCM format is supported by the
USB audio device connected.  If the USB audio device does not have an
audio profile which can support the requested format, then notify the USB
backend.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  9 +++++++++
 sound/soc/soc-usb.c     | 25 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index e8fe4439c234..4b1b992c8b27 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -39,6 +39,8 @@ struct snd_soc_usb {
 
 #if IS_ENABLED(CONFIG_SND_SOC_USB)
 const char *snd_soc_usb_get_components_tag(bool playback);
+int snd_soc_usb_find_supported_format(int card_idx,
+				struct snd_pcm_hw_params *params, int direction);
 
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
@@ -55,6 +57,13 @@ static inline const char *snd_soc_usb_get_components_tag(bool playback)
 	return "";
 }
 
+static inline int snd_soc_usb_find_supported_format(int card_idx,
+					  struct snd_pcm_hw_params *params,
+					  int direction)
+{
+	return -EINVAL;
+}
+
 static inline int snd_soc_usb_connect(struct device *usbdev,
 					struct snd_soc_usb_device *sdev)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 8490715791a5..3bb66808f196 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -74,6 +74,31 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
 
+/**
+ * snd_soc_usb_find_supported_format() - Check if audio format is supported
+ * @card_idx: USB sound chip array index
+ * @params: PCM parameters
+ * @direction: capture or playback
+ *
+ * Ensure that a requested audio profile from the ASoC side is able to be
+ * supported by the USB device.
+ *
+ * Return 0 on success, negative on error.
+ *
+ */
+int snd_soc_usb_find_supported_format(int card_idx,
+				struct snd_pcm_hw_params *params, int direction)
+{
+	struct snd_usb_stream *as;
+
+	as = snd_usb_find_suppported_substream(card_idx, params, direction);
+	if (!as)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_supported_format);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component

