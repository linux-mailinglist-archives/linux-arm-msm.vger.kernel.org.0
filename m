Return-Path: <linux-arm-msm+bounces-113153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZICnEtrPL2qkHAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:11:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA59685478
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:11:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OlsDlzzA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ttu1GejZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3F003004D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125293DE42D;
	Mon, 15 Jun 2026 10:11:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C83DE42B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:11:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518282; cv=none; b=uO12EuyN4hJSpTFmoKBf7qUhiFJ8jjqIcWa/0KmXepJOOPfuviYWwapA07weNzOy/UzlIjnXK10yC0YaWrgsaPvcUmRhEwC1PRA/L3WvSmb4+kXZXMWU8l3iJyVlnXyMJhQWsDl0KK5Ysu5/lV6lmfh6hf/hlDWjOqyBtfFZrW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518282; c=relaxed/simple;
	bh=/zOHwIGCQ+Bi1+cBLDzzvGTtXR+/DvBkXBf6mgW02Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHR+/zZBgUnmxXUmo5SdNkWRjgSc/BmmOiP63AOKCmrZ+qugiPuX2dWTEpAFHxQ/7w8flbmCFu3d+FMCuyYk3ggrnbX5dxEnFT90TNz+FFGKLEwaB26aEKnV9n5XJH2mDNzLksBl4idJHWiGITd6+6J498B/rS/khF4vO4WDOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlsDlzzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ttu1GejZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9To6Z3704042
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=; b=OlsDlzzAGoNZvBr+
	YHTvwyjBvuNxgCQY4IuwkNUCR8LfcEM+TV1NBHa1qnECdh4W1jGBRzZlqJMDt8t3
	rP4yEaL5PakP8I76H0+1C5FZbhfVROS8lUIfQpoC4gqBVItReHroyC7W8bpgXXx7
	+TnMeBj7y4M/ExOTQXqUPtQXYtQFMIHZEozTdotapREvwxlUaOhPnqOTYeOciPZr
	UAB6sQ6sfHhA/ShU8cEaEURbeQYcnhLOZOcEoMgTew9W60hVsGLRbcCbijKoSrWj
	RV8w0V5DTwOK5ldmtKk3NlCW+7Ucur5HJbdl7I/ojqGvc7icQIYr8IV2v4rjLE1A
	GBJnhw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjr4vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:11:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso3122493a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781518275; x=1782123075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=;
        b=Ttu1GejZGy5/at4+ebjLZ/m4/H/unZp+lwKwJjE9vw4ijN6JoknM/lqNi5vObcPx98
         b/jWFWqQ1+RQSFsWn72EeEsU94zn7vLbuQwGWbwiqyYrrmzNC2MoE5ualKCsy3GIRIii
         PRMxgpLwG1AlZk9EYG3Z6N16nA3p28OwaWORJxRJH06DDS4tvDFfXIavZ0HjsF0nU7Iy
         NoOQWXfRlEfhUzF+mShSinR9aCaTqnfERZBpCu1xBZq4NhxrVRUBiNA6UQfM6L5SpHQs
         LxjFwSkPy17mSW7oCx0XFb9xDikaP14qA2hv+mq0D/6Ufjc1wngAcV+BQ0pl4zWVWFUK
         nTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518275; x=1782123075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsEKd6rZSPjuURj1p8f4rx+xTzM/nFADArhjJGwK24Y=;
        b=qWNr0Q4BgFVJUzj3KrD9triAeHXNKzZgJZ7fpXUel6pV0ACj+5mmR6KCp/IxU5Lbet
         m9HoxM6WddM2zVM16AvlEb94jKh0Q4LcHpxC5sfq5o/UYk9ytgaGLXBEOs4v/iUY20W1
         g/uIna7+KJrZ/jmALASxTa+suTnlhvH1qkuzHU2WjImNKWwZxzPEtf+u+8oi0Ywf6+s8
         60ovsBWvx8fQgZ16Sr9M43B0a2NUoMJBBTw6SrlcFo04hrHATUteMhBQ2+OdzyoZ5BP7
         N9VPkoQYyETxkdNvMnIZ/IiZYssQlmHFLVIkk0P184qAeaC+SR8RC8XH90+pXNQ7u6up
         DvUA==
