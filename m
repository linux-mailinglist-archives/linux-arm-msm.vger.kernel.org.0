Return-Path: <linux-arm-msm+bounces-79145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1CC13E45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E721A188EEE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EE72DA774;
	Tue, 28 Oct 2025 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iExINopB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80511221271
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761644660; cv=none; b=vA6dClb4hv1eiHyxi/sEixrp+n6ZOH5KhSN5x2Sh3BdPRx4zOu2ymb+XVSi/kwOEWtcC3cmgCPkcPcES3EpjbD+ds8cL8Gnsund6wB0soEaIyF4jXzcVd4DkgeXt9te474SAUTH90zJ6yfWGscKyRl8hctkeptxQnHupiULWrY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761644660; c=relaxed/simple;
	bh=7QdSCc3ghckTTATUxUHS06CaambC2oJeybgZ5vYyCds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hr1Tl7Hrpo5aDomZlS+fcKBgfU9VlEUvNUQL3QUmyhjR4a2Yclh3nCtzxrXXf1In17r5kEO/HJ5PZj6jkykJtJdjushN2CRiYRTBaMoEfuHTI00BjBCfnntZSiM6vF1IO199kkbJMluFH14X1c0T+nuNwNDklJFAT+4k9w9v0dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iExINopB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7SeKU3813894
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaeEsRLrplO4MaerwlgBvJVzq65FTCNVJ8CSSdZ4EPU=; b=iExINopBfH1xC/zj
	zi4nh4V/E/V4wImPUNlT/ZBgHgbxX8rgL9frFbQ56+TDqTqE4se8w/ymE5Vq8dv/
	l+9srRYT5tjfxU/XWEVC2ee2cXqTt4YgeVEIyaXznFXpvWRt1ULNb+GDHG6hy2fn
	TAVc3vMTCWRNqE19aDNMaidRUIKZtkf0bDx6ITkyUzIpOeR2KGQUzHbikw/MUTdY
	Mr8qs4l3Uapyr7ElB1/ZW5xDmszdyLEE8RuyXlpNVrM7/o/dcyUsmnGYnwQP5yjc
	c/HyvAn4mKVwUcG3QJEhUFM+/l/3JZSDafX46v3JSqEwDqD/XV4zaHWTOfrqXkec
	dcNl8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2fswm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:44:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c0e043c87so16963676d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644658; x=1762249458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaeEsRLrplO4MaerwlgBvJVzq65FTCNVJ8CSSdZ4EPU=;
        b=Jx9IEmNxNJ+GwG6j5hsSnusMwLvRg1vpw1/DJ5b++kKKJ/41WBcrSy0jfRUJli/uF1
         SM+Kz+0BDfs0g8GbMr/l1Q42x/+8rhbwJ8d9sede9pi7SPABEFVtiQPZQk3xu0QjZ3VQ
         Gp9sAc0qGw0ku4Qswbdmv86bU5M/NeMv4DbJY1h1JOaKWPTlTW6o+Xy98xcFAodjx/Nu
         6NstMnXsYoNTV/MQuFQohG4Zdho45Jy/asHVmYzU0PsYBp/VjZRhJ1CA2bkL+Ex92utn
         iQD52adB2m5gjc/J+ZvY7VrHXYgal08HDOre/WT6wyu9f1sK7RBajOixcdT5XeaVZiTD
         PRUA==
X-Gm-Message-State: AOJu0Yy00PNFdePhCNE4fYwAEAFOfRFJJvAf9e9Sjl88zrIH5i6lckor
	WiPc7mJlBx/X5X8mT4bpyRVvEINVAFPMOMHKGwcaoNQ077aukDr+ycEB+gp9d9xnnDedv9mAr4Z
	WP7zcCGaCAPEft9ofly00+W2Uu4vf0/P19rwvJ+auH+/5Z4NZn4SvbU4frN/EoO7XNZOP
X-Gm-Gg: ASbGnctOpWbeakRjf2jnRUbyw3s5TzZ8tB2b1l0TDzCwOSZJ+S0CtpqkOtxG8TFm/z0
	p9q1xrgkhlEXnm1q/jy4tJv2z7QynpK7g0IufcUpf0h2cMn/JVV6hhoUPqTtZZYVHeThkYvyebm
	9lXmcFaAOUzC810iCoKaW5Oc/YyWOHoEIKu56pLHluDxGsKidVq/xjNBlVsFIK+enyS/rctv58/
	8RxNX3mVtKaF9ItnlE1aBbrtIY3o+KLSo0UV/n+lbYpCZcfbJ1lyG1fTQMrtzmbt/20Y+E1xBtN
	BWKvCdRMs5dapyJV4SmXxw4fbuZYGygM4Or7WHWwlSQxeYbRGPz1FHOdcSzc1s8rPlLixKyWPT7
	Sk5bGl/wgj0ZTGQ+3cIwQfUD8teQhs9I8V6dEuaSRjFaNZyeW5mmgW0UP
