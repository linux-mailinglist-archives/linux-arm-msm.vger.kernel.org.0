Return-Path: <linux-arm-msm+bounces-79635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA320C1F649
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B9384E0126
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBF3345CDE;
	Thu, 30 Oct 2025 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SiQEN4RF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EW5Ll5sX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E553E212557
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761817980; cv=none; b=ZqQwBeihit1/gCXMUzLN1uORrrNEz/YIGTBWpkQcsdk1IuszHmK5Md6FUqqiWy44PruUOtroclpMssXfXncoZ4Bp2NJ7JLfWaZVBV1Yq8YNYRxRzc8iuwuLBmCb888SwFy/2aXoCuoNoDIx1rFyjffOUSDd2Qf/wWjVvwrR3QG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761817980; c=relaxed/simple;
	bh=FlrkaRoQxudA8Iqh8NIum21kvoD9XsF6BxhBChsHk4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTEafpN/BTIJgb1xD/ZLohNWHAy14C8N9WLu89WrJOJ7jcOA+exWEhPVA4FUVETtGjZfFu2hB929C7ts3wYNmbEZVyLZw8WSc6TfO0l2Ky9DgU095Cy0BDwkPax20qDBNdENnlIR0vx5oIpeDPocMHttJYd/FLjWNS1DzukPF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SiQEN4RF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EW5Ll5sX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7QnQC1501736
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=; b=SiQEN4RF9xbpJ1w9
	ooeOXGozPjTyHk/CPlMcm1ta05F+QIx2DzgNqWZYlDpcCjRqAqGcy+dyftb+Nyp0
	aDHX6W+XeNsxr+B/loSsfqhe5mUUGb+5xkc2hmKgkRtfYZgU7UlsUzS9ywvBEz69
	YrZFHq1IYQMGfQ1lUi9YO+b4qKPSm7qJU5x8oTZp3PwPrBWWC/DjSZxtXIGjnIHU
	uJnNykCqajYoLlHjuGuensKCBZS0mXYeTkSG8pZqRiamm9usd/v/mtFvythb6EiY
	pKe/A0+VwZq3h45hlMfV9bvbsdCT/WpYpBK2RA9n5SzNjuOpGh1y1vmatxvXQ7xZ
	S9DOkA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jt19w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:52:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8800460ca8dso3235356d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761817977; x=1762422777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
        b=EW5Ll5sXNoWqxgksu5WyjLKMIQm/2AF5iKIQJijyW6FwRZnYREuN2aaqONLwbRQlU/
         jfA/JiWAiVjTctfys48aZi/A5DxSGZ2RdojILikDPl3D4XEAQWub0f+h3FDHgIajrTLV
         ezHOgv5Q5AnKYyYfSdGShBJAaNE1Pywam9z9oHRIaatv8MINej0MNmu4l2nYfrqqjijh
         oni13RXcLdsip9zSPcsOvjw0I8TbDZtn97kNqRnIrV4O8Jcf4zOp30xLyoxGKX4qZvR0
         DDa6yNnxFOB+TkOgr+xz1Xjw+UfKWomqYlDCtoYWs6BQsuvb664T5HSbP5k8ze7qsERV
         gawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761817977; x=1762422777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7Q8Gm4q1rlF4zxFf+h3/o0rNZAjE7F9daCHt68XXws=;
        b=qKNV6XbYd9OhKn5D2s0XPT+AS4UAFT3h8be3f+68SJt3IYK0p15v5LGplZYZzKGUXA
         ymgNuiZBZechRiGlcNbYofGJPpC3ErGevNpERpMdofyQPdYNuHkDsgKwUtlghZBeDE6j
         o5BcJq7P8tobzkdx8QRaYuy9zbBSVVZdUN4cGyts2okwCZPv5cMEeCn0qEH6z/IbQgxm
         EtTBa4AyAXGJo8HDZhyWx/aRD5RExGX5Dfs4rpcCaa0Ur8OudfNlxR4uKMbmpmQzsBd6
         rNkvZ5aNj+dd58CIyOKzly924f6Dt/v52klKwlVvtfTTe0R5BYJ8Y8NOwo5xweW4/wN8
         1diQ==
X-Gm-Message-State: AOJu0YwPZ7rUTBTpF9BaCz8mVJLG51qkrEaV99pN24RNRFSImvxF5cqf
	shXUSMB/+RWPznsqHo+8P0q4Of+67bAnLfjFE+cbQ3PB0h7YLYq5js3QGDFKNkQ8R12fwrxVf1s
	OrFRZJfAG0zbojT1JTuGgZqBUoaJvmbwRLmKzKptZmUcI3jUwnPdV7QsOIL50vHQUetoe
