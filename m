Return-Path: <linux-arm-msm+bounces-106535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OATnE775/GkrWAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:44:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C99ED4EEDB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 22:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3729D3003800
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 20:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4B21B4156;
	Thu,  7 May 2026 20:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Tlzldz5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905A2F8E8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778186683; cv=none; b=THpo92sX5NZ+R/q9plBDXDk1Ullup6JXiVzObKOoAf7KEftnbQ29PuvhL2qZX4R3DisAfS5ZGwK5ysbxvSw5hr8TpvFPRwfFycFCbu8LDRg3v6kTTTYu6mrgR9Bb9odcRQIMl0+FGFBQkr8kY7F/CL+Dsm+CWkvwfg8//gAN1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778186683; c=relaxed/simple;
	bh=09Aq1uVfs1H7/4/akJOJ3NmTfKUNp/uebi+dNe1y5vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7VZYLkKSSqDcEBvf2GmrDySIuCNbWgm/aWNWgLn/RSHuZKg7P4AtsM5IZwBLz3yl4zurZCiI3qu0cBuP/aQxgOkCPeoEZIYnFZEuEn1kMa4IVLN5zV+2mg02FXBud1QzDvFq8TbYVoPDEJHx9VBEX3T7w3WS+7Mu0s7b7rITFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Tlzldz5X; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <f090337e-e817-41d3-8fc6-0c64cd71fba4@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778186679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wa8K+5rTItWcTVDBbLLE/2qTJHrvU6zWsUoEX3dVoso=;
	b=Tlzldz5XDNEJQRBdbA7OLVz9qxlLn8iEs/vdnf9mlLHSq+rpP+T/07g1zmLnhKQKu0tTYf
	XnMXftFWxMEImm5mpgzQYaCRWwnMOLVtvyYJuTR1VH4+gc0chjvFqD1cKMrO7EQA7YboGX
	f6El9SYFKR3AFAKne1OHh62l9aWxSqfhe9fGtEHx89yDwYkQX9TJhb4WQ6onR+PvJIYSan
	YHXbqlKXNhfE1QunuWg39zn2TGakBV43/KcX34qwKKQpWwuZSknegsksmVw1sw0/2ulAYH
	h/xjjNzvWs93gfV69hWYDMPimIz92RlXSuCy5+jX1nzUtZ5TA9POuS+jlzNmFg==
Date: Thu, 7 May 2026 17:44:17 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sm8250: shut down MI2S/TDM AFE port
 clocks
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
 Luca Weiss <luca.weiss@fairphone.com>, Antoine Bernard <zalnir@proton.me>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-6-val@packett.cool>
 <dd0e22ed-e464-4d61-b354-b396f9694976@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <dd0e22ed-e464-4d61-b354-b396f9694976@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: C99ED4EEDB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-106535-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On 5/7/26 5:57 AM, Srinivas Kandagatla wrote:
> On 5/6/26 8:33 PM, Val Packett wrote:
>> These port clocks were never being turned off, leading to increased
>> power consumption after a sound was played through any of these ports
>> for the first time. Use enable counters to disable the clocks in the
>> shutdown callback, similar to how it's done for sdm845.
>>
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   sound/soc/qcom/sm8250.c | 150 +++++++++++++++++++++++++++++++---------
>>   1 file changed, 119 insertions(+), 31 deletions(-)
>>
>> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
>> index b64fd3970ba1..9f0f846a14bb 100644
>> --- a/sound/soc/qcom/sm8250.c
>> +++ b/sound/soc/qcom/sm8250.c
>> @@ -24,6 +24,7 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
>>   
>>   struct sm8250_snd_data {
>>   	bool stream_prepared[AFE_PORT_MAX];
>> +	uint32_t clk_count[AFE_PORT_MAX];
> In your setup are you sharing BE dais to multiple FE?
>
> if not you would really not need the count, startup and shutdown are
> paired for single PCM stream.
>
> If yes, then you need some protection against these counters.

Hmm, possibly not? I don't entirely understand how the q6 hardware 
works, sorry.. Who's the BE in this situation?

Basically what we have is e.g.:

- a dai-link between speakers (<&aw88261_l>, <&aw88261_r>) and the 
digital interface they're connected to (<&q6afedai SENARY_MI2S_RX>) 
defined in the device tree
- one q6asmdai frontend (MultiMedia1) connected to it in the mixer, i.e. 
cset name='QUIN_MI2S_RX Audio Mixer MultiMedia1' 1
- VoiceMMode1 (currently only via an out-of-tree hacky patchset but 
someone's reworking that) also connected to it like that during voice 
calls, but we can definitely "unplug" the MultiMedia when that happens

> [..]

Thanks,
~val


