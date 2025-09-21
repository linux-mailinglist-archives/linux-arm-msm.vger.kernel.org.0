Return-Path: <linux-arm-msm+bounces-74343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7180B8DA66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918933BBC7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 11:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E492C11C9;
	Sun, 21 Sep 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nimsq3Nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7025A2C0F7D
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758455033; cv=none; b=MrVX73/HZ2UBDdrcwyz//iFwa2CHKZZGbPdYdLBAw+yPe/JtvzRFNQJO7jpFiENteAvAGPMJ3WLplnya0mJNuJ46rrpXSclxyiKoHC7nUO8BsTpgOhB2wjDRjmJnMf7T+9hLNKjAuxU3Amdd3Eo80EApXRkAomyY4X0MPin8LJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758455033; c=relaxed/simple;
	bh=+Pn/OVfTwdSSSOXNeOm06iGQ/roCwDtZwhhSb17LvI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5nt1Xj3xgmERN+dEcxqZz8iEnPwVL3SU8umk1sIv26w/bFLKJZUKo5Rpu7O6LlntNOmq8WAYpQqVwXs9Tv5ZT5yDKPvS3B1W1GmlUL5UyTElymS0pfigcAIH10HmsO3OSINeV2fl+hG82wHSyy3CNKYoV6KqvHGANCYlULh6+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nimsq3Nc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L9sGS3009293
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 11:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2tz38OrlUOeLMiW/V6pVbFqi
	MiAYEhH1+bQDPLCltYU=; b=Nimsq3NcjCR1Np9YlKps0K9TPHI6pZtKpJKVIutE
	AfHwOLN0/u/XjtyWYsHtAFIf+lEBdJnDX4pjqBrjW1cch+9U+ldIxOkJTLFLuOzT
	KO9B4GljHXJnEbhyJnc+fImVzdzktygSlkTfGyqBqRQA3jQ+tkfi4NSL8TXiBYeh
	KNayi9ZX3m53EEqwfUVLebk/3o8jFkcYvnSR7Dk/hObwqZtsbLASek3AvVlnC13d
	z4zpcb3Ks8ZwRgBYpn/UR6pEaD3gJixdL60gQunqKbpR1X/yDh9jeTr5roCFhzg0
	3LMe//iuWciUS+hDqeuVah4M3L+R+3xoPrYiBeBldpXIrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0t4st-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 11:43:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b78fb75a97so39279611cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 04:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758455023; x=1759059823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tz38OrlUOeLMiW/V6pVbFqiMiAYEhH1+bQDPLCltYU=;
        b=LypbOE+ehbMRW6jrr7l4mCVGsiGkKsByaSWKDvaPQM+uDhO1TuqQ9NbI9Fd/iDcLHr
         RUbe+T8XF0lSxTMk4ghg6ADSjL9ud9rUxMdIpqozkJg9xJVLSfFrsK27XAvzp36u22mj
         +7/Q4PJJ3ih96noO+eqNQ1jPbqGOoQbXaja7ZajTQQedyR+qHhExztNJirSydp2Ihllu
         m/eC/p0hvoK3z2U2birSwV2IHVG1BxVKRbiB+UOf8CD/ZIJx4+IJCnFUoLBmk1CpSNcT
         EZHtTj4sOSXTHRtxPUv5ntUTU5dIUgl2YzMRj2mVPUmitvrbUYE8H9eu+PkAY3+6oSYP
         UYxw==
X-Forwarded-Encrypted: i=1; AJvYcCX/9DyYLmi6YPPInco5afLMq1y2ilLhUkCr8n8wmN8ejCh9fvydpbY0rAglZZgD5icFPMg/8ksfOI00/UFk@vger.kernel.org
X-Gm-Message-State: AOJu0YzydczpFo3Kr6DHhniwdHUHlOInl8qroLoo1rXKZmlenS7WsCSU
	Z2EJSuCBnhNVnqR+mDpyyq2MJQAaLDKIeYhXdTJj0tWBdzEKzVlqw62Il+QkWVttMGKJbqgnW+r
	OpzGcZXkZcP5r5e9UmjaVVQcEwJAeMDNV/7LEkC7tphGekqvjQ40YWGuCPD/qwY+dPGxaJltb8X
	w2
