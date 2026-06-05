Return-Path: <linux-arm-msm+bounces-111378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gAN2CtypImoMbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5B64781F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VpmZzJcu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111378-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111378-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 507BD301E5AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9E84CA28B;
	Fri,  5 Jun 2026 10:38:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6952E4CA266;
	Fri,  5 Jun 2026 10:38:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655892; cv=none; b=cjlQm52GeV6/3w5MJsJ/Coivkceob16dnD4coYKfXvy1M8Or0F/RxcaCPMZjchEwLaViPL1zFd5uLrWbcVoNBM3iYZkBWP+jpEhusUfkvuW4fa3ZANKBFkGJCBg2N8AALQFiYwu9IcR2YwBmcZc2syZV2IdIQrXnEeReWprr1J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655892; c=relaxed/simple;
	bh=rKthpZe6YSSa1k1J4VjiTD5l0MwlvGmzAXgyGXAg0FU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=so3PPgYOaoM0O1/lbemdQVd/gZ8fEXb8FNhPEKHF64TG0NruxqAf45wcgM4q/CJ4P1ERAUhnKlPh38wW/J+CA44fyFvo2UxSTHY9g76ywTRe2NKFK5+s3b/f8lhKxyUJ59mS/SRO5qCTnklyC62xDNNwELbTcxH96xa6pFalGB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpmZzJcu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6559mEvp3016263;
	Fri, 5 Jun 2026 10:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MPakLEaSjQJ
	LUoqs7MQ/imImcPC5PpstPB42jmtI2t0=; b=VpmZzJcuYX71iqXrjHdGa/fPsP4
	FM6bdX6Rij46Q8ep2YtASqzKTv5SlaBZkN1P3WI/pnxd9o78xQkaSSWw0ND+IMoq
	VhNI9zt4tOKULBg+QCLGqQtO6qKf5npHS/CPz9NyaHrW3/1rHzw61AkqFyufYz8t
	fwubZIPOKSmPts0XQkvMUCEb4F6fRS3GjgnzT1h5k98LsZvM0iSoV5H5wgNHPhLk
	ckRg2fDxF3p+4njI4IkBYSFhgNcH0jagAuULZheFwDB11nENILCyGMzV7EHKFvxL
	p9Uq9EEgPVGJF8MzcC0e+HeQQUE2SMJ/2RwVBEtvmdMMuM0Z56+nY5mttxw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekv56g6je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:38:06 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6w011714;
	Fri, 5 Jun 2026 10:38:03 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] ASoC: qcom: Add QAIF PCM operations
Date: Fri,  5 Jun 2026 16:07:37 +0530
Message-Id: <20260605103739.3557573-12-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXwCZFD80VNmTx
 EgmDI9zT6FF55nP1qlD2w+Ql6QmFaTIZ9Nu72rvcplICyEW4a55mZfjCXBrunPkCaZyO8WC6wxL
 RMzJdayKXDiGQYUi1VioRZokaTgxpYYlJrGdIxwIhxzzGRpkGxwsY/i1sWVczHrij+jHTlMeG2Y
 WcecY/1HJU+7IH3m3WaaZzpC06AZJT1I7Y7droKHDLIq2O69p/D/CRPxtRaDoOHXqEd/evtfKMJ
 RDJgjqN5UEuaXuaSINEYxv0ZXZP+MZovybX6IUY/XiXsJxtfXCGlFDiyw1bb9eNnFSmNnDcMQ8R
 9aUTi2nU58aWrjnuJmk02LfErz/oEmjjzaCIvvNMfm+GIjOzPAyCnUF0RjT9woDwMlFc/eZNGYa
 bEmvZzEF+p/4FwwntcU1aNg7F4vQmGmwLqZ7E9RLCyPEdggliKjWREOB/2nYJoqce5YgV1n8Eb2
 M69y1lbiSjd+7IdWwnw==
