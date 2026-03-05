Return-Path: <linux-arm-msm+bounces-95511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPjTFLYhqWkL2gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:24:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2020B88D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A94603044BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061532BE621;
	Thu,  5 Mar 2026 06:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="VcZYJInK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com [220.197.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E3246778;
	Thu,  5 Mar 2026 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691843; cv=none; b=adpFhepxJZFfPL5hJcpWSDmjtpuZfpIKpRnGcXDtAsBo9QrNgwSkYc0b14kvyUD9ahkVexK07G84SbR9H8M4INJuyaSWhhFgb05L6/ZMQ+FwDdwINo2j/pABlz/kBWrQ9gEVAbpa1Y9wCfIWVgEg9rcTtKHYG84JVKnNIQH2Mz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691843; c=relaxed/simple;
	bh=Iht1r+yVIjhbmgorwffY/WZG4fvWpt012DxOBQaeKic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPOFIlmmoWKQjgJPozkdbYfT1N6wnIOHaSR1XT4bbI7Gg30FbqpgpqRjseNA4ysCCa2u4g50zPB8Jto2K2seNmdk0XT7yKHqUUekg+d34BXrnMwlZq05Vd6GqVHRmR2bDx1oIdFdQf7St0B8yp1jgOu19JhHTxRkmSbYmOXaysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=VcZYJInK; arc=none smtp.client-ip=220.197.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35d4e47dc;
	Thu, 5 Mar 2026 13:48:25 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Thu, 05 Mar 2026 13:47:46 +0800
Subject: [PATCH 5/6] ASoC: qcom: sc8280xp: Set codec DAI format for MI2S
 links
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rubikpi-next-20260304-v1-5-327595a4528a@thundersoft.com>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
In-Reply-To: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772689696; l=1340;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=Iht1r+yVIjhbmgorwffY/WZG4fvWpt012DxOBQaeKic=;
 b=RtpwU1OF/ulbTYhGoY/Rtg+Jc8GxAwlQQNL0MwQoj3b3KyJUECb6iGaAL+THI4hHIHJ8aUVqR
 yvB+Bk8JfhdA78Bh7/aVB47vybGH0G6ovHDAIec9vfGO2d8s3vq0fw9
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cbc8a4ac009d5kunma04077fcc8569d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHR9LVhlDGR9PGE9NHR9PTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=VcZYJInK1v3dPENNRAruuYoyHjwiLEY+4yiBbEjADutk89V7FOQdfRMkihQXK1D7qRemcguSX9IgdcxaIqnr4ZI5PBpALi49eT8jNJwh6cVtzU8ioPYHQhON9qpXB7wHaPShFjlH/Ved+pTG0EY0oIJvy2h/MTp+t1BabEeahTc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=uD1bDfoNoFCDj51HBerfeeYEewmuLu8oZRNJDSFssSo=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: C3B2020B88D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95511-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Set the codec DAI format to I2S consumer mode (BC_FC) with normal bit
and frame clocks (NB_NF) for MI2S backend links. This is required for
external codecs connected via MI2S to work properly.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/qcom/sc8280xp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 7925aa3f63ba..04e15c85a145 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -27,6 +27,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack  = NULL;
 	int dp_pcm_id = 0;
@@ -35,6 +36,9 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
 	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
 		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_BC_FC |
+					       SND_SOC_DAIFMT_NB_NF |
+					       SND_SOC_DAIFMT_I2S);
 		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:

-- 
2.43.0


