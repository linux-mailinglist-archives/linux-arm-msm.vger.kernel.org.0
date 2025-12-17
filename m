Return-Path: <linux-arm-msm+bounces-85514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C74FACC8035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37FEE301DC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7AA35CBDD;
	Wed, 17 Dec 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFVSTUtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UUrpPp/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F635E52F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976997; cv=none; b=K8EIhSmWPX69pOMQto6KUmakplt1tyG88ljZk9hpw4soJTxq/RSCGd0xTTyE8ThC1HAPKZg/zDX7qvsVU5sUtkP81YV00O9oEF4SfYoOOo5JJQ/wy2m5mU7SXcg0nOQXXSXDBFQIOeBzyaRypf7VFN4xo4r5I168V60Y+5bIIdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976997; c=relaxed/simple;
	bh=k//VXwjKpLf4ePq4urW6+vTHmlvuTAt7wiEtxM65XeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJnJkp6ReWA4Vbsp1LLkSRYNuqXdLqSk10h3asEpCrT/TPblJkwJ7abaAaXDrxtgFnbxcF+bnR+KtWtC2P2ugCFL4QjuqvuCado9oJEqTbdjjppHQrnS2OMg07A6h8XBcATt80c4DwlOA1GwNiRw+OrJp64r+W3jfglwCIKmAS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFVSTUtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UUrpPp/s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL8vc2043009
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=; b=fFVSTUtxIORa/1x0
	Vl9aw/R0wZzUrGqX+H2hhUs6/ZN1Siz/FFGT0GQxnCG+EqWOibdq24WdhzvVyr2w
	nTfafcOuEbTxVa9yWSGI7A8akL68gGx0YS1XQurCYjKiuVx0zmPgOH54X4x8NQAL
	srQWPG/cOioCyGoQADDA8gTg/FOAjp6Cemkmhoeh+JsIBK9vMU08Rkeopw8QLYZp
	H+OtgQBGevHfuoEbM+l0HZtJrOO/F4buS8Bo6AXM3kY7eg8DPA1wGp2ioNO690ss
	9k2YxEksHwMGrYEcg3wumqtO3sPvQ1uJ2mmnadgGWznVqDX5oJDZRr+olHJwdGDM
	JYMxqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1tg0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 13:09:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso16986021cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976992; x=1766581792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=;
        b=UUrpPp/sqvEzSewyuZBG4SNsfx4A1Xa6ArwV8P4OEt9SZzSy/3QeT6ngytBO+SKTTe
         0YMSHlzWJX4Vz91BcyEuTLChGGXDRJxgXkqq+i2dezgrvHa8sgt8a/zn/iHoYyIiZXb1
         USOLQXAn1nZylWqZAL5aMRgzD4+BuXjqIhTLdtByzsO/RUknIs2R0qzg5anW09wYcjGN
         haQE0TZ1tJ0rgfue/3zZ6qfzxThClfl8fZ+j3wjsdFDh6pHRnjNppb998ZwDQKY7dekR
         8S83c376kyGGbaw7O5lcoGFCdkJAd1attGNOqNl4qSWA9ydFaF0xTj6PBrDTgXREkx04
         /+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976992; x=1766581792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY+m1HxvRLCAvE+BIW+be1ykVerj/S4gZuW5Um71+iQ=;
        b=P+3L7dXRWvTPFlNkVn7QvMGGqK/W2y81X/kz/9fz3JSY1aZur+lawDo/3AinwIG2Pa
         voagv4lGtyLry+bpedlaOMnqQZBWJ36P4TJDmCz8ftrMsRV3RgH1Jow8+VfcKY9jlOr+
         fDGa7Olc6/giFQwnMU9LF4FN3M++o3BvDww1nwGmaAfSWU2wOQJEZ67Yy+IP4Xt9bE3U
         u5MDoa/nFEd8rqoLY2o/Id4GwZB6TRFz4OuaxcPeMLRSgr7AT833jEjva3DdllMSGd6n
         qAhPydE6M58m6Yx4DLPRVM/uUpNFf8JLPXlrcbbQMkhXYdH4DEiIcauB2Z+mxzv3hwsb
         r6OA==
