Return-Path: <linux-arm-msm+bounces-80436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DE34CC350CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7211E3458DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 10:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667992FC87E;
	Wed,  5 Nov 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnl0NJRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ3pBvl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E62FB62C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337632; cv=none; b=fbDs9JrPSExCDOROhZHoK33SpGndd18UUwUPImKLPoStQT/t1SM2k+mPCcuqUUvPkQAYWbbQD2NV5+6sxloS2v2QTugmgWaQWz9NsshtIDcXrHTEn4NgKT+ctrZIOA5/iS3VBYRU4GS/YzHxGwXH9jq/Nyjw5lQCmr5YRV3N2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337632; c=relaxed/simple;
	bh=nChZR/x9bvDwwZq8+OEin6Cql+RWf/f6OJWvgg6cyLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs1XVSazg7VIyxBMK3tYF/+fRb24xH+oi3rWNzK5iwnpyCP/ZUay/vHTIK+ICcnhcHPcFRewcO0M1QJVsxOxrzmKAw+JatcopVeyuqelUsCfn2+0uUj+60rzdgiWYtjLtcLssxa3adW4OE38hjdXzp7MKgDuupGROy60dgLFnGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnl0NJRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ3pBvl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A571OSG050974
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 10:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIyszpi0pIw8uGzv6WLAp+HN2hkaZFeJK0RVS9Ooiaw=; b=hnl0NJRv/ccB3R8Q
	JK5PNfqza1NJIGD1I9l0N27BcKOkpTZddllhLmeAcqvtvSjZXq5SNQmF9ABLsZQC
	VhRM+9zBxLxNR35VvWKQI7K8u7RT0l9rnGH1kV3M+6sedhMYE4wTf+rUGNshra6f
	01AwLAMLAPKYndlhbzqHlG+Zx4HyMIg32bbf65cCgb1vkHX8OXM0Pg1wZ8vOhi1c
	b5vASl40nhTRQZqAxAaTCRD6Rsiitg/T8j2HQtXahU7Dq64VgTdtwjNgWIuAWOZK
	cKiNGo4vVHYLpJBaxGLPBgOfzpjlqikKYJeODxelsshaYJ/ugERALpC2qYM9E7Ec
	A0d/6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a81u0ghsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 10:13:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b86d977fso27641981cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 02:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762337629; x=1762942429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIyszpi0pIw8uGzv6WLAp+HN2hkaZFeJK0RVS9Ooiaw=;
        b=NZ3pBvl5JZNR94xe1gYyaTiYcILm+pojon3ZP1lppTNWldP03u/Rj0G2/l4r82Ewgx
         9Ew8KwzaZ2N42War9PVrd8jIDlCBv+m1EooCI4HxrttflAGNqbhr8h1juRo/gSUwg5Wk
         +SLuhI3hecv7xv/TJNdmYxsf9dMqTJkt94Rab3T0WKNuXTcahBp/FJboCY1U5DDYKWJF
         G7acVnr7dlxxsaUp9R3801p08EkpmfnxfqoSDv3XvHHDxT/zIPDv/Nhpgx4cvyiirHQk
         +wpzVSRpnZla/ym/yPi2bEW+KZqnGglxbceqvVd5ce6sTyIB+3QNSa+c+4a+kNvK+dac
         erfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762337629; x=1762942429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIyszpi0pIw8uGzv6WLAp+HN2hkaZFeJK0RVS9Ooiaw=;
        b=G2L9VdgfLY94PdpcwtOtUKSkl+I7K72fZ/Ymj4rpYwCuvFYYoUK/SSarJldf1n5mMU
         P1tqoDMKUSHB6T3hr2jknoKD0z1Lu7r8Sss7Yy5BhFUYS41pogcOoQKIqxYlmBEv+Lft
         TeZfJbK4Oxf9Y5txQsln70qQf45VjK9V6NbdsDuTi9oOPSspbxs1naR0K9VCPMQaO72i
         RvxDY5Vo8uMrnmHYme0wqBo86l3iL83yVBZAS/kXB8k3CWdXU9actqBnDkGcA1ncsuho
         huj6q/fsdQTxmbGwQywKsCb+78T3Tb1A0Z6eq67+ucaQpmXybV8+pEeyVmFHf86MZrNJ
         yDkg==
X-Gm-Message-State: AOJu0YxGAL4ZxekAfJdaWjRrGN92bXLTii9w0Gb/Ig7QjubouG936a5U
	ipKFUwvobZGUmCUv8MN9fb/1U5lATp0QYdJiWvjjfHFXlOxoovGbN1YgMUV4W7FZzHmgL6ZC2FW
	Sl8DMI45AHAOlk6rK4lAmEim/PNlso5DQCvqkXgf2rWjcBWlLiS0mDdjCZDkGD5jgKcu3
