Return-Path: <linux-arm-msm+bounces-82569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B6C705FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 18:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4FB6A2F3B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 17:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D88733A719;
	Wed, 19 Nov 2025 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Vq5JVhgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE73327BE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763572502; cv=none; b=ewW/HhG5xP1L7Nu1Wh/AWtmf0Ds7pXInH1OXhPxDi2+d9RXbj4LuTo2Lbm/Eo9+22pqedzx4scVY8DN4kmJtnms2Xet4cHsnyECe7ND4c0u7KQ5ms9ByavDqc8m8N+pMoOsIGtDgcXi8/24RnrA0EsLC/IpPXoxBd4AWS+goljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763572502; c=relaxed/simple;
	bh=8qOei+5iVyTpIVJdrELSKorvw3ZZO/Cw5fasUL1fHJQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=p6//hpB4ouznxxmwT09psxW0VA4Uya9bFnUq7/AV9YOsebUBupMwBFznV9IyzgXgWhJVp+6L1n0BbuLPeWrBcxPj5ICvlfy+CD4H6dRThSDtO8u0fnFzaqu/SZWaJdGqGIhSmSfBbPtYLY07B0/wAOI5ceacjzSkOrURdzY0XOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Vq5JVhgv; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2a4b6876fso881349385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763572498; x=1764177298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcMytCFbs5Vo7k54utdbFpOXPjxqG+y0as3fR0kFoMQ=;
        b=Vq5JVhgvRdf2rZlW2Ju2KpnTrjkbXasMYLfRKOtniVzMSfrGzKCKqPpZjvQAXD/Fwm
         be9lRW7SNO0aRBVXEWYaqWYoBIz2rB5JdOJfulDVxwwsyXs/7s8GbknETS80r1z5e7KX
         xBB0BDXOnZpkAeTpXrmjhfQxqXE9D6vhrq3Z/mt6Rv+vddtkyLF+3qh0bNSUIQRzW9M9
         +q85Cqgq6Ea87F79asIiznr8KKmCfD7a3pKja/Sad4jNDFGC+8QM+yKTxjRnbjHw6er0
         WXkujnvU+otdhU+7FfAeTXecKOICw4kjBTj7OnT5s4mQ9H1yDFl+5aJrzVoCcnB0B4TV
         +hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763572498; x=1764177298;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcMytCFbs5Vo7k54utdbFpOXPjxqG+y0as3fR0kFoMQ=;
        b=YxX/WbxzBWumw5z6QOD4p4bsmZ0OKFDSGl/tlKtyaxoDSiKLX19u3GsO9RpDkJQJwQ
         XAWF0+dIYorfyEQpUJbbSJR4INklFC3RETn0mu5x+dto/YCfJwG5NWimdLVskONmHiG7
         yOftcNdr5w+WlASKIcPPvXAP+aiCEuHqSBU/wSldpbtNvIXL5H0iBgI1XQC+8xi4wC+e
         poUutPzc5QegCJRvZ7funxR5cZJfL1A6ZxnX4UWmjt9ktI6FjeB7tDVyKIBMjGGOwIJG
         Rw8NHL2sdT9tpUuv1Oy7q9HZ7ofSRHoF0Q/0TJb/LV9FlzeBajY7+zmOhsHUPtJLN2ja
         Z2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWoU8IrWuabhwoFJyKH4VMZW9VJo9EPqEjMyX9l8Ggg2Q7/aICGqgRdF/JunyJzt6VdAlUj0kqrZlyAe82b@vger.kernel.org
X-Gm-Message-State: AOJu0YyTPEHXtFDlj1NHupyw9xbfBtdvrpsNdU0qMl7vGyGz5duN6l8k
	Q7xoRacJ4pZ3aEYv119nXGPiRLn0qDxjcjEmJcAkZIrSrHxC7buaus4f4wYhogzZYi0=
X-Gm-Gg: ASbGnctOjEHVPspaPWozpAzJgu81WdMDGbz8ag4NaAyfkXNrBMdhRiDufi7HPB4Ks5r
	cBS7qfTebzjskwzTYHOMKtwdsLpeVi8pIGkMbosrozZqiXNDh24DmP8hRnkWmYHbExv87eWfRck
	TJ7T5qgoSgVw5XiNXhZg7ziBM5iBa4No0KLFihcUr3K8F1wxZ/S13tB9J3fS84Vbk2lRhFAeiMf
	xRuaNbWhSBZiqOXEmpyRdShXvBvtR4IqnPaYh7pGWtrY4ZqR+QGpdJcsVcYrrqq4UyHBJdn+qP8
	L5ERh/8ClzaKKhtXsiwOtpWUj19ZjRpHWlHQw2uX0RctdGj9ma/c7mVABZM22qoaFAAL0bfOAI7
	HhShOqnLpbC7IQ2BX+OHHLga5MOhHI7yiHmmoGpGbzbdXxQ0sUJRWJYDPcSVYX+HMzP3O+85LkI
	575N9mT0kGIuQliv/jUPPAUF5fEO58M1r47BDsLQ8J9jTyY89utjfY0yf4ZQ==
