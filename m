Return-Path: <linux-arm-msm+bounces-70993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E5B37EA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9448D687312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87A832C30F;
	Wed, 27 Aug 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ZDD+16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4370276027
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286328; cv=none; b=ulORLhjcJrfR/YLDYdlhO2xDaR8mNP1IQobeyDVBwPBooLYFD4N8NQmzTOlRU7ggqWOFh4IuEDqdlDAlJ1OVXBp/Wty9zAkri7gzrZf7hNYskZb1S9jTGHC2w3ubzL0CYN2wGopX6b+NGA6iCcgVOwMhDCWv2KS3k9uMwM8jo64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286328; c=relaxed/simple;
	bh=uVogBQRE2Y/GsSLDqPGy9Aa63de/21Ehujpp/tZQ3Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6ViYVk2NquK1rmbi1FazVJXqVEWdaE54tpJq1GFMMfi+T4S0TuooJje9qydt+SlkbPYpkckUsVfP5Q/En3b8NflYSM+ajlyXxVNMFA9TyPKdQPH2korlW5olrW/Mbup1AjuzKfVoYcCcXm+P0rRIS5a2Ys1L32Ye6ozc82IrQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0ZDD+16; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kTee003900
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3ZmNgPMfhfr75Jy+s9Ep5b6gD2yM6Jzf4SvrXiJ2Lc=; b=A0ZDD+165l9r6he/
	0mWHt472B5s7FWBMG7a9bmindEt4NPoSB4zXk8JSX4wmpv1dKRcjbCUIsOZCtdHT
	6Dzwl1XUzJ+QLFvoiczD3gwMiRuteOc2kXvQwwDO1O1P//gAGoDk68ItxKthnWwv
	X8nTNXE4qtvxSrSzn8r+CGaCTwOp0SJ93IW6bSt4Nj5WZ3XQNcH2ylnCMSb7nXBq
	HCGXc1rAVIAG8iGi7wd6N9Z3dBvXsh7TbhgNDi+sl2q+X85lebnQlMzO3P5MUwmg
	qpIqI8wWtOaJ/Kr37N3PWvC8SEHeiGzAo+CrAkdIYEskvmoPKuQJPjufmV12Mouc
	FXX6hA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8c6u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:18:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b49da788e53so5170708a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756286325; x=1756891125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3ZmNgPMfhfr75Jy+s9Ep5b6gD2yM6Jzf4SvrXiJ2Lc=;
        b=PNi+MRZ1djgtIWO143ZooQWClZbpcVmTrRm5cIy8rUMn7U98hIUGwwdJJsX4dU0iFT
         bRzreXOVRXcW9UNCQSDUZe+Gt/l6bpTdm4WjyEt8+sCr+y/VROO8tdIF2udaIrg7WP8I
         qZnF9DSQf7/fxAwjJjEMAkQErteSD4ogVXY51UyjW2JcTNFUtcbo+AI4svTzi0fBketX
         youK6ulpZAId2ws870qMIgEnI8wNBFASEKusgbu1nBdbeD7D+TP1aFXtyHRJyu2VkBBC
         FPXa7atswh6RVlqXKLVg04ogLtUOuzj+c5s7iGNXE8ldTMp60RbEPIR3ZjAdDyGD3AHV
         QvzA==
X-Forwarded-Encrypted: i=1; AJvYcCXr5kyptxg8GQI4QbFg7IhKuH+aYpzR8ANSHr0Dsnqqk8PMp3Bm7H5cFDvAsVwY1VWOVvVEZ/lXziZfyXOV@vger.kernel.org
X-Gm-Message-State: AOJu0YwCCbR/vp7dPNilHQ3hwiILioe9+cbJirmylAU1KkZ/6V3t3Lr2
	LseWKKIFJhOyKkT8GMIF/uexyK5TzDsHNmwoTQQAUlAHdwut7gSg59lWR30g4TYFmBaRvd/uyNz
	3EOb0L1oiSrV2ACF8SNvL/NYxIQNBTWXThvx4yTlcgPPH5yxOu8X4Lx9Rg0ijr3Rwzjjq
X-Gm-Gg: ASbGncsnvpFhQL3OawHNA7ZlzzsiIkH5gcbtI23HrIGA6y+CB+ybZu5wXOwks33xJsr
	qS4pTEhh4df5u+zKIVz8uifXbc69ptpWn3mMBixpimbwZGTJt+NzchIwIACPfnkwrGHbIbjZWcW
	IDyXR0RX5AqOomKT8ZZfnrc9dJ8yuL4ScTJpeIQjfOLelp7g81bgtDjp6+PnBZLUblBs+XKPC50
	otuT8YSaJjWJBu7yETRRlIzysTVs6Q3HCUPaGcjhW+TmjMQV8xKnNnR7N3yKA3vCBxJOX613iAQ
	HWM4zgPR1lAq1pWtOv9/NT9basXtjoLU8QX/0G2CA6L7tXzKJWo2upFdG0BAEU2d2AZVDLepWOf
	NChPbmtYY5ugLhIfk6QZWc/TqQWrV4Q==
