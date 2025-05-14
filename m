Return-Path: <linux-arm-msm+bounces-57799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FE0AB6361
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 08:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABE927A33CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 06:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8697C202979;
	Wed, 14 May 2025 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODUBxBGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9731202C21
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205018; cv=none; b=KmElz6K3Jx3yNOPMUi7q+FD9N71XwsgLvrcpJa1FDjDvbtPViKE8/co2PZ0LKC17t465ezcHzG6xv1Pm/QeltzJd0tJQndE7fc6X/Kb27Ck0AGzHhGoh9s6GX7Ls36OYrS5JM9DWr7W5REOJfabcaU8NXarLkZ1Wt56I8944p0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205018; c=relaxed/simple;
	bh=t6oieiC6PkmHUBT5J/m/ariSEMtMKZPl7YTPtb1Qy+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgnEffVTmKbZ3+g5K383olWghujs1jDjem+qkj3pJeSc91+fXE1rSuLorzHOUgFw2f58tqACSQiYoaK2/Bst0fgi1Ro3nv9/ibj/xTOMdy6howwrVblbzu79f2ZyvAgBd9xLgi9VgwTxt63lI1ngCWeBUCRErFf+f7ebNjCS9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODUBxBGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E57dwv008446
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=; b=ODUBxBGC3ip4iDDR
	qArtlQ7am/X45/1LBoNrBWnK6VRqXHKfPncnRFigXBAG6d4mfQJaTMHu09duID8C
	qNFrL0A0+n28pd5X3ynfKJIVjOaJ7z3m5yrEloSiUecOrm3otoBJuSVQS2S2wyTD
	E5DSypKc3cxiGgWB2DNOrNYYVE+zPpHLkocgDKadNoc290V+JFExWLGjOnES8FRt
	Yeu0y+mQoGjmcEgLesJdOAov1Hl5ki6SKEDa2Td7T03w6V2ltAwA8HBxIW53k4Sh
	Ndlv8176VxptKF1xb5cnLe57g3qXX93y/ECF02ewYMWYVqWcxRwHWvqES91pnsme
	t5C5iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr1nay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 06:43:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so2095335285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205014; x=1747809814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+kTWHR6Q/nKIsQr5M8KaRL7ZteEdh3CROcFdHwMXPY=;
        b=RqvmVyzCAb5DHG5mSHDAy8ssU7ep1sVREwq+UyRiQKA949t45wcsi1eLKoKAKT+nfN
         f/SOykakQyRkhsC5kXZdaG/ecr8bHGAi6tuM2BycP8DVvqdriheE38kj3l5Aj1YKOYEr
         oP+yy56872YUcqjhM6pWgEjoElfyvHx8q1LtEVLA7jClZ2/uYuf/pGiyLjJyNaXKhjBE
         uRXEza0OAJAS/OvGbBpKhxbfO9yiMgzNRM3g7HgWS9wg9GTj/nFzIgOszZ/xTnDQwsRs
         1bw2PUYM3ZU/aXo24ZMZjCaskK/1zBsqjyP9EqVL71WS1q2daPkchbqDJRQQXTmmyZ9c
         gJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd7ouutU/jY05ASgs4IqiotUMDQZ8ToBVfNVlSWe1YuRJf+VBTcwpZpfy0QAvumqJ6ivCri4Xcc1l4zp9V@vger.kernel.org
X-Gm-Message-State: AOJu0YwTYwtINGQBPrBRGuVLn7veCDdlIrDhM1oNCRUU+BHdb22FW3YB
	MZeQfzUr981gMrYd3PFw8h/wJfjVtCHgJ/FyNkFzfopeZtGntnB96gUDM4UlY/ANb7stQEeRn1w
	ICl7/ETR2frRzIiyicPem6VbZXu2UJg3mlbxFPpecugve+mHCjT4yRrS4VGKjaydn