X-Google-Smtp-Source: AGHT+IEYmWa+4drrl1pIjDhI3RjLOzBiCKzIBkfEAWiD6vKdauyfly8Fw3KOwWdXFZzVHyRzvIEWng==
X-Received: by 2002:a05:620a:4510:b0:89e:c659:3f99 with SMTP id af79cd13be357-8b3271f3b97mr20293285a.6.1763572498149;
        Wed, 19 Nov 2025 09:14:58 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2e4fcc2f7sm912394885a.9.2025.11.19.09.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:14:57 -0800 (PST)
Subject: Re: [PATCH 7/9] ASoC: codecs: lpass-wsa-macro: add RX4 and RX5
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-7-jonathan@marek.ca>
 <8753b824-cb16-4440-b53a-f058eb8f02d6@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <e750b946-4d33-e5e4-4da5-b644ce19a8bf@marek.ca>
Date: Wed, 19 Nov 2025 12:13:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8753b824-cb16-4440-b53a-f058eb8f02d6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/19/25 10:33 AM, Srinivas Kandagatla wrote:
> 
> 
> On 11/17/25 5:15 AM, Jonathan Marek wrote:
>> This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on both
>> WSA and WSA2.
> 
> Which SoC have you verified this on?
> 

I am testing with x1e and sm8650 devices.

>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
> 
>>   sound/soc/codecs/lpass-wsa-macro.c | 48 ++++++++++++++++++++++++++++--
>>   1 file changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>> index e2e78ff6dd54e..f02153108c275 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -300,6 +300,8 @@ enum {
>>   	WSA_MACRO_RX_MIX,
>>   	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
>>   	WSA_MACRO_RX_MIX1,
> 
> While you are at it, can you add RX2 and RX3, its same for both
> rx_primary  and rx_mix
> 

RX2 is RX_MIX0 and RX3 is RX_MIX1 (different names for the same thing).

I can add RX6, RX7, RX8 (if I can test and verify that they work), I 
didn't try to add them because the downstream driver doesn't support them.

>> +	WSA_MACRO_RX4,
>> +	WSA_MACRO_RX5,
>>   	WSA_MACRO_RX_MAX,
>>   };
>>   
>> @@ -2228,6 +2230,10 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
>>   			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>>   	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
>>   			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>> +	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
>> +			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>> +	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
>> +			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>>   };
>>   
>>   static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
>> @@ -2410,6 +2416,10 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
>>   	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
>>   	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
>>   	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
>> +	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
>> +	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
>> +	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
>> +	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
>>   };
>>   
>>   static const struct snd_soc_dapm_route wsa_audio_map[] = {
>> @@ -2529,6 +2539,31 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
>>   	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
>>   };
>>   
>> +static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
>> +	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
>> +	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
>> +	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
>> +	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
>> +	{"WSA RX4", NULL, "WSA RX4 MUX"},
>> +	{"WSA RX5", NULL, "WSA RX5 MUX"},
>> +	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
>> +	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
>> +	{"WSA_RX0 INP1", "RX4", "WSA RX4"},
>> +	{"WSA_RX0 INP1", "RX5", "WSA RX5"},
>> +	{"WSA_RX0 INP2", "RX4", "WSA RX4"},
>> +	{"WSA_RX0 INP2", "RX5", "WSA RX5"},
>> +	{"WSA_RX0 MIX INP", "RX4", "WSA RX4"},
>> +	{"WSA_RX0 MIX INP", "RX5", "WSA RX5"},
>> +	{"WSA_RX1 INP0", "RX4", "WSA RX4"},
>> +	{"WSA_RX1 INP0", "RX5", "WSA RX5"},
>> +	{"WSA_RX1 INP1", "RX4", "WSA RX4"},
>> +	{"WSA_RX1 INP1", "RX5", "WSA RX5"},
>> +	{"WSA_RX1 INP2", "RX4", "WSA RX4"},
>> +	{"WSA_RX1 INP2", "RX5", "WSA RX5"},
>> +	{"WSA_RX1 MIX INP", "RX4", "WSA RX4"},
>> +	{"WSA_RX1 MIX INP", "RX5", "WSA RX5"},
>> +};
>> +
>>   static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
>>   {
>>   	struct regmap *regmap = wsa->regmap;
>> @@ -2562,7 +2597,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>>   	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
>>   	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
>>   	const struct snd_soc_dapm_widget *widgets;
>> -	unsigned int num_widgets;
>> +	const struct snd_soc_dapm_route *routes;
>> +	unsigned int num_widgets, num_routes;
>> +	int ret;
>>   
>>   	snd_soc_component_init_regmap(comp, wsa->regmap);
>>   
>> @@ -2587,6 +2624,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>>   	case LPASS_CODEC_VERSION_2_1:
>>   		widgets = wsa_macro_dapm_widgets_v2_1;
>>   		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
>> +		num_routes = 0;
>>   		break;
>>   	case LPASS_CODEC_VERSION_2_5:
>>   	case LPASS_CODEC_VERSION_2_6:
>> @@ -2595,12 +2633,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>>   	case LPASS_CODEC_VERSION_2_9:
>>   		widgets = wsa_macro_dapm_widgets_v2_5;
>>   		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
>> +		routes = wsa_audio_map_v2_5;
>> +		num_routes = ARRAY_SIZE(wsa_audio_map_v2_5);
>>   		break;
>>   	default:
>>   		return -EINVAL;
>>   	}
>>   
>> -	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
>> +	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return snd_soc_dapm_add_routes(dapm, routes, num_routes);
>>   }
>>   
>>   static int swclk_gate_enable(struct clk_hw *hw)
> 

