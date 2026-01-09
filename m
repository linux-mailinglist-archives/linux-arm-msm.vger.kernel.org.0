Return-Path: <linux-arm-msm+bounces-88302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32716D0AE35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4DCA310B0F5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1945435BDBF;
	Fri,  9 Jan 2026 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1vshY+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+b4ReiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682462877FE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972166; cv=none; b=ImmCkRgCq8UcedY5Vzw0h8QA2eGZIFEt97NbxJZk6gHShoowyltrqRYOmOVzGW4hUwWvKXOdh+hUIred+TF/Q4LAH7ekckkcokaPpvNS8RA+SPZfjOyQss/OIALNZUNEDLw7Sq4yg4JVlVoVhrXmST3HLqzvMZ5RdHrx+dSAFpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972166; c=relaxed/simple;
	bh=o+et/fNt8Wz+GE9eL3g+M5s7u+FOMg1kGzNKpQmVSOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKV+Jxmq9dJFWnvzfTCAHGBq0GGlDwh/Xhrx5F7qHgXBniNOViOhOthnusjmEBqNUFcqUEFLOgbtkw7uCoB0Ix6ucL193latgxBQ2Zxmg/h7yJNGzqvWx9jS7aQgiIJnZTWeEzygeZGSYh3/ZeNuXfJGf/t4ekM5hNvrlind2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1vshY+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+b4ReiU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CsRLG3019775
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=loy0TPHhWcKiYp5c2ufkllth
	GFm2RkqaWI7+xw8R/rU=; b=h1vshY+CvQSI+rOUlkhgEwIKpwLR+icxlT7gduvW
	0M8H/54/hB/r7wMC41zh4aO9fO+1eb/tMQ5OIANvTXxq7xhFe2whnduCmRZBTecP
	RBKAhGadRt7GFOl2VCbIsoonq8VvDyXy+SrgLLJHe0v+CD2eudjDrCgRm0qlKSPh
	4emMfcto8Fhfr/rCu3ZMHVy3IrA/bgAzheobDItn8phc1p2zr5vji1+TItQZOU/p
	/ynGDEzhH6YdI1/iA92Yr4PgI8TcftzXv0t3+blWfMKnefpfRu5Gq/4A2d5ScKCT
	1DC+Kc8G2EklaVyW0bNwvku+QddAi7Uny45Q3v1gSl50Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3k5uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:22:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb6a7fea4dso1011392185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972161; x=1768576961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=loy0TPHhWcKiYp5c2ufkllthGFm2RkqaWI7+xw8R/rU=;
        b=N+b4ReiUWc6D/OGAyEEalbNLjaGAPl8fUKmAwa1c/oH5NUziAc+SeewR5ubs4SBbHu
         ILv+ApQpldGsuYT4Ui59iK+xJzdzmPqj6tx4Lne0XwTYIe0k6vwaRZ0trHUG4Awink2p
         YbvK0VIT+3aTWMdlxfJtxpSHYnDUAWSODIGjEg1MT6hEAVvFMNxpXJ6AIyYKq9nOTJAY
         NtFirBOZdKrPCx/XQRzycCFqgmtlyqh797txzMbe25wH9J0etkMCAOP9rUlDZQx2fWEz
         Cq3GAucsHR7HsTxatmxOg81+9zywg2F4VNm5EPqd5xCZekupyg+KAmVG7AoZ7KVi8Q8u
         AFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972161; x=1768576961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loy0TPHhWcKiYp5c2ufkllthGFm2RkqaWI7+xw8R/rU=;
        b=NEv1iE+lMJakV/FVlSq44RX8s1jHxdcK3I9STJ+88Ep2FBaTBTHL5TQ5HjkJWc7U66
         qqXzizQPAvkOv6zLpwpCSkaC+Pb+6fINTUZO4q8z3h+yLBJiewR1dieC1rWkyWoRKtkR
         eMYXjCRdAz8LiI2qnBpvggMVJwkNPdg0iEf/AoCUtq8mAX63gK7B3P4ojV4EatEJ6VzW
         iuErj19sihyBj4mAm5Z/Y6w9SGsA4DcwJmUqD65jxGbrY6Awm3PsZquey4SsyoV31rU0
         +a73MXSULDZUDIsyX+r/x5yHhdYk8uMv/8M8rW8RYPNSEyk9WcsTttTZDZrzfvxtjFx+
         MFdw==
X-Forwarded-Encrypted: i=1; AJvYcCV3eUaPseT9WedSz0GRL4tjhGGv0/QFNkhPA8MOykjLydSM5y2n4ErZTQgjE014LWTZ3k0dHPqhYtOPrAAO@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjWC9vOcLH7FhFJWBcmhoUZLKdTOHULjSjT8Rh8Kr/8FL+Jic
	lA88M29QHkxtoPeoNOGlLeAH2lwfqlr+7c2il6o+rEHOvtHdZx2anTsldox+kKnzqpXZxbAKJEL
	m3gynPNFcmjb6jMyiraaiCQu37mOaT/jUw/fCp4gCOQnZD9XG5XZTpQm8osxlQGq9GeZT
X-Gm-Gg: AY/fxX4xm9rwSN20dIX5dDsb1hcpg4CEUOiljR42NpnrWhZyYYnjI3MbhY2FGoJqLqQ
	2SaqXDT0E3advlatmJccMDMFi9W+b0T5picEmRFyZC9Ydia7OCHHFtUjyLLzmn3TPoLdLc0wIpJ
	O2WTKFuOws4lxo0z7hZOflwN3rg/gYreC/Mh0/Hh7o9KjGVx0e54Ejm5atFB2dT6oNiYvury0Gm
	p3ec6hs8dNHa5y62dgpu2W2vpIiM37zihKS6k77zTvUuIfMUjBxgjcwS8/vi7IuR97LYiaDJb4E
	wSzwyy6utpQvMjOQaTNCcT4or1IJEFblONqVCLuIgTUhw9/8a8w2Y3qWJlP1s9V+gkFHgJs6V+h
	wtR6joHQmFC6K1AYk1ds3GFp1p1iuk3y6DMYCW6zjpRsM8QnomH+JeDq2W/ZGyevXglEkpfClj+
	rFTcC7ZqW3mgHIuWo3GvLiZJY=
