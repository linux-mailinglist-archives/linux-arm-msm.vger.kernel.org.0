Return-Path: <linux-arm-msm+bounces-79016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5789BC11685
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 21:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBCCA467599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 20:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA3631BCBD;
	Mon, 27 Oct 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="imLC85TG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF92E5B2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597398; cv=none; b=a+1YNXq7A5eGfIA8lB6KV2aG2ngTfmwzcRoY+o5fDoyeVKrvSNurF37imzUihKpQWv65ag8dpX0/fckhtPpIWmjA3mLnKLzsP5GeulQoHE2bIuVrdazdVjhlOcUmSrPfgeK5S2ge/y3ToBzN5Xq+GcguqXnh87V171TbJ8NHiW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597398; c=relaxed/simple;
	bh=/r2MfbgwYvoichm3JC/D/FFVTkLEq2beh9dnGy2yNG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvjw/oKkQx+YgsHQWvnadpDcAvf9tGAJ3e9COYVUGx6lOOp3ofDTyudNPJYVmFBMifdStAMy4uYVR9jhB4vdk1qBtWxD4nhZE7elvJZydJFDtdEPxG/T8FFBrFtCDYnbJBcwEb0Wbb36OeO3TD2XkuVp5M5A5SX28ItlGDhfuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=imLC85TG; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-44d9eca1d57so671530b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761597396; x=1762202196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=miYvjijH+yAVme5tPHTAIByBBOWcjgVoClU7HRgNuqk=;
        b=imLC85TG9Lf+kvx4n1uUtp6jTuFWoxZJx/oaIU1zbOs/Lvcra2Cam/pWIEj5Cn/QFM
         BnNxseLtp4ysettSwXYwhogXbmQvxz/f9m38A58g2CRE831ZZfuatoUTsfnYDr/hbW8L
         Gd+MF046NdmPvxiJargU+PGOGOrGzw6s3xIYzlYKdqbNwW4ienXEYJndgv7Vt9R+rk/z
         J5cF3jjR20eHcTHPIhcQ5S0j0N2/7CJgvcP9YUQMYjM2yW+VogjcvRJrRspUQzBkUT9k
         ISEpqSA8ComJL+Vx+AKPs1SMoqgn/pVAp+d1aZLr8UX+q6hdc/AiFALxacurdXUDgYxK
         CL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597396; x=1762202196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=miYvjijH+yAVme5tPHTAIByBBOWcjgVoClU7HRgNuqk=;
        b=CwkH2vu5YVAntSKBD2f5Hio+qqIQRwCx+Nko0KNyciweMFOh1uOeCpi0n6NjPXQE4d
         Cfex13xeHFRf6RPVW5fSEp7xxS9lmmPb0UT42Usgy0ASJgpVkzFFO3rNsBO9EW0+MwuN
         lAaCQa+yCjcuGZkb86CfjsDgqGxOJaUrGJtrhvR3pC/2bCOp/js+U//EV4dCYe4f1WkC
         V+EFep4+jU8KLIAPFw3CuaTNV1H0okPj70Nd5Ejzkpxh6xgx4fyqaj4ujNxCg6r3ZTNU
         Ugsvi6bsCTx5MY/kQyTvU2t5zjJ9DtdcIQTPBUXlLg8L/snV2oZFUFyHQ32/vx6f0YBE
         /8fg==
X-Gm-Message-State: AOJu0Yw96TW+gOBSE/p/c5RYQ9s90v4JIGYk+GCf+cp2+hVFqxvLI4T2
	H29oGGi2egN8V0ugTute2F8wLCdJKlMHBJvmJWDYAhnrmqurmRBsnj1TrqeRf44l+VU=
