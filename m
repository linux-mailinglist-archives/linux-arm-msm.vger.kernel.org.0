Return-Path: <linux-arm-msm+bounces-76643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD49DBC90DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5AE714F0C4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74BC1DE8B3;
	Thu,  9 Oct 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oE0LWoq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272952E2DF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013424; cv=none; b=O4Vq+6g9jcaKuBE6jMRFB59BYhJNP8u4YjV7UtwPz5BzQdGPFVHlt3tDRa1cFqU6XyQbW8IuOFFUcLHF5dnwnYw71Myp3YKZGdCkA2XWJEZZsXcvzJoWti/GeFqEEyTNBs7qzvBNfTWyDUlok9K4vsxNJgeQznAdeQYa9Gv8Bu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013424; c=relaxed/simple;
	bh=9jcO9Feqp0+Oqy4K8X7fztPbz8Eqa6IFQkGDp5R37h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGO5SYsTUOB5mJj/S6WlU6KbCloMNCVcHxsoC3Y4IrsHEHcSTLyF/NTzPllB0uRG4k3ZdQHjdQhV6lYuM4vq2qGXYlEljOkvZDb4thKJFrQR518u/UxV+DrBl0vhP27NS7/fmGMBChh/+zGuwD2pOQnYyEsukRYETYsc2Z0S/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oE0LWoq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EJI7019131
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 12:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FEsklw0AIUKm1OtxIC3eyuWGm2vSIhXgmBcopDMHhE0=; b=oE0LWoq01s3qJS2K
	4YTgmpl35HJE3rUPMYaP0/w3XHqhDPxQFUOrKnPEuXlPrclk5X5KgfFX1Dw/+XDm
	YNzQyxg9jtJKV1yKh79ljqTVhsipfJJo8zTYyUGIPiml539HlGwLObIk7/xgsF+X
	P45bRGEG6nbXt3Xoyrr/vldPATYvEwofgGcF7Kw9oXrh+W1yJDMilG6vL+Ve44s2
	uqHsrULyDiIcr5PtuETP6FPTqd51uGDQIs8eOf12NAZSrato2QTuk3oKrdJZYaQv
	L35Yny8zdwRTWQaMY/DAXfSC3SoJygy+05Fao3L8SqEnSDEXpJwA2k88mthyDH4r
	0GigfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ntr4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 12:37:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e56b12ea56so2866541cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760013421; x=1760618221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEsklw0AIUKm1OtxIC3eyuWGm2vSIhXgmBcopDMHhE0=;
        b=FWB0WpqyJEsqH8I08nZpycZoydF4iK8MDU9zfDL009h7ptHYKE3VXYL0LgKUXzLhz6
         B/W9Qlq8PeF+6QqVrzA6HpKdBRvoL1IfB3CsRCKIKXbYZMb5eL/ydsmn5p5EkCV0RJfp
         izxdP6JoE6X7sUM1Qst1C0Xdn+v64qx6bZ6+PGW3AauGXlklF3dDPMP+5xP63XHMK++U
         h0Vaxe8Uuyi/cYWfpFoDKww503AO9FcV1sFxWDxsxxhsFhl0FtywE8wTWWleSZGLlJ9n
         Zf7onIQXhTvZ1wBgDMlr7NQMZ2BDuayn3RHwVn1jmCaWbh/io97ldRFOIBlNJmv4Sr/Z
         pXcg==
X-Forwarded-Encrypted: i=1; AJvYcCU1LtNvBeqW4/Jiff/CkSgJDlrnIFUNd5o4VWWe37i8L4Db1KclWAGcwFuNgvTWh8/e02vjYuHLEoedrvk8@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUrxPTxaWgHn7RvF3tQlO5skAMqPpWAeVnEidIq2ajv+1y43t
	iiugFA+Mh4UNqhpz9KdnC7/COa3zZRfrm9Gjrcz8heXs/njkUtiVFt87yEpyTFJgfAvjnu66pcx
	JRfNEjDVna5koevfWFu6F3px22EvbNNcshc/ZtICoHj94Pf3D0dB8mmDCpPu8j/uiSSV0
