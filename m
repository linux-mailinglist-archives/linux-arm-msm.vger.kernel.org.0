Return-Path: <linux-arm-msm+bounces-82523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A9C6FB3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1C5C4345788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70DF2DBF48;
	Wed, 19 Nov 2025 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqi+2k1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czTHOMw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428023B60A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566408; cv=none; b=hZYczdMxwQHEfrIRnYCJADhxsnycfgcaF7lnrZZ9vacLcYP4U6n08X7FTDXyVFbIWBhxcHqr/YwlE5J9i4qPL7xVQemwYzUqJ820S6VHYMkP1+deGEdgWwQghUEC/ahzAJI3hsrbGBXYeCFu/xIkOWjNm4hPqKrb64nKOVrNJWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566408; c=relaxed/simple;
	bh=HVCpb7t+8Ggs4/CoGtkitfQisUKJoPGP3muPRCq36Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3LT2kYm2S40ZWL26x0b1lnR94WUsDGDCLdfhfj9vaAwU7g1+RZvOgDS54g1qO73j3aomDu8XGgTzBwzgHBCEx1ZJbgKoIyhs/rHNRcZJXFJZ0JOWnig3I82BKwzGfS0hbnywlo9OVSI60U5Db8NMRrpABMqrSxHCkQcf5vD+No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqi+2k1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czTHOMw1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJA3AZt1791830
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VzyVUhPEdsLdxKhtcToRdnQC/l55Ta8UTZHI9VxBzY=; b=fqi+2k1i8X4lXTOE
	ri9VD0m+jrmtDNBXyru1v5MlkD8yQsV306pLdHpvcGAANlphx9t3HEy6asDRQQMm
	h50f0u/4Rp29I9ouioQvnwZhceDvutYmHRSImAkWSWUBpYcZwu6BqZPp3MxwXUZs
	MqV/lXbQRMKTB6snkkjyQKA+YN5v6wzgalL3C3URSxNvvWhSj+Gw+ytR7m9drOx4
	hiMFg09m/Yjat/j3HXreXMmK2LYwoOsGjo8Ow95S3P5cYqN/lCftECJFTW5uozbp
	Fs2ZpPXH0VzayOfQCyoMOXWhub3oLkxkWXBDWsQ9h3/hp87qxwZix9KGUo0BMkBN
	omSj/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6rvhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:33:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b286006ffaso2151306785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566404; x=1764171204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+VzyVUhPEdsLdxKhtcToRdnQC/l55Ta8UTZHI9VxBzY=;
        b=czTHOMw1BNjyWeHT59iPmQ1izu0mNDFzhBrd04g3xr4tZ6x1TWnxSe5DH7m2o01CuL
         ZEYXdJZ6wv/kKyHWa2+CTjGjVhZXWK7Dxcw/F/P/QfTi8ISWdwOc8K3j/rArirSDnr1f
         lPEmd2uCgaFGokSTvxsCITCiX0TSm92WNZmT2YmH+T/LRefo/8+jpVpvGsTagnXOuazE
         PBClyLr6mDb3QYHvcY9zuI5zB8Bg66GPaHewOtKcMMI2Jwnfzctn76jFB9gv1BhegF5/
         Z7HBUlqgDow1VQ4tQHvRrjDhEXzNXHU2Jo7c1BaKL2d+Jhtl4aC+n2/LVdrqnXjQsCrl
         CrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566404; x=1764171204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VzyVUhPEdsLdxKhtcToRdnQC/l55Ta8UTZHI9VxBzY=;
        b=LokgJqPcBFLZFN9w7t1jRfgAS2Uif3VWaNRNiZLYoyRZAXTOVPgW9vCD2mkkgvTkkc
         YamWtIpCqcfZHueJbbzebsv49CMVDiDwk885TK/2vHVeWnNLKEBzfMIbjm+YfMQsejWB
         Ms8UJvzxGVhg5xOatUYvU6fJuZskvdSf3G+lxTyA/anikYGAZRpNr6132RlOoJnCFTfR
         1g2WHrHGdmmxNu1sZlU9OxEMpydvnMRGPJpeK85fSY5+ptuhPaUsgsyhnwb6/M/COnuC
         gczxJRXMAyZIyUVHAjB2p//H409aXdouE0N5beNPmtk/Se6H7gVdDzZT940vNJcHyIEa
         FPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiu6T3vPN0kzzAW3i/jd4GrRqUPS1576mx907DjOr64vrs1nFADrDYM7wrg0z+Oce4yhhlT/XKh9TD2qaK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28lE4eM2rb43mMFvKYeODvz3GOLjMGAgxphrupX9yxykXTxKl
	JVcYl4Be8pCXyo2FqSuiQ7FEfJNXtN2XwhVwdsn57vyy9JxJO/L/OTjWKaCPyTLPzEqvACTwaD3
	U6/jfr7EuIyZ5rgDiSggDL6iLuN/1A/oPVGrC3r8i65AmVZ9M5t53oHLwc5uUuwUY6JAR