X-Authority-Analysis: v=2.4 cv=eJsjSnp1 c=1 sm=1 tr=0 ts=6a22a70f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=QYQMLAkjsb5kLBzSReQA:9
X-Proofpoint-ORIG-GUID: yFDH87x0H6Kff8Tkssfhk4FR_Nnz_uIq
X-Proofpoint-GUID: yFDH87x0H6Kff8Tkssfhk4FR_Nnz_uIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111378-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9C5B64781F

Add PCM operation callbacks for the QAIF platform driver so AIF and CIF
DAIs can manage the DMA stream lifecycle.

The callbacks allocate and release stream DMA channels, set the ALSA
hardware constraints, manage the stream buffer, program the DMA registers
during prepare, enable or disable DMA and interrupts on trigger, report the
current DMA position to ALSA, and provide mmap support for userspace audio
buffers.

This completes the platform-side PCM support needed for QAIF playback and
capture streams.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-platform.c | 561 +++++++++++++++++++++++++++++++++
 1 file changed, 534 insertions(+)

diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
index 14e3379ca560..03d390705d4d 100644
--- a/sound/soc/qcom/qaif-platform.c
+++ b/sound/soc/qcom/qaif-platform.c
@@ -274,3 +274,570 @@ static int qaif_init(struct snd_soc_component *component)
 			__func__, drvdata->qaif_init_ref_cnt);
 	return 0;
 }
