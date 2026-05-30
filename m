Return-Path: <linux-arm-msm+bounces-110372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGqxLj7QGmqM9AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:55:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B860CA80
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484C83007AEA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AB83ACEEA;
	Sat, 30 May 2026 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hgiRdsW8";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CsX373hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680B321ABC9;
	Sat, 30 May 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141980; cv=none; b=DkAm7Jr1Fy3bFvH3cY/tJ04wFK/l1EL01+nxvs2H845d1PG+G5lJCU5fPcNjL1PMhCh9gdzEWeYC7KdsPN3Uz+Nrdj1YapJI2SQ5SuBEEON68A6PaTmM2NNrSRwF/TIPOp2gpxTnNyZ0Fp9AORAmtEv0rFhGNjCnMS3IcdyW+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141980; c=relaxed/simple;
	bh=QCcH8TSjvLI3PYzekOYwN3En7F2LWMmFPGgsI+I4udQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LhagaGLHrrIhrfmEYsNB+hQ6zouVxM3ASbkWDwzhwRQJgrx7xkncdRMkLwP8p5AS949vI/CfwAAzPuhSSNSYvUAKhYqC9PcYuFbGT3VJxfProydMOst6ark68eKza+OKwNAsX7DaGvubG+Vv2qzVyEZWCYoWR1YtLuSEcPmEaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hgiRdsW8; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CsX373hw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1780141956; bh=HvwxMLevTeXB5/bB9QrrZ1i
	NcbhD7jsSe+TWGxGnV0M=; b=hgiRdsW8bsDFsLapTLBebqwu5K98cMLdn9j2QaWKToMMKgowZu
	ZGpbLuU2xH8NcwhMwOhMsZNNwFrmOxjNv1SS0jlYb4tmi/gh/KpUKVfPL+LgfRbrsVolL11elUm
	0prz7cGYeluKvoaifsQE5oDcaISVFJfqJ4q7mqlEXrpHs6gdGQpunLT1mMFhu3xiQlFful4+9ue
	PQalxNSDQUkVGruq0A0s+14oyS/ZjnYPoFGOWtlA9EWHXQWxp8pBWN8S1EtWoMyZiZOat9g6taj
	EpSAUVvLamLAZFN09WjvTC4zNa3ShTCloU7xVkL4B4kj1Oovbi+nrMZY2owdHO08REA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1780141956; bh=HvwxMLevTeXB5/bB9QrrZ1i
	NcbhD7jsSe+TWGxGnV0M=; b=CsX373hw9vAgm1qji+3Z0DtXT14C7YsyxWoI/DCSNsexRZ6C2A
	1lnAbuLvRvlgKOkzhS9vRPnp0OrNToiPC2Ag==;
Message-ID: <f237a850-0718-4a3d-a11e-56f663e7641d@mainlining.org>
Date: Sat, 30 May 2026 14:52:35 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal
 mi2s support
From: Nickolay Goppen <setotau@mainlining.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
 <20260501153128.8152-3-mailingradian@gmail.com>
 <20260503-devout-mamba-of-sorcery-d4ecb2@quoll> <afe8bQ3SIAu9rP1S@rdacayan>
 <98cf25d1-7dd8-408e-98db-c60f6e8b403b@kernel.org>
 <3fe41d7b-0e65-4937-afda-b9a9e470e638@mainlining.org>
Content-Language: ru-RU, en-US
In-Reply-To: <3fe41d7b-0e65-4937-afda-b9a9e470e638@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110372-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:mid,mainlining.org:dkim]
X-Rspamd-Queue-Id: 180B860CA80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


25.05.2026 14:51, Nickolay Goppen пишет:
>
> 14.05.2026 16:55, Krzysztof Kozlowski пишет:
>> On 03/05/2026 23:21, Richard Acayan wrote:
>>> On Sun, May 03, 2026 at 02:11:31PM +0200, Krzysztof Kozlowski wrote:
>>>> On Fri, May 01, 2026 at 11:31:15AM -0400, Richard Acayan wrote:
>>>>> The internal MI2S ports are found on devices with the internal sound
>>>>> card for Snapdragon 660. Add support for them.
>>>>>
>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>> ---
>>>>>   .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
>>>>>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 
>>>>> ++++++++++++++
>>>>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>>> Same feedback as last time. DO NOT send next versions, untill you 
>>>> reply
>>>> or address the feedback.
>>> Ok, I believe this is about [1] and [2] with reference to the patches
>>> already in v7.1-rc1 [3].
>>>
>>> My patches add INT0_MI2S_RX through INT6_MI2S_TX, which correspond to
>>> q6afe port IDs 0x102e - 0x103b. Srini's patches add LPI_MI2S_RX_0
>>> through LPI_MI2S_TX_4, but no q6afe port IDs.
>>>
>>> I asked if the LPI_MI2S ports have q6afe port IDs to check if we're
>>> referring to the same ports, but apparently q6afe is too old to have it
>>> [4]:
>>>
>>>     > Is the LPI MI2S on Q6AFE? I don't see the AFE port ID.
>>>     I think the older SOCs did not have this I guess,
>>>
>>> Even if there's already an allocation of dt-bindings ports for 
>>> LPI_MI2S,
>>> they can't just be reused for INT_MI2S. There are allegedly INT5_MI2S
>>> and INT6_MI2S (each RX and TX) but LPI_MI2S only counts to 4.
>> Then what is the difference between INT and LPI? People stuff here some
>> hardware names but this is SW ABI, so MI2S_RX_0 is only one. Just like
>> we have DISPLAY_PORT_RX_0, but no LPI_DISPLAY_PORT_RX_0 and
>> INT_DISPLAY_PORT_RX_0.
resending since this message failed to deliver.
> Then do you mean that LPI_MI2S ports need to have port ID's assigned 
> like Richard done that for INT_MI2S? +Srini, Is this a good idea?
>> Best regards,
>> Krzysztof
>
-- 
Best regards,
Nickolay