X-Gm-Gg: ASbGncutm+mWDMsdAYgBXFQqjIHxfr40Z5wmdrGo0CkXrVOQnlv+Wdtt8dncZz08bGV
	8cb2lzY2XzA/6mIfYgrz0HYGeW32PJ+1bz9PcIX1YQJTfSLvScrRA91jQZHu054syCw26FgXplI
	d67/w0MOjAWCcOsh+/nsm7kRC5qZaL8NnjQENl+U+dH1KbRuZeVM72iJe/jMSicOrjopHsSQr1u
	rPVosO28noobXyitugKK015xg9nQ0vs/ZAHmaULAMmXJqq9BEAxOvnXE9DSq5xp5F9D2cTBmam5
	qXgNR8faeZYNXE2oF04G7dbXgq83LUFNooZ5YpKNG2wR5EFsLsXrMKufussLoFV11GlmyScNZYK
	Lqw6cQNELRU/pV/MIuAQKoP0/Kiyb74nQpfiB2i9SUAm1gBbi52MszCnl
X-Received: by 2002:ac8:7f47:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed7261795emr21371181cf.12.1762337628871;
        Wed, 05 Nov 2025 02:13:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFED2E6yXArBO4TiArU5U6TCAiMaOhAarYcTmI1Eu/HcBrhy5Litd4H6o6IEFPy6nojl2YmQg==
X-Received: by 2002:ac8:7f47:0:b0:4ed:2f2b:aadb with SMTP id d75a77b69052e-4ed7261795emr21370891cf.12.1762337628181;
        Wed, 05 Nov 2025 02:13:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5c7e5sm4225776a12.24.2025.11.05.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:13:47 -0800 (PST)
Message-ID: <1d1cd6eb-6004-47e4-b6e6-006928e79578@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 11:13:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: Introduce Kaanapali SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-2-3fdbc4b9e1b1@oss.qualcomm.com>
 <36fcea98-06a6-4ca7-a378-77b44b196a9d@oss.qualcomm.com>
 <7fc6ab09-44c9-434c-ab19-764c74b1176b@oss.qualcomm.com>
 <7f8aa7b5-40b6-456d-8b33-0cd505a6bc3c@oss.qualcomm.com>
 <a8586851-7f71-43f8-a1e6-6f8510c2985a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8586851-7f71-43f8-a1e6-6f8510c2985a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IwdZ9t3-85bDo_YQbj0rkD9YajHJnd1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NSBTYWx0ZWRfX5B+9Uq+dJqEs
 4Y1/tkbkgJt/V4Qs9w3Sv5MEKW4lq/fDbGSllcrCszHrFcqeWsK0yY9YWiTmVPzPnXV2+nxHBqi
 ey/84kySXG/42TLE0LDlBjj68Lh/9T1JaeTR4iIORzEHz2LGtXutu81lObsEUaUgGnlApFybrfk
 fOA30dnRXd0PRgwgY3BS/LAtQymyAwP3bSd1gyBgRwdcWnpnDT53qjfeAeaW1JvdQ1ArBnrd5/+
 g1ouapijrSFKUXXAQZpuw2xT6CHs/XFdCK1KZUr3KM5wyR3AoChwakRp3H+uKkpE255Py4lofD/
 faDla7AP0OKwMj7AGiJg4tWZ87lovNw7KYoZ8uSfUPrrNBv+ZrB/D5YciP9FaqnPDgHa8CrlNel
 /n+SCmJqfGrI1CNjvRibqMvznEJnrA==
X-Authority-Analysis: v=2.4 cv=KaXfcAYD c=1 sm=1 tr=0 ts=690b235e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=1xuCUfFpP9sfGznx14oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IwdZ9t3-85bDo_YQbj0rkD9YajHJnd1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050075

On 11/5/25 8:30 AM, Jingyi Wang wrote:
> 
> 
> On 11/4/2025 8:54 PM, Konrad Dybcio wrote:
>> On 11/4/25 10:04 AM, Jingyi Wang wrote:
>>>
>>>
>>> On 10/14/2025 7:46 PM, Akhil P Oommen wrote:
>>>>
>>>>
>>>> On 9/25/2025 5:47 AM, Jingyi Wang wrote:
>>>>> Kaanapali is Snapdragon SoC from Qualcomm.
>>>>>
>>> <...>
>>>>> +
>>>>> +    reserved-memory {
>>>>> +        #address-cells = <2>;
>>>>> +        #size-cells = <2>;
>>>>> +        ranges;
>>>>> +
>>>>
>>>> This is missing a bunch of reserved regions which causes device crash when you stress memory allocation.
>>>>
>>>> -Akhil.
>>>>
>>>
>>> Hi Akhil,
>>>
>>> We will not add all the reserved-memory in dts, other regions are designed to
>>> be added in bootloader.
>>
>> If what Akhil says is true and Linux is crashing, something must be
>> wrong..
>>
>> Konrad
> 
> Hi Konrad,
> 
> There was discussion about the reserved memory in QCS8550 change.
> And the conclusion is that reserved memory regions which aren't relevant to
> the kernel(like the hypervisor region) don't need to be described in DT to avoid
> memory map change and update frequently. These regions will be runtime added
> through bootloader.
> 
> ref:https://lore.kernel.org/all/20240618072202.2516025-3-quic_tengfan@quicinc.com/
> 
> The bootloader we currently use for Kaanapali has not supported this, and we have
> solutions like add temp change to add these in DTS until the final bootloader is
> provided.

I think we're well past that date though? OnePlus website says I can order
their new flagship next week..

Konrad

