Return-Path: <linux-arm-msm+bounces-81189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DC5C4C32C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFBD93AEC85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1551299950;
	Tue, 11 Nov 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGini1GH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cauVxr1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDD320D4FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847782; cv=none; b=LST97ubUYM5V/InnCYt285BX6vFrdMxLWJXHxkhB7g7nOw5BWl53/ZWCWZmbn7Y0zLSHEOfwvX+2jqLDUQj/etZbP7wt+y562ybDx74iqTDfrGnR/6YPZGoqFytvtfQEtf8P4TKCZM/TxImR5cmY0mrNTkY3oJ0+mfCJRADZkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847782; c=relaxed/simple;
	bh=J9dHV+srVdCfKZ5lu2pApTYLFYdNVofhwohGyFX+2uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFLIbD8lkSu6wlnsqkVy12kUu/cLlfs5tOlYTH2x0Jer6Q1nQTZ7GYSNRye9Z/2mw49DV+Qo1fSyiRra20TINmSj43/TEFs/WpN+AwRMOIQVz+bIit/ySehkxWAxNJSbnxrYPzSEUVlCgezrRRa6NtrmWhtSQTk4Uebzpiaczhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGini1GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cauVxr1x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB2civH1001713
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=; b=dGini1GHVtbvFhXN
	MA2eDCyeQ+fpiiBRaF6XXD4lSAnejs6QZlN4xGYbzweuC3TWIXE2ZADR8NchmrVe
	K2Cq4t7KmqkcAo4HMFXZL4zqo7oSVVbORLv/IGBPDkDjPulbMK43/BOSNk0bYlDl
	F+C4fNonshs42PPEWlnX3i1T+FVH9tiEH82gJbuo01+Gndn1uxDv5AKlLAx81Q+b
	I9XcvsRg94cyIqfT/afxLZ96ONeq5XVSwyVPQIWU1bEs09U6GyDLVCIAKk6gHbmB
	QLr0Ev4MrH5NGPxfvA0ZxI3eY3t1DYUY1oFaGqcNtlA64p9tiIRWhWrzw/k5T4Mg
	duVNwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhtgtux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:56:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e66542afso72947625ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 23:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762847780; x=1763452580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=;
        b=cauVxr1xK03+NOEJRNuYG5LNyIfJjmXZ6F1froHS4skn5AYNADTWaeduZPQU1jH8OM
         SPyJS2dg46QHTHWsCfVSLdPmVt1+PiZ61Wn9X+msUMde7D+vR9ZGb5cn7Nfe8L8d8KyE
         EY0ESJu17KOPglL1rjBtrAJpbwBHwGpy8ZKaSyAWdVLubOYCpNcdnZrToHdrdYXHXHqi
         i4SSNYb/XKnyLZbh7uLjuNzlO3E77mnqOiqj4qr08/wLwoxazCkreP+hmewvLSY0Wvv1
         GdSY6ZmrHbZhUEk1f7vJ8KPYx+gjhhVhhCzCSFmJa3GM5KZcricl/75wcCD7rqB0d4lz
         zAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847780; x=1763452580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9goTM/XMiiNX86aLJBJ8fJF1NxfmrSk55ouvKAkbHtc=;
        b=EUW7evvlCmsb1wDGtXBp63eUFwLfcRH4G0TLyE7V+VYRtAzEVIB14mDVdQGvIXTLvI
         P+Zzxp5KwFd1PfjWOUvE6Fz+WRS+Cu6MukfD4Ms0rTKMA/nIn6VEjKFotS4xm1wqAQC6
         zmCgC+uQpX0kdfQ1asdtqM5gLQxUO7aoJXVaoaXLOsoCxvr1XfBTat+IrZ0DQqG0kiiu
         xxFzc/VBGgu3DqHpfcLQLXFQkU4ATn/I5NioXmsoFvdBjUsdde/UB5WCRbLmAasYkvI/
         RQ8kh6mDP4mTuOh6nnjnGnkRsd5wKFGklygJpybSKkHv1fzneed4Y6yZMnVW9TTat232
         2WMw==
X-Forwarded-Encrypted: i=1; AJvYcCVepjWTvP8lzbwtEnjH8LDP06wb5FlMVakcNxqs6WnRFsVld/GPgLuVlbipvrFPowqRcLJf0ATngJSZRmpf@vger.kernel.org
X-Gm-Message-State: AOJu0YwvACs+4ygBLUElyoQ75pkP/WtL86qKxHCjFj2ojF+AdFE37g8H
	uvzxPaYAxMrp9bt1F6GGdm1xW3DtB0JqJUtr4KCB0pCk6aF1A+oKERzSUDDgp86TOKDQKmCJuo/
	1zjSbBEDlOjTK5C3mhTDaQI8G6u207UNb1ApG9DcJ5EdG4ZMggQYmRL7uD5sGzMt1yaOC
