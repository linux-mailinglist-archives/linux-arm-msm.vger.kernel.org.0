Return-Path: <linux-arm-msm+bounces-70901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52FB36459
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C901BA6724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 13:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE11D2B2DA;
	Tue, 26 Aug 2025 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyQb0ys/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E3B321457
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214989; cv=none; b=PCsrNEFqbnzfCIWz6N3DbL2e1mjQsD6Aq4fcgTNOUBux9y0nmlGejGFPtDHIdbSm7KwuiEKMm3j+ZJHypK2qq6/l2vWsBLOmkhW0H2JmkAWibKa1Wbcp8AWRRO44Zs4yMyflMhflOK2c7VvHqpX47tDqi9Hx1CdDaxiBm175TUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214989; c=relaxed/simple;
	bh=R8gGeMSj6+L6lREPzS58a0gP0CzcwK9FgwuKD+f06vk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBB5gVUtDaajpKhBBCa9zk1M47OP4hef7/SJtmtMhCJR5U0L5Tz/HQBQ0lKtshK97Av0mXL4POXLojNiaK4O3sg/Qj5Rp6YETQaeUZtDpEt9QkBOjHzVebxNP6J0zpO2RvocVAw85HMsabheO8LRnEAAmFxHBT609Zm5Bx1ETX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyQb0ys/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3c763484ccdso1904715f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756214986; x=1756819786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvsKNDuUjmS0VQPWE4YtuWYyDveTbfCbdSn10meZI/Y=;
        b=eyQb0ys/F1PXu/k15hlzTLKbLwnu9gjaoUdarOZkpcuUokl6u6r/IeR40y+CzkP9m8
         SgUwTY7jjH+YBYSqq/RgH1158ljipgqP8tgzuhyDeXyUNRTLGjFnTuYVSB3XWrBTIc1l
         1hcCqsNc8p77H52LPc4VWZWhSvCvjwyuXbnkL26rJUxY+VZ7d9/fcUzd5cGVAWnCbiao
         ZBezj38IlugH+2CbyA5iJNueiVRnoLEpfFXF39S1xm5fGMIl2JAo7cy5JxBtSXMrVE8e
         8QJGZ7j7T2xWUDwwQWDcWVbdE0l3dj/yW2Kz39+cYBEewVwlCkeUnvNeDIZOVMLhxkCy
         i9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756214986; x=1756819786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvsKNDuUjmS0VQPWE4YtuWYyDveTbfCbdSn10meZI/Y=;
        b=VmtXvEjH2AxDjE2dE5Y1HOVTUuW0hYGEycu9OtjITX2nF/qnMe2qLnum5dje1pnrXz
         +2gsCaqdA/jYWAl6OeHy7EN1nJHj37iJpUOAtrJ92/TVtn//x6sWx67FuJEnZOFZGIBe
         wueA1z6pHBWsxUwv7f4p3vbSYEC5JzHd+vTbgc75D5S6iv2O29zMFbZFS+PhnybDETpz
         NKT4xTTIw0/YcX7daqHuwv9fDow2MyAwQwfjNolWn8BoLvyCcGcHiwi9fafcY2deNnMk
         OY0HYLmoz7tdhSeLLOh2NxouFWT/b1hWJ1UbwNFD9XwVDmcih2fppNzYga9ZKOhCqccK
         WkPA==
X-Forwarded-Encrypted: i=1; AJvYcCVuXi/hnHCz/RCzznUdlnJoU4GRT8Zhj5Bz1yHpZay22Qu8maOsTPasrh7HsyldBqfrzuPUhDEFQ7IaSQGV@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHUpy4HNT0kS8EJrnz6KdgDfAg0isum/4S576SFG3MiICw+aB
	ReCZSrNH0+MpJtnFYZpN5TzaIIMpTv8Uu26nodDctVg85CxR2M827StjohNH6JC0y0k=
X-Gm-Gg: ASbGncvRzSE/xHkEYmCwM7oL0IixBrxxro6jUMs/JPrNFluLff0jPVRkF/lMRzYZsr5
	YNc4m/3X9RpIS3BH7pUkhV1yV2eT5PJ2HELsOJHzoLUyHtMCbGdEQ4d/yB+rlRlgAA2JXhEUGp9
	MuDgFh9ov61SApbTGy5Y4U88HMLQP/pgNi8IcrJV/grQgG0vNIqVThofOJtn2jNMIEuIZumEZoP
	KZ1pVRlM88eN5EdvVNezuoOebFrRXM8xAeVYktuz/UL4rX7dNlA0/dbkPBZtsPoPUYH4vLZFL/a
	DCaD1hcouppUm9c+T+TLx951Zws4IqD1Ba3/hzw0d3i1QKpYO9t5Upkdez2z2yz7NGshRwBpaX2
	Kdre2PusSgXGJhskajhWsZNY+4YpHNZql9oQN2Q==
X-Google-Smtp-Source: AGHT+IFWuW9FaUNkD9tIPp6wuI6vkMWmS0zI4RdhCAvwYdRqkj87/TiU6ljHYOFki7P8Tlb1PHy0Gw==
X-Received: by 2002:a05:6000:2006:b0:3b7:885d:d2ec with SMTP id ffacd0b85a97d-3cbb15ca4c0mr1295584f8f.18.1756214985928;
        Tue, 26 Aug 2025 06:29:45 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm16175319f8f.47.2025.08.26.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:29:45 -0700 (PDT)
