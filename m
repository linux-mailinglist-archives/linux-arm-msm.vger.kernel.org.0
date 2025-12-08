Return-Path: <linux-arm-msm+bounces-84708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CDCAE15E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 20:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05E3230A6B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 19:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605082E88BB;
	Mon,  8 Dec 2025 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvSBS+OY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaFDcSwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5182E7F3F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 19:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222135; cv=none; b=ZCYK+2LeXfoU65Vh2XYF0ae+KiTK6CmIRIZOIR6hE9QndvURt5tj8JcGigf4G+W0hGzFCzOyoPtkSXTM+DZ5MgFwEMktuEn3EfA+KaQF+jU3iF0kBYJRhyQuj9+Rd7jrhT63e3sLgqQukD1acNePEH74IV2PbkfhSbflizYUr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222135; c=relaxed/simple;
	bh=YlJ8V1+ApZkC/r28q9PHGeBZL7AI9JgB0OQJYpZ9wHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhGfYlWm6kJ1D93MEElDKzt7lOwO1WKKlTtCeKbuJ+U4xjb11vhCRQ684Hgs1WybbPRxaFH2zI890cLJ+HO8l0gKQ1q2glHcxiegukvCXQ4we0fNo4jnbbmUlPscX7URd+O2BvWr93XwARKrh8/xvPhQCO4kgcooBIWZivCK6lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvSBS+OY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaFDcSwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8E5H0p1419123
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 19:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=; b=LvSBS+OYd+2eregL
	O0PXOxOfNBD1FHgof/+gg1nBzVqqG6ydlVohK3Wggpd/klUdsMhpbVe8yGfKjcio
	QUa6v6/8hzB1/vAU5KP4850ZHQe3smd7FDJHjiwQdpL18WwbyydMak0RMUt2Keml
	JBLwUtzKxXHF5j/8xRiSaHPUWe9VQ80GkwANv0aS/01MmxN1E84aklIB621bea5e
	PG+fCNCF8jNe6R5cpWQTIeNLSHFzqj2Lmd8yEC8YwNTwReCCMcKOj+q+YD4ZogwN
	pR5nwa08x2xaQPOVaO87zo769f6/UG1/1f5vbeNxvimfVnNuabop95FE4EF1vV7P
	v2hPtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax04nh0dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 19:28:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso8800774b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 11:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765222130; x=1765826930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=;
        b=HaFDcSwFbCAjHcx4VZqbDyYZenlgMIMceYmwSntn+pQQ6t8CfkJAMtRluVHyC10mLV
         2F8wGnVik5x1cuIYF7BtoScm2j3oxx660Li7cXZ8h9mC9jVXY8Ni8Yyy+iCQ6yBrPznS
         jS3LLcq1Q39tvtUY3WdIwoFXxRrB3Owu9vIZVBbRlhSbmFXZiDC8gSso9MUHBwmPWkmW
         /pCniWWZc2BQboR9+Oz8jvc4pr6LYgn1EbtkHxiUunSVDualPR18++cXm0kaj257phT+
         c6nH7+TxY2xwbV0/12wAHHzEfk0Cnvtew9NcSeDzpW3WNCzfJAgVyHPDSIG1b7gaM24Q
         jzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765222130; x=1765826930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yjmOYzXN+OctMZKMBsFTo1QqywLTcddJM6KrHURgSQ=;
        b=Y/L8mXjDhOG9zlTEvT0AVAdWfPoDGh/eBcn1B/ztCV6K/5uwcmzHhpeFqddPAuX6JN
         pQlf07WLtJI/tAz7oTTacpIvgUJ7Kccal2ZaCQxiPQcU5X9+f1LIyb4lAXGhBTf8sbtv
         MT8FNzLvJkkhEYW8eJJTynMgTTDaw2J8E5xc2Qj8qUiAcaRlTA15bV6XEAn96l0jSqbd
         wZatd4M3snQnhVRWOzM0GbEdzlaX7h42Ua70bFYY4iKQrJCLsyxgedgRxmKtnPG9lgpa
         o/E4ffg42OyU2JUMvDarlNUUyBgjqBFL8yVFVo7NTYQaQMQ+RvsQyIx+VOqW7hSt1F5S
         w1wg==
X-Forwarded-Encrypted: i=1; AJvYcCVvj5Zk18nD2mHBslwvSELAEwoxBGq536ycKkEj3jKKHTsH0qWjCB9JeYedeCqUMWgwTVECwnzIOqzD2Jpv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9YjOqLcZ0/oFjLqwyGp/oYVGmhmkuH52TZ94AW7HyLzwsUee
	vTPoWh+wi67LRQtpRVyWE5pDxKnUV7N7E7qr24tfR60SgYsf1tcgyA1nwbPa9L0yUgTpXKHffc8
	FWuVQv0K3y2cbRFGMFvTP3/ZRurGARZaYEIafaNeSLSYeQUrW7K5IXSYFFDxzOVl1vHF7