X-Gm-Gg: ASbGnctkTSvkJUIuNQwu84KLUGY1kTNEh/Jm+Vp5N/aUbTli/c/6pXB0ND2mwOd282R
	wFzNy2Mtmo4IHqo8PtVYqU0buOzD4fFWrjSMyOTn5nBxL2BgjFZbO0eRZZ5lLA6VrJqt6pESeFM
	y6F+vvuXOflnSwKOgSKBSLWGu5vJ2sltgak92gdavhEUJ1UfO3gUC/Xu9ieZLdtaf5Vx2bAUFbS
	84lMB+bFQypgB8bU4jPMpZ8Xz2Z/jAqIr3Ni2uk9W3EuhA0n2fw7I9Rt0NQm54ggDnEMfiNURcJ
	75w1yve/ZlrFfez+1zWPKkX24u2nVkcynh0HJ+Wb1I+TjU8pMie9ak9vr9LY9w==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287542085a.29.1747205014581;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCYe0F7XxHWYbhu7NVkdrepacB2uWQjdlsK87LfnyU0uT99TRX1IkmjHkIXO+a5nsoJ1a2jw==
X-Received: by 2002:a05:620a:4156:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7cd287f9650mr287539785a.29.1747205014272;
        Tue, 13 May 2025 23:43:34 -0700 (PDT)
Received: from [10.61.1.19] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm18334688f8f.5.2025.05.13.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:43:33 -0700 (PDT)
Message-ID: <bd36e7e3-480a-4876-98b9-73af8298ff50@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:43:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
 <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-3-4098e918a29e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 95I3MT8MV2RaQFRmNgAgPwgvd9orfFxf
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68243b97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mS7wm7roH4dnaGY2uMEGzA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=uaetQlgIYQjjGCg3SJwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 95I3MT8MV2RaQFRmNgAgPwgvd9orfFxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NyBTYWx0ZWRfX6f9fuWr7lATd
 UpYk9dvjBv/pFvktDMZAOpNgTc6f2f3r4b+9ULMkkP3ThvzjZ2mBGqqPOsI9ZQOmHEc9HGpn6uZ
 Qs7Qv7ukPHFMr5SjiXEmPpf4hbixmAy4IVRMHsBESaPZwAChzn9RVRWQZ7xc4Lzov3gWmuQx0Z4
 8axdvmJNAnvcQ76gVV+EVqlRAgNK/0ordKGTO3f/swWImkg12AxY57X4O+2tPXIqBnVViCANu1O
 nZceDSqh5rrOJw0gqe3CjXFK6byz01f2iD7JbQjTPFNqKn3yztJWV07JPEYxaauqLln/tRWTv57
 IP5S+uOpvFq0/d5/EGk9uqeQpYwURejM5dmKZvjwnr+xI0rE3HYfWxtC6FYOrFKIUQa4Nn4s1Lp
 0Y1skDUIcu3s16IaASS/283pXqjRjVyyLxaWH8j/cl05YdE2xRdFXKb7elJMH9M7u9g+P7lM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140057



On 5/7/25 09:01, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f0d83a843765d8dcdd51569e7cbc95eb72292497..2317fe285ee7d41689d7fac453164fbe706744ff 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -25,6 +25,7 @@ struct sm8250_snd_data {
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack usb_offload_jack;
>  	bool usb_offload_jack_setup;
> +	struct snd_soc_jack dp_jack;
>  	bool jack_setup;
>  };
>  
> @@ -32,14 +33,16 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> -	int ret;
>  
> -	if (cpu_dai->id == USB_RX)
> -		ret = qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> -						      &data->usb_offload_jack_setup);
> -	else
> -		ret = qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> -	return ret;
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack, 0);
> +	case USB_RX:
> +		return qcom_snd_usb_offload_jack_setup(rtd, &data->usb_offload_jack,
> +						       &data->usb_offload_jack_setup);
> +	default:
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +	}
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 


