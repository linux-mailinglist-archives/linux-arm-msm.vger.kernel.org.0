Return-Path: <linux-arm-msm+bounces-106318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN0PMFFV/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:03:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0D4E575A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 11:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D6A9300690C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 09:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0A937F012;
	Thu,  7 May 2026 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyjiVLNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7UcJz8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B785392829
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144587; cv=none; b=iUDnmNGWtue5+yo9cX6//q2YeGwKy9VocI5R14qGD+vZHz2+BW9tf+sIeSRuXYhXYTAhKTYjjaPQTh/6itzLpIZRakvKiiuOlmCDrjdQqiNK7AGWgaK22OcX52RaPSAyXj4ArINktvpKzupgOqt3ZBfYgI5SJp0Ku6MbxPaPJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144587; c=relaxed/simple;
	bh=5aI9ufeEspbP6oC6uFRabDZP0aBxIPK41cWs+AYJpXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RnlqQcRnOM+/xA4hnqi2rmgx8L17TAII7iDAEPkatfoICauGctvxWVdIyK4hVsx4ZqD1J0wQ8VyeHJfzQJW/UyU2yRM14QToInnuZWRG3H7DA0pPAp+UuV/IJUe/cRcpYxXxKu2cTOnwcfxhuPZ07QiPEBRaXXjWyx2hK1bHbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyjiVLNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7UcJz8F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64758t8t3924161
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 09:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=; b=JyjiVLNXyQm0DlBZ
	10sXw+5GiBcd6zTMT8pKGu72TAosSsyWzXI+0ZB0kT68Qt+BeBaxlCHuXK4M9o9M
	YnrYveghdPyhg1CUgNFhcvIz2qYDNVTOfZkhzfNGlfCtk69QUdJ7LdROqwcS+1Vp
	TiegUKKesEAX0WH/TOicWso8mNCrGZyxb/jNcim7igzvKLDUBmIRDPCkmGXgfqIf
	SKjSJOLfyQ+y8wXbuHTcL3PNrk6ZYUTE+YssNqloTur7RlCQcEsnNIWjNYTPnjB2
	Tv6VzJnUleekidXr1Jq4n3n9sKeVZtQ4vVX9B6d5HZMtv+29LlbgEk324aM07QTm
	E/K7EA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88aby2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 09:02:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95df04c5136so170867241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144576; x=1778749376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=M7UcJz8FE+k6K8lhmh1P5+OrCSR/8pOPK6aRBKiMPhDv1yhr9oqa7X6YnfD7Z1Vch4
         8UNEqWMmq6sYihM4MyKOS1IAndJYUMW9v9B9H57qsBGRY9FXAlS8YG+5E2TyZRQ9d7Rr
         m3doxze8k1s+F/p7LzkhSEv5+QTbggFgD2OQs0h4UIKiWT2N0oIFb62+3WvNwglPgKta
         g3n8sx9+4lG9AggxfOHzAJ249c7LecK2oNxV8gFPFUb2qgd/j8ljxxiapf7O53Ii3p1r
         qNrtKR6s+0w1JOSWsUEjm15FogbTEL0iaqlIrXlG4gApv0M253Z5W529Ub7JrBeD14OP
         IJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144576; x=1778749376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGaXOPh/VhtEqlgASKzMxEBSPnFHvs3T2iviND934Wo=;
        b=UUwodYNXhA4J4oqE/Nii2MuZhIIl97vt5fmgouZ9vcrmoFT02xJ6ixK8JoNeV6fDz1
         n0miIBXmK1cyJnWpmqX3r16ux5tBEKigk3ai89cIS3JZ0nVqGywCFqGPAyC2ODawEYJK
         4TTUp8wszgRm9OZxzGmSIJLTeL8oxea0yeQk3xqRrdHQo2dhhkEB9BFO1FQGQJ0WAIrd
         nS6nhEpR8nUVbXHgQ22z4/NLwE112DOdQuOaxmbbzgNf3y5M1LqK95OJ7r/5mao9D0OP
         DmNRLPmD78l8uuk2mvGzvBLA1phaybUosqz3Pk7fYJzzfL/OoV0yqLipysiSUzyXJrmR
         /UWw==
X-Forwarded-Encrypted: i=1; AFNElJ/5RwCHFcMAyJWvaZLFW57Nj1I+DVe71Jf4naR0fX11WR4C5Olr97zUe03/Z1xL7VpFcrzdDUFErXXHDZL9@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKbBYRKfipK4uDfD94YXiWcb/7cRMSD/XvuPe3x+O6HS+fPol
	AAuXotRPTzQhFnFANqHvE+MOPEQKt1aK1b9A9ij4Dr5zUBNSxFTBTlXV2oZOqaj6i5rTqXEZfJn
	jTT5eb1M2im8b5XDCxsv2Gdjm9QunHkmTyaKrWZCJ0mDRtpqp0+s9VwzkGmNkRP02GFJnQGUSF/
	nn
