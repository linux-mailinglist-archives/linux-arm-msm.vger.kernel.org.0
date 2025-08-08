Return-Path: <linux-arm-msm+bounces-68109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE249B1E58D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86BF81891ABD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D38726CE26;
	Fri,  8 Aug 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE1oFDjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094292AE74
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644920; cv=none; b=Oj2KjLe2iJT0/NSOg1YB3H5ocVEFqMcbj4pQ2AetamzmVQEEuUBDmK2u0aSs0M8z4+nsjrVVm+m6QazdqFn5cJwiFK3RaLuax4UTuyqRo4MpxYAaFDTwexmg53h2zXazODQGQIAlLG0QhaS6vpUpUYubEk4iquIADWv3Pe5YAZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644920; c=relaxed/simple;
	bh=+LRvJeJfjFFMg5w+plJD0jeehIK7GSgpPpZ2/CDxvLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUXLyf8zd9uQiPeSVlXxqN08gkBzLlAe45vcE64wkXWi0IUtn9ze8cv0rgoj6Rbz6FhRIxMfI/3N7c48pITA+BsCwO14UJ/TlRZ3EbW714gmtMPs5V/A7MEf+BUW1R5y1FmkMgJ/GB5g9HeycFgz/Yn9d3p71aSZXvDdWMsArWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE1oFDjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787BvEE018676
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLqDCDW47C/rBLkuL0CDYXX3PXQC6B7lLgRqBiiYRmE=; b=nE1oFDjzKsd9bkN/
	BVedQP/mKeYD+w6+XSyAWpH0OIaq+aqnQa8ok1LmdnGXCE0ttNeXC+wmapu0wLvd
	m0mPm8HtdFAndd49h/hl1Lz/UEoEnESg1QuAtW3SPXNcConYgEh5libkcNFIjdwE
	7qCjl19kI/T/sdUh1vTlpTLv3XkOP4jfcoVlFhqUG2mk/41j5elyqrSUwoCU6W2F
	/XVIEdnQf17MsFEyiWNDuS2BV9tB8dYCCIHAJ/GCSz0kWRO76XwlREniSY5K5ccL
	BkU/NP3p/mubqwaF+x/IL0i+u8pHWkYfon7075034Jgsb5JDn2Mf4eeDAB/MYgwu
	5VdJdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8hh97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 09:21:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3214259ce67so2666668a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644917; x=1755249717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLqDCDW47C/rBLkuL0CDYXX3PXQC6B7lLgRqBiiYRmE=;
        b=rizNRgzy3CDJVY3U93BfCIJU1RJqSgstMKppb5fWYlLZ1XKkCQx8eWMKx+zzKj7ysM
         +q75Wibq/7jykhbW05tKCsEAqk63GPdvjO3YKrzjR06O4hGxEVIse+wJTEgTAMeB06N3
         mSjUOoRtNkdU2MGqybvbxLZrkLutuD2K5orxO6oBTX9nwDzNn4lETW5ItgpXRbVJ1/vc
         iGINdxkQl/doCKyy6XFtRecIQURPuBiMNsUjhs7SwC2oBvVVwU8YrvjaeVcg+7wYCxTZ
         xxicmnkzHbUx2m3hv9vJ1f5Xe1M7keoz+18s1DlyfuzccXGGqovDVwurdygBInur0t1m
         u4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVKab8YwulRn6gPV5LheYGo55GdsZIiTN+u3SAk7McTUFwVZUdWMj2j5jMkYaVEABi8Td63nrH2y4jwKpzL@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3jw3Tzo7KILpwhV3Mp0FP/YTjT7/EF9pk42xNJ15etKYSrPR
	PVaNxMwTE+pJ1zSviOGMUy4rON5dJbE/VLlnGkHWCb9U4iHF6AWs2F+7ERzCypLouUkPjDOZXIj
	sQmXIl0M0O0z36T8XJbgLJdcfGZk585uHUcvJsHEkikPAKFkqiPb4QBLuEDFjxSPcJvyO
X-Gm-Gg: ASbGncsM2xZVU+jusOHQFxpvFOEwNkhCq1KfeD9wNhIHxrsf8Uj26E7ySK6VO2hWj7O
	iDnjjlt8WSZphVx+P7YIyLIUFSWiTRVa0jIYgiYMDs6XVSS/upEPCpUohiURj+szLDCoj9PMjbw
	i/b7yOo2N6xZ2wf3Xle/pi8Srpk98YVoVnH1FhiQ90YE5V6ia4ks5NdS+MkhCmO2WuG3UDafQlj
	gD9g9eALbJsKikrzc3bYCJ4Tiw/3q04BxL0QAM6nT8TPjPD2AedJngMgxnYnX/bhLsto2UTIXxK
	j1HcvxGFL4kDiC6zV8QCXGkr1vfJMWTuGcY0JFHnhF+Q8EXS9/qCMB/o42IoJyMBSJc=
