Return-Path: <linux-arm-msm+bounces-80681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822CC3E2C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 02:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 104284E3ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 01:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764FD2FB094;
	Fri,  7 Nov 2025 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmLq14y6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZikfzne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC91D7E42
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762480678; cv=none; b=NZdhPL6raTyZyS/hgLC7h1CmrGrr7ScyB628OdaX3VdAcE4tFBq62kOalvlpTzUkfFWLV2b2J3rW3mxtpeecwxyz6I4zFODeD2LH0JzzH0YRgAaIel9CqXKfhcgsspZzzlb2GZmVGJkgMl4br+ZxYnN8E18sDh6TFD3hXkb2CYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762480678; c=relaxed/simple;
	bh=kX2Ce4/C+UC3O2L4unXIa74bylbT9eMPmBYnI1yH2Zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qep+HFepAXi2imtPkYhvFII/O+YQ/upAk6XtRwiCJUZ0EYLqq+xTRBL3j9vf4zi6zBQ+G0hfrHQdMpuudYECMCoEGQg0ysaNpUhvzXB4y4wODFHlJHq6atVfCj7KYC/q1DCGqq0VnfzWe5UFHQBBjFg9oG+8YCBmxLsCtvgv6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmLq14y6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZikfzne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Jf8fQ629446
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 01:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EljJyR6oPZ/+ZCDlpPdYJCwz7DLe2D+haF/M0tkYM4=; b=jmLq14y6f6n5kIke
	hr5YslCDb9ClxjBcWgzO6NniB2QAJoLZLVrt+IyJZWCWmNprpw6dhMvXLcSTdVQ2
	Nc0lL4dnCFt7tBK9i4j9GgTMWLh8R/nq68uGS5rCrBVuEruTD0+tNL88TwMObt1y
	w3pv4D98SlyoanKmRFYX1tTg4yxfajkF0BqlIdSc4JyZL4jgbR6jzKkPTd2TwzDD
	LUELCwgVhgPKn0RwAyvPxmx0kUzjn2taTTSbcFhhyCtrpBXojnnY8KQZNCFgNLWl
	OTo8AJojaClmz/pWlECykNrUQucK1VusA1E7NZcTy3lOTFQ5jx8vrBsTHTyqnWho
	xpIZYg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92230v1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:57:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297b355d33eso3818595ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 17:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762480673; x=1763085473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EljJyR6oPZ/+ZCDlpPdYJCwz7DLe2D+haF/M0tkYM4=;
        b=IZikfznepOqCO3ozJ5KOKq6jZlbs2efyVYOChWZXErr6Mo9C3lf70rZ8vO57UVkXPR
         IqGr7GDMlXNwDKjSumD+6DmiRd6HJ7ujWNVDbmJ9I3pfI6C6r22T4fQqR69SMuvXtAn7
         V6VcQxi9fVJXUlR4vwoF40PCxj0JGuiM5IMk67pF78R4FmpCGFH5auj0GkrapP3QmfVj
         0/Z6hmlhXyvqSDrRJbWUViW+mqkMLekQKF/OVnjqZNlIuTBbKZrtl5K2WRyi50xBQFJN
         2znvbv4enAWvwQBeK7I9REXXRGBkYy1/uAQHUhU+diah/Qi9kIsWr4FDaiuFMuct5Y5f
         JqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762480673; x=1763085473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EljJyR6oPZ/+ZCDlpPdYJCwz7DLe2D+haF/M0tkYM4=;
        b=Zl4fImUsgSaXc9kors2CpGbTHwoMZwONiicemMIXnUi2Ck+pGPOTR/41g3njDQ/pgi
         tW30Pfk20dtP3n6Lxx6FRP5jaF8zEtK5DUwa+ixRHHEuw+6MwQUC1zj72O6p34c06n9k
         yXwCagakUEbR+AoB36nCcs7cFa+CpG8XH5M0VfKgyhihHbTksjvsjatiMRn/6v4Zd4Qs
         DKQczkoNWH00I5jezCGSeCD25oE/dFWBZfxqMg0trcjAcoK+sVgDMgEMJHgYEXyFZpHU
         T3BovuZ8ZusljVaOMnxtz/dFQ8thg2Y3otZ5UDDq1CD2DFBZmXkX5LxGhsjtk8QbbBEg
         y2TQ==
X-Gm-Message-State: AOJu0Yz+1Zb+pY9fyYRsBfxLgQhvAsCvlycpGVLI5J6+6E44Srhz4l8j
	9DM62YHODpppmW6rORFN76Q2O5OxTpjAMjII4ZUzL/v5inxq1DzI0mgv5HdPy1HWfVNmCD8f2oy
	iaB6mICAJyNxxlrYD/rmY25MStU98U58KLUYutilLuyGQ1g3mksIz9tYwZU9YqVHcbXTmmTCmwi
	KdE+A=