X-Gm-Gg: ASbGncvLRPSQ6AFB3SqDp22Y46MmcUkGd3OH1cnvDrihCFOSAes/uY4ZivWyIdJonrL
	SFfPaMAsnhx9+/L8/VINs5l51Xj75e0V/tgvDBLWlx4TazZX8udy+NqAFWiq57oLUuLFqzGsm8R
	ovhfUKOW8+0cXCVgUWn890m5SB9DIz/EKdaijQl7Rny0uRLMtWubceMAQuXw5iJHQmzVuji7qmd
	PVai4b5OlfWvLD0JEnI/i+rSHX/DpEtsFV6ooXUYu6RsLwIf8ncLCzNl/d98G28tYf/P0M+kB9c
	bZBHNKbasYy3VFw/gCrcdRBnD70rskGh1K0A3H69pcODoGbnV6MlGyb3nbtIS+8yslH+rElYIHS
	WOYVtTrcPAM69ZBMycCFN1nagVFw=
X-Received: by 2002:ac8:7d03:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4e6eac8b048mr67203361cf.1.1760013420980;
        Thu, 09 Oct 2025 05:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3t++2D4HKgFuuZ9u07/n3C63sKYMoz6MgV5yEcjgfxeGz14OJ9Kv3Dhh1crE0wi8xyUehWQ==
X-Received: by 2002:ac8:7d03:0:b0:4b5:a0fb:59a4 with SMTP id d75a77b69052e-4e6eac8b048mr67202961cf.1.1760013420341;
        Thu, 09 Oct 2025 05:37:00 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f4106c60sm2302930a12.43.2025.10.09.05.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 05:36:59 -0700 (PDT)
Message-ID: <3166b396-7aa8-47d7-8d44-e7d88f920c15@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 14:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
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
 <6ead45a6-aac8-464d-9812-f5e0d1395709@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ead45a6-aac8-464d-9812-f5e0d1395709@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rtxUrA_a-bvGxdP6uPqgjYa8ZPuFS8Du
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6JdgQFjDsJCc
 szETOz/U6ZUHXrs7heHebbtL/CMacxVwS5AmWaiTQFgmXn1z3vVxgIuEc6pmw458r2kc9aa1lQ+
 ZDMSRS1LvOF/kAa1cjeYQK8uQZBUBnMKJfdyUzx0fwR5KxHV3gaVlUwN8sEFuY9wazUzuQZK9MV
 6Qj/S5EjzVOJlIMbzXohxd2jWQ0kWGghSNiAdGWZI7d+HAVRhk1BxWd6pboj6yEAATxMrp0bzWM
 gqyPY6xjqbezSVtaWRKPFqHBFnmOR+Vb6uhmUZ8nzmsAuYv7BLhM4WJmpx3f3yBD873z6ipI3JG
 kmv9bKSpRyfi7L4mOtTHaYhQTS/gu6jGo2utUSUuUq9SHAbN1mutx2G/pwRaFB02ik+Mj4ZKqSA
 d45SdnwDbvt6mV6dLidZD4u2oHaMSg==
X-Proofpoint-GUID: rtxUrA_a-bvGxdP6uPqgjYa8ZPuFS8Du
X-Authority-Analysis: v=2.4 cv=b6a/I9Gx c=1 sm=1 tr=0 ts=68e7ac6d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=goJB-IjUJ7mqbQYCmycA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 7:23 AM, Charan Teja Kalla wrote:
> 
> 
> On 10/9/2025 6:02 AM, Krzysztof Kozlowski wrote:
>>> If it is legitimate meta-data for the SMMU setup then why _shouldn't_ it 
>>> go into the DT ?
>>>
>> We talked about this two or three months ago. I don't understand why you
>> just ignored that entire part and come with new binding just to not
>> touch iommu code. List of entries in iommu must have strict order, just
>> like for every other list, and you should rely on that.
> Hi Krzysztof,
> 
> I want to understand a bit more about the statement -- "List of entries
> in iommu must have strict order."
> 
> per my understanding:
> iommus = <&apps_smmu sid1 mask1>, <&apps_smmu sid2 mask2>;
> 
>      and
> 
> iommus = <&apps_smmu sid2 mask2>, <&apps_smmu sid1 mask1>;
> 
> The end result is same with no breakage as they still end up in using
> the same translation unit, i.e., ordering doesn't matter.
> 
> May be you imply something else(may be ABI[1]) here about the order,
> which I am unable to catch...

Krzysztof is referring to the 'items:' blocks in dt-bindings always
containing an ordered list of entries (i.e. the examples you gave
are NOT identical from the bindings perspective even if Linux
happens to treat them in the same way as of right now)

Konrad