X-Gm-Gg: ASbGncsF+7ppeG/Eq/zgBDlJzOqDCQXZgT+W9OcCvMpwLq/PSQV5N537ekGxRa72pBI
	5aF3BmDdQ6xsBVYoq3QVsqxTN27SqQx9onUzAhFJml51skdVJYGhv7EW+kTJh/3XqWzeXRDHGN0
	MiKSqMkYymFEQ5q9nYubPRFSV+OnZbfU2JbnvMLbnjxpOlztU68OFNimglMdECV94da+89c3is8
	Efwxmiy5sf4acmJWTJ8PpsZziZ+FggXePYNBoQzY+fJprtLXyBsra+xNHyoTgrm5nIrnrPX3Vxb
	E9hcDg14F8EQ5/aXuKiwqeJxf7TtBe0Mb86EzlLNDE24t50vBblfHKPPkJMBqSAnoJ00us3fr9/
	Dy+f6LAbSI35z897FbMCGCCPUpaWSmp4o0qGo9g==
X-Received: by 2002:a05:6a00:23d2:b0:7e8:4398:b364 with SMTP id d2e1a72fcca58-7e8c580c004mr6248309b3a.55.1765222130201;
        Mon, 08 Dec 2025 11:28:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgn8R1nKUS0tnoxZy4qldCHnZ4XqbLpBA9yEzu93LuDAdycaH4O4tgmsv1jTQ8CYb1UTfXdg==
X-Received: by 2002:a05:6a00:23d2:b0:7e8:4398:b364 with SMTP id d2e1a72fcca58-7e8c580c004mr6248289b3a.55.1765222129672;
        Mon, 08 Dec 2025 11:28:49 -0800 (PST)
Received: from [192.168.0.7] ([49.205.254.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c17esm13814703b3a.34.2025.12.08.11.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 11:28:49 -0800 (PST)
Message-ID: <0bcd5a92-5213-4862-9a31-8ea539b1b72c@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 00:58:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
 <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <gsjyj3arwoqcjln6nlmyhohlowyvkwqmxppdq5y7c3m4khoyq3@npzixjpibh5g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE2NSBTYWx0ZWRfXznfZu+bpzPXl
 DrCawb+AnOH8wcCmDXBQ2ANxWakFLBDGlxCkxafnQ5iRV7wC1ifemSP7MXr0egW0y8KrNFEf32K
 maQkUpx3UATA/Gc+Nb9YjuZ0hvtat0bk7aIQzetTE4ke5HqLPt4a9+JBizQ5+a8bp8ueZ0uDh6/
 ptIdVyXEwi3hM7CHyFjspxFsMgJkR+xYVHlMWLYqzoq14uVqmxOqdQri+MuZEo8+63yugie0MMy
 EAl1pvJa3PGGnUpb7JAgGcyqQRFeQhK2jDBlVbtqk8AT8XSa/YzbWQQGKc2xUmKnNfF8Lk+PZ0L
 PhEZ0Y+/zDBCCnJQ6UQa5cYBU7gTria02sVH4Cbct1hky3jlSASLMpj2vfKrrOwhBn1Tl36pXYd
 CJMW8nDEbhDHf9XywZkQQRdzCtFD1Q==
X-Proofpoint-ORIG-GUID: spgyEKkEgb2vDPaxe7SVWuB_amQlM_mV
X-Proofpoint-GUID: spgyEKkEgb2vDPaxe7SVWuB_amQlM_mV
X-Authority-Analysis: v=2.4 cv=CKUnnBrD c=1 sm=1 tr=0 ts=693726f3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=21F0Ij6J+em9RIwR2lrOkw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=SVaDBRFF2uN27j_ulVgA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080165



On 12/6/2025 2:36 AM, Bjorn Andersson wrote:
> On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> 
> Based on the other changes to this file, the subject prefix should be
> "iommu/arm-smmu-qcom:"
> 

Sure Bjorn, I will address this in v4 RESEND and collect all reviewed-by
tags.
Let me know if you feel this change needs a revision update to v5
instead of v4-RESEND.

Thanks & regards,
Bibek

> Regards,
> Bjorn
> 
>> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
>>
>> These are QoS settings and are specific to per SoC thus different
>> settings, eg: some have shallow prefetch while others have no
>> prefetch.
>>
>> Aswell, this prefetch feature is not implemented for all the
>> platforms, capturing to those are implemented to the best of my
>> knowledge.
>>
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>> Changes from V3:
>>   1) Add actlr setting for missing sc8180x & sm6115.
>>   2) Improved commit message.
>> https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
>>
>> Changes from V2:
>>   1) Add actlr settings for all the mdss devices on Qualcomm platforms.
>>   2) Improved the commit message that explain why different ACTLR
>>      settings
>> https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
>>
>> Changes from V1:
>>    1) Added actlr setting only for MDSS and dropped for fastrpc. --
>> konrad
>>    2) ACTLR table is updated per alphanumeric order -- konrad
>>    https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/
>>
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..149da53091de 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,fastrpc",
>>   			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,qcm2290-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,sc7280-mdss",
>>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>   	{ .compatible = "qcom,sc7280-venus",
>>   			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8180x-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8280xp-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6115-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6125-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm6350-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8150-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8250-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8350-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sm8450-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>>   	{ .compatible = "qcom,sm8550-mdss",
>>   			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sm8650-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sm8750-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,x1e80100-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>>   	{ }
>>   };
>>   
>> -- 
>> 2.34.1
>>
>>