X-Forwarded-Encrypted: i=1; AJvYcCVIXH1I/qZZAGt6eE+E0gN3u6ic/Xa6gcYwvUgQTMAwhYLTk1+mVUMdoxAdZAoGEDuWpMpUPBQXXT10NX5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85sHU/IkGsQEOGLFgVyfPE31Ryi8Zi4NaZmA6xjQnljxl7Zk2
	n6l0Rqi99QXHGbtlNaodnJJXMmThUdHnyU+hdwzbJC0aZqNnqkBFaeSvu7/lEUrW8Lu01ZCoRB1
	M81IfeM3Y8pO9E2gJEEqBa0qpVU8O6mtV+rNmyjHt647euSh69m+3Z1Q27nNJ7kh+VG6k
X-Gm-Gg: AY/fxX55YGRjyvR+cJufMvAJ7d/ZoNDpIK2rYM0bVA2OtEEMG82/KvQ0Zb+Z+SFA4jJ
	haT9El6eQRFG8bl7gNkHMUIVdul8cfAw7cOeY2tUhOooKOytc/4nau+APwJt+ek++KQUI082aAq
	7K5bP3gQlOW/LBUD3haQAfVqMX4bJug06bQ3cAOF5NB+cF2iFCXQH7ZFrObq09qxNwPVBZbnDsa
	8R5X/Yc5HJI+4QSXG6j/yE4mOkT9cHo8QpmxR8kNVHwZlI2okgZNOnM/9vHhwZ0hFvVRz3+7d3y
	62W8PzD3ON7+L82+In38JpRCr5BYLkMygGUlJ2eP8m5bYQbN/bvBZRd2mw0Vwg18q8m5TEiI1o5
	TwhNdHNscqVw0ZUrBaF6EjJu7ia7QCtUqa/+98RUySUGB5D+VcLi5mNsrsla9zmOTfQ==
X-Received: by 2002:ac8:588c:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f1d04ec585mr193474401cf.4.1765976990889;
        Wed, 17 Dec 2025 05:09:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFOIgftumFt2rPagd7WMAwupyG927hYvjfHGYbMJ2mFWjjolrhO9f+WryJIAq0yWn9bWnTKg==
X-Received: by 2002:ac8:588c:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f1d04ec585mr193473791cf.4.1765976990115;
        Wed, 17 Dec 2025 05:09:50 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29eb69sm2014690266b.6.2025.12.17.05.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:09:49 -0800 (PST)
Message-ID: <0560bae7-f825-4bd4-bb9a-b7d145b0e621@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:09:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
 <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
 <20251204122806.s7lnqffgcrd7usem@hu-mojha-hyd.qualcomm.com>
 <e78feaff-0b48-42b6-a824-0f102a6ac9cc@oss.qualcomm.com>
 <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sysdgcspvxhytyudknnyj4hu6lc47we5ijkrsssi6askysqyo2@bdzl5cvzc4be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMSBTYWx0ZWRfX9YF0OVWDGp3r
 RoeETOMhWnJbOqJxchuZkuSRGE5rYDfkjGieqy42cZm0yovTHaWDq2Oww45Xp5FCbKS7GIxA06l
 VkRuygLcjyMEvsCNhkyRvtCQELaTTzEIyxw+SdJJTXlBplvIPnn4vZNIfKAL9i1n3ac7RbCUco/
 OmWaAAgMrk6V0uC9TZXPgrr8c5wwUzsaTQy4nSzAcYyY+SgYBzzvF2rNTxcfWLjARU7IzJUuqxa
 RmQbCm3nn/K99RzAX+8n2ZXfk8LEbjTQaaaCG5p0vB0+diW12oexWSQn5c7f35YxgpIJBpKMRiX
 8xWMFh9iqQCS5LOdlmBVljIBxKb8EYM3WjqS0E7Lqb2xvP+8qx3Qx5H4BdJzwECx1jVqYr/bzBo
 UO3M/P0r1ypPTGpsTEA8OIhUJaLM9g==
