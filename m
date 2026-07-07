Return-Path: <linux-arm-msm+bounces-117392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 801gOdRNTWrPxwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:04:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D171ED80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:04:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xz7eymnb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117392-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117392-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A941130C335D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01FC3A6EF1;
	Tue,  7 Jul 2026 19:01:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C580388384;
	Tue,  7 Jul 2026 19:01:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450889; cv=none; b=o5RjMnM8QbpiriBOlEu40pt8MtgyoDZv4fV83NJtUPMoCdIPproCgUDBSPWgOWLZZnMAYlRpdE8dBRFNkVMofak7ADlmORJrDY8Nsrw4aQTyV6YI15hV1dMnxhepj4EwKiR4B8TQKPP8oujuQvu+fT+3riu8M4C907IFKi/lyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450889; c=relaxed/simple;
	bh=v+gCo89IPjVYfBSOkNPUu5a2SaURsUzzvAUbgvvqI0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UV5VUKCZzXNrDQp5DhtS8eHJX7e5TpWwywO9kImv1vQr7reSmMifUC6DEupGgKXhLbdtq9xOat1GUOFURd+CzfHpCEQ8Ve4jpU0RfIVMywH6Ziy5j6ck6cZwe1NupNT9utdwDDc2kk0VUMpLLQo7bxMG9Kaaft+9QH+Eh+bGLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xz7eymnb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTBrW018008;
	Tue, 7 Jul 2026 19:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g+MANux4qTJ
	FOe74YjSCE9eppWhAWyd+njv7BzlaH/I=; b=Xz7eymnb7J+qPemYit78HzFr2wO
	xcqCxfoAzYv7bXScomxR7l8CeArRNS2yecoaVjLEOzGa34A3r0q8IddHBO/cblOf
	CTHVoT1vW27zo4Y0yee7MipLUXJJjh00FK1ph1VK+50PHLOHpBOUm5mbXjbtT/2z
	aPsTyNlsmMHr1XfxmNh+jugowges7JCY58Eo4kInnUicm048ArCuBpI3Ak2IuioT
	hBs+5p0pnSI42AJPF3S6flvcHu5e1KCQd8Zf3Tt2qkk5AU4DwpKAys3nj8AzFscA
	fXREchujHYW9X9FzeD/qTrT5njlBrzwBoBsmogmU6Zgh0PzgXRMRvHDqjtg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2vr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 667J1Ar9019108;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k6b46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 667J1990019082;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 667J19Wt019075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id AB8BC63E; Wed,  8 Jul 2026 00:31:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v3 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
Date: Wed,  8 Jul 2026 00:31:01 +0530
Message-Id: <20260707190106.2876465-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: riXIcXE9e_zyRs7Nht7RDOhQ3Novn4q_
X-Proofpoint-ORIG-GUID: riXIcXE9e_zyRs7Nht7RDOhQ3Novn4q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX/EgSHtI+SyhQ
 b/S7EUZJlnH6dPRPl9TfNeAMO8Rguggxy8iWoCURrQZa/okuipoEDiJ8HvnJd5xZ7cdc4halfvn
 H/1jS9f/ns86aoJLx/2mtnQ4OScm1dls0a1XSLE8TgKqyYJMyjNky4P7SUvJ7LjqC+zM0ww9GZ2
 HZ16e8spqOrXBDQy3ovXfGm+9hKyTWlVGexgXU5e7iKy2fyjeQFKRURejcxCYvRtm/O7veD70KM
 DvTNB+G5et4tc/4Ppr210EYZXomOu20MJPrQpusXw229p7IZISgOwskz/vFch+mK8xwYpuOod1G
 zW5bH4lsSZHoXpmilZwItZyzejg+IYqn6Ho88xhGaHnUVbSx7wn2xcdxeK3y63ASC6homIxt7hj
 BPkFR2hYydz5SILPTMa1n6/vjeKlmIoGLQVg37z8nanBI+IIQT5vKDX/iUMycJT4+bz+e//7BGE
 rWG0K+kJ1sU6e5wY6TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX7Ms7hbJ1a4Hs
 rawQaBEsQ/oXgW8H2UyGpu0ELeBqKUdcNkEJQ9PP1fHkg7itddG5wXJnGe92VkzYgDY4I4YYAvx
 kGgsn32EvRD5gU0qcELTwcUtYRrXgzs=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d4cfa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=ZMHsmkTgFhVY9WPaUOcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117392-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E8D171ED80

Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
backends can be configured through the normal ASoC hw_params and DAI
setup flow.

The TDM set_tdm_slot() callback validates the supported slot width and
slot count, stores the active slot mask in the AudioReach module
configuration, and leaves existing DMA, I2S and HDMI paths unchanged.

Reuse the existing LPASS child-clock handling for TDM nodes as well as
MI2S nodes, since TDM backends also request optional backend clocks
through the machine driver set_sysclk() path.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 461e65526..9c278224d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -339,6 +339,50 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
+			      unsigned int rx_mask, int slots, int slot_width)
+{
+	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
+	unsigned int cap_mask;
+
+	if (slot_width != 16 && slot_width != 32) {
+		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
+		return -EINVAL;
+	}
+
+	switch (slots) {
+	case 2:
+		cap_mask = 0x03;
+		break;
+	case 4:
+		cap_mask = 0x0f;
+		break;
+	case 8:
+		cap_mask = 0xff;
+		break;
+	case 16:
+		cap_mask = 0xffff;
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
+		return -EINVAL;
+	}
+
+	switch (dai->id) {
+	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
+		cfg->nslots_per_frame = slots;
+		cfg->slot_width = slot_width;
+		cfg->slot_mask = ((dai->id & 0x1) ? tx_mask : rx_mask) & cap_mask;
+		break;
+	default:
+		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops q6dma_ops = {
 	.prepare	= q6apm_lpass_dai_prepare,
 	.startup	= q6apm_lpass_dai_startup,
@@ -368,6 +412,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
 	.trigger	= q6apm_lpass_dai_trigger,
 };
 
+static const struct snd_soc_dai_ops q6tdm_ops = {
+	.prepare	= q6apm_lpass_dai_prepare,
+	.startup	= q6apm_lpass_dai_startup,
+	.shutdown	= q6i2s_lpass_dai_shutdown,
+	.set_tdm_slot	= q6tdm_set_tdm_slot,
+	.hw_params	= q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
+	.set_sysclk	= q6i2s_set_sysclk,
+	.trigger	= q6apm_lpass_dai_trigger,
+};
+
 static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
 	.name = "q6apm-be-dai-component",
 	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
@@ -396,6 +451,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
@@ -465,6 +521,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	cfg.q6i2s_ops = &q6i2s_ops;
 	cfg.q6dma_ops = &q6dma_ops;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
+	cfg.q6tdm_ops = &q6tdm_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
 	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
-- 
2.34.1