X-Gm-Gg: ASbGncvqWQdnDVLPBPPMZX0R+gMuq4KtuBEdI0sL+jlpIp1q9KPwOw27Y6Dr6ogBV/x
	0xiapcoW3xVVuPYLIBpEBfy9M1J5X654s+RJ7wZTNeIESupq4uj0alsxqf/igvsVswribU3S0WN
	sx1+jJfrby6JGlgMs+kemB5Z/TYaauiwU5o5PWAGvtI08jregvgTN0VwpQ6i7AEuswc0BxK+N8T
	4LQqNgbmf7HNcmO28PMgwQJfGaC8KPsY4c/j4mTCBGxSFOQYMLkCpTuacoNeJywdh1Pmr1WdOK8
	I2CyE+LgPNoFtoplEOoNOUHfOxiZnU3ZIU5woxwRMjaYg/oA6SONJZCUHoCmK+ApdaIAbYeMvhM
	np/+EFATqY8u4l9v0aMb6L5fTERw=
X-Received: by 2002:a17:902:f64f:b0:298:1156:acd5 with SMTP id d9443c01a7336-2981156ad51mr97475515ad.39.1762847779855;
        Mon, 10 Nov 2025 23:56:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6hrGKFsEODF67hPKuu/GXPSRhYuLLhxF+PyTk/xwREJ4g4uK32OyhVOg7l+TWL2LTnadutw==
X-Received: by 2002:a17:902:f64f:b0:298:1156:acd5 with SMTP id d9443c01a7336-2981156ad51mr97475195ad.39.1762847779368;
        Mon, 10 Nov 2025 23:56:19 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5c6b3sm169109865ad.24.2025.11.10.23.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 23:56:18 -0800 (PST)
Message-ID: <fbd49b9e-5198-4825-a601-cf2b446f1150@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 13:26:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kvR_1pfQV32iErHY2AdmoX63pmzb3WxK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA2MSBTYWx0ZWRfXwGJz7mm6LpNB
 YczwZ368hps4qVt5iXLZ+EbQ3ai6BDSdJ6OcRzurcd7a4I8eM5F714Ii6ZtZl7T1RvgbOjzzOsx
 a2MeI7+JnxCPCb1JpT8ky1odSZdDbLdZ30XWmRCtYxamqs/zgRD/ERFTFaSUxxaYT3jHXJeW30Y
 2/pnVPa398Qvr3wcHWO5bgJDyuDpwFLvFKjJLU58R0yIPleNZUML1XQZIR8qSidRwpc7Xztx5kq
 t1uM+2UNS0JyTuMNsf9+SeEkC89jl8gguz3dVjoSdOAFXRB8AQsQpwYwSG7rUKvexmLEkXa+4Mb
 LedUhRj6mPS7LMyZh0ScSXsrjXix53ajLAgHYn0HdH5Vt1JrqCfCyojsCIcMCdz4L3jmy/+kK49
 A5siu3rOhIyTJ0GxoSLjkXn//cDX8Q==
X-Proofpoint-ORIG-GUID: kvR_1pfQV32iErHY2AdmoX63pmzb3WxK
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=6912ec24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K3xFcsKITfcsgejFPk0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110061



On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>> Add ACTLR settings for the device nodes with below compatibility
>> and is mainly targeted for sa8775p:
> The commit subject should mention it's the lemans MDSS specifically
>> 1) sa8775p-mdss
>> 2) qcom,fastrpc-compute-cb
>>
>> As a side note, "qcom,fastrpc" compatibility is already defined but that
>> seems inept as the devices that will be attached to the SMMU is going to
>> be with "qcom,fastrpc-compute-cb" compat string.
> If you say it's a NOP after all, please split the fastrpc change into
> a separate commit explaining the issue and removing the wrong entry
> 
>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>> ---
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..c76f6076f487 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -47,6 +47,10 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sm8550-mdss",
>>  			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>> +	{ .compatible = "qcom,sa8775p-mdss",
>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> This list should be sorted alphanumerically
> 
>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> This will be globally applied to all smmu-v2 targets with fastrpc,
> starting from MSM8996 ending at Kaanapali and everything inbetween
> 
> Are these settings always valid?
Let me separate out patches for mdss and w/ more details for fastrpc.

Thanks,
Charan