X-Proofpoint-ORIG-GUID: 0YG34MnF444sP6MRnzNXFnek-IHbR80x
X-Proofpoint-GUID: 0YG34MnF444sP6MRnzNXFnek-IHbR80x
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942aba1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6YH-TVDjK5cHQ1zWBw4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170101

On 12/5/25 11:17 PM, Bjorn Andersson wrote:
> On Fri, Dec 05, 2025 at 02:15:00PM +0100, Konrad Dybcio wrote:
>> On 12/4/25 1:28 PM, Mukesh Ojha wrote:
>>> On Wed, Dec 03, 2025 at 01:36:32PM +0100, Konrad Dybcio wrote:
>>>> On 11/24/25 4:25 PM, Mukesh Ojha wrote:
>>>>> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
>>>>>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
>>>>>>> Qualcomm remote processor may rely on Static and Dynamic resources for
>>>>>>> it to be functional. Static resources are fixed like for example,
>>>>>>> memory-mapped addresses required by the subsystem and dynamic
>>>>>>> resources, such as shared memory in DDR etc., are determined at
>>>>>>> runtime during the boot process.
>>>>>>>
>>>>>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
>>>>>>> hypervisor, all the resources whether it is static or dynamic, is
>>>>>>> managed by the hypervisor. Dynamic resources if it is present for a
>>>>>>> remote processor will always be coming from secure world via SMC call
>>>>>>> while static resources may be present in remote processor firmware
>>>>>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
>>>>>>> with dynamic resources.
>>
>> [...]
>>
>>> Just to avoid iteration, are you suggesting that we can keep this
>>> guesswork as part of __qcom_scm_pas_get_rsc_table() and start with
>>> something smaller than SZ_16K?
>>>
>>> I kind of agree with the first part, but SZ_16K was the recommended size
>>> from the firmware for Lemans to start with, in order to pass the SMC
>>> successfully on the first try. However, the same size was failing for
>>> Glymur, and it required a second attempt with the correct size.
>>
>> It depends on the payload, which you're probably much more familiar with.
>> If 95% of them will be closer to e.g. 1K in size, it perhaps makes sense
>> to use up the additional few dozen cycles on our amazingly fast CPUs and
>> retry as necessary, instead of blindly reserving a whole bunch of memory.
>>
> 
> Those "few dozen cycles", is tasked with sending messages to RPMh for
> voting and unvoting the buses, then tzmem will hopefully hit the
> genpool, twice, and then radix updates, and then more genpool updated
> and more radix tree work. And then of course there's the one context
> switch to secure world.
> 
> If we don't have space in the genpool, we're going to grow
> dma_alloc_coherent, extend the genpool, call secure world to register
> the new tzmem. And then for all those cases where the allocation wasn't
> enough, the retry (with updated size) will not fit in the
> PAGE_ALIGN(size) genpool that was created, so we'll do this twice.
> 
> Fortunately the tzmem growing should only happen on first remoteproc
> boot, but I think it's a bit optimistic to say "a few dozen"...
> 
> 
> The drawback with making it 16KB is that we're not going to test that
> error path very often. But the more idiomatic form of first calling with
> a size of 0, then allocate and pass the proper size, seems a bit
> wasteful to me as well - in particular if we do it anew each subsystem
> boot.
> 
> PS. 16KB is 0.03% of the ADSP carveout (or 3% of the ADSP DeviceTree
> carveout...).

Hm, perhaps 16 is not a bad choice then

Konrad

