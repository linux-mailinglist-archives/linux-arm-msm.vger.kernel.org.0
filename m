Return-Path: <linux-arm-msm+bounces-72264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A2B45535
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8495EA0345B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A84D2E3AF2;
	Fri,  5 Sep 2025 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oapHd31n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E04F2DFF19
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069086; cv=none; b=O1rnd9dobMqr1ppCj3eenhK5FOqhKP190/TVDMJ8R4B6ffcbW9dvkR+iYzahIpjxeHyLVapSW2EFHaf2k35vh+QdKAPMiH70wnuq3dIAf97nR+O+NUTpjgBrbNq6MgHarNW3YPdT/sehV3yj8RJD1odOQADeKwAb9Wgj6jgJ1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069086; c=relaxed/simple;
	bh=6Piiy6NTMH97WhADbYD3/LlJoh5Nv2lDCU6EvR4Cu6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvufMF0QqwzPjEyvT2iB2afmAySIq3qskjKYGJfwA5fAQKIol0CKpMqRPDxzZXIlOpEo9we8VuBbyCEdzSAmvSYNkpoLEu29avWrI6hTsP4n6PTD2/DmWPmEk1j+ITjIpJvcNoFblSFxKi4UlBjA5w0z8qp5v/ydgwpQE26ofmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oapHd31n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856i7e2007619
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gux6kMZiUumXBSjwEoH1kzz+HuiKLKIvCan0EKUg7As=; b=oapHd31nIext8y0p
	K7fPX9gXAP9vEGEc07m77KS9wKrnN+p1iaUau13Ru8mIjhiLa/VEuGm3727j0zhl
	wHLJkdHatgMtuTBwaNFDvSxsm+L0GmrbIgxusJQVhJ9TPBKK7KGMLt90YKiKuoOB
	I/+y0mSjQNgwL/8HXdXJRA6ZTIMmtjOeD9Ef5jGFA16QliazE4S1z8I/BZHeA3HI
	3fNDkBVXo2TYemkhBLGN8zIhzaO3TDj/Q8KXf5ZsaRdpMNAyP7qVoig/yukgAiAT
	F1ML1uWful/8A6QNnjlNqUTssiJBGq+7xY3GtvnSCJXcsx07HdAZ045zM1xUnUPr
	rOf8AA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura92qje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:44:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720408622e2so37419936d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757069083; x=1757673883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gux6kMZiUumXBSjwEoH1kzz+HuiKLKIvCan0EKUg7As=;
        b=GdO+CM96vKZZrJUuo4Caf1Z3127q3Mj3xeCp6oW0YqkdNaz48LmF43a+WRyEOITVF4
         H2IRAyR+BBrKqlcURbsXSEA2F5Sbqi3TAPTnR3R+/08GtaLQgWel2H4i7B0lppJyh/o+
         7VgQwQ9tKAfQp72NxTYJ0+1iopPC2hv/nK6A1hmnlac0intMrtQszHPD7H1tDfXbu1lA
         WNg6kjsP1kqNvU2BWFq2/rvY2jg+DITEz7HwJhEcml3fZIMMBfqO9578No53M5YpGNim
         kOv8iTefchVM9DyK7aQ96CJrdRAvYwZzei5IVJ0+jCa/itkCtFjRjEqh/2lAtKKyMsgu
         JJMg==
X-Forwarded-Encrypted: i=1; AJvYcCXf83rmxM8A2+WZSlggcNCo6AmwI1SjXVXoOe/1H9VQrVierhtTf+KMRParqS05FNP8Et+oabG317nU1lb8@vger.kernel.org
X-Gm-Message-State: AOJu0YzaAJPNkATf2/aV468s2cG07fFtYVU58G985LjkQCO600qDeYG9
	JVaZ/g6qzLp7JgV7ZEJkfxvxyS8PWn888v0idwFMpEtRXx263i/E/C7oBI8+a/Nb/rKgHhOVgkh
	ho448h+0kcaUg2BapKXyTkXorLI0ShIgvfNVTSdhJkxCQFYvjc0wmpeexwh9QMy5mBw19
