Return-Path: <linux-arm-msm+bounces-115167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nqhACJ+FQmpC9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:47:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F16DC3D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:47:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UTA96tLA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GHGMIMmp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5431312A95A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D064D3CC9F6;
	Mon, 29 Jun 2026 14:29:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5A41167E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743385; cv=none; b=tx0x/h59O+8k3ooIIVXzU+3J2XE2nS2wORfauRyeWx2HxfyZpy6kHcAs9HmAOhm/PJV8N/yusbin7Jvi4ajjV2iXyHAK8v3MUBvHIg2Lqt9C9duS2Lky2rWZXs5QDk5YYJkboFXCxqCjBHoXeGRqh/KcsO2Qy+VgWZdwpo32VWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743385; c=relaxed/simple;
	bh=YHdENS5QrybigwPmSYcvEIYxrBr1qKFyawa1kVuvA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJMaRjwVBiz0+7B3AFxBqmTT3cUAcJj/ZuaKgVvf1Dj/GeochgOEt5Uz/uT1+kVW/yPNvKFBGIHln8Su1C5Z+GGuNN2fl9MrzCdFaEGjEgCUWAf1UvlBdqqIdd3xiB60i4eRcfNE6sHji2jq0UcL8BnvO2d+hKlYJMKn6SM2+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTA96tLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHGMIMmp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3ww2646903
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=; b=UTA96tLAEifRgAa5
	FZDNJruqGHR9j/0I6myP22H0XA/Yhn8cgWybUCiV5oLasjuQaJnr9/RWwsfahbQw
	oi4u1y4/qe37tVUFej2wuElYm4Bi1UALqPQKhLBv9dGm7PPiy7l3mCcACoJRmuQ/
	NqEHlfEk53VtzoROux0RvTeYWy7LPzrlyvIA0O2IIJa9ALko9laOCvJshbjl774T
	zta6rsgGXQtbTmu/0SoDv8UQaTrV0FR6ozrzaoEjJkpmE+Emj5s0+13ptkWqwsP7
	MCoL3+3Uu/h+U3RTBjj16fwLzjctOs4fIG+kNmSjggzWedmVnEP3GdqfgYtEy4+z
	D3sGFg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tsr48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:29:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966a617821aso1717445241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743383; x=1783348183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=;
        b=GHGMIMmpIj9HNiC9A68mRajxU9OmAtTw0A4dYs3rAlMPqOkxgj7r384tXkmwiNt9yf
         oGLG0IUr767HNmoVT1NmEGlDykloNv7+mOcr0Kux3et+aeHAksEZ4fLcJMbvh+0TTLkJ
         1nRk7UXdPg2DlONZIBTYce6RFPA/9rELSRgCRZklchntEMNQt67t4POnmhQaDyIueobA
         SoUM91qYmDVxyQvDz01PUIJZW3gjds4hNB3k9GiM93ALrmgWmoFDb6ct+eVTGiy/r8uz
         336GHfWEJtvLDZY7Q3MUzrkZMH3TBQrDZVA4OrlUEGocJsRwX9HmMwmUINjzH5O/uRNc
         73oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743383; x=1783348183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrPfCVtzcYTluJGDibIbTcC2lDYpcbpvsZXAB5YYg58=;
        b=OsJ+8ctMLvLvtMDKE/mZw640beOqbGClHgFRhLMkbctJHESmPZ6AG1VUlnqclxxtCf
         rzKHkrU/y4vEKYbYCgjq+W/N7J42Nn5jvrS1EZGaxOT9Dfl5jJOd9/NjtiVRXc34gaAl
         eOT+mvdCF/Yuk2/ulepgEv37XQ43fV2fHE3+kcyoQOzf+jYiA/os0fW2VdE4YxhZqUNB
         wFtIeKo0JtkhT46Q3Jcztfg9wBNCyOUgvWxuX5iqhAXf5omIMKNTHr80aknPo2SlARRk
         jIJU/CjHB4eP7DKGlVi+I10mzLg22gIC08I1/FvQmlLif8rUgXWWI8UqT3XVl92JO6Qc
         zybg==
X-Forwarded-Encrypted: i=1; AHgh+RrCKvjSz9ssPmTrINKijO5ypa82HKWfd1ik0eM5pualEvf/33lSImo7mdMHNo9Kg3PP8Ysivwt/TKXLsVT3@vger.kernel.org
X-Gm-Message-State: AOJu0YykkUZU1uhpG2xIgsfKn+6LeQ4VL2tJ0odkkthbvlLZ9JWcnN3L
	19NTbFtMcwzsUnR7jaul1fc+SGSYJdeRbQrb8OlkiwQO+PHxwpNAzPElhwmNM3YFT0G+A4ra/IR
	WgOedQl3ASd95Y4fMf4mMWWgbE0F97R9Jvu2SBrBV2jgn/SOYx+kLfqLZWAtAzvDzknC7
