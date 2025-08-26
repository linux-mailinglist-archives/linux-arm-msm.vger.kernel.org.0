Return-Path: <linux-arm-msm+bounces-70872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B1B3598A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01BCA2A6E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E31335BAA;
	Tue, 26 Aug 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BvIwaiB3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827C6322754
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202091; cv=none; b=Dghvj2MtsT9dCzKl8TjSnCYA6aeGPFxG5BLBiaGnD8k9T84QxVzgtOsGUFVm6c/jXE1NSplhr/EXrkI4cJL7TVz9AFTNQc9xcFB80LciGxbPwq6wo4B0LuBFY7jZ089qsjujmRpxnvwoME8ozwUlVCDqbetxHxI7/vbejNXBq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202091; c=relaxed/simple;
	bh=v7/kKb/3aDjXYCuij46PTFlucQHPMuyf1vHAbBKqwlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4S2WYFrgyB/CAKR2tw+Q/MORzR0wbRYHKBMwdREMA5vguc6MfvVzcn9/GnI6EpI3fMj4OlcGtr7BDv4PJLEUz2Cp/SrWD9LbMK0Rf8L9QnLxro4rkmYiwquVhxfpcXSBslBZaH18knFCVEiN265W4m/5FlXfm48iRfFeQuj8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BvIwaiB3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so30154655e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756202087; x=1756806887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUhR3N3wo9t0MMX9pMVCs5MuCLAFXYwayYcG32x3UPw=;
        b=BvIwaiB3ApraeEUVeqXAIpyuyBFeYNj86TAYXtwqr78zxhohzsfIJkkIC6IXIH6jhn
         zni831BZ8yaXlIiolqDxggqhv4qSOmSXnJ32a8GGB9A+6z6KbB6W7EM0z7OiXSl3ra6I
         gFnqvXy1e8dyEpZ9nwgsMG0GanBPLnoAcMUbZfvOu64gtezOJ1aqgxfnedMIEE9uX73k
         krDFpWjpUBNV6NoCxpFwrKU95QPLLIfnS+nQbJB1oCytzPFHitSTtthXU9I+OpPwwHwe
         VFNOEysSaLIaDOvFe8VStOfH6Ul6kRhJHm9tI8OSQ4oiaY6IEbcSnTHfhfHKXAcHqGOQ
         2NbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202087; x=1756806887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUhR3N3wo9t0MMX9pMVCs5MuCLAFXYwayYcG32x3UPw=;
        b=Mptef6om5vx6bimEy0ZMAkzBw49MMwwgT9jHuNHc3U2G/+ZtA7NMl+TjuNNw9LBE/V
         TheI6xv1Xcox6LjO7mMAPbjZe2s3JorjyXdfX/KfpjrNJau5fC5+5PDQqAU/fliQ1KCm
         9S6+HXOTDgnSoDEJe6fqKDvRgMVrVpwmnFP0bv5qguogIeHGMN0JdHX1SztNAnNZwYUc
         92f+VYovqTN831JWsDyg0+3H03zszkOKs2Fp4e/xO04iSszjg+d77wOMqAiRaNPN8yXc
         r9p4/Qaav+Rd+eWMDB2Je0ibSZTe8Bhg1+zd3T3AOUseCOZo73iA3NWaKXvEoY6Yi8Bd
         Xp7A==
X-Forwarded-Encrypted: i=1; AJvYcCXBJTYsMaaPvdMYH0aadBWJVGsGeimFZCA39hZr3aumf9J3qdH366xBNzaMAz2dPdkyThmFJ9jntWgyDW2W@vger.kernel.org
X-Gm-Message-State: AOJu0YzJR4UQHE1IecDS+yhBuDXLsRFf/IFQMd1fmJMUTnJgZNEf8cYG
	EvC3wRfL30OW+03PbUGBXNb56kZHmD80ZghyDHffsy6VycKMB7dtxPxM600Ci2hrTio=
