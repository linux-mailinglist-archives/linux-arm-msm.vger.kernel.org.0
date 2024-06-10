Return-Path: <linux-arm-msm+bounces-22238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B7902CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 01:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C931C214BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 23:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272215534E;
	Mon, 10 Jun 2024 23:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OwUW+30D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A36152789;
	Mon, 10 Jun 2024 23:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718063925; cv=none; b=Eiu4Quhw8rr0TkdEpr94D1gdj7qTiIAxtYdEBo6w1WhyBKAtyRc9Jfdv9g/W5dxa0/e0oumUq7dEVT3iSouDLmV00quHWaWjk0iU79/saitMua3KYNLPDyPd55f7Ds7zkPzdTLFXyqeFsIXI5nDncOVTcStoEk3OFtf7bpQHd7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718063925; c=relaxed/simple;
	bh=mMjfhikAapy3yEhdUgCdMwC2K7gi8qsZL718HI1rgN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkbrHlyCavc+TNnxAfKZNm+1mcnEuHmb4TdtqTxVVUmF3CUYSv8NyEZ/TKeh+SUg0zidqS6y9PZteF4QtPbEK5A7zImZ/2TwWim3xBHhypl20B3UgPlqlMARmczhK3q7jdvmVpjNi1j9TnLv9vdokIjEm3iyajIZnD1EwW7xbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OwUW+30D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AF93e1010739;
	Mon, 10 Jun 2024 23:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7RpG2/ulW/z/mLA7szHHtNtb
	NNS0U7CenpPtBBWreTU=; b=OwUW+30DdrB2rTTFM5/uL5LImmRpjDaVSex7jWed
	CCYACTabAeqHlw6aZRGuosyHi7/jwR1iuvogDNYAiMOfyD3lJXPVVydSxdDUwrPE
	8qU4BY02PU3MjKJGHFicXggTbo4EdQRCMqJNIAUNLC9ilYBOiZvPmPw4vuMFzhVm
	TV0ltjHuYEnDYWU3jlK5sL0HqOCzdoVaLOA0vqjMAOKD+tFLAceFbj8rVF4Kr8Iw
	zJadOsWMCjY+ilG460a4xEA+QpdQKNJ/rpKlNdSGegd2vjYAu6XSpMbrt9rRvfhK
	wqmEZ1dbGseS1pF4M0qUj/OWgLxDmNPEDIFCX2ywl+k/tA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymea6mxpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 23:58:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45ANwQPg016624
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
Subject: [PATCH v23 27/32] ASoC: usb: Fetch ASoC sound card information
Date: Mon, 10 Jun 2024 16:58:03 -0700
Message-ID: <20240610235808.22173-28-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: mXFr2tVg2i8X1BAprLTx7fNufa2rIWhg
X-Proofpoint-ORIG-GUID: mXFr2tVg2i8X1BAprLTx7fNufa2rIWhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100176

For USB sound to expose mixer controls to fetch information about the ASoC
sound card, add an API that returns the platform sound card number that is
registered with SOC USB.  Knowing this allows for applications to further
query about the offload status.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  6 ++++++
 sound/soc/soc-usb.c     | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
index 8e94c1991819..ab5ade4942d5 100644
--- a/include/sound/soc-usb.h
+++ b/include/sound/soc-usb.h
@@ -85,6 +85,7 @@ int snd_soc_usb_find_supported_format(int card_idx,
 int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
 void *snd_soc_usb_find_priv_data(struct device *dev);
+int snd_soc_usb_device_offload_available(struct device *dev);
 
 int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx, int pcm_idx);
 int snd_soc_usb_shutdown_session(struct snd_soc_usb *usb, int session_id);
@@ -129,6 +130,11 @@ static inline void *snd_soc_usb_find_priv_data(struct device *dev)
 	return NULL;
 }
 
+static inline int snd_soc_usb_device_offload_available(struct device *dev)
+{
+	return -ENODEV;
+}
+
 static inline int snd_soc_usb_prepare_session(struct snd_soc_usb *usb, int card_idx,
 						int pcm_idx)
 {
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
index 0baba34910b5..d50bcb9f379e 100644
--- a/sound/soc/soc-usb.c
+++ b/sound/soc/soc-usb.c
@@ -503,6 +503,26 @@ int snd_soc_usb_find_supported_format(int card_idx,
 }
 EXPORT_SYMBOL_GPL(snd_soc_usb_find_supported_format);
 
+/**
+ * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
+ * @dev: the device to find in SOC USB
+ *
+ * Finds the component linked to a specific SOC USB instance, and returns
+ * the sound card number for the platform card supporting offloading.
+ *
+ */
+int snd_soc_usb_device_offload_available(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+
+	ctx = snd_soc_find_usb_ctx(dev);
+	if (!ctx)
+		return -ENODEV;
+
+	return ctx->component->card->snd_card->number;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_device_offload_available);
+
 /**
  * snd_soc_usb_allocate_port() - allocate a SOC USB device
  * @component: USB DPCM backend DAI component