X-Gm-Gg: AfdE7clPKAsyhU2wcBL3ENzIXweGoFREYZq93Myn/W1gwh38OZDWGrsUlToLNqR8ftj
	bViMcBy7gQ5542hdI/B8btakDeZML2IvFr0LmaxWMWVPIrz50JRIyWbDLacN6TOc8EcqgAkP8gn
	EMknLgWQyap1B9fHet/njxsBU7hc5/gMi0wAKE8fLi09n5EgIGdOwpjZc/inx2gbnJkjw4C/XaV
	2YIsQTRCOJXiRHsFNefzDeenzr10cL/ingiDPW3gtgYwQINLF6Hp/TtDTtRG5wES83FFBVI4vP7
	yY/tc4YXiLbe3/tyME0egKRoVnXBdD5RbfycWfLGh9HgvvVgD3ednGS9IER9VSPMMSA5x28tYLR
	DtANKVr+Ty9giNPVP/cbkxTjKcX0k997wv/s2Ow==
X-Received: by 2002:a05:6122:1785:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5bdba587a99mr533866e0c.0.1782743382666;
        Mon, 29 Jun 2026 07:29:42 -0700 (PDT)
X-Received: by 2002:a05:6122:1785:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5bdba587a99mr533845e0c.0.1782743382102;
        Mon, 29 Jun 2026 07:29:42 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6983a7f3989sm4367253a12.16.2026.06.29.07.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:29:41 -0700 (PDT)
Message-ID: <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:29:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW
 stream DAIs
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX0hf+h7aX6+vJ
 QOmtzcQ7GcO36xnhdzC4Qnfq+8RS0prIlnWb6Wki+t1de+ADjOPRPTwvzoYl16N77AWuUTCVJm/
 cyv9JHCQUmFwLcJPHaGtINO1Bg0sWfTSHTJT3dweh51fFFJqEYLGleLZZK0fo6Yv3NlEpGFxvay
 Tsep+T5dFEefokq00m39TrUbYeZeqWKCK55kIc2Ioms4z9/QwkEvMdo77aPGcUpV/fDEBQ8tYPe
 76SWLG+LPqTORJ7EA8LtCc1nPpniViOzz3h6JX+J6fLYCyz2ZtG0uK0nzvOol+MQomqdl7MEV/I
 DDd0IxkPmhUELIk09z/U80CEsfCHUrRCRewcraZT7aMWzN0GBIgY+770MhFYxgUcFgePrT2IBGx
 IQijAaFjtdIzfcOKEnkpOERxYgM/0UooRkXoFpMhUoBPhTJ5eph3mfWqcx5heQTt7HvplrvvvfV
 beYsEUSivGrxqtEprFA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a428157 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UGUCIWXfjIFFGtpqo3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMCBTYWx0ZWRfX1QcuzNgtpsLV
 lI+ejfmZKTK1GS92yp9wMGuQQ9vKPvJ8miDo9OtWfGNQq8EY1O8trbhmGlEyNUNjKGzBTTOBN5A
 27KNY1mfC6ComXPz4IiIyf0PPJ15Qik=
X-Proofpoint-ORIG-GUID: dkwBM3uc40KfVwGCUhPK-LjeHRF1ywZb
X-Proofpoint-GUID: dkwBM3uc40KfVwGCUhPK-LjeHRF1ywZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115167-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:quic_mohs@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,gmail.com,perex.cz,suse.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 212F16DC3D4



On 6/29/26 3:16 PM, Mohammad Rafi Shaik wrote:
> On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
> SoundWire master and its SWR slave speaker codecs as codec DAIs on the
> same link. sdm845_dai_init() was calling set_channel_map with hardcoded
> wcd934x SLIM channel numbers for every codec DAI on that link, including
> the SoundWire ones, corrupting their channel configuration.
> 
> Skip set_channel_map for any DAI that implements .set_stream, as that op
> is the distinguishing marker of DAIs that own an SDW stream path — both
> the qcom SWR master and SWR slave codecs register it, while wcd934x does
> not. This confines the SLIM channel map to wcd934x where it belongs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce9dff4dc52..509d7a551397 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
>  			return 0;
>  
>  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			rval = snd_soc_dai_set_channel_map(codec_dai,
> -							  ARRAY_SIZE(tx_ch),
> -							  tx_ch,
> -							  ARRAY_SIZE(rx_ch),
> -							  rx_ch);
> -			if (rval != 0 && rval != -ENOTSUPP)
> -				return rval;
> +			component = codec_dai->component;
> +
> +			if (!component || !component->dev)
> +				continue;
> +
> +			/*
> +			 * Only wcd934x (SLIM codec) needs these static channel maps.
> +			 * DAIs that own an SDW stream — the qcom SWR master and SWR
> +			 * slave speaker codecs — implement .set_stream; skip them.
> +			 */
> +			if (!codec_dai->driver || !codec_dai->driver->ops ||
> +			    !codec_dai->driver->ops->set_stream) {

This is totally a hack.

--srini
> +				rval = snd_soc_dai_set_channel_map(codec_dai,
> +								   ARRAY_SIZE(tx_ch),
> +								   tx_ch,
> +								   ARRAY_SIZE(rx_ch),
> +								   rx_ch);
> +				if (rval != 0 && rval != -ENOTSUPP)
> +					return rval;
> +			}
>  
>  			snd_soc_dai_set_sysclk(codec_dai, 0,
>  					       WCD934X_DEFAULT_MCLK_RATE,