X-Gm-Gg: ASbGncu4uSWINDCAa4VruI8AsFsnCPl4voPmnAJw8E8Z4CSD1PC9MGG/GaZ+odVX3dD
	HssaE/JtUhv9bOEz7fAYAZxNKQpwXMab6XT9oLrfQ5/YpORYO89c8aNSIdCD7wIYOQysrB/nABg
	nkroeXNsTCeFTA7FQ5wgvzAMWJaelEo8olGFl5gCZdCqErDbuGPwTZzU57e/qNdR35pSWJwJuyT
	yubxHXTTwSFqrN+lbn2C1RmF/P7mlkfW0y0veyaB7aPzYmjOqZU+V2JFzQvlAu0i6MGY6RskjVg
	jDSHBVviC1V09TGqNUFAQVqW5d21J9REhaMmTQv+Ef6hMNik7BIJMlZyc1I8d5beRFTzPosg6IO
	hx38dnhRvgg+2IY+QDAz9pm3x63lKjIjkzgpF
X-Received: by 2002:a05:620a:1987:b0:8aa:1761:6e18 with SMTP id af79cd13be357-8b316f00f0dmr383251285a.4.1763566404039;
        Wed, 19 Nov 2025 07:33:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfQyPtV55eciFoUp2LW60HBVSGoA5nXz8U96ez87//iG9ZHJP2jdPJEBWFyk/zwqTV9xQqVg==
X-Received: by 2002:a05:620a:1987:b0:8aa:1761:6e18 with SMTP id af79cd13be357-8b316f00f0dmr383244885a.4.1763566403437;
        Wed, 19 Nov 2025 07:33:23 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f21948sm38451886f8f.43.2025.11.19.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:33:23 -0800 (PST)
Message-ID: <2075e642-9976-49a8-a148-3a6fa113e66c@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:33:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ASoC: codecs: lpass-rx-macro: fix mute_stream
 affecting all paths
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-9-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-9-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pAmbOI9OtNzsnYay9Qg0RGl099NuAbQc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfXxGAcsIP34tNO
 HcHGxMMdcHy93CahTGX43KE9VaeM3iMNRfyhS3gjuczs8xY1vC8Az5kpsl9Za41lCDgN00pw2TK
 FMI6HUWS7ZfnyLxeT25ma/efZyidrdMw8GUkIYbz7faPuGk0u0VLlM6/qHCh/glB5XPszWtQbVC
 btw/I8N9eO4FwTPvtmqi2YV44wLqgMSMhEqsbTx4sB9rnb0WcZE+Xkdx7NANUKwHijPHVzZZt6k
 boWKORMkp3BVlLCC8RuB07E5FNL/XTU2Lhw+tZKw0FoNmSMt66G3DMtwTM40hZhHJ94fT1Bi3v8
 JZqGwO6yOTMLeB4hrrbZVn1Io3BqxuW61q0cgvED4gcpgR23XdDOC/2Jk4/+lZSt5ECWRikGIBi
 bbmP+/rE/dqO44+6xFRrRmCBPf7fig==
