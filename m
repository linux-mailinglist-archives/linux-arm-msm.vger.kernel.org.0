Return-Path: <linux-arm-msm+bounces-112516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U7JuKPyNKWqNZQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:17:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52B66B4AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:16:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=l4ptiuOy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112516-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112516-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 174E330FBCF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EDA4C0431;
	Wed, 10 Jun 2026 15:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732B47F2C1;
	Wed, 10 Jun 2026 15:45:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106353; cv=none; b=lAYW9g41CPLNzUaDK7x16ZlJyIKbmMtIWGDPokNqHN5j8imhRCzpdntj6LEkbLesSyBTJZ8wJdh5MCF6GblYQd4adnMIY9D5oVn7DDnAvYUamrh+M2QUnODn4sXC/5H4myv3WZlRcyi7xfNpgsD689SqMtNX1/4PItLfoYGRMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106353; c=relaxed/simple;
	bh=sXyz17XRPKVCvDp9cotuz5Nx6ugue0TMNe+NRoHuQzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ezVu1uYFeFkw9htPHQXtDF5K/D5ZKvmFHP2cE9m+Vpj/cEjMab/2q7fBLVk8vf28Rh0njym9qvrzlT1Z7fpx1R1KE49XUTARBtapUWZvHVBYDc5mvJaKAsMQPvkHGdaNqL0OFB7IpBP6WGuDxP49q3bZZT7tcUBqzczDYtpxD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4ptiuOy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBpCn1073036;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=exsAjelmCnO
	u1b2R9SeM59qKN1qaRHruP698iMge+JI=; b=l4ptiuOyg8POQxUUZb91X3XVnoF
	YtVveKgxsx8tcD0o3wEP/F+0Oe81MgQovx7gPcegkCasvTtEev4V5v7eLmablCRs
	zpuf6GxjyJreXX5+tuRzFLNDdotgiNWSCFMZiAkaAcZb3sZ+KanEcxY0RfPM409w
	zuMA18mnalQHYy9Maji0dkh6B/WHuz8v+zdP5KUlld/oJPBYMG3cXuO7qtGrx5jJ
	NeQk8dN69HdUOxOVik4vuLjxazc0nTZuKLPp60WTldtLS8vrLBfr0dYxTk51i4Ig
	Zvbe7dLeQi4VSI+FdGkkWMk4eI4zlB3zYYZgQIrlAVnHp6a3Rrq5hGvQ/vQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvk162-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjWRS003509;
	Wed, 10 Jun 2026 15:45:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:33 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjXDO003545;
	Wed, 10 Jun 2026 15:45:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjXUw003543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:33 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 7E297639; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 5/6] ASoC: qcom: common: add DAI-node TDM slot helpers
Date: Wed, 10 Jun 2026 21:15:16 +0530
Message-Id: <20260610154517.134570-6-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: J9df5eXWKGCsfG5qy_gMLnDXyhfR-ly9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfXwoa4kTQXOwsu
 u7s+ha+KNuLG4J/fjhfIpoaa4r85E0BoH4lBae0kBIi4Sse5lJquw8pOZ1SBcKs8NW0iwzBy8Nd
 AsV/NhLjgJNLDzYB4nG3fJNVNrUqhasl5RFWgb98oeaEXsELUHcsL7a/M3XRWWDxEKyYAi0Zlgx
 b5Fsu5wQTWySGXwu7ZgXs25kdgXJakq7SATvuiJGHh5m38KTOjpK8v849Mlg9Gi30bZGbBNXnmj
 f5k2oGUNOlIaUrSbyxJNLNjk3MMK9i/YKn1zdnDrNRsb/lI7MITIJ9+9h092O0vxRhuf9v6OIEC
 uTdbEkwxQXnoQlzMepzaLZt6Lr8MfdNe7MPYIwY/+cFtNhJeTKpg1K6mDjGj09apBn/vfti/O8o
 3z8QCD3hHb0U4dZ4V09gMkE+P1fWSjCEDa1Qy38lL6qixtxX0+3a9RbgbQ4K6TM1RfaPG4slEe1
 449AuAjzOKkFU1m6XDQ==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=QQzHM_gvdhGi4T2-EgIA:9
X-Proofpoint-ORIG-GUID: J9df5eXWKGCsfG5qy_gMLnDXyhfR-ly9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112516-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,args.np:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D52B66B4AA

Add common helpers to parse standard dai-tdm-slot-* properties from the
CPU and codec child nodes of a backend DAI link and apply the result to
the active DAIs.

QCOM machine drivers already use qcom_snd_parse_of() to build links from
DT, but they lacked a shared helper to translate endpoint TDM properties
into snd_soc_dai_set_tdm_slot() calls. Boards therefore had to carry ad
hoc parsing or rely on non-standard DT properties.

