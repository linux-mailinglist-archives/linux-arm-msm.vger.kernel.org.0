Return-Path: <linux-arm-msm+bounces-82531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0BC6FBA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B25A4E40C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F703538BF;
	Wed, 19 Nov 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FloBbVr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmDP4c3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D402EA737
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566577; cv=none; b=FlOLpZbbCVsYrl81GVKN0YS2JEmSlo8wZ8WNsSnRDEgVDoqFicEhOBZiGKW5Zrb3aCbmT7pTDwMAzg8XKmrWEtftP/2z0q1HhIXpaEdpPCqU8lPwPAqvy8tg87AA7s78EL9whAz4IrdaghKn70qOqg1BqjEOGCOEKl/Ktp59Qk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566577; c=relaxed/simple;
	bh=H6DO/DNOAK8r7LOb8c2flayKt4mHB//bqUtHLakHRSg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=beGE7zEOmLegWWBm6TNaEUMVOePcTOGO5obsl7ze4K+Fy2y+Z1F1rGFnrUj+fYeVbuJbDDLMHNWQBL/REjeq1yPW1rgN2qnuJzRgpHlhE6w9s5SARW4BDyz3LoPYH7uzCB6owqhI6vt93NHv/xhR+uLf97vX1UOFmHQ+qFh3JO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FloBbVr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmDP4c3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJDVMPT2078945
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=; b=FloBbVr09lGcclax
	TaXWbkC0tmWY1jFmqrUE+jxv5vFd5FrF7HKgNQGcFOCSKdkMLOKZGE1MNvgPwiYZ
	rA0jG4HWeDvjJ6yf3FtJU2NGtiByCyz/SQX1Zp8SEJBuzSz3mw/6PL8DkIdwgdNx
	uN70wQBj1Xz8IfUxa1DuPuixJIXZed1G5LpqeV9BoG6RK56jBz+y/kxYXBRV931/
	z2h8I/Y/Wdd3lg3mpkMb95WI0mB1Fa35ats9mPgmB2j5TvukXTGhYbPgbxOTcf1Y
	6HGX4RMUgsgx4vM9GBQgwgMgndz1ElDCZMQJt+k9LsEY9jSLcmNSZP7tfvIxQfl2
	r9YNAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah6fg9ydg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22d590227so853989285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566571; x=1764171371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=;
        b=jmDP4c3Qwe+a4Qd3lE1D1diTJQ8AWCMI10puZO1fV8Bgi3SUfg4O2V5AWaWZJ6QKBx
         avFZ1z38xvOI0KDDudRgcgrrgq4AtXlbV1tZtS8rL6knjAaK8wUY1P3I76J3N8xgPVVE
         rYEHRmDGkyc/UClhVzrycAxVidVYVrz/p464UeCblroMpjlLcARh00z13nBEH/X3PfrO
         f4ee/3Qiv9dtMCEOc1iGwLaP0sxP1b017NRK8UhOmZNOIpfCTMC0gzmBEFSgZ9ubk9Nq
         ndyOANEneewqPSQLUwA5m9AnWUPSJSTBuySs3Wyvx4LUiPJ7j7ORP+mkgSsYKFoSMU5V
         OW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566571; x=1764171371;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S57lJR6lKRo3qdLi+GChr4nY3+rRqb2kkwWE6UisHY=;
        b=AnOVie49k9PtmvmcTy5FSinbHLF9rp7vHWjASIjdaTPW5FbXrRpNHZ/3vQb1V8Z5Al
         mqpK2kEr2To5wG5WGjRebpi2fFjbKcehFZxZVEFPaCPTS+1xncjro4sMs6FGpavcfsMF
         xHE/65HmZrobjwihEhSMtB1lhTp+UKdnuh9rl2nR/OqWu+Leh9tdkbMoCXOChftlBu7x
         HHRsDnjorzKbY2HlYRss+w77jFkPrevWF5SHiO0w3H0+UqhL9hWEapjfdptrL+pllp0L
         kjtQ4BSNXVEFv4HHnEGFWo+afOy9ukgmizNOOIhTbBTyqzGNAJk7R+J/QoDRrtzNwz6q
         bKiw==
X-Forwarded-Encrypted: i=1; AJvYcCVDYCXFLt+yg8LgUHg4xmIExp5CVf2SZlvipOTfOkTjw73QLXK/DVP/1iv+Cm5cRv3b/M5MLSKuYbrGojTk@vger.kernel.org
X-Gm-Message-State: AOJu0YzseMryU+2xb7LHsPAUopLvktnTduqH38AD8zVOY1k1QAD4ZvJt
	Og3M6aPn4T60cu+XSdwuEw5YhQV0fLupiK4jmNn9Q2gOrdnXzhZ9TEWaBZ50JS8bg+wCQM6x/4K
	QXfVqnL43Cnadi5J4So9Tmwv/YyKd+NCzdE8coj1zwhS0h9WKszyhvcRxSL/CrHDULBKx
