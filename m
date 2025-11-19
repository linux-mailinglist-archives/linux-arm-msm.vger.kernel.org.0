Return-Path: <linux-arm-msm+bounces-82529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 612CCC6FB6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A01534E07F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE982E5405;
	Wed, 19 Nov 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNnE/g2Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F493pHeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74952D9EC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566507; cv=none; b=DXDdd5SZ1uSiCBx5qrVNqj98QnM3BjfVCLj66FwAqvyQVcjV/afIYUkPNYGHpDJMIjGfzoHbCeQuIRf0fo8jAah0DP5YsEt1ymylpEmQrUt9ZzmRMAdfERBVVjRurwzOVYyJICIcj90iBY3pDtOf1ttdZnCTpuHQD6AqyqFAO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566507; c=relaxed/simple;
	bh=aWyowoKzJF3LmxjEa5m+k7Ul+P3W6nIhOolyl6OYx8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF4sqK18VMmaklcr9iNQoDdm2N3E30qRQPz0tLjEPixaOsoC5cVzDWZXe5orj+7550DA+nQ1wQ1VSyI/CYlUDWi5rfJ1xpq84JPKW0L5G24ShD0Nfpg5OSVZLRBbEgak2jiEvg5L51zpualTQLdIYe/o9TU4s0W4FyWkH+iWyqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNnE/g2Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F493pHeK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aBA2718634
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=; b=iNnE/g2QxMbUwlEa
	9ioCWGkIOXGOarAHE1hmxgUqCSNQ1mXwTyBVkQdkp3X3IqDd1QeoVDhlM1nVZKTt
	WkYzDSa6RFyl309HGcvGEJnpet/mK/MI0gBrfpkiRoCFPLEt3s+QstJ4R+BIJubW
	8OWx/NFZT5oMY74MY0LPCDMDD9LMM0EIfVb04SKAy3BRqH8dmI3+1U/LccmTRbDI
	sP1nkLeMfj6CwuHEvJj3vOpLu2NGUrIkUA5H3uhgZENCEwwglU/axDT8if1WK5hO
	y98O/Nx/VYOKm+c1YhylxqqofrzAH7R9Iln6fm1mOSB/zqtcPC2a/Dhg0s6863XU
	oV7ViA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0scqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:35:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1008658485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566504; x=1764171304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=;
        b=F493pHeKb/xNfZ/NXV2SRLPjSU2NBZ6YYB2T1cCqJB08KvViTWCcYZhqo+5zDrtXqQ
         20X9fHIK1xZSAfPlRXso4Gp8L/NrjJB98XJ09VhEwm6FXAbtanVqhiQYYNeJlBnE8wqI
         VLcysVjgz88CfcJfsVAR6hR5RenRmpNGUpnmYYeebGRHd1wnBOIDcXvVVWf+THinWjAD
         x/m5pXsmjoLx6at2VArRBKEqsscCIGoRRs7oAQfIEfQDkoLull/Ajyjv1hyxS0rrZpvi
         Xg3m9AwCW8m849R8lu50yN+P0Sy9V0go3Ina9UUwl5xbFPsFay2ledlWTBB8fT3lKttD
         MJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566504; x=1764171304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tDx7NYoUx/VPGlaHHPKM3CRY4d7jWYFUAKx3QSgPPc=;
        b=acv5I5CLT4L24GOLfJE2fgWdGfEqNKVcD7PjNVZdPh9cxETJSrwgMNSba/Cy4Qpb5y
         KzvKklSQIoSZkfVv2g4ZWhKCbJhv5ZiQrJdJ0kPXZLx6hkkAgA1+3Qi+izLo1jdLfzxY
         jhAserMxv2bAb972vyfB/fDHtJk1yf4NlwDCFbgtgtuuul5g91r7DoZUyDpN7hA3DZqN
         qAD4LaX2vdmgUbkFkrOQSM2f04ZMfydzReqLSWbepuL2kbO7JyRRM/g1blrzq9e03Wj9
         KOuZkBGD3vyGY8Zoylyb+qHDpZO2oSMmQuviK0lcKW0rwv8YYoTgkSxdwjqtDXmOP/Xs
         pcmA==
X-Forwarded-Encrypted: i=1; AJvYcCVk1bVxS1lOSq6NNgTUT4U2DbW+kqGx+DmoqM8C2aV5ER0Wzi6w66gX4RdZctCgmVzJwfvmBFouGykytPSe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4UWtn+CBD//wbMEa6oLFGJuomNyzJxL9215oNm0jzX8KjiP7Z
	1sLxbgCp6g6goOcOJt0R26zZn6o9X1KSBGhmgmpuaC37l1a5uYxYno8ODBB2dYpZDXs125zPkFx
	r+31tojtWu08mzWvklsgluUU42SlE6aRqmFXbXJgMWnRkcBqAqediMFcArMWCWALssYxn
X-Gm-Gg: ASbGncuiAXRAkr+LQ0hfWjCJA7nlk/DD3Mr+kVaFidE+Xa61cS9C69ko9IhSZlGm79G
	JZZRV1uSlO236pzZybZ6adfhBRRMRSi1/15AJVrdLqRdJNMZqv4QcZwJFZSLgOVnBLR6ujFwVOh
	zsTf7U0mBmMKvLBYb1p3HGNZTnt7bOgiOTCYOlQswZWl+f4ftvoJBJCbQ8qAyxTEeJ5+VobKf9W
	FG6jbcDzWE1Po4xbCJCoYWrwDSOciq8P8eIGvLihpIfpScXHLFx+zMHfqEnuZoPsrWv/C/YkkCc
	lSEMYXP4QxpiNphzNBV9UDm555HBe4noiqX9hiuXZ2MUv3zUmgPUVhMhx7aVtnn9HYpY1Ag7FcR
	cqJqHzHiE2nMd4JBNgCySwbFjnaeo/RzxosEn
