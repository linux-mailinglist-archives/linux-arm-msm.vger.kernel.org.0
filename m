Return-Path: <linux-arm-msm+bounces-115669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JpUiD4nzRGqg3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3BD6EC7D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J0wRBr3y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16FE53099707
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA66438FE4;
	Wed,  1 Jul 2026 10:58:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEE44BC8E;
	Wed,  1 Jul 2026 10:58:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903506; cv=none; b=VzU/GHRuhOI6PMtOMaRLwBrR8BguJkydqBk7a95aMraPfTZHpQZOyxBApCUqhdMXFV1F9wyfCXHOsfwXplcLu05vEuk1nKK/U9iRoXdUdkhqVHQ7qkfLVQuaTqjXezrhK9iHsNsda2l0GagfKMMx3WfBNqFUkJB/io24RdNGmeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903506; c=relaxed/simple;
	bh=h9yL8QHxZSuyQKrOT/oqxRtRin0x9gSd2jFjLBmZ8eM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fx3C3Ptuk+PS+87OlDpoET6IQVOCMM1YNKvc3xdRUcSKaNDEvI2rFT4jKjzolQB1H9W81nmaIbe/kKsjBGUEN+yr4VGDfSQdpO4LCHyQKfDfZ9B/FqJK5Bh+RLua2sJzRn1AVAiwDMwnaCC+ra/5RnNYMUWStgtM+689/Yy0I1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J0wRBr3y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Uji643978;
	Wed, 1 Jul 2026 10:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y/m86mf3No8
	v0OgMYcJ6AdFJJ8Ib+KWYEqlQA5G+xs4=; b=J0wRBr3yLm5zsFJjVclHuNOVR1v
	pb0pHtgEYOeS/Xig2N3RK0cWxMsepC12Ofwk5CXEy7LIJCkkPxiXzStt3yrc12I/
	lo1sO1I1DuOYNWizrzBKkLcuaVc3NQp8d6aUwYDSbivu93hUrQhe5mxveSY5ydCx
	XLZKepZJpeMVpiny0EGmSaY708F4PipfCAdKwN93kToPoJZWccHFjHkAKP6+oOKN
	hy/RXduZSq0k2etu+3+ff/d2gYsEpSxd48fFMP6Ng7yF6xw9XVKGCNmRdtvek5UA
	9fkg6BjxXXUwwtwhqWoi+oK0nZd3iMTD9GSYM4WjrzbHUBKyRgPRSjWeaLw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4ds9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 10:58:20 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Aw2JD011886;
	Wed, 1 Jul 2026 10:58:17 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register
Date: Wed,  1 Jul 2026 16:27:55 +0530
Message-Id: <20260701105757.2779738-10-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX/2Zzq8iLdk5X
 jQXBMmLvkGhRle3GyniFz6tSZ2OTLMQif6J8Ss6yX15vOnrlgjg5iblDx/HOrbYOyAYUxNTod0H
 PzbvMD1Md2OsUVRS5F4a1BYHeNbBoYc=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f2cd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=S2dL2tZ3JxQeR3fWPTIA:9
X-Proofpoint-ORIG-GUID: NcWKYo-upgEAaxvWduHZ-ybVTFklCK_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX1TIKszvoZH+z
 mdhk/R8hPRT2KfKLx5Bq0f/O0A02MkRHVHHxe0PlVFXG68DwF3MClAsIPCRVXjz5cf9q0JPXPwi
 HvSLck8iudJif/5ygo3DajrhsAZeRLluzBOtHK/9JqONAh4iE9OeEQX38LVgEpPZNO0cpf5IT8g
 m7NCTIjoXhfDeDYP1Ly+K6wNB8UbE1GqaS/KlNseDkuv5uc7h/7yBRF0cAPi/Uy+aE/rdg8E1IO
 qplpBfHOWdj5jBGWt0h+F18V8k2i6vb0GpMjc4m4et/LCdHdE6voc4F/mjXnTJTr7AjkS8s/6VT
 dwzc56/3buswC5RSXs4I8k7Yq53LHwQArKVyaeGOy4Pqm31S7LsLzzfK59PXDAK1+j/AwY1YzXN
 /jtpbgA4tlNXNmUroPYP8FL9EhP9vp2V7C+FoHYT8OogzaUBgmFKXaRDs8hapYQRjuQMg/KDSti
 L4acXSpSd5Degk6NYZA==
X-Proofpoint-GUID: NcWKYo-upgEAaxvWduHZ-ybVTFklCK_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD3BD6EC7D2

Complete the QAIF PCM platform support by registering the component,
requesting the QAIF interrupt, and handling DMA interrupt events.