X-Gm-Gg: ASbGncvOzFh/fnjwuUpGcYJ3fWWLKV3hluOjo8GtYxWTqDoqVxdKsAQoKnyRXV8Hhxx
	qYu2I684GmMu+SeL1XaOCH8LNv3SkjlGYdOuZMx8MFjnCE7mcHu44T1pBIFIBmYuRuwE1D6uyot
	RFI+MbKMx3OSLG5L0C7bZQhFZ63UIEGShK63WuT4dbpsJRZn51pyHQANzZQq+Z7Q7+Jmsx8kX27
	1INCK2XcxxVDJyoCT9b/HvV40UpQ/Jxxugl6RlnjGgiA5/qjmq2+LK+Y7YQlfP7DurmHXsWaCsj
	2I3ah5DXWpNw9U/BFgJ1yXpLpqj07O35/J0YVW7h9DiRez44M0jtzS2ejS9iPGPVGNbfSIdMSa+
	ISDi9nA4ZkyomjAagKrkmsF64ztpijjgkQ+M1ShSlhIzvJC6EFzB7
X-Received: by 2002:a05:622a:289:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4c06f84409bmr97544661cf.24.1758455023257;
        Sun, 21 Sep 2025 04:43:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcgRW/31bOxLKwY8qsOfsclAMytFaKWAzuOnLefGy2cQabOY5f9ALQUf9IAhjpMBxBBPDADQ==
X-Received: by 2002:a05:622a:289:b0:4b7:9581:a211 with SMTP id d75a77b69052e-4c06f84409bmr97544541cf.24.1758455022788;
        Sun, 21 Sep 2025 04:43:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57c56d47591sm659763e87.50.2025.09.21.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 04:43:42 -0700 (PDT)
Date: Sun, 21 Sep 2025 14:43:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <lqgi66r4voh5z4p7mrjiulxvy6gky6mzn6rq2yresuhqfzsnt3@xcgvnxxd7qnq>
References: <20250921095927.28065-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921095927.28065-1-make24@iscas.ac.cn>
X-Proofpoint-GUID: RteOU_s9uq981pDT3g0Ag8STNnjiVBPg
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68cfe4f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=YRiNdvbt-P8spsNBmjsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX242ejDWk/xQk
 Qug8dkOTJMLYL5ajnedcR+NwMI66Tr8kyWfHUNOtK6/ISrMzMue4WjPfR0BfJC6Cv6/FGvoflJ5
 i+obyn/Swk13IDhFaWIySwzEjxBQkaOqIYEfPcvy135aiP8+mBUjsp5KEm78nT2gn69b/9gmg5i
 r4DbNS3f6G3mfT8NLjeB65EOnBRVYEnitEhJqUq6oxoNDV7XMhnJYmZJeuoeCZNYuPBP13PzTA2
 pvS7DijolQ1WL8ZYpAUsuV54FPX5ZnTw8maraFwx07cDw1aKfCL0vN7uoSSYuUaG6AJ8FFLlHHY
 CPKP/qiQ7M9JKl65v3p3hF+iz0QW6wedPWR5hvuZARa4RH060d7YYAD50atT0JHQXoWap5vEsHI
 5yblKpdj
X-Proofpoint-ORIG-GUID: RteOU_s9uq981pDT3g0Ag8STNnjiVBPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On Sun, Sep 21, 2025 at 05:59:27PM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data(),
> which ensures that the reference count of the device is correctly
> managed.
> 
> Calling path: of_slim_get_device() -> of_find_slim_device() ->
> device_find_child(). As comment of device_find_child() says, 'NOTE:
> you will need to drop the reference with put_device() after use.'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: a61f3b4f476e ("ASoC: wcd934x: add support to wcd9340/wcd9341 codec")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  sound/soc/codecs/wcd934x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1bb7e1dc7e6b..9ffa65329934 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -5849,10 +5849,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  	slim_get_logical_addr(wcd->sidev);
>  	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
>  				  &wcd934x_ifc_regmap_config);

regmap code doesn't increase refcount of the device, so we need to keep
the reference till the remove time. The code also leaks the memory for
regmap, so this code needs additional fixes anyway.

> -	if (IS_ERR(wcd->if_regmap))
> +	if (IS_ERR(wcd->if_regmap)) {
> +		put_device(&wcd->sidev->dev);

This call is correct

>  		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>  				     "Failed to allocate ifc register map\n");
> +	}
>  
> +	put_device(&wcd->sidev->dev);

But this one needs to be deferred until remove time (e.g. by using
devres)

>  	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
>  			     &wcd->dmic_sample_rate);
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

