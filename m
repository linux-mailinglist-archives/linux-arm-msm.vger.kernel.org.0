Return-Path: <linux-arm-msm+bounces-79127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD00C1391E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9F5D4E03F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 08:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FA1283FE3;
	Tue, 28 Oct 2025 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHe8njQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F921576E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640724; cv=none; b=FLq/6TxiNjkpysEj90x699rzFjImW0ggq7hsxo3dpxGD8NXzXURMj/lMbfX2mlRHu1gg+8F3FDwG/r3/XEa2QWewloO8xCPHivhLqhVqSdvaKX6INCjqJ6kX0RJU3JMRCusLNH6qr2PP9Z4GNUd80b4BvCRoFNLhAHpvX/HcZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640724; c=relaxed/simple;
	bh=CK9O/h9PmMpJaumHuyABmF+wXmXCinpZaff05WA3CIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ng/EQ3a1ZMEZFYVfG5w9FJLiQUmcLCIRrA6uQhyOu4o+d81S33vNEa6hmXwvsMKXVwoUlC6BIlP+kO65tHM/h65o5YPpN3pyJRZzqrGF3XZioKdpABR+CRLOnqb55pdY6cVOVXzWMqfu7gKxoiq4lwnIqQCbAH/mZU2yF1zIFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHe8njQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S45HHx573510
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr8+i4dieCUMhOFBhZ6AFD4YLUnBtGBf1ti60Ls8B38=; b=NHe8njQDuF3hHAed
	RaAr3nr7k8QfMiwgScJgWkZgbK4Ieo/ZokOyyPGNDJT7zYf2tkDeuNxS9YLtdn0k
	SuBJNMiVT5V2Lv1y02qS82O7UUMePtR7Z+9FNldPu/33BhkAmMZTc50YXv59eq5H
	2QTH/Ho+10u9OgmPWP7HaU0NbURv9uC9zCn1l7qSJ4tixUM6RiQ8P6pc8+uHH7h3
	wYTWEKCELDy+hzZmJ5X73+86hfQJnnBU5sbaSPvKsZqmXGtX8MKbCgMS/oheU+A5
	XltOBSl2rZDsJxiMEK4XcJN6u2ti7YSuYyunpvo/JoLd8uViCsN9i8SEgfUzS3u/
	YyoAZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge8q6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:38:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290c2d13a01so42294415ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 01:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761640721; x=1762245521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr8+i4dieCUMhOFBhZ6AFD4YLUnBtGBf1ti60Ls8B38=;
        b=NrdRyXII+kxbmzbrwcPMdFZqkyyU410v8r1sK1MOsl804BNXsC9KcytZhKVToZ3k+m
         Wc7atEBZrF6jLL86XVXXYv/63VqlMR2L12OUMnMa33Sls/eCueSy2C4wBGiFpMnOvyGz
         yQHF893X9MOg/sWSvSmNFO7Y/IQeZNGV+uVsMVFoIXNzT+k5flcoggi99LrfldjXJKnK
         TPqCh3RkOfzmIrwrZinJkMZxofbx6bOKXOtqjvH2uCu5jLFagMcNVP3i5gZeiixA6C2C
         B1mvfX0jLXFIpyeP1Ziv+5JBBca2uQ/xZ+gAsyHIJIK76KglSqA5raTA/hCJeKUoBIig
         C90A==
X-Gm-Message-State: AOJu0Ywmlt0tKN9R8ug5A/uq0w9zXMhoIwhtMa/NuZQ0+aIkOLfvvW3F
	K7yjVyt5fJc9AKRKRM0x93iXZyKvuX70hfZ/E8VrnOFYjjlGMk9HWrk6I5KdmT2bx4GFqv1crXc
	FVNDFvTZ8ISBzNBx3NPHNILJT2Ad6PHWUrEJaV8Z7SpBinWsM75LYADjYRub9JDU/PhgH
X-Gm-Gg: ASbGnctr4qweHzrr70KEjUDkGeun5oFp5EsXRJvnPdGKVtYnYmMKpEAH4iy2TjDZ3LT
	7DS5fiXNBj5EbrYfZcjKc4JqM0oic3v8R/rpol0Vr3d1ejjFg1bdLVjUdcvN2zOchpTi87/Rnh8
	s8pFdhzrnFrCrVCp/Y39QAaROgPfU+1edcXsQJ88cJnr4L1vplgofSdO8N2YOA7GR6DTWpKdrsN
	Of1m1XVRx3X+tvQAypllSA2B5gFU7MLhzbPSJLoJHMvjIdhdvjhht6RZZpSasJOBJwzfu3bCpkG
	3Kbwrmolt5NI0rljGBd9hqyxBdijshN/d9KYjw9GKfqL1HHdqMuWJBsd0uYpmDxIWK6Eymc8p5P
	Q7SgrLfh7FUV2Gh/KMicBd6scx2onbflk1SxO1va5qzOPGV/PoBjk
