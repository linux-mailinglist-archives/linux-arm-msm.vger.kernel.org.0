Return-Path: <linux-arm-msm+bounces-70849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C79B3583C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D252E1B66C77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A3E309DDC;
	Tue, 26 Aug 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIcHIoW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D02F8BC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199351; cv=none; b=KaQemGXC/AFU7n23WxXOKzxvya9qMjHj9flAM3TPulSzdYTUwoswmJaLUkzUtQsmgctuUb+Pwsc2KLZcjPR3mzHCmmJ/BKsezfNT5znpCXWEh/4yRBTqVv8uV8s4vNaMiYxcGvKYxR1Th4ce8gJS8gV46F+KFLg9nxDFuL/yua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199351; c=relaxed/simple;
	bh=XVu14D6DKVrYaFxnkkFQW/c1R4bkqJ8P3/2QyGYTqwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hs/0s4kv7XWvXE96u3DnXWLAQ+ZPuOnI/MsV/tvwPLSI8OCXQJfFmNqp+C1lTbgP8BnlTD8VTtG7lqh1QkG6SyX1KhnEOLhGVxWLJ1OHlpNdOOcNNqM0OocgQJzfx1QlK3R/5UPVPA9qvASZwK2xcw/9CETETOiRmGuIRBFQ1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIcHIoW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4cGj3026845
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnqFYdYnAI6qy0g/lFT7xy643I4OKYgE1hSB/nvF0PE=; b=SIcHIoW3+e1+hl/u
	sASIDqWB3f3IJt7xZ5Lde7MNp6yztMLqJNkwpKkMRkWXAP0VL4PtOS6BLE03xgVF
	1iP3VkaUR+yBxLstLefwCpb46u1UYu5LefP6WYikuSxWIw9a/55w25yaqieGXCmI
	LGNCblRpW5Od5YtyLHw/HjMbTE6U104B3r/edPhhPxVF/dUd33iEaYYYHjXKq+pX
	oyRZa3hjGgxkvkyfCUk1TnIQOqnmdgC3SDjpqKV+36QneaybvZrs4UCiseF1+O8T
	OFCHzowfEvtKC+KOsAd/FON3CGQoB2nf3/75NJJ3U9N9FQbRyJprwXEdrt7wC4rT
	1QvzhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6tj07ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:09:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458264c5aso58726435ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199348; x=1756804148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnqFYdYnAI6qy0g/lFT7xy643I4OKYgE1hSB/nvF0PE=;
        b=hvf3PZ7Hdt5bSHkFk0Shc8gy5kq3kWXcbD9SUxyR3/6vr/jGwNp4oFzE44SVucq7/4
         GT9TPcqqb+e0Wq8jYTKxjsxMAPjbaT1RDMbyi99dkCc74GOoNruja1jEZkAog+06LqzK
         wPbGj92zPPJVY5/ez9KpyOjom0oC102CmJY/6TUT8FDLm9vz6EPFR58Ctv1SDkun8C/W
         /1YM7A+Bn0v35b+EinSVx4KSCg/K226m7c4S3ZZ5k1StfY23H4wfWsuLa+MPHZ5Ey2TR
         r5XaPDT3KoVlbZhi2l1xDrcfKgSlHH8/6T3+8dq8z6BN7KkQRqUUViyFS9RWMG1TOOiK
         Tr6g==
X-Forwarded-Encrypted: i=1; AJvYcCU1NXT/hlGv6076OZqiUOgfPOuB/FoOXRkNFZNTWjGprTOKqDbpLTxS7UCDcEmx2wX4NCgIkUvqfcFvX+5B@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzbd6IJSr1orlshU4suKkXWLFd5Z4Ib2EJdzBIgBSeotFIlph
	U9kvsPWu8OpSexXwkyqd7FQU10FWoREKtSVhbIlj0qBheeNot2snHlCodNvYvTb30PLkBVcvT41
	IwtMAON+fn4EM5QSJNxuR9wjxJuI1MAaM9T9Oj4hsG60momckNon3V/YjEgvWwjvYDXIg
X-Gm-Gg: ASbGncu7gq39P0iV9TUeJPfuVDmpt4r/LZ4THGntoDyP/xSZjWCbUQO2QEJv8Xs8LVT
	cMx63PBStiC3HtOQUIZkZkQxfgDIFwc1iXSC0a2Sm8l+Yx1LRdcubmY88pi8FyQRMOwy99TnAY1
	5/oyhXEWpSdZQ8LCrhe9GEtyQ8eYYtXy5b0NUi3uGya9xH6Kr1Ne0IXIyJGw0XqT+t2HSEM0ZzZ
	pQKBZFQYgHneJj6mm23JHC0WI7yNIM+w/FVEs0lE/r/2Qaef15A2NlCngPshtWpGT7Y/eEglawd
	EsfJQRU3BEV1TeGzctjkuAry8BkOS5z5zlenz3wc3njgqmUzJDo0PLu3RJ9Ap5gxzDveXcg5Mch
	0vYMKo1HspnR2iKHgH3wgkQ0PK+qpmg==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id d9443c01a7336-246a4e655fcmr129648635ad.56.1756199347494;
        Tue, 26 Aug 2025 02:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLZ8gUKGZgRJzBkCDuupy84GZojcoMPPNal4p4dIJ5QE6b2n42WRNgvPseXrP/6XDjI06Fpw==
