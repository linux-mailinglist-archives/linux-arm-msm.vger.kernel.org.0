Return-Path: <linux-arm-msm+bounces-115342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6kl9AqqKQ2pRawoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:21:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF76E214A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:21:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W26Xj7ji;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 477BA30498C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDEC3A962E;
	Tue, 30 Jun 2026 09:20:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAE38425B;
	Tue, 30 Jun 2026 09:20:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811236; cv=none; b=lc4aSV6iI1yxHxkqheEnzD5WEp0cUDurPSBYZejNf4quXLPhzDq+HQaMeTbeGiFYm9FjstQfOCz8Zi2RYx3cNEu4dy7DPl61K/XpEqlQKdhnt1QEiRVkqzazdvJ23pdm6ZfAPEmD+VJWPjpU11vu49ShwyugYh9fW0hzdfJFjV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811236; c=relaxed/simple;
	bh=Fs0bQPILn8BvyBZDIC/uonCVXoOpKBAhNf5yHY5Nz9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/Qf3xUI8FOa2Ovp054f4ajeWHxV3Tw1VQpBoQuJLkYSTDSyM4EMZvkbZzkKVcDry4k9cSSCfZsoP3bWPzT3z0Q2/HSmKxa0YPNK9O/Ivdg7iOls6cFFdjPTevk6i4lFdAfAob+JZSc4OpX8ccnEo+CyF5jH3k5ZNkZsCd/tB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W26Xj7ji; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CLHC1090597;
	Tue, 30 Jun 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XQlMnEAzc4q
	Q9Qwx9+Wr+Xt1l3YHNBYAOq0+0uZgMrc=; b=W26Xj7ji/JVA0S/H7xgIcWtK+jI
	aRGYtsGzZRQOwt7/geideHTcM+Y07hdv+EyUMKWGeHOLP5aO/ckbiOVh50v+GXcO
	iMkGZY/2xoErStAUv+Vf0Bhjp2oVTu1aH3y6JXLLsoJ4pvL+Cgl6XLuF/cj6hHHW
	KJF+caH7XnmnFC5EXc7eFAcmJFRG/tAwrmgFqLhWqFzE6cVLYf8dbpSTAuxVOeBO
	5+9FP2PXU0AFiAkfV0TnR2E+7ehe/yfLjevDyXExY1R/Fu0Umsrcik9odMcsSFyg
	ZPBjrNKM9tynIZNUZ7vwJPyUWmwvJ7ztj1Ixuchgs66yU8WyCyALq0tiCug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5sgj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KInT010621;
	Tue, 30 Jun 2026 09:20:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmeny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KHVQ010592;
	Tue, 30 Jun 2026 09:20:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KH6Q010582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 83BA3635; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
Date: Tue, 30 Jun 2026 14:46:00 +0530
Message-Id: <20260630091605.4043426-3-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a438a56 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ZMHsmkTgFhVY9WPaUOcA:9
X-Proofpoint-GUID: y3_TF8mbuL1brXcRufogfvThkPO21rPW
X-Proofpoint-ORIG-GUID: y3_TF8mbuL1brXcRufogfvThkPO21rPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1MXbeSiqs+sL
 AZVMRQw7PKw1zOATbi9gH/olILmRiCXkuwVIkph/ZlrHHvGU6OyARkfLZatI9eKhDWVV2OXd7pT
 sVqHdOzrSE5LgXHz9ZOB8h1RpM6YqExbBRkViHIs7Z1bRW+2htJ0nhfv0QlvsAtVwnhgc7QuQ3r
 q8o3ooJHqveqqo1PkkjpkY+xBnobTUids+z3JGix61Oh2ZCI0EHJOYveXWxWuGysRmqNXGCRxSX
 tH40vqtHooDM0TNaaCgaPpP0b73Jttna9vf2OqAf2xBpNyvmO3C49UX194AqL796+pHnU8aTyCz
 nrNP1buaoLPZtkzih7fzaKWAoi6N4DfghkWBnxN0icrJON9qhlENqKVnRqxHExM1TFNSaPB5AWR
 RkcuvQ5lIAyv6XrW52JPpnWZLBMTwMcJnIdtiHJ2dPjHQdEb3YOGRb2+eGhc+ivEMpGnX/16T8e
 2H99hyVruTQAdyCTe2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfXx/Zb3sCVmjWk
 8r0t0PpvVpDqAHVy3h9lmqnBN1FXLxWV7GXlsKgrjEPmR9EnR6eKcMAWaDoEkPhnaNGu7zZRyah
 CohGqmozsMxl3hHkswHa6HgcLdxGxoU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115342-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6BF76E214A

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
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 143750afb16c..7a612d90c04d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -336,6 +336,52 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
+			      unsigned int tx_mask,
+			      unsigned int rx_mask,
+			      int slots, int slot_width)
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
@@ -365,6 +411,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
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
@@ -393,6 +450,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
 		/* MI2S specific properties */
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
 			priv = &data->priv[id];
 			priv->mclk = of_clk_get_by_name(node, "mclk");
 			if (IS_ERR(priv->mclk)) {
@@ -448,6 +506,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
 	cfg.q6i2s_ops = &q6i2s_ops;
 	cfg.q6dma_ops = &q6dma_ops;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
+	cfg.q6tdm_ops = &q6tdm_ops;
 	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
 
 	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);
-- 
2.34.1


