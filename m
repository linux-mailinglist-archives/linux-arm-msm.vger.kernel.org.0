Return-Path: <linux-arm-msm+bounces-68044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DBB1DC33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 19:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8348C1AA73F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 17:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C105826D4C2;
	Thu,  7 Aug 2025 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9zy3vnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEC26E17A
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754586185; cv=none; b=b4ubEyqszM9iu1n90myX0fIkMxNTPnDF4RYDBHLToJtl4Cu0UuXuqyL2cuYjHaQxGx2+NDuqMIe/5xXe26BMaY7dTfl7FnqJXiY5/nqXDbnmSF2stHVqjueWEFdJJuDMAc27lFp6NBvfmQmXxKm5TKnPXO8RW/iIiWH6jVpaB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754586185; c=relaxed/simple;
	bh=MRqFzhSuWwMpaPKOkiqO3zfdABs1SDMuFlkVK8Hi3u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNRaraOGn9JFUF8k7hM6GhRRZ7g63o2i6ptp9j1YR53q7O5UozTRBHGaEzwl509BwNthKWGDe/ah+qMH4KtCo05PfsDv7cpD2h9OSnQm7ar//KTnjXoIG+4rjQYVK9Oj+cas6ofShTXXrFzBrxXmYQwEBZwU5T7r8lLrOtzLh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9zy3vnp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577EDSBQ014539
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 17:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kT9b3uyCnzcpZ8XsWUfgQTVB6SbH1uKhJl+tlG2vK5E=; b=H9zy3vnpq6MgjC04
	VmGfddc2j/iB+dB+g3TFzNJOnF/pDKU4u6vMZ8DeeC/nPcs5e7O6HRDTnxk23IA4
	ENZmQFyo81AZje4Uxy7qzcALQmLDvAd383lzSUSxsxFIW6p/eOPUvzTjWbysQWJ5
	wRO7vxVTrn2A7QSNjVwgfxviPEUt03OU+IQuUZO/M90jozjQ1F7pihr6X/yHjNsE
	6JLcLYxhLU2PYFbf6EG+ZO5VoRalT0thvBqEFbOYSOtdPVAKmPA4BAmQI41WI9zU
	sfjVVny+O/0uI1J7yR7o20dYs0CnkdQM03n8HO28FV+OvmVs6cfezW/KNS3WRPxJ
	0I6lGQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2y10f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 17:03:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4aef8afd26bso1845831cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 10:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754586182; x=1755190982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kT9b3uyCnzcpZ8XsWUfgQTVB6SbH1uKhJl+tlG2vK5E=;
        b=VC+bYzQeNEv+h8DvQaZl+yPyZynfDM8PFoz990pG4Y8Lyq80q2cYp7Bgtz/PwTdOfq
         BPathNGZpROpbss5LBqUF4aEl1B91Pq/tOWWsO5eSilBX5b9aiilzw10WlWHMTL8do3z
         YaSUuJwZOK7gr33DzgoP/zfk+3+VfO4sBuiKU7tz1lNLsL9Hr72wPLp96o+EGmltH6IZ
         lr5Kkm1vYUCP96MwrQZWR9j0d9KfmV7+kohemNPXrgmxNCg0TjBVJehWyVdq5+UFmB1m
         CerwkIMzjDX7YF1A5ZDrBaTxWii1IeyGerdEA1h8gHlTnj0fUm8N3t8K28w8fcq6qmWP
         fa2g==
X-Forwarded-Encrypted: i=1; AJvYcCVXbS4mjE+3CBePVn1s3C1U+R9vAlg+9ieD4E/i/6lnxb9aeoc9qYQU6v5alXpk2OLVMrIfR6dl41JRP9+w@vger.kernel.org
X-Gm-Message-State: AOJu0YxdfiERhfYsR5uaf1IXxLaHIGxhdB5AJWcaPSh8LRN6/St4D/YP
	vlLg0NyN6ITD+oPtx6JXtNDPWcR9k+Jo2USVHJrgDZPX5nogn8HlFe/zLvb4p+V1TnCEJE+HfjT
	2lfZUHEJJnYdSb9LE30InRBEUzJkKqNLVc3OcMA8ufQS5wwvOJINj+GKT1apehXV1IGEh
