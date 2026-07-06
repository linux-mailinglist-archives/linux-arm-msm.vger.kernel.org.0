Return-Path: <linux-arm-msm+bounces-117028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DcmzIcgRTGqmfwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 686417157AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 22:36:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117028-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117028-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 640AA3005310
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 20:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9DA3E5EF2;
	Mon,  6 Jul 2026 20:36:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A5C3E5A33;
	Mon,  6 Jul 2026 20:36:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370176; cv=none; b=PPauat5flga6Wpjv7hA5f5yxlM4mIY1yIzMai0+/QGXXR4p6EpVeNS9DuSMuj5aACOz6QHZjvdiH5w/klKhKeu4+l++2gsfJPtwMIeYM3LQITwq2QnMTO4KZFORPdF3sN2PvhzEm8FDBV32O8NB65RPyHJhOJkfgjULt8AhhHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370176; c=relaxed/simple;
	bh=obdDzqWsvjJ0QGHmXfkvb/nnVV+b3ijOn9OphdstDew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJRhbAZUkhOa0NLov95H/bbITsez9MrYyFjARFuIttBg+YmVfPO8o8HZGJU8AzfsCmefzQ3mzcpPqxF31E8TvGZgIu1uo5wZG6XgulHUdMwUuTWWCpBpsu1416p61rp3jmT0yAv6CDORjFVr55wpWnHc1gAEXCKo8hjkLWEsvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gvGMx073Nz3hhTH;
	Mon,  6 Jul 2026 16:35:56 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>,
	sashiko-reviews@lists.linux.dev
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
Date: Mon,  6 Jul 2026 22:35:49 +0200
Message-ID: <20260706203549.153519-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706193827.D90641F000E9@smtp.kernel.org>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net> <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net> <20260706193827.D90641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117028-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:sashiko-reviews@lists.linux.dev,m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[catcrafts.net,kernel.org,gmail.com,fairphone.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,catcrafts.net:mid,catcrafts.net:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 686417157AA

On Mon, 06 Jul 2026 19:38:26 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 9 potential
> issue(s) to consider:

Went through all nine findings; triage below. Two are real issues (the bus_config clock-scale
inconsistency and the runtime-PM enable ordering) and three more are
warts inherited from the wcd937x-family drivers; all five will be
fixed in v2. Of the remaining four, the control-put race is real but
family-wide, and three don't hold up against the hardware, the
downstream reference or the family precedent. Details inline.

> - [High] Modifying a static global array during probe prevents
>   multiple device instances from working correctly.

Real, though inherited: wcd937x-sdw.c mutates its static ch_info
array with the DT channel map the same way. It only breaks with two
instances of the same codec on one board, which no current user has.
v2 will use a devm-allocated copy.

> - [High] `pm_runtime_enable()` is called after
>   `component_master_add_with_match()`, causing component probe to
>   fail synchronously.

Not unconditional - it needs the bind (and the card bind that
snd_soc_register_component() can trigger) to run before the
pm_runtime_enable() a few lines later, e.g. synchronously inside
component_master_add_with_match(). That doesn't happen on the tested
board, and wcd937x/938x/939x have the identical ordering today. The
race is real though; v2 will enable runtime PM before registering
the component master.

> - [High] Missing bounds check in `wcd9378_tx_mode_put()` allows
>   out-of-bounds enum values to be written and retrieved.

In-kernel the stored value is only ever mapped through
wcd9378_get_mode_val(), whose default arm absorbs out-of-range
values, and the same unvalidated put exists in wcd938x. But the
get side does re-expose whatever was stored, and the check is two
lines; v2 will reject items >= e->items.

> - [High] Inconsistent SoundWire bus clock scaling calculation
>   between `wcd9378_bus_config()` and `wcd9378_swr_clk_indicate()`.

Good catch, but inverted. bus->params.curr_dr_freq carries the
double-rate frequency: sdw_bus_master_add() sets it from max_dr_freq
(2x clock), overriding the qcom controller's probe-time value, so
wcd9378_swr_clk_indicate()'s /2 is the correct interpretation - on
the Fairphone 6 that yields 19.2 MHz DR -> 9.6 MHz clock -> DIV2,
matching the mode behaviour verified acoustically on hardware. It is
wcd9378_bus_config()'s switch labels that wrongly treat curr_dr_freq
as the clock (the core's own sdw_slave_get_scale_index() likewise
halves curr_dr_freq to get the bus clock). The two agree at 19.2 MHz
DR - the only value an upstream qcom bus presents today given the
hardcoded 9.6 MHz max_clk_freq - and diverge on a 4.8 MHz-clock bus,
so the bug is latent rather than user-visible. Still worth fixing;
v2 will derive the scale in one shared helper.

> - [High] Destroying `micb_lock` in the component unbind callback
>   leads to a use-after-destroy upon component re-bind.

Real, inherited verbatim from wcd937x_unbind(). v2 will move the
mutex_destroy() to driver remove.

> - [Medium] Off-by-one error when calculating the SoundWire channel
>   count causes incorrect bandwidth allocation.

No functional effect on the qcom controller: the padded count does
feed the core's bandwidth accounting, but qcom_swrm_compute_params()
never consumes it, and the loop matches wcd938x_sdw_hw_params()
unchanged. If that family convention wants cleaning up it should be
a separate series.

> - [Medium] Missing High-Pass Filter (HPF) init pulse configuration
>   for ADC2 when routed via SmartJACK.

Intentional and faithful to the hardware sequence: Qualcomm's
downstream wcd9378 driver likewise powers up the SmartJACK PDE34 for
AMIC2-routed ADC2 without an HPF init pulse - only the
SmartMIC-routed branch pulses HPF2.

> - [Medium] Concurrent ALSA control puts cause read-modify-write
>   data races on shared driver channel maps.

Real in theory and shared with every wcd93xx driver (the same
unlocked pattern exists since wcd938x); in practice the port
switches are toggled by UCM at device open/close. Happy to add
locking here and do the family-wide fix as a follow-up if the
maintainers prefer.

> - [Medium] Using asynchronous `pm_runtime_put()` in
>   `wcd9378_unbind()` causes a race condition where the TX SoundWire
>   slave device may not be properly suspended before removal.

The put only drops the reference that keeps the bus out of
clock-stop; whether the slave suspends immediately or via the queued
idle request makes no functional difference during teardown, and the
slave device with its driver outlives the codec component. A rebind
re-takes the reference through pm_runtime_resume_and_get().

I'll hold v2 until the human reviewers have had a pass so everything
lands in one respin; the fixes above will be retested on the
Fairphone 6 before sending.

Thanks,
Jorijn

