Return-Path: <linux-arm-msm+bounces-117806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y2rZOUHITmrhTwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:59:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4431C72ABD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:59:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117806-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117806-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB7E331599EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 21:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECE73FC5A1;
	Wed,  8 Jul 2026 21:56:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com [198.54.118.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8F3FCB0B;
	Wed,  8 Jul 2026 21:56:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547769; cv=none; b=B9R5GxsNOh/BgidxihrfcEJWskQTg9An3yIfrini/cod3eMGyBG+Cr5wzsrxt0yXROH5z7l35kVEuupkG5j2f6u5X4DqaKxbge3XsEEALaehnpKsPoJP0ehIoGMqlnVrsir6mVlWiI5uIS6at1n3qMsnDJdl8+ERorZQvsEQcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547769; c=relaxed/simple;
	bh=18XMXZp+NlcdPc+iodk+kNU707d273VfROluoD3EKg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWrawB8hdtGAGfMYi6L7y5PVTqN2gZiuRzyDGRWVGJCya3tMV0YrJovXkchRCMJY+y3GHxrestGa/3EwVrjcCrHkaXPordKUsJNC3ODAkJJr0lui0DfUxTML/l2wiIfjqmOmgql008PA0oINo3xfMlI8NxKt/RvOUAMSuwX8HDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.212
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-05.privateemail.com (Postfix) with ESMTPA id 4gwX350cNvz3hhTG;
	Wed,  8 Jul 2026 17:55:44 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at prepare
Date: Wed,  8 Jul 2026 23:55:39 +0200
Message-ID: <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net> <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117806-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:val@packett.cool,m:luca.weiss@fairphone.com,m:dmitry.baryshkov@oss.qualcomm.com,m:liujianfeng1994@gmail.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[catcrafts.net,gmail.com,perex.cz,suse.com,packett.cool,fairphone.com,oss.qualcomm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4431C72ABD2

[ +Cc Dmitry Baryshkov and Jianfeng Liu for the drm/msm/dp DP-audio
  context, and Mohammad Rafi Shaik for the MI2S clock series test
  report below ]

On Wed, Jul 08, 2026 at 03:05:39PM +0100, Mark Brown wrote:
> On Sun, Jul 05, 2026 at 05:38:30AM +0200, Jorijn van der Graaf wrote:
>
> > Sending as RFC because this changes when the port starts clocking for
> > every AudioReach platform, and I may be missing the reason the start
> > was placed in trigger rather than prepare in the first place:
>
> > - Is there a downside to starting the graph at prepare on AudioReach
> >   (power, pop/click, or DSP-side constraints)? The legacy q6afe stack
> >   has started its ports at the end of prepare all along, and the FE
> >   side of AudioReach already starts its graph in q6apm_dai_prepare().
>
> There was previously a move in the opposite direction in b54a38af7138
> (ASoC: qcom: q6apm-lpass-dai: move graph start to trigger) - the commit
> there mentions some issues with PipeWire?

Thanks, that's exactly the context I was missing - I had checked the
state of the file on the submission base but not the history of the
lines I was moving. Having read up on it now: b54a38af7138 fixes a real
problem, and this patch as-is would reintroduce it for the DisplayPort
DAIs. Here is what I found.

Since 98a8920e7b07 ("drm/msm/dp: reuse generic HDMI codec
implementation", v6.16) the msm DP audio configuration runs from
hdmi-codec's .prepare (drm_hdmi_audio_helper wires .prepare but not
.hw_params). Within a BE link the CPU DAI prepares before the codec
DAI, so a prepare-time q6apm_graph_start() asks the DSP to start
DISPLAY_PORT_RX before the DP controller's audio engine is configured,
and the DSP rejects it. DP audio on AudioReach platforms was reported
broken this way from v6.16 until b54a38af7138 went in:

https://lore.kernel.org/all/20250925040530.20731-1-liujianfeng1994@gmail.com/

That thread also has Jianfeng Liu's proposed DRM-side fix (wiring
.hw_params to the same helper), which Srinivas was fine with but Dmitry
argued is incorrect since the IEC 958 channel status isn't known at
hw_params time; as far as I can see it never landed, and the thread
ends with Dmitry noting his understanding that the issue should be
fixed by what became b54a38af7138. The legacy q6afe stack, which starts
its port at prepare, hit the same ordering problem on
qcm6490-fairphone-fp5:

https://lore.kernel.org/all/DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com/

b54a38af7138's commit message itself also cites PipeWire being unhappy
when the DP is not connected during start - presumably because with the
start at trigger, an open-but-idle DP PCM never attempts it.

I cannot exercise the DP path on my hardware - the FP6 has no DP audio
DAI link, so my testing (PipeWire, playback and capture) only covers
MI2S and codec DMA.

I also tested whether the in-flight "ASoC: qcom: qdsp6: Add MI2S clock
control" series can solve the aw88261 case without touching the graph
start:

https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

I carried it onto the v7.1.2-based tree my board runs, wired the
FP6's Senary MI2S DAI to the q6prm SEN_MI2S_IBIT clock ("bclk" in the
new dai@ subnode) and enabled the machine-level bclk vote. The
plumbing works as intended - during the stream clk_summary shows the
clock enabled at the right rate (1536000 for 48 kHz 2ch S16) - but
the amplifiers still report "no clocks" (SYSST) through their
power-up check at prepare and fail to start. On this platform, at
least for Senary MI2S, the interface only drives the pads once the
graph has started, so the clock vote alone does not help a codec
that needs the bit clock before APM_CMD_GRAPH_START; conversely,
with the graph started at prepare the same codec powers up with no
clock vote at all. Happy to share the details in that series' thread
if useful (its patch 3/3 also overlaps the Senary set_fmt one-liner
I sent for sc8280xp, which I would coordinate there).

So for v2 I would keep the two behaviours apart per interface type:
start the graph at the end of prepare only for the MI2S DAIs
(q6i2s_ops), where an external codec like aw88261 needs the bit clock
running before the DAPM power-up sequence and where q6afe has always
started the port at prepare. b54a38af7138's other point - that there is
no data transfer yet at prepare - still holds there, but for these
interfaces the early start is about the clocking, not the data. The
trigger-time start stays unchanged for the DP/HDMI DAIs (q6hdmi_ops,
where the prepare-time start is exactly what broke) and the codec DMA
DAIs (q6dma_ops - codecs clocked from the LPASS macros or SoundWire,
not from the port). That also supersedes my note under the fold about
dropping the trigger callback in a respin: it stays, as the only start
path for the DP/HDMI and codec DMA DAIs.

Srinivas, since b54a38af7138 is yours: does that split sound
reasonable, or is there a DSP-side reason the MI2S ports should not
start at prepare either? And since I cannot test the DP side, it would
be great if someone with DP-capable AudioReach hardware (an X Elite
laptop or a QCS6490 board) could give v2 a spin there.

Thanks,
Jorijn

