Return-Path: <linux-arm-msm+bounces-7096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6382BD44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 10:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDC61F2676B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 09:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B3356B68;
	Fri, 12 Jan 2024 09:29:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B4B5EE68;
	Fri, 12 Jan 2024 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAFE01FB;
	Fri, 12 Jan 2024 01:30:04 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9833F64C;
	Fri, 12 Jan 2024 01:29:16 -0800 (PST)
Message-ID: <cf167f2c-b87b-4def-8efc-f9ff1cd49597@arm.com>
Date: Fri, 12 Jan 2024 09:29:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] coresight-tpdm: Add timestamp control register
 support for the CMB
Content-Language: en-US
To: Tao Zhang <quic_taozha@quicinc.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Mike Leach <mike.leach@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org
References: <1700533494-19276-1-git-send-email-quic_taozha@quicinc.com>
 <1700533494-19276-7-git-send-email-quic_taozha@quicinc.com>
 <ebd7e310-d1b4-4b2e-a915-6241e04763d4@arm.com>
 <b61c3d70-7277-4fe7-ab67-8afc1062c737@quicinc.com>
 <cdad425c-b965-44c7-a612-1c99341e95b9@arm.com>
 <b7ef4e75-69c6-4251-8f9c-58682699e3f6@quicinc.com>
 <cc7b83ec-2c97-4a5d-87a9-36f1e13d8fc4@arm.com>
 <797eadf6-2708-47ad-a61f-88bb0d4fcf28@quicinc.com>
 <4ae81e28-1791-4128-860f-eb6a83ea3742@arm.com>
 <616eba43-678c-4bc9-be7e-7b766e8d7c29@quicinc.com>
 <d449d8ce-d087-4e18-a35a-236daa82ae99@arm.com>
 <3cb948f9-2c62-4078-a936-3d7531ed5a2b@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <3cb948f9-2c62-4078-a936-3d7531ed5a2b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/01/2024 02:42, Tao Zhang wrote:
> 
> On 1/8/2024 6:42 PM, Suzuki K Poulose wrote:
>> On 05/01/2024 07:49, Tao Zhang wrote:
>>>
>>> On 12/30/2023 5:39 PM, Suzuki K Poulose wrote:
>>>> On 25/12/2023 01:55, Tao Zhang wrote:
>>>>>
>>>>> On 12/20/2023 7:07 PM, Suzuki K Poulose wrote:
>>>>>> On 20/12/2023 09:51, Tao Zhang wrote:
>>>>>>>
>>>>>>> On 12/19/2023 9:51 PM, Suzuki K Poulose wrote:
>>>>>>>> On 19/12/2023 02:43, Tao Zhang wrote:
>>>>>>>>>
>>>>>>>>> On 12/18/2023 6:46 PM, Suzuki K Poulose wrote:
>>>>>>>>>> On 21/11/2023 02:24, Tao Zhang wrote:

...

