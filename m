Return-Path: <linux-arm-msm+bounces-113444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6BytB+hkMWq3iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:59:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A5690B64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:59:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LVl5HcWA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86B6A300A4ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004E03BFAE2;
	Tue, 16 Jun 2026 14:59:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729A35201E;
	Tue, 16 Jun 2026 14:59:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621988; cv=none; b=iwBZzv+6bymXkWFs3rBfTX2JxiJsyYM/IvDJPxVHBmhGYOIIZVyQoFx2mBonJ6Fe0GLXc32UUe7ugXw0b2hPGwhQSG6IW340cl3aDtB74QLOSfFIY4i4ncbvZYwGzbJypeWKwR2t318imVmz7Azk9RW2KYdG9zSgU5X2qrazEX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621988; c=relaxed/simple;
	bh=pPGztMOJC7GX7cdU+VotOPIBIh2O1UNBntczx2ZEnts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6HnD5MWvoH/5El3glYcX0I7rBbuSd5bHLhZruqm1gvcw5xw02XQ4+R19uZMEmZZBkY/T/5fWRWG0nqQ/zGz8wShkG7Ci/5Map/d3dI5m3pulrcEyHOW0ZZs3s1VneqrA4QRYTFXsOWr3s8qeyb27TlVsjp8WI+ZY8rlC6SWDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVl5HcWA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091731F000E9;
	Tue, 16 Jun 2026 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781621986;
	bh=NPLY3Gk0+zQ5uo7vm2lbvEaRawxiYA0hIh/Bw7HbOVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LVl5HcWAR5D2+SWZmzBWJKEx2JTyZUIsJOFe21dSVtN+wF1qaw6tX99QeF9mi3dll
	 eKFgdH5vwBA0nLwkT/VYqmunKuj1r8sJpIimzdvObKija0WZxADHXAjPh7B7wUywkS
	 fLeZyy9ooJ3tUvDR/N2AaqjUllQqjHRBb3I76C/2L4PvDqQMY2Y4Uxu7ZWgLK44KO4
	 eaP86DKd3HuvQpMim4elJKp/dqmlDWCRsEZmqvvOofs15H1CqzEW0mDk2EdSFw9/YP
	 VnujRCg0/DsT1AVgt66wWTMfljmFBhTuxnjfKUNwpyL/vW5my/8ABN4LRh0Oq6iXlh
	 MlMA728+QlPgA==
Message-ID: <f18fa22c-131c-409c-9c8b-3153e2272b89@kernel.org>
Date: Tue, 16 Jun 2026 15:59:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
 <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
 <a5a957d0-a40c-424e-9d6d-622a4f624343@linaro.org>
 <05e15363-d49e-4a7b-82b3-0f07537b5366@kernel.org>
 <16d2e8e8-91bc-437d-8225-eb6eedb4bd8a@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <16d2e8e8-91bc-437d-8225-eb6eedb4bd8a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-113444-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,gitlab.com:url,msgid.link:url,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C0A5690B64



