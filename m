Return-Path: <linux-arm-msm+bounces-70889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B0B35EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 14:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4EA81BA0522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 12:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E92F531C;
	Tue, 26 Aug 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLqBO4s7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BA2BDC37
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210313; cv=none; b=jGbVkCSzVXbYzukgbTs3zhgYn8FRXnu74vdxXh9VtoJTbKKXfZKjQmN4lyWxZ8mtkKshkLj7+OHZPXnekf8HeXE4YcHtWmJxgV7lLheCQUsAWZ6fANi2dKyZ+QRgxygdenXfDFGOkepyykl6TucYwjMaDKxWPIuhi0edQvu6/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210313; c=relaxed/simple;
	bh=C/ncFO0+meiwcT0dGWH6sqW5HyxoBvUGYHPaEyCmDgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNLZCrnKqi0ZJAIUN97m1ozuH6mafBNunVGbHvqvlx4Zcx8/e0HBGieuCUIJQHKxkvKIch4oRdIzsvOK6yRrcNIP95/BPtXRMMISG5jgWr2tMOQALlrFV0cO5rC4HVp0twdg8MhYReagsLk4jGYKfSlbjkPVt1Qj5mmbut+yD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLqBO4s7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8kJmU020022
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 12:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paLKss0IUBWc+jaJlEOsMKMsvnxtyXrSg9oZkdly/Ns=; b=dLqBO4s7mv5mKici
	wuWjk/+jlVhmLhv4egor9qx27Ty0KbfEn1hKUgeeBFT6BZMy+4bInHT/Wo+JXzdO
	avLuoNj3sF+GK7l+5A/Xb7F869eadzkLT2QJV/0mIuPCB3p1+hFt72zfFTzU77ml
	OZcvgQqZOqw0wZpHGXZvcbhwuarwdSTe6RgXKjpzF7lnKup3TIGbn4pEdTzqpF4/
	Mcliv4vFszOGAPGP8F/rTxjl+ijRZ4JM4gyjE0SkSEF/VEFQM3LI8M/f5fV6UXZe
	kS8ANmcgsNWqE3zFeZEBce9BzO93PiOtucfRz9qk9ncpFrPj/h2M/T9wPY0T8Q6m
	wrExPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615gkt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 12:11:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581953b8so63970595ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210308; x=1756815108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=paLKss0IUBWc+jaJlEOsMKMsvnxtyXrSg9oZkdly/Ns=;
        b=ggb1tgTuUQc9/oUMIGC5ygW8kd5ecki0i5UveHWB16PMAo2b1lW7Lgu8e8yu6jbyPZ
         9THi8ymc/6nOurmwIY3VJH7El0QPm6LAgvRYbV3UvRfILDk+XiZ3wgGaD1IYBceJhje0
         6i5YWzRMVP1QpEHi0hnzHHJI+O5hx4UYGoCXEuLuhv+FkmeZ54w1h3sjd1t1fc3UFC+v
         jz37MtDMg1AeuDgmlzPm5KT+QQ4qMSnEGoJ/9sZOfzn2QryBiwLlqfUWNXZeIb+3rNgz
         ekuHYhL9aX+xvN6bMWnrChG6BjcFDHm1QDiWX41bVdngg5QSgJk3VU1PVYp8L7LN0YN+
         4HyA==
X-Forwarded-Encrypted: i=1; AJvYcCUTbjZ4EZRunaFjY4BtIPp9WqaU+Nrw9Afuwgp2eoa54/LuSRiyLVq32WkGNVVWlgyDoAGzf6eDhZlFABQW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9hnlvnIUegIM4wRcVuiXDRYEvbbgFPYHetjaCPy36OPAlbbt
	zVzKm7wut9SKa2bcWq2LDZIYwXKiK3pz4XRgJwoEGgB+UH2Z3TsochYrsN6QhT4TXSw0N6SLgmr
	MYZ/Zdk9DN2qy5rD+mzbQ7Us+6te2CMFxg24wMgEPWtkBJ+aOIHa5p3A7X3ZK5GrGqmkn
X-Gm-Gg: ASbGncuCGWMYEBS4cuX6i+Enj6rik6fMgpJFZ6sVFANrUEmhnocZ+u2yo7I3C9MkTFZ
	/zPQ6TvBHvYWymHN+0AYcKJWun3RgJLF5ayKcpbOBvK1k/wMQgltydpFyLn7EtK/Ebk3+t4IxUa
	a66aIVhOzy5LrzFQgfcJayNZMOdAuN489CXHYXoc1byyuOok6S0qzimpDomhomGdqULrxx9va+m
	WJW4spQaDeiRjdNOkoNgI71YaSTtDqUhOqmfXu4Jk7Ximz2VsnADtd9UnTmBqBYaIzuMB0w+Fb/
	UvVBaWI+snG0pm9DddHbhxpJTwbO3teI5+X/CRIBI9pmpUpYrtBFk8SFe5lD6jV6i0CWLp5b7wF
	jBHZzRnaxqcxDuiSab/1LPM8+mw4R0Q==