X-Proofpoint-ORIG-GUID: pAmbOI9OtNzsnYay9Qg0RGl099NuAbQc
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691de344 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=pJVM_O_sAQI5ChO0z1UA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> The current mute_steam() implementation affects all paths instead of
> only those in use by the DAI.
> 
> For example, playing to 2 DAIs simultaneously with mixing, stopping
> one will mute the other.
> 
> Rework to use the same logic as hw_params() to mute only the relevant paths.
> (also, use "rx->main_clk_users[j] > 0" instead of dsm_reg, which is
> equivalent. I also don't think the clock enable should be in this function,
> but that's a change for another patch)

I agree, we can move the clk to a widget.

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
patch looks sane to me,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-rx-macro.c | 74 +++++++++++++++----------------
>  1 file changed, 35 insertions(+), 39 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index a8fc842cc94ef..d7e51f02a9115 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -1905,52 +1905,48 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
>  {
>  	struct snd_soc_component *component = dai->component;
>  	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
> -	uint16_t j, reg, mix_reg, dsm_reg;
> -	u16 int_mux_cfg0, int_mux_cfg1;
> +	u32 port, j, reg, mix_reg, int_mux_cfg0, int_mux_cfg1;
> +	u32 mask, val;
>  	u8 int_mux_cfg0_val, int_mux_cfg1_val;
>  
> -	switch (dai->id) {
> -	case RX_MACRO_AIF1_PB:
> -	case RX_MACRO_AIF2_PB:
> -	case RX_MACRO_AIF3_PB:
> -	case RX_MACRO_AIF4_PB:
> -		for (j = 0; j < INTERP_MAX; j++) {
> -			reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
> -			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
> -			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, j);
> -
> -			if (mute) {
> -				snd_soc_component_update_bits(component, reg,
> -							      CDC_RX_PATH_PGA_MUTE_MASK,
> -							      CDC_RX_PATH_PGA_MUTE_ENABLE);
> -				snd_soc_component_update_bits(component, mix_reg,
> -							      CDC_RX_PATH_PGA_MUTE_MASK,
> -							      CDC_RX_PATH_PGA_MUTE_ENABLE);
> -			} else {
> -				snd_soc_component_update_bits(component, reg,
> -							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
> -				snd_soc_component_update_bits(component, mix_reg,
> -							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
> +	if (stream != SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
> +	for (j = 0; j < INTERP_MAX; j++) {
> +		reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
> +		mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
> +
> +		mask = CDC_RX_PATH_PGA_MUTE_MASK;
> +		val = 0;
> +		if (mute)
> +			val |= CDC_RX_PATH_PGA_MUTE_ENABLE;
> +		if (rx->main_clk_users[j] > 0) {
> +			mask |= CDC_RX_PATH_CLK_EN_MASK;
> +			val |= CDC_RX_PATH_CLK_ENABLE;
> +		}
> +
> +		int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
> +		int_mux_cfg1 = int_mux_cfg0 + 4;
> +		int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
> +		int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
> +
> +		for_each_set_bit(port, &rx->active_ch_mask[dai->id], RX_MACRO_PORTS_MAX) {
> +			if (((int_mux_cfg0_val & 0x0f) == port + INTn_1_INP_SEL_RX0) ||
> +			    ((int_mux_cfg0_val >> 4) == port + INTn_1_INP_SEL_RX0) ||
> +			    ((int_mux_cfg1_val >> 4) == port + INTn_1_INP_SEL_RX0)) {
> +				snd_soc_component_update_bits(component, reg, mask, val);
>  			}
>  
> -			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
> -			int_mux_cfg1 = int_mux_cfg0 + 4;
> -			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
> -			int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
> -
> -			if (snd_soc_component_read(component, dsm_reg) & 0x01) {
> -				if (int_mux_cfg0_val || (int_mux_cfg1_val & 0xF0))
> -					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
> -				if (int_mux_cfg1_val & 0x0F) {
> -					snd_soc_component_update_bits(component, reg, 0x20, 0x20);
> -					snd_soc_component_update_bits(component, mix_reg, 0x20,
> -								      0x20);
> +			if ((int_mux_cfg1_val & 0x0f) == port + INTn_2_INP_SEL_RX0) {
> +				snd_soc_component_update_bits(component, mix_reg, mask, val);
> +				/* main clock needs to be enabled for mix to be useful: */
> +				if (rx->main_clk_users[j] > 0) {
> +					snd_soc_component_update_bits(component, reg,
> +								      CDC_RX_PATH_CLK_EN_MASK,
> +								      CDC_RX_PATH_CLK_ENABLE);
>  				}
>  			}
>  		}
> -		break;
> -	default:
> -		break;
>  	}
>  	return 0;
>  }


