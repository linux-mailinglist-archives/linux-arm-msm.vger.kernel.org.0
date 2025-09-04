Return-Path: <linux-arm-msm+bounces-72036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1D1B43989
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F071B27A3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3A32FC002;
	Thu,  4 Sep 2025 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYfoP760"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D32FB626
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983992; cv=none; b=r4FlKzdkCgSs5otlQND9XR+Xr+oTfwYUCJkcpRuzGDlWhm5IJ/SdsZGaNHItqS1SI7NmUvwCgS5FQlo+OZNTNWZWuvfoj6bgdN65SeXAxxDcTGxmk/ChlnEOM/IGAtP6u7ZVYK3yvdg506IF0mPi8tIMSm4fH9cCzXYlFiAVqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983992; c=relaxed/simple;
	bh=5vZcmgBM+9Nv9iip0wHP9dGmRG2D1+tPZM/R2QISb3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V1JZsD2REbaPWqJlyuNim3gk3Ncytv9ZfIB2PuZeiHJZsPTiZoBlimo3Dm9UXhGKTynR18GESiZhgvyYi+Ed5HyslXHKojGz2R7EC9fHOAeMafJmuYy+aIN2EfP4F5XaPehFux341KyvFu/S1v6TOZD2i6a4pQJYSAZ8G/N8YhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYfoP760; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8d6012122
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 11:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhYbFIRKKiIOKT8Pi5ddhFvBtwfY5TujA8EjKQzqmHA=; b=NYfoP760/aavXEgn
	NAeSWua4vdb1T2zsy+jZJLjjOyAITEG4X7hv224yW+jBIISzyHdN5NGnhT6NoDSN
	T8qiYfeJsPYpMQV26puRU+9MYHu8/iSQP2cTu3a8X1mY/OBAkNOjI4dc/fl0fCFA
	aAJsKc9MQ6j60ZSvLGeE/5D1swcb746fMbRh8apqsvkyVaPYh64XACZ+NmN2sJM9
	hKo+fva3SaBLMKegUwmaH+hnGjo1LpXEaEgOopn6kafVEVU7K4TqO+5tqMil2oRp
	S8OJCZi/qDoram6vU5TTGnN+EBcjauUfiJp1bFenA/N/y4TwPFywXAhF0o62RYxZ
	q8CzAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48xmxj3rxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:06:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-72631c2c2f7so16480366d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983988; x=1757588788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhYbFIRKKiIOKT8Pi5ddhFvBtwfY5TujA8EjKQzqmHA=;
        b=gtAhOgSozHh4qEhC83pwQWVzYPwH5iKH/pfK8spPq6g9ygkUao1IWbqaikQxXmMnmh
         2/v1x+yG89u4ksDYapwNkw+ljmQTQkj/wctlfeHvSSeiYWYm1/9OXqIt62GPpXewdDLf
         wJ1Y2lxDvEAwqCP+Ot/FvOqQF4dzoOcQn+0xq7Z+EVO1hRC2vWVI4DW5POUjaQc6t9Ib
         7UIjFoA9ugdbBTAPV5cDC86OnOIqvrabcJAISY9C8BrijKB5NcwLeLpSAbqW/THT5SwK
         LcH3E65jBmoUtAeFpvUY3XZYAttxeKgmJlO71pxWdAaauRKJCSJayi21yoi14UKAPhif
         jEVA==
X-Forwarded-Encrypted: i=1; AJvYcCUF6ixrt2G5lEmNeOx5NPZJ0rIjSXMIkthrNzxU642sonfkGxeCl7w2gVa6k8jUcwJENfVzHexogCRH9BHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr5eD60VdRJXriZlk5J6WQkcMsJF1J0g/FlSADtv5BvPOGMxPr
	G08BNJ30foLLv8nRSde/KEvPVly4zFhyC7vRnIY8CxoSjAeNu100+a7zwI4r5rKivHbGe4FWDTj
	DK1CiQNakggFZMc06Ft3KqqJ63lizCL1N+czUtGwaEuLwuIgU0TX+g2gU9TH9NHQDAPC/
X-Gm-Gg: ASbGncvPbKCH2oL8Fys+Zx9gUAh/7RY8FCPR+jsQ7k27qNIo4tpVFvkiIE9Qa+MLbo8
	cg+MNFwWYRdMSrqLBSTyPh8HK6y9vo/n3Eu9ZjumG5BcruuHOC8nl4Jg2zCwdO2ITEIm+toIouB
	1NM70y9SPAjw1cfCMu/PeqC5SNfjpaM/Rg4pCKdAPNdItqkIESEf4B7YGnxC72aCQylkLJEk1Y3
	Wq2p7utXo8TEw+14f+C56uKDP1hVydgkmcagwj4Fesf72nqIGyg/fWN8Me7l6c+rITIKtBJQjfr
	ERjXPo4l7YYHoVT669U79xKf2YW/wbHB7FJ46iJUrUW9Bye4P27IU3VTTIpQNLNR0f8=