X-Gm-Gg: ASbGnctPiaYa+V+lIHKImw+SkkBAd2EGBWPdBozWPVm/Bg97KjLdfasTzgGab5S3P3O
	ek5o8enx5ued5L61Yf09qoaT6XNjvZluH1LAyompX2nuTt6MOuLXb7NTDCndVOdpUXJEDynxWR0
	P5byEFAXK3WxjPzwJCHpwld6RFfcNwP+viO6EVKrg2tc0LtecNz1/w5FSWZsiQA7ee6r/P6S11K
	6diI0JFXypLGgUIqOuXM9a7vLqUN8EQhmNgDv98GfLYqFeViizSyaSxPTVXobkR6aEgkZ/MYYsp
	SXWbYgF2q4xhrqzD0/9f0HFTUoNwiPoa+SacjVm8AaBXow5/X7f1RxCfPVkMqzu6O1G7rDpyIYL
	CetHIh1JxOJSJNwZZzafgTB8QDbt6hpk2dEg/5y706fh/7iLH9n9NR2dMJDqnxjoj
X-Received: by 2002:a17:902:d2c4:b0:250:1c22:e78 with SMTP id d9443c01a7336-297c03b6df0mr20865775ad.1.1762480673119;
        Thu, 06 Nov 2025 17:57:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN2WHOvxVjoRHogBQ6mT4MYtKzUWEY/3Z6Rav2i0Ptde/rSoguqPyxWHGiLXSo9GSjMFHURw==
X-Received: by 2002:a17:902:d2c4:b0:250:1c22:e78 with SMTP id d9443c01a7336-297c03b6df0mr20865415ad.1.1762480672507;
        Thu, 06 Nov 2025 17:57:52 -0800 (PST)
Received: from [10.133.33.157] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968253sm42055155ad.20.2025.11.06.17.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 17:57:51 -0800 (PST)
Message-ID: <e7a63d17-fcad-4447-8a28-53a8267d7c08@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:57:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] coresight: tpdm: add static tpdm support
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
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
 <20251028-add_static_tpdm_support-v4-2-84e21b98e727@oss.qualcomm.com>
 <eaee1591-2b3e-4edf-85a0-ac8f3591eae2@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <eaee1591-2b3e-4edf-85a0-ac8f3591eae2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAxNCBTYWx0ZWRfXwJj8L3uGjdn8
 VUJYRTHOyz8plAd3GC2wjOlUOvHXRzsYUZi4SfWypv29eBBhX5wXVn5BZ0VFQmCt/DoqbRVXSiF
 fEqKG2pbEZ2H1zbkTbKO0XDJ3ux8SRqT4yCRC6/NYwAldpUq1lznKAPtLOzUz17lH3LRKn8915o
 6Fl6KKnc6HIk7RlB0qn+9olNXHE7XgeFlmFVxP5YgZLJje/qBS+d/S6Dlj8l9QJhzG3niuUNPCi
 8QlTb0jdMvpNGEvZTgLz/kj39UJrCbr+4MrXVMzw3vqxKEtYJBvZaAvBgspS4AuLvEj60VjdFg6
 MKIUWNFP8M/oOhocBy9F9uypRmx4X+C5pXY7VV4KwWCt2XM9Oh0TFmz08onnozQ1I2psAhw5bn7
 AXVeoadhS/XruNwqiSC1u8NxNN1icw==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690d5222 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TmN1k0FiWq96c6v3KzkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: pFi_XPw6ZUSwQywW0UPNFRUqmxk_CbDT
X-Proofpoint-ORIG-GUID: pFi_XPw6ZUSwQywW0UPNFRUqmxk_CbDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070014



