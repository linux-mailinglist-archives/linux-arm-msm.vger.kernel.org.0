Return-Path: <linux-arm-msm+bounces-70995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E16B37F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 11:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607AE361702
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 09:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3DE283FDF;
	Wed, 27 Aug 2025 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gp6Gog+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D22299927
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288126; cv=none; b=WyKhzCFznbK8+eUP4QGfZEXdPMSNaOsYCQCTgs2HgBZtI3Bx5qk5lsSGJKqsuENB0OJjX2QMi2e7XZK+ijNdEQSheFIPkSouaZeC2iGh7DYTuiyzhRca2aEYb79MBkpZB2OpzhM1b2AF/9ae82nhWKE4FXSE25Lk69gylMMi9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288126; c=relaxed/simple;
	bh=PIwn2V4YS3wMdr0tSgltoQZvAPWbCRTaiD2JFY6WSRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awkK6ZgQbjRU8EAx/mlYMCX6P3xN75iiE/5ev7AsuhdBaSn9CXEFcP9ptbw9PNzMXp4F4UO3BrZ52d+OtEMl+L4dpZLdjH2j6VL8sLBk0ppm5aexNSixunpgZ7EEv7HoQlf8gRH1kUkUOtkb0lY5g2C7c4B44ITjjHPxpsLUaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gp6Gog+s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kTX2003899
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HdTnP5QHwQGCOtYD2hb1Prc2QDYDtKqL2msgNtal+s=; b=gp6Gog+sVWMDkmwu
	bXT9zIDGoaehq+DQOlI6ElG1Ny6cu5HwsHSolaqpsS29nqRo/KTJDIdd20f3AfFH
	nT3lesr629vYxdVUl2kvMBhqIvXJBlDUvy4arpk0P+kxij19s4kb4QuA0uuC2JnW
	hzvVHI1XvsKjQyIs5djn/hB1QNEOg5SSwVoEan7O6o6wRgjEZtFHnVftHdJgNY5x
	B6c5UgJXbvFrmjCynLjkgFQYUUvhJTuZAsmny5uJ8utS514Ndp50R4/tiDKkSrAS
	Hcigk0BW05A/caTbSnQgJjiCVdJOzdS7ThydWgpb3VQxN6V35w5ZLd0B/5FDVsdu
	DG3iSA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8c9tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 09:48:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce13aso119585375ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756288123; x=1756892923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HdTnP5QHwQGCOtYD2hb1Prc2QDYDtKqL2msgNtal+s=;
        b=DOSYXbkhDN03AA5zcljYQ/LbARtPoGtwutPzPOQuiEt0yPO33yxfSKbVsDuXz++DyH
         OzHVCpSZtYKW/IRONJO1vVlHnFC/WV52pkwrUDzNOJLhuYA6rVTwy2GEvC/Lvwd6pQTy
         3MMW487PeUxKXRz/BE5qT8UXvTdpy75og3aqzRjf9KNyioj4pKQp/uARpU5Q3CzkMn50
         yF9hWCBWDPq/M/kMpYUoLpXyfpyMJ2zCPoD6VmEBUSTlbyzEn5pkGlt6LSVBsR3Kzgik
         S7vx9CqhMo2dbI9BMCGTo3scOCNZOecoq9ILaEhTCXIqHoMNmxPYHTtNqAeQr1RmC/mB
         dC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWooATylVhmvCU7F7tGGuOpocPKqsxgAOV+2diFL1G2SS42L52zUFdQMBkjI6ZxNiWmNVWnHdTxYxg7h6IR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7aM7zWLSrwtpA1lKhGz30Cn2vI0rtkpUVnUslQ19g1KOdjDkr
	Pw+Oy1BUkwjFHnfg64Y+50Dq/J+tAtIgllKZh79jUsMr6OPr8CsKJi9CKIfjeZ+RVB1cw5Z9XNH
	UaWOpYGYMZ4QvX+cTVgxMFRmZK/JRZ0mhpsW4vH8KQgg16mR8LLgrhIvEfnIFBJEb9QgY
X-Gm-Gg: ASbGncteemZIybnjxhRwnBF7Q3/3yaS5NsE0GqD0z1MXq8dZpDT6ui955HuGA6vckTJ
	pcS5ph6Kargb598Rm7I3gt4OeOMvoaqnEe/Wt6DaHscD9wVXUNt/ky6BpvV8Z7em0wjzbFy1MDO
	+jt2pcW35gG5WMZq0fCykE9U9BgfDEQGRvLWFLZ5QnuZLS2ky0fUqnph3k/1XUPghIxV3bxyx/w
	kSynBZlcSIQnzo7+tSVwpky9Lk7crYu30av0hi0i7vX/12geAhozqlers6NcB+xR3S/RDBCQ+5H
	CAMkKbqAf+KhSf0D3XyWOm/Y2R6BFlfnemAdAT4nQATnFl4ElLUV6PIZxD7RBU/xqizFEFoJkUf
	3Q/RNdYrAEhGoN2P0hpXcRCTKXrKYLQ==