The helpers parse endpoint masks, validate the shared slot count and
slot width, and program CPU and codec DAIs with the resulting slot
configuration. A cfg-based apply helper is provided for callers that
already parsed the DT data and want to avoid a second DT traversal.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 164 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  14 ++++
 2 files changed, 178 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767..5ca720ecf 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -23,6 +23,170 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+static struct device_node *qcom_snd_get_link_node(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct device_node *np;
+	struct device_node *cpu_np;
+	struct of_phandle_args args;
+	int ret;
+
+	if (!card->dev || !card->dev->of_node)
+		return NULL;
+
+	for_each_available_child_of_node(card->dev->of_node, np) {
+		cpu_np = of_get_child_by_name(np, "cpu");
+		if (!cpu_np)
+			continue;
+
+		ret = of_parse_phandle_with_args(cpu_np, "sound-dai", "#sound-dai-cells", 0, &args);
+		of_node_put(cpu_np);
+		if (ret)
+			continue;
+
+		if (args.np == rtd->dai_link->cpus[0].of_node &&
+		    args.args_count == 1 && args.args[0] == cpu_dai->id) {
+			of_node_put(args.np);
+			return np;
+		}
+
+		of_node_put(args.np);
+	}
+
+	return NULL;
+}
+
+static int qcom_snd_parse_tdm_slot(struct device_node *np,
+				   struct qcom_snd_tdm_slot_cfg *cfg)
+{
+	memset(cfg, 0, sizeof(*cfg));
+
+	return snd_soc_of_parse_tdm_slot(np, &cfg->tx_mask, &cfg->rx_mask,
+					 &cfg->slots, &cfg->slot_width);
+}
+
+static int qcom_snd_normalize_tdm_slots(struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+					struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	unsigned int slots;
+	unsigned int slot_width;
+
+	if (cpu_cfg->slots && codec_cfg->slots && cpu_cfg->slots != codec_cfg->slots)
+		return -EINVAL;
+
+	if (cpu_cfg->slot_width && codec_cfg->slot_width &&
+	    cpu_cfg->slot_width != codec_cfg->slot_width)
+		return -EINVAL;
+
+	slots = cpu_cfg->slots ?: codec_cfg->slots;
+	if (!slots)
+		return 0;
+
+	slot_width = cpu_cfg->slot_width ?: codec_cfg->slot_width;
+	if (!slot_width)
+		return -EINVAL;
+
+	cpu_cfg->slots = slots;
+	codec_cfg->slots = slots;
+	cpu_cfg->slot_width = slot_width;
+	codec_cfg->slot_width = slot_width;
+
+	return 0;
+}
+
+static int qcom_snd_parse_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+					struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+					struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	struct device_node *link_np;
+	struct device_node *cpu_np = NULL;
+	struct device_node *codec_np = NULL;
+	int ret;
+
+	link_np = qcom_snd_get_link_node(rtd);
+	if (!link_np)
+		return -EINVAL;
+
+	cpu_np = of_get_child_by_name(link_np, "cpu");
+	codec_np = of_get_child_by_name(link_np, "codec");
+	if (!cpu_np || !codec_np) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = qcom_snd_parse_tdm_slot(cpu_np, cpu_cfg);
+	if (ret)
+		goto out;
+
+	ret = qcom_snd_parse_tdm_slot(codec_np, codec_cfg);
+out:
+	of_node_put(codec_np);
+	of_node_put(cpu_np);
+	of_node_put(link_np);
+
+	return ret;
+}
+
+int qcom_snd_get_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+			       struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+			       struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	int ret;
+
+	ret = qcom_snd_parse_dai_tdm_slots(rtd, cpu_cfg, codec_cfg);
+	if (ret)
+		return ret;
+
+	return qcom_snd_normalize_tdm_slots(cpu_cfg, codec_cfg);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_get_dai_tdm_slots);
+
+int qcom_snd_apply_dai_tdm_slots_cfg(struct snd_soc_pcm_runtime *rtd,
+				     const struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+				     const struct qcom_snd_tdm_slot_cfg *codec_cfg)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	int i;
+	int ret;
+
+	if (!cpu_cfg->slots)
+		return 0;
+
+	ret = snd_soc_dai_set_tdm_slot(cpu_dai, cpu_cfg->tx_mask, cpu_cfg->rx_mask,
+				       cpu_cfg->slots, cpu_cfg->slot_width);
+	if (ret)
+		return ret;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_tdm_slot(codec_dai,
+					       codec_cfg->tx_mask,
+					       codec_cfg->rx_mask,
+					       codec_cfg->slots,
+					       codec_cfg->slot_width);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots_cfg);
+
+int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
+{
+	struct qcom_snd_tdm_slot_cfg cpu_cfg;
+	struct qcom_snd_tdm_slot_cfg codec_cfg;
+	int ret;
+
+	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
+	if (ret)
+		return ret == -EINVAL ? 0 : ret;
+
+	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
+}
+EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots);
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device_node *np;
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885..02b24caec 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,7 +9,21 @@
 
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
+struct qcom_snd_tdm_slot_cfg {
+	unsigned int tx_mask;
+	unsigned int rx_mask;
+	unsigned int slots;
+	unsigned int slot_width;
+};
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_get_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd,
+			       struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+			       struct qcom_snd_tdm_slot_cfg *codec_cfg);
+int qcom_snd_apply_dai_tdm_slots_cfg(struct snd_soc_pcm_runtime *rtd,
+				     const struct qcom_snd_tdm_slot_cfg *cpu_cfg,
+				     const struct qcom_snd_tdm_slot_cfg *codec_cfg);
+int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
-- 
2.34.1