X-Received: by 2002:a05:6214:1c8c:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87ffaed6fafmr22851526d6.0.1761644657672;
        Tue, 28 Oct 2025 02:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Qv7PHcmjyjQmOMGkJTFeywIqgyCGA5tiYOWaXPw2UiIkmKnkUlROizozxRcfdt+yrAEQfQ==
X-Received: by 2002:a05:6214:1c8c:b0:774:48fb:f8f2 with SMTP id 6a1803df08f44-87ffaed6fafmr22851386d6.0.1761644657197;
        Tue, 28 Oct 2025 02:44:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6bfd7sm8287323a12.4.2025.10.28.02.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:44:16 -0700 (PDT)
Message-ID: <7558d070-762c-4c81-aed7-1b087d131483@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:44:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: qcom-pm8xxx-xoadc: fix incorrect
 calibration values
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-pm8xxx-xoadc-fix-v1-0-b000e1036e41@smankusors.com>
 <20251028-pm8xxx-xoadc-fix-v1-2-b000e1036e41@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028-pm8xxx-xoadc-fix-v1-2-b000e1036e41@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4MiBTYWx0ZWRfXzFowT7jQ1dSS
 8FdOPWPIBPqAnP5u9blMI/+mcRtFL4wE2Vv8TQoEREIRNxqKH7Dx9nn+DSMOkfxHWqRSxnMcKNY
 zFen3aSF6tylFmPi2TFi2ooqPVixh7CPpCffEo4Amdoptc8gp6GEA/Mhr/zvJ6vWXjaND8yAo7T
 R6VlkHEVwgogGVdJUb0lBW37JBhKMe2X+qU4pDg5bu5LNtsOnzQ5br3+5QKB885ltPU1o2nsqaq
 yWveYEP9oZ9ZRrymcW2nq9ZhTpAHBdHm3cRffDTkRR7bNVkcLjyFO0M/cF3QqXMZXDFsvonLWkw
 fe0xDXWwu9QZENb8JfC4m7zJT3qA//GEa0tjM+pXHbpDcUQr415uJA5diPDVGlXvkxHlyST5Q6m
 x/VnxiQe5rVda+a7UNw8JfgQ6S7Cvg==
X-Proofpoint-ORIG-GUID: 8Q9wFNFGlIvVd0_QOsAgyruaa_GAM62E
X-Proofpoint-GUID: 8Q9wFNFGlIvVd0_QOsAgyruaa_GAM62E
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69009072 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=wxLWbCv9AAAA:8 a=QdeQeJuzzvJw2AYENUoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280082

On 10/27/25 6:29 PM, Antony Kurniawan Soemardi wrote:
> On msm8960 phones, the XOADC driver was using incorrect calibration
> values:
> absolute calibration dx = 625000 uV, dy = 4 units
> ratiometric calibration dx = 1800, dy = -29041 units
> 
> As a result, reading from the IIO bus returned unexpected results:
> in_voltage_7 (USB_VBUS): 0
> in_voltage_10 (125V): 0
> 
> The issue was caused by not setting the ratiometric scale (amux_ip_rsv)
> from the predefined channels. Additionally, the downstream code always
> set the ADC_ARB_USRP_DIG_PARAM register to PM8XXX_ADC_ARB_ANA_DIG [1].
> That value does not include the SEL_SHIFT0 and SEL_SHIFT1 bits. Enabling
> those bits caused calibration errors too, so they were removed.
> 
> With these fixes, calibration now uses the correct values:
> absolute calibration dx = 625000 uV, dy = 6307 units
> ratiometric calibration dx = 1800, dy = 18249 units
> 
> Reading from the IIO bus now returns expected results:
> in_voltage_7 (USB_VBUS): 4973836
> in_voltage_10 (125V): 1249405
> 
> [1] https://github.com/LineageOS/android_kernel_sony_msm8960t/blob/93319b1e5aa343ec1c1aabcb028c5e88c7df7c01/drivers/hwmon/pm8xxx-adc.c#L407-L408
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> index 8555f34036fb13c41ac720dc02c1dc39876e9198..a53d361456ec36b66d258041877bd96ab37838c4 100644
> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> @@ -503,10 +503,11 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
>  		goto unlock;
>  
>  	/* Decimation factor */
> -	ret = regmap_write(adc->map, ADC_ARB_USRP_DIG_PARAM,
> -			   ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT0 |
> -			   ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT1 |
> -			   ch->decimation << ADC_DIG_PARAM_DEC_SHIFT);
> +	ret = regmap_update_bits(adc->map,
> +				 ADC_ARB_USRP_DIG_PARAM,
> +				 ADC_ARB_USRP_DIG_PARAM_DEC_RATE0 |
> +				 ADC_ARB_USRP_DIG_PARAM_DEC_RATE1,

The PM8921 datasheet suggests a single valid value of BIT(5)=1, BIT(6)=0
for a "1K" (1/1024?) ratio, although a comment in this file suggests
BIT(5)|BIT(6) is also valid and corresponds to 1/4096.. I wouldn't be
surprised if that is the case

The previously set bits are a field called DECI_SEL but are otherwise left
undescribed

Hope this is useful

Konrad

