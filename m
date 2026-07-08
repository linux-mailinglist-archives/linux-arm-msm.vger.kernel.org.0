Return-Path: <linux-arm-msm+bounces-117556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k+kYKj0VTmoECwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 185237238A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:15:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=ML3Cf4aU;
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED91F3015D0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A553FE650;
	Wed,  8 Jul 2026 09:13:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26557407CF4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:13:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502000; cv=none; b=B5kLWsaKep9rNO1qCAXDM3bioyLX0CeddnWmR98CbYOyDsmjn+xb1srdwjVWTh9GaHmLhlewXnjDgnlwGhzXd8ZVkqnO9XZBmzgXFASAmqHTjAO8kzeHhV2Z+Sb3dFQLqDTTkinedSxNiuy0CB4BXrL27YB4RCqHXAshSnEL1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502000; c=relaxed/simple;
	bh=SHGSfS2/H1YBWnkNLtdKaMi/zrnlzJnO61zM/C8RyOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqCAT+4t+Gmv7jdSehx52sJoQ0Y/kw5xNaNKu3vsSYIW0dS4/Wylx3UBLbLl1Ify3bgYXKvR6mN5ph2XqaPoBvC/Sunk43L14RayZyqSJ/ThbwetmbZ6uBuHREFsWeAASLA2sEptwKNxVakcHFY5CVHmUaNsNKoNbV/wOLEKa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ML3Cf4aU; arc=none smtp.client-ip=91.218.175.185
Message-ID: <5717102b-f7ab-42b2-8065-064d94dd2bee@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783501985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lk1A3Ic6rfNLvStv9OZxDE+43p0a6M1kCmZcBw19bYE=;
	b=ML3Cf4aUm9F0pbbE+QSllyuIs85v5KwzIvQ6uiXwUWTi7vPKfqKNTLKlLrvMgMlSayr18A
	hCYRyoY+9P8s91+wshquJ5BM3bm3dAb6+eYUJ/QRjko9QeXUAQAwsFv7UPbw0KE6uWxc23
	QtQBdMMNDrLg7Az61QoiblrroJGmpaM=
Date: Wed, 8 Jul 2026 11:11:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
 <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
 <20260707151329.67858-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260707151329.67858-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117556-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:ravi.hothi@oss.qualcomm.com,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,gmail.com,fairphone.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-louis.bossart@linux.dev,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 185237238A0

On 7/7/26 17:13, Jorijn van der Graaf wrote:
> [ +Cc Vinod and Bard for the drivers/soundwire items below ]
> 
> On Tue, 7 Jul 2026 13:42:26 +0200, Pierre-Louis Bossart wrote:
>>> +static int wcd9378_bus_config(struct sdw_slave *slave,
>>> +			      struct sdw_bus_params *params)
>>
>> Changes to SCP registers are generally done by the SoundWire core.
>> IIRC there is already support for setting the bus scaling registers.
>> Not sure why this function is needed?
> 
> You're right, and thanks for the pointer. sdw_slave_set_frequency()
> computes exactly the values this codec needs (base 19.2 MHz, scale
> index 2 for the 9.6 MHz bus here). It just never triggers on qcom
> platforms today: the chip enumerates with class_id 0x00, qcom.c does
> not set bus->prop.mclk_freq, and so sdw_slave_get_scale_index()
> would return -EINVAL - which I suspect is why the downstream stack,
> and this driver following it, hand-roll these writes.
> 
> Plan for v2: set prop.mclk_freq in the qcom controller (small
> separate patch), set prop.clock_reg_supported here, and delete
> wcd9378_bus_config() plus the hand-rolled base/scale writes. One gap
> I noticed while checking this: sdw_program_params() gates the
> bank-switch scale reprogramming on
> is_clock_scaling_supported_by_slave(), which checks class_id only
> and not prop.clock_reg_supported, so a class-0 device never gets
> the next-bank scale written there. That is harmless here, since
> sdw_slave_set_frequency() programs both banks at enumeration and
> the qcom bus clock is fixed, but I can extend the helper to honour
> clock_reg_supported as well - as part of the soundwire-side series
> with the mclk_freq patch, or however Vinod prefers to route it.
> Either way I want to re-validate on hardware before deleting: the
> sequencer stalling on a missing clock indication was the hardest
> bug of this bring-up, so I'd like to see the core-programmed values
> keep it alive first. (This also supersedes the shared clock-scale
> helper I promised in the bot-review triage; with both hand-rolled
> paths deleted there is nothing left to share.)

IIRC we only enforced the clock scaling for SDCA compliant class devices.
But these registers appeared in SoundWire 1.2 so could in theory exist even if the class field isn't set.

