Return-Path: <linux-arm-msm+bounces-117808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I0zDLh3MTmpEUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 00:15:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2345D72AD54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 00:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ak181mPv;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117808-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117808-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8056A304BE40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 22:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DAB39768F;
	Wed,  8 Jul 2026 22:13:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BC3126D9;
	Wed,  8 Jul 2026 22:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783548803; cv=none; b=T1Im8OJM2Fs6Zz8RzrMUCkYegoPbJZwlWMbTUzsdMN5MyZMdMRgKnChLtBdW8F9mixti8IIhLsC+lh5McomnV/Ll1maqyc6fKC6rlRta0DH5WoLgedKVXrziJandTPSO8PBVfgxaFV+gFDeitrVQdKJQ6CpYLp7vqC/K96M0ypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783548803; c=relaxed/simple;
	bh=zUm0VvehyvY85PT+tfokfaQWW4AjdZgtDoqUfGbjZh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8A5Qe+oFVBFjW0pnKwf359mTcPqvi2fQ8vK4oAQUOpS2P/+y1NinlpXmqG3kvLTyLg/p30L6T/RrySZ4ly5gRUT9QFZyQ7Vt+UK5EEXRcOLZ1NERXvVqLXlD1B2XY5U3XIqOnYeecfTxmrbxWEc8atqcMtTj6p4iNBwxuU+MP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak181mPv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73171F000E9;
	Wed,  8 Jul 2026 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783548801;
	bh=3b7hb86Or5eBCOEd4GZ1NBuhPCJmpVdsL7dg9BUP15A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ak181mPv36myZR8gry4IqEKPYIImBnmW9qjh+4VUiRwLB1eD6YZ6jqFkV4QK9d/su
	 XeRvHFpggd89mg+pAvWJJ+EZOS15yN7FSYXD2l9bEyCIAp+VWnuqQE4TTNLAqmED8s
	 Oy62KpUPCTyOuNhjKBVkLhhO1dZgk5EspHnzwmPi9/ePjWNNwKzy6ASibGRMXzxPfN
	 vqCyxGkySw+QLa1UsTnqTJRsAvMd7b+8XHRjIFeE+LryiXkj9lx6tD65F24RbX39N3
	 cJHqmft4Kej7DQzj8dmsayQeNYrSyJqL2tZhM/c7tOoTu+ysuZw++45YrD/UOTPdNN
	 wgHw6DbTlIAQQ==
Message-ID: <523fd389-e423-4acd-8edb-029d2633cf1a@kernel.org>
Date: Wed, 8 Jul 2026 23:13:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Val Packett <val@packett.cool>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117808-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:val@packett.cool,m:luca.weiss@fairphone.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,packett.cool,fairphone.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,catcrafts.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2345D72AD54

On 7/5/26 4:38 AM, Jorijn van der Graaf wrote:
> The DAPM power-up sequence runs during snd_pcm prepare, but the BE
> port graph is only started at trigger time. A codec that powers up
> synchronously from a DAPM widget event and needs a running bit clock

I guess you are referring to the IBIT clk that dsp provides, not the mclk.

Could you not enable this from the machine driver?

> at that point - such as aw88261 since commit caea99ac809d ("ASoC:
> codecs: aw88261: remove async start") - can therefore never see a
> live clock: its power-up check runs before the trigger and fails on
> every stream start.>
> Start the graph at the end of prepare instead, mirroring what
> q6afe_dai_prepare() does on the legacy stack, so the interface
> clocks already run when DAPM powers up the codec. The FE side
> already starts its own graph at prepare in q6apm_dai_prepare();
> only the BE waited for trigger. The trigger-time start is kept as
> a fallback, guarded by is_port_started.
> 
> Tested on the Fairphone (Gen. 6) - 2x aw88261 on Senary MI2S:
> without this the amplifiers fail to power up with SYSST reporting
> "no clock" on every stream start; with it they start synchronously,
> including for the first short stream of the boot.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
> Sending as RFC because this changes when the port starts clocking for
> every AudioReach platform, and I may be missing the reason the start
> was placed in trigger rather than prepare in the first place:
> 
> - Is there a downside to starting the graph at prepare on AudioReach
>   (power, pop/click, or DSP-side constraints)? The legacy q6afe stack
>   has started its ports at the end of prepare all along, and the FE
>   side of AudioReach already starts its graph in q6apm_dai_prepare().
> - With the BE started at prepare, the BE graph now starts before the
>   FE graph for playback (prepare runs BE-first) — does
>   APM_CMD_GRAPH_START ordering between the two graphs matter?
> - Is the capture direction fine with this, or should it stay
>   trigger-started?
> 
> If this approach is right, the trigger callback becomes unreachable
> and I would drop it entirely in a non-RFC respin, like q6afe (which
> has no trigger op); it is kept here to keep the diff minimal.
> 
> Note: the test setup also carried my pending aw88261 power-up check
> fix, which addresses an unrelated SYSST-check failure on this board:
> https://lore.kernel.org/linux-sound/20260704192857.88366-1-jorijnvdgraaf@catcrafts.net/
> 
> Context (report and analysis of the aw88261 failure):
> https://lore.kernel.org/linux-sound/d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool/
> 
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 006b283484d9..36e12a770c72 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -224,6 +224,20 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
>  		goto err;
>  	}
> +
> +	/*
> +	 * Start the graph here already, like q6afe does: this way the
> +	 * interface clocks are running before the DAPM power-up sequence,
> +	 * for codecs that need a live bit clock to power up (e.g.
> +	 * aw88261). The trigger callback keeps its start as a fallback.
> +	 */
> +	rc = q6apm_graph_start(dai_data->graph[dai->id]);

This is going to break pipewire DP audio case, because pipewire will
call prepare during the startup and if we do not have DP plugged in dsp
will fail to start the graph and whole pipewire Audio defaults to dummy.

--srini
> +	if (rc < 0) {
> +		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
> +		goto err;
> +	}
> +	dai_data->is_port_started[dai->id] = true;
> +
>  	return 0;
>  err:
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> 
> base-commit: be44d21728b6646189779923b841ad3a46d694e5


