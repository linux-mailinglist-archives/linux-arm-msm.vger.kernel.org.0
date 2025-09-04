Return-Path: <linux-arm-msm+bounces-72038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 949ACB43997
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B86F5E82FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 11:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9DF2FC01B;
	Thu,  4 Sep 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bxgrods4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0992FC001
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756984102; cv=none; b=CzBE7HFMUXmR8zgFODTkfQU5YIVIeeDdvY4v2ItsTlCNLMb0uSUsb2ktXkOm/6mEtKc8LiNtZNz2mDVcoptkzlaXS2UjkaNCSNYM0T2NHQuXFy11P6cmk7eJmL1BEByCX7N2zT7zqLTRIYNKTcf7E0Tr68zR4g/RJW5GcAJaM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756984102; c=relaxed/simple;
	bh=jIOs/37F5oTBJC+BujtHr3EhnRH+iZeX6ttFp1btZNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2EkXgLXQNFy1tqvOq/K4XlBqJ29dHBX1kY31Mm+P4NPsONnzhD44a2jQPH7DnNLYKdtJQ1oSdCGX+50H7A3u11Mem4NW+WWCkKiDSeJkMvGMF8qL7V4tIgScfsuO2ZeKERE4MA61/yBeXJiCyP0JO0gFrVQJAD9oOgfzNns5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bxgrods4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8U5022986
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 11:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwWH2saoa/5YgLT/x5Tw7tdz6CHPmMwve8pSGBGAHFI=; b=Bxgrods4qNDtjRI/
	cCFNtm8YQ50hk9EBHdmn4W6at3wcBCij2Bn5pmo0CFeCSfIpx1CjmvOBRho++5Rr
	3986zNCjf4URjDqH7yKEHo8lvnEUpcj71vxymkycvGKI1+ZFhdDXZgeeCAHeh8UN
	UNhSMMnFZkshvBDxXNX9xBf21hl0aDBtjKP6SAv0irD1Az3MAjxhI48k8VF+TFmp
	uQ+N7wquCcY0hzHZlZytqjt1bTt75UKJXpjnNwwjesyNqim88fgMpP9xoGwrHGJw
	KMHg4Rbq4yIKklks5WRsdb4xi9Ii27bPe/mSkdkNSdqLnqFQYZUxPyCwvZkpdGz7
	M2jmJg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eqcp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 11:08:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b3349c2c38so21713561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756984099; x=1757588899;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwWH2saoa/5YgLT/x5Tw7tdz6CHPmMwve8pSGBGAHFI=;
        b=Ys/DQnQzthJk39+h5OwVpbz83c+CqO6WM89hSV2q1BIfhi7jrhVuk+44kpcM7OMsoh
         8Q2zy/OC/+qVJ4tqe9UYSdQc3/UUTUPAEinpeo4uVwczpbd9zGOsxOrTOf05wR8nTrZL
         O3Ep4PzfD/pYxJ+ZALhJIeXODbm8y/S78/a/69t8RK1AgpFCzs4N+jgPUjTn0OdzLOnn
         pD2QvAs09a3RKaZ+h8TUuQplPUWjKb8g9atpStdu6AvQyWWWoscvrAV9+BRI3uC4Vm6W
         WPy3GEylkO6XbRgMtZvQa9LRSB0CZQfvZWPDOng1f4KtS7gdUo+m6VhENRGfLgnw7nEj
         G3NA==
X-Forwarded-Encrypted: i=1; AJvYcCXWiMVyZBkCm1cpRHrHx49sW7uxBJbTg7y9jAWUIYC8bkoHUCcKjoUAg6uGGmlZqNOea1TF2qulxJRjtCsL@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOltuuFLvFCek7oioiVwWQHHdjcZ9Dpwo9D0mg1pluVVUAQNi
	ntNMJTVHk5LF03FBOPRtQtzlYdsRYhyzucNSelYPbV1SBveI5HHISxIHRe7uoRHwKmuu62QD1+k
	sbeCUDy6le1+hmdZOkxwpwgH5h5CDastpJPyp4RYZIG256NK2oMXWerrQQRDpDBCKIAGV
