Return-Path: <linux-arm-msm+bounces-112250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2h0LBuxBKGqnBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A598C6627DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ExwWrScB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B735433F3D15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551973B71AC;
	Tue,  9 Jun 2026 16:23:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5293F39F8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022196; cv=none; b=Ni9mU9+M/edwat0LHucaTXWdbR6d8C979DY4nZkgUyv6T1Kx7d0IDgvBq3sEOwmtwKgmMXt1hZDmpExQXe0IghVOHQMDVdi6uS/fSTghQdfwjZAH6tk7yAAhKWu+M4ilYGbppqAuB9aTWteP/p+aZPOTDC3BcyIDGIXOeN9nT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022196; c=relaxed/simple;
	bh=F3/Q/P8gGDDcuSGCNzRM4Jb/sel/WSnd3g4fJslYVg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zd8oTTB+FfIa1Nz4uHes9Zgl1S6UYrboprAiwrmtdQIcS065AApKMpxP8HYwdU4HCB25uRx/YsFRBv/ESZUajKOYfYjTCitrn+lViqLQc4NM0MMkABo0LH1D4Qi8h3Jshu1QA8XPYwWBm+TSz215sqEK7UOqHXNwr3bfO6L+jL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExwWrScB; arc=none smtp.client-ip=209.85.222.171
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-915671abde5so511509485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022194; x=1781626994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=ExwWrScB12UJPgUOulJhOD3WF6GW3a8iqU66RzS1Bpp7Ix+ftz0vKtD5ZlwD9RJOAV
         zCtTn8HxwtMuidzXvs7ExwnR8fS781bprWVZ5txvJAsXie2YIl0aW5fxH1RbKS//llhE
         SEJyT7kdAdvhxAmjyXU2Yf+XxFRB0Enar1/c6eeIhYklCBiKU1B5ZyPd0cb249FTPiN8
         I5H8wKWsFCHUJPouu3A4BzG15BiXjxJc44XFUUIZu47ilpMg6LJBNA4aO7GuUEs+5+o6
         m2WS23fm2KDyc+/x0jGxYlphFfCYm0KZzMbcpTJHJf7MLmK5o4fzJObl9c6fb+X8iCvy
         f7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022194; x=1781626994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9po3bV9rnmIHm+a4pHCaXjx/Bof8CvBzTp64aammzQ=;
        b=FJo2HAlinf0AfR9EAUDmMHTtA2U0h20E9Lwd7BY0Me8V6cQu26QSqiHey6OEvncUUC
         YSm1MCbY9Bj2oqzbJf3H7Tx6o8DUb4NHDvc1wo97vWCGCh6Z0TgHdl4klZsiLgf7IMMF
         xI56z9LtvY728bxVIGTIOcJWGU6nZs8zFlFr1t28imq1buD0seKQQ/EcoDZK3WIEfoyL
         9UUIBZjm4TnMHEaZ63nrgOADgM9mMaLCeDF0okthy0GJQNg8DvbKsziNXZTPoJLL6+mv
         rzpl8LjTAfKJTghgugJX0hYtMD75HW/IkoB3amJMaASxeLPHhxtE4zvnDrl6n6m3xIiY
         Ev0w==
X-Forwarded-Encrypted: i=1; AFNElJ/5bT7aZMiRFi1+XLN6T4e3sWmGSTQ4Ujzmx2ZDnmXtmNwFdiCPalxsPZjvfkxXvvcjMCC8Rghk3gdoA/RG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33k72BwEykW9rDXOUwv33UEbh6geM9Lojb34emms8XDA8zsnb
	7gezbRo2zjAzJ0DtzlsZVUOl17iMLyboalcAXoqJ3RH5nbeaqSleUkpp
X-Gm-Gg: Acq92OH15rpxc1uvm0VCT+R/BXV2pnst2N8Or2Fe5r3ImfDS4WBZOcE3a/BfrQp1Oro
	GmXfibbtAsPNAZ16mkHQ7U7mCfAom6OE2vK1GiYMgDiksbOxsozOtu/GURlNyLl0EbqOMtxmPjA
	YhKNqnpN1D0T01kkKQuTugNvCPR3fQMr6gUZR140IFW45dXrcXB6uSSU4vk768Q+7iLA4FOzaH7
	x4LHyTjw7j6kKDLmyg72p/lEsDOd6PgnMf47Irm4YlOa3DF/OBkzHw4AfWbTwFBKFF3wrE5K8+l
	gl3PxT1prmO4s1OulIHLVD5/fYA6aecj17sK+3YKS+a5cGJzitJLX86Jov9NE0nvMrCPOn+AAgT
	9C4m03qmZ6iclNVs06TL6qHTw1Dc63GFofVXgP25DgfncFCDmihEuL52NQOPXKb3Axw7NDpQM4s
	ZOpZVuGnm/PK6H8z7xBLrkWI6e9w7qWwhAKHW0pA==
X-Received: by 2002:a05:620a:6847:b0:915:bac0:fc2d with SMTP id af79cd13be357-915bac10351mr2274439585a.7.1781022193940;
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2158510185a.39.2026.06.09.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:13 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 10/15] ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
Date: Tue,  9 Jun 2026 12:22:50 -0400
Message-ID: <20260609162255.31074-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112250-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A598C6627DD

On SDM660, LPI MI2S ports can be connected to a WCD codec which may
support headphones. Register the headphone jack on codecs connected to
the playback port, LPI_MI2S_RX_0.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..9070db005e21 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case LPI_MI2S_RX_0:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.54.0