Message-ID: <8f3a1f75-3476-47e9-a8d6-f396939b3240@linaro.org>
Date: Tue, 26 Aug 2025 14:29:44 +0100
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
 <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
 <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/08/2025 1:11 pm, Jie Gan wrote:
> 
> 
> On 8/26/2025 5:54 PM, James Clark wrote:
>>
>>
>> On 26/08/2025 10:39 am, Jie Gan wrote:
>>>
>>>
>>> On 8/26/2025 5:27 PM, James Clark wrote:
>>>>
>>>>
>>>> On 26/08/2025 8:01 am, Jie Gan wrote:
>>>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>>
>>>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>>>> for port i, forcing the data to synchronize and be transmitted to the
>>>>> sink device.
>>>>>
>>>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 ++++++++++++++ 
>>>>> + ++++
>>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>>>   3 files changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> index e827396a0fa1..8803158ba42f 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>>>   Description:
>>>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>>>> ports.
>>>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>>>> channel pair marking mode.
>>>>> +
>>>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>>>> +Date:        August 2025
>>>>> +KernelVersion:    6.17
>>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> +Description:
>>>>> +        (RW) Configure the bit i to requests a flush operation of 
>>>>> port i on the TPDA.
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.c
>>>>> index 9e623732d1e7..c5f169facc51 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct 
>>>>> device *dev,
>>>>>   }
>>>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>>>> +static ssize_t port_flush_req_show(struct device *dev,
>>>>> +                   struct device_attribute *attr,
>>>>> +                   char *buf)
>>>>> +{
>>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>> +    unsigned long val;
>>>>> +
>>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>>> +    if (!drvdata->csdev->refcnt)
>>>>> +        return -EPERM;
>>>>> +
>>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>>
>>>> Decimal would be better for a port number that goes from 0 - 127. If 
>>>> you really want to use hex then don't you need to prefix it with 0x? 
>>>> Otherwise you can't tell the difference between decimal 10 and hex 
>>>> 10, and it's not documented that it's hex either.
>>>>
>>>
>>> Got it. I will fix the code here, and update the description in 
>>> document.
>>>
>>>>> +}
>>>>> +
>>>>> +static ssize_t port_flush_req_store(struct device *dev,
>>>>> +                    struct device_attribute *attr,
>>>>> +                    const char *buf,
>>>>> +                    size_t size)
>>>>> +{
>>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>>> +    unsigned long val;
>>>>> +
>>>>> +    if (kstrtoul(buf, 0, &val))
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    /* The valid value ranges from 0 to 127 */
>>>>> +    if (val > 127)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>>> +    if (!drvdata->csdev->refcnt)
>>>>> +        return -EPERM;
>>>>> +
>>>>> +    if (val) {
>>>>
>>>> If 0 - 127 are valid don't you want to write 0 too?
>>>
>>> It's 1-127 here. 0 may leads to an unexpected issue here.
>>>
>>> Thanks,
>>> Jie
>>>
>>
>> Then can't the above be this:
>>
>>    /* The valid value ranges from 1 to 127 */
>>    if (val < 1 || val > 127)
>>      return -EINVAL;
>>
>> But I'm wondering how you flush port 0?
>>
> 
> BIT(0) represents port 0 with value 1 and the default value 0 means 
> nothing will be triggered here.
> 
>> Isn't the default value 0? So if you never write to port_flush_req 
>> then you'd flush port 0, but why can't you change it back to 0 after 
>> writing a different value?
> 
> We can change the value back to 0 but I think we shouldn't do this 
> although I haven't suffer issue after I changed it back to 0(for bit).
> Because the document mentioned: "Once set, the bit remains set until the 
> flush operation on port i completes and the bit then clears to 0". So I 
> think we should let the flush operation finish as expected and clear the 
> bit by itself? Or may suffer unexpected error when try to interrupt the 
> flush operation?
> 
> Thanks,
> Jie

Oh I see, I thought this was a port number, not a bit for each port. 
That changes this and my other comment about changing the output to be 
decimal then. Hex is probably better but it needs the 0x prefix.

I would also treat 0 as EINVAL. It doesn't do anything different to any 
other out of range request so it should be treated the same way.

Then comparing to 127 isn't that obvious either. Something like 
FIELD_FITS() more clearly states that values have to fit into a bitfield 
rather than be less than some value:

   if (!val || !FIELD_FIT(TPDA_FLUSH_CR_PORTNUM, val))
	return -EINVAL;


>   >>>
>>>>> +        CS_UNLOCK(drvdata->base);
>>>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>>> +        CS_LOCK(drvdata->base);
>>>>> +    }
>>>>> +
>>>>> +    return size;
>>>>> +}
>>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>>> +
>>>>>   static struct attribute *tpda_attrs[] = {
>>>>>       &dev_attr_trig_async_enable.attr,
>>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>>>       &dev_attr_freq_ts_enable.attr,
>>>>>       &dev_attr_global_flush_req.attr,
>>>>>       &dev_attr_cmbchan_mode.attr,
>>>>> +    &dev_attr_port_flush_req.attr,
>>>>>       NULL,
>>>>>   };
>>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/ 
>>>>> drivers/ hwtracing/coresight/coresight-tpda.h
>>>>> index 00d146960d81..55a18d718357 100644
>>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>>> @@ -10,6 +10,7 @@
>>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>>   #define TPDA_FPID_CR        (0x084)
>>>>>   #define TPDA_SYNCR        (0x08C)
>>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>>
>>>>
>>>
>>
>>
> 