On 11/6/2025 9:22 PM, Suzuki K Poulose wrote:
> On 28/10/2025 10:11, Jie Gan wrote:
>> The static TPDM function as a dummy source, however, it is essential
>> to enable the port connected to the TPDA and configure the element size.
>> Without this, the TPDA cannot correctly receive trace data from the
>> static TPDM. Since the static TPDM does not require MMIO mapping to
>> access its registers, a clock controller is not mandatory for its
>> operation.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tpda.c |   7 --
>>   drivers/hwtracing/coresight/coresight-tpdm.c | 174 +++++++++++++++++ 
>> +++++-----
>>   drivers/hwtracing/coresight/coresight-tpdm.h |  12 ++
>>   3 files changed, 154 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 333b3cb23685..3a3825d27f86 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -22,13 +22,6 @@
>>   DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
>> -static bool coresight_device_is_tpdm(struct coresight_device *csdev)
>> -{
>> -    return (coresight_is_device_source(csdev)) &&
>> -           (csdev->subtype.source_subtype ==
>> -            CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
>> -}
>> -
>>   static void tpda_clear_element_size(struct coresight_device *csdev)
>>   {
>>       struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/ 
>> hwtracing/coresight/coresight-tpdm.c
>> index 7214e65097ec..0e3896c12f07 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -470,6 +470,9 @@ static void tpdm_enable_cmb(struct tpdm_drvdata 
>> *drvdata)
>>    */
>>   static void __tpdm_enable(struct tpdm_drvdata *drvdata)
>>   {
>> +    if (coresight_is_static_tpdm(drvdata->csdev))
>> +        return;
>> +
>>       CS_UNLOCK(drvdata->base);
>>       tpdm_enable_dsb(drvdata);
>> @@ -532,6 +535,9 @@ static void tpdm_disable_cmb(struct tpdm_drvdata 
>> *drvdata)
>>   /* TPDM disable operations */
>>   static void __tpdm_disable(struct tpdm_drvdata *drvdata)
>>   {
>> +    if (coresight_is_static_tpdm(drvdata->csdev))
>> +        return;
>> +
>>       CS_UNLOCK(drvdata->base);
>>       tpdm_disable_dsb(drvdata);
>> @@ -595,6 +601,30 @@ static int tpdm_datasets_setup(struct 
>> tpdm_drvdata *drvdata)
>>       return 0;
>>   }
>> +static int static_tpdm_datasets_setup(struct tpdm_drvdata *drvdata, 
>> struct device *dev)
>> +{
>> +    /* setup datasets for static TPDM */
>> +    if (fwnode_property_present(dev->fwnode, "qcom,dsb-element-bits") &&
>> +        (!drvdata->dsb)) {
>> +        drvdata->dsb = devm_kzalloc(drvdata->dev,
>> +                        sizeof(*drvdata->dsb), GFP_KERNEL);
>> +
>> +        if (!drvdata->dsb)
>> +            return -ENOMEM;
>> +    }
>> +
>> +    if (fwnode_property_present(dev->fwnode, "qcom,cmb-element-bits") &&
>> +        (!drvdata->cmb)) {
>> +        drvdata->cmb = devm_kzalloc(drvdata->dev,
>> +                        sizeof(*drvdata->cmb), GFP_KERNEL);
>> +
>> +        if (!drvdata->cmb)
>> +            return -ENOMEM;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static ssize_t reset_dataset_store(struct device *dev,
>>                      struct device_attribute *attr,
>>                      const char *buf,
>> @@ -1342,10 +1372,9 @@ static const struct attribute_group 
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
>> @@ -1354,32 +1383,37 @@ static int tpdm_probe(struct amba_device 
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
>> -
>> -    if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> +        if (drvdata && tpdm_has_dsb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
>> -    if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> -        of_property_read_u32(drvdata->dev->of_node,
>> -               "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
>> +        if (drvdata && tpdm_has_cmb_dataset(drvdata))
>> +            of_property_read_u32(drvdata->dev->of_node,
>> +                         "qcom,cmb-msrs-num", &drvdata->cmb_msr_num);
> 
> minor nit: drvdata is guranteed to be !NULL, as we err out if
> it was. This can be fixed up as separate patch.

Acked. We dont need check the drvdata here and it has been gurranted to 
be !NULL. Will fix it with separate patch.

Thanks,
Jie

> 
> Suzuki
> 
> 
> 
>> +    } else {
>> +        ret = static_tpdm_datasets_setup(drvdata, dev);
>> +        if (ret)
>> +            return ret;
>> +    }
>>       /* Set up coresight component description */
>>       desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
>> @@ -1388,34 +1422,51 @@ static int tpdm_probe(struct amba_device 
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
>> @@ -1423,17 +1474,76 @@ static const struct amba_id tpdm_ids[] = {
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
>> index b11754389734..2867f3ab8186 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
>> @@ -343,4 +343,16 @@ struct tpdm_dataset_attribute {
>>       enum dataset_mem mem;
>>       u32 idx;
>>   };
>> +
>> +static inline bool coresight_device_is_tpdm(struct coresight_device 
>> *csdev)
>> +{
>> +    return (coresight_is_device_source(csdev)) &&
>> +        (csdev->subtype.source_subtype ==
>> +            CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
>> +}
>> +
>> +static inline bool coresight_is_static_tpdm(struct coresight_device 
>> *csdev)
>> +{
>> +    return (coresight_device_is_tpdm(csdev) && !csdev->access.base);
>> +}
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
>>
> 