X-Received: by 2002:a05:622a:15d2:b0:4e8:aa9d:f0d9 with SMTP id d75a77b69052e-4edf2130595mr249093751cf.38.1763566504066;
        Wed, 19 Nov 2025 07:35:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFq352RyfTxaD/m6203E2Uf8xLboRspl8BPd52ftBjqoQTWmB0XosHeuF+KICNiiS5/juTXJA==
X-Received: by 2002:a05:622a:15d2:b0:4e8:aa9d:f0d9 with SMTP id d75a77b69052e-4edf2130595mr249093091cf.38.1763566503498;
        Wed, 19 Nov 2025 07:35:03 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-595803b33basm4791604e87.36.2025.11.19.07.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:35:03 -0800 (PST)
Message-ID: <0954c4f6-a50e-477a-9354-0f7c497f6f4b@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] ASoC: codecs: lpass-wsa-macro: remove mix path event
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-3-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-3-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX5CDqUbDZ/U51
 SPr4Lr9FSRWeq7ysLqfNNxmpJZHDPB9cpU+CzqnGrrnaTzMuGQA1BH9q16arZvcPlDRLSAhTJPQ
 CXA7dZTvPTphFJMnfsX4sz6IEo82ni5ZxwMx+fOOpMlOJCjH5moj2Q7nNswrnFImdfOSvJMK3Hx
 x7KRcqdqMlc3fBchwVbLo3Pr3damC2jlJTPeOGKiJ2++INHWw0WGVozvj3qe7nfzaJ0BW+2P/jw
 yLyWy5vhwqBG53OJq6dA/Lelp6TkrwCTNW5Kb3+u7borAgrdyMtbS3+2WxhiOYOI6Wn2kXkS+rR
 aadgGccs7bxCJb5Xe5BPrsPLgCAPlBYlPjgWXS554ynDzYULxR3ShddXxn1xHe1WCDCf29s2oKO
 5/fLygnCvErvEcTQQdWQ5fcSjhoB5g==
X-Proofpoint-GUID: 8ro4qWIAnB8no-xspJBaM7HUn8Vtni40
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691de3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=Bn-LY-kQ7RkP1ue-7dgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: 8ro4qWIAnB8no-xspJBaM7HUn8Vtni40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> All it does it disable the mix path clk bit, but this is already managed by
> the WSA_RX_MIX0_CLK/WSA_RX_MIX1_CLK supplies.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 46 +++---------------------------
>  1 file changed, 4 insertions(+), 42 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6f16d54aee401..06570e474c850 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1563,36 +1563,6 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> -static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
> -				     struct snd_kcontrol *kcontrol, int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 path_reg;
> -
> -	switch (w->shift) {
> -	case WSA_MACRO_RX_MIX0:
> -		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
> -		break;
> -	case WSA_MACRO_RX_MIX1:
> -		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
> -		break;
> -	default:
> -		return 0;
> -	}
> -
> -	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> -		break;
> -	case SND_SOC_DAPM_POST_PMD:
> -		snd_soc_component_update_bits(component, path_reg,
> -					      CDC_WSA_RX_PATH_MIX_CLK_EN_MASK,
> -					      CDC_WSA_RX_PATH_MIX_CLK_DISABLE);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>  static void wsa_macro_hd2_control(struct snd_soc_component *component,
>  				  u16 reg, int event)
>  {
> @@ -2475,30 +2445,22 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_1[] = {
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_1),
> -	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
> -			   0, &rx0_mix_mux_v2_1, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_1),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_1),
> -	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
> -			   0, &rx1_mix_mux_v2_1, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_1),
>  };
>  
>  static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets_v2_5[] = {
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP0", SND_SOC_NOPM, 0, 0, &rx0_prim_inp0_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP1", SND_SOC_NOPM, 0, 0, &rx0_prim_inp1_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX0 INP2", SND_SOC_NOPM, 0, 0, &rx0_prim_inp2_mux_v2_5),
> -	SND_SOC_DAPM_MUX_E("WSA_RX0 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX0,
> -			   0, &rx0_mix_mux_v2_5, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX0 MIX INP", SND_SOC_NOPM, 0, 0, &rx0_mix_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP0", SND_SOC_NOPM, 0, 0, &rx1_prim_inp0_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP1", SND_SOC_NOPM, 0, 0, &rx1_prim_inp1_mux_v2_5),
>  	SND_SOC_DAPM_MUX("WSA_RX1 INP2", SND_SOC_NOPM, 0, 0, &rx1_prim_inp2_mux_v2_5),
> -	SND_SOC_DAPM_MUX_E("WSA_RX1 MIX INP", SND_SOC_NOPM, WSA_MACRO_RX_MIX1,
> -			   0, &rx1_mix_mux_v2_5, wsa_macro_enable_mix_path,
> -			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MUX("WSA_RX1 MIX INP", SND_SOC_NOPM, 0, 0, &rx1_mix_mux_v2_5),
>  };
>  
>  static const struct snd_soc_dapm_route wsa_audio_map[] = {


