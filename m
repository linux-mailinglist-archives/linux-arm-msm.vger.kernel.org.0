Return-Path: <linux-arm-msm+bounces-116502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WabRL3fRSWrb7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 05:37:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B770708E1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 05:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116502-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116502-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18760300C27B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 03:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7122E1E1C11;
	Sun,  5 Jul 2026 03:37:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71461A5B90;
	Sun,  5 Jul 2026 03:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222643; cv=none; b=LMwPQO2k1GlqJR5Aw66WfNiXRXXnRGWAKMeLMD8It/nf5O4lOPzoonFScBOOzOBN4nbCn+s2vVD48xpG6V1ID6AbX3GwoYbPTBt+k08oXlBYjS0Qrap10xQoiqckiaTBPv+GgSzMqxG8pzoo3l5eCvx/ew0uU5E4RFv+KVZh+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222643; c=relaxed/simple;
	bh=aUywZOI80I/Ikrw1BB6iCzSTMuKsmTcXXdQqsMcpg3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVNfwW20CDOYWVp/weKYRfSv3iW0eSf1vOO3oi30t9KQfou8Qsa0oC9lOOjCWxEwGmBY8I14F2cV/hECMRaGYITRQr7KYtpzAGxrY7CLoDq4ZgXU5TvEOujAbjyVwR3iewqjR8D1XCVFGobl1qTwSH+5jux+7/7oAFHdtL1OUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.231
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com [198.54.127.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4gtCpx3rj3z2x9w;
	Sat,  4 Jul 2026 23:37:13 -0400 (EDT)
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-05.privateemail.com (Postfix) with ESMTPA id 4gtCpX629Mz3hhTF;
	Sat,  4 Jul 2026 23:36:52 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: support Senary MI2S
Date: Sun,  5 Jul 2026 05:36:46 +0200
Message-ID: <20260705033646.305619-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool>
References: <20260704192830.88134-1-jorijnvdgraaf@catcrafts.net> <d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116502-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[catcrafts.net,gmail.com,perex.cz,suse.com,fairphone.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:srini@kernel.org,m:broonie@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:luca.weiss@fairphone.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B770708E1B

On 7/5/26 2:40 AM, Val Packett wrote:
> Since
> https://lore.kernel.org/all/178104655633.212106.619790244001573816.b4-ty@b4/
> you no longer need to care about what the profile specifies. The aw88261
> driver properly participates in format negotiation now. The "firmware"
> register list binaries are therefore nearly irrelevant. Please don't add
> any more of this force-32-bit nonsense! We've just gotten rid of it on
> the Fairphone 5 and other kodiak devices.

I apologize for not catching this, I was developing on the 7.1-based
milos-mainline staging tree which doesn't include your series yet.
There a 16-bit stream plays silence, since the amp keeps the profile's
32-bit frame config, and I wrongly took that for a hardware
requirement.

To retest, I backported your series onto my 7.1 tree (together with
my pending power-up check fix [1], without which the amplifiers fail
an unrelated SYSST check on this board), and can confirm 1b92b0673d5e
("ASoC: codecs: aw88261: support changing sample rate and bit width")
works as advertised on the FP6: with the fixup dropped the backend runs S16
end-to-end and the amps get reprogrammed to 16-bit frames at 32fs
(I2SCTRL1 0x3408, SYSST 0x311 while playing) and sound is fine.
I'll send a v2 with the fixup dropped.

However, I could only get there after locally reverting caea99ac809d
("ASoC: codecs: aw88261: remove async start"): with the synchronous
start the amps can never power up on this platform. The Fairphone
(Gen. 6) uses the AudioReach/q6apm stack, where the BE port only
starts the I2S clocks at trigger time (q6apm_lpass_dai_trigger() ->
q6apm_graph_start(); prepare only prepares the graph). aw88261_start()
now runs synchronously from the DAPM PRE_PMU handler, i.e. during
prepare, before the trigger can ever run — so the power-up check
always sees SYSST = 0x0020 (NOCLKS) and gives up:

  aw88261 6-0035: check pll lock fail,reg_val:0x0020
  aw88261 6-0035: mode1 iis signal check error
  ...
  aw88261 6-0035: aw88261_dev_start failed, cnt:4, ret:-1
  aw88261 6-0035: start failure (-1)

A plain revert would bring back the missed-short-sounds problem you
fixed, so I fixed it on the platform side instead: starting the graph
at the end of q6apm_lpass_dai_prepare(), mirroring what
q6afe_dai_prepare() does on the legacy stack, makes the clocks run
before the DAPM power-up sequence. With that change and your series
untouched, the amplifiers start synchronously on the FP6, including
for the first short stream of the boot. I'll send that as an RFC
("ASoC: qcom: q6apm-lpass-dais: start the graph at prepare") right
after this mail. I may well be missing why AudioReach starts its
ports at trigger rather than at prepare like q6afe, so input from
you and Srinivas is very welcome there.

[1] https://lore.kernel.org/linux-sound/20260704192857.88366-1-jorijnvdgraaf@catcrafts.net/

Thank you for your review,
Jorijn van der Graaf