X-Forwarded-Encrypted: i=1; AFNElJ9+2qurQ5qMhrAMEbgLC1Zwk9OAcRreuPON3KyCKr0Z6By3dooRXq07o17vT0eJaMgR9qewt5pIfG7/t4+r@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsj1v/z1yYgQ27SeCTovz9i2QeWtGSeywgzlnd7tWVND6m69z8
	8OfdJ3U3KXgd84wbYKjt3E6tvck2p1WXMSgOU8RfZJbVz0x+mrVEVCiiTEBJFj08KRj4nLxtJIP
	v+z26G0AYz7Ekv0QPA0XASHIla2zHPtqJNwMaGdoQsTIw+NHEUl3Ub2kV8Mmgr35EvOrn
X-Gm-Gg: Acq92OGXBb8tUUTWGxoR5hRxMpnjEZkXxE8T6HOWdvIg1xtCV4G9gcLz1dSsM1JGu/R
	z2mAn3IlL9sNCrbEIv2oNZfnrOSdOwZkVHVPvyLcqBcMUpc73MULAHJisdkjGxp3ZyKYi/2NyCd
	WBZAyAZAyNUrAFOHOrua8bveeV4sIXwPg50m2ohJG6eAP6yNj2z3YaCj+/G6CSJE8i1+NMpMfrR
	j26F8nYICOyt5tgn/D7/XtZa4MwKkA1l1u6yIvEmwqq4vi4/9PVyAWpVcmKVT7Dw0PBr2k2WdEL
	VFFB6CChweDrgAnTGp4SPJ4wY1VhkI2WPFy/lIO7h6i5KAB51isMcrwW4LsmscAig9uL7DE5vum
	gTIDQ7HHXpR4iKwrCAasE6zeoPKOjJ5M4fhX76cPy3AwcSRTVrVYcVLsFSxj3
X-Received: by 2002:a17:903:198c:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c66416326fmr100240025ad.12.1781518274944;
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
X-Received: by 2002:a17:903:198c:b0:2c1:d49c:8397 with SMTP id d9443c01a7336-2c66416326fmr100239765ad.12.1781518274489;
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm97760195ad.0.2026.06.15.03.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:11:14 -0700 (PDT)
Message-ID: <53d0c41d-2455-4df7-b535-1a540c512913@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:41:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp:
 enhance machine driver for board-specific config
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <b09da7e1-ddc1-452b-9380-964f9ed3b733@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <b09da7e1-ddc1-452b-9380-964f9ed3b733@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfX9VH0pfEQ/rOk
 O4lr8gvi5gxZx5sitax9wdTSwEj4LRgqEbySA03AR4V+WEsGTB8Y0rr2jzb/4oKq4sG6QeRMef5
 OLnWTaUaRl5myv6S6aRMCuWQr1zVJzWABOFi5VLQi+Fr3RPNHHWX6gK7KqTLTbV2r/zAN5io4xw
 Bhpe1Z9z1lL/U9yjecrS6N/8s2fJo/28QPbXhnR7SkdVd376aqd0I8WjTSgdreFHjeHLu2cldMy
 8FVECMp8qovFHcu3k4kgbShDgs9wq+NONE4uqZFvBfJRwgPBLNXOmxpT3PR75wQaHOCLw5Nn1Mv
 Z10gX3vLcF2CRd6YLRS7BkGNKh55T0gHskd8RrFhuvVr7Zo5wMPNnxxwWaNVQtNdPhYuM0OrNDs
 XwLT75RnSmMU4pLr0ZUXXr3eMSlnoORcMfvI0wsQMviXF30dpK9NR0o6jwVcGM8lOJvfwMuvqGZ
 UsymM8Yii2zKBuxMlzw==
