Return-Path: <linux-arm-msm+bounces-106315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD24H75Z/GndOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:22:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FA4E5B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02D4C31A063E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A52B3B19B9;
	Thu,  7 May 2026 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1gDRLoh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX7z+Res"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97ED3A75B7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144257; cv=none; b=uEOwos2RhPwAFirf9Zy6cnUUxZaJz4Xp4Fq5v1EHMmHyV6J80w/JM5ygNZ1iPUYOGGqydXT95/NJlXzP3f87oht2+Ek5Ft50SAJQOihy1+ojHWbd6WMI7WbdLTpXt9ZUkXQ0v17qlKtolFSJX8nYHVArHC1muXwv4FVLYWh+yIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144257; c=relaxed/simple;
	bh=+WoGGFhtYcbQJjAFrWKoyIYd7RIh1Y7qXYNblfctVHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsDup6ZPZiLjpYi6VZV1hmGut3JPiuepfIghsAZc5zgxze5JoUtijwHYRcrrgS0O9SnlnFIryHaiShLfMfCmNuaWPuxLiZeOHOocbwPozFHREp0VdzNjZjoggyZzVNC4CSZdj3MnF6WRKSuxVxTAajtLhJRUa/KoXh36w5quMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1gDRLoh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX7z+Res; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472CLac260344
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=; b=X1gDRLohyveGUNtG
	mlNMvk8XAuiAbp+n+u3A3xRxNeXCWIF0JJQbY1bWuo9ryItdV1h8WclUaOq3/E2D
	3+/qrK74OZjqor/mSUq+jGKl7oBl6d0kZixzIi0KtdE4fYM4qytFju6dM1AgLflk
	9viD/2rwnnoGAAYMqKm7QKx3iPZjyA6iOa4kEPqYTTSNwc4XFUoDw2Ep4kDC7Hqa
	Tmrsyeb9l80N9bFDelBbWSl/HPEWhdCVpZxnPPiW/9clVfjLBxsBfWxQDY1PPSJO
	/eiBLn9p4pNG8sp8sDgQBQG2bHXns0BjHV0QoXDGZEkE+TRXTkQOF8OlS4YFYkyt
	kDbwuA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hr8sbbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:57:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b1f39c5827so11205346d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144243; x=1778749043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=;
        b=RX7z+ResmH83kUOm8V10wAXRrGiwUoLGVby0Ku8f+i4EY4TgJwHd4OTpErtQLnt5qp
         3KvSljMfuzXfR/P0ZUPeqRAZ1jSQvT7m/nv2YYBDTKDFhzA+/X/hpBdaFYQdFvT3nHo6
         uUaSeZLwORyW/QbC/cFq1Tdkqt/F45zv21p9ZA48qfyYHWVOiXR2yjQcbwGfhqebreW/
         7IwoPnTgTyypBtwtjnuOWAKHAyf0OIW/hwSfovSpqztUE+QSl2WMJEZ5SmjrayiYTbqb
         0VnL1y813Xwp3AghW3JiAII1ynFYW/ZCtEWwWYEgX+V2ZfLAMu4Cn0NVjPoed4wYj4Ii
         HcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144243; x=1778749043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwnTa+6y8iyblD7EtUXT7iF9f1ove6W57rU238ZGCj8=;
        b=XE1ChSmfNiTbaMgCYlo2cWjGWJ1efAXeeVBUza4Grb37iPKRIA0JLMgFgSVGplMy5k
         B1M1MY9PGUNGuwCns8HAbK6LM4oXY4B89k5gwkQ4QmvXnsRqb7CEhqd2Bx8hiVgqzIgY
         YAisN8xUKP95AxQw1j1021mw5W/6D4GxCFl6NvUQOJmkRtGRP+rlTfBQTv2wy2WrX6l2
         wxpT/zPR13ub/L6x2g313jr0eXJx/aDtX0Nhk4OZAsYN8JoQQf/3osc3PgJe8Jm+7y9Z
         Y7GZ3Uztiwv4p67jL3eBQVQYHfh0sTZgS09IxyPV0vzpfHwUAp8NfZGu2t6qxKRIQhMI
         pd2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9l7EAYwdxShhLNmxVNsm0FzPqLijxAsu0ckynPRZfqVwZh68vUYKqUwnHz8gjcMGccXFGkf5v9nMCitzeg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9IGqy9X/1Xy2+SdHGzHLud377FNC3EdNOsGrkMsTGA4tO+3j
	+0Lr0gk7DpWbzrnn32kweqlvXn7/PYGISOlTStai4lUHPmT9aqoidK3p9UTzzgh95Mkd3/ZpDd8
	RZGK/D4bSh/u0z4EnaT+IYfmgo4kmnpqeuSmSfVWnPhyEeWVekWJa5o9qNje8kVs3NVHs
X-Gm-Gg: AeBDieuwXpKKiz3jQmJGj2LGG5O7LOiiillBYo+aW7EUdtDgdJoEe5ILIH82Wnu/Yfb
	aHnqV4561YKa/ckevdGB8VB0oxgUpYxfhzYdZeljbgXbQXXsnXytEnblIBlXH+cUcX2np9QztXO
	scLYaCdebk76lsyYyngYYKR+73dn1xOxsUwwNsBDZKS0cur37GhqL/Hi3REi5DuP093hd3EzW6N
	hcvG56fext29ckZCrpHz+KZy8/W6VPNZnLPHA8emevF5+JdLD86KZ6aiiSrimDyhs+2g5o2jQMm
	1Q96xhknfyQo1aJrbWYuweszUxFT0Z6o2mGq+VJXJ0TCZO6RpxqfCYNtvLxIfesauFJOeeGQhlZ
	UwghFbsXb6KMgc7F5+4cWUKPsj0W3rMHY7Ybv/1GPApKRrrgsHVv+8r4/2tE=