X-Received: by 2002:a17:903:1a67:b0:294:9132:75d2 with SMTP id d9443c01a7336-294cc76659cmr25411305ad.25.1761640721256;
        Tue, 28 Oct 2025 01:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsiUHXuoFI2lMXRyC2KpD8nA8h3YvJAfAf8TZJLyassjBfe7izxKv57V5xxmVd3TZ5NRK17A==
X-Received: by 2002:a17:903:1a67:b0:294:9132:75d2 with SMTP id d9443c01a7336-294cc76659cmr25411075ad.25.1761640720407;
        Tue, 28 Oct 2025 01:38:40 -0700 (PDT)
Received: from [10.133.33.253] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0996esm107206015ad.28.2025.10.28.01.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:38:39 -0700 (PDT)
Message-ID: <6dcf793f-6f1c-4900-82e9-a6b53d45cdf9@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:38:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] coresight: tpdm: add static tpdm support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com>
 <20251013-add-static-tpdm-support-v3-2-a720b73e83db@oss.qualcomm.com>
 <7386e009-2d53-4a0b-8c83-a84f51b4b79a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7386e009-2d53-4a0b-8c83-a84f51b4b79a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OOlDZR3Kvpuaupdb3B19L5hmFRq96HXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3MiBTYWx0ZWRfXylp+0HL/LlH8
 d/1ygC+1Fzo0EmUug+4dijmTHkbM2Eq+09TTyhiykkEuzv7DJ2Tl50dcBe9IyG5N8o0dSxBgkdA
 zPGlewtZQTbz3EhQqdyy15DE+3IwBBzmgnM/AILFW0IVocu8bd31/fGQvcD8fgyJT1/XbTJfuRr
 WjO5uYeeQGPGSb0vFEbo84Mz5TH5ZbTuP2oJiZgoBAuARPwzVQxX9Mm0PX/2f4gX0vzAPDZr+wO
 aYDq/W0EWaoehOF1houWaz4JGTK9f5nqmYG4Q7tfnT+7goMM3Bi3iOs1pDgiqATvNMIuCed93op
 UuVc2aZ11j1Sz+3oFmalBmpw6Esubu3Qo5oBvEJ9b78WvaTBPJAVcphySg0i0wFpi4coTx/CNtb
 wfbI5EHvSds2MtPLWwF57r2XNw3UFQ==
X-Proofpoint-GUID: OOlDZR3Kvpuaupdb3B19L5hmFRq96HXQ
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=69008111 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bEI7897pd3NgvWUkXe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280072



On 10/27/2025 5:17 PM, Suzuki K Poulose wrote:
> On 13/10/2025 07:11, Jie Gan wrote:
>> The static TPDM function as a dummy source, however, it is essential
>> to enable the port connected to the TPDA and configure the element size.
>> Without this, the TPDA cannot correctly receive trace data from the
>> static TPDM. Since the static TPDM does not require MMIO mapping to
>> access its registers, a clock controller is not mandatory for its
>> operation.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |   9 ++
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 148 +++++++++++++++++ 
>> ++++------
>>   drivers/hwtracing/coresight/coresight-tpdm.h |   8 ++
>>   3 files changed, 131 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..4e93fa5bace4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -68,6 +68,15 @@ static int tpdm_read_element_size(struct 
>> tpda_drvdata *drvdata,
>>       int rc = -EINVAL;
>>       struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev- 
>> >dev.parent);
>> +    if (coresight_is_static_tpdm(csdev)) {
>> +        rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +                          "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> +        rc &= fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>> +                           "qcom,cmb-element-bits", &drvdata- 
>> >cmb_esize);
>> +
> 
> This doesn't match the "dynamic" tpdm case ? We mandate that static
> TPDMs have DSB and CMB. I would rather set the appropriate flags in
> 
> tpdm_drvdata->dsb/cmb in the TPDM driver for static tpdms and not
> let the "static" vs "dynamic" creep into the TPDA and other users.
> 
> e.g., in TPDM driver:
> 
> if (static_tpdm()) {
>    tpdm_data->dsb = has_dsb_element_bits_property;
>    tpdm_data->cmb = has_cmb_element_bits_property;
> }

