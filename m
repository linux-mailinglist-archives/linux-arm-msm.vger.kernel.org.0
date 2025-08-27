Return-Path: <linux-arm-msm+bounces-70998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74800B37FA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27FB2167D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F22C281508;
	Wed, 27 Aug 2025 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ir2shk5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334C227CCCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756289766; cv=none; b=sqKtAdtRyVhDOjb/wtKjZpWcKngteWbevYL+cBBcbOsf6xhhXm/ZBKFSp/7p3LRGotB4kgl56YgFPzA3QXd5x3xJeHoh6RzABEBoeaoADpR0giO9E9NXCoqzR0qgHgx4jWuzA+jpVKn17osD/28UMaKjXuKos3XDVZKCRemVJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756289766; c=relaxed/simple;
	bh=p3f+mzSQvuTAA6R9g1jc8HAhyKZCEh6wbqX6AbTopoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Px/nnZ1B0m8Rq0xc9lzDdFdIRi4oH5foa4BE+uLnwuD1/xsj/Y94b1Uks5Y3iL89jR+kRpLg+X0D8e8ndm7xtXKKKuXwkRt9uREIYsBpK5jSsdJYK6stBqzUzLz8J7oHnKMAzp+Skln6RLrqvgPHKvA83Tvo7gKbDCSco69sLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ir2shk5D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b629c8035so17808585e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 03:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756289762; x=1756894562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1Dw90QlXeLsOzAEqypsdzJHvGAD420d9Q1/z4Sh4TQ=;
        b=Ir2shk5DnE+4oG+zVjCO/nLW1lDjE7d5ZsoH3XyJNmyfrs8IHA96UOb39NLtWzRHqs
         eiuyptJ0j5yluaI+/vsZkkEcCShUBFjLZjzwFRy1WTeEmB/H0v38UBY/VzCPN6fIYsvC
         yqE4AOooyc519mF33tDhJQulvUjGi/bqkcnGYRYYzy+wMYW8/8kaMLLKE0WZYY7N719C
         lm0RtuDsuxCC/RpM3/2m08zEDpKP7TooA885s8BH9594gvBHDrVnoh8w5OcJ5R/i2E5e
         hAtGHIZJ39RCG6YQ0bOzVaZLQQzfPkjwZ/b++ixY51BTAjJSILzK1rdHtc00rOyO4tM4
         SYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289762; x=1756894562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Dw90QlXeLsOzAEqypsdzJHvGAD420d9Q1/z4Sh4TQ=;
        b=FEN3muedAsbDNmr7R8cPHKwbh7APZqOtH3l2JwVrEwnEeksgSTmM+++5BQnsbjEZs4
         AqiD8ZSw65S5g6hjnOMJmhwtbboKMs0NZE45kG0X1k+wUSY+CVxNykWbdf2EoCQ69Ii2
         YY/SVySihhzDzipYzLoJHNISOrhDNI3AR5zTWlmJvIaOVJUCnRJcBQ7SjpQBJ6q2oOg8
         FX9/EojXzLLgd3+y9jaRK069g8utet1Q1s2kBrDKSSSuiSBG64y/XqWfzYO1gSh/SwHv
         Ol/11+uvw0dKxn4Cc1O+EpnKeNcNCU12B03AUqTthecNx14N2ggCjrDiwWb+L+OX3jde
         FnuA==
X-Forwarded-Encrypted: i=1; AJvYcCVDbpLtmQKUFiC3SFhf68+ycrH920NM354OrwzF5b0fH8qjvhlgqhR3n/Ssvt0peWdzeWIW1RVsoQeSdrrX@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRvin86zmswaTMCs9CjNtmafEG4F0ZX84s3lJLp81fLTctfKT
	7pdybqnXB07etzJ3F/gu7WmTxdSHERsQhU8XUlOTintZ5LhslPh0l+ikC4yfmLlIAhc=
X-Gm-Gg: ASbGncvCl3sWuGaBKFhxmF6RbMChnTIN5y59vqfgTxiRVcMpIsqPmfW7sfCySwlp3uH
	y30rmOQ3a2vWSzNqAZE3V7vW2VhSY2/xOWsFyWpWB/7B0c2Ov41nv22cqmkmy+uMyaTiD8EC9Et
	094VZescA5nUw1AqACFwTL5WwSf40eNz+SV6WsXoJilK+zLYmCQUAkgftPvx++masZ5qgtg7HEQ
	WGkDeCgVNxEqkRnhi1hkkAxQxxlerjXifeqBcxalyGfXliB75du2lCw94KbtIzkBoqlaeJjS4AQ
	qvYoJhKFJK1aNMxV5NaQAfQyDboPAFs5mmbHnJ9RC+EuORGMDFi1QHHVSKuHi5/pWMwpjDrsVkG
	CaeHbyNuI5kGToN47m7xsKTkXATjzP8ByBDfNPA==