X-Received: by 2002:a05:622a:1813:b0:50f:bcfe:e8dd with SMTP id d75a77b69052e-51461be0535mr98108111cf.8.1778144242712;
        Thu, 07 May 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:50f:bcfe:e8dd with SMTP id d75a77b69052e-51461be0535mr98107161cf.8.1778144241048;
        Thu, 07 May 2026 01:57:21 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm201855315e9.9.2026.05.07.01.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:57:20 -0700 (PDT)
Message-ID: <dd0e22ed-e464-4d61-b354-b396f9694976@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:57:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sm8250: shut down MI2S/TDM AFE port
 clocks
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-6-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BjsuNDZLVHLdKEjy3YVdrvpPhvOMMKr8
X-Authority-Analysis: v=2.4 cv=caHiaHDM c=1 sm=1 tr=0 ts=69fc53f3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=OxOCmRKzI9gie0uB-wgA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: BjsuNDZLVHLdKEjy3YVdrvpPhvOMMKr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OCBTYWx0ZWRfX+LknACwUT3CR
 uMv65bRQB/tl+jUEWn7MF3hUIWWGiJYYoN7dTrAiE716dn9lvqVgK0yM3sRii50puGKp8qDkk48
 4Lbrlj2lHVPOcLVzRqkoOk4GiEWSmNFp+UjsE7QUzO5kUe965jCDwdgjfV/6zCYfGm2hxZ76j6u
 +U+dEcZVTo6eD4HgVAZFZGEnrPbvkUZc8So2x7m6oobjhu2hItqh5R5QZInjwSkM8Mv7Y7330Lf
 GAShBiqJ/Xma02hkKYENsob8AH0PaOyzTL+ehMwTTdltRT49jbO4s4XoAfoy3P3K8gGevE1cI03
 8yozNFO83/6JkfOiWdYUKZkxXfQCra7JIPVurCh2Z/8aTGSo4f7VEIwn5e1BItUmbkhBK/CDrnG
 yHHH4dCJxsxc182vBxr5Zka0pFvSb50e130uu54wy5mHoTgrdcZwkSmLsrh5jpGxxzSH1uGbr/e
 gAlka+l0RW9Ma2D2u+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070088
X-Rspamd-Queue-Id: D74FA4E5B7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106315-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 8:33 PM, Val Packett wrote:
> These port clocks were never being turned off, leading to increased
> power consumption after a sound was played through any of these ports
> for the first time. Use enable counters to disable the clocks in the
> shutdown callback, similar to how it's done for sdm845.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 150 +++++++++++++++++++++++++++++++---------
>  1 file changed, 119 insertions(+), 31 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b64fd3970ba1..9f0f846a14bb 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -24,6 +24,7 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
>  
>  struct sm8250_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
> +	uint32_t clk_count[AFE_PORT_MAX];

In your setup are you sharing BE dais to multiple FE?

if not you would really not need the count, startup and shutdown are
paired for single PCM stream.

If yes, then you need some protection against these counters.



>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
> @@ -163,83 +164,95 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
>  	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[PRIMARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SECONDARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[TERTIARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUINARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SENARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> -			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SENARY_MI2S_RX]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case PRIMARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[PRIMARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[SECONDARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[TERTIARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUATERNARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> -		snd_soc_dai_set_sysclk(cpu_dai,
> -			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> -			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		if (++(data->clk_count[QUINARY_TDM_RX_0]) == 1)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	default:
> @@ -249,6 +262,81 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	return qcom_snd_sdw_startup(substream);
>  }
>  
> +static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_card *card = rtd->card;
> +	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX:
> +		if (--(data->clk_count[PRIMARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SECONDARY_MI2S_RX:
> +		if (--(data->clk_count[SECONDARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case TERTIARY_MI2S_RX:
> +		if (--(data->clk_count[TERTIARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUINARY_MI2S_RX:
> +		if (--(data->clk_count[QUINARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SENARY_MI2S_RX:
> +		if (--(data->clk_count[SENARY_MI2S_RX]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case PRIMARY_TDM_RX_0:
> +		if (--(data->clk_count[PRIMARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case SECONDARY_TDM_RX_0:
> +		if (--(data->clk_count[SECONDARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case TERTIARY_TDM_RX_0:
> +		if (--(data->clk_count[TERTIARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUATERNARY_TDM_RX_0:
> +		if (--(data->clk_count[QUATERNARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	case QUINARY_TDM_RX_0:
> +		if (--(data->clk_count[QUINARY_TDM_RX_0]) == 0)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +				0, SNDRV_PCM_STREAM_PLAYBACK);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	qcom_snd_sdw_shutdown(substream);
> +}
> +
>  static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -287,7 +375,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
>  
>  static const struct snd_soc_ops sm8250_be_ops = {
>  	.startup = sm8250_snd_startup,
> -	.shutdown = qcom_snd_sdw_shutdown,
> +	.shutdown = sm8250_snd_shutdown,
>  	.hw_free = sm8250_snd_hw_free,
>  	.hw_params = sm8250_snd_hw_params,
>  	.prepare = sm8250_snd_prepare,