The QAIF hardware reports DMA events through a summary interrupt register
and per-DMA status registers. Add the top-level IRQ handler and AIF/CIF DMA
handlers so period interrupts notify ALSA with snd_pcm_period_elapsed(),
xrun conditions are reported, and bus errors stop the affected stream.

Add suspend and resume callbacks to put the QAIF regmap into cache-only
mode while the clocks are disabled, then re-enable the clocks and sync the
cached register state on resume.

Read the SMMU stream ID from the iommus property during platform
registration so the existing resource setup code can program the SID
mapping correctly. Also add the component copy callback for transferring
PCM data through the runtime DMA buffer.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/qaif-platform.c | 331 +++++++++++++++++++++++++++++++++
 1 file changed, 331 insertions(+)

diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
index 643def474aa0..b2d175811b2f 100644
--- a/sound/soc/qcom/qaif-platform.c
+++ b/sound/soc/qcom/qaif-platform.c
@@ -916,2 +916,333 @@ static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
+
+static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
+					u32 stat_reg_addr,
+					u32 clr_reg_addr,
+					enum qaif_irq_type irq_type,
+					enum qaif_dma_dir dma_type,
+					enum qaif_irq irq,
+					struct snd_pcm_substream **substream)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct snd_pcm_substream *stream = NULL;
+	unsigned int reg = 0;
+	int dma_idx, stream_dma_idx, rv, num_dma = 0;
+	int stream_offset;
+	irqreturn_t ret = IRQ_NONE;
+	u32 mask = 0;
+
+	if (dma_type == QAIF_DMA_WRDMA)
+		stream_offset = (irq_type == QAIF_AIF_IRQ) ? v->wrdma_start
+							    : v->codec_wrdma_start;
+	else
+		stream_offset = 0;
+
+	if (dma_type == QAIF_DMA_WRDMA)
+		num_dma = (irq_type == QAIF_AIF_IRQ) ? v->num_wrdma : v->num_codec_wrdma;
+	else
+		num_dma = (irq_type == QAIF_AIF_IRQ) ? v->num_rddma : v->num_codec_rddma;
+	mask = GENMASK(num_dma - 1, 0);
+	rv = regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
+	if (rv) {
+		dev_err(regmap_get_device(drvdata->audio_qaif_map),
+			"error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
+		return IRQ_NONE;
+	}
+
+	regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask);
+
+	for (dma_idx = 0; dma_idx < num_dma; dma_idx++) {
+		stream_dma_idx = dma_idx + stream_offset;
+		if ((reg & BIT(dma_idx)) && substream[stream_dma_idx]) {
+			stream = substream[stream_dma_idx];
+			switch (irq) {
+			case QAIF_IRQ_PERIOD:
+				snd_pcm_period_elapsed(stream);
+				ret = IRQ_HANDLED;
+				break;
+
+			case QAIF_IRQ_OVERFLOW:
+			case QAIF_IRQ_UNDERFLOW:
+				dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
+						     "QAIF DMA xRun\n");
+				ret = IRQ_HANDLED;
+				break;
+
+			case QAIF_IRQ_ERROR:
+				snd_pcm_stop(stream, SNDRV_PCM_STATE_DISCONNECTED);
+				dev_err(regmap_get_device(drvdata->audio_qaif_map),
+					"QAIF bus error\n");
+				ret = IRQ_HANDLED;
+				break;
+			}
+		}
+	}
+	return ret;
+}
+
+static irqreturn_t qaif_aif_irq_handler(struct qaif_drv_data *drvdata, u32 summary_irq_status)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	irqreturn_t ret = IRQ_NONE;
+	struct snd_pcm_substream **substream = drvdata->aif_substream;
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+					    QAIF_AIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR,
+					    substream);
+	}
+	return ret;
+}
+
+static irqreturn_t qaif_cif_irq_handler(struct qaif_drv_data *drvdata, u32 summary_irq_status)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	irqreturn_t ret = IRQ_NONE;
+	struct snd_pcm_substream **substream = drvdata->cif_substream;
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_PERIOD,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_PERIOD,
+					    substream);
+	}
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_OVERFLOW,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_UNDERFLOW,
+					    substream);
+	}
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_RDDMA, QAIF_IRQ_ERROR,
+					    substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+					    QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+					    QAIF_CIF_IRQ, QAIF_DMA_WRDMA, QAIF_IRQ_ERROR,
+					    substream);
+	}
+
+	return ret;
+}
+
+#define QAIF_ALL_CLIENTS_MASK (QAIF_BITMASK_AIF_RDDMA_WRDMA | QAIF_BITMASK_CIF_RDDMA_WRDMA)
+
+static const struct qaif_irq_map qaif_irq_clients[] = {
+	{ QAIF_CLIENT_ID_AIF_DMA,	QAIF_BITMASK_AIF_RDDMA_WRDMA, qaif_aif_irq_handler},
+	{ QAIF_CLIENT_ID_CIF_DMA,	QAIF_BITMASK_CIF_RDDMA_WRDMA, qaif_cif_irq_handler},
+};
+
+static irqreturn_t asoc_platform_qaif_irq(int irq, void *data)
+{
+	struct qaif_drv_data *drvdata = data;
+	const struct qaif_variant *v = drvdata->variant;
+	u32 summary_irq_status;
+	int rv, client;
+	irqreturn_t ret = IRQ_NONE;
+
+	rv = regmap_read(drvdata->audio_qaif_map,
+			 QAIF_SUMMARY_IRQSTAT_REG(v),
+			 &summary_irq_status);
+	if (rv) {
+		dev_err(regmap_get_device(drvdata->audio_qaif_map),
+			"error reading from irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+	if (!(summary_irq_status & QAIF_ALL_CLIENTS_MASK))
+		return IRQ_NONE;
+	for (client = 0; client < ARRAY_SIZE(qaif_irq_clients); client++) {
+		if (summary_irq_status & qaif_irq_clients[client].mask)
+			ret |= qaif_irq_clients[client].client_irq_handler(drvdata,
+									   summary_irq_status);
+	}
+	return ret;
+}
+
+static int qaif_platform_pcmops_suspend(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map = drvdata->audio_qaif_map;
+
+	regcache_cache_only(map, true);
+	regcache_mark_dirty(map);
+	return 0;
+}
+
+static int qaif_platform_pcmops_resume(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map = drvdata->audio_qaif_map;
+
+	regcache_cache_only(map, false);
+	return regcache_sync(map);
+}
+
+static int qaif_platform_copy(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream,
+			      int channel, unsigned long pos,
+			      struct iov_iter *buf, unsigned long bytes)
+{
+	struct snd_pcm_runtime *rt = substream->runtime;
+	size_t copied;
+	void *dma_buf;
+
+	dma_buf = (void *)(rt->dma_area + pos +
+		   channel * (rt->dma_bytes / rt->channels));
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		copied = copy_from_iter(dma_buf, bytes, buf);
+		if (copied != bytes)
+			return -EFAULT;
+	} else {
+		copied = copy_to_iter(dma_buf, bytes, buf);
+		if (copied != bytes)
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver qaif_component_driver = {
+	.name		= DRV_NAME,
+	.open		= qaif_platform_pcmops_open,
+	.close		= qaif_platform_pcmops_close,
+	.hw_params	= qaif_platform_pcmops_hw_params,
+	.hw_free	= qaif_platform_pcmops_hw_free,
+	.prepare	= qaif_platform_pcmops_prepare,
+	.trigger	= qaif_platform_pcmops_trigger,
+	.pointer	= qaif_platform_pcmops_pointer,
+	.mmap		= qaif_platform_pcmops_mmap,
+	.suspend	= qaif_platform_pcmops_suspend,
+	.resume		= qaif_platform_pcmops_resume,
+	.copy		= qaif_platform_copy,
+};
+
+static int qaif_parse_smmu_sid(struct platform_device *pdev,
+			       struct qaif_drv_data *drvdata)
+{
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+	u32 sid;
+
+	ret = of_property_read_u32_index(np, "iommus", 1, &sid);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to read SMMU SID from iommus property: %d\n", ret);
+		return ret;
+	}
+
+	drvdata->smmu_csid_bits = sid & 0x1;
+	dev_dbg(&pdev->dev, "sid=0x%x csid=0x%x\n", sid, drvdata->smmu_csid_bits);
+	return 0;
+}
+
+/**
+ * asoc_qcom_qaif_platform_register - Register the QAIF PCM platform component
+ * @pdev: Platform device
+ *
+ * Reads the SMMU stream ID from DT, requests the QAIF interrupt and
+ * registers the PCM platform component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+	int ret;
+
+	if (!drvdata || !drvdata->variant)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid drvdata or variant\n");
+
+	ret = qaif_parse_smmu_sid(pdev, drvdata);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to parse SMMU SID\n");
+
+	drvdata->audio_qaif_irq = platform_get_irq(pdev, 0);
+	if (drvdata->audio_qaif_irq < 0)
+		return dev_err_probe(&pdev->dev, drvdata->audio_qaif_irq,
+				     "Failed to get IRQ\n");
+
+	ret = devm_request_irq(&pdev->dev, drvdata->audio_qaif_irq,
+			       asoc_platform_qaif_irq, IRQF_TRIGGER_HIGH,
+			       "qaif-irq-audio-core", drvdata);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "irq request failed\n");
+
+	drvdata->qaif_init_ref_cnt = 0;
+	mutex_init(&drvdata->stream_lock);
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &qaif_component_driver,
+					      NULL, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register platform component\n");
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_platform_register);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) PCM platform driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