X-Received: by 2002:a05:620a:172c:b0:8b2:ef6c:802f with SMTP id af79cd13be357-8c3893f7e3bmr1563023185a.59.1767972161044;
        Fri, 09 Jan 2026 07:22:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEW8cHslVnozbH0FQY7+gVXqiAda7H7WnZddF0wYfrOU+UFBSmBPwML6d/rabRKq5TRaZB9w==
X-Received: by 2002:a05:620a:172c:b0:8b2:ef6c:802f with SMTP id af79cd13be357-8c3893f7e3bmr1563016785a.59.1767972160509;
        Fri, 09 Jan 2026 07:22:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d86bsm2870638e87.23.2026.01.09.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:22:39 -0800 (PST)
Date: Fri, 9 Jan 2026 17:22:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
Message-ID: <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _6apMmhtP0rOrSOqdagA10JQej-u-4AQ
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=69611d42 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ss2zht_kmVFDEoSxsDsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: _6apMmhtP0rOrSOqdagA10JQej-u-4AQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNCBTYWx0ZWRfX3TI7uxfKPjK8
 c9uLOy/0EJlj64h8AwJeUPLtTvrKtITENi70b0vmu8QPLr5OFMKSWaDXSW3A2YW/EC04XCw0mwA
 3DKrOO9fMfEOZlhLxOMOEltOU/lMVBv3m7WgQSJ0ekfrmaTdrh967/Uh0yKaqVkGjZV9Rzyscoo
 7gUB9M1iI8ta3oT8Hsy3e+/ij1DiyeBG0gJIAPrpOgs4YiUkBuRXvhH6m5/S3dtAwe4Dj9lTtuG
 aDb4Hz2qf9eXTIkI494xtX4LtnuROTP3EMne83xlLXy6EJdJl/tz6mF8SKumOtWYdhYpMAJ30EK
 1MM1u1Zweg6Ra8ebT2n82J2QhlFWYxMySFE3HaKqE3gR/dOs2UXsZ/GR1FfwrCUB61khQkrf0E4
 EMdJBiHszJlXw7PdI7hail93xG22YMczm3hRqWWY1CLy0P62TGDEshJnAp83y5wG0ptejGFqsbR
 8f4oGjeJIu+kMWqjISg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090114

On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.

Ah, I see. dev_pm_set_rate(0) transforms to  _disable_opp_table(), which
doesn't do anything with clocks. I think we should have a call to
clk_disable_unprepare() before that and clk_prepare_enable() in the
resume path.

> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.
> 
> Fix this by setting the corresponding OPP corner during both power-on
> and power-off sequences to ensure proper alignment of rail voltage and
> clock frequency.
> 
> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

No empty lines between the tags. Also please cc stable.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  3 +++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0623f1dbed97..c31488335f2b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1306,9 +1306,14 @@ static int dpu_kms_init(struct drm_device *ddev)
>  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  	struct dev_pm_opp *opp;
>  	int ret = 0;
> -	unsigned long max_freq = ULONG_MAX;
> +	dpu_kms->max_freq = ULONG_MAX;
> +	dpu_kms->min_freq = 0;
>  
> -	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +	opp = dev_pm_opp_find_freq_floor(dev, &dpu_kms->max_freq);
> +	if (!IS_ERR(opp))
> +		dev_pm_opp_put(opp);
> +
> +	opp = dev_pm_opp_find_freq_ceil(dev, &dpu_kms->min_freq);
>  	if (!IS_ERR(opp))
>  		dev_pm_opp_put(opp);
>  
> @@ -1461,8 +1466,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>  	struct msm_drm_private *priv = platform_get_drvdata(pdev);
>  	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>  
> -	/* Drop the performance state vote */
> -	dev_pm_opp_set_rate(dev, 0);
> +	/* adjust the performance state vote to low performance state */
> +	dev_pm_opp_set_rate(dev, dpu_kms->min_freq);

Here min_freq is the minumum working frequency, which will keep it
ticking at a high frequency.  I think we are supposed to turn it off
(well, switch to XO). Would it be enough to swap these two lines
instead?

>  	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
>  
>  	for (i = 0; i < dpu_kms->num_paths; i++)
> @@ -1481,6 +1486,9 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  	struct drm_device *ddev;
>  
>  	ddev = dpu_kms->dev;
> +	/* adjust the performance state vote to high performance state */
> +	if (dpu_kms->max_freq != ULONG_MAX)
> +		dev_pm_opp_set_rate(dev, dpu_kms->max_freq);

This one should not be necessary, we should be setting the performance
point while comitting the DRM state.

>  
>  	rc = clk_bulk_prepare_enable(dpu_kms->num_clocks, dpu_kms->clocks);
>  	if (rc) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 993cf512f8c5..8d2595d8a5f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -92,6 +92,9 @@ struct dpu_kms {
>  	struct clk_bulk_data *clocks;
>  	size_t num_clocks;
>  
> +	unsigned long max_freq;
> +	unsigned long min_freq;
> +
>  	/* reference count bandwidth requests, so we know when we can
>  	 * release bandwidth.  Each atomic update increments, and frame-
>  	 * done event decrements.  Additionally, for video mode, the
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

