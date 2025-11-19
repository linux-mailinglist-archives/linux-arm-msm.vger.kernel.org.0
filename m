Return-Path: <linux-arm-msm+bounces-82525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C42C6FAD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0DEA12B65B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526F12DE717;
	Wed, 19 Nov 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNQIF5Fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a93y1gu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AD332FA16
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566441; cv=none; b=bM/T74SCBfS7vyGob7eF8KEBCysP+M2sP5/gAN3SSHxRQIgDRkgKKZjyONsxkgI8igRSNLNGbXlBiIq2a4ltEaUgMbaorh3GIsWmqQOq6+ufGIWEYpQ+3iu9T2pTYwd0ExH9OftX63OExFMxPvWT5poDDYpXo+g9T467X/V89bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566441; c=relaxed/simple;
	bh=8oNbwF30he37e0PwSKE77QDcZ9k4WzxsjpKSEjSVRvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBP4Bb58efzlw5nGKbr12umOkZQho61s7iOZkT1ULhyUOn4S0f/q7vJqeDrIA7T7BzWkPenn6pWbaVc4hfd5Nvvw63GE84DbOAVyFWJGeW/e98rytRvD9K/Yj7UPkG2MlzgToUy33tUiOQBXXaUVdwU0baxT7Z63Otf1lMdZ7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNQIF5Fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a93y1gu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJEeqE92132464
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gdgpdwkLMzlYnvf4pUb2Tjvh3NnL35+OC69pxRCd4U=; b=DNQIF5Fhrlmalr7W
	J1CFq/Kql6Bp3PSSQqTKejw6zmIahWJg1tMbSMix16Ywyj98iHBGcV+5SQSxGPo8
	FQkDjQyGcC464uFZ5QE8/0I3xNfIFpzEDTF4JVbz3NlahZCsgPN93J9PJcX5wQZe
	XQUELk5rxBtZf0tr150ipM73A6Th3FstExv52PzMbZ48ZFU8JFp6BX12Sph5bxfa
	j4aMTf3XGdr0O68Yhfmvxxwul7nsMT8+yAnp4wn2gs35v575TYcn12SronWVcLwd
	sVSOgJiJ3Vn5wJARnMYNsiTpE74rtlx/ACbllo2ptTO8tbwFyY75od9/psXV/SzS
	dhplUg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahfv3057f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b26bc4984bso1263491585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566437; x=1764171237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gdgpdwkLMzlYnvf4pUb2Tjvh3NnL35+OC69pxRCd4U=;
        b=a93y1gu5pNj4pqFg4lkBkBc8NciGVdJdkgenCIh9M/gw53740PkcgoLHnELWeblXpo
         q90uUBh21kdrCql/lfd61oaoILdTJq0TCS7lOZd71XK6OfLI8jtyYcYrDyqE1y4J/GO7
         aNSBXxlVL2NGDTclTaxmZYdqSAuIY5Jq9KOJM9y9FVE2t7zsz/I4atxIVjC6R6Z43chh
         6pxfg1buWlqwEHwUgh7bw8eFIFkj2KU8rDI8zL1Cvxz3mI7YSnRoWHwjtV5wqp/frieT
         bmlRApMHj57Lq21LALodgrsKE5ioiLcDjYKyK3z3bOvx6j5dFCXoOrsZ9bWzmzCfqU3O
         dzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566437; x=1764171237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gdgpdwkLMzlYnvf4pUb2Tjvh3NnL35+OC69pxRCd4U=;
        b=kLdsoXVQQUJZkZEZ30V9imkW1EED9zsQVobwG/F7nKVRT5u/iTdnuhv757ud/sPsXV
         7NI4Ue7zgQvoM9bJzwJ7y/Tm0zbzUZ1FjeRGxJ2GuW/+H+k1Pa98t04FnAsPVe/NIQpm
         8HhvDkuk4Is8oHMQ1ilFJ+1CnbQtYOULPuUnpdmDosoCH25wE7cibdNQ5k/Ulssf90/x
         1F4VtLkCVymUpGaV8tmKvi7G0Z5nmfcUxlglXZErXzXYqayoXMJ7XQp0mhiS3YqbIIGM
         IHd3l63y7V/M35hMMU7jtJ9Mv+BmY2xDXoiHegAz3lPkqqEJpGaHnFGZlkDbb7VqPgJP
         URNA==