X-Received: by 2002:a17:903:1b43:b0:242:cf0b:66cd with SMTP id d9443c01a7336-2462ef409a0mr239136565ad.34.1756288122739;
        Wed, 27 Aug 2025 02:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdYfLujcpHIuYuPpdbaf+LeMGQ3BjzTtQgLFI4UMOmo6EcN71ZQccOEPzQ+NRJaIY2fr/phw==
X-Received: by 2002:a17:903:1b43:b0:242:cf0b:66cd with SMTP id d9443c01a7336-2462ef409a0mr239136295ad.34.1756288122123;
        Wed, 27 Aug 2025 02:48:42 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2488bc5b32esm22486785ad.82.2025.08.27.02.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:48:41 -0700 (PDT)
Message-ID: <78d2ab99-f304-4fab-bc7b-859c8aa781d6@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 17:48:33 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <b1f79a26-97e1-40f4-b076-51d5c2abe736@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8Q0_HpDKmU1pu9Kbu-K7Hi82ZVpGhVX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXxaQ6S7w0F4Xf
 oL4wYp9U4GvmRKGsHtumCb0RdBDKlQkVEG2PKJmPmIAImOhMazroGxVVU0YK1e9nSoEIcYFQIch
 wcHOQNaCgxwDyraNnANxmeLQdPvLVCQY+4941tp3mtks+o6wxn36qTc9OVPRHIIe0xmu9oRvVw5
 gBXLrduMZNPQEyud/irXY4pegBBfuY8Zx5zoG9igBfdLNvz438yuIxQfB0pSvMEEJfdoEsQOJoW
 u0VsDJP3ifgsD1MdXBywFK2lh/2LDInFZ/2ejkdZr3qtQ/RkWvUh/z7hpB/nhXFSjTxBK68qCKH
 Zn/krJP5Ze7kA8pnzox9q4RDWrIEi8O2uz8Dh4f3gUP8Of6crBeHQ0PUPyUpl/qpLpRFB9+PpWE
 6EDGbuTw
X-Proofpoint-GUID: 8Q0_HpDKmU1pu9Kbu-K7Hi82ZVpGhVX8
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aed47b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DHl-jJOTjm6sWMnFDpYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044



On 8/27/2025 5:17 PM, James Clark wrote:
> 
> 
> On 27/08/2025 5:20 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>> for port i, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index fb651aebeb31..2cf2dcfc13c8 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>>           Value 0 means raw channel mapping mode. Value 1 means 
>> channel pair marking mode.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 430f76c559f2..8b1fe128881d 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RW(cmbchan_mode);
>> +static ssize_t port_flush_req_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>> +    CS_LOCK(drvdata->base);
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> Still missing the 0x prefix

Will re-check rest of the codes and add prefix. Sorry I missed it during 
the review process.

> 
>> +}
>> +
>> +static ssize_t port_flush_req_store(struct device *dev,
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
>> +    if (!drvdata->csdev->refcnt || !val)
>> +        return -EINVAL;
>> +
>> +    val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
> 
> Using FIELD_PREP() now that it's the full width of the register makes 
> less sense. Especially when there is no corresponding FIELD_FIT() check, 
>   which is fine because everything always fits. But if you didn't know 
> the mask was the full width you'd wonder if the check is missing.
> 
> I would just write val directly to TPDA_FLUSH_CR so it's simpler.
> 
> It should also have been val = FIELD_PREP(...)

Yeah, it should have been val = FIELD_PREP(...) here... sorry for the 
mistake here..

I was thinking the unsigned long here could be 64 or 32 bits and we only 
need the value of the lower 32 bits. So that's why I am using val = 
FIELD_PREP(...) here. We shouldn't write a value greater than UINT32_MAX 
to the register.

Thanks,
Jie

> 
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    CS_UNLOCK(drvdata->base);
>> +    writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>> +    CS_LOCK(drvdata->base);
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(port_flush_req);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_trig_async_enable.attr,
>>       &dev_attr_trig_flag_ts_enable.attr,
>> @@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
>>       &dev_attr_freq_ts_enable.attr,
>>       &dev_attr_global_flush_req.attr,
>>       &dev_attr_cmbchan_mode.attr,
>> +    &dev_attr_port_flush_req.attr,
>>       NULL,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 8e1b66115ad1..56d3ad293e46 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
>> @@ -35,6 +36,7 @@
>>   #define TPDA_SYNCR_MAX_COUNTER_VAL    (0xFFF)
>>   #define TPDA_MAX_INPORTS    32
>> +#define TPDA_MAX_INPORTS_MASK    GENMASK(31, 0)
>>   /* Bits 6 ~ 12 is for atid value */
>>   #define TPDA_CR_ATID        GENMASK(12, 6)
> 
> 