On 6/15/26 2:54 PM, Neil Armstrong wrote:
> On 6/15/26 11:36, Srinivas Kandagatla wrote:
>> On 6/15/26 10:31 AM, Neil Armstrong wrote:
>>> On 6/15/26 10:38, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 6/10/26 8:41 AM, Neil Armstrong wrote:
>>>>> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
>>>>> of 2 WSA speakers connected on the WSA2 lines.
>>>>>
>>>>> But the Audioreach DSP only handles WSA2 in pair with the WSA
>>>>> interface by using the upper bits of the active_channels_mask
>>>>> for WSA2 and the lower bits for WSA:
>>>>>
>>>>> /-------------------------------------------------\
>>>>> | Bits  |     3    |     2    |   1     |     0   |
>>>>> |-------------------------------------------------|
>>>>> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
>>>>> \-------------------------------------------------/
>>>>>
>>>> No, this is not totally correct, if the setup only has WSA2, then
>>>> channel 0 and 1 should be WSA2 channels.
>>>>
>>>> What is the backend dai id that is in DT, it should be
>>>>
>>>>      sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;
>>>>
>>>> I also noticed that you are using
>>>> https://github.com/linux-msm/audioreach-topology/blob/main/SM8550-
>>>> HDK.m4
>>>> which has WSA as backend dai, that is not correct, you should have
>>>> WSA2.
>>>
>>> So I did try that, and DSP would error out when using the
>>> LPAIF_INTF_TYPE_WSA2,
>>> but I'm retrying from scratch right now.
>>
>> Please share the failure logs, we need to change
>> 1. dt : bedai id, codec dais with correct soundwire wsa2 instance, the
>> routes.
>> 2. tplg
>>
> 
> So I did all the changes as you suggested:
> 
> Resurected Krzk's serie: https://
> patch.msgid.link/20231019153541.49753-1-krzysztof.kozlowski@linaro.org
> 
> Adapted/Fixes it to apply on v7.1:
> https://gitlab.com/superna9999/linux/-/commit/
> fd8cf1922d10175c5bcd8cf2a444c5825392d994
> https://gitlab.com/superna9999/linux/-/
> commit/0c4e89e167b9ca9c7b500577c030e550ec2a6e73
> https://gitlab.com/superna9999/linux/-/
> commit/6364a0a45a3f0985b872d9f504e9ea1d1f3f2a35
> 
> ```
> +#define WSA2_CODEC_DMA_RX_0    147
> +#define WSA2_CODEC_DMA_TX_0    148
> +#define WSA2_CODEC_DMA_RX_1    149
> +#define WSA2_CODEC_DMA_TX_1    150
> +#define WSA2_CODEC_DMA_TX_2    151
> ```
> 
> https://gitlab.com/superna9999/linux/-/
> commit/9bd0ce21f73df92fb35e3db7ef570f561a106478
> 
> DT:
> https://gitlab.com/superna9999/linux/-/
> commit/2fc270860e3b77ccae28e0c38228cba3e39ea78a
> 
> ```
> -                               sound-dai = <&q6apmbedai
> WSA_CODEC_DMA_RX_0>;
> +                               sound-dai = <&q6apmbedai
> WSA2_CODEC_DMA_RX_0>;
>                         };
> ```
> 
> Topology, copied the SM8550-HDK into a new one, dropped I2S and changed
> all WSA to WSA
> and added the WSA defines:
> https://github.com/superna9999/audioreach-topology/
> commit/12adc76859cde606c67e5a95df204b8d407038df
> 
> 
> ```
> +define(`WSA2_CODEC_DMA_RX_0', `147') dnl
> +define(`WSA2_CODEC_DMA_TX_0', `148') dnl
> +define(`WSA2_CODEC_DMA_RX_1', `149') dnl
> +define(`WSA2_CODEC_DMA_TX_1', `150') dnl
> +define(`WSA2_CODEC_DMA_TX_2', `151') dnl
> ```
> 
> Extract of the SM8650-APS2.m4 concerning WSA2:
> ```
> ...
> +dnl WSA Playback
> +DEVICE_SG_ADD(audioreach/subgraph-device-codec-dma-playback.m4,
> `WSA2_CODEC_DMA_RX_0', WSA2_CODEC_DMA_RX_0,
> +       `S16_LE', 48000, 48000, 2, 2,
> +       LPAIF_INTF_TYPE_WSA2, CODEC_INTF_IDX_RX0, 0,
> DATA_FORMAT_FIXED_POINT,
> +       0x00004006, 0x00004006, 0x00006050)
> +dnl
> ...
> +STREAM_DEVICE_PLAYBACK_MIXER(WSA2_CODEC_DMA_RX_0,
> ``WSA2_CODEC_DMA_RX_0'', ``MultiMedia1'', ``MultiMedia2'', ``MultiMedia5'')
> ...
> +STREAM_DEVICE_PLAYBACK_ROUTE(WSA2_CODEC_DMA_RX_0, ``WSA2_CODEC_DMA_RX_0
> Audio Mixer'', ``MultiMedia1, stream0.logger1'', ``MultiMedia2,
> stream1.logger1'', ``MultiMedia5, stream4.logger1'')
> ...
> ```
> 
> On device, all sets up without errors:
> ```
> [   20.710228] qcom-apm gprsvc:service:2:1: CMD timeout for [1001021]
> opcode
> [   20.720234] platform 6800000.remoteproc:glink-
> edge:gpr:service@1:dais: Adding to iommu group 30
> [   20.763797] va_macro 6d44000.codec: qcom,dmic-sample-rate dt entry
> missing
> [   20.791279] wsa_macro 6aa0000.codec: using zero-initialized flat
> cache, this may cause unexpected behavior
> [   20.912445] wcd939x_codec audio-codec: bound sdw:2:0:0217:010e:00:4
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   20.923343] wcd939x_codec audio-codec: bound sdw:3:0:0217:010e:00:3
> (ops wcd_sdw_component_ops [snd_soc_wcd_common])
> [   20.960741] snd-sc8280xp sound: ASoC: Parent card not yet available,
> widget card binding deferred
> [   20.972182] va_macro 6d44000.codec: supply vdd-micb not found, using
> dummy regulator
> [   20.985751] ALSA: Control name 'stream0.vol_ctrl0 MultiMedia1
> Playback Volume' truncated to 'stream0.vol_ctrl0 MultiMedia1 Playback Volu'
> [   20.998589] ALSA: Control name 'stream1.vol_ctrl1 MultiMedia2
> Playback Volume' truncated to 'stream1.vol_ctrl1 MultiMedia2 Playback Volu'
> [   21.011536] ALSA: Control name 'stream4.vol_ctrl4 MultiMedia5
> Playback Volume' truncated to 'stream4.vol_ctrl4 MultiMedia5 Playback Volu'
> [   21.026510] input: SM8650-APS2 Headset Jack as /devices/platform/
> sound/sound/card0/input7
> [   21.035151] input: SM8650-APS2 DP0 Jack as /devices/platform/sound/
> sound/card0/input8
> ```
> 
> Available mixer elements:
> ```
> # amixer | grep WSA
> Simple mixer control 'SpkrLeft WSA MODE',0
> Simple mixer control 'SpkrRight WSA MODE',0
> Simple mixer control 'WSA RX0 MUX',0
> Simple mixer control 'WSA RX1 MUX',0
> Simple mixer control 'WSA RX_MIX EC0_MUX',0
> Simple mixer control 'WSA RX_MIX EC1_MUX',0
> Simple mixer control 'WSA RX_MIX0 MUX',0
> Simple mixer control 'WSA RX_MIX1 MUX',0
> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1',0
> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia2',0
> Simple mixer control 'WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia5',0
> Simple mixer control 'WSA_AIF_VI Mixer WSA_SPKR_VI_1',0
> Simple mixer control 'WSA_AIF_VI Mixer WSA_SPKR_VI_2',0
> Simple mixer control 'WSA_COMP1',0
> Simple mixer control 'WSA_COMP2',0
> Simple mixer control 'WSA_RX0 Digital',0
> Simple mixer control 'WSA_RX0 Digital Mute',0
> Simple mixer control 'WSA_RX0 EC_HQ',0
> Simple mixer control 'WSA_RX0 INP0',0
> Simple mixer control 'WSA_RX0 INP1',0
> Simple mixer control 'WSA_RX0 INP2',0
> Simple mixer control 'WSA_RX0 INT0 SIDETONE MIX',0
> Simple mixer control 'WSA_RX0 MIX INP',0
> Simple mixer control 'WSA_RX0_MIX Digital',0
> Simple mixer control 'WSA_RX0_MIX Digital Mute',0
> Simple mixer control 'WSA_RX1 Digital',0
> Simple mixer control 'WSA_RX1 Digital Mute',0
> Simple mixer control 'WSA_RX1 EC_HQ',0
> Simple mixer control 'WSA_RX1 INP0',0
> Simple mixer control 'WSA_RX1 INP1',0
> Simple mixer control 'WSA_RX1 INP2',0
> Simple mixer control 'WSA_RX1 MIX INP',0
> Simple mixer control 'WSA_RX1_MIX Digital',0
> Simple mixer control 'WSA_RX1_MIX Digital Mute',0
> Simple mixer control 'WSA_Softclip0 Enable',0
> Simple mixer control 'WSA_Softclip1 Enable',0
> ```
> 
> I setup the speaker with (no errors):
> ```
> amixer -c 0 cset name='SpkrLeft PA Volume' 20
> amixer -c 0 cset name='SpkrRight PA Volume' 20
> amixer -c 0 cset name='WSA RX0 MUX' AIF1_PB
> amixer -c 0 cset name='WSA RX1 MUX' AIF1_PB
> amixer -c 0 cset name='WSA_RX0 INP0' RX0
> amixer -c 0 cset name='WSA_RX1 INP0' RX1
> amixer -c 0 cset name='SpkrLeft DAC Switch' 1
> amixer -c 0 cset name='SpkrRight DAC Switch' 1
> amixer -c 0 cset name='WSA_RX0 Digital Volume' 85
> amixer -c 0 cset name='WSA_RX1 Digital Volume' 85
> ```
> 
> and finally:
> ```
> amixer -c 0 cset name='WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1' 1
> numid=216,iface=MIXER,name='WSA2_CODEC_DMA_RX_0 Audio Mixer MultiMedia1'
>   ; type=BOOLEAN,access=rw------,values=2
>   : values=on,off
> 
> ```
> 
> When playing sound, it just timeouts, no printed errors:
> ```
> # speaker-test -D plughw:0,0 -c 2
> 
> speaker-test 1.2.14
> 
> Playback device is plughw:0,0
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 960 to 130560
> Period size range from 480 to 16320
> Periods = 4
> was set period_size = 12000
> was set buffer_size = 48000
>  0 - Front Left
> Write error: -5,Input/output error
> xrun_recovery failed: -5,Input/output error
> Transfer failed: Input/output error
> ```

Thanks Neil for trying this out, I had pretty much simillar behavoir on
Glymur device too, My understanding was that there are some codec DMA
instances where we can use 2 channels as default for WSA2.

But on Glymur all the DMA instances are 8 channel wide. Am trying to
check internally to see if its actually doable to get this working with
the ch1 and ch2 mask.

Am working on this to get more details on what it takes to get this working.


Only concern with this patch is that the channel mapping, which does not
reflect the channel mask. can you confirm that in your working setup you
have chmask as 0xC0 and channel_map setup for ch1 and ch2?

From DSP docs:
https://github.com/AudioReach/audioreach-engine/blob/master/fwk/api/modules/media_fmt_api_basic.h#L780

Channel[i] mapping describes channel i. Each element i of the array
describes channel i inside the buffer where i is less than num_channels.
An unused channel is set to 0.


So unused channels should be set to zero, but the patch padding the
channels starting form zero.

-srini


> 
> Neil
> 
>>
>> --srini
>>>
>>> Thanks,
>>> Neil
>>>
>>>>
>>>>
>>>>> Setting only the WSA2 upper bits is perfectly valid and
>>>>> functional but the current Audioreach code builds the bitmask
>>>>> from the channels count with:
>>>>>      active_channels_mask = (1 << num_channels) - 1;
>>>>>
>>>>> In order to enable the WSA2 bits the channel count should be 4,
>>>>> but the lower WSA bits are then also enabled and the DSP errors
>>>>> out when trying to play on the disabled WSA interface.
>>>>>
>>>>> A solution would've been to add a fake WSA2 topology element which
>>>>> would be translated into the top bits only, but it's not clean and
>>>>> add some special exceptions in the generic Audioreach code.
>>>>>
>>>>> The solution suggested by Srinivas is to use the channel mapping to
>>>>> set this bitmask.
>>>>>
>>>>> This works but makes all the other calls using the channel mapping
>>>>> fail
>>>>> because the DSP requires the channel_mapping table to start from
>>>>> index 0
>>>>> and using num_channel length in order to apply the mapping on the
>>>>> active_channels_mask bits in order.
>>>>>
>>>>> So we need to skip the empty channel mapping entries in all other
>>>>> users of the channel_map to build valid channel_mapping tables.
>>>>>
>>>>> This should not break any other usecases since the default channel
>>>>> mapping always start from index 0, and will add flexibilty to allow
>>>>> some special non linear mapping for other interfaces as well.
>>>>>
>>>>> Suggested-by: Srinivas Kandagatla
>>>>> <srinivas.kandagatla@oss.qualcomm.com>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++
>>>>> ++---------
>>>>>    1 file changed, 37 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/
>>>>> qdsp6/audioreach.c
>>>>> index a13f753eff98..9b80cfa56e8a 100644
>>>>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>>>>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>>>>> @@ -703,6 +703,7 @@ static int
>>>>> audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>>>>        int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
>>>>>        int size = ic_sz + ep_sz + fs_sz + pm_sz;
>>>>>        void *p;
>>>>> +    int i;
>>>>>          struct gpr_pkt *pkt __free(kfree) =
>>>>> audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>>>>>        if (IS_ERR(pkt))
>>>>> @@ -741,7 +742,12 @@ static int
>>>>> audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>>>>>          intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>>>>>        intf_cfg->cfg.intf_index = module->hw_interface_idx;
>>>>> -    intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels)
>>>>> - 1;
>>>>> +    intf_cfg->cfg.active_channels_mask = 0;
>>>>> +    /* Convert the physical channel mapping into a bit field */
>>>>> +    for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
>>>>> +        if (cfg->channel_map[i])
>>>>> +            intf_cfg->cfg.active_channels_mask |= BIT(i);
>>>>> +
>>>>
>>>> This one looks good, this should be a bug fix patch.
>>>>
>>>>>        p += ic_sz;
>>>>>          pm_cfg = p;
>>>>> @@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct
>>>>> q6apm_graph *graph,
>>>>>        uint32_t num_channels = cfg->num_channels;
>>>>>        int payload_size = APM_MFC_CFG_PSIZE(media_format,
>>>>> num_channels) +
>>>>>                    APM_MODULE_PARAM_DATA_SIZE;
>>>>> -    int i;
>>>>> +    int i, j;
>>>>>        void *p;
>>>>>          struct gpr_pkt *pkt __free(kfree) =
>>>>> audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
>>>>> @@ -860,8 +866,12 @@ static int
>>>>> audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>>>>>        media_format->sample_rate = cfg->sample_rate;
>>>>>        media_format->bit_width = cfg->bit_width;
>>>>>        media_format->num_channels = cfg->num_channels;
>>>>> -    for (i = 0; i < num_channels; i++)
>>>>> -        media_format->channel_mapping[i] = cfg->channel_map[i];
>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>> channels */
>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg-
>>>>>> num_channels; i++) {
>>>>> +        if (!cfg->channel_map[i])
>>>>> +            continue;
>>>>> +        media_format->channel_mapping[j++] = cfg->channel_map[i];
>>>> Each element i of the channel_mapping[i] array, describes the channel i
>>>> inside the buffer where i is less than num_channels.  An unused channel
>>>> is set to 0.
>>>>
>>>> For some reason I get impression that user is trying to set a 4
>>>> channels
>>>> instead of 2 channel.
>>>>
>>>> Can you fix the backend-dai id and play it directly on WSA2 instead of
>>>> WSA.
>>>> Or was there a reason for not doing it otherwise?
>>>>
>>>> --srini
>>>>
>>>>> +    }
>>>>>          return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>>>>    }
>>>>> @@ -1080,6 +1090,7 @@ static int
>>>>> audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>>>>        struct apm_pcm_module_media_fmt_cmd *cfg;
>>>>>        struct apm_module_param_data *param_data;
>>>>>        int payload_size;
>>>>> +    int i, j;
>>>>>          if (num_channels > 4) {
>>>>>            dev_err(graph->dev, "Error: Invalid channels (%d)!\n",
>>>>> num_channels);
>>>>> @@ -1113,7 +1124,12 @@ static int
>>>>> audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>>>>        media_cfg->num_channels = mcfg->num_channels;
>>>>>        media_cfg->q_factor = mcfg->bit_width - 1;
>>>>>        media_cfg->bits_per_sample = mcfg->bit_width;
>>>>> -    memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg-
>>>>>> num_channels);
>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>> channels */
>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg-
>>>>>> num_channels; i++) {
>>>>> +        if (!mcfg->channel_map[i])
>>>>> +            continue;
>>>>> +        media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
>>>>> +    }
>>>>>          return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>>>>    }
>>>>> @@ -1127,6 +1143,7 @@ static int
>>>>> audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>>>>        struct payload_media_fmt_pcm *cfg;
>>>>>        struct media_format *header;
>>>>>        int rc, payload_size;
>>>>> +    int i, j;
>>>>>        void *p;
>>>>>          if (num_channels > 4) {
>>>>> @@ -1166,7 +1183,12 @@ static int
>>>>> audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>>>>>            cfg->q_factor = mcfg->bit_width - 1;
>>>>>            cfg->endianness = PCM_LITTLE_ENDIAN;
>>>>>            cfg->num_channels = mcfg->num_channels;
>>>>> -        memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg-
>>>>>> num_channels);
>>>>> +        /* Convert the physical mapping to a logical mapping of the
>>>>> channels */
>>>>> +        for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg-
>>>>>> num_channels; i++) {
>>>>> +            if (!mcfg->channel_map[i])
>>>>> +                continue;
>>>>> +            cfg->channel_mapping[j++] = mcfg->channel_map[i];
>>>>> +        }
>>>>>        } else {
>>>>>            rc = audioreach_set_compr_media_format(header, p, mcfg);
>>>>>            if (rc)
>>>>> @@ -1243,7 +1265,7 @@ static int
>>>>> audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>>>>        struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
>>>>>        int op_sz, cm_sz, ex_sz;
>>>>>        struct apm_module_param_data *param_data;
>>>>> -    int rc, i, payload_size;
>>>>> +    int rc, i, payload_size, j;
>>>>>        struct gpr_pkt *pkt;
>>>>>        void *p;
>>>>>    @@ -1284,14 +1306,19 @@ static int
>>>>> audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>>>>        param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
>>>>>          cm_cfg->cfg.num_channels = num_channels * 2;
>>>>> -    for (i = 0; i < num_channels; i++) {
>>>>> +    /* Convert the physical mapping to a logical mapping of the
>>>>> channels */
>>>>> +    for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j <
>>>>> num_channels; i++) {
>>>>> +        if (!mcfg->channel_map[i])
>>>>> +            continue;
>>>>>            /*
>>>>>             * Map speakers into Vsense and then Isense of each
>>>>> channel.
>>>>>             * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>>>>>             * [1, 2, 3, 4]
>>>>>             */
>>>>> -        cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] -
>>>>> 1) * 2 + 1;
>>>>> -        cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg-
>>>>>> channel_map[i] - 1) * 2 + 2;
>>>>> +        cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] -
>>>>> 1) * 2 + 1;
>>>>> +        cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg-
>>>>>> channel_map[i] - 1) * 2 + 2;
>>>>> +
>>>>> +        ++j;
>>>>>        }
>>>>>          p += cm_sz;
>>>>>
>>>>
>>>
>>
> 


