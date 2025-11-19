Return-Path: <linux-arm-msm+bounces-82527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB023C6FAED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4983A2F346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FE432FA16;
	Wed, 19 Nov 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaJHCSsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2SoQbXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764BA286413
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566471; cv=none; b=huJsUutjrqKiRNcXtVKIsVotHjCwjRU9ascHa+a9hSJONLkzzTO4jg2XUnMrLGHvwB4YjKIVWHcdzo+vMIu20vO93ZF309l3jc20PnPuyU3Vk/26FVPalTdBN6vg95lskTLagC5SIdESwDyh8sERXjN3VUVsAcMl+echZ7zVHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566471; c=relaxed/simple;
	bh=RhAcrmn1tmKkAIxPPmF7XAwKmtT4s9HzyWGuAtJshkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAGbKlnjWlkTk+AWREwAhhmPx+573B2HG4SISkH96E23cDpQXDool5gdmBqaGN/0oaZVxSVzAFNGU8fT3Qd5hZ1CgUV8zbKUuw93iqvMSTqCALFfU6RYHugpqfh+cQy18KIQqKszLKAcRzwEk+8f2qRMt4eFjFB1ztqQpakM63w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaJHCSsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2SoQbXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJAFfeh3165250
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/aPrBEjfSdYjQxe0JQvsi2NRwCekFAkXeE0ICKQpWk=; b=gaJHCSsxmiTm/u52
	LwYQdR/bF0tQ28cY8EhlzEWqOyBBqCIrvQKq+/o1zO8Vq5tL8RJ8z3TMR6HvL+zz
	SImeJfbvomzP0iGrquUDZWyc4oZzHqFTMVRzYIH2gCueNNl5yKOHUGwagUco7gVU
	is7r7IFxi66khlgw2vt7639iT2wdnXHLOsjXnuGk+JnjaTcgIWJ1hqQ9/O1W3E4K
	nWuJy/pQ1uEcyQPjSvkL6OwVeVu78YeMnu+2MaeTA5tJp7WALudOEQzx4tkjWAAT
	NJzITZJI2qeF1zQ4qPOIf24sMyogNnF/aLBff1HF76BudWhgoj4mABgdNbCiPA10
	43VU9Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agvqgup1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:34:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so324576581cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566469; x=1764171269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/aPrBEjfSdYjQxe0JQvsi2NRwCekFAkXeE0ICKQpWk=;
        b=G2SoQbXTZ3NvVzPqA7UDhsQseyQy5YoLfdn6clBc+hcmkuDnikwr6gpZcDE73o6xVq
         i39nsNAJzQZu2Th2RXH/6isyMaHAQ05p4aJBa6u0SP4khsYm0G0f2CHNF3y/ekbCw4Op
         HIm/dbv22Qa4hzetz5lWmWBbNEYEAO6HZ/XUEaTFxytzHiBrRm+JrCg9PW3Ah7vqRKLs
         v3ewIQtvqMMEpEKK4D7HEtf3xRk7sAua9CT9AQFNPr8rf975ZX3xcSluKzaKMr70+GXS
         Txr2c/fmFJgnHZk7reTc3EgCTXCVzaRoK9ZpBnG0YeihC9aexwzoDDlpP/QMKRVkCQN7
         iLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566469; x=1764171269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/aPrBEjfSdYjQxe0JQvsi2NRwCekFAkXeE0ICKQpWk=;
        b=l0fSu6492msl9+xUTZ4RrOUdFj+unycNr2/Dszk6ME9eYlWoqDhVzC9ak5GvzWdL2e
         Ywo74hwAu8ONEINoqTwhOyJpIQRMG/UiP9QhWS1w9JRB4ow35fy8/7DndqktMI4WjaVC
         H9zVe9MUeundICMiLTFGkr61DUAXp1zgtWvIL+BdnJuuPFGmFYZvlZJUxtnbZczQOnvU
         y7XDKgUSESRkqwqjyFyaCIfv1qgPsW9jR8HAl9341k9Zl2FluHcrv+iAUPuo1NwV3sIW
         HifJRNQiAZGlFrrWNZSENqBSjmxNkN/icZJuBF7AJNZaC6RNKez/lbaeDDbUA6ocXu7G
         0sQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxGmHeaWTkC05Ouu5IIVks5i9NY+qqQL4M4D4t/3SmbdOatuH9dr2EduQcRDDJxFXW/ashisZoE4fixeSS@vger.kernel.org