X-Gm-Gg: ASbGncvFYUWLqoyAIDBkzpKGGmRYW/4MP4yhK3ZOpSvREyIUWZFJ5oD4u9jvk7+SM2e
	ofLTV6pgNFeIMKt6TA8NQk48+fR/TcNfUcxQ93jZ6WTUWj2llhDpgCOEqlHrp9XKS0ovlSsDLrC
	eRuV/ycvi3TmvEsyfJNF/R0JgNMe3h3Unv/s8V5yGpkqUQLAZfYttXeRq+lVsaksYg+kGU2uOZY
	MgNn4r7SxWxSIC4EqCnBh5B8hAhpeWElQZ163TIRpSjDtsco8IlLAAQwZswRk5+l3tAAL9YI+14
	LavPgs/Rcqb7i2/fQsHnzP/AD5FKfd2UbZAL+PPDR/ijUW02VYfOJyqMvPJnN9/iOzG6F9tM/Nq
	oXMPx3lsggFB+IgdBzIY6F8gN/6NUnLOxZsHKmHfHg7uePGw7sLGSRe4ooqL1J5o5Ro0ySeEGFB
	wc6xsAuHVw7G+ndBLhOaaBPgwohdBZw3Ywx2/ydt57IavRG097Kg==
X-Google-Smtp-Source: AGHT+IG9JEEg1mNWi+tFl2h+MpCVt+cH7Rf89qYUiLcNyweFqHAapC6agRl2IVJ0aTJuqK1Md9c7Ew==
X-Received: by 2002:a05:6808:1a09:b0:442:e596:1189 with SMTP id 5614622812f47-44f6bb3e516mr563791b6e.45.1761597395041;
        Mon, 27 Oct 2025 13:36:35 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:46d5:c880:64c8:f854? ([2600:8803:e7e4:500:46d5:c880:64c8:f854])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-44da3e48249sm2013281b6e.5.2025.10.27.13.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 13:36:34 -0700 (PDT)
Message-ID: <506feaa8-5808-48d4-8cc7-baadd8f43976@baylibre.com>
Date: Mon, 27 Oct 2025 15:36:33 -0500
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
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028-pm8xxx-xoadc-fix-v1-0-b000e1036e41@smankusors.com>
 <20251028-pm8xxx-xoadc-fix-v1-2-b000e1036e41@smankusors.com>
 <0eea7e4c-ec3b-421c-8522-aa3f52b5cb13@baylibre.com>
 <003c5cf7-2498-4ff3-a8b4-2911941b1464@smankusors.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <003c5cf7-2498-4ff3-a8b4-2911941b1464@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/25 2:53 PM, Antony Kurniawan Soemardi wrote:
> On 10/28/2025 1:35 AM, David Lechner wrote:
>> On 10/27/25 12:29 PM, Antony Kurniawan Soemardi wrote:
>>> On msm8960 phones, the XOADC driver was using incorrect calibration
>>> values:
>>> absolute calibration dx = 625000 uV, dy = 4 units
>>> ratiometric calibration dx = 1800, dy = -29041 units
>>>
>>> As a result, reading from the IIO bus returned unexpected results:
>>> in_voltage_7 (USB_VBUS): 0
>>> in_voltage_10 (125V): 0
>>>
>>> The issue was caused by not setting the ratiometric scale (amux_ip_rsv)
>>> from the predefined channels. Additionally, the downstream code always
>> Mentioning downstream kernels is usually a red flag. :-)
>>
>> We can justify it here though by saying that there is no documentation
>> available other than downstream source code, so we are just using it
>> as a reference.
> ah ok, rewording needed then
>>> set the ADC_ARB_USRP_DIG_PARAM register to PM8XXX_ADC_ARB_ANA_DIG [1].
>>> That value does not include the SEL_SHIFT0 and SEL_SHIFT1 bits. Enabling
>>> those bits caused calibration errors too, so they were removed.
>>>
>>> With these fixes, calibration now uses the correct values:
>>> absolute calibration dx = 625000 uV, dy = 6307 units
>>> ratiometric calibration dx = 1800, dy = 18249 units
>>>
>>> Reading from the IIO bus now returns expected results:
>>> in_voltage_7 (USB_VBUS): 4973836
>>> in_voltage_10 (125V): 1249405
>> Would be useful to mention which hardware you tested with in case
>> it turns out that there is some other hardware that does require the
>> SHIFT0/1 bits to be set.
> I did mention Sony Xperia SP from cover letter, but I haven't
> referenced it in this commit yet. Also I tried to search on Github for
> SHIFT0/1 bits, but couldn't find any usage of them...
>>> [1] https://github.com/LineageOS/android_kernel_sony_msm8960t/blob/93319b1e5aa343ec1c1aabcb028c5e88c7df7c01/drivers/hwmon/pm8xxx-adc.c#L407-L408
>>>
>> Since this is a fix, it should have a Fixes: tag. And it sounds like
>> possibly two separate fixes. In that case, it should be two separate
>> patches.
> Fixes into 63c3ecd946d4ae2879ec0d8c6dcb90132a74d831?

