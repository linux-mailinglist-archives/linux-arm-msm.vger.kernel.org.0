Return-Path: <linux-arm-msm+bounces-111379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vKfhDempImoVbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F7647837
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X7St4Fj7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111379-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111379-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FF6A31163B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07194D2EC0;
	Fri,  5 Jun 2026 10:38:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2444CA291;
	Fri,  5 Jun 2026 10:38:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655894; cv=none; b=hh+5qOgXn9mqs7mjYEvrL7PK4FKaMNw0ePEDikROdWcvIohqT/YawVrGoFYZls1OUhSvwoSCZpT27P5LOJDRntPkYPwq2IUtStLPOxQGPpUosFQfxWrQzlsjC0J8vSWagz8aw9dHjzrldU7/CxmCbs5VwXvIoXhE3kgZxFnZtTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655894; c=relaxed/simple;
	bh=NCX5b2PWnYcFFo4oMMpi4qpMwuLqcQ8g8wnkXqpsvOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zoy51VF8Pb7d4nHUiYAcevcl/nt7Qsp1MetTlXJIXkKxBzmSMZ7sZG7UWtpESnzuF74LlgbsomFuDuAy4kpV1IFJO1ac5J6INaL4Ng9CL5/JpQ/LyVMB3Hohn4W4Yj73GXugsNzVqZi3PvRcmzF0KlA7US5yWnsPg6xWq/DvOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7St4Fj7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655AADio2975373;
	Fri, 5 Jun 2026 10:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VIrp6qfRXim
	6BlSHc5lkUiCh14qEpxqKogBP4mUjPUA=; b=X7St4Fj7NkZcUZQG4Z3XrSh7lex
	Vs3AQN5yuTJjUmuPtoJcsHPCxcUu73BTAcfvxTLajVSf/unJOc08+4JLWQyLLuAt
	/dsTCPc5P+0xI019PzHouy8w4t2niS+Enk+ChMP/bluAQiRW1sHi9kncvGIrKrjs
	GzJI0mczvso9XDH1GipVgGsSJDuBOUI/WxjX3SPH89PqWx2IaDPBsgFxzxmLsM+1
	6JImJRGKBHlyDYGpwXbwGrxlCsf7Grd9yMViWcx6URR9HOq/ppxVmOYID9a9TeRR
	M9M/dqhi+vTYFB0WMee7Bk2DigNWylwUjB6XYMq7bhlJEGMT4BJtEQoHs/w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9hds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:38:09 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6x011714;
	Fri, 5 Jun 2026 10:38:06 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register
Date: Fri,  5 Jun 2026 16:07:38 +0530
Message-Id: <20260605103739.3557573-13-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-GUID: rpjgNc0aegFxDyU0kXcG3ziDHjTQWMlt
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22a711 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=TYwhyaZNSizj3SvGGcAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXybN5ioQuYvmp
 A1ymJcvVlmUBzqTP3mc37YNqqu5MI5+wvkbu13mNf+vXTB4lSk4skBis0rHB7Pswk8P3+6Bxj7w
 FnVt+/VMwRwA3iNAhfX+CaPoB6Jbd2IyeVkU+nU8CI2NcH19d/cXyUcWe2dBVqsbEiaIsp8H0Ig
 1/ulfcIfJByv8JbkDH+1JtIcyGCA/Tx/bqi8yZ8M3uD3D+2slLAmO0PLZFzz9B+VlS9fjxAwUdY
 Ry5x+ne4r9Y0F+BqKGUOPoD7h32kKQ2fhwFC6ox+dW4NGyth5HI9X45s5Ce6M7DpxNUgXSjBVkw
 EkFPbMlvFpjqgXu3fEIRs5gUqdvdUGTl7FSTzc70xfhADxnOsN4osvyO0OeonyWdCn9vg+MUWXD
 COjKdinnq6zIQ9T0wvsex5D48DgqJbFaMx2xSyxAtj5Jp/t8kM0yNsx/ESOlCKnqm/WaUUX2D0j
 KgLhgWnEFNH6eJnsBRA==
X-Proofpoint-ORIG-GUID: rpjgNc0aegFxDyU0kXcG3ziDHjTQWMlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111379-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 926F7647837

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
 sound/soc/qcom/qaif-platform.c | 309 +++++++++++++++++++++++++++++++++
 1 file changed, 309 insertions(+)

diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
index 03d390705d4d..38130ee89930 100644
--- a/sound/soc/qcom/qaif-platform.c
+++ b/sound/soc/qcom/qaif-platform.c
@@ -808,3 +808,323 @@ static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
 
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
+
+static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
+								u32 stat_reg_addr,
+								u32 clr_reg_addr,
+								enum qaif_irq_type irq_type,
+								enum dma_type dma_type,
+								enum qaif_irq irq,
+								struct snd_pcm_substream **substream)
+{
+	const struct qaif_variant *v = drvdata->variant;
+	struct snd_pcm_substream *stream = NULL;
+	unsigned int reg = 0;
+	int dma_idx, stream_dma_idx, rv, num_dma = 0;
+	int stream_offset;
+	irqreturn_t ret = IRQ_NONE;
+	u32 mask = 0;
+
+	if (dma_type == DMA_TYPE_WRDMA)
+		stream_offset = (irq_type == QAIF_AIF_IRQ) ? v->wrdma_start
+							    : v->codec_wrdma_start;
+	else
+		stream_offset = 0;
+
+	if (dma_type == DMA_TYPE_WRDMA)
+		num_dma = (irq_type == QAIF_AIF_IRQ) ? v->num_wrdma : v->num_codec_wrdma;
+	else
+		num_dma = (irq_type == QAIF_AIF_IRQ) ? v->num_rddma : v->num_codec_rddma;
+	mask = GENMASK(num_dma-1, 0);
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
+			QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_PERIOD, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_PERIOD_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_PERIOD, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_OVERFLOW_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_OVERFLOW, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_UNDERFLOW_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_UNDERFLOW, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_ERROR, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_AIF_ERR_RSP_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_AIF_IRQ),
+			QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_AIF_IRQ),
+			QAIF_AIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_ERROR, substream);
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
+			QAIF_EE_RDDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_RDDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_PERIOD, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_PERIOD_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_PERIOD_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_WRDMA_PERIOD_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_PERIOD, substream);
+	}
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_OVERFLOW_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_OVERFLOW_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_WRDMA_OVERFLOW_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_OVERFLOW, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_UNDERFLOW_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_RDDMA_UNDERFLOW_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_RDDMA_UNDERFLOW_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_UNDERFLOW, substream);
+	}
+
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_RDDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_RDDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_RDDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_RDDMA, QAIF_IRQ_ERROR, substream);
+	}
+	if (summary_irq_status & QAIF_SUMMARY_BITMASK_CIF_ERR_RSP_WRDMA) {
+		ret |= qaif_process_dma_irq(drvdata,
+			QAIF_EE_WRDMA_ERR_RSP_IRQ_STAT_REG(v, QAIF_CIF_IRQ),
+			QAIF_EE_WRDMA_ERR_RSP_IRQ_CLR_REG(v, QAIF_CIF_IRQ),
+			QAIF_CIF_IRQ, DMA_TYPE_WRDMA, QAIF_IRQ_ERROR, substream);
+	}
+
+	return ret;
+}
+
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
+			QAIF_SUMMARY_IRQSTAT_REG(v), &summary_irq_status);
+	if (rv) {
+		dev_err(regmap_get_device(drvdata->audio_qaif_map),
+			"error reading from irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+	if (!(summary_irq_status & QAIF_ALL_CLIENTS_MASK))
+		return IRQ_NONE;
+	for (client = 0; client < ARRAY_SIZE(qaif_irq_clients); client++) {
+		if (summary_irq_status & qaif_irq_clients[client].mask)
+			ret |= qaif_irq_clients[client].client_irq_handler(drvdata, summary_irq_status);
+	}
+	return ret;
+}
+
+static int qaif_platform_pcmops_suspend(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map;
+
+	map = drvdata->audio_qaif_map;
+
+	regcache_cache_only(map, true);
+	regcache_mark_dirty(map);
+	if (drvdata->qaif_init_ref_cnt > 0) {
+		clk_disable(drvdata->aud_dma_clk);
+		clk_disable(drvdata->aud_dma_mem_clk);
+	}
+	return 0;
+}
+
+static int qaif_platform_pcmops_resume(struct snd_soc_component *component)
+{
+	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map = drvdata->audio_qaif_map;
+	int ret;
+
+	if (drvdata->qaif_init_ref_cnt > 0) {
+		ret = clk_enable(drvdata->aud_dma_clk);
+		if (ret)
+			return ret;
+		ret = clk_enable(drvdata->aud_dma_mem_clk);
+		if (ret) {
+			clk_disable(drvdata->aud_dma_clk);
+			return ret;
+		}
+	}
+	regcache_cache_only(map, false);
+	return regcache_sync(map);
+}
+
+static int qaif_platform_copy(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream, int channel,
+			       unsigned long pos, struct iov_iter *buf,
+			       unsigned long bytes)
+{
+	struct snd_pcm_runtime *rt = substream->runtime;
+	size_t copied;
+	void *dma_buf;
+
+	dma_buf = (void *)(rt->dma_area + pos +
+			   channel * (rt->dma_bytes / rt->channels));
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
+static int qaif_parse_smmu_sid(struct platform_device *pdev,
+				struct qaif_drv_data *drvdata)
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
+int asoc_qcom_qaif_platform_register(struct platform_device *pdev)
+{
+	struct qaif_drv_data *drvdata = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	dev_dbg(&pdev->dev, "%s\n", __func__);
+	if (!drvdata || !drvdata->variant) {
+		dev_err(&pdev->dev, "Invalid drvdata or variant\n");
+		return -EINVAL;
+	}
+
+	ret = qaif_parse_smmu_sid(pdev, drvdata);
+	if (ret)
+		return ret;
+
+	drvdata->audio_qaif_irq = platform_get_irq(pdev, 0);
+	if (drvdata->audio_qaif_irq < 0)
+		return drvdata->audio_qaif_irq;
+
+	ret = devm_request_irq(&pdev->dev, drvdata->audio_qaif_irq,
+			asoc_platform_qaif_irq, IRQF_TRIGGER_HIGH,
+			"qaif-irq-audio-core", drvdata);
+	if (ret) {
+		dev_err(&pdev->dev, "irq request failed: %d\n", ret);
+		return ret;
+	}
+	drvdata->qaif_init_ref_cnt = 0;
+	dev_dbg(&pdev->dev, "%s: Register QAIF Platform\n", __func__);
+	return devm_snd_soc_register_component(&pdev->dev,
+			&qaif_component_driver, NULL, 0);
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_qaif_platform_register);
+
+MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) PCM platform driver");
+MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