X-Received: by 2002:a17:902:eb8b:b0:246:a4e6:50b8 with SMTP id d9443c01a7336-246a4e655fcmr129648195ad.56.1756199346865;
        Tue, 26 Aug 2025 02:09:06 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466886474csm89596705ad.76.2025.08.26.02.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:09:06 -0700 (PDT)
Message-ID: <f6f6f295-114a-4622-ab2e-36619b3bc6ae@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:09:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
 <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <60355fd1-2126-493f-93fe-a36c198a0b32@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX3AQB+heS9bP4
 dgb1pgg8lf4uGZkjEoaUmu55z487YdC2aHEw8rPgbe7177yi0vRz1QZ6hV8K9uOzxvzSdIHUSRH
 8jc/0VAYtKcKcWUVHJt01nSfSGbD/+BATlALgMdTdmk3El4pPy969zHhiqHkLQOPIqHhIaFsD7z
 YtusJlM9mWZ+A7TPN7TmiW5gt8JA/TjW+8dt4VBlijzkab5sKg+ig3FGC1HGMbep8QRM8E7dXnp
 xvOrIbM7WNOrYNC71OaZoPyCjXvOX9Bo/Q6SNQAymlXkqoSU+69W1MHTuVwyx8kYze3glBglT5q
 JlAuvVbGKqirtoW6VtrdOg0ihLHUfiw/OVlad/64iNlFk3z9quaKMQc7Cs18ivPQpFqVcNCXZcV
 MnaAjKUL
X-Proofpoint-ORIG-GUID: pw1xdb-YagWpjjkkl4nPkDaem0SrFAvb
X-Proofpoint-GUID: pw1xdb-YagWpjjkkl4nPkDaem0SrFAvb
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ad79b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lBpSeHXHZXHvFma1IaoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043



On 8/26/2025 5:00 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>>   3 files changed, 311 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..e827396a0fa1
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -0,0 +1,43 @@
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_async_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger synchronization sequence 
>> interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FLAG packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FREQ packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/unset global (all ports) flush request bit. The bit 
>> remains set until a
> 
> I don't think you can unset? global_flush_req_store() only does 
> something for set.
> 
>> +        global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>> +        Value 0 means raw channel mapping mode. Value 1 means channel 
>> pair marking mode.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 4e93fa5bace4..cc254d53b8ec 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct 
>> tpda_drvdata *drvdata)
>>       u32 val;
>>       val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val &= ~TPDA_CR_MID;
>>       val &= ~TPDA_CR_ATID;
>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>> +    if (drvdata->trig_async)
>> +        val = val | TPDA_CR_SRIE;
>> +    else
>> +        val = val & ~TPDA_CR_SRIE;
> 
> val |=
> val &=
> 

Will update in next version.

>> +    if (drvdata->trig_flag_ts)
>> +        val = val | TPDA_CR_FLRIE;
>> +    else
>> +        val = val & ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val = val | TPDA_CR_FRIE;
>> +    else
>> +        val = val & ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val = val | TPDA_CR_FREQTS;
>> +    else
>> +        val = val & ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val = val | TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val = val & ~TPDA_CR_CMBCHANMODE;
>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>> +
>> +    /*
>> +     * If FLRIE bit is set, set the master and channel
>> +     * id as zero
>> +     */
>> +    if (drvdata->trig_flag_ts)
>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
>>       .link_ops    = &tpda_link_ops,
>>   };
>> +static ssize_t trig_async_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
>> +}
>> +
>> +static ssize_t trig_async_enable_store(struct device *dev,
>> +                       struct device_attribute *attr,
>> +                       const char *buf,
>> +                       size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->trig_async = true;
>> +    else
>> +        drvdata->trig_async = false;
>> +
> 
> drvdata->trig_async = !!val
> 
> same with all the following ones too
> 

Will address all codes.

>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_async_enable);
>> +
>> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
>> +}
>> +
>> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->trig_flag_ts = true;
>> +    else
>> +        drvdata->trig_flag_ts = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>> +
>> +static ssize_t trig_freq_enable_show(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
>> +}
>> +
>> +static ssize_t trig_freq_enable_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->trig_freq = true;
>> +    else
>> +        drvdata->trig_freq = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_freq_enable);
>> +
>> +static ssize_t freq_ts_enable_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
>> +}
>> +
>> +static ssize_t freq_ts_enable_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->freq_ts = true;
>> +    else
>> +        drvdata->freq_ts = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(freq_ts_enable);
>> +
>> +static ssize_t global_flush_req_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
> 
> -EPERM doesn't seem right, maybe EBUSY or EINVAL?

