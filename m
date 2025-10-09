Return-Path: <linux-arm-msm+bounces-76535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C802BC76D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 07:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE8A5350589
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 05:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244FD25DD1E;
	Thu,  9 Oct 2025 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCYyPtY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883FD259CAB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759987421; cv=none; b=OGiEi21LBhWP5BF5McJS8WXi001lBZPKSDDkZJELGMguOdNujJ4bVxoioUsu4DHQgYbrcl7jwlIVpIKiyPCu6D+n0mfEbmKe8hNoJ5oyPDrv8GnH7ixfHINl9m5AqLbImFxhlL+RBdsHDeF1x6QdzSqd8WR2iLMb3xInxbcP2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759987421; c=relaxed/simple;
	bh=QlyxEsfXkhbrl16DZnPv708U/7TfNxCMN6rg1+bcFis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0EwUkyluKUL3ZLe32zRepqsBOKociv0jWVB1oElQVBVsBdzgCaUkIQauCy+MnyH9IUKYhaPkdUVpGRMjXWZnQdr2O1P5xApcWTNcmb7+EaMW86/Rgdwny0NUKVPnIXpSGvR4jHiOFmzgjOzt1XthfZNSClaW2oypb5hhQmHvFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCYyPtY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HVv001381
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 05:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	akZLWiuVBZdWjm46LZFqg6S6C2WUS52lS0cYaephgKg=; b=YCYyPtY5XU7jd2TM
	nP1nbgL2lPhSjMTAqCYV8vtfvo7qf3GiY+70asOznAe6KiuwaXAE/r7xN9pLiceL
	kj9BvPs7etVa/C1MW5AZMhLcClvfQpBWAhv3TUks7igM46snnmz7h4eO8Gzd3rJz
	mwXspHyQJNx9bmx0mMepHOUYgvtBzc2tjxIfFYNIP723SGpHPcbnoTl90y5wofW2
	FJacArLE00tl/gupWesrPVbnILMGVMv52p8fziHVzM5IgPbnDEhyvE/+VHEPxnD7
	JldvFVoAJ8Z64aQUO4SeSQpaH2oxcG9sv0/4Jx0ujavy0WyMd4TevDa6Vig23SAh
	WjxZYQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksjnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:23:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55735710f0so1135333a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 22:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987418; x=1760592218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akZLWiuVBZdWjm46LZFqg6S6C2WUS52lS0cYaephgKg=;
        b=gCz88n9Lm6qiUrfDxX4L6lER68pJ3A2+ZnzKGl+/RxwvXMRUGFt375mQIVCYXDXCAe
         Yz7roK/WRtVST337EVVZIVALGvqPFDhiRldNcQIuEYuIxb6594fNw2yEG5XUGC+NPtHX
         Mffz2x7Y5sVxiK/EMso19fvJymyZ2s2/glUlycMfXdskPJ7LAabbbv7uVIynIztzinNO
         AQR7OOWmluuTsCW6NuqTUbxpzqS5FZDg6REkzRUa8zXepY4GjQnkwWPzn6L4P9DLTskm
         /nJPLYT8fdarcoRA8bIlriAIzGm7+0n7g728eJZX63jM3usZun6L5+4o61Cv80ssTHqJ
         Ou/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyyec27KhtCLCQqy4/ZJDZEZ52ka81MiAucmgV2L4dTyyHUdFYX9qGpvPWEqLBrn1OmFsgzrVCFtR8rztu@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoLQobpJz/Ah47i0va4oL6wt6YAIxQDcOjZmlorNlRKvhCNYT
	+tevJSZpVn385ZrGymJB1h1zP+Lwf5hAMGiXHGFQ59CLjfqVWL+er4hkhqrfYr7ZQfLOK3VOVqI
	QAHSq3Ys0UCl0/5M2e9EA8fYytyZNq6Z5FWZdoCMJONEoPaBOlZG9VKcraA4Q/8B1Alp1
X-Gm-Gg: ASbGncsAxzivLpV8x3nN0NmsMldOV8pqrWsgZR/vayljrzo8PLyasxgoLGvCoV2x5lb
	XjiAToODz8cvZu9NKaxFU4cbnQdxg8ZwLK9/5G7aPdhXt5poovwPc2tA5jZ7pB/pK0w3obNVKqK
	zzuQhvS3TbR5hiYOPAtlL9YsZrNzpiZjq5LY9GiF8vPLW/iwSFtfoxmwxQPnB3sWgHmhZfaAhS1
	Js+YoPtVJTVcJ+UxSBSuz6hPUPUUMdQq67hioTr+mC/csHPqALPqTJRfFeay0Y1fROC76hEhLfC
	G9GyoxMPbtFxIssh6JDXF3VMzvb9WdRC0r4QzvbhCD5kf/rSuAf7V9jOtTWxbxUkelfAFYUUlf+
	/