X-Forwarded-Encrypted: i=1; AJvYcCXAoeFBQztkTf7zj/ec+fIL2sWmgUuqg0thWhcm+SIW6VF0pJ9TGScTW2ZL5GDYBspliKr/qLhs0+SLIpPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzq/2dUR+rVCj7TqBOtP1CSQmKR1/6hhhSzkrPF0TdutQScgIH
	sO+d6I7n7epF+fJmQitdHJiFDQsA6EKjualO6Rvm3zECNH9dCL01NPMijeU+igNvQ/tRA/93UwT
	tLkus0qLf9yMAecIxLsz1eVIww8mKUm+B6VIPY0BpOXula+iNvI0C7/vOs1OTeOURtL2c
X-Gm-Gg: ASbGnculBGzKjWgJuLgyp7DBO+IyZMAm7QgImECBOwBhlYccXhwTT0aeyZlcCxMPrSy
	96flvA4gJdHOkQzC+XxmfXea3cNBiaEzcebGiSsmT5nGdCytzMyDLALJSdpcd7LFmWlR2V9bZ0v
	cJmuAJFiOEeTDQjw2qRhgJvJAo5DdAOzeWpxhupoAd4GYctCSRPKSj6W7BY62k01XbiGBe3XI8J
	RbA05FW74JueyQm1BycVNANIQ5ZIiuY44HUHjSOFwS3aOosvxuOQPqrhB/nDckxvgm1nSr8M85+
	l8YXi1PGacz/tC2ubXGxnwm7a5wGxNW+V0Sok/FCoKTbqvv2kRTH42WqXUAohb0x3A+ayPA7g30
	5eEUV8QuR9KkzBIk+d0qA4khe95deIXrn+P5k
X-Received: by 2002:ac8:5a0b:0:b0:4ee:13aa:c172 with SMTP id d75a77b69052e-4ee13aac404mr192062731cf.39.1763566436777;
        Wed, 19 Nov 2025 07:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENAqOLcSmsmlWodvK/kY4pSynK4HRZBPHANIPoq2rPoyLtqZmS8O123YVtHpCEzDplQ+StDQ==
X-Received: by 2002:ac8:5a0b:0:b0:4ee:13aa:c172 with SMTP id d75a77b69052e-4ee13aac404mr192062141cf.39.1763566436316;
        Wed, 19 Nov 2025 07:33:56 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477b106b03bsm55686785e9.9.2025.11.19.07.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:33:55 -0800 (PST)
Message-ID: <8753b824-cb16-4440-b53a-f058eb8f02d6@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:33:54 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ASoC: codecs: lpass-wsa-macro: add RX4 and RX5
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-7-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-7-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNmSCBGx c=1 sm=1 tr=0 ts=691de365 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=8UMWZRvFfm-wu3Xax5gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: Xk4hbzjoXbgCSDj2MDvHIvWzAW66wHxd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfXwR86uXhTmy8B
 AsrKJxNuewne0UKMqiavcwXsizDmcda++sDAgQmB3f44tXlUhqkfVdG0IJHA8p2Xyrd2EtwTxRf
 dvd8LKV9zPUpUMuxpi6JMWRYHnB381boDvktf/UP3M7NQfTgmDfPEl0yzxtIk2tunfpKIbNTS2W
 GRsEK5FvbTRcLsU3qhpYatAKLBqTRR2boHnDAQlk+ZIJkqDf6BrhvoIF8UzIey7BYriMMZAN8Cc
 SLnswoGmdsz5DxrYgfpW2CaQpjK8GHlcavX+Dm1RIm9BB9piDD2ZkxWqGa4jCUr5tEaFLWWN7zM
 mt63l1Gf9cwBA9EqRXKkPaksK1Z9c2UzIS0ZrdUnDWzozlXKlE26ppy9ztpseH56qEOLnHqFA0x
 PZXQWi1bEIAunpi0unsS5URORXRecg==
X-Proofpoint-GUID: Xk4hbzjoXbgCSDj2MDvHIvWzAW66wHxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on both
> WSA and WSA2.

Which SoC have you verified this on?

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