Well noted, will fix in next version.

> 
> 
>> +        goto out;
>> +    }
>> +
>>       if (tpdm_data->dsb) {
>>           rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>>                   "qcom,dsb-element-bits", &drvdata->dsb_esize);
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index 7214e65097ec..1766b0182819 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -495,7 +495,9 @@ static int tpdm_enable(struct coresight_device 
>> *csdev, struct perf_event *event,
>>           return -EBUSY;
>>       }
>> -    __tpdm_enable(drvdata);
>> +    if (!coresight_is_static_tpdm(csdev))
>> +        __tpdm_enable(drvdata);
>> +
>>       drvdata->enable = true;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -551,7 +553,9 @@ static void tpdm_disable(struct coresight_device 
>> *csdev,
>>           return;
>>       }
>> -    __tpdm_disable(drvdata);
>> +    if (!coresight_is_static_tpdm(csdev))
>> +        __tpdm_disable(drvdata);
> 
> minor nit: It is much safer to do this check in __tpdm_xxable() and
> return early.
> 

well noted, will fix it in next version.

>> +
>>       coresight_set_mode(csdev, CS_MODE_DISABLED);
>>       drvdata->enable = false;
>>       spin_unlock(&drvdata->spinlock);
>> @@ -1342,10 +1346,9 @@ static const struct attribute_group 
>> *tpdm_attr_grps[] = {
>>       NULL,
>>   };
>> -static int tpdm_probe(struct amba_device *adev, const struct amba_id 
>> *id)
>> +static int tpdm_probe(struct device *dev, struct resource *res)
>>   {
>>       void __iomem *base;
>> -    struct device *dev = &adev->dev;
>>       struct coresight_platform_data *pdata;
>>       struct tpdm_drvdata *drvdata;
>>       struct coresight_desc desc = { 0 };
>> @@ -1354,32 +1357,33 @@ static int tpdm_probe(struct amba_device 
>> *adev, const struct amba_id *id)
>>       pdata = coresight_get_platform_data(dev);
>>       if (IS_ERR(pdata))
>>           return PTR_ERR(pdata);
>> -    adev->dev.platform_data = pdata;
>> +    dev->platform_data = pdata;
>>       /* driver data*/
>>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>>       if (!drvdata)
>>           return -ENOMEM;
>> -    drvdata->dev = &adev->dev;
>> +    drvdata->dev = dev;
>>       dev_set_drvdata(dev, drvdata);
>> -    base = devm_ioremap_resource(dev, &adev->res);
>> -    if (IS_ERR(base))
>> -        return PTR_ERR(base);
>> +    if (res) {
>> +        base = devm_ioremap_resource(dev, res);
>> +        if (IS_ERR(base))
>> +            return PTR_ERR(base);
>> -    drvdata->base = base;
>> +        drvdata->base = base;
>> +        ret = tpdm_datasets_setup(drvdata);
>> +        if (ret)
>> +            return ret;
>> -    ret = tpdm_datasets_setup(drvdata);
>> -    if (ret)
>> -        return ret;
>> +        if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> -    if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> -
>> -    if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>> +        if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>> +    }
>>       /* Set up coresight component description */
>>       desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
>> @@ -1388,34 +1392,51 @@ static int tpdm_probe(struct amba_device 
>> *adev, const struct amba_id *id)
>>       desc.type = CORESIGHT_DEV_TYPE_SOURCE;
>>       desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>>       desc.ops = &tpdm_cs_ops;
>> -    desc.pdata = adev->dev.platform_data;
>> -    desc.dev = &adev->dev;
>> +    desc.pdata = dev->platform_data;
>> +    desc.dev = dev;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>> -    desc.groups = tpdm_attr_grps;
>> +    if (res)
>> +        desc.groups = tpdm_attr_grps;
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>>           return PTR_ERR(drvdata->csdev);
>>       spin_lock_init(&drvdata->spinlock);
>> -    /* Decrease pm refcount when probe is done.*/
>> -    pm_runtime_put(&adev->dev);
>> -
>>       return 0;
>>   }
>> -static void tpdm_remove(struct amba_device *adev)
>> +static int tpdm_remove(struct device *dev)
>>   {
>> -    struct tpdm_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(dev);
>>       coresight_unregister(drvdata->csdev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int dynamic_tpdm_probe(struct amba_device *adev,
>> +                  const struct amba_id *id)
>> +{
>> +    int ret;
>> +
>> +    ret = tpdm_probe(&adev->dev, &adev->res);
>> +    if (!ret)
>> +        pm_runtime_put(&adev->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void dynamic_tpdm_remove(struct amba_device *adev)
>> +{
>> +    tpdm_remove(&adev->dev);
>>   }
>>   /*
>>    * Different TPDM has different periph id.
>>    * The difference is 0-7 bits' value. So ignore 0-7 bits.
>>    */
>> -static const struct amba_id tpdm_ids[] = {
>> +static const struct amba_id dynamic_tpdm_ids[] = {
>>       {
>>           .id    = 0x001f0e00,
>>           .mask    = 0x00ffff00,
>> @@ -1423,17 +1444,76 @@ static const struct amba_id tpdm_ids[] = {
>>       { 0, 0, NULL },
>>   };
>> -static struct amba_driver tpdm_driver = {
>> +MODULE_DEVICE_TABLE(amba, dynamic_tpdm_ids);
>> +
>> +static struct amba_driver dynamic_tpdm_driver = {
>>       .drv = {
>>           .name   = "coresight-tpdm",
>>           .suppress_bind_attrs = true,
>>       },
>> -    .probe          = tpdm_probe,
>> -    .id_table    = tpdm_ids,
>> -    .remove        = tpdm_remove,
>> +    .probe          = dynamic_tpdm_probe,
>> +    .id_table    = dynamic_tpdm_ids,
>> +    .remove        = dynamic_tpdm_remove,
>>   };
>> -module_amba_driver(tpdm_driver);
>> +static int tpdm_platform_probe(struct platform_device *pdev)
>> +{
>> +    struct resource *res = platform_get_resource(pdev, 
>> IORESOURCE_MEM, 0);
>> +    int ret;
>> +
>> +    pm_runtime_get_noresume(&pdev->dev);
>> +    pm_runtime_set_active(&pdev->dev);
>> +    pm_runtime_enable(&pdev->dev);
>> +
>> +    ret = tpdm_probe(&pdev->dev, res);
>> +    pm_runtime_put(&pdev->dev);
>> +    if (ret)
>> +        pm_runtime_disable(&pdev->dev);
>> +
>> +    return ret;
>> +}
>> +
>> +static void tpdm_platform_remove(struct platform_device *pdev)
>> +{
>> +    struct tpdm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>> +
>> +    if (WARN_ON(!drvdata))
>> +        return;
>> +
>> +    tpdm_remove(&pdev->dev);
>> +    pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +static const struct of_device_id static_tpdm_match[] = {
>> +    {.compatible = "qcom,coresight-static-tpdm"},
>> +    {}
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, static_tpdm_match);
>> +
>> +static struct platform_driver static_tpdm_driver = {
>> +    .probe        = tpdm_platform_probe,
>> +    .remove        = tpdm_platform_remove,
>> +    .driver        = {
>> +        .name    = "coresight-static-tpdm",
>> +        .of_match_table = static_tpdm_match,
>> +        .suppress_bind_attrs = true,
>> +    },
>> +};
>> +
>> +static int __init tpdm_init(void)
>> +{
>> +    return coresight_init_driver("tpdm", &dynamic_tpdm_driver, 
>> &static_tpdm_driver,
>> +                     THIS_MODULE);
>> +}
>> +
>> +static void __exit tpdm_exit(void)
>> +{
>> +    coresight_remove_driver(&dynamic_tpdm_driver, &static_tpdm_driver);
>> +}
>> +
>> +module_init(tpdm_init);
>> +module_exit(tpdm_exit);
>>   MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("Trace, Profiling & Diagnostic Monitor driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.h
>> index b11754389734..9f52c88ce5c1 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -343,4 +343,12 @@ struct tpdm_dataset_attribute {
>>       enum dataset_mem mem;
>>       u32 idx;
>>   };
>> +
>> +static inline bool coresight_is_static_tpdm(struct coresight_device 
>> *csdev)
>> +{
>> +    struct device_node *node = csdev->dev.parent->of_node;
>> +
>> +    return (csdev &&
>> +        of_device_is_compatible(node, "qcom,coresight-static-tpdm"));
> 
> Why do we have to go check the firmware table all the time ? Could we 
> not cache this in drvdata ? Or even better, we can use the csdev->access
> 
> by using :  coresight_device_is_tpdm()
> 
> return (coresight_device_is_tpdm(csdev) && !csdev->access->base);

That's much better than mine, will fix it in next version.

Thanks,
Jie

> 
> Suzuki