X-Gm-Gg: ASbGncsd6ivIe5p6Wxn89kGOTAjg6Ce7p/B4Y8O9wfTr6pnnV1xYfunmT7oF9Rkpm1w
	J8M0eW2LQpmPMhEtgcqQfjxapxkGWMBovCS8GB/YLlwDWFm87HZQ7kjdtl0CBRGA4WfPyuxdaVO
	uCRU60V2ubgsuMuMe+/BXIh2jZbsMdJrPR5FNrjAw5Y4oMek27tl8sNGK431ZPgj/pVwFXKXrzp
	2isDsMC7JBVp2vzpDU61Tyq5viWCq7IJmj+QNJCUb/cBE9r5pnPxuh8dqIJfA8U6RDHlh2lnKk2
	WfoR4OZMjjVKv3K6fbn24mATdVk5jj5VaOF9/XIBCb6X01CouxL1duDQqJOuFb/Gfofbue3tu1G
	ZsGxbcS36G0kqAVyBPG8IfJIS1zt9g7x3kjkH
X-Received: by 2002:a05:622a:1115:b0:4e8:8372:d435 with SMTP id d75a77b69052e-4edf2045b19mr266115761cf.3.1763566570276;
        Wed, 19 Nov 2025 07:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRD6358tFM3tNK0GybZvyhnKDUxrxLeyixXpUSBQe6otQO470BIJt5Qb4sB0/rryyO8waPDQ==
X-Received: by 2002:a05:622a:1115:b0:4e8:8372:d435 with SMTP id d75a77b69052e-4edf2045b19mr266115231cf.3.1763566569476;
        Wed, 19 Nov 2025 07:36:09 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b5ce849ddsm32231884f8f.14.2025.11.19.07.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:36:09 -0800 (PST)
Message-ID: <bda65fbd-045e-4ed9-b98e-04326053a835@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:36:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain
 read/write sequence
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-2-jonathan@marek.ca>
Content-Language: en-US
In-Reply-To: <20251117051523.16462-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ocy5oNhvReMIbwfO2GLB54iJ_LT1_R4U
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=691de3eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=RmIaNmV--FFQmAx1t8oA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX/qdqdveR6w3c
 YyVKWoENKxW672i5lGQc7bUwGTqnSwPMEzu3i8T8+embipPvkKDA8q9RPoMZQyiiN3A9zU5ojcR
 dYBkJ5PayBN4WUtRT67fmXZRft1gKANu+YV7C9NZEus5Za4j+n2VhOOpnfC/mOpaoGx49UNkMKZ
 Dy8IfHteGXJQYIasnAi3v0foCeHA8IBXfG8hCkggIkpACOauYfXblf7b0t5GeKSNZjnD9gI8W0m
 zXddew+JUt8XvXbXEn2LO9uvXsWyClYYrdY3e+4PeCL6AfeUjHYI57lCrt5irk5UKLO4kUpDk8h
 DMtGpKtHjyn5MobwYi4aSv6UiOJ3MLq0vv/IVXZsWhsFRqlKVFoS9TI9Ofj7067aiozJBRS7jFy
 h63b7PFjm2AyyhZG4FBX+OZNR/QgkA==
X-Proofpoint-ORIG-GUID: Ocy5oNhvReMIbwfO2GLB54iJ_LT1_R4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> Reading and writing the same value to this register does nothing.
> 
> Looking at downstream driver it seems there was meant to be an offset added
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>



Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6e54c1beac8f9..6f16d54aee401 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1567,17 +1567,14 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  				     struct snd_kcontrol *kcontrol, int event)
>  {
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 path_reg, gain_reg;
> -	int val;
> +	u16 path_reg;
>  
>  	switch (w->shift) {
>  	case WSA_MACRO_RX_MIX0:
>  		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
>  		break;
>  	case WSA_MACRO_RX_MIX1:
>  		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
>  		break;
>  	default:
>  		return 0;
> @@ -1585,8 +1582,6 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_POST_PMU:
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		break;
>  	case SND_SOC_DAPM_POST_PMD:
>  		snd_soc_component_update_bits(component, path_reg,
> @@ -1931,7 +1926,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>  	u16 gain_reg;
>  	u16 reg;
> -	int val;
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  
>  	if (w->shift == WSA_MACRO_COMP1) {
> @@ -1971,8 +1965,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  					CDC_WSA_RX_PGA_HALF_DB_MASK,
>  					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
>  		}
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		wsa_macro_config_ear_spkr_gain(component, wsa,
>  						event, gain_reg);
>  		break;