X-Gm-Gg: ASbGncv/Y9W9RL4XdkJwi1OqJH9i7FbzrxIwI1ynvtgUiPuJrnJC/+SWJoMs3qoxMZL
	PjaL6Li6V5PrvjKFE7BAuCN3lpkMTLYWug8/Mh39xPSyDIK7Mz1xZXVyNplrCj+XIt3DtbyJpGQ
	Q0Ed22YUuUF0GSDTd4nynGjjWtWqt4IWpl+ctajYXlRp6oGThOgmgmRLlwEGfWjUUNj1RVleSYz
	4ucg0EnSV61B0jaGi6yxlGkbp1VPcDxrE5Dd2KkI5sTNimXBrMfGb8H5R7n3SHasUd9xxEU9exA
	8/lGpDn1XK5D0hFxZWtr+lFBIbylITAJM0pTZ4IqUhAhQrZFUbB0TR9aK42lsr9J1XQ=
X-Received: by 2002:a05:6214:485:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-70fac6ffe91mr215640616d6.6.1757069083412;
        Fri, 05 Sep 2025 03:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAm6CcVTYr13hDSdqICOxT447TVJsFuVSMbJeTafnfVtIojb7sQBZPcJnhCg4YWD1Rwy+Vyw==
X-Received: by 2002:a05:6214:485:b0:705:16d9:16d8 with SMTP id 6a1803df08f44-70fac6ffe91mr215640206d6.6.1757069082703;
        Fri, 05 Sep 2025 03:44:42 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3dc1cd4a7d2sm11220748f8f.33.2025.09.05.03.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:44:42 -0700 (PDT)
Message-ID: <59775bbf-5e8d-4302-910f-94c7e1d5d9e3@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 11:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt
 DAI op for I2S
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qFY8vXp8OKJcCYqQniZnRRsqe7r6W4yy
X-Proofpoint-GUID: qFY8vXp8OKJcCYqQniZnRRsqe7r6W4yy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX5ijd6b/2VY+e
 OAmos5g1njSB/6CAYyCvqoSrHgUUw1qdgsrpuO0s2uK95IzNy81rrL/sbzm6emRgHvSgTHIJ29y
 eFeBoUG9kCTtZ++YMe4s0DM0td2q2+Xad7wfNCOEy74clhzrbnwiRIeo9ytG/wM46bAgvUFXleb
 jseL4XPlMF5nula4kyPichIjXqbsc8dau1lmBzyAOEIjA76YSPgwgYE+OtJ0CtE90eJ9gn9AOzB
 OgzkZbwBD81z3LGTtH5XJBO9lSBCiDUFUtlIMPrALJ0QA9fTY22MbytSb3PyThMN8SV8LrkAWTe
 hO+0lFY7Gh74SJrKm8+q8zUAYwQWUZnv1ukrRKqHNr0m8iB7mHiDJ3RnIA9y7Cm46zYekbQedew
 TFPl1pxD
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68babf1c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=bCJSiAZF6pK8vonFiLAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 9/5/25 11:40 AM, Mohammad Rafi Shaik wrote:
> The q6i2s_set_fmt() function was defined but never linked into the
> I2S DAI operations, resulting DAI format settings is being ignored
> during stream setup. This change fixes the issue by properly linking
> the .set_fmt handler within the DAI ops.
> 
> Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")

Missing CC stable?

> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

other than that, LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 20974f10406b..528756f1332b 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
>  	.shutdown	= q6apm_lpass_dai_shutdown,
>  	.set_channel_map  = q6dma_set_channel_map,
>  	.hw_params        = q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
>  };
>  
>  static const struct snd_soc_dai_ops q6hdmi_ops = {


