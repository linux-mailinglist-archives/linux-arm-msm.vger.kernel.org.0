Return-Path: <linux-arm-msm+bounces-83994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F4C9806E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 16:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 194863A2586
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 15:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC5A32B9BB;
	Mon,  1 Dec 2025 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RL1Nm0xv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBpdsagy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B4532B9A2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764602490; cv=none; b=UWLwwqo1SlMn/WD7XDEdplHxTJktQXGPs4Nk3DEKE3Xml0HNer2Au8QwEHukmd7Z6mW1tV4Ba1+E0NHpgKEa7grHfRJAtQXimi/40hsYqLbIgNqrUF1i7aW9cxDccCbQmmtw176c5eoRdTEvorHHuGqfw4SNNo5vbwDPb2P2TPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764602490; c=relaxed/simple;
	bh=/un1GWYR38J5m0YfqLariIcvtUommWVqhXO6TN7FxxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbVp6kGOWpcPl1GiHPFplKBYl7NMTuXHF4js7eqdUSPK5XsE+mHL+urNopbbWm3QJE+uuYtOMDA3ZCNOHDc35Df9HtWh3JPJAD0qtCzJSdZenYiplaWO6lRr0EmhhJY/IJ5WaNpqpZDDFtlAop7l1IcqD72lPyXNu/H8mFKZF8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL1Nm0xv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBpdsagy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1EiXEU3689107
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 15:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=; b=RL1Nm0xvpkIyF6U9
	RvmrMzxtDa3cqwUCbmEggA2aoldSygHaoz5kFCjUEb56ZXBqhU7q+l+hWuDbidJI
	batK6bAs0dbxq8xT5l4q5mXDdQLAluRiu+i5cvocqtEY6tq60V44SXPcUWnWNAQw
	fjmyYmcXf7tm82ZQJSGmTDGemEmuiT7HbV8zxEfTbCoMDkRp5aO73KnyYzhYeZZg
	wCR/RGf54gs0JC0LYsCRm2vcCYCa3lgG5OiwlwnExtpA5gyvP2blm3qP8vIy8GRL
	NXfGcEyjxFuAGAVfrVqZq4olgsqBo0WuUwWzcX1uYK7KLQikCMO893e2qSJRhwQx
	O+yHPw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as6141h4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 15:21:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5db1f7f4a36so1274808137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 07:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764602486; x=1765207286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=;
        b=EBpdsagyqrCZWoDVJyo/2A3b/D8T1ErljZYEwFjcCqUjeSjjQCXmIM1tqBtTlhJ3Oe
         TskOxHQTlZ28fTojNLNJpuCiCnA3CULe48AP8fXEG57POTNAY8k9VzPEx74Ng5w1jaim
         YrFHZ4a/CX5wiE/o1KK1Fo7c1qifJK97Jx8NBgcgxs+C0TeMljdEZEWNZt7rYho80UVG
         VBz6ml7DF1fkI4QU039faHlyyom0VU4x/yzLWqqdXLpvqwYm7CsdWofxut6/+ut8v6pt
         Zh5XTzgoYTIq0ZJVybdO2d5N8T9oI8LokB6BK8695xBhgTWcYl+ISXuUcMXNzpPyfY4F
         FSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764602486; x=1765207286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHIpMxlFxXdyeDYYOIxfgtCVaZNiVVJpcJEl+d0NQNg=;
        b=c4BeGoSX/mInccedAnCBuDgOa5YaiXdrrJTXfxMfEnj7UQWPnmEWn5E46P1LzD2AYE
         GfI0AdSUvwVwcecVK1eqS/KSUWSvCf6mjzUSuU+zeGvKK0ro6s4ifqNkq/coZJG8iZ7f
         A+QugD1SZI69RzysTjUvIEQ9sFH/Ls3YiLPNJfQOU6i5GM2U09zyPzkEQUrGAIGAqYIb
         LGVCeaAQJsK9opBpMQNKuLUzPQo5KOAhQIdOK1+kpQXKPsHTXW+K8fHEPMIEFbwN17F4
         x1buYFCy4wAEsaLri17KKmMV5ENItKhLRmf68LxSxdkYKjBRmZ0Auf0BZ5oQHTjfuc+5
         3dfA==
X-Forwarded-Encrypted: i=1; AJvYcCXTK7aZlRAkUDBAfNGapoppbuWI9ZD2u3bUl1c2HtGwMJvsnRRxmdzBhNugRPtB/w9indcGyMUcNFXiVkBl@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMaPG33G6pwmvCFr/thYaTfRXr2UVpUZznrg2Z4cQD9JmgSNH
	hlEHwsZ9nk8r0UGjHFVZzSy7Ufoe3t/yU35ZcQhAmOZsWvNM1RJPRGpMD7Ko65WFIoRcm41lOcd
	dwNRr3ZdUNXm7NmSdBtWPZqG/iP2bON+qIfTRionwb+N+bCi0MSvt5LTfDp8BtGFB7YML