X-Received: by 2002:a17:903:40d1:b0:246:d00b:4ae3 with SMTP id d9443c01a7336-246d00b549dmr78980235ad.61.1756210307955;
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWt+ZKuYL/s7XdOx51tNH2twlSp1YzsVOyChmLbB+Co/aIapze6oU9D35MvVYX1XhVnb+v5w==
X-Received: by 2002:a17:903:40d1:b0:246:d00b:4ae3 with SMTP id d9443c01a7336-246d00b549dmr78979735ad.61.1756210307420;
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688645eesm94817945ad.99.2025.08.26.05.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 05:11:47 -0700 (PDT)
Message-ID: <5df27be9-0347-49d1-ba1e-21d6a2172314@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 20:11:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
 <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
 <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
 <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <939eb45c-f48e-40ce-86e8-710afa2b5c9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX8L295w/B/e0o
 u3mKsm15stx/3CU2mViUbUX0jgb9UZkMDw951z+oBVphaLdoQKnHGGCEUo9gCi+6KmGMfC12P+g
 pc/iUpgvAzfDuFULa09hy/kSNvL5ZCjb5rnRRNvk9sFcS1/XKAu6FcRahO034T+S6A3ABiSBKJC
 qC375roWIXIwmYljdVwJY956YbV5Pl0CWYkPjOakDDgm23Nspx1VjP4VcY3aqyzmzmAkZ5jbiy4
 /GXO8H+UiTW6IMZ0jIL4RMEbNACSI8XP6W6N2kGMEOHGrT+UNiqlDt/kU4irD4XWS9AKJ0XJp1y
 IJOjdY7EAEH/d8b5IS9ehHlIMjwpHN0YuRvp1HEP+tgTZjBhyoZLoMZsiZMU9yEh2qaW5ob3kZK
 J1F8cRPs
X-Proofpoint-GUID: Gk9TUAh39RIRzpFddxbMf8DRw0EVfMh-
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ada485 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-hWpzLsPYw3_ZpqOosEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Gk9TUAh39RIRzpFddxbMf8DRw0EVfMh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034



On 8/26/2025 5:54 PM, James Clark wrote:
> 
> 
> On 26/08/2025 10:39 am, Jie Gan wrote:
>>
>>
>> On 8/26/2025 5:27 PM, James Clark wrote:
>>>
>>>
>>> On 26/08/2025 8:01 am, Jie Gan wrote:
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
>>>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++ 
>>>> ++++
>>>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>>>   3 files changed, 53 insertions(+)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>>>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>>>> index e827396a0fa1..8803158ba42f 100644
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
>>>> index 9e623732d1e7..c5f169facc51 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>>>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
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
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EPERM;
>>>> +
>>>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>>>> +    return sysfs_emit(buf, "%lx\n", val);
>>>
>>> Decimal would be better for a port number that goes from 0 - 127. If 
>>> you really want to use hex then don't you need to prefix it with 0x? 
>>> Otherwise you can't tell the difference between decimal 10 and hex 
>>> 10, and it's not documented that it's hex either.
>>>
>>
>> Got it. I will fix the code here, and update the description in document.
>>
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
>>>> +    /* The valid value ranges from 0 to 127 */
>>>> +    if (val > 127)
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(spinlock)(&drvdata->spinlock);
>>>> +    if (!drvdata->csdev->refcnt)
>>>> +        return -EPERM;
>>>> +
>>>> +    if (val) {
>>>
>>> If 0 - 127 are valid don't you want to write 0 too?
>>
>> It's 1-127 here. 0 may leads to an unexpected issue here.
>>
>> Thanks,
>> Jie
>>
> 
> Then can't the above be this:
> 
>    /* The valid value ranges from 1 to 127 */
>    if (val < 1 || val > 127)
>      return -EINVAL;
> 
> But I'm wondering how you flush port 0?
> 

BIT(0) represents port 0 with value 1 and the default value 0 means 
nothing will be triggered here.

> Isn't the default value 0? So if you never write to port_flush_req then 
> you'd flush port 0, but why can't you change it back to 0 after writing 
> a different value?

We can change the value back to 0 but I think we shouldn't do this 
although I haven't suffer issue after I changed it back to 0(for bit).
Because the document mentioned: "Once set, the bit remains set until the 
flush operation on port i completes and the bit then clears to 0". So I 
think we should let the flush operation finish as expected and clear the 
bit by itself? Or may suffer unexpected error when try to interrupt the 
flush operation?

Thanks,
Jie
  >>>
>>>> +        CS_UNLOCK(drvdata->base);
>>>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>>>> +        CS_LOCK(drvdata->base);
>>>> +    }
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RW(port_flush_req);
>>>> +
>>>>   static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_trig_async_enable.attr,
>>>>       &dev_attr_trig_flag_ts_enable.attr,
>>>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>>>       &dev_attr_freq_ts_enable.attr,
>>>>       &dev_attr_global_flush_req.attr,
>>>>       &dev_attr_cmbchan_mode.attr,
>>>> +    &dev_attr_port_flush_req.attr,
>>>>       NULL,
>>>>   };
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tpda.h
>>>> index 00d146960d81..55a18d718357 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>>>> @@ -10,6 +10,7 @@
>>>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>>>   #define TPDA_FPID_CR        (0x084)
>>>>   #define TPDA_SYNCR        (0x08C)
>>>> +#define TPDA_FLUSH_CR        (0x090)
>>>>   /* Cross trigger FREQ packets timestamp bit */
>>>>   #define TPDA_CR_FREQTS        BIT(2)
>>>
>>>
>>
> 
> 


