Return-Path: <linux-arm-msm+bounces-111639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WXwFEjwsJmpDTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:43:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 770696524C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:43:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=thundersoft.com header.s=default header.b=VcS2bmLU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=thundersoft.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 574A430068C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8AC3246E8;
	Mon,  8 Jun 2026 02:43:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m9358.xmail.ntesmail.com (mail-m9358.xmail.ntesmail.com [103.126.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750532FA14;
	Mon,  8 Jun 2026 02:42:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886580; cv=none; b=bPTkBAmtcFZAZmD/upNpBhSPEVBr0FJ2yF0PyyCuN/il8iSbcYg3WFp79uGdLHbs8NVVMrgUcuyx1hj6jHKUMQVUrzzW9BrBgpYGTHgaaKWvy2+bkOOlNDzuvLgAPH7cgGrmIzSUu9fp6xwU8UwrjWbSs5Sq+Q20hw9i1tbXEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886580; c=relaxed/simple;
	bh=FFHkbWqxP4gtZ0+UM4SSW3ETnpfqxrf4fmpYzQIlMcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXA+j+WIpy/4q8HtYTuqUsRw7ic71NBGSAWFYhxrHZF4dT5m8Rzmzp8JMWODoMVyRkuuE1OMKWQJgBBnPKWbhl/UZvRviT6SMWZ0LVZ3VA13mWSLHWofpdOCHpgd/gkJGJxr+Z2MuPF+DW0EY2gAmFyNxaqsaKMR4gUhVcDm3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=VcS2bmLU; arc=none smtp.client-ip=103.126.93.58
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416e8806b;
	Mon, 8 Jun 2026 10:42:46 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	perex@perex.cz,
	robh@kernel.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Date: Mon,  8 Jun 2026 10:42:03 +0800
Message-ID: <20260608024203.3381312-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
References: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea51c749a09d5kunm1fdaa3051d051f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT09IVklISR5JQx5MTh1CGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=VcS2bmLUGJ/5+Wnh1J3UcwBRUvI0f4cEFl0y2PqJdF8nSgkgFSTOxiM/bX2gRPTA3xgk6C/m54ohLqx5XJVWXKklCOqsXhTY7EMTUCDgSFzvDmM3jKFHCm8pmuyqdfFCZBAIHC9fPTc7aVZSNiVbWKRukN3MYTe5DzgnN9Ty2jY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=gomWAGuoJJ3xeyiLoDn5pG81Zg2uv+LzMpwhNWj9oH8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111639-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,endlessm.com,thundersoft.com,katsuster.net,gmail.com,oss.qualcomm.com,perex.cz,suse.com,loongson.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:broonie@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:drake@endlessm.com,m:hongyang.zhao@thundersoft.com,m:katsuhiro@katsuster.net,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:lgirdwood@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:matteomartelli3@gmail.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:perex@perex.cz,m:robh@kernel.org,m:srini@kernel.org,m:tiwai@suse.com,m:zhoubinbin@loongson.cn,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,thundersoft.com:mid,thundersoft.com:dkim,thundersoft.com:from_mime,thundersoft.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 770696524C9

> On Sun, Jun 07, 2026 at 02:58:20AM +0800, Hongyang Zhao wrote:
> > The sc8280xp machine driver currently uses the OF match data only as a
> > driver name, which makes it difficult to describe board-specific MI2S
> > codec requirements.
> > 
> > Convert the match data to a per-card data structure and add data for
> > the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
> > format, MCLK rate, BE hardware parameters and headset jack pins.
> 
> Please don't mix refactoring and actual changes in a single patch. Split
> this commit, performing one logical change per commit.
> 

Thanks for your review.

I will split it in v2. The intended split is:
- convert the sc8280xp OF match data to a per-card data structure;
- add the generic/common helper changes needed for headset jack setup;
- add the RubikPi3-specific machine data, including MI2S codec clocking
  and headset jack configuration.

> > 
> > Add a common headset jack helper which accepts board-specific DAPM pins
> > for codecs that are not connected through the WCD TX codec DMA path.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  sound/soc/qcom/common.c   |  75 ++++++++---
> >  sound/soc/qcom/common.h   |   6 +-
> >  sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
> >  3 files changed, 357 insertions(+), 43 deletions(-)
> >

--
Thanks,
Hongyang