X-Google-Smtp-Source: AGHT+IGsDBxLcBzPHHU2PS5TGpLgmGzal6Fc/PpQk1ENqWTdXvkIRY9ehvzlf+vR27NlOBpNheomEw==
X-Received: by 2002:a05:600c:3149:b0:456:28f4:a576 with SMTP id 5b1f17b1804b1-45b517dd9a3mr143701635e9.27.1756289762374;
        Wed, 27 Aug 2025 03:16:02 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f4aa8a0sm24318175e9.12.2025.08.27.03.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 03:16:01 -0700 (PDT)
Message-ID: <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Date: Wed, 27 Aug 2025 11:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
 <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
 <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27/08/2025 10:48 am, Jie Gan wrote:
> 
> 
> On 8/27/2025 5:17 PM, James Clark wrote:
>>
>>
>> On 27/08/2025 5:20 am, Jie Gan wrote:
>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>
>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>> for port i, forcing the data to synchronize and be transmitted to the
>>> sink device.
>>>
>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>>   3 files changed, 51 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> index fb651aebeb31..2cf2dcfc13c8 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>   Description:
>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>> ports.
>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>> channel pair marking mode.
>>> +
>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>> +Date:        August 2025
>>> +KernelVersion:    6.17
>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>> +Description:
>>> +        (RW) Configure the bit i to requests a flush operation of 
>>> port i on the TPDA.
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.c
>>> index 430f76c559f2..8b1fe128881d 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>>> *dev,
>>>   }
>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>> +static ssize_t port_flush_req_show(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   char *buf)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +    return sysfs_emit(buf, "%lx\n", val);
>>
>> Still missing the 0x prefix
> 
> Will re-check rest of the codes and add prefix. Sorry I missed it during 
> the review process.
> 
>>
>>> +}
>>> +
>>> +static ssize_t port_flush_req_store(struct device *dev,
>>> +                    struct device_attribute *attr,
>>> +                    const char *buf,
>>> +                    size_t size)
>>> +{
>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>> +    unsigned long val;
>>> +
>>> +    if (kstrtoul(buf, 0, &val))
>>> +        return -EINVAL;
>>> +
>>> +    if (!drvdata->csdev->refcnt || !val)
>>> +        return -EINVAL;
>>> +
>>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
>>
>> Using FIELD_PREP() now that it's the full width of the register makes 
>> less sense. Especially when there is no corresponding FIELD_FIT() 
>> check,   which is fine because everything always fits. But if you 
>> didn't know the mask was the full width you'd wonder if the check is 
>> missing.
>>
>> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
>>
>> It should also have been val = FIELD_PREP(...)
> 
> Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
> mistake here..
> 
> I was thinking the unsigned long here could be 64 or 32 bits and we only 
> need the value of the lower 32 bits. So that's why I am using val = 
> FIELD_PREP(...) here. We shouldn't write a value greater than UINT32_MAX 
> to the register.
> 
> Thanks,
> Jie
> 

writel_relaxed() is always 32 bits though so it is a bit confusing if 
you truncate the user value without an error. Also a reason to use u32 
instead of unsigned long types.

Are you trying to support arm and arm64 with tpda? Or just arm64? For it 
to be consistent you can use kstrtou32(), or use kstrtoull() and then 
FIELD_FIT() to error on truncation. kstrtou32() is probably the cleanest.

>>
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    CS_UNLOCK(drvdata->base);
>>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>> +    CS_LOCK(drvdata->base);
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(port_flush_req);
>>> +
>>>   static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_trig_async_enable.attr,
>>>       &dev_attr_trig_flag_ts_enable.attr,
>>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_freq_ts_enable.attr,
>>>       &dev_attr_global_flush_req.attr,
>>>       &dev_attr_cmbchan_mode.attr,
>>> +    &dev_attr_port_flush_req.attr,
>>>       NULL,
>>>   };
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.h
>>> index 8e1b66115ad1..56d3ad293e46 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>> @@ -10,6 +10,7 @@
>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>   #define TPDA_FPID_CR        (0x084)
>>>   #define TPDA_SYNCR        (0x08C)
>>> +#define TPDA_FLUSH_CR        (0x090)
>>>   /* Cross trigger FREQ packets timestamp bit */
>>>   #define TPDA_CR_FREQTS        BIT(2)
>>> @@ -35,6 +36,7 @@
>>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>>   #define TPDA_MAX_INPORTS    32
>>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>>   /* Bits 6 ~ 12 is for atid value */
>>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>>
>>
> 