X-Proofpoint-ORIG-GUID: CpRs9MxPI3Q2Uq-rBA1p4Wwy9UEcgEfm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNiBTYWx0ZWRfX7aO6Mxg15fsr
 zZoRxGrML9yvIRacj6RfofP7AJTwoy8seAJmfPRkMlA9c+CfNBc3DD4yb30GiCsu5GMAOHCseJE
 f3V1GvrtMKGT0BYC9AhSnwxgGhmHMbA=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fcfc3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YMgT65kl-x7urRY1OA0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CpRs9MxPI3Q2Uq-rBA1p4Wwy9UEcgEfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-113153-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FA59685478



On 6/8/2026 5:38 PM, Mark Brown wrote:
> On Mon, Jun 08, 2026 at 08:00:11AM +0530, Mohammad Rafi Shaik wrote:
>> The sc8280xp machine driver is currently written with a largely
>> SoC-centric view and assumes a uniform audio topology across all boards.
> 
>> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
>> +{
>> +	int rate = params_rate(params);
>> +
>> +	switch (rate) {
>> +	case SNDRV_PCM_RATE_11025:
>> +	case SNDRV_PCM_RATE_44100:
>> +	case SNDRV_PCM_RATE_88200:
> 
> rate is in Hz but these are bitmasks.
> 

Yes right, thanks for pointing out.

Comparing the sampling rate value from params_rate(params) against 
bitmasks like SNDRV_PCM_RATE_44100 is an error. I will update the 
switch-case to use literal frequency values (e.g., 44100, 88200) or 
appropriate rate constants to ensure the sampling rate is correctly 
identified.

>> +		return I2S_MCLK_RATE(44100);
>> +	default:
>> +		break;
>> +	}
> 
> The function only works since it ignores invalid values.
> 

Ack, will fix in next version.

>> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>> +				  struct snd_pcm_hw_params *params)
>> +{
> 
>> +
>> +		if (data->snd_soc_common_priv->codec_dai_fmt)
>> +			snd_soc_dai_set_fmt(codec_dai,
>> +					    data->snd_soc_common_priv->codec_dai_fmt);
> 
> Should we error check the functions we call here?
> 

Agreed. I will add proper return value checks for snd_soc_dai_set_fmt 
and snd_soc_dai_set_sysclk to ensure any configuration failures are 
caught and reported during hw_params.

>> +		if (data->snd_soc_common_priv->mi2s_mclk_enable)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       LPAIF_MI2S_MCLK, mclk_freq,
>> +					       SND_SOC_CLOCK_IN);
>> +
>> +		if (data->snd_soc_common_priv->mi2s_bclk_enable)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       LPAIF_MI2S_BCLK, bclk_freq,
>> +					       SND_SOC_CLOCK_IN);
> 
> Is SND_SOC_CLK_IN right here?  The flag sounds like it's enabling the
> clock on the DAI but this is configuring the DAI to consume a clock.

Good catch. Since the CPU DAI is providing the MCLK/BCLK to the codec in 
this configuration (Master mode), it should be configured as 
SND_SOC_CLOCK_OUT. I will change these to SND_SOC_CLOCK_OUT to correctly 
reflect that the DAI is the clock source.

> 
>> +		if (data->snd_soc_common_priv->codec_sysclk_set)
>> +			snd_soc_dai_set_sysclk(cpu_dai,
>> +					       0, mclk_freq,
>> +					       SND_SOC_CLOCK_IN);
> 
> This is configuring the CPU not CODEC.

will fix typo error. The call should indeed target the codec_dai when 
the codec_sysclk_set flag is enabled. I will fix the function call to 
use the correct DAI pointer.

Thanks & Regards,
Rafi.