I think it's the first time we see this case, so better extend the helper as suggested above.
> 
>>> +	/* Set suspended until aggregate device is bind */
>>> +	pm_runtime_set_suspended(dev);
>>
>> is this set_suspended() necessary? pm_runtime isn't even enabled in
>> this probe.
> 
> Inherited from wcd937x-sdw.c (runtime PM for the slaves is enabled
> later, in wcd-common's component bind). It is most likely redundant
> since devices default to the suspended state; I'll check and drop it
> in v2 if so.

ok

> 
>>> +	component_del(dev, &wcd_sdw_component_ops);
>>
>> pm_runtime_disable() ?
> 
> It is there, just not visible in this function: runtime PM is
> enabled in wcd-common's component bind and disabled in the matching
> component unbind, which the component_del() here triggers when the
> aggregate tears down - and if the aggregate never bound, runtime PM
> was never enabled either. Same structure as the other wcd93xx sdw
> drivers. I'll add a comment pointing at wcd-common.

ok, that'd be useful.

>>> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
>>
>> if this was an SDCA device shouldn't you rely on the _EXT macro?
> 
> The device enumerates with class_id 0x00 (sdw:x:0:0217:0110:00:y on
> the bus), so SDW_SLAVE_ENTRY, which is _EXT with version and class
> zero, matches what the hardware reports: despite the SDCA-shaped
> control model it does not announce an SDCA class. (That is also why
> the class_id gate in sdw_slave_set_frequency() never fired here.)

ok

> 
>>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
>>
>> SDCA-style or SDCA-compliant?
> 
> Deliberately "style": the control model is SDCA-shaped (functions,
> ITs/PDEs at SDCA-looking control addresses) but the chip reports no
> SDCA class ID and the downstream driver programs it through a
> proprietary sequencer layer rather than generic SDCA. Srinivas
> mentioned elsewhere in this thread that he has been building an
> SDCA-compliant driver for this codec for Glymur - if that pans out,
> this wording (and much more) gets revisited. I'll tighten the
> comment in v2.

If you can some wording about what the sequencer is, that'd be useful.
SDCA really only uses byte read/writes with special tricks for MBQ.

>>> +/* sys-usage capability bits (SYS_USAGE_CTRL profile contents) */
>>
>> what does sys-usage mean? it was never clear in the SDCA spec, not
>> sure what this refers to here.
> 
> It's not an SDCA concept: SYS_USAGE_CTRL is a vendor register in the
> chip's sequencer block that selects one of 13 canned "active entity
> set" profiles. The enum lists the capability bits those profiles
> advertise, and yes, the hex table below maps profiles to those enum
> bits (derived from the downstream driver, which also supplied the
> names). v2 will say all of that in the comment.

SDCA does define Usage registers in IT and OT. IIRC the goal was to provide hints on signal quality and dynamic range, but it quickly veered into a monster that no one really knows how to set...

>>> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_STAT, 0xff);
>>
>> if this is really SDCA, this would be very odd to set all bits in the
>> function status register. The function status register includers
>> fields such as needs reset, function busy, etc.
> 
> The chip has no public documentation, but these behave as the SDCA
> Function Status sticky flags, which are write-1-to-clear - so I
> read the 0xff (taken from the downstream driver) as a clear-all
> after activation rather than a configuration write. v2 will write
> only the named sticky bits and leave the live FUNCTION_BUSY bit
> alone, the way sound/soc/sdca clears this register.

Yeah, some bits are really read-only and shouldn't be touched at all by the driver.

>> quite a lot of voodoo magic in this function, eh?
> 
> No argument. It's a transcription of the downstream activation
> sequence, delays included, validated on this hardware; the chip has
> no public documentation beyond that source. v2 will label the steps.

ok

> 
>>> +		sdw_write(tx, SDW_SCP_COMMIT, 0x02);
>>
>> is this SCP_COMMIT needed? This is only used for dual-ranked
>> registers, and there's currently no mechanism to handle them.
>> The bus scale registers are banked, this is a different concept.
> 
> Agreed, it looks misplaced. It was carried over from the downstream
> driver during bring-up - from its headphone-sequencer path, as it
> turns out; the downstream capture-start clock writes don't include
> it - and survived because the sequencer's failure mode made me
> conservative. With the clock programming moving to the core per
> your first comment, this write goes away with the rest, verified on
> hardware.

ok

>>> +		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
>>> +					      WCD9378_PDE_PS0_ON);
>>
>> if this is remotely inspired by SDCA, the normal sequence is to set
>> the REQUESTED_POWER then poll the ACTUAL_POWER register.
> 
> That is what happens: requested power is written here and the
> ACTUAL_POWER poll is a few lines further down. The clock indication
> is currently sandwiched between the two because the sequencer only
> advances with the bus clock indicated; once the clock registers are
> programmed at enumeration time by the core, this mostly collapses
> to the classic request-then-poll (the vendor HOST_CLK_DIV2_CTL
> writes still need a home).

Humm, something doesn't add up for me.
The clock scaling is really a peripheral property, the PS states are function level.
If there are multiple functions, programming the clock scaling shouldn't be done while changing power levels but rather when resuming the peripheral.
 
