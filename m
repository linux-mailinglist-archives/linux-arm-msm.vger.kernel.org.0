Return-Path: <linux-arm-msm+bounces-118572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zJVtHviZU2qocAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:43:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8556744D53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:43:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LsmdFV72;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118572-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118572-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30CCF30439A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2273B14B2;
	Sun, 12 Jul 2026 13:41:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B43AFCE5;
	Sun, 12 Jul 2026 13:41:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863702; cv=none; b=pP2A39kRQd5cHgCHGIDHg2uvAF/JSJyoURfYXIojP/slbzp7N7Ek6jHpqj+GWNmaRWabZpHik2iUPKoIF7ozDcIQXFVJXYCPdTs5y/ufbMJHDkub+ia5pFjcSEC9wyOCUjyr8BCI9eMX4UPMGl80EQg8KESMvZZ+PYpOWHMWp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863702; c=relaxed/simple;
	bh=+A9kndqttoYHGEqgZAw0wNBCAuiAWMiF0HYejYCyznw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtkntTPHqpvyidrs98ZAPfFqFylP/MX7wev9LUOctTm/LwgRkPRyfFAtszs67I6rmb4+vEPGVGI30Vi/H085+63L7tU0R27GvR/GeomzoJZVLVb/+YzfgzIn4Z2B4wASJJTkDj9ndSZZDhbtw2+GGBgF3HrJIf9TuxAU+w4kZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsmdFV72; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZPhH2489122;
	Sun, 12 Jul 2026 13:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eppLnrn5n4C
	M2aKURuDbpv/VvLQNWXyxRiAS5zb65cU=; b=LsmdFV72uCPcElvjm06xRG54b6u
	uVPOf3uSef8nBK77x1IThqzPQtaBrWzrymIkGoKNffo4dOaqdhfNUyR6SEZ+GMoT
	dkG9V0sDgGq5V5eTye+moKH2j2cKH94gPqZQ48zV/0a/GEB9tXYZBS6toG5sWJzL
	3cfAtfxh+x/rSQE+AZ2Ir6yjHEI4wvJ9KJTAt/C1zJWP8LGDU+zLXivxgz4fzJJ7
	IxW8oPheVaGnr7ZsuELrtjp9eAkW2vFTRy3t1YcI4I/ufekIHqT2UaLCntan4CQM
	kpiHyw0eZIDJnGbk+S0cr23h4n+KIunNhjgJTqX/hYCh2mISTJ8m/Hl/WJQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gjs6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66CDfFmh026902;
	Sun, 12 Jul 2026 13:41:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewhmf83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66CDfDGp026807;
	Sun, 12 Jul 2026 13:41:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66CDfEMw026873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Jul 2026 13:41:14 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 5A81B642; Sun, 12 Jul 2026 19:11:12 +0530 (+0530)
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
Subject: [PATCH v4 6/7] ASoC: qcom: common: add DAI-node TDM slot helpers
Date: Sun, 12 Jul 2026 19:11:09 +0530
Message-Id: <20260712134110.3306763-7-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a53997e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=QQzHM_gvdhGi4T2-EgIA:9
X-Proofpoint-ORIG-GUID: BP3Fd7jopWT7G4BEoGz6oRAnobxH6m0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfXxODNPRJehi+u
 mZECTiffbi3gE18n6X/RGawxBwe1GIBppaTNt/59x/RbKCSLg29M7SvBzlfq6mqlBbA3aq+pn6F
 eg0a3Kioym2DOq9iAdT4UULX6eIKrB2icLQ1I6zsNkMWuogOUAXwT+6VLFUCsHhyJ0Xo25gO1/w
 Ic+r86GRsorvBO5AcdsnMvdGH0gCenApd8nLJpfJCcLm1G0em6p2Q2oMSnefAuz0BWzhQ2jhAby
 QH06nX5PnN1OzJNem0Yk2DKNPV+hFsUrkmXrUkqSGds/WloazpGv9ZXgHsMUpOr3SyensuuuK7A
 G9J21NlWL7yU/JmfLxPUqrWZbZchOISCn5ZvoB/GW/BxRhfdoa42e/nmeYUrCvqeK1yb1wgy/47
 xa+LjWFY0uVJLAuDPtI09276titkNybOmh+9N2OU9jf7b40iqQzHmdJYZ8sxMus3HTVFdEOTILL
 kZzNVyvfdBWb5zRP6aw==
X-Proofpoint-GUID: BP3Fd7jopWT7G4BEoGz6oRAnobxH6m0U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MyBTYWx0ZWRfX8MmuR7RqtTUR
 UTH8/6LRgTfc6Nbg8Y6ZQ6u7zBF+7wggK4oUdF89EYCJDVn2HXfueEvBhYVz9zszcti/OVja06s
 miyI5Wd5vhn5pU7UW6sj0YG1CvnEB0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607120143
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118572-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[args.np:url,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8556744D53

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
 sound/soc/qcom/common.c | 165 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  14 ++++
 2 files changed, 179 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index edc461169..08949b2c4 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -23,6 +23,171 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
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
+		ret = of_parse_phandle_with_args(cpu_np, "sound-dai", "#sound-dai-cells", 0,
+						 &args);
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
 	struct device *dev = card->dev;
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