X-Gm-Gg: ASbGncuiCtULRbW/kFPwEh4V6sgVs7BBIzuLHRuu5qE4PCt48GuExvdeb4ecNsesXb1
	rgHMWZWymRpzF1A91otWYJhUBqOGhQKJ+CRPC7/ZUZ0gbkF+XHqp0ghn/y7LUzmFZF3/d2gwF1K
	IZBiv+Ki9efXHxBJfsJRVrClxQST1nt4xqg2Wj2eC1zzp4CI25jvUt8qqZv5evSvhYhlYJutvHE
	MJVj4wYcipi9W0ojvC6K75HliElEBEwzdWfcn/sWuKVtGWZ6g28QRazptDgveEupxjRKKYs1t4d
	Tauj6dXHZNPamr9XEXWde5CYP28dGsPdlSPQirLlvjZw9k9AuBENpUnAolgToGJuFhp1xrOyNOf
	TLSDU8zNQyy5/uzxF+wUJ3Nbs7dY=
X-Google-Smtp-Source: AGHT+IG5d6hpblOKT6s7Wm3ZNawcMOjmqDBLGNn2fTe92R0dESnXpKCTH6m7G2x/JchotdGo9PM5Cw==
X-Received: by 2002:a05:600c:1c0f:b0:45b:6365:7957 with SMTP id 5b1f17b1804b1-45b68bc7a0bmr7707245e9.33.1756202086662;
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5744a587sm145919205e9.9.2025.08.26.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:54:46 -0700 (PDT)
Message-ID: <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Date: Tue, 26 Aug 2025 10:54:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
 <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
 <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/08/2025 10:39 am, Jie Gan wrote:
> 
> 
> On 8/26/2025 5:27 PM, James Clark wrote:
>>
>>
>> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>   3 files changed, 53 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>> index e827396a0fa1..8803158ba42f 100644
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
>>> index 9e623732d1e7..c5f169facc51 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
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
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EPERM;
>>> +
>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>> +    return sysfs_emit(buf, "%lx\n", val);
>>
>> Decimal would be better for a port number that goes from 0 - 127. If 
>> you really want to use hex then don't you need to prefix it with 0x? 
>> Otherwise you can't tell the difference between decimal 10 and hex 10, 
>> and it's not documented that it's hex either.
>>
> 
> Got it. I will fix the code here, and update the description in document.
> 
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
>>> +    /* The valid value ranges from 0 to 127 */
>>> +    if (val > 127)
>>> +        return -EINVAL;
>>> +
>>> +    guard(spinlock)(&drvdata->spinlock);
>>> +    if (!drvdata->csdev->refcnt)
>>> +        return -EPERM;
>>> +
>>> +    if (val) {
>>
>> If 0 - 127 are valid don't you want to write 0 too?
> 
> It's 1-127 here. 0 may leads to an unexpected issue here.
> 
> Thanks,
> Jie
> 

Then can't the above be this:

   /* The valid value ranges from 1 to 127 */
   if (val < 1 || val > 127)
     return -EINVAL;

But I'm wondering how you flush port 0?

Isn't the default value 0? So if you never write to port_flush_req then 
you'd flush port 0, but why can't you change it back to 0 after writing 
a different value?

>>
>>> +        CS_UNLOCK(drvdata->base);
>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>> +        CS_LOCK(drvdata->base);
>>> +    }
>>> +
>>> +    return size;
>>> +}
>>> +static DEVICE_ATTR_RW(port_flush_req);
>>> +
>>>   static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_trig_async_enable.attr,
>>>       &dev_attr_trig_flag_ts_enable.attr,
>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>       &dev_attr_freq_ts_enable.attr,
>>>       &dev_attr_global_flush_req.attr,
>>>       &dev_attr_cmbchan_mode.attr,
>>> +    &dev_attr_port_flush_req.attr,
>>>       NULL,
>>>   };
>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>> hwtracing/coresight/coresight-tpda.h
>>> index 00d146960d81..55a18d718357 100644
>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>> @@ -10,6 +10,7 @@
>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>   #define TPDA_FPID_CR        (0x084)
>>>   #define TPDA_SYNCR        (0x08C)
>>> +#define TPDA_FLUSH_CR        (0x090)
>>>   /* Cross trigger FREQ packets timestamp bit */
>>>   #define TPDA_CR_FREQTS        BIT(2)
>>
>>
> 