X-Received: by 2002:a17:902:f64a:b0:275:8110:7a48 with SMTP id d9443c01a7336-290273eddb9mr74232585ad.39.1759987417768;
        Wed, 08 Oct 2025 22:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDg7iAaHqOJbCGEhRnwGpr8mzkkDt1BuPM1pConZNQaoF4SP+MQRXUQle4Yzd+hhSSIL/1Eg==
X-Received: by 2002:a17:902:f64a:b0:275:8110:7a48 with SMTP id d9443c01a7336-290273eddb9mr74232285ad.39.1759987417301;
        Wed, 08 Oct 2025 22:23:37 -0700 (PDT)
Received: from [192.168.1.3] ([122.181.197.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f56c0fsm15046985ad.104.2025.10.08.22.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:23:36 -0700 (PDT)
Message-ID: <6ead45a6-aac8-464d-9812-f5e0d1395709@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:53:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
 <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
 <Ujyoj3HGLVFhS2b0XzcYAMjSiCAuO-lSJ8PMEQLOaaX83tk_0D5zjrL0VDyZAmD3i4zLB3ElKSZBltISb5jJHA==@protonmail.internalid>
 <4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com>
 <SuwJuCIcLVJwN3YeN1il6tB9wO9OH6bYcnbRpxpuI9Dl7piYLN-hVdnyv0Mal6N-W5pi2aCZI8MxHZDEkoE63A==@protonmail.internalid>
 <4d87d1ca-55b2-426e-aa73-e3fd8c6fe7bd@kernel.org>
 <10a8ccda-4e27-4b06-9a0e-608d6ade5354@nxsw.ie>
 <4cb4a92d-2f20-47c7-881e-aadcc6f83aa0@kernel.org>
 <1516f21e-aee3-42cf-b75e-61142dc9578d@oss.qualcomm.com>
 <9bae595a-597e-46e6-8eb2-44424fe21db6@linaro.org>
 <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <bcfbf35b-69ed-4f39-8312-6a53123cd898@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2BywlSvuV/74
 hSgENPscBAb46KXu6OSbZHKUKQsLpKLOPERDrqzMI4/b26xE/px++T98ViRutiqOR3Xa7Djkzt8
 pJ1j1huc/jSntyq9XRI3+T0awzhIB2gEefgfVedq0s8Zl/8Uuj66Uniy9ux1NPrxpaDlsreTmlZ
 2sPun0nIu/RHSX///UmrbQBkPZysJP0rbwd+5jZgR1ZBMbWs//gd7ZvenCOg6/2U6rl7ub3A/tP
 /10Vgp9mNJFrU//2S6XaAxD58vYGGygLuOXuWCHzhRVNqonYCO+vdBj59fy3X3c4qD3ibbNx+5N
 yM054+tgma2SGRduZGVSYz8rjBq8qlVZDiLq/QyPBqoynw+hmkQiOfYI+IKaUe5zaZn4+B/Ummn
 +clsW26jDG9gFN+u7cCJ0DDGXsd5Og==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e746da cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=2UNsNDcC2suIOuNS33efzA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=cU1SgpNRDqoFvKGT_TMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: pITBCzL3D1COn7miAHX8HLwr0GBY5ODR
X-Proofpoint-ORIG-GUID: pITBCzL3D1COn7miAHX8HLwr0GBY5ODR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 10/9/2025 6:02 AM, Krzysztof Kozlowski wrote:
>> If it is legitimate meta-data for the SMMU setup then why _shouldn't_ it 
>> go into the DT ?
>>
> We talked about this two or three months ago. I don't understand why you
> just ignored that entire part and come with new binding just to not
> touch iommu code. List of entries in iommu must have strict order, just
> like for every other list, and you should rely on that.
Hi Krzysztof,

I want to understand a bit more about the statement -- "List of entries
in iommu must have strict order."

per my understanding:
iommus = <&apps_smmu sid1 mask1>, <&apps_smmu sid2 mask2>;

     and

iommus = <&apps_smmu sid2 mask2>, <&apps_smmu sid1 mask1>;

The end result is same with no breakage as they still end up in using
the same translation unit, i.e., ordering doesn't matter.

May be you imply something else(may be ABI[1]) here about the order,
which I am unable to catch...

[1]
https://lore.kernel.org/linux-media/8b88cea4-b9f2-4365-829c-2a255aed6c69@kernel.org/