X-Received: by 2002:a17:90b:55cb:b0:31f:ca:63cd with SMTP id 98e67ed59e1d1-321839e9a33mr3492812a91.2.1754644917293;
        Fri, 08 Aug 2025 02:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4uXTfQa1MeL3UI0IGJQ6NZ1M0GNenD3TaPrzwHHNOEp7HbRnfFH/NMIAJMm8cm52lQHbQIQ==
X-Received: by 2002:a17:90b:55cb:b0:31f:ca:63cd with SMTP id 98e67ed59e1d1-321839e9a33mr3492757a91.2.1754644916703;
        Fri, 08 Aug 2025 02:21:56 -0700 (PDT)
Received: from [10.218.30.152] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da5719sm24531355a91.6.2025.08.08.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:21:56 -0700 (PDT)
Message-ID: <7c1bd3d6-159f-4269-a22a-34290f1be0cf@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 14:51:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d0871d6d-7593-4cbc-b5dd-2ec358bda27a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LOoViJc_j3Zz8WV7gAuqEHwB-y-rUi-x
X-Proofpoint-ORIG-GUID: LOoViJc_j3Zz8WV7gAuqEHwB-y-rUi-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX/xWQz+4Ry2Mn
 H9+lh685wKcNQQZ4Sdx33dxATf8IbcLc5Gmlx1/PDFOMqtJy+4rjy2XvczdHZv4fIxvljlRg6yU
 UCq3r26QjQTYJO56bp9U3UqXchmCUP6m/Yqre1NwAo7NzCgVS9WrMzTJJXIjigUUEqoy0RYiX7h
 Wi3QUFRS0kdaK9oPuluM4+E01tb5k8XY9AtsNO9Wbl84BKQbPlgwEdo6+toySC2Wz5WGu3mTxSU
 bjqiWCL6XdJ8aNbiWBClniRu2Ve3EY2zJku4BxyppdlEnDOMydcloaVH5CQ1/kbXKIL2MNQ1ycC
 RWcl6CPuW4Ss32Yges2zjGEojM4AKjTOcsZQakSdPOWRGc/HwKWRLEvPEYxkUWfQdYN4Q/SVnQ/
 sbuq5aVa
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=6895c1b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=wbLa1xrU48ZvrQgpvw4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/7/2025 10:32 PM, Konrad Dybcio wrote:
> On 8/6/25 11:39 AM, Taniya Das wrote:
>>
>>
>> On 8/6/2025 3:00 PM, Konrad Dybcio wrote:
>>> On 8/6/25 11:27 AM, Taniya Das wrote:
>>>>
>>>>
>>>> On 8/5/2025 10:52 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Aug 04, 2025 at 11:59:21PM +0530, Taniya Das wrote:
>>>>>> gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
>>>>>> boot. This happens due to the floor_ops tries to update the rcg
>>>>>> configuration even if the clock is not enabled.
>>>>>
>>>>> This has been working for other platforms (I see Milos, SAR2130P,
>>>>> SM6375, SC8280XP, SM8550, SM8650 using shared ops, all other platforms
>>>>> seem to use non-shared ops). What's the difference? Should we switch all
>>>>> platforms? Is it related to the hypervisor?
>>>>>
>>>>
>>>> If a set rate is called on a clock before clock enable, the
>>>
>>> Is this something we should just fix up the drivers not to do?
>>>
>>
>> I do not think CCF has any such limitation where the clock should be
>> enabled and then a clock rate should be invoked. We should handle it
>> gracefully and that is what we have now when the caching capabilities
>> were added in the code. This has been already in our downstream drivers.
> 
> Should we do CFG caching on *all* RCGs to avoid having to scratch our
> heads over which ops to use with each clock individually?
> 

Yes, Konrad, that’s definitely the cleanest approach. If you're okay
with it, we can proceed with the current change first and then follow up
with a broader cleanup of the rcg2 ops. As part of that, we can also
transition the relevant SDCC clock targets to use floor_ops. This way,
we can avoid the rcg configuration failure logs in the boot sequence on
QCS615.

>>
>> We can add the fix to do a check 'clk_hw_is_enabled(hw)' in the normal
>> rcg2_ops/rcg2_floor/ceil_ops as well, then we can use them.
> 
> FWIW this is not the first time this issue has popped up..
> 
> I don't remember the details other than what I sent in the thread
> 
> https://lore.kernel.org/linux-arm-msm/20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org/
> 

Yes, but as I mentioned the new ops looks much cleaner, so wanted to
take this approach.

> Konrad
>>
>> AFAIK the eMMC framework has this code and this is not limited to drivers.
>>
> 

-- 
Thanks,
Taniya Das


