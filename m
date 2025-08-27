Return-Path: <linux-arm-msm+bounces-70999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA31B37FC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1EF120394B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69C9341ABD;
	Wed, 27 Aug 2025 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RmWejYIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FFF30ACF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290105; cv=none; b=mWc3pe3rSTPdUJIYqp4M2idd/bnMI0Fq+1tESV8jxKyKa55aQ1GieLa8T+6XL5qdm8vjC9xoThxjzc/oPOrwtaZv2//ZGbgL6clIT4XDPXDnqNwcbstAjtfheQRAHvrl3mWm8Pw0rn/1ZsV5DeWbf9fL++k8fAK6MVC4wDeGz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290105; c=relaxed/simple;
	bh=r7Igf50Fi/rJZL4ROxs/FI0yfWeOkTDKsFYChf+3u/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRWZrahMAr8LH9L9UJ566ZyXWmkS3F+7kfQ7RfXEXWj2OQIUOkmINOizRFkZfUdYliKAHnJEblIVHiYD1FxFqRQvnnHRRvwSQbMXyIGZCfEKmbIV8wyAM0RXy8YbdyniFPGyi5L671FwR1PiVqS7QvzXi1D3A1aicnen0tda0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RmWejYIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kCbq014774
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWqGiEoMh1Ixg9kMOfn/oNPCFZIKj8izNNs6P0FgqRM=; b=RmWejYITii3bKMyq
	4QiiPUeUVEBqKm0O0+BcdSZKkNquXIl7bLEFPe4jMN1l1lED2/RCSLCRKumJKzm+
	pYPdT7mBSI3ijTmk56pBeY5kBXEfMpHT/3DGcKzAU63J3sKHcAG4WvPWTZKnOYnA
	6/M27Nu4c9TkEkSNQX11WpOwA1VoynE4gJwRBGfHoAymAao7CPEpECMAZcNAG+k+
	zXfqrdxFPsVKXboOvbi33GqY/p8ducY04BanxDWf3tgR/c58+J/272grNd/X0GfZ
	Xbqhqhn4sd/o8aifX3Aj6ucH67VpDMNqrw71TPAjzfF8cLbJFCuthKoRwvR1xfJ+
	fCr/9w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we43v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:21:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7720b00a313so449724b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 03:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290101; x=1756894901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWqGiEoMh1Ixg9kMOfn/oNPCFZIKj8izNNs6P0FgqRM=;
        b=OL9kN6RxPuCSPXp9X6Bx0TGliHahSGF3XZwQry1yQBufK+rWeL/Ob2+VJL85OuQzOG
         uJthfyfgM/yuHzGoI/1ZAvW2e+MehBsy/mE6TNnrYIoP0WyVLRGaQhvfwhk6yRPqiku1
         k0/4jMpLXcosKXDe8CWgQPTudh6zpBm0xUxBUc/oU74/nLuglmoKp9QhP8xnGj7k46BV
         Xrv/FO3U3k0Zmvy4McOFxZjjRhukEaB+48cq3JEUHIVr0keJSePdH2IIVyTw5q/4sSmi
         Trd9T78OSCRn6CSUhq2ZtUq0krMnfZhZMTcO3VJojTwwN15DFQXuKY/ZpIBwrGrMYGBQ
         a2Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVkKmCcJ1b6hImapifomcEZ5qEDwtFw5G9kl4sVdt2IdTlSyYNy2IRPwUHFN2m7hLzb5yY4DCYST/A3ZAnE@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuTLh12C1dMZKTVn7HHFZkAP0HP5NQBgT9NChI6EiFrYwY7vR
	thQszkRo8Aa10on02bcB+fsHMc23pNvmHLMJdyD6LY3hFv2r/JfT6ElLpPdHoT5vnPyn441Z91i
	L3Axi0hGSXidjGZsiKkwp5dmDp/bV6dYpby8biCOzQDygSGUpl/ZXIoVgjKgekHPBx0Uy
X-Gm-Gg: ASbGncu1AQ3CpOL1T6u86fzGRvyDNzpnzEgni+aGsD3a09Gy5wCCo+7zKdewRjcUBca
	lcJcnAIX7ay7RWmJvBUvuWEKHysEBdyq/KpSWnwZGmBR/j39RNB88yS1Ba1fbBUBhQv0VlC5iAc
	NAHdgywtYc7/XOMeedDnUVqG9uT0akqWKziqPRR7wIeWj9WVF+xjLt85vEkxUUfKzUONp26vCna
	HE7N2DmYVBkBo/DjE1pNssPHMVEyIH7WGho/xHxyeOR44avbtzqCRPjU1D4p0jDEbgx4fjXaKrL
	O0otMXsRUlgRMtqD/tokYxoF/OEisX+sXFLUgGWUzSBEsozJ2jo7WOTUEwagCJjP4NTB2krmowU
	s8bzwrnXDInDNEYaA3A==
X-Received: by 2002:a05:6a20:914f:b0:243:755:58b1 with SMTP id adf61e73a8af0-24340d4476dmr30221831637.50.1756290101213;
        Wed, 27 Aug 2025 03:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE20Ixn8/Rp7/u1DnA2k88RHtjNUK6RsfUauJ/MGItqwZiSd6g1xgmpqv58urRl32gT6x4ReA==
X-Received: by 2002:a05:6a20:914f:b0:243:755:58b1 with SMTP id adf61e73a8af0-24340d4476dmr30221793637.50.1756290100603;
        Wed, 27 Aug 2025 03:21:40 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm1667244a91.23.2025.08.27.03.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 03:21:40 -0700 (PDT)
