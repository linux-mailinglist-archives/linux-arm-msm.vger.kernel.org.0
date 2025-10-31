Return-Path: <linux-arm-msm+bounces-79938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71515C25B9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E0094E7759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D622F7444;
	Fri, 31 Oct 2025 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANprUrJZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejvEsMQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E02F60C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922004; cv=none; b=kR/hw0PfYf1lNm/9A/zJ54MXSgI5x9XyqfJMXBebrOVieIS5KOCTTUq5ihKPkZvV99RZMl/saVkWtX41ZP9pldZElGxA1SqV7pSfd0ZZsDKMTXaRnTjmcAM75Kuzi6/6QDaSvEabfPiEUgezlM9cO6lQDXfWoeOdFtq6N1zUW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922004; c=relaxed/simple;
	bh=jzMI372OwDFBH5n8TtNj5NR2LY0KRBtXcDe0DjYy8tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa68t+LwDW65QeYmukGR1BuUzXsjyOeIxjHfHpHVv4ho/U/6fP/xOz7qY0v0rEEaMv/7SHxKeWMynHc9TD3uObDbKvCtVEYNzTkkOPegi66whWLKy2N1Lxn0uGFwfPFL+Qkl4IydJdH4bENTF4/W21ckgNW1IiMlmUM7i44TIBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANprUrJZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejvEsMQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VAS3wQ102861
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UdX0k9Bu7csqPDyXGQIuEEoR
	5weAkUXnaL92NORs7r8=; b=ANprUrJZ8c+P74dfVD0Eocp3aWx8/3R/Mx7s/MT3
	18KdjD1DeCR5eITTnIzLd333qhJQhcQ+nOCOucQYDbTRjuzgDhaRs0RFKqc6YXHb
	V41x4xkE2mrMeQxGrCShyQf6lufLM9ae4dOiU6FcjbAuloW4Z0gz+npQ2xycjNY0
	lVkN9oUa3b4yoBOJMU2dJ3CQ2pK3UvT85Oo29qA4hffvH6pd8n9Bn92/YfMKQhl2
	nVZ+DekGNFEZ/VRzd6RT1Y+GraUwxiHVqO1fXGFvnXxvPRFmd73fQvZihW41Xi8Q
	nyOWkDSEJRIyOWJ5+Gr9pVqaXzDZcnN6vobaOtP/jiJBOw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdkg2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:46:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88023495a48so45385796d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761921999; x=1762526799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UdX0k9Bu7csqPDyXGQIuEEoR5weAkUXnaL92NORs7r8=;
        b=ejvEsMQvgCcXBenwAfw/fzaZoGcbVjWLPMyvzV1+rQj9c7SrP8XlHTGHPozxl9cvdp
         8t/5o77vmrslNrRKOTsYQ/C0zzh1V1C0E1zEZKEPCmZ+i2Vi+mWksMyOayA7XP+Yowv4
         2Ccp7FUEWjBKN4zMXJQDP2+j/GOpf+Qy8r1db37AknFMTkEFb/coVQR3mIEaoAnGb2AS
         aTR4EWbCm+p96i22zRuc0uLVTe5i7ecF10OWfYRsm1bLLRjN4swDLDgSAjcQ6NYRtkn4
         sMQv3lX4CZWuu67KQmkjYGNJ6GVq/nxg0uA3utuz1fHG3GTGNjp9YxpoLuJ5oevgodxm
         llyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761921999; x=1762526799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdX0k9Bu7csqPDyXGQIuEEoR5weAkUXnaL92NORs7r8=;
        b=ZhqSbrcvL4ZZW0BrYkoGNTd32ACSUZ/tu5fcjaBlpV+CCUBHMudB2WlSZRc5Ol6Dsu
         lUzgGNPABEDUX16OUqsrd7kgYq7sxj45M8VWtVBz9sJKbDSFKZJdpuuLAgFuBJVGGzi8
         Tqdji6dS3PeX4gzYKI0UEaR6xYLgyyO1AR6Qg44vjPLc79w+pV5TYm3VHr0IrV1H9ohu
         Z+ANCPB7FFOuW9wXBMM4hgWxQ3jETOsXbbWMHY+qn/O+MkIOrmzvBXgonmNP1MbpwfW6
         CyKM6Ho+YVNtwd2mN5YDwuye13wsC9bCVpHHnXHMG31VuhMIg0YmzzUb3qKKrLBSXBg0
         hs4g==
X-Forwarded-Encrypted: i=1; AJvYcCXNkKMsgV50KXIMR6TThbu2Q4k1MX6loMSLX/ltMGqf9CAj/Iapgq0brNcwsu9QpGDRkp/rMldD2qNhrSjg@vger.kernel.org
X-Gm-Message-State: AOJu0YwZmFnIGVAUrMvV1dMFaFX34Vu0L2TAjjbkyeiDJheMEHqg1YY+
	nI0TIyuwynIdDc5mKsqM97sw0F4ZhDRUJmpwnPcYIsp0OM7KTGwiYFbRoQDwPqBSmJZDHRPg5UQ
	tqX+sUuUdNaJFdL11F95NvH0kiASD/SlSnTuJQWsuE0vnZIS4qJt4PoiXt+fJPgIR14FEMue7PN
	7i