X-Received: by 2002:a17:903:388c:b0:248:a1d1:28ae with SMTP id d9443c01a7336-248a1d129d7mr14311245ad.39.1756286324811;
        Wed, 27 Aug 2025 02:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5/6oHGHXze6Sp8tZZFAPJM4F1BeCYoxBde0pV4H8aBjDQSfR/ZYTsY9gz+mOb8HWOUU766A==
X-Received: by 2002:a17:903:388c:b0:248:a1d1:28ae with SMTP id d9443c01a7336-248a1d129d7mr14310795ad.39.1756286324256;
        Wed, 27 Aug 2025 02:18:44 -0700 (PDT)
Received: from [10.133.33.198] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f11esm116975865ad.150.2025.08.27.02.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:18:43 -0700 (PDT)
Message-ID: <27282f8d-e27d-45c9-b616-28d2c62a4e09@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:18:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
 <20250827042042.6786-2-jie.gan@oss.qualcomm.com>
 <5acf3562-e69a-49b0-8cb6-9e57c5ad4368@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <5acf3562-e69a-49b0-8cb6-9e57c5ad4368@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mu5k0P6eMQ4HEDMlbQJptQ5nAc_Oc_87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX4uLsulrrbt4b
 irSw/pTGMNITCBGiv9D10TnTL+FZ906+drFY5JO92yTb9b36jYciK/6w2gSJBzwHnPZ9rq/PwSN
 mmhbw44Oan1hyy0+sADiAVRLCqHX9q2dZNNC82zBZrZETxOpo6CVDbUmzbnDCs/u9nb939zFUtp
 mWit8teyLHzz4DaEzM3dFXc8yDwz4Oi1iwa3jerk1jzJzqb31cmfcnGTd86fSmk1Sb3IHvZ96Mx
 8RK5XwPRld3ePwp6ojgNKJpPH/KeXLRkRwR1IdEkr/0oTtY2sSMuWg7IW9c3lnyRxTMv8mf+1Wx
 NhkdTJgd1miwfRXoer8yp0RRGg81D3DyvCSkrBwCKoJXLbAG1LvEpzUSKjDpkHW8bguGP5i4HSE
 C16lK/I4
X-Proofpoint-GUID: mu5k0P6eMQ4HEDMlbQJptQ5nAc_Oc_87
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aecd75 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=OiUlF2ysgpT-6eO3SmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044



On 8/27/2025 5:06 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 227 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++-
>>   3 files changed, 296 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..fb651aebeb31
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
>> +        (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
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
>> index 4e93fa5bace4..647ab49a98d7 100644
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
>> +        val |= TPDA_CR_SRIE;
>> +    else
>> +        val &= ~TPDA_CR_SRIE;
>> +    if (drvdata->trig_flag_ts)
>> +        val |= TPDA_CR_FLRIE;
>> +    else
>> +        val &= ~TPDA_CR_FLRIE;
>> +    if (drvdata->trig_freq)
>> +        val |= TPDA_CR_FRIE;
>> +    else
>> +        val &= ~TPDA_CR_FRIE;
>> +    if (drvdata->freq_ts)
>> +        val |= TPDA_CR_FREQTS;
>> +    else
>> +        val &= ~TPDA_CR_FREQTS;
>> +    if (drvdata->cmbchan_mode)
>> +        val |= TPDA_CR_CMBCHANMODE;
>> +    else
>> +        val &= ~TPDA_CR_CMBCHANMODE;
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
>> @@ -274,6 +302,203 @@ static const struct coresight_ops tpda_cs_ops = {
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
>> +    drvdata->trig_async = !!val;
>> +
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
>> +    drvdata->trig_flag_ts = !!val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
>> +
>> +static ssize_t trig_freq_enable_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
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
>> +    drvdata->trig_freq = !!val;
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
>> +    drvdata->freq_ts = !!val;
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
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> I know in practice it's probably only either 0 or 1, but this should 
> either be decimal or have the 0x prefix otherwise it looks like a mistake.
> 

You are right. It looks strange here and I missed this point. I think 
display the value in decimal would be better.

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
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_CR);
>> +    val |= BIT(0);
> 
> If you only set bit 0 do you only want to show bit 0 in 
> global_flush_req_show() above? The sysfs files should be divided up by 
> function rather than dumping the whole register, otherwise tools need 
> their own copy of the fields to interperet them.

Got your point here. In the show function, we only need read the value 
of the bit 0 and display the value.

Thanks,
Jie

> 
> 


