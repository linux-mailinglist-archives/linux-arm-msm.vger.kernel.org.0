Return-Path: <linux-arm-msm+bounces-53150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E135A7B4F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 02:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1DD47AA248
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 00:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA78B1F7074;
	Fri,  4 Apr 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UR8SPDpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF8B19ABC2;
	Fri,  4 Apr 2025 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726487; cv=none; b=TuSJtGlaTs3Hbrn4k/uJMRyMThmKF187hCJCbz+a34IPyMWZYShnH7j7zKePVo4/UNELBQTyEsWH2pmH7xLX1PtwWJdbSmcBRWXR6ZIQKNNn9m55ahnka9HMfhSaOg0Vrd4m6Unw0+tgaFwHNUPwPjNJSH3BIo0eC82rAJw9l8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726487; c=relaxed/simple;
	bh=vx51Y64QGCFWs0A+iED9IXArKvpk16+0zt2/YIoiC2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvSE1S1JAFtWcXvLo4a0m5rkmFKNR4IqlMTSMrqZrCE8uRYCYGAtRwpJEIJI95V6OdjVUkHu0qUeA/Zv5tkXpDXzzVfVt7cgzHgsRc4aBEh0ynbg7RQejmTH+8ENyNw8VJuqo9C3CsUfG0xdLoutn/g4DTxvf+x8fxdW1eDfvtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UR8SPDpE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NY7hc024033;
	Fri, 4 Apr 2025 00:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKHsR2DFH45gngEIECwk5S7v5288ngB2BSjyBhSZ8m4=; b=UR8SPDpEba5/K0yG
	byuu+OMrcaruZ7W3AooiRTw9oS/4Sxm3Dg2nDoH3L3bK3+mCFqfSn7cKeMvlJ3xW
	G1Bz4IJG8mzOcT/DNv630P3+IpwIVL6a4N6FHy7+sabYooEWveQ/OHhp7Mw8PxtV
	SsRT5GJIx9uNHWlEQ9hp0oWC4XXAhgxMPG8aXneWb7L+ufCdxFboKQ3hO3lQt71N
	b0zwACWCVLL1w2Cw5RXNrVUnbDpb3Oz5hxBUSgyl5G2/Q2eLHYfuhSxlLAPGT+uu
	/8H8qUQJekz9o02Gv5YzFGjDW3R3UKHDZK/QhTaai5voAGAQ0pRpqxO3A/DP7EKz
	Zr4+wQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2dar8tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340RkCm010264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:46 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v37 26/31] ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
Date: Thu, 3 Apr 2025 17:27:23 -0700
Message-ID: <20250404002728.3590501-27-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2XSgOvPAkSYZrX88reKUjfFkT5bt980w
X-Authority-Analysis: v=2.4 cv=MqFS63ae c=1 sm=1 tr=0 ts=67ef2783 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=sM4ukppU747kDJRO61AA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2XSgOvPAkSYZrX88reKUjfFkT5bt980w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

The USB SND path may need to know how the USB offload path is routed, so
that applications can open the proper sound card and PCM device.  The
implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
possible FE (Q6ASM) DAI, which can be utilized to know which front end link
is enabled.

When an application/userspace queries for the mapped offload devices, the
logic will lookup the USB mixer status though the following path:

MultiMedia* <-> MM_DL* <-> USB Mixer*

The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
the Q6USB backend link can fetch the PCM device number from the FE DAI
link (Multimedia*).  With respects to the card number, that is
straightforward, as the ASoC components have direct references to the ASoC
platform sound card.

An example output can be shown below:

Number of controls: 9
name                                    value
Capture Channel Map                     0, 0 (range 0->36)
Playback Channel Map                    0, 0 (range 0->36)
Headset Capture Switch                  On
Headset Capture Volume                  1 (range 0->4)
Sidetone Playback Switch                On
Sidetone Playback Volume                4096 (range 0->8192)
Headset Playback Switch                 On
Headset Playback Volume                 20, 20 (range 0->24)
USB Offload Playback Route PCM#0        0, 1 (range -1->255)

The "USB Offload Playback Route PCM#*" kcontrol will signify the
corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
If the USB SND device supports multiple audio interfaces, then it will
contain several PCM streams, hence in those situations, it is expected
that there will be multiple playback route kcontrols created.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6usb.c | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 129ce8b1067c..9b91408b23e7 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -134,6 +134,103 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
 	return ret;
 }
 
+static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *dai;
+
+	for_each_card_rtds(w->dapm->card, rtd) {
+		dai = snd_soc_rtd_to_cpu(rtd, 0);
+		/*
+		 * Only look for playback widget. RTD number carries the assigned
+		 * PCM index.
+		 */
+		if (dai->stream[0].widget == w)
+			return rtd->id;
+	}
+
+	return -1;
+}
+
+static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+
+	/* Checks to ensure USB path is enabled/connected */
+	snd_soc_dapm_widget_for_each_sink_path(w, p)
+		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
+			return 1;
+
+	return 0;
+}
+
+static int q6usb_get_pcm_id(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_path *p;
+	int pidx;
+
+	/*
+	 * Traverse widgets to find corresponding FE widget.  The DAI links are
+	 * built like the following:
+	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
+	 */
+	for_each_card_widgets(component->card, w) {
+		if (!strncmp(w->name, "MultiMedia", 10)) {
+			/*
+			 * Look up all paths associated with the FE widget to see if
+			 * the USB BE is enabled.  The sink widget is responsible to
+			 * link with the USB mixers.
+			 */
+			snd_soc_dapm_widget_for_each_sink_path(w, p) {
+				if (q6usb_usb_mixer_enabled(p->sink)) {
+					pidx = q6usb_get_pcm_id_from_widget(w);
+					return pidx;
+				}
+			}
+		}
+	}
+
+	return -1;
+}
+
+static int q6usb_update_offload_route(struct snd_soc_component *component, int card,
+				      int pcm, int direction, enum snd_soc_usb_kctl path,
+				      long *route)
+{
+	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
+	struct snd_soc_usb_device *sdev;
+	int ret = 0;
+	int idx = -1;
+
+	mutex_lock(&data->mutex);
+
+	if (list_empty(&data->devices) ||
+	    direction == SNDRV_PCM_STREAM_CAPTURE) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
+
+	/*
+	 * Will always look for last PCM device discovered/probed as the
+	 * active offload index.
+	 */
+	if (card == sdev->card_idx &&
+	    pcm == sdev->ppcm_idx[sdev->num_playback - 1]) {
+		idx = path == SND_SOC_USB_KCTL_CARD_ROUTE ?
+				component->card->snd_card->number :
+				q6usb_get_pcm_id(component);
+	}
+
+out:
+	route[0] = idx;
+	mutex_unlock(&data->mutex);
+
+	return ret;
+}
+
 static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
 				    struct snd_soc_usb_device *sdev, bool connected)
 {
@@ -232,6 +329,7 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
+	usb->update_offload_route_info = q6usb_update_offload_route;
 
 	snd_soc_usb_add_port(usb);
 	data->usb = usb;