X-Gm-Gg: ASbGncvvyysaOZ7LPL4Km9NGCQEjSqoaq/T6SL0sJr5TQFUnyqTJ+RG3fktdBVnY6wU
	ufRtfsAgajjjnGHWO2vCMx0pP+p10mk5gmrJNSN6WOcfaV7r6UbcWD9yFpWw4Y+Kb8Ne11OCe/x
	1sMMoXxOl/0RKNAgYaR/TGzLQ8wcyNcb+Yh8grAURrH+ykDCT8xTrWzxWl6U9HX4A/fUV8mVRR/
	7QmZd0EIdGdCF/nAiWBVbI+hWmKVJCLw4hrtKtZJyhNCP9s0ZDVMr6lx9SN2TeaTPqVCy+H8qdI
	xNNTWUFc0t/Z9bqHtmBvoNCdpltW68IgliN8SGAoKoB+04DxRkve4ilq+5Q3Ry6qVq9xUKUNx/Z
	ZgKTJA4dXUONz+84Ncy4cuBeHQizEiRYNEzv8
X-Received: by 2002:a05:6102:4a8d:b0:5df:a069:4f79 with SMTP id ada2fe7eead31-5e1de3c5fc4mr15406310137.20.1764602485631;
        Mon, 01 Dec 2025 07:21:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYdKoqR39jhIcjzpbqGOtrD0SRtzK6WkaetfXTHTg0Y97zTm/tj8qKW/Yrqqdenk3ur/hdWQ==
X-Received: by 2002:a05:6102:4a8d:b0:5df:a069:4f79 with SMTP id ada2fe7eead31-5e1de3c5fc4mr15406224137.20.1764602485031;
        Mon, 01 Dec 2025 07:21:25 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-479052ec685sm161530645e9.6.2025.12.01.07.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 07:21:23 -0800 (PST)
Message-ID: <f029c82f-444e-40c7-a50b-493ce8ae159f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:21:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: audioreach: Drop unused
 audioreach_control_load_mix() arguments
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
 <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-1-67a3d3320371@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692db276 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nQmhjgKOiIehJZoTTiUA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: pvley4SMqzutPoNVM1LycI3NbpvkD9DN
X-Proofpoint-ORIG-GUID: pvley4SMqzutPoNVM1LycI3NbpvkD9DN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyNSBTYWx0ZWRfX07GbPElxbaIr
 eat6mMf06+CNg3NLfe8b7h9ySFGgN72acPP8W2mE1h0jct3wmIu8VyNRCJA5pwKOCTaUuIELEKu
 xvTGyZJKVow/wjZ2ZBdS7Zbyl75szJ0tI8fuN8tOSETeYMc//QE2opX/xdXdvY11ATIAwEDHOYc
 p34ycI4a/1hMY8Dc6ryN0IOshpRM5WSi5FNfXo0OYExcTCGT7oM2hOfEi+CZ3y0Ae7sGFdtcL9U
 oVKs/Rt+mIZYkIcAMPl+2BpShrk0nfMUW+WR/DI2GnrMsl2UOVn2yUqeVhKuUhaxZ8ZoMS31WnG
 YB5xgQguE8opoR5zh5OHyCZwa3PkSdEUHsOAx8vSVO7JdNDk6X2VECuCk5vVZXEsiEc1uGwC73T
 YwxZsRt+LbLH5X7VfUSEDjBJEcl9sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010125



On 11/29/25 2:02 PM, Krzysztof Kozlowski wrote:
> Simplify the audioreach_control_load_mix() function by removing its
> unused arguments.

TBH, this is an unnecessary cleanup.

There are 1000+ of such instances in all over the kernel, if we audit this.

Functions will have more arguments than that gets used in the
implementations for various reasons, consistency, future use etc..

I dont see any point in this type of cleanups.


--srini>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/topology.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 5ce6edf3305e..5d138a956ca8 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1203,9 +1203,7 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>  	return 1;
>  }
>  
> -static int audioreach_control_load_mix(struct snd_soc_component *scomp,
> -				       struct snd_ar_control *scontrol,
> -				       struct snd_kcontrol_new *kc,
> +static int audioreach_control_load_mix(struct snd_ar_control *scontrol,
>  				       struct snd_soc_tplg_ctl_hdr *hdr)
>  {
>  	struct snd_soc_tplg_vendor_value_elem *c_elem;
> @@ -1256,7 +1254,7 @@ static int audioreach_control_load(struct snd_soc_component *scomp, int index,
>  	case SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX:
>  		sm = (struct soc_mixer_control *)kc->private_value;
>  		dobj = &sm->dobj;
> -		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
> +		ret = audioreach_control_load_mix(scontrol, hdr);
>  		break;
>  	case SND_SOC_AR_TPLG_VOL_CTL:
>  		sm = (struct soc_mixer_control *)kc->private_value;
> 