X-Gm-Message-State: AOJu0YyTpNbRRnnceesZMq+8DhGW/xTjomc0iiB4dkDkHyHkPpHHyiPg
	+VgUeINJHp0aEAa2s84R3ofe7rZUpGynEpSkXvLVdBwJQt9pBPMyz+MBQ3jSeWE6CaYyrZs2Xka
	fjvM2o6AAcsrm/N4+QMS/S1d2VX4jTMeuO3EtKU8U9XCGXDjbQ8v7RN69zHxnp8xFlik/
X-Gm-Gg: ASbGncsucNbhjdVIt+1aUXcRJimS3++4w1ZNCvimHPhUyUe/4UgRGLKvVrKCNfBGBDY
	xIFoUj8zN2ICge77gDLcy+EpNhMK2F/jjXbp8TmGRYzgMd8k8mzgy1SvFasV6o3w6ucnjryQZHb
	jRD+/zMYH/xLkSd4yZhDZ29rKEK9LeSTVJpGwaS/YG4L5egAWGH1yrQl269G/YSL1smAM74YMnE
	KQCNUOf61KINzJqWSvw8uBIz9L4PjD9GGY/e51KNKHzopw7ubgAxeThVu/lqeCr6Lniv3r7d9ec
	o08h+hkAo2Nv5TwyNV1utu8lIku7TJDGNOs6Qn55nXyKKLqaARx1JeIRInlrmkVlApfN1e9mNSG
	6WWdMTWmWHBGutvbZzGAAV1F5IsflPKjD7rM7
X-Received: by 2002:ac8:5dc7:0:b0:4ed:717c:966 with SMTP id d75a77b69052e-4edf21130f0mr240444101cf.62.1763566468736;
        Wed, 19 Nov 2025 07:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC2wqmcwzxLXJ7w2hvm89zQu065T7cY1QTr/e/8TU9oCLUE8BxB+Rmll8TWk8CR3A0EBSxlw==
X-Received: by 2002:ac8:5dc7:0:b0:4ed:717c:966 with SMTP id d75a77b69052e-4edf21130f0mr240443361cf.62.1763566467893;
        Wed, 19 Nov 2025 07:34:27 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477a9dfd643sm41623625e9.14.2025.11.19.07.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:34:27 -0800 (PST)
Message-ID: <5a3001a9-d28a-4df2-b486-832e25b82236@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:34:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ASoC: codecs: lpass-wsa-macro: remove main path event
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-6-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-6-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K1OMLhULCeIO7w3KQF_Bnj_wjMr24QA5
X-Proofpoint-GUID: K1OMLhULCeIO7w3KQF_Bnj_wjMr24QA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX2lhrbMU6x07x
 M+1IciB47jOPTSOIH2PwBAs3P6/58NLUgqdmONtwZBYIuVJhccrO95VCDggZn0AWmU+ApuGwNjT
 0LzWeW3OTMc0RPgWtwqH1Y+/k1GApzFoIfCubf0zv1zYsaSRk2xgyoZPX6sIn3qAvq97zgr2jwA
 oeBCNFCoW3Kqq13PzmIQY8MFvfNrORyuyN5GVK9Jq2V/gJD0cl2QEr1o/x4n6NYE7mZ+OIOa+TT
 Bw6Efa9C5Mguq8TrT6AAxj1+MdfbEsFCGdq1abKuHA9c5q/122zyq/z8lUqcZcVSBTa5CXyttNT
 Z1hZxt3+D4/Hyt6Kpu4oyN0ex2i9DtXBN7gCeFt8Q==