X-Gm-Gg: ASbGnctxvglVFEyE0X4Tszhd5rGugXIOEVAfx3MTrmcESDdDh6YrvENJRouYH8tzDUk
	v6YFa0TvND5HBvq2ts7SLugmtkMD59+nhbdSlz1zz6Y/ALviR0A6EtmUGIhYI1wGDkJrL4ET3fm
	DONgm7vV83yJ1a5JOoK/fFILNn05z+7vTKc65R1FYeaNLBZ/oFhCTThDp8HHubBPl6Hf7nPJbVB
	4G7Uk4snR8jvTrOrWgkeuj2ytvi1Q9PRrjNJOiLm7TjESaucfGKgI+7tCKAWbfpPwToHGO96Mlh
	fmMMJydcYtGlHxumD/zTVaMRFT+h8Bgn4KarNOgpN6Msku5p3/raLGSUjHa0WGzb+0WqU5uEaFw
	efEMER2SeiCzUvct/yifltVLHdxvTGIJBHYX6TiflK5DotRgLOUlUxVfQ+LKD9K1b63Ymv1e8kV
	EPBRevK8wYCcQi
X-Received: by 2002:a05:6214:483:b0:87f:fb1b:ef95 with SMTP id 6a1803df08f44-8802f2a1f70mr38215336d6.8.1761921998606;
        Fri, 31 Oct 2025 07:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi6GBRFMR5w7J7UxJRxg2+honWi0anDWZEWvntIfeGPZkEcmVDVsf45tO5pji3r2PVZfKHqA==
X-Received: by 2002:a05:622a:a6c5:b0:4ed:32d8:30d7 with SMTP id d75a77b69052e-4ed32d831cemr37045831cf.81.1761921987203;
        Fri, 31 Oct 2025 07:46:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb45ddsm4029761fa.15.2025.10.31.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:46:26 -0700 (PDT)
Date: Fri, 31 Oct 2025 16:46:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz,
        tiwai@suse.com, srini@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alexey.klimov@linaro.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-macro: complete sm6115 support
Message-ID: <dsgivtqhje3wnx2iuma3ngnq5kanmt6eautay57raf23vcxi2i@y5b3sg3mn5mh>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEzMyBTYWx0ZWRfX93ELbN5/Lv6y
 Mkjq8wxgwJ/zH085+LfGAT2Z+FA6iFTWcMQ6uhCEq97tuqT8AZTQWzF/BMtGwtmsA6OWwd2PqJJ
 P0YTKwqvrvMTWvZjdGeK91S6W8ojFey5uxQDO/uy6K61MjqRRozK8Ml9M7V19MnpPtRbpY/X2BX
 HANZ89ZAiMcSDNhCM2FgOv/SrP5zapNJiv3MVXOdnETAH2k5soMIbZRWKMvQ5BQaNzUqc4Eda6r
 iFed4tGSyTOS1xZzGSPgSgW5z+NoWiMGcRz6ZNXTI3Tv15A/Q1yJRgYwYynMdeswuWdDIo3PPD0
 umDolIRCgyFpaVE8LU+ToCJTMoRW+sGPEL7nyQPBoHIqlAo2qu75OigzyroxBv/F7hpP9q+q43P
 7JyxTJRFqeMoVnD/9Ct+kE8rmREm8Q==
X-Proofpoint-GUID: BaBhpRr9ZDnMBxZTEtVCGPvsrbLvuXXM
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904cbd1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zc_iMHaRStx1I2ifTa0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BaBhpRr9ZDnMBxZTEtVCGPvsrbLvuXXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310133

On Fri, Oct 31, 2025 at 12:06:57PM +0000, Srinivas Kandagatla wrote:
> This patch series fixes SM6115 lpass codec macro support and adding

Nit: adds

> missing dt-bindings to complete support for SM6115.
> 
> SM6115 lpass codec macro support is added partially and broken to some
> extent, Fix this broken support and add complete lpass macro support for
> this SoC.

What exactly is broken?

> 
> 
> Changes since v2:
> 	- fixed a wrong patch that was sent in v1.
> 
> Changes since v1:
> 	- cleaned up va-macro bindings for clock-names.
> 	- cleaned up va-macro codec driver to include soundwire reset
> 	  for sm6115
> 	- updated tx and rx codec driver and bindings to have a dedicated 
> 	compatible due to changes in number of clocks.
> 
> Srinivas Kandagatla (6):
>   ASoC: codecs: lpass-tx-macro: fix SM6115 support
>   ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
>   ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
>   ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
>   ASoC: codecs: lpass-va-macro: add SM6115 compatible
>   ASoC: codecs: lpass-rx-macro: add SM6115 compatible
> 
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 18 +++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 49 +++++++++++++------
>  sound/soc/codecs/lpass-rx-macro.c             |  3 ++
>  sound/soc/codecs/lpass-tx-macro.c             |  3 +-
>  sound/soc/codecs/lpass-va-macro.c             |  1 +
>  5 files changed, 59 insertions(+), 15 deletions(-)
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