X-Gm-Gg: ASbGnctwSypqet2Tr7DhuA4mX0uLd3M96H0Y85jSQ+kHqNTq9lVpc6+MT1gLdQp6Mi/
	g3r3LxIgQl+lOii4chJNGLsoPhWL1DPkQTGD9MQeAkTDViZA9n/OFf93k/AlwCP7NR6Z0zs1PAy
	L1OIib17oNv+ZFgiQ/8v3c243m29EdV7h9Qh2YymDHOGI4B9j4+Vhhwm197zXBEMnWA3zMPXdzt
	QZCQGOcSYKI2kujm1L3DPr7sC9Sy1pXKmnYzt3jdmKZneHOOj6AFmMZrqNrEgVn3WMcj/XQQ4F8
	p0EUPDTvr9jR05UdBu0Bom3dXQAx14/ykQoLOpT/EHLWqSCw1NN+4vOm4sKUqQbq58Az1xCwPLY
	AggPHrKzxPQRr9qoJpg==
X-Received: by 2002:ac8:5f50:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0913be649mr53722581cf.5.1754586181559;
        Thu, 07 Aug 2025 10:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHodntMZuoTRllm//xlI3139nJlzflRuOhQf5+gUbl8UpYksDbejgbdK/rIApVL2XVDtz6+aA==
X-Received: by 2002:ac8:5f50:0:b0:4a9:7fc9:d20d with SMTP id d75a77b69052e-4b0913be649mr53722101cf.5.1754586180920;
        Thu, 07 Aug 2025 10:03:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2c265sm12028589a12.26.2025.08.07.10.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:03:00 -0700 (PDT)
Message-ID: <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 19:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sdcc_rcg2_shared_ops-v1-1-41f989e8cbb1@oss.qualcomm.com>
 <bnlnz6nz3eotle2mlhhhk7pmnpw5mjxl4efyvcmgzfwl4vzgg3@4x4og6dlg43n>
 <c54e8ac4-9753-47bf-af57-47410cee8ed7@oss.qualcomm.com>
 <d6a2937f-7d63-4f17-a6fb-8632ec4d60c8@oss.qualcomm.com>
 <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db8241b0-1ef3-439e-8d74-a3cb86b610ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6894dc46 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=F93HE1ha22ImTei5Bi4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0r8zYGCDH6V3952HLGvHp0XEHEgxq6jH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfXwFl+xgHeD4H1
 2u/e+zgTIE/2pppx1LBRZ9s0WvZEqcDy3zwefvBarpmFhgVCUaGY9TuhXHVFJWkAYZuk89XiArZ
 CLUCZGmqQm4lrG3MRzbVBhmtDgjroHunvhzsJtqeQ3ztp4TWEok8ryK1yfpSgJx86Omcw6VXPN7
 AgPCjmJx2QuJLEXKZ7iA7XLG7/ImgEDeIOlxAa7idnrLevjWRnv2jajKpk/eNlWLrj4xwhbw9dc
 xd8fCBsl59HYm6QH3H/Q1Asbyok77rACycIBRlazEpn/hFdFFJJLZzvxqYNlUDRJjCYGSV4APOt
 u8Y2xxDHiDVjkf4YGpmiH76ZNLJGixmBPvL0LoTIUtBWKSaXVTBD8DzPW5M+udSneJY6QpSJVE0
 yB1OLPa9
X-Proofpoint-GUID: 0r8zYGCDH6V3952HLGvHp0XEHEgxq6jH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/6/25 11:39 AM, Taniya Das wrote:
> 
> 
> On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
>> On 8/6/25 11:27 AM, Taniya Das wrote:
>>>
>>>
>>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>>> configuration even if the clock is not enabled.
>>>>
>>>> This has been working for other platforms (I see Milos, SAR2130P,
>>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>>> seem to use non-shared ops). What's the difference? Should we switch all
>>>> platforms? Is it related to the hypervisor?
>>>>
>>>
>>> If a set rate is called on a clock before clock enable, the
>>
>> Is this something we should just fix up the drivers not to do?
>>
> 
> I do not think CCF has any such limitation where the clock should be
> enabled and then a clock rate should be invoked. We should handle it
> gracefully and that is what we have now when the caching capabilities
> were added in the code. This has been already in our downstream drivers.

Should we do CFG caching on *all* RCGs to avoid having to scratch our
heads over which ops to use with each clock individually?

> 
> We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
> rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.

FWIW this is not the first time this issue has popped up..

I don't remember the details other than what I sent in the thread

https://lore.kernel.org/linux-arm-msm/20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org/

Konrad
> 
> AFAIK the eMMC framework has this code and this is not limited to drivers.
> 