X-Gm-Gg: ASbGncsJRBpBpMEugaQTGtXhRSYQkcEoXIRnVJsU8HMRomwBVXSQnr694txRLLhFK2y
	CxtefFFPDPmrI1WXEqQvCQyJErJFHR7+3Y+/lo6P2RKg4JK77Y3i+EoS8wu3NihnwmrW8btl9DM
	uiIFOFZCI+EfOQeaRy1C5ryArHQ/Jz6ruRpHUtsnFyHNSashtCogXLdIwAvTgw6N5R6nzj+IVtg
	E5tlRaqXBhVigkI7q9b5oWXmVY2TAl58k9/k05iMbXhQoKi9ZTa/jRsSlS3lJw1TdKAVy7CzcjB
	I9v3uCP5nPtIrsagGWioRp+fNtCxN+UVpKsYxwJ3QLMSYDfK4sXtSFqXh+vDpIPVQpkgbr9h/GA
	/RfhW9Ec4s+DyD0t7HWiI3LOrId7wbNHTP84h8LneAwitQbFt4xl8gPzf
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-880099ac8d8mr52250746d6.0.1761817976924;
        Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPEnRfdgeY9SqFksQVxRyzlmk8WoSCfnN23Yxc6FUxQBSZpZ7uQW7zVih/5H4U1d6Rw4R1pg==
X-Received: by 2002:a05:6214:c6c:b0:815:e14a:1f44 with SMTP id 6a1803df08f44-880099ac8d8mr52250596d6.0.1761817976393;
        Thu, 30 Oct 2025 02:52:56 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640342e5acesm6138757a12.28.2025.10.30.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:52:55 -0700 (PDT)
Message-ID: <a15e8316-96cb-452d-b2b8-731eeb6d25d3@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
 <25e829f8-60b2-4b69-8d57-ded846b5206a@linaro.org>
 <c79c55fb-3aaa-4256-a71b-fa86cd0166f7@oss.qualcomm.com>
 <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bed92353-da4e-4447-97d2-10e8a333e4e0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oesRvIOcLU9NKSWV9OVOUhRNTBPSig6S
X-Proofpoint-ORIG-GUID: oesRvIOcLU9NKSWV9OVOUhRNTBPSig6S
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=6903357a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=M5-gK5ubkblMbbE14A4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX6k7U5IO7pIkY
 JYuqc/2sdtkHVwCxmcytrX/EugsoRaQjIPHqTs3PB8wZVzHMVpMi/kKss3/t6s8EWht5YdIH8bz
 ++f+eBXEAnqIWw3+QNb7x/50IDYQ5dmrCtPMiVrD80+A6GQIf28HLNGeP0fZrWctcfdsKh2FF2W
 N7+tU9jqpD6sCmhG2Hm1xVCE6P8wMS2u8V7JtsfLREdGFf4E/UQua3mtVUf2NLVlnLjdziaIqpV
 2ZyLKQQeSJvnOJwd4zRV8KBl96Bq0cw25fgpTfpAInLwQ129xyfPtxTOtc9ktsNI2Ekst43Xqqr
 2cMAHieaVJ76znBJabG7cyW7emqdZOb35jPEh2EWbQHa720oseovtZPuppiFJN3O2vzXUUD9CRl
 K3aMCmMvwTXmW8Y/rEN5wX3xpdahmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300080

On 10/24/25 11:11 AM, Neil Armstrong wrote:
> On 10/24/25 10:55, Konrad Dybcio wrote:
>> On 10/23/25 10:27 AM, Neil Armstrong wrote:
>>> On 10/22/25 19:09, Konrad Dybcio wrote:
>>>> On 10/22/25 2:44 PM, Neil Armstrong wrote:
>>>>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>>>>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>>>>> full performance:
>>>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>>>
>>>> Does this *actually* cause any harm, by the way?
>>>
>>> ?
>>>
>>>>
>>>> For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
>>>> to a pair of GCC clocks and GCC refers to VDD_CX
>>>>
>>>> and I see these prints, yet:
>>>>
>>>> /sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
>>>> /sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0
>>>>
>>>> /sys/kernel/debug/pm_genpd/cx/current_state:on
>>>> /sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes
>>>>
>>>> I'm not super sure where that sync_state comes from either (maybe
>>>> dev_set_drv_sync_state in pmdomain/core?)
>>>
>>> The way we handle the GMU so far is wrong, it abuses the driver model.
>>>
>>> And this is a symptom, whatever the impact it has, it needs to be fixed
>>> in a proper way.
>>>
>>> The sync_state is retained because the gmu device is never probed but
>>> has some clocks and power domains attached to it, which is clearly wrong.
>>
>> Yes I agree, however I'm only debating the commit message claims of
>> 'leaving the resources in full performance', which doesn't seem to be
>> true
> 
> OK so the wording may be a little bit extreme, perhaps something like:
> the GCC and GPUCC sync_state would stay pending, leaving the unused
> power domains enabled for the lifetime of the system.

The debugfs reads above suggest this is actually not happening

Konrad