X-Gm-Gg: AeBDies9o8ACg4loII3vik+ltGIbpK3jQVRpdVjQDWr8cJNTn3O69F5r3TW5V6Ud04F
	JBP8rM+wM4+K/VhVZSrJFe5zJ4ul9LX1zE/Jf18bTZ0GaRlmxBjGhpiZk7Rv7cFRldnxRgGtcn9
	WgVgaE3uX5N6X8mb1KQXtljtYOc7HWo38NA8nrYetElIzPtcDutfQ1DM3x2cOPr+uaS5ya9RWZp
	QWw8mYTs8pDOsk9zhWd/Qr3OvgDaWysP12S/OZLlt44MB0kcQxvPchATCCuuI6lpWr15o5XRlBH
	OqY+lNkd1dN7J4BJKpd56Yiy0bshGLN3cbw33Fp8dxOeR1ruqD4w5uBYIs6VGI5KqT3QJLJIhuj
	3SX7y55BIQER2SRo1l5l2I0SN81DUpeOtQniZQt7tyKcjQ/ZccW5E0U9ekhY=
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834625e0c.3.1778144575601;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
X-Received: by 2002:a05:6123:a8:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-575595d0087mr3834615e0c.3.1778144575212;
        Thu, 07 May 2026 02:02:55 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc8351448a8sm58349766b.50.2026.05.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:02:54 -0700 (PDT)
Message-ID: <2f516258-d71d-4b52-a310-1b6ea11455ed@oss.qualcomm.com>
Date: Thu, 7 May 2026 09:02:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] ASoC: qcom: sm8250: apply codec_fmt to all codec
 DAIs
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
 <20260506204142.659778-7-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PN8Dv0lXZHFo5l4XsHQWT3V_e13qi8v8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfXzevu849KsYHN
 XEbYTu1IrnkAhSWiPvJZ7fC1/Z5fQRvsFTvuV3drhf+gjv9Ra4ZA4FoMh9c1pnPgK45GNhfig+A
 Y+h03fYXUKhFbWlrdxDNEr3LxwU5/6bjGCJYD/s8C2JF/o6lXZ1PdF9Y4GY9IC5ibKa6aIXpHU8
 YxdAwt+haTDXn/6kaHzY19hRtpswUMGZz/VSjOfiQiOwfABrN5bCPcWYtXqNmnMMd8utCUVP4vF
 BMi+r7RwfP6ptl/8Zhg263e02sIBtJ2PfWJfGj72+R/e3f+I+brMftjTg5Ra84tMsoMrl+eExEb
 DCDkicFx/u43HcgjcgROBkqS6M+lJMxx78lbgZA0EH1TuezARP3bQVHljTpPFnb0cWtVgymuqfe
 S6D27z8EUi8nJIGbFnQ2cDdFa28cUiyN9Bkn2lZ0KSF+a8xJNRfjG/E9oD9s+nIgtfWOhVLHpkL
 7DyA99H5kHYB4cWGArg==
X-Proofpoint-GUID: PN8Dv0lXZHFo5l4XsHQWT3V_e13qi8v8
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc5540 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=uMHxBK8JrORPa0cVsrYA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089
X-Rspamd-Queue-Id: AED0D4E575A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106318-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,packett.cool:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 8:33 PM, Val Packett wrote:
> With MI2S and TDM interfaces, multiple codecs typically share one bus.
> All codecs on the bus should receive the same format configuration, so
> apply the codec_fmt to all of them.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  sound/soc/qcom/sm8250.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index 9f0f846a14bb..7bfe6d282231 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -167,7 +167,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  	struct snd_soc_card *card = rtd->card;
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_dai *codec_dai;
> +	int j;
>  
>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX:
> @@ -177,7 +178,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);

failures ignored,

Can we add a helper function would be nice here.

--srini

>  		break;
>  	case SECONDARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -186,7 +188,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -195,7 +198,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -204,7 +208,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SENARY_MI2S_RX:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> @@ -213,7 +218,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
>  				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case PRIMARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -221,7 +227,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case SECONDARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -229,7 +236,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case TERTIARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -237,7 +245,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUATERNARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -245,7 +254,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	case QUINARY_TDM_RX_0:
>  		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> @@ -253,7 +263,8 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> -		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		for_each_rtd_codec_dais(rtd, j, codec_dai)
> +			snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
>  	default:
>  		break;


