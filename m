Return-Path: <linux-arm-msm+bounces-54065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB331A8664D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0888B9A146B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6209280CCC;
	Fri, 11 Apr 2025 19:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dHvaENiJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DDB23644F;
	Fri, 11 Apr 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399635; cv=none; b=JMybOcblk6IhLs4sdtm74xjO1PajQSBj6PbZFES3iD8JRtsjuweu921Q3Fwxbv+6m4IAUBe9rBJ22vf//81lS1osAdTgC6KhGhW9MHsmRJUN/vwvRKOKkHdhlo6jS8mwI10xzc1yeFM759r3KbwVkT0XRtr8ycsPgi//iSpICeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399635; c=relaxed/simple;
	bh=MepIWk6ofG3nYNGY7eZVos2ZAVyVTTvsd7iTYpLxPXg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a2am9sJjzSYpIMjFjCsF6MzwlVt0+mtmC6Ai+lQVGRSmcU0Q6qVVZhbTocSWsdJvGi0//0LLWR2QnPIOuG4l/NXcp9X4KY1VhefMVxVcm96TJWI5Fy9DDU+DON0zwzScI8JxsmDZ5nuff/BTFd1ydbu/SgYpoQ8n7pRCCTsvU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dHvaENiJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFngDq032515;
	Fri, 11 Apr 2025 19:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XLS2N66xJ478/ko2inJpu3
	zEZ4SSmmXsjnciAiA9GIQ=; b=dHvaENiJyIT1bmJFuyr4r0Ow0nun4sl9fOKINL
	s7PKgmz77dlkQ3mIrHrq0YhY1hi5MkUXoslrIPgyp66lZcFBtuD6vUsnoI5KoV20
	Lp+6ml8Vxev5yH3pjQLUYzRNbq4Tnx/DaRuj6o6GO/pe0Bu747hg2DOXVdXmrl/f
	0+Brnb2bxiJvcPjbzVh9XGMFTEk1BR4SAX2I8hbYsgP8cxtt1NZ1FMbLb0nsf1CX
	+DpczFeB5fLvp9mEfaLyOdAYpzLdf1Z2vSgj1xwW+brNhzWQw+7jHdcQn8s1xJap
	a85mxUEdtpKQ8U2ADQI0ok+hJEVrvsZGqTXk9evRaqE8c9Xw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfku8js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 19:27:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BJR3Wp012536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 19:27:03 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 12:27:03 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stephan.gerhold@linaro.org>, <linux-sound@vger.kernel.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v1] ASoC: qcom: qdsp6: Fix references to lookup USB_RX mixer status
Date: Fri, 11 Apr 2025 12:26:53 -0700
Message-ID: <20250411192653.1443521-1-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NkH3rHxI6Eu-r0aHhb4Fzr2XU95_n_x4
X-Proofpoint-ORIG-GUID: NkH3rHxI6Eu-r0aHhb4Fzr2XU95_n_x4
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f96d08 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=xrw6vyGmMzug2jD20VgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=649 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110123

This addresses a change in the USB RX mixer naming that was updated in the
following commit:

commit 450d63471d1c ("ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp")

In order for the USB SND offload mixer to reference the correct PCM device
index, the q6usb_usb_mixer_enabled() is used to match the mixer associated
to the FE multimedia DAI, so the naming has to match.  Update the string
lookup and comments with the proper "USB_RX Audio Mixer" tag.

Fixes: e0dd9240f13a ("ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device")
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 274c251e84dd..abc0d62950b3 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -158,7 +158,7 @@ static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
 
 	/* Checks to ensure USB path is enabled/connected */
 	snd_soc_dapm_widget_for_each_sink_path(w, p)
-		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
+		if (!strcmp(p->sink->name, "USB_RX Audio Mixer") && p->connect)
 			return 1;
 
 	return 0;
@@ -173,7 +173,7 @@ static int q6usb_get_pcm_id(struct snd_soc_component *component)
 	/*
 	 * Traverse widgets to find corresponding FE widget.  The DAI links are
 	 * built like the following:
-	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
+	 *    MultiMedia* <-> MM_DL* <-> USB_RX Audio Mixer*
 	 */
 	for_each_card_widgets(component->card, w) {
 		if (!strncmp(w->name, "MultiMedia", 10)) {