>>>>>>>>>>>                     char *buf)
>>>>>>>>>>>   {
>>>>>>>>>>>       struct tpdm_drvdata *drvdata = 
>>>>>>>>>>> dev_get_drvdata(dev->parent);
>>>>>>>>>>> +    ssize_t size = 0;
>>>>>>>>>>>   -    return sysfs_emit(buf, "%u\n",
>>>>>>>>>>> -             (unsigned int)drvdata->dsb->patt_ts);
>>>>>>>>>>> +    if (tpdm_has_dsb_dataset(drvdata))
>>>>>>>>>>> +        size = sysfs_emit(buf, "%u\n",
>>>>>>>>>>> +                 (unsigned int)drvdata->dsb->patt_ts);
>>>>>>>>>>> +
>>>>>>>>>>> +    if (tpdm_has_cmb_dataset(drvdata))
>>>>>>>>>>> +        size = sysfs_emit(buf, "%u\n",
>>>>>>>>>>> +                 (unsigned int)drvdata->cmb->patt_ts);
>>>>>>>>>>
>>>>>>>>>> Why does this need to show two values ? This must only show 
>>>>>>>>>> ONE value.
>>>>>>>>>> How you deduce that might be based on the availability of the 
>>>>>>>>>> feature
>>>>>>>>>> set. Or store the TS value in the drvdata and use that instead 
>>>>>>>>>> for
>>>>>>>>>> controlling CMB/DSB.
>>>>>>>>>
>>>>>>>>> Since both of CMB/DSB need to have "enable_ts" SysFs file, can 
>>>>>>>>> I separate them
>>>>>>>>
>>>>>>>> The question really is, do we need fine grained control. i.e.,
>>>>>>>>
>>>>>>>> enable TS for DSB but not for CMB or vice versa.
>>>>>>>>
>>>>>>>> I am not an expert on the usage scenario of the same. So, if 
>>>>>>>> you/Qcomm
>>>>>>>> thinks the users need separate, fine grained control for timestamp
>>>>>>>> for the DSB and CMB, then yes, follow your recommendation below.
>>>>>>>> i.e., tpdm.../dsb_patt/enable_ts
>>>>>>>>
>>>>>>>>> as "enable_dsb_ts" and "enable_cmb_ts"? The path will be like 
>>>>>>>>> below.
>>>>>>>>>
>>>>>>>>> tpdm0/dsb_patt/enable_dsb_ts
>>>>>>>>
>>>>>>>> You don't need enable_dsb_ts. It could be "enable_ts"
>>>>>>>>
>>>>>>>>>
>>>>>>>>> tpdm1/cmb_patt/enable_cmb_ts
>>>>>>>>>
>>>>>>>>> Is this design appropriate?
>>>>>>>>
>>>>>>>>
>>>>>>>> Otherwise, stick to single enable_ts : which enables the ts for 
>>>>>>>> both
>>>>>>>> CMB/DSB. And it only ever show one value : 0 (TS is disabled for 
>>>>>>>> both
>>>>>>>> CMB/DSB) 1 : TS enabled for both.
>>>>>>>
>>>>>>> We have a very special case, such as the TPDM supporting both CMB 
>>>>>>> and
>>>>>>>
>>>>>>> DSB datasets. Although this case is very rare, it still exists.
>>>>>>>
>>>>>>> Can I use the data bit to instruct whether timestamp is enabled 
>>>>>>> for CMB/DSB or not? For example,
>>>>>>>
>>>>>>> size = sysfs_emit(buf, "%u\n",
>>>>>>>                  (unsigned int)(drvdata->dsb->patt_ts << 1 | 
>>>>>>> drvdata->cmb->patt_ts));
>>>>>>>
>>>>>>> Thus, this value can instruct the following situations.
>>>>>>>
>>>>>>> 0 - TS is disabled for both CMB/DSB
>>>>>>>
>>>>>>> 1 - TS is enabled for CMB
>>>>>>>
>>>>>>> 2 - TS is enabled for DSB
>>>>>>>
>>>>>>> 3 - TS is enabled for both
>>>>>>>
>>>>>>> Is this approach acceptable?
>>>>>>>
>>>>>>
>>>>>> No, please stick to separate controls for TS. Do not complicate
>>>>>> the user interface.
>>>>>>
>>>>>> i.e.,
>>>>>> tpdm0/dsb_patt/enable_ts
>>>>>> tpdm0/cmb_patt/enable_ts
>>>>>
>>>>> We need to be able to control/show dsb and cmb timestamp enablement 
>>>>> independently.
>>>>>
>>>>> Can we achieve this requirement if we use a sysfs file with the 
>>>>> same name?
>>>>
>>>> They are independent and in their respective directory (group) for 
>>>> CMB and DSB. What am I missing ?
>>>> e.g., if you want to enable TS for DSB, you do :
>>>>
>>>> $ echo 1 > dsb_patt/enable_ts
>>>>
>>>> And that only works for DSB not for CMB.
>>>
>>> We have a special case that the TPDM supports both DSB and CMB 
>>> dataset. In this special case, when we
>>>
>>> issue this command to enable timestamp, it will call enable_ts_store 
>>> API, right?
>>>
>>>      if (tpdm_has_dsb_dataset(drvdata))
>>>          drvdata->dsb->patt_ts = !!val;
>>>
>>>      if (tpdm_has_cmb_dataset(drvdata))
>>>          drvdata->cmb->patt_ts = !!val;
>>
>> I don't understand. If they both are under different subgroups, why
>> should they be conflicting ? Are you not able to distinguish them, when
>>  you creat those attributes ? i.e., create two different "attributes" ?
> 
> Yes, although some TPDMs can support both CMB dataset and DSB dataset, 
> we need to configure them separately
> 
> in some scenarios. Based on your suggestion, I want to use the following 
> approach to implement it.
> 
> See below.
> 
>>
>> See below.
>>
>>> Since this special TPDM supports both DSB and CMB dataset, both DSB 
>>> patt_ts and CMB patt_ts will be set
>>>
>>> in this case even if I only configure the file in the DSB directory, 
>>> right?
>>>
>>> This is the problem we have now.
>>>
>>
>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +    return size;
>>>>>>>>>>>   }
>>>>>>>>>>>     /*
>>>>>>>>>>> @@ -715,8 +755,13 @@ static ssize_t enable_ts_store(struct 
>>>>>>>>>>> device *dev,
>>>>>>>>>>>           return -EINVAL;
>>>>>>>>>>>         spin_lock(&drvdata->spinlock);
>>>>>>>>>>> -    drvdata->dsb->patt_ts = !!val;
>>>>>>>>>>> +    if (tpdm_has_dsb_dataset(drvdata))
>>>>>>>>>>> +        drvdata->dsb->patt_ts = !!val;
>>>>>>>>>>> +
>>>>>>>>>>> +    if (tpdm_has_cmb_dataset(drvdata))
>>>>>>>>>>> +        drvdata->cmb->patt_ts = !!val;
>>>>>>>>>>>       spin_unlock(&drvdata->spinlock);
>>>>>>>>>>> +
>>>>>>>>>>>       return size;
>>>>>>>>>>>   }
>>>>>>>>>>>   static DEVICE_ATTR_RW(enable_ts);
>>
>> Do not overload the same for both DSB and CMB. Create one for each in 
>> DSB and CMB ? They could share the same show/store routines, but could
>> be done with additional variable to indicate which attribute they are 
>> controlling. Like the other attributes, using dev_ext_attribute or such.
> 
> New approach below, please help review to see if it is acceptable?
> 
> #define tpdm_patt_enable_ts_rw(name, mem)                \
>      (&((struct tpdm_dataset_attribute[]) {            \
>         {                                \
>          __ATTR(name, 0644, enable_ts_show,        \
>          enable_ts_store),        \
>          mem,                            \
>         }                                \
>      })[0].attr.attr)
> 
> 
> #define DSB_PATT_ENABLE_TS                    \
>          tpdm_patt_enable_ts_rw(enable_ts,        \
>          DSB_PATT)
> 
> 
> #define CMB_PATT_ENABLE_TS                    \
>          tpdm_patt_enable_ts_rw(enable_ts,        \
>          CMB_PATT)
> 
> 
> static ssize_t enable_ts_show(struct device *dev,
>                    struct device_attribute *attr,
>                    char *buf)
> {
>      struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>      struct tpdm_dataset_attribute *tpdm_attr =
>          container_of(attr, struct tpdm_dataset_attribute, attr);
>      ssize_t size = 0;
> 
>      if (tpdm_attr->mem == DSB_PATT) {
>          size = sysfs_emit(buf, "%u\n",
>                   (unsigned int)drvdata->dsb->patt_ts);
>      } else if (tpdm_attr->mem == CMB_PATT) {
>          size = sysfs_emit(buf, "%u\n",
>                  (unsigned int)drvdata->cmb->patt_ts);
>      } else
>          return -EINVAL;
> 
>      return size;
> }
> 
> static ssize_t enable_ts_store(struct device *dev,
>                     struct device_attribute *attr,
>                     const char *buf,
>                     size_t size)
> {
>      struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>      struct tpdm_dataset_attribute *tpdm_attr =
>          container_of(attr, struct tpdm_dataset_attribute, attr);
>      unsigned long val;
> 
>      if ((kstrtoul(buf, 0, &val)) || (val & ~1UL))
>          return -EINVAL;
> 
>      spin_lock(&drvdata->spinlock);
>      if (tpdm_attr->mem == DSB_PATT) {
>          drvdata->dsb->patt_ts = !!val;
>      } else if (tpdm_attr->mem == CMB_PATT) {
>          drvdata->cmb->patt_ts = !!val;
>      } else
>          return -EINVAL;
>      spin_unlock(&drvdata->spinlock);
> 
>      return size;
> }
> 
> 

Yes, that is what I had in mind.

Thanks
Suzuki

> Best,
> 
> Tao
> 
>>
>>
>> Suzuki
>>


