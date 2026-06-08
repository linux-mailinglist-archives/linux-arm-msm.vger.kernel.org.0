Return-Path: <linux-arm-msm+bounces-111895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MtaeLCvGJmpukQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:39:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57D656B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:39:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=soPQGuAj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111895-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111895-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC447301107C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E5737F001;
	Mon,  8 Jun 2026 13:39:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E737D11A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:39:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925990; cv=none; b=JidZFqc03y7GexBQzKH3Dd2E9YNyhDbcOwWDGIP+V0pC6PPA7vDqPyOkIw0hUWw8lBVSDpEHrTSpFoBCEbrf+yQGvaYG/aNrxoCYekavo/uQCd3ook+z2QlCbfEixOkS5sklb+dBBhi3MKVz7mks6eWBn/XBwUlr3J3+dig7WGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925990; c=relaxed/simple;
	bh=Fku3y1CGF4nhcunbUPtMiClanJb89VvqUuwkh2+knqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elPbcHk0hZV/DTl0MME0d9JfM9oZ5wlMs+jqsMuoKUlb4OBNqUZVhPwCmJUQmqbkD0R4OCFQvJ3FxO0t+7ouMrXvrNmxXlPeHyNetsks/xx06StiOkMR+A2soNXFubyi4tKSFXiGkMCFaeTt9hxk67C3jdA3TFB+T28smkJe7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soPQGuAj; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304ddfcf72cso4280767eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925988; x=1781530788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=soPQGuAj9/yrkCa/JTz0MZfBohNMYiXxWF1wuZyHw0E767AaKJBHEUpFOmzq234XaC
         /hCegh+6US0IqsecrM7eiRTzGzGsbXFRwDTqv/FIC4mp3QU8tFykEOOpLjk/ISNRQWJY
         bnNVfCoU1EqOkP7f2VyQm8yXea2cXSas6GrXocyWIk4KdVqZM3iI5ExkGfecSD+n/ztf
         hHkRY5XDhcXyvZWg4HAHJwE9gbKIdMjcH2k6IDtcZuJ6BYodVA6E5a8ncRb6QBFif8pL
         Km6Asj8D6wVHL37OFRRw4CBwhp7TdH0haqL+9NqHvXcpEllaeMXGbJzIoEqzKyMh2GFT
         VSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925988; x=1781530788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=ldU4GiFvZEjOcNIDsrN0WtMbkTATXP0jw31KRvjQExJeszRiCGRtPaeXbs1/ILfSeD
         gpA/M3j0vshj3z1yQ71PKcMl2RIh7/6lPlQulga/0jMcMzhnqF3w+j4b9GcT106e4kJ/
         WTQzJe8ZJYAaoMdFj2K9Npz97Wxjzpo5o+7qdc3M+izQ5jd36HCnwmUJTo4+JxAL2ss4
         scJYdptp3fUgyHIgOsmFY9291g0YchgFaof+Mfy9VEn1hX7iRSsogCQ4WGzRiZj/C9YY
         qhnE61Y2pS2FtCKeWC+ttowt1d6cEOoucxpWZwGda4B3YjcRm6KmzZKR1qeGXqN2Thei
         IjWg==
X-Forwarded-Encrypted: i=1; AFNElJ+kA949F2GS69MvLuvmRUjcTr13+mUrNvbQLXOiPoylF9wGBYVkypgn/0LhyCnZt/vLYGKB3mvsWvkrGwzC@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6YF82EvfUTAPl1BkZVjlJP3ZtXNHYQs5EbnwJIDAHBB9djFl
	CH03kuuyS7yOWgAbEa9rfkC1HJb2mscSX45veGnf25VT16QXgLAZitXP
