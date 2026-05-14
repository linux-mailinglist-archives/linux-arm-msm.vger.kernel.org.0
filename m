Return-Path: <linux-arm-msm+bounces-107629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFFOFCLXBWqacAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7737542C59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B381308C9B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C3C3FA5DB;
	Thu, 14 May 2026 13:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWiwon/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA03C65FF;
	Thu, 14 May 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766959; cv=none; b=Fs2mkxOjDhkGY8U+6TTsDB2060Mbgz36CUXUo58je1vIKOapIyOH+qM/gijj/YrYB4cISHPlB8F/aA4nRyM2xL5Fmob15ZaZeQCZ6ZpOvgD+qCkKWnKwl55/dKJ3td0MS/sY44C9MvFM0/Z+xyklISnIZCV051ndEKXJuoyWI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766959; c=relaxed/simple;
	bh=D1M1MFwHJkSlDzFVO/fn9zDUcZErYpmR60k8k4vQvmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgFAfBXR3hnWp5QKJMmIPITsm9fHtik7Hhv0aCR/XDIMntSU34uAvzmQjxguyR6IKjTMr45l19heZ04Sj8ZF9oyf7DO0KyyUlqclZtn14yZTM2TeM7EBX5VcQltjv3v96aoLEI5KYxVjiNVnA2J54O8cw0dqNrtRg6i4MRNnXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWiwon/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0278C2BCB3;
	Thu, 14 May 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778766959;
	bh=D1M1MFwHJkSlDzFVO/fn9zDUcZErYpmR60k8k4vQvmA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tWiwon/BhlHrMaFLpCIC15kcS3NM/MYV6+t3pgZtL4wmVDxBW7nALl+HimXzloxxH
	 PiFauX5GIDhS47OXL3AiglGcQXhuLbROQTeu/uforiRI4Bm1phGZmYU+DSuRYy2OWK
	 s7IqBj4AiVNyNEqn8ty5k2LwDHeCNGBjKZqHlKoXL0SJnEmY/cPoq+4Paq3NbMXPvK
	 O8v15tHUXJ2/0GdoizbZP/L85foSfif3BJ2Ja2d53u4Yo8vMZnn6jTJaEkLhJD2zuo
	 8JF4h9svAJvTYBI56peX82Iu4DbXU2qoj/LAqSFOVbBJHiQ5AXbG/hD/Vu3q4vwmQr
	 AJzZcCtJcF64g==
Message-ID: <98cf25d1-7dd8-408e-98db-c60f6e8b403b@kernel.org>
Date: Thu, 14 May 2026 15:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Nickolay Goppen <setotau@mainlining.org>, Adam Skladowski
 <a39.skl@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-3-mailingradian@gmail.com>
 <20260503-devout-mamba-of-sorcery-d4ecb2@quoll> <afe8bQ3SIAu9rP1S@rdacayan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <afe8bQ3SIAu9rP1S@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B7737542C59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107629-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 03/05/2026 23:21, Richard Acayan wrote:
> On Sun, May 03, 2026 at 02:11:31PM +0200, Krzysztof Kozlowski wrote:
>> On Fri, May 01, 2026 at 11:31:15AM -0400, Richard Acayan wrote:
>>> The internal MI2S ports are found on devices with the internal sound
>>> card for Snapdragon 660. Add support for them.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
>>>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
>>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> Same feedback as last time. DO NOT send next versions, untill you reply
>> or address the feedback.
> 
> Ok, I believe this is about [1] and [2] with reference to the patches
> already in v7.1-rc1 [3].
> 
> My patches add INT0_MI2S_RX through INT6_MI2S_TX, which correspond to
> q6afe port IDs 0x102e - 0x103b. Srini's patches add LPI_MI2S_RX_0
> through LPI_MI2S_TX_4, but no q6afe port IDs.
> 
> I asked if the LPI_MI2S ports have q6afe port IDs to check if we're
> referring to the same ports, but apparently q6afe is too old to have it
> [4]:
> 
> 	> Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
> 	I think the older SOCs did not have this I guess,
> 
> Even if there's already an allocation of dt-bindings ports for LPI_MI2S,
> they can't just be reused for INT_MI2S. There are allegedly INT5_MI2S
> and INT6_MI2S (each RX and TX) but LPI_MI2S only counts to 4.

Then what is the difference between INT and LPI? People stuff here some
hardware names but this is SW ABI, so MI2S_RX_0 is only one. Just like
we have DISPLAY_PORT_RX_0, but no LPI_DISPLAY_PORT_RX_0 and
INT_DISPLAY_PORT_RX_0.

Best regards,
Krzysztof