>> it's quite unclear to me why ports need to be exposed to user space?
>> This is really low-level stuff that isn't typically handled by
>> user-space.
> Same model as wcd937x/938x/939x, and the qcom UCM configurations set
> these switches today. I'd rather keep this driver consistent with
> the family and its userspace than diverge on one chip; if the model
> should change, that seems like a family-wide discussion.

I have no objection to UCM, but in practice no one seems to upstream the UCM files so even when a driver is upstream there's no easy way to enable it...

>>> +	ret = sdw_slave_wait_for_init(wcd9378->tx_sdw_dev, 5000);
>>
>> That's rather unusual, the 'standard' way is to use the update_status
>> callback when the core logic completes the enumeration/initialization.
> 
> The update_status callback is still part of what completes the
> initialization being waited on (wcd_update_status via wcd-common);
> the wait itself is the pattern the recent enumeration-helper
> conversion moved the family to - wcd937x/938x/939x and pm4125 all
> call sdw_slave_wait_for_init() from their component probe now.
> 
>> and presumably if you wait for the init above the device is already
>> functional?
> 
> The slave is; the pm_runtime_resume_and_get() just below is on the
> codec's platform device (the reset/regulator provider), a different
> device, so it isn't redundant with the slave init.
> 
>> doing the io_init() after waiting for the init seems odd to me, the
>> flow isn't classic and deserves more comments IMHO.
> 
> Fair. The constraint is that io_init() programs the analog core and
> runs the function activation, which must hit an enumerated codec
> with the bus clock running; component probe after the init wait is
> the earliest point where that all holds. v2 will spell that out.

ok, a description of the flows between SoundWire probe, component probe, component bind would help indeed.
 
>>> +	/* Give the SDW subdevices some more time to settle */
>>> +	usleep_range(5000, 5010);
>>
>> isn't there a better way to detect that the bus and devices are
>> operational?
> 
> Inherited verbatim from wcd937x_bind(); I don't have a better signal
> to offer and didn't want to diverge from the family blindly. I can
> experiment with dropping it as a follow-up.

I guess there are two parts to my question, I am not sure what 'settles' means.
a) make sure all devices are properly enumerated, which IIRC is done automagically on QCOM hardware.
b) make sure all devices are properly initialized, which is orders of magnitude slower with the byte-based register access.

>> same comment as above, if the device is always on then presumably it
>> should never suspend, which begs the question why pm_runtime was
>> introduced?
> 
> The hold pins only the TX slave, and only while the codec is bound:
> the RX slave and the codec's platform device still runtime-suspend
> normally, and unbind drops the hold. Keeping the runtime PM plumbing
> also leaves room for the reset-plus-reinit recovery path (needed for
> system sleep anyway, as noted in the commit message), which would
> allow narrowing the TX hold to active capture later.

I don't have enough background to follow the explanation, I don't even know what those TX and RX peripherals do and how there's connected to a manager.

>>> +	pm_runtime_set_autosuspend_delay(dev, 1000);
>>
>> 1s for pm_runtime autosuspend is rather low, no? Usually values are
>> in the 3s range to avoid suspend-resume transitions while the user
>> is playing with the UI.
> 
> Copied from the family (wcd937x/938x/939x all use 1000 ms). Happy to
> make it 3 s in v2.

it's fine to keep it with a comment.
> 
>>> +	pm_runtime_disable(dev);
>>> +	pm_runtime_set_suspended(dev);
>>> +	pm_runtime_dont_use_autosuspend(dev);
>>
>> the last two calls seem unnecessary if pm_runtime is disabled already?
> 
> Copied from wcd937x_remove(), but checking the mechanics you are
> right about both: set_suspended() is redundant because the driver
> core already resets a disabled-but-still-active device to suspended
> after unbind (pm_runtime_reinit()), and dont_use_autosuspend() plus
> disable() is exactly what the core's own devm teardown does
> (pm_runtime_disable_action()). v2 will switch the probe to
> pm_runtime_use_autosuspend() + devm_pm_runtime_set_active_enabled()
> and delete this whole block from remove().

ok

> 
>>> +#define WCD9378_SWRS_SCP_BASE_CLK		0x4d
>>> [...]
>>
>> all of those seem like standard registers, do you really need/want
>> to use your own definitions?
> 
> 0x4d/0x62/0x72 are indeed SDW_SCP_BUS_CLOCK_BASE and
> SDW_SCP_BUSCLOCK_SCALE_B0/B1 - those defines disappear together with
> the hand-rolled writes per your first comment. The remaining ones
> (HOST_CLK_DIV2_CTL at 0xe0/0xf0 and the INTRTYPE registers at
> 0xf4-0xfc) have no equivalents in the standard register map -
> wsa881x already carries the identical HOST_CLK_DIV2_CTL vendor
> register - so those keep vendor-prefixed names, with a comment
> saying exactly that.

ok

> Thanks for the detailed pass - the clock-register pointer alone
> removes most of the SCP special-casing from this driver.

Happy to help... Sometimes I wonder if I am the only one left from the initial SoundWire standardization group...