>  sound/soc/codecs/lpass-wsa-macro.c | 48 ++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index e2e78ff6dd54e..f02153108c275 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -300,6 +300,8 @@ enum {
>  	WSA_MACRO_RX_MIX,
>  	WSA_MACRO_RX_MIX0 = WSA_MACRO_RX_MIX,
>  	WSA_MACRO_RX_MIX1,

While you are at it, can you add RX2 and RX3, its same for both
rx_primary  and rx_mix

> +	WSA_MACRO_RX4,
> +	WSA_MACRO_RX5,
>  	WSA_MACRO_RX_MAX,
>  };
>  
> @@ -2228,6 +2230,10 @@ static const struct snd_kcontrol_new rx_mux[WSA_MACRO_RX_MAX] = {
>  			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>  	SOC_DAPM_ENUM_EXT("WSA RX_MIX1 Mux", rx_mux_enum,
>  			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
> +	SOC_DAPM_ENUM_EXT("WSA RX4 Mux", rx_mux_enum,
> +			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
> +	SOC_DAPM_ENUM_EXT("WSA RX5 Mux", rx_mux_enum,
> +			  wsa_macro_rx_mux_get, wsa_macro_rx_mux_put),
>  };
>  
>  static int wsa_macro_vi_feed_mixer_get(struct snd_kcontrol *kcontrol,
> @@ -2410,6 +2416,10 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
> +	SND_SOC_DAPM_MIXER("WSA RX4", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_MIXER("WSA RX5", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_MUX("WSA RX4 MUX", SND_SOC_NOPM, WSA_MACRO_RX4, 0, &rx_mux[WSA_MACRO_RX4]),
> +	SND_SOC_DAPM_MUX("WSA RX5 MUX", SND_SOC_NOPM, WSA_MACRO_RX5, 0, &rx_mux[WSA_MACRO_RX5]),
>  };
>  
>  static const struct snd_soc_dapm_route wsa_audio_map[] = {
> @@ -2529,6 +2539,31 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
>  	{"WSA_SPK2 OUT", NULL, "WSA_MCLK"},
>  };
>  
> +static const struct snd_soc_dapm_route wsa_audio_map_v2_5[] = {
> +	{"WSA RX4 MUX", "AIF1_PB", "WSA AIF1 PB"},
> +	{"WSA RX5 MUX", "AIF1_PB", "WSA AIF1 PB"},
> +	{"WSA RX4 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
> +	{"WSA RX5 MUX", "AIF_MIX1_PB", "WSA AIF_MIX1 PB"},
> +	{"WSA RX4", NULL, "WSA RX4 MUX"},
> +	{"WSA RX5", NULL, "WSA RX5 MUX"},
> +	{"WSA_RX0 INP0", "RX4", "WSA RX4"},
> +	{"WSA_RX0 INP0", "RX5", "WSA RX5"},
> +	{"WSA_RX0 INP1", "RX4", "WSA RX4"},
> +	{"WSA_RX0 INP1", "RX5", "WSA RX5"},
> +	{"WSA_RX0 INP2", "RX4", "WSA RX4"},
> +	{"WSA_RX0 INP2", "RX5", "WSA RX5"},
> +	{"WSA_RX0 MIX INP", "RX4", "WSA RX4"},
> +	{"WSA_RX0 MIX INP", "RX5", "WSA RX5"},
> +	{"WSA_RX1 INP0", "RX4", "WSA RX4"},
> +	{"WSA_RX1 INP0", "RX5", "WSA RX5"},
> +	{"WSA_RX1 INP1", "RX4", "WSA RX4"},
> +	{"WSA_RX1 INP1", "RX5", "WSA RX5"},
> +	{"WSA_RX1 INP2", "RX4", "WSA RX4"},
> +	{"WSA_RX1 INP2", "RX5", "WSA RX5"},
> +	{"WSA_RX1 MIX INP", "RX4", "WSA RX4"},
> +	{"WSA_RX1 MIX INP", "RX5", "WSA RX5"},
> +};
> +
>  static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
>  {
>  	struct regmap *regmap = wsa->regmap;
> @@ -2562,7 +2597,9 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>  	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(comp);
>  	const struct snd_soc_dapm_widget *widgets;
> -	unsigned int num_widgets;
> +	const struct snd_soc_dapm_route *routes;
> +	unsigned int num_widgets, num_routes;
> +	int ret;
>  
>  	snd_soc_component_init_regmap(comp, wsa->regmap);
>  
> @@ -2587,6 +2624,7 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>  	case LPASS_CODEC_VERSION_2_1:
>  		widgets = wsa_macro_dapm_widgets_v2_1;
>  		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_1);
> +		num_routes = 0;
>  		break;
>  	case LPASS_CODEC_VERSION_2_5:
>  	case LPASS_CODEC_VERSION_2_6:
> @@ -2595,12 +2633,18 @@ static int wsa_macro_component_probe(struct snd_soc_component *comp)
>  	case LPASS_CODEC_VERSION_2_9:
>  		widgets = wsa_macro_dapm_widgets_v2_5;
>  		num_widgets = ARRAY_SIZE(wsa_macro_dapm_widgets_v2_5);
> +		routes = wsa_audio_map_v2_5;
> +		num_routes = ARRAY_SIZE(wsa_audio_map_v2_5);
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
>  
> -	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
> +	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
> +	if (ret)
> +		return ret;
> +
> +	return snd_soc_dapm_add_routes(dapm, routes, num_routes);
>  }
>  
>  static int swclk_gate_enable(struct clk_hw *hw)