X-Received: by 2002:a05:6214:3015:b0:70d:ba48:f8b1 with SMTP id 6a1803df08f44-70fac86ebe1mr208966456d6.31.1756983988344;
        Thu, 04 Sep 2025 04:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiU50o2//fs1eSkv5hsgG79HTu0XUnuA2rf/GSrZwv3jzhD7GlK0nFH1+s4mvAUoYiQMkTNg==
X-Received: by 2002:a05:6214:3015:b0:70d:ba48:f8b1 with SMTP id 6a1803df08f44-70fac86ebe1mr208965996d6.31.1756983987822;
        Thu, 04 Sep 2025 04:06:27 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm94775045e9.16.2025.09.04.04.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:06:27 -0700 (PDT)
Message-ID: <b396807c-309c-445c-85f4-b9c7ec5f1b88@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:06:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904102558.143745-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDExNyBTYWx0ZWRfXw0UTRWz69AYy
 7CyU+uL6x+8M+S1+aTrXMQCDLOvpEf8SBte3mMqTDNue3z+ib1Tz1YQ2YeI4XQBDpyyO/QosARZ
 3CgnEAzjRteEwZPE1gkdNpNFqJ+K4C4lB/jG1hfEdx8szEpWZ2v8V5n6lGJosyZaEsl6ucni9VF
 A6ltU0QTAja+prY+xY+Oh7oZ3fZtpskMKl3ZEa8hzNIhAaR6gA5TAzekUA5SWRrI5oGuEY/ojRG
 jV3HSsLQBM36FHLoA9oT80EQR5i9Oy3/zdCBShdKxFYoIkfJYfetgiQF7gfWkqLe6YGuWVxzl0n
 5qj6qYvzTkosf0kOCppK2gN0wCEY5Z3sjNGSf/LRsIRvjtUwQPFRXBxuuGWR4oGy1UTmCkMVpH0
 Uvg38QRC
X-Authority-Analysis: v=2.4 cv=a5cw9VSF c=1 sm=1 tr=0 ts=68b972b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jR5H-ETkXLhSoB5CPuAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: e548Zw1gcLWKVfnIYEH9p0KqESxJtLC0
X-Proofpoint-ORIG-GUID: e548Zw1gcLWKVfnIYEH9p0KqESxJtLC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509030117



On 9/4/25 11:25 AM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> 
> Changes in v2:
> 1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index f4c53e84b4dc..3b7dffd696e7 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1250,6 +1250,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
>  	return rc;
>  }
>  
> +static int audioreach_speaker_protection(struct q6apm_graph *graph,
> +					 struct audioreach_module *module,
> +					 uint32_t operation_mode)
> +{
> +	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
> +					 operation_mode);
> +}
> +
> +
>  int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
>  				struct audioreach_module_config *cfg)
>  {
> @@ -1299,6 +1308,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
>  	case MODULE_ID_GAPLESS:
>  		rc = audioreach_gapless_set_media_format(graph, module, cfg);
>  		break;
> +	case MODULE_ID_SPEAKER_PROTECTION:
> +		rc = audioreach_speaker_protection(graph, module,
> +						   PARAM_ID_SP_OP_MODE_NORMAL);
> +		break;
>  	default:
>  		rc = 0;
>  	}
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 790fba96e34d..9f6ddcf081ee 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -31,6 +31,7 @@ struct q6apm_graph;
>  #define MODULE_ID_MP3_DECODE		0x0700103B
>  #define MODULE_ID_GAPLESS		0x0700104D
>  #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
> +#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>  
>  #define APM_CMD_GET_SPF_STATE		0x01001021
>  #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> @@ -542,6 +543,17 @@ struct data_logging_config {
>  	uint32_t mode;
>  } __packed;
>  
> +/* Speaker Protection */
> +#define PARAM_ID_SP_OP_MODE			0x080011e9
> +#define PARAM_ID_SP_OP_MODE_NORMAL		0
> +#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
> +#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
> +#define PARAM_ID_SP_OP_MODE_VALIDATION		3
> +
> +struct param_id_sp_op_mode {
> +	uint32_t operation_mode;
> +} __packed;
> +
>  #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
>  struct param_id_sal_output_config {
>  	uint32_t bits_per_sample;


