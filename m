Return-Path: <linux-arm-msm+bounces-74488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511DB941A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 05:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BE3E7A5D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 03:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9B32594BD;
	Tue, 23 Sep 2025 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlR3cQxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33A10F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597983; cv=none; b=dazXEUXqK8UuLNnm1uZr8YiSCdKAmqTuw68Uf8VdMa4UCPSaGU1DOgeFPRRfNA28p32O5K/3norPrZjnNsTQL42YyLT3ksAE+iOqhCqCyfQo933g5k0iCLPmxhBeQR/pv6x2w1BNS/Kukae3pFrazzBQCDDeWel8hfN5PCNznUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597983; c=relaxed/simple;
	bh=/9okwRIp4AGyHNqa6uQ0KAc8kzAsFvI6jPY28fzJH5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDYqtDd0qzbxFXm8mIR3gG7wkTTeeN4EWpGtdyS2wpMhGfaQJz4AAgo6bT9sn0X21J5IBD/laI9jJOkcjwd4nz6LTzM3DvCV/uuX5mgRxEmG5AS7+Rx0Vu2YsIBLcZyEfyXQzbPGqf+sj3IZNpx+/jANW+lRFgBsEHsBARgsGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlR3cQxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MIjTtf022699
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3GWnZoDTq3sp/K2/e/shKmR
	rtysWnVz2jKe17D2uyM=; b=VlR3cQxdPlnuEF5mkZX+P72kr4YNH4WDaB9XC1Qo
	bAN8xNhhz5t+aHGfs4Mk2mMkHLuPmaUxu1R0HMdWoemoXDTP/nnPiFSh3NdzGQp8
	H+EO7hSdqiGKKaawM+jd9Bx0AOETSHA09WawaBmm0inDYLh9wIn2QnuwSGmx3xpt
	3BTQThiRcXApKYW/dmw/YlsRRvF6xJ/pF2HP0Q7tAVANM6SN7eu1u919ehGrjsUI
	IeHCdu8Po3+yUQJrU4OsG77Lp4I3NnlfXH6TN9QwhlOPBqIZEb/+ogkuqiJHwnFv
	1NmhK8j86qCE0iNNgdzT0X2/NZy/HUDd+Q6Vgo+mU/kDHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyas1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 03:26:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-718cb6230afso96475186d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597978; x=1759202778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3GWnZoDTq3sp/K2/e/shKmRrtysWnVz2jKe17D2uyM=;
        b=Sx5aHj1Oan83W8F4RFhOevjTwyyGb8MyXPprm8K5QznAjIzQyw0kgu3mXPqO0DoRLu
         wo9S+9Etz2PkA/Bq9zm8YkEksdlwMWOhfQVxWTcSox1asgoWz3hbonp7eFdwFCLNrGhg
         UfGbuYMAh2F4ZmZTo5qQnmR0AkOc4ZpbrOFAgKVOSj9ZfStr2aZHlirzNLJlLmH6Jh4m
         Nm5kEqiKVrfkdCjAoQTA2Jw+xWBlZiTLueSvTJ2qIBAVxrJ2aHigdvn9XmTIPr8Vtade
         1VJBxFXBgwR8n+NQprmKaRAmGd6pRoHzkYXxDaacYfbpX4xdxbTBtYFK9rP4lahtgMrv
         zdWw==
X-Forwarded-Encrypted: i=1; AJvYcCV+6maAMW0O7Ka0HYrcb0qmdi1XDc0yWROylm5NW/jUJQuAU0KPtYb2Av9c3dndOiYNyN7OCixHDxEywaAc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/QJHjThQRoS/86erKs5NZ8Li7dMZCDagkZyiIIbz45IcoinL
	5ZXm85U1m04PJG4JQ0JGdVbt8Kl/y0SML6nHAnsW6SEWMszm+BsPiJRBY3Bp5Iv8mCFDaUly3oU
	eFZ7/au2f6F6laAVk0E4bti3pMGAMXwk7dIeFPCGx/BEEk4hV6vSAuK9WMmf3xe/Q4vBf
X-Gm-Gg: ASbGncsV/UI1wxzuEU622y20XQ7K92Ozq2Yx2eUXc5nB3Eaf0lLime1WfiCENIfRMcV
	cR/C25Zn1CQjZQAP8d/NfGbEfVDhn7zspXDwWlTLvx2ehnbljBjhO98Pum8MtkMyPLPzf8n2zUy
	bNqrq+7uzw50TrvX2yDZLReNyHW1AWJ26epSpC9wZVRzQkq0dBce39oOrQK8fcFOLdwFtE95xTP
	uC9CDfd6EoreboxP7S2EXu5NZEdxScUDZlfh597cxJehyN1pvKbx3F0T9Rvg7UHeAI3dFreuAV4
	kax9k4bsOnxWamGOqG9EkIoFEFmIKJHgzSDgxlIYCSq0+Nh9jSInjOJAgJpMxoQYoANPvoIIy/N
	47pEWXOFSmSIpDm6Xz6sTqN5lrGXHfhyKEfwkJpGi151J6Q2ecZSA