+
+
+static int qaif_platform_pcmops_open(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_dma_buffer *buf;
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	int ret, stream_dma_idx, dir = substream->stream;
+	struct qaif_pcm_data *data;
+	struct qaif_dmactl *dmactl;
+	struct qaif_dma_mem_info *dma_mem_info;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (v->alloc_stream_dma_idx)
+		stream_dma_idx = v->alloc_stream_dma_idx(drvdata, dir, dai_id);
+	else
+		return -EINVAL;
+
+	if (stream_dma_idx < 0)
+		return stream_dma_idx;
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data) {
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		return -ENOMEM;
+	}
+
+	data->stream_dma_idx = stream_dma_idx;
+
+	runtime->private_data = data;
+	map = drvdata->audio_qaif_map;
+	dmactl = qaif_get_dmactl_handle(substream, component);
+	if (!dmactl) {
+		kfree(data);
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		return -EINVAL;
+	}
+	buf = &substream->dma_buffer;
+	buf->dev.dev = component->dev;
+	buf->private_data = NULL;
+	buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
+
+	dma_mem_info = qaif_mem_alloc_attach(component,
+					qaif_platform_aif_hardware.buffer_bytes_max);
+	if (!dma_mem_info) {
+		kfree(data);
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		return -ENOMEM;
+	}
+
+	ret = clk_prepare_enable(drvdata->aud_dma_clk);
+	if (ret) {
+		dev_err(soc_runtime->dev, "failed to enable aud_dma_clk: %d\n", ret);
+		qaif_mem_dealloc_detach(component->dev, dma_mem_info);
+		kfree(data);
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		return ret;
+	}
+	ret = clk_prepare_enable(drvdata->aud_dma_mem_clk);
+	if (ret) {
+		dev_err(soc_runtime->dev, "failed to enable aud_dma_mem_clk: %d\n", ret);
+		clk_disable_unprepare(drvdata->aud_dma_clk);
+		qaif_mem_dealloc_detach(component->dev, dma_mem_info);
+		kfree(data);
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		return ret;
+	}
+
+	ret = qaif_init(component);
+	if (ret) {
+		dev_err(soc_runtime->dev, "qaif_init failed: %d\n", ret);
+		clk_disable_unprepare(drvdata->aud_dma_mem_clk);
+		clk_disable_unprepare(drvdata->aud_dma_clk);
+		qaif_mem_dealloc_detach(component->dev, dma_mem_info);
+		kfree(data);
+		return -EINVAL;
+	}
+	drvdata->qaif_init_ref_cnt++;
+
+	switch (dai_id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		drvdata->aif_substream[stream_dma_idx] = substream;
+		drvdata->aif_dma_heap[stream_dma_idx] = dma_mem_info;
+		buf->bytes = qaif_platform_aif_hardware.buffer_bytes_max;
+		buf->addr = drvdata->aif_dma_heap[stream_dma_idx]->dma_addr;
+		buf->area = (unsigned char *)drvdata->aif_dma_heap[stream_dma_idx]->vaddr;
+
+		snd_soc_set_runtime_hwparams(substream, &qaif_platform_aif_hardware);
+		runtime->dma_bytes = qaif_platform_aif_hardware.buffer_bytes_max;
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		drvdata->cif_substream[stream_dma_idx] = substream;
+		drvdata->cif_dma_heap[stream_dma_idx] = dma_mem_info;
+		buf->bytes = qaif_platform_cif_hardware.buffer_bytes_max;
+		buf->addr = drvdata->cif_dma_heap[stream_dma_idx]->dma_addr;
+		buf->area = (unsigned char *)drvdata->cif_dma_heap[stream_dma_idx]->vaddr;
+
+		snd_soc_set_runtime_hwparams(substream, &qaif_platform_cif_hardware);
+		runtime->dma_bytes = qaif_platform_cif_hardware.buffer_bytes_max;
+		break;
+	default:
+		break;
+	}
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(soc_runtime->dev, "setting constraints failed: %d\n", ret);
+		if (is_cif_dma_port(dai_id)) {
+			drvdata->cif_substream[stream_dma_idx] = NULL;
+			drvdata->cif_dma_heap[stream_dma_idx] = NULL;
+		} else {
+			drvdata->aif_substream[stream_dma_idx] = NULL;
+			drvdata->aif_dma_heap[stream_dma_idx] = NULL;
+		}
+		drvdata->qaif_init_ref_cnt--;
+		clk_disable_unprepare(drvdata->aud_dma_mem_clk);
+		clk_disable_unprepare(drvdata->aud_dma_clk);
+		qaif_mem_dealloc_detach(component->dev, dma_mem_info);
+		if (v->free_stream_dma_idx)
+			v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
+		kfree(data);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qaif_platform_pcmops_close(struct snd_soc_component *component,
+				       struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_pcm_data *data;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	data = runtime->private_data;
+
+	switch (dai_id) {
+	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+		drvdata->aif_substream[data->stream_dma_idx] = NULL;
+		qaif_mem_dealloc_detach(component->dev,
+					drvdata->aif_dma_heap[data->stream_dma_idx]);
+		drvdata->aif_dma_heap[data->stream_dma_idx] = NULL;
+		break;
+	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+		drvdata->cif_substream[data->stream_dma_idx] = NULL;
+		qaif_mem_dealloc_detach(component->dev,
+					drvdata->cif_dma_heap[data->stream_dma_idx]);
+		drvdata->cif_dma_heap[data->stream_dma_idx] = NULL;
+		break;
+	default:
+		break;
+	}
+
+	if (drvdata->qaif_init_ref_cnt > 0)
+		drvdata->qaif_init_ref_cnt--;
+	else
+		dev_dbg(component->dev, "%s: QAIF init ref cnt: %d, skipping decrement\n",
+					__func__, drvdata->qaif_init_ref_cnt);
+
+	if (v->free_stream_dma_idx)
+		v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
+	clk_disable_unprepare(drvdata->aud_dma_clk);
+	clk_disable_unprepare(drvdata->aud_dma_mem_clk);
+	kfree(data);
+	return 0;
+}
+
+static int qaif_platform_pcmops_hw_params(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_dmactl *dmactl;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int idx;
+	int ret;
+
+	dmactl = qaif_get_dmactl_handle(substream, component);
+	if (!dmactl)
+		return -EINVAL;
+	idx = v->get_dma_idx(dai_id);
+
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	ret = regmap_fields_write(dmactl->burst4, idx, QAIF_DMACTL_BURSTEN);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error updating burst4 field: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_fields_write(dmactl->shram_wm, idx, QAIF_DMACTL_WM_5);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error updating shram_wm field: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qaif_platform_pcmops_hw_free(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int reg;
+	int ret, idx;
+	unsigned int dai_id = cpu_dai->driver->id;
+	struct regmap *map = drvdata->audio_qaif_map;
+	struct qaif_dmactl *dmactl;
+
+	dmactl = qaif_get_dmactl_handle(substream, component);
+	if (!dmactl)
+		return -EINVAL;
+	idx = v->get_dma_idx(dai_id);
+
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	ret = regmap_fields_write(dmactl->enable, idx, QAIF_DMACTL_ENABLE_OFF);
+	if (ret)
+		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n", ret);
+
+	reg = QAIF_DMACFG_REG(v, idx, substream->stream, dai_id);
+	ret = regmap_write(map, reg, 0);
+	if (ret)
+		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n", ret);
+
+	return ret;
+}
+
+static int qaif_platform_pcmops_prepare(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_dmactl *dmactl;
+	struct regmap *map;
+	int bitwidth = QAIF_DMA_DEFAULT_BIT_WIDTH;
+	unsigned int channels = runtime->channels;
+	unsigned int rate = runtime->rate;
+	int ret, idx, dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	dmactl = qaif_get_dmactl_handle(substream, component);
+	if (!dmactl)
+		return -EINVAL;
+	idx = v->get_dma_idx(dai_id);
+	map = drvdata->audio_qaif_map;
+
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	clk_set_rate(drvdata->aud_dma_clk, rate * bitwidth * channels * QAIF_DMA_CLK_RATE_MULTIPLIER);
+	clk_set_rate(drvdata->aud_dma_mem_clk, rate * bitwidth * channels * QAIF_DMA_CLK_RATE_MULTIPLIER);
+
+	ret = regmap_write(map, QAIF_SID_MAP_REG(dir, dai_id),
+				drvdata->smmu_csid_bits);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to SID MAP reg: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, QAIF_DMABASE_REG(v, idx, dir, dai_id),
+				runtime->dma_addr);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to rdmabase reg: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, QAIF_DMABUFF_REG(v, idx, dir, dai_id),
+			(snd_pcm_lib_buffer_bytes(substream) >> QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to rdmabuff reg: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = regmap_write(map, QAIF_DMAPER_LEN_REG(v, idx, dir, dai_id),
+			(snd_pcm_lib_period_bytes(substream) >> QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
+	if (ret) {
+		dev_err(soc_runtime->dev, "error writing to rdmaper reg: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qaif_platform_irq_clear(struct qaif_drv_data *drvdata,
+				int dir, enum qaif_irq_type irq_type, int idx)
+{
+	int ret = 0;
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	unsigned int val_irqclr = BIT(idx);
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret |= regmap_write(map, QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, irq_type), val_irqclr);
+		ret |= regmap_write(map, QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, irq_type), val_irqclr);
+		ret |= regmap_write(map, QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type), val_irqclr);
+	} else {
+		ret |= regmap_write(map, QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, irq_type), val_irqclr);
+		ret |= regmap_write(map, QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, irq_type), val_irqclr);
+		ret |= regmap_write(map, QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, irq_type), val_irqclr);
+	}
+	return ret;
+}
+
+static int qaif_platform_irq_enable(struct qaif_drv_data *drvdata,
+				int dir, enum qaif_irq_type irq_type, int idx)
+{
+	int ret = 0;
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	unsigned int val_irqen = BIT(idx);
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+	} else {
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_OVERFLOW_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, irq_type), val_irqen, val_irqen);
+	}
+	return ret;
+}
+
+static int qaif_platform_irq_disable(struct qaif_drv_data *drvdata,
+				int dir, enum qaif_irq_type irq_type, int idx)
+{
+	int ret = 0;
+	const struct qaif_variant *v = drvdata->variant;
+	struct regmap *map = drvdata->audio_qaif_map;
+	unsigned int val_irq_disable = BIT(idx);
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_PERIOD_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_UNDERFLOW_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+		ret |= regmap_write_bits(map, QAIF_EE_RDDMA_ERR_RSP_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+	} else {
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_PERIOD_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_OVERFLOW_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+		ret |= regmap_write_bits(map, QAIF_EE_WRDMA_ERR_RSP_IRQ_EN_REG(v, irq_type), val_irq_disable, 0);
+	}
+	return ret;
+}
+
+static int qaif_platform_pcmops_trigger(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream,
+					 int cmd)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	struct qaif_dmactl *dmactl;
+	struct regmap *map;
+	int ret, idx;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	dmactl = qaif_get_dmactl_handle(substream, component);
+	if (!dmactl)
+		return -EINVAL;
+	idx = v->get_dma_idx(dai_id);
+	map = drvdata->audio_qaif_map;
+
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = regmap_fields_write(dmactl->dma_dyncclk, idx, QAIF_DMACTL_DYNCLK_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dma_dyncclk reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->enable, idx, QAIF_DMACTL_ENABLE_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dma enable reg: %d\n", ret);
+			return ret;
+		}
+		switch (dai_id) {
+		case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+			ret = qaif_platform_irq_clear(drvdata, substream->stream, QAIF_AIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to clear irq reg: %d\n", ret);
+				return ret;
+			}
+			ret = qaif_platform_irq_enable(drvdata, substream->stream, QAIF_AIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to enable irq reg: %d\n", ret);
+				return ret;
+			}
+			break;
+		case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+		case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+			ret = qaif_platform_irq_clear(drvdata, substream->stream, QAIF_CIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to clear irq reg: %d\n", ret);
+				return ret;
+			}
+			ret = qaif_platform_irq_enable(drvdata, substream->stream, QAIF_CIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to enable irq reg: %d\n", ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_fields_write(dmactl->dma_dyncclk, idx, QAIF_DMACTL_DYNCLK_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dma_dyncclk reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->enable, idx, QAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dma enable reg: %d\n", ret);
+			return ret;
+		}
+		switch (dai_id) {
+		case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
+			ret = qaif_platform_irq_disable(drvdata, substream->stream, QAIF_AIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to enable irq reg: %d\n", ret);
+				return ret;
+			}
+			break;
+		case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
+		case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
+		case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
+			ret = qaif_platform_irq_disable(drvdata, substream->stream, QAIF_CIF_IRQ, idx);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to enable irq reg: %d\n", ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static snd_pcm_uframes_t qaif_platform_pcmops_pointer(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	const struct qaif_variant *v = drvdata->variant;
+	unsigned int base_addr, curr_addr;
+	int ret, idx, dir = substream->stream;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	map = drvdata->audio_qaif_map;
+	idx = v->get_dma_idx(dai_id);
+
+	if (idx < 0) {
+		dev_err(soc_runtime->dev, "%s: Invalid DMA index: %d\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(map,
+			QAIF_DMABASE_REG(v, idx, dir, dai_id), &base_addr);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error reading from rdmabase reg: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read(map,
+			QAIF_DMACURR_REG(v, idx, dir, dai_id), &curr_addr);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error reading from rdmacurr reg: %d\n", ret);
+		return ret;
+	}
+
+	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
+}
+
+static int qaif_platform_cdc_dma_mmap(struct snd_pcm_substream *substream,
+				       struct vm_area_struct *vma)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	return dma_mmap_coherent(substream->pcm->card->dev, vma,
+				 runtime->dma_area, runtime->dma_addr,
+				 runtime->dma_bytes);
+}
+
+static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream,
+				      struct vm_area_struct *vma)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (is_cif_dma_port(dai_id))
+		return qaif_platform_cdc_dma_mmap(substream, vma);
+
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
-- 
2.34.1


