Return-Path: <linux-arm-msm+bounces-106310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lo8Jd9V/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB524E57FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D74A330FC3C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8A439A07E;
	Thu,  7 May 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1fLM1Z0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyNNntsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9AB39EF27
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143915; cv=none; b=TztqvxK4XFbdgIOIGrPZ17QHjw9+sEXEO2Vt4A5EY+XN7Lczfe96rsJs78Z3nJvFpSoPNTQ+Sz2jITZqIMVCmmurBxvxPsByG90p39Oa4/Qc7jg+GhpdFAtzeQDTCtZJI6U3abyy4yOl8j+XqlYhcyNrQ2Be4CbjAyG7FSj+Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143915; c=relaxed/simple;
	bh=Kd56bN3gu6uxbWvn3bhH3wHcIlXHeWTPMbpY4iQk8u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btojhkaCmSStlrHeuc2P8pSRu4knEt89A1Ah0RkYKeiTK1Vt1ktRLdBsgl6sy3tU3R87dc5te9CW4OxTvpA13OFrPL06z/hNR9X3wYAFoHw9Ioy0nPxzhgwlRqfPcrI0CFjAnEyvDsD7uczBQwreqTJb/7IOU3RiqekBSP5KMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1fLM1Z0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyNNntsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eSaV026471
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=; b=N1fLM1Z0z+T1sCHU
	K6ANun0LFiP6FEB/8ZqKww0q1U9nHLArx7YZiOR93LjsaKjNn5iEG95fRBcIgzzS
	NvmNM5NHropjSbZxKI7KlbaiKdrwFPFelhCXK4ZipjHPMiU2K4tXJMexSHjqJctn
	XNP6eVQsxNLhVbBNNta9Ma29hXwash9VCbgVT0J7KiiX7mnaLnPwzEyufwSzEcyn
	wy4xnFgBtLbMS7Ee58d350tGjCLmNzxt6iBlqkG88vz1FbqXXhnI33jzPDy/8wOT
	3Q2daECDpExqQxHK1gTYbDgAbYxoUzac/o2ArDg0xTVN+0CGLVUR45BEAAgIComf
	xH+D9Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t12ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:51:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3c7b989so9374841cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778143906; x=1778748706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=;
        b=ZyNNntsWPIwAbgw0URxu/nIwcurE9yuSb7N8mOyekYlZrhxvxNz2cFnpRfVHSYavFF
         o42CIUTC5blyQU/CexIMC5nqYGY7QZri/odzuTHvupgc/B0w2TuB/udh5K/SlgtArtkf
         c1mv2JCRL1tisuYrzPS7phwLu9afMDtoKnQ3wamT2eA6XvtUQC44BO+l7TmVCbPdCZJW
         K4sa8IWdA0BJbgaNNsE/+Z5jJv4yDu+2RIgSy/MvVIG86bgsLrsh7X4tu4/5KC05etoy
         Ekwi5YVuR/BQSlcPBhAT+nF1uae+4oZSioV8VxjNTpFAFmpUvjJFhx/GoswOQtplXhbQ
         MJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143906; x=1778748706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cP3rLsoC5XmxHXQhD/dEud8ZcY5y3tuze8ltsJwAUjE=;
        b=YefrchDlG/7Vog7fM6o6sZM/jgGXAgnflagW76A+DHr3Hj9EM4IycBcHdF8M7E1ACt
         hfMXkljuSie5Jt0JUHIMP6VZ388qgJkSionOrmYbr5kRzbkqUi+8dVTeZDMgpm0FWDQ6
         DERU2E4Goz5Vtv9j6DFS5f+bXXQrB0IJHq/mLxiHgjwgl3NVql5XCmiYt/gCuzDLZhhb
         ks3Zm+OWhAw9ELKU+aYc8EPlto9P7+9UkIHOCwthD/ezLlAK9YWi8Ja6ifQOwWhpnDYg
         pjuYkC2/s5xlnzgOagpQxmr5HGTcEPdGGgBlny7l+NwuwGxlXfXwK328wU966Vk5XdOz
         5xyA==