I think EINVAL is better just because the TPDA is not enabled yet. Will fix.

> 
> Also don't you need CS_UNLOCK() for reading? I'm not 100% sure but I 
> found one example of it in debug_init_arch_data().
> 

Sorry about that, I shouldnt miss the CS_UNLOCK&&CS_LOCK pairs.

>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    return sysfs_emit(buf, "%lx\n", val);
>> +}
>> +
>> +static ssize_t global_flush_req_store(struct device *dev,
>> +                      struct device_attribute *attr,
>> +                      const char *buf,
>> +                      size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
> 
> if (!val)
>    return size;
> 
> Check this first, no point in taking the spinlock or checking the 
> refcount if you aren't going to do anything.

Will fix it.

> 
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
> 
> ditto for -EPERM

Will fix it.

Thanks,
Jie

> 
>> +
>> +    if (val) {
>> +        CS_UNLOCK(drvdata->base);
>> +        val = readl_relaxed(drvdata->base + TPDA_CR);
>> +        val = val | BIT(0);
>> +        writel_relaxed(val, drvdata->base + TPDA_CR);
>> +        CS_LOCK(drvdata->base);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(global_flush_req);
>> +
>> +static ssize_t cmbchan_mode_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +
>> +    return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
>> +}
>> +
>> +static ssize_t cmbchan_mode_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf,
>> +                  size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    bool val;
>> +
>> +    if (kstrtobool(buf, &val))
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (val)
>> +        drvdata->cmbchan_mode = true;
>> +    else
>> +        drvdata->cmbchan_mode = false;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(cmbchan_mode);
>> +
>> +static struct attribute *tpda_attrs[] = {
>> +    &dev_attr_trig_async_enable.attr,
>> +    &dev_attr_trig_flag_ts_enable.attr,
>> +    &dev_attr_trig_freq_enable.attr,
>> +    &dev_attr_freq_ts_enable.attr,
>> +    &dev_attr_global_flush_req.attr,
>> +    &dev_attr_cmbchan_mode.attr,
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group tpda_attr_grp = {
>> +    .attrs = tpda_attrs,
>> +};
>> +
>> +static const struct attribute_group *tpda_attr_grps[] = {
>> +    &tpda_attr_grp,
>> +    NULL,
>> +};
>> +
>>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>>   {
>>       int atid;
>> @@ -289,6 +528,7 @@ static int tpda_init_default_data(struct 
>> tpda_drvdata *drvdata)
>>           return atid;
>>       drvdata->atid = atid;
>> +    drvdata->freq_ts = true;
>>       return 0;
>>   }
>> @@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       desc.ops = &tpda_cs_ops;
>>       desc.pdata = adev->dev.platform_data;
>>       desc.dev = &adev->dev;
>> +    desc.groups = tpda_attr_grps;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index c6af3d2da3ef..b651372d4c88 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -8,17 +8,34 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Packetize CMB/MCMB traffic bit */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>>   #define TPDA_Pn_CR_CMBSIZE        GENMASK(7, 6)
>>   /* Aggregator port DSB data set element size bit */
>>   #define TPDA_Pn_CR_DSBSIZE        BIT(8)
>> +/* Mode control bit */
>> +#define TPDA_MODE_CTRL            BIT(12)
>>   #define TPDA_MAX_INPORTS    32
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
>> +/* Bits 13 ~ 19 is for mid value */
>> +#define TPDA_CR_MID        GENMASK(19, 13)
>>   /**
>>    * struct tpda_drvdata - specifics associated to an TPDA component
>> @@ -29,6 +46,11 @@
>>    * @enable:     enable status of the component.
>>    * @dsb_esize   Record the DSB element size.
>>    * @cmb_esize   Record the CMB element size.
>> + * @trig_async:    Enable/disable cross trigger synchronization 
>> sequence interface.
>> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request 
>> interface.
>> + * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>> + * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -38,6 +60,11 @@ struct tpda_drvdata {
>>       u8            atid;
>>       u32            dsb_esize;
>>       u32            cmb_esize;
>> +    bool            trig_async;
>> +    bool            trig_flag_ts;
>> +    bool            trig_freq;
>> +    bool            freq_ts;
>> +    bool            cmbchan_mode;
>>   };
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
> 


