Return-Path: <linux-arm-msm+bounces-27623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43796944045
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 04:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0881F231C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D10C18A6A7;
	Thu,  1 Aug 2024 01:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QCrL/2X2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547E189523;
	Thu,  1 Aug 2024 01:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722475124; cv=none; b=FU2xpPNXsD+4P7seV/TceldwnOadOtAgWyaUCscVFQaLnv222lL2jbqISVFBoT0dDYYo41UY+CPD4qxPY8lzOf7Tst/U6lvZuDw8BkcKg6uRMNNqP4ahCGVCH2iYdjdXcG7CopCP06UveVrbjQxhMat4QxMAgz5vAG4zeLQ2ix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722475124; c=relaxed/simple;
	bh=zXJYxoowjLCGGs/moXG9k9H4KOG3qRzqvJSx6i1jyIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6PMjIlAHyo0IGvsK1HyVrPGdixVMOCSzh3xTZhqW6BJFZmBE6PJOjpnj/aZTaHZOZIZeBaBOsgeARmDjWPwPB60IIy3KttghVzbXCw81DOJ/CHwPv3KF5YeHT6Hnt+qWLzdgmlpA1LCW9N3YVAmTKgkr1LY88QyBfBntpV84Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QCrL/2X2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VLAJRX006082;
	Thu, 1 Aug 2024 01:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0YyrBOfLud+dH9tBesRDPfRK
	DGs1gz1i/U8ghzKbd2E=; b=QCrL/2X26/TttjkdVba8u7UWZ/eIR4QHx57yZWVN
	3izM0hmOOoYt+JBp8jlRlxHwJ+idRD1XSs7CU/F25tQM1jbdOT+LWuPiEk0xmIv0
	WNYaADRaL90O+c3HJNlEefLNfh4dAKifqG6c93VHYefyfKKu+fHq6y9onQ3+gzHZ
	5TZSq74wI6xQPxGXM31osGtYuosZgkT0SfVMrrrR+Om+neCWsLYDCzrIMAyCZY3q
	eM72P5L6wgG3qav83q2pAl/Wtd09MfIpQi9vL/1+YdOpEuUTXYl70yknjxKzGspk
	zEm3v7hqzifExoTj4h1l+kLHW2QSOhOgc/w78cScudErpg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq5278fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 01:17:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4711HpNI026929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 01:17:51 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 31 Jul 2024 18:17:50 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v24 34/34] ASoC: qcom: qdsp6: Ensure PCM format is supported by USB audio device
Date: Wed, 31 Jul 2024 18:17:30 -0700
Message-ID: <20240801011730.4797-35-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240801011730.4797-1-quic_wcheng@quicinc.com>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: 9LmxEnlmigDKbRJHAXQqAhHAThcfJJS3
X-Proofpoint-ORIG-GUID: 9LmxEnlmigDKbRJHAXQqAhHAThcfJJS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_11,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010004

Check for if the PCM format is supported during the hw_params callback.  If
the profile is not supported then the userspace ALSA entity will receive an
error, and can take further action.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index d8f1bb4ec497..9a3fb3cb32b2 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -52,6 +52,7 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int direction = substream->stream;
 	struct q6afe_port *q6usb_afe;
 	struct snd_soc_usb_device *sdev;
 	int ret;
@@ -63,6 +64,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 	mutex_lock(&data->mutex);
 	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
 
+	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
+	if (ret < 0)
+		goto out;
+
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
 	if (IS_ERR(q6usb_afe))
 		goto out;

