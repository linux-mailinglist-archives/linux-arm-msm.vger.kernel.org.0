Return-Path: <linux-arm-msm+bounces-116499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rCxvKRuoSWpP5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 02:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36F708B85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 02:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b="Yxwy/7/V";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116499-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116499-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE2033015A6C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 00:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B23923507C;
	Sun,  5 Jul 2026 00:40:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F45212F89
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 00:40:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783212056; cv=none; b=A7yQE0AyatV9Pe7zrqCGuL52LIl970no0xrwHWD9NKzM1yEYn7akWO+fZiQGH45VmJcTtJKdj/J7Sys3LdyD8OVWWOMb9TbUMMM8psf3STsWasU1vXinEHIzZ1pjfwpR0czeLugObEbhXJs9/dsEF/BqQmUc+BlM4pdPuLyq5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783212056; c=relaxed/simple;
	bh=DNU481lnqGHS63NzvJ+leqG0GqNAOKX9lvsSqVUooXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMKURZsA/PX8JvNhmiCAXxEXsWHLOJSaA9Ob4WlhKBKCusQu43q0dXbZTcjGbOBartIFFtZvSRq+cdQMjuy39DP3KTKoI0ZS6fOYBInghKsyvCRmF3sko/LKWHjlSKY3ImVoNXJ55s/Q2Op80sNV88EKB6fYy3nLLTPzkhCiuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Yxwy/7/V; arc=none smtp.client-ip=95.215.58.189
Message-ID: <d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1783212041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F5TqAEpezXvBsOsEx7vdvXp/ZG+xaYWD08RmSf9j7w=;
	b=Yxwy/7/VH0vGaebH0paWTWQd0QNBh76Mp7l1R/moOugKLAwsgkezvvlXHvNms4BPpDtvf0
	cBKmhW8HBNAP6VvfH4+Y1NzmbE11En85zR1/fn/WSD5UNdZb0ST/AuSInf/7yuCj7XGwAU
	QHz6ofe5zLohsB5fbcVzJuZHJHuNSh6N/3gOOSg7FvyQc/sgaZ86dpMn1Sn9vPTp+M3bZM
	iOhz98477mwRr85sTzxplT0Xp5iTywhSupNpPTgGHRp2x1kF2J3k+37ZxD3J2q5QdmC8hi
	F9GvF0Fos+8wAKBFbYk9KvJejv51dNvI1B5CG5XvP0XpBtldY9umy2rHKkopyA==
Date: Sat, 4 Jul 2026 21:40:24 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: support Senary MI2S
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-116499-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE36F708B85


On 7/4/26 4:28 PM, Jorijn van der Graaf wrote:
> Extend the clock-provider DAI fmt setup to Senary MI2S; without it
> q6i2s_set_fmt() is never called, ws_src remains external and the DSP
> does not drive the I2S clocks.
>
> Force 32-bit slots on this interface in the BE fixup. The only Senary
> MI2S user so far is the Fairphone (Gen. 6), whose AW88261 speaker
> amplifiers derive their boost converter clock from BCLK and are
> configured by their firmware profile for 48 kHz x 32 bit x 2
> (3.072 MHz BCLK), matching the downstream configuration of this
> backend (bit_width 32). [..]

Since 
https://lore.kernel.org/all/178104655633.212106.619790244001573816.b4-ty@b4/ 
you no longer need to care about what the profile specifies. The aw88261 
driver properly participates in format negotiation now. The "firmware" 
register list binaries are therefore nearly irrelevant. Please don't add 
any more of this force-32-bit nonsense! We've just gotten rid of it on 
the Fairphone 5 and other kodiak devices.


Thanks,
~val