X-Received: by 2002:a05:6214:5184:b0:7a2:7dd5:a529 with SMTP id 6a1803df08f44-7e715457b81mr13988576d6.32.1758597978285;
        Mon, 22 Sep 2025 20:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCyCVOG3I8IOeAlxq627lGyS4LI/Q55RrD7NxcdRqumGitid3wdqGpVNnvz0boAGvkOcRioQ==
X-Received: by 2002:a05:6214:5184:b0:7a2:7dd5:a529 with SMTP id 6a1803df08f44-7e715457b81mr13988316d6.32.1758597977705;
        Mon, 22 Sep 2025 20:26:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a9a81f52asm2683912e87.124.2025.09.22.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:26:16 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:26:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: wcd934x: fix error handling in
 wcd934x_codec_parse_data()
Message-ID: <unqzejlsp6emzja5ry32smzlinntodgbioyojr5osiqddh2ppi@mtf4e7y4cids>
References: <20250923023828.36647-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923023828.36647-1-make24@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d2135b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=dSz2rv1DY3fttFFokb4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: zdsUMWE7Vs0lix27vnVF66pOL8XWsKvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX3TOx9v2hhIG5
 yRPO1zkfy0CUAQv3b0JErMxhpYnauG5veAGbHHtxW7oeHz/H23GMVnfHnUS0bjAbg+/IhKfzhiW
 PfYAvoNHTbckm/X3by6cfjTWz1JdBULBvAe1wW1QgTI9t5qL86a2Jp0BAWr3DAdHeNDQGxlG7Wv
 zIvcJYBwxO3ENvVjzlC7ED9JjGWG+NJa/zFL/w8MP6etHco74kz3HrKkztaCG4wJ/wfro8CMjAn
 yGgBygMH/NhPNONJs41dlhSbv1KPdm0NB5mxSe1r9H227j2hpkkMG5B6WYQ9YUG4eabyls5cKam
 Cz3FmUK/gM9/VPkQEBpMv5+fvTC1pN+I2AHoXWMGXzttDDDDZ/P8KwJPOKjTPEPgVZJkb5ut4mD
 AKz/TmLx
X-Proofpoint-ORIG-GUID: zdsUMWE7Vs0lix27vnVF66pOL8XWsKvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

On Tue, Sep 23, 2025 at 10:38:28AM +0800, Ma Ke wrote:
> wcd934x_codec_parse_data() contains a device reference count leak in
> of_slim_get_device() where device_find_child() increases the reference
> count of the device but this reference is not properly decreased in
> the success path. Add put_device() in wcd934x_codec_parse_data() and
> add devm_add_action_or_reset() in the probe function, which ensures
> that the reference count of the device is correctly managed.
> 
> Memory leak in regmap_init_slimbus() as the allocated regmap is not
> released when the device is removed. Using devm_regmap_init_slimbus()
> instead of regmap_init_slimbus() to ensure automatic regmap cleanup on
> device removal.
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
> Changes in v3:
> - added a wrapper function due to the warning report from kernel test robot;
> Changes in v2:
> - modified the handling in the success path and fixed the memory leak for regmap as suggestions.
> ---
>  sound/soc/codecs/wcd934x.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1bb7e1dc7e6b..d9d8cf64977a 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -5831,6 +5831,15 @@ static const struct snd_soc_component_driver wcd934x_component_drv = {
>  	.endianness = 1,
>  };
>  
> +static void wcd934x_put_device_action(void *data)
> +{
> +	struct device *dev = data;
> +
> +	if (dev) {

Can it be NULL here? Can put_device() cope with NULL being passed to it?

> +		put_device(dev);
> +	}
> +}
> +
>  static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  {
>  	struct device *dev = &wcd->sdev->dev;
> @@ -5847,11 +5856,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
>  		return dev_err_probe(dev, -EINVAL, "Unable to get SLIM Interface device\n");
>  
>  	slim_get_logical_addr(wcd->sidev);
> -	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
> +	wcd->if_regmap = devm_regmap_init_slimbus(wcd->sidev,
>  				  &wcd934x_ifc_regmap_config);
> -	if (IS_ERR(wcd->if_regmap))
> +	if (IS_ERR(wcd->if_regmap)) {
> +		put_device(&wcd->sidev->dev);
>  		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>  				     "Failed to allocate ifc register map\n");
> +	}
>  
>  	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
>  			     &wcd->dmic_sample_rate);
> @@ -5893,6 +5904,10 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = devm_add_action_or_reset(dev, wcd934x_put_device_action, &wcd->sidev->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* set default rate 9P6MHz */
>  	regmap_update_bits(wcd->regmap, WCD934X_CODEC_RPM_CLK_MCLK_CFG,
>  			   WCD934X_CODEC_RPM_CLK_MCLK_CFG_MCLK_MASK,
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