X-Authority-Analysis: v=2.4 cv=LMJrgZW9 c=1 sm=1 tr=0 ts=691de385 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=shMeLcMbd2GRUaFjQBgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> The event enables the main path clock when the mux is set to DEC0/DEC1.
> My patch ("ASoC: codecs: lpass-wsa-macro: fix path clock dependencies")
> makes it depend on the main path clock, so this event is now redundant.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---




Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-wsa-macro.c | 59 +-----------------------------
>  1 file changed, 2 insertions(+), 57 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 2a814a5d2d1f0..e2e78ff6dd54e 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1726,59 +1726,6 @@ static int wsa_macro_config_softclip(struct snd_soc_component *component,
>  	return 0;
>  }
>  
> -static bool wsa_macro_adie_lb(struct snd_soc_component *component,
> -			      int interp_idx)
> -{
> -	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
> -	u16 int_mux_cfg0,  int_mux_cfg1;
> -	u8 int_n_inp0, int_n_inp1, int_n_inp2;
> -
> -	int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0 + interp_idx * 8;
> -	int_mux_cfg1 = int_mux_cfg0 + 4;
> -
> -	int_n_inp0 = snd_soc_component_read_field(component, int_mux_cfg0,
> -						  wsa->reg_layout->rx_intx_1_mix_inp0_sel_mask);
> -	if (int_n_inp0 == INTn_1_INP_SEL_DEC0 ||
> -		int_n_inp0 == INTn_1_INP_SEL_DEC1)
> -		return true;
> -
> -	int_n_inp1 = snd_soc_component_read_field(component, int_mux_cfg0,
> -						  wsa->reg_layout->rx_intx_1_mix_inp1_sel_mask);
> -	if (int_n_inp1 == INTn_1_INP_SEL_DEC0 ||
> -		int_n_inp1 == INTn_1_INP_SEL_DEC1)
> -		return true;
> -
> -	int_n_inp2 = snd_soc_component_read_field(component, int_mux_cfg1,
> -						  wsa->reg_layout->rx_intx_1_mix_inp2_sel_mask);
> -	if (int_n_inp2 == INTn_1_INP_SEL_DEC0 ||
> -		int_n_inp2 == INTn_1_INP_SEL_DEC1)
> -		return true;
> -
> -	return false;
> -}
> -
> -static int wsa_macro_enable_main_path(struct snd_soc_dapm_widget *w,
> -				      struct snd_kcontrol *kcontrol,
> -				      int event)
> -{
> -	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 reg;
> -
> -	reg = CDC_WSA_RX0_RX_PATH_CTL + WSA_MACRO_RX_PATH_OFFSET * w->shift;
> -	switch (event) {
> -	case SND_SOC_DAPM_PRE_PMU:
> -		if (wsa_macro_adie_lb(component, w->shift)) {
> -			snd_soc_component_update_bits(component, reg,
> -					     CDC_WSA_RX_PATH_CLK_EN_MASK,
> -					     CDC_WSA_RX_PATH_CLK_ENABLE);
> -		}
> -		break;
> -	default:
> -		break;
> -	}
> -	return 0;
> -}
> -
>  static int wsa_macro_interp_get_primary_reg(u16 reg, u16 *ind)
>  {
>  	u16 prim_int_reg = 0;
> @@ -2395,10 +2342,8 @@ static const struct snd_soc_dapm_widget wsa_macro_dapm_widgets[] = {
>  	SND_SOC_DAPM_MIXER("WSA RX_MIX0", SND_SOC_NOPM, 0, 0, NULL, 0),
>  	SND_SOC_DAPM_MIXER("WSA RX_MIX1", SND_SOC_NOPM, 0, 0, NULL, 0),
>  
> -	SND_SOC_DAPM_MIXER_E("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0,
> -			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
> -	SND_SOC_DAPM_MIXER_E("WSA_RX INT1 MIX", SND_SOC_NOPM, 1, 0, NULL, 0,
> -			     wsa_macro_enable_main_path, SND_SOC_DAPM_PRE_PMU),
> +	SND_SOC_DAPM_MIXER("WSA_RX INT0 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_MIXER("WSA_RX INT1 MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
>  
>  	SND_SOC_DAPM_MIXER("WSA_RX INT0 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
>  	SND_SOC_DAPM_MIXER("WSA_RX INT1 SEC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),


