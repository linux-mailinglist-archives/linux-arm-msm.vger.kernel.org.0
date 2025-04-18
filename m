Return-Path: <linux-arm-msm+bounces-54777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963EFA9404F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 01:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF49717CBAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 23:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4E325484E;
	Fri, 18 Apr 2025 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4EZ2wFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6322155E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019537; cv=none; b=scJ8U/lXjkl/o8gQDs9lwoImveA7JnPE6P1SyJeWOBJ6md1+1LxFQieN3RTdpOr1/1rHues1KIW7Sm4Pt7bpgrv5PSsryEkq/+i0q6Sp0gTMiLLfKwN9QuN/4COtPVWQWg0OoKQxURpzicRCc+OD3RVJwWAnRBXFdCs1ldRSdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019537; c=relaxed/simple;
	bh=I5j5xYO17jbmnQ0gR/BBkN5Uvu4UyzKV4HR73HhO6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdSbL/MMcWOUg4r4FBL+GRARPAC+zY3yZy1F2gCyaU2quemk82ajaLec5lk30i0QPwulhlOO3EhPmLNb0iGBjB+Pb47k/+ZKVBNxFprvCT2P1cTdD2TuWvRBf+TNg+RABF8dIsJhN4A7+rxpmlYm7GKkkVBLK4MpqKcr5ltmY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4EZ2wFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53INSosH007970
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wciFWuvgtL4Ulh5qb6h1BUFo
	x4HsWcmuuAzBT3oTGdA=; b=U4EZ2wFJ/IXOp+G2rtht3inGFgKv6wKZC5AfTqE8
	5TAmJt23VA1aLKjPO9Cxg60HbdKRw4rZzAT2QkFYtUmZknMxpx2BT+BnFJew/uVX
	raJ/d8nSin0+XfGlcqA/N1pwXpqCLCaiedf7R0ryMrSpK+ehK9GhjjPquYA/ywei
	XTtHA2AmVt/iAbtYetCbYbDto/I0kyTcgKhUpADVBwMOQced3j+d8Co7d15VZwUK
	LI00nAEDolKGe0HGyVkUwzMv1nYRT8IE6coKtiB9fwBJjML1MsmLtj5T04SDsGly
	tVE3I91/ty6CSbVvAVbzdoH5Llo6c5vAYokZrwtnXWa1nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6u7hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 23:38:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c548e16909so187956285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 16:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019534; x=1745624334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wciFWuvgtL4Ulh5qb6h1BUFox4HsWcmuuAzBT3oTGdA=;
        b=Dk0uo1VXktbgDLn54V+2NQkMuEmJzDP7DYyb5Du1+BBWBWxS2fgjyEQAzm25NvbSkR
         muoKLzeJe4BN5F0iheDPXvQkYc1KDWKpmRgKahiGSkNpEYC5lrmZ3fPaKoMynZjrJB1O
         cXnX4m5AvDqLwwwtNWMa4NyCvbFue1bdYIP91u0sCcESvPiPlYq8uxM7i8rVu/3hpCRV
         5M6pVnb0/P9LhVYbEsnEjaX5ZHeKDHsLmEWTRDsbiD5VR9EC0abDWKu6yXlZSY0IISmr
         D+jRL8dJXvQNjUYUkVsn02QWtWRXLpfy8jJ+tg5qtQ8360/3fDLFiLgBXT8VCUsyjKBS
         YH+w==
X-Forwarded-Encrypted: i=1; AJvYcCWSjwpBlZ2943/EGVn0IEi8kq1QcXoJDteD6GqFhn9hnkvkdyjkGyItJRFxLvXerYQ8L9MBnac3oSvaNWN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5aFjsTJ6StvzupCyxanzQTtdPui1Qrqq2rcRquWLC2ptz72/
	GCkOyGbZUr/jZdmyt/I9jrGGWqZhIu5j53fe5c/YWMau127L5E23ovoF2y0dAks7mdC5Tuuq/VN
	7F+cH7fYW/n/or0Bmglpd/JNak7kvSssgIGJGG3ZWohR+sxU9F1qU6ZnrzaVM4GP2
X-Gm-Gg: ASbGncuqjNic1FmXnDZzOeHoN42SXGaiEGsgeUiIh9jrCJ89Q1iAwwLew4Nmnz3zeWS
	ws5EDGUXs5D/qpkSlWBjbs20ZzNExDylfJeonpuMoLVmnnRdwIkjuy28ddlsFBYeOGZOF9EYzTY
	N/CEbvgsdhOFRRWkPqCQavcYC8BYHOw2QaEpGwMbICxhJHNRP41Xm4Lui1dcW/nKFhASEap5liA
	BeXK2eV0JdsA3+4IW5eQhrmlIuKDkMCpjSSNMd63M8ClzpHB/++geF5tHL4CH57yHsrEKqKJitG
	2aEZZR9D0C4iAiz2MmWxd9kVP58ImugaDF5fxrRiOznQCE3B6bfbbgow6aviolgv6FRZ8KwbBEE
	=
X-Received: by 2002:a05:620a:171e:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c927f780bfmr692143485a.21.1745019533981;
        Fri, 18 Apr 2025 16:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrgxKsOjmu1LVyJH3BudONVoaeTL2rmWdYsEbRaxd23kHJQKLzttBmbHYfAyg7UYVaiWlyQ==
X-Received: by 2002:a05:620a:171e:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c927f780bfmr692140485a.21.1745019533677;
        Fri, 18 Apr 2025 16:38:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e52482esm299915e87.1.2025.04.18.16.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:38:52 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:38:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <qtoavcwi5eloa53y5qfaasy45yv46keqcgy45d75rcgll5u5bb@2nwpdobcry26>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-3-05d65f084b05@fairphone.com>
X-Proofpoint-ORIG-GUID: -POqM3-YFRooKwQDMA8TR5FNBb-SSPVo
X-Proofpoint-GUID: -POqM3-YFRooKwQDMA8TR5FNBb-SSPVo
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=6802e28f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=3PxokYgOTNhXVQtrWI0A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:44PM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index e920b413b762c803cfcc4049f35deba828275478..aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a 100644
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
> @@ -34,12 +35,17 @@ static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	int ret;
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
> +		break;

I'd say, just move return qcom_snd_wcd_jack_setup here.

> +	}
> +
> +	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }
>  
>  static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