X-Gm-Gg: ASbGncsb8lZHygA7loWqQn6BQjGH+uv4rbH1N10upa6x+7JPwZKpfVJokkf+j1xyZMz
	8k+EwDUFepBVrYQkElu0j/7qsiyy75MNAWXFwtxS5B4awoBYF63QuYcYsDM3vQHPZ+Hb1JOAGFy
	tOjs7cgCNpW1GX0XI8ChQPFHnZnkjsn8S3cTnOaM8KWRgXwWIJIvQRqKUQP0px+zYD3CtUK5c0I
	oL5yLukcxy/AJVPsYBAKd5kd2yzHpQmV6JBDVTfPF5CNK7v6gvZTeFopmgyFa1VzNgPwQQ35CPo
	0G12eK3bWpffx8uHGdNjHJnIWuMzt4uv2LDCRKA9E9/l218q/lmGJHpxby3SvFHpePQ=
X-Received: by 2002:a05:622a:4cc:b0:4b1:72a2:5f0f with SMTP id d75a77b69052e-4b31d80cafcmr209909501cf.10.1756984098845;
        Thu, 04 Sep 2025 04:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFX/6Xa1qjkR68mOBCh2BYBiFO5Yz3J3ngHHygu/wcw314DJPCwNXqh2ciD+XBwYRi3N6eA==
X-Received: by 2002:a05:622a:4cc:b0:4b1:72a2:5f0f with SMTP id d75a77b69052e-4b31d80cafcmr209909211cf.10.1756984098371;
        Thu, 04 Sep 2025 04:08:18 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b72c55c1bsm384312605e9.10.2025.09.04.04.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 04:08:17 -0700 (PDT)
Message-ID: <e9572405-85eb-4ff6-b854-2fd8a4ebfe43@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 12:08:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: siyRHdFVSIlqyKUp3JsYlVTYaJIGDKlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXxCaVVwRN60VU
 PIh3EGGDGKSZTsM3LO1vJIXMLOJrGqv7AYyRetdTYb6uUePYLk7NbJSfZkmkvVxejOrS+p6do2O
 ASYz0MZciPD4TLzZeSo1Egf+nP95eJ+Jrp6gIz2qL7ZFdKo/eoPcAyqeu0F7N+rrj08shbTGz4m
 HSzq0ussSvEdY9u8yb1zBHgIOxuRji7VRvm5Tv+N+2NSN5nFgRkNtRiX2f0V8OEIeNWiUUz9PAi
 rgweMqe5PYuNyf1B2REgkltBZwoizo/UIlhe23e232Hg+q/hiJKYWY7/17uPyMQWPFiZVbkzvlW
 bNr2fZTx/wUh7m1nWXDniCNQaRv+42vY+rO8aQIGfXYe6GfSoWCqSBnei8p6O3clu/pMZwUbwuk
 jiqf83Vg
X-Proofpoint-ORIG-GUID: siyRHdFVSIlqyKUp3JsYlVTYaJIGDKlE
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b97324 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tW9EEy9pNj_nyu-JT-IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004



On 9/4/25 11:18 AM, Krzysztof Kozlowski wrote:
> If earlier opening of source graph fails (e.g. ADSP rejects due to
> incorrect audioreach topology), the graph is closed and
> "dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
> graph continues though and next call to q6apm_lpass_dai_prepare()
> receives dai_data->graph[dai->id]=NULL leading to NULL pointer
> exception:
> 
>   qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
>   Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
>   ...
>   Call trace:
>    q6apm_graph_media_format_pcm+0x48/0x120 (P)
>    q6apm_lpass_dai_prepare+0x110/0x1b4
>    snd_soc_pcm_dai_prepare+0x74/0x108
>    __soc_pcm_prepare+0x44/0x160
>    dpcm_be_dai_prepare+0x124/0x1c0
> 
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Use approach suggested by Srini (you gave me some code, so shall I
>    add Co-developed-by?)
don't worry about it.


LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index a0d90462fd6a..20974f10406b 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  
>  	return 0;
>  err:
> -	q6apm_graph_close(dai_data->graph[dai->id]);
> -	dai_data->graph[dai->id] = NULL;
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		q6apm_graph_close(dai_data->graph[dai->id]);
> +		dai_data->graph[dai->id] = NULL;
> +	}
>  	return rc;
>  }
>  