X-Forwarded-Encrypted: i=1; AFNElJ9L9qPaQ0b1z16GyrdSFptO1yDjyVuqwh53ulT+kHEMCKgKhZV9pabACGzzBOXvGPw2WCPtv5VxtUwzsMpT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe0Oed68V7eW05FV1karCYlBYXmuGQAJPwLoxxdekjjrEzQaPO
	tqzxfQ61XqEosISrAdyv14nCmEgYk+wtKSJ37wiKsYJgW3XSxcY4F9Yq/U8WIR8FXRkew8zhtv6
	9ykiswZuVcSNYx9luBhqWDoGzHoKlUlwvk1+dF49Mpk/UHW4HR/xb1OJaze9T/o7vJ9ff
X-Gm-Gg: AeBDies4xvwIABDvkpeQskT4pJMCIfDVpUMq2/g4XmlcAmHhG6iCZAjlrGzzM30dfz5
	8lL2dOmfyzwI2zk6Bmnm3zoUPeNehlWYbbm3Ygz/O0f0pZFIKEUY2OYUCu0baASJAD/Koywx6oV
	ieFSNf+bFNc94DHVNba6tP/oAgUZhw3NXLMyNecKaM8Gcz1+9gCcA/Es+sR7+2YQ5gyk/7BdZrQ
	L5yJjU2CFHPvGMZoq4ilu9SXer7l27PGv14sBcHmRx7+kIsM34xuI7Xqpn4AbxrZ3sWgsHG9gU9
	D6rKwcyLPg7UswKKskMEO/d1aONtSvHRNP73s87dmnos3ZSEzK437Trje3wOwH39cejfxiMDfNa
	5hCvWQ5xZdQRTq9iW0sqVAhaSEaFSRQcmPk42yQnwcybLEvQx9p5/K7KNJKQ=
X-Received: by 2002:ac8:5807:0:b0:50b:3357:7e70 with SMTP id d75a77b69052e-51461fb3815mr95896761cf.28.1778143905774;
        Thu, 07 May 2026 01:51:45 -0700 (PDT)
X-Received: by 2002:ac8:5807:0:b0:50b:3357:7e70 with SMTP id d75a77b69052e-51461fb3815mr95896411cf.28.1778143905251;
        Thu, 07 May 2026 01:51:45 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e530b05d9sm48930755e9.3.2026.05.07.01.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:51:44 -0700 (PDT)
Message-ID: <6338e51d-da58-410e-b10a-4a565d467f1f@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:51:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: sm8250: add TDM RX support
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
 <20260506204142.659778-5-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc52a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=fdbe8OLCKT6xAC55-esA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: qP7vd05pw9u6-oS_VQxkOoWELtp9TVQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4NyBTYWx0ZWRfX4TYp0/0Y+mnt
 EwxzT/nSZ+c0WtwWB3Dq6zH9r+9PM3/fwi/ZKqaWeqlrvlznHwsync7HnAWu2cN9b5O/LkRlAKE
 pnVDla00xF5h2lT5EjD+sjfzqXvZmLkJSJaH/2EVORxJ+vAdyRTJAdSRIkCUVV0S2JahEySbZ1V
 I0SszIq4N3PKTcF8OmuCO7dv8qQEjtNkZUD0Zyac+df/J+iPRSl+MG7KXou6uwoivgf+eo7K+Xu
 9+WAsCmZaX51pf44eyArrEwZTWRmESk3uJ5In+qjXz2BVFon/kWf92pmxw9pxbu+/RD2bp85YzW
 Yoto2ZUY8LwNShrb/17RzSOPh3wUnN71dVDvQSHybKWBV+5RP4Ao/80m+a8lsFs8AKNmmGArNk9
 WbHRi8Jz5BjE/7q0gLO/rCAW1iRS9jTkQKDgSjZV+YE+Rb0DtQJlkkEIS2IHCi1Oj3uMGKSAO5p
 DnMWr4hi+oreeMVC8Rg==