The correct format is:

Fixes: 63c3ecd946d4 ("iio: adc: add a driver for Qualcomm PM8xxx HK/XOADC")

See: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

>>> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
>>> ---
>>>   drivers/iio/adc/qcom-pm8xxx-xoadc.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
>>> index 8555f34036fb13c41ac720dc02c1dc39876e9198..a53d361456ec36b66d258041877bd96ab37838c4 100644
>>> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
>>> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c
>>> @@ -503,10 +503,11 @@ static int pm8xxx_read_channel_rsv(struct pm8xxx_xoadc *adc,
>>>           goto unlock;
>>>         /* Decimation factor */
>>> -    ret = regmap_write(adc->map, ADC_ARB_USRP_DIG_PARAM,
>>> -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT0 |
>>> -               ADC_ARB_USRP_DIG_PARAM_SEL_SHIFT1 |
>>> -               ch->decimation << ADC_DIG_PARAM_DEC_SHIFT);
>>> +    ret = regmap_update_bits(adc->map,
>>> +                 ADC_ARB_USRP_DIG_PARAM,
>>> +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE0 |
>>> +                 ADC_ARB_USRP_DIG_PARAM_DEC_RATE1,
>>> +                 ch->decimation << ADC_DIG_PARAM_DEC_SHIFT);
>> As a follow-up patch, it would be nice to update the driver to use FIELD_PREP().
>>
>> I.e. remove ADC_ARB_USRP_DIG_PARAM_DEC_RATE0, ADC_ARB_USRP_DIG_PARAM_DEC_RATE1
>> and ADC_DIG_PARAM_DEC_SHIFT macros and replace them with one macro:
>>
>> #define ADC_ARB_USRP_DIG_PARAM_DEC_RATE        GENMASK(6, 5)
>>
>> Then use it like:
>>
>>     ret = regmap_update_bits(adc->map,
>>                  ADC_ARB_USRP_DIG_PARAM,
>>                  ADC_ARB_USRP_DIG_PARAM_DEC_RATE,
>>                  FIELD_PREP(ADC_ARB_USRP_DIG_PARAM_DEC_RATE,
>>                         ch->decimation));
>>
>> This should be done for all of the similar multi-bit fields.
> as a follow up patch, you mean next version of this patch series, or
> separate patch series?

Either way is fine. It's just a "nice to have" change.

>>>       if (ret)
>>>           goto unlock;
>>>   @@ -783,6 +784,7 @@ static int pm8xxx_xoadc_parse_channel(struct device *dev,
>>>       ch->calibration = VADC_CALIB_ABSOLUTE;
>>>       /* Everyone seems to use default ("type 2") decimation */
>>>       ch->decimation = VADC_DEF_DECIMATION;
>>> +    ch->amux_ip_rsv = hwchan->amux_ip_rsv;
>>>         if (!fwnode_property_read_u32(fwnode, "qcom,ratiometric", &rsv)) {
>>>           ch->calibration = VADC_CALIB_RATIOMETRIC;
>>>
> 