X-Gm-Gg: Acq92OGZHvXvigVkfKpzABpwkoDyA3/oAcmwN5coJ1wV/kshI3oX6NJiDB73+6colJa
	bNKx6u8PoJ08I3FHaQasp1U3b7sesTGwIam9nijzAd8mG5Y0Ow0wnO1QVa9Q73ChLOuRRDROKix
	yb2mcoaed6doSvmhMu5AQId2viIRgx+BerQfxSZlzGMUkk5SgSJ7V0jUEr0O6ehF3jWHTYxoVMy
	FyDMtbTryUym/7cFM2yOl3d+yx/EvwEvP08PdilaWnz5Tyf99a0WVUMf70egM+TOyC/8rlP1TU7
	nKiysU56IaS4cw/BjoeBMCmdIy2AYQUE6gi8o+8TFjo9+U81ARIbYodUGrrNeeazML/2vn4Irph
	GzNCDto6eqm+TjW8IO/wMFPNW42UhpyRDddzxJ6mAglmcA0nrl171v+IVAC92sPA/36hqnAeTvy
	H7BtkwBzi9GQB1f/itlT/QTVXfE8I39nUkeRMKafrcC/KrpZ4OGWH5aX3s03F+MIYqgK0UM3mzW
	eZGlqKeqoAcNXCsgCYzyfI=
X-Received: by 2002:a05:7300:230b:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-3077b22df0fmr7429361eec.25.1780925987987;
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:11 -0300
Subject: [PATCH 1/3] ASoC: qcom: common: use scoped OF node handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-1-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4019;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Fku3y1CGF4nhcunbUPtMiClanJb89VvqUuwkh2+knqc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxySsmP6Uc+po3Tn/8kP/s2fH8w/HHkoXC4xxXeCRb
 /CAZ39pRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk1y+GPxwrOKKqzBacSJxt
 9/tcgR5Dgp68lparbeMO/TVCrQstljMynC35KmN89b1HxdbVHh9ufDaRTzlueZRld/yU+ZP/P/X
 ewwAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111895-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:herve.codina@bootlin.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:notify@kernel.org,m:cassiogabrielcontato@gmail.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,gmail.com,perex.cz,bootlin.com,broadcom.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.infradead.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F57D656B9D

qcom_snd_parse_of() manually drops the link child node and the
cpu/platform/codec child nodes on error paths and at the end of each
iteration.

Use for_each_available_child_of_node_scoped() for the link node and
__free(device_node) for the named child nodes. This keeps the existing
ownership rules for DAI component phandle references, while removing the
manual cleanup labels from a path that has previously needed OF refcount
fixes.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/qcom/common.c | 47 +++++++++++++++--------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..edc4611691f7 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -25,10 +25,6 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
-	struct device_node *np;
-	struct device_node *codec = NULL;
-	struct device_node *platform = NULL;
-	struct device_node *cpu = NULL;
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
 	struct of_phandle_args args;
@@ -82,12 +78,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
-		if (!dlc) {
-			ret = -ENOMEM;
-			goto err_put_np;
-		}
+		if (!dlc)
+			return -ENOMEM;
 
 		link->cpus	= &dlc[0];
 		link->platforms	= &dlc[1];
@@ -98,32 +92,33 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
 			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return ret;
 		}
 
-		cpu = of_get_child_by_name(np, "cpu");
-		platform = of_get_child_by_name(np, "platform");
-		codec = of_get_child_by_name(np, "codec");
+		struct device_node *cpu __free(device_node) =
+			of_get_child_by_name(np, "cpu");
+		struct device_node *platform __free(device_node) =
+			of_get_child_by_name(np, "platform");
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(np, "codec");
 
 		if (!cpu) {
 			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
-			goto err;
+			return ret;
 		}
 
 		link->id = args.args[0];
 
 		if (link->id >= LPASS_MAX_PORT) {
 			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		if (platform) {
@@ -132,8 +127,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 					0);
 			if (!link->platforms->of_node) {
 				dev_err(card->dev, "%s: platform dai not found\n", link->name);
-				ret = -EINVAL;
-				goto err;
+				return -EINVAL;
 			}
 		} else {
 			link->platforms->of_node = link->cpus->of_node;
@@ -144,7 +138,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			if (ret < 0) {
 				dev_err_probe(card->dev, ret,
 					      "%s: codec dai not found\n", link->name);
-				goto err;
+				return ret;
 			}
 
 			if (platform) {
@@ -167,10 +161,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->stream_name = link->name;
 		link++;
-
-		of_node_put(cpu);
-		of_node_put(codec);
-		of_node_put(platform);
 	}
 
 	if (!card->dapm_widgets) {
@@ -179,13 +169,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	}
 
 	return 0;
-err:
-	of_node_put(cpu);
-	of_node_put(codec);
-	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 

-- 
2.54.0