X-Proofpoint-GUID: qP7vd05pw9u6-oS_VQxkOoWELtp9TVQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070087
X-Rspamd-Queue-Id: ECB524E57FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106310-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,packett.cool:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 8:33 PM, Val Packett wrote:
> Add support for TDM RX DAIs which are used on some devices to send audio
> data to speaker amplifiers. Channels are assigned based on the codec
> DAI names for a quad-speaker setup such as on the xiaomi-pipa tablet.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 141 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index a675913da943..b64fd3970ba1 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -17,6 +17,10 @@
>  #include "sdw.h"
>  
>  #define MI2S_BCLK_RATE		1536000
> +#define TDM_BCLK_RATE		6144000
> +#define NUM_TDM_SLOTS		8
> +
> +static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
static const ?

>  
>  struct sm8250_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
> @@ -55,6 +59,89 @@ static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
>  
>  }
>  
> +static int sm8250_tdm_snd_hw_params(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_dai *codec_dai;
> +	unsigned int rx_mask;
> +	int ret = 0, j;
> +	int channels, slot_width;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		slot_width = 16;
> +		break;

Any reason only S16?

> +	default:
> +		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
> +				__func__, params_format(params));
> +		return -EINVAL;
> +	}
> +
> +	channels = params_channels(params);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
Please define the magic constants like 0x3 here.

> +				8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
> +				channels, tdm_slot_offset);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +	} else {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> +				8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
> +				tdm_slot_offset, 0, NULL);

> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +					__func__, ret);
> +			goto end;
> +		}
> +	}
> +
> +	for_each_rtd_codec_dais(rtd, j, codec_dai) {
> +		if (strstr(codec_dai->component->name_prefix, "PL")) {
name prefix can be null.

> +			rx_mask = BIT(0);
> +		} else if (strstr(codec_dai->component->name_prefix, "PR")) {
name prefix comparision is fragile design, this will break very soon.
and this is not a binding too.


This also raises question about the using this generic driver for such
specific combination. Can these be made specific to compatible ?


> +			rx_mask = BIT(1);
> +		} else if (strstr(codec_dai->component->name_prefix, "SL")) {
> +			rx_mask = BIT(2);
> +		} else if (strstr(codec_dai->component->name_prefix, "SR")) {
> +			rx_mask = BIT(3);
> +		} else {
> +			rx_mask = 0;
> +			dev_warn(rtd->dev, "%s: codec DAI name '%s' not recognized\n",
> +				__func__, codec_dai->component->name_prefix);
> +		}
> +		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, rx_mask,
> +				NUM_TDM_SLOTS, slot_width);



> +		if (ret < 0) {
Can we handle -ENOSUPP?

> +			dev_err(rtd->dev, "%s: failed to set TDM slot, err:%d\n",
> +				__func__, ret);
> +			goto end;
> +		}
> +	}
> +
> +end:
> +	return ret;
> +}
> +
>  static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  				     struct snd_pcm_hw_params *params)
>  {
> @@ -120,6 +207,41 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case PRIMARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case SECONDARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case TERTIARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case QUATERNARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
> +	case QUINARY_TDM_RX_0:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
> +			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}
> @@ -145,10 +267,29 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
>  	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
>  }
>  
> +static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int ret = 0;
> +
> +	switch (cpu_dai->id) {
> +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> +		ret = sm8250_tdm_snd_hw_params(substream, params);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  static const struct snd_soc_ops sm8250_be_ops = {
>  	.startup = sm8250_snd_startup,
>  	.shutdown = qcom_snd_sdw_shutdown,
>  	.hw_free = sm8250_snd_hw_free,
> +	.hw_params = sm8250_snd_hw_params,
>  	.prepare = sm8250_snd_prepare,
>  };
>  