Message-ID: <bfed7735-0f82-40d2-9a85-b99ec39fcf4d@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 18:21:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
 <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
 <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
 <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <bc337e7c-42e7-4e2d-8b2d-c39174d1ddd5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SpY6XF8321244bBbpnLYY3N86-QnTP_W
X-Proofpoint-ORIG-GUID: SpY6XF8321244bBbpnLYY3N86-QnTP_W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXx0PVAhwIPT7P
 XkKGPz4/rvruCU+IhSoU5eNCRXEsOCkVx91H5sRJ0+BBN82D7Vk57GEn+4FnYR7YE3yS3kKImp9
 g+Nh4MKJyUi2BUjJTBO6ESdpo4YneLcJyarrVIhqwkplls0RVDMqXUwhN8YyJpiEcQUIdNZp7lY
 iUsEyIN7TNdaMeALSrHCj1CHxVdUz9vaiAyBG0v6y/oOgGbFwVShTxi/oShg+dcS/MDBb3i1th7
 znFmgStmUZEPSPOAFaI6q95aVDDPkZd/MjuXjZEaOTdYJzdp/lvsyYQDTn3pTyz0H6FpTVmykFl
 z3Zrim2HoxPugbps2QtMhBFKAh+d/+RSRi8dEgiMSiNE7l/Rc+SueGG3uF3JpBZdMssYfz45ePF
 vC9podv0
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68aedc36 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=W2FtnCjKMyXqdGChcqkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/27/2025 6:16 PM, James Clark wrote:
> 
> 
> On 27/08/2025 10:48 am, Jie Gan wrote:
>>
>>
>> On 8/27/2025 5:17 PM, James Clark wrote:
>>>
>>>
>>> On 27/08/2025 5:20 am, Jie Gan wrote:
>>>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>>
>>>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>>>> for port i, forcing the data to synchronize and be transmitted to the
>>>> sink device.
>>>>
>>>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>>>   3 files changed, 51 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> index fb651aebeb31..2cf2dcfc13c8 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>>>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>>>   Description:
>>>>           (RW) Configure the CMB/MCMB channel mode for all enabled 
>>>> ports.
>>>>           Value 0 means raw channel mapping mode. Value 1 means 
>>>> channel pair marking mode.
>>>> +
>>>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>>>> +Date:        August 2025
>>>> +KernelVersion:    6.17
>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>>>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Configure the bit i to requests a flush operation of 
>>>> port i on the TPDA.
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.c
>>>> index 430f76c559f2..8b1fe128881d 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>>>> *dev,
>>>>   }
>>>>   static DEVICE_ATTR_RW(cmbchan_mode);
>>>> +static ssize_t port_flush_req_show(struct device *dev,
>>>> +                   struct device_attribute *attr,
>>>> +                   char *buf)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>> +    CS_LOCK(drvdata->base);
>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>
>>> Still missing the 0x prefix
>>
>> Will re-check rest of the codes and add prefix. Sorry I missed it 
>> during the review process.
>>
>>>
>>>> +}
>>>> +
>>>> +static ssize_t port_flush_req_store(struct device *dev,
>>>> +                    struct device_attribute *attr,
>>>> +                    const char *buf,
>>>> +                    size_t size)
>>>> +{
>>>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    unsigned long val;
>>>> +
>>>> +    if (kstrtoul(buf, 0, &val))
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (!drvdata->csdev->refcnt || !val)
>>>> +        return -EINVAL;
>>>> +
>>>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
>>>
>>> Using FIELD_PREP() now that it's the full width of the register makes 
>>> less sense. Especially when there is no corresponding FIELD_FIT() 
>>> check,   which is fine because everything always fits. But if you 
>>> didn't know the mask was the full width you'd wonder if the check is 
>>> missing.
>>>
>>> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
>>>
>>> It should also have been val = FIELD_PREP(...)
>>
>> Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
>> mistake here..
>>
>> I was thinking the unsigned long here could be 64 or 32 bits and we 
>> only need the value of the lower 32 bits. So that's why I am using val 
>> = FIELD_PREP(...) here. We shouldn't write a value greater than 
>> UINT32_MAX to the register.
>>
>> Thanks,
>> Jie
>>
> 
> writel_relaxed() is always 32 bits though so it is a bit confusing if 
> you truncate the user value without an error. Also a reason to use u32 
> instead of unsigned long types.
> 
> Are you trying to support arm and arm64 with tpda? Or just arm64? For it 
> to be consistent you can use kstrtou32(), or use kstrtoull() and then 
> FIELD_FIT() to error on truncation. kstrtou32() is probably the cleanest.

Only arm64. Will try kstrtou32() with u32.

Thanks,
Jie

> 
>>>
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    CS_UNLOCK(drvdata->base);
>>>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>> +    CS_LOCK(drvdata->base);
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>> +
>>>>   static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_trig_async_enable.attr,
>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_freq_ts_enable.attr,
>>>>       &dev_attr_global_flush_req.attr,
>>>>       &dev_attr_cmbchan_mode.attr,
>>>> +    &dev_attr_port_flush_req.attr,
>>>>       NULL,
>>>>   };
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.h
>>>> index 8e1b66115ad1..56d3ad293e46 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>> @@ -10,6 +10,7 @@
>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>   #define TPDA_FPID_CR        (0x084)
>>>>   #define TPDA_SYNCR        (0x08C)
>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>> @@ -35,6 +36,7 @@
>>>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>>>   #define TPDA_MAX_INPORTS    32
>>>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>>>   /* Bits 6 ~ 12 is for atid value */
>>>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>>>
>>>
>>
> 
> 


