Return-Path: <linux-arm-msm+bounces-78138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ACDBF5D7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9804B353984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E1132B9A9;
	Tue, 21 Oct 2025 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inIlSqT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186C303A30
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043183; cv=none; b=VamtzKWmDg+M1K+9bgqaKGyAeVEQEKU8SXZZg/V+M+kdtmtWKku8TRj7b3fQLv1nbGPbd9l9mThCGGKrms/fKFn6ZcT54RJhNrAant6bf2LapJxDz3Ma5TItGS+Ok/gXWMmhqHcVLySCBp5LkMsRsXGAFA7ehFotIkLDD/rIdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043183; c=relaxed/simple;
	bh=3eyts/YvSz6Z2j6Hh2fF5Du51iRzLiZUzcVSn7JWyXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxnCaRplCkSopscqW/jdczSZZfeYO0NhZRH/R+PHSu3P8rhQWLDUb9BBDwvwAfqTv8L48k7nxSMQQCt4UnRIoFgT9FBD4bvF39CgXmRAdco2Mdfn7a/fJYHnQW/SIz1EhSf7KMhbmzGYchRpc787ksd7FsUQngmZRKFuK7AsCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inIlSqT/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L88DsJ000307
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7+c3xtc3nVt94h0Qqk1xzCCdoDbTh3wKr1i/jVXoiQ=; b=inIlSqT/7z1qJObo
	aFHVFRIbL3hSfwahrjlnoSimCr0gpopnU8SnPGbwmv9OE0ZzirnnTGANUlNrNnt1
	PjPMMLhfWn4uLICAReZL82xHVlYoP9S+AfPxpka97gpNja8aGaI0ZCKPCvvOIEvI
	SYfBv9Pjij/Gs4YzQs6G2DFHTsJGRpO9Dnsy8a0GtI8ZtPc0nF+BSkBGMPJd+LSe
	MHScDvZKNOoWvz8zxvmxA3FnZeZT/wI9F+jnMAaEKUc66FZpLZKKDNO2IGNaehcP
	YFCD4jK9cN9/H+pINb9RjKRQYcbJWyzQ0tv9Sa0fHb0KZNxpYXmEWDEDcKL4k6JM
	OP1s7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w5y71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:39:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-890cb81b3dfso204243485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 03:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043180; x=1761647980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7+c3xtc3nVt94h0Qqk1xzCCdoDbTh3wKr1i/jVXoiQ=;
        b=TihWsISMPAeKeTif3Lqwvd8MrL17ZnCZP+9lstx4jeFe2GAGJ3fcuOMJE7AOeV1lHi
         vn1kNmH5wYd3BlwS/nQqSdnyLvOVjC+vIo7kwM6AbEUAn1AZ5NUvIA9mfzyyipa11sBs
         Pu+EhMOf+wrKjzqqp/gX6HKxQNdpiDVcQ1Y7ZQj+7QDN1CUKZTKymHPesX6BR77Hh2O6
         xBtczKJDn+rcTOqpZwEz5wTFC0fofyW614NLl9FU7LtJVGXzjZTpt5HC7r2SFkVAbTPR
         JzCTRtQZx8IIrWG5FsTicG43CdeGoDVzNJeVUu7eVLDy18BHamJgLzyA7pUUw9243H4w
         mZOA==
X-Forwarded-Encrypted: i=1; AJvYcCU93Vmwei/u5/XSBqAcAKBwGfa5S26FUw0xQlc3ExV1KkqvqXuFaDt7sK4rAH7MkhWNUSvu/zZlbHXO1Oy6@vger.kernel.org
X-Gm-Message-State: AOJu0YzWOYggHuBdrv1swbJhygnnDgTg7ZD9PoDcZk9fKdL91y84yU5u
	3PoAdiHO07dVgghroPSlpb+Rc29v9FUhlLYbEAICsPSD3wzXsWLLjSWLOrkJqzWPnj0ka7ZdjF3
	+n0sw289nh94nppjrAVVOKAuRbqRYlro8p3nmYYhBUOfoVzm/WYdtmvqtTi/xCPuadh+f
X-Gm-Gg: ASbGncv5fMAb+JA37bLf0cVb5Kbs/bx24qN0JMSJmd0nlI27UZbSUKGBsSA3UzqsoDy
	NUj5xV+x1XesrgmX11hKHcCCVLfMCWqaeQ/YDx+VqHRTCzmnZ73bjxO2LLTBHrolFY7pjBWHYmB
	CdwXX9lB5Do9rCYhp5a4/cT31kHmnlKV5Z2iy4tMcg7zWLqo90kcZwluq1QXsm5GEYtyZEYrMMw
	pFU7wrIl5u+v+IGB7cvw1UAp+pU2A/iJy+OxPiFftpB5Tol0LkDV5HClLZpSiFUY/uCFtG6AnQb
	jkrC4/weaS4jM5mPBKH2M2BOsoc5gYBjGd9LKIduH5UQVSa+6WZjEN70OnWqVigiJuwuR+lREK/
	KDOWkowUfiLfRRgqEPgzY1JQ4tDllK2sxn1BkXPRYDQMW6h5v37kw8tsO
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr20960191cf.13.1761043179649;
        Tue, 21 Oct 2025 03:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAeB5jrQGCav3qSKZ0xPgQHNQotUHpiAd/WgCgMc2vlJjKdTeD+j5g4MFS9sBZG3oO/Qm9bQ==
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr20959941cf.13.1761043179164;
        Tue, 21 Oct 2025 03:39:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb03649dsm1041530466b.50.2025.10.21.03.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:39:38 -0700 (PDT)
Message-ID: <f4dc003b-d193-4016-bf37-7172300f0464@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 12:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
 <DDNXN4IVYLIL.3083X63IIT9B2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDNXN4IVYLIL.3083X63IIT9B2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Bm6SeoW0mnV5bZhH0aP4PPInDzQyCZIY
X-Proofpoint-GUID: Bm6SeoW0mnV5bZhH0aP4PPInDzQyCZIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX4JQvQ/uAZhkn
 sSobKhR8xKUtmU5YJ+N1jWRDeWUEtaN8dIAi6XNXl5l++5ZkHoHrc+JpMz5AguA/fAc820uwKP8
 KItLARGWMfy9G1JuLKDgVou+mu2A+6zps5irPk7KYh5WcSgQCcG10aplJ7btCItv6ak3zwRCyy2
 EcEOYG07q8wDWTxRgKNel2Y9H8aABmw8trKmNK36oaAaR3jonvCKwj2EHcT/DyRCbuRis6xFjWw
 XijuGn7JI3/3MOhc7eY+hJJfw7jPyqLDhvjzRxiXTZO0jrUejUq38F4tgN69dDTB/+HHzOMRuyT
 syVkJ/rbNSeryqgTJNdjZAVc0MKL8QsA9RVWF9A2QG/NFUNeW0Z4BaIZz8CgBPvFlpL2TuGx0sI
 vqxzjD6e2gsgWL2XM+mkkZcq7V8qqg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f762ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=z5B4IXqlO_MRCTr_IEYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/21/25 12:36 PM, Luca Weiss wrote:
> On Mon Oct 20, 2025 at 2:21 PM CEST, Konrad Dybcio wrote:
>> On 10/17/25 4:05 PM, Luca Weiss wrote:
>>> Hi Taniya,
>>>
>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>
>>>>
>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>> Hi Taniya,
>>>>>
>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>
>>>>>>
>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>>>> domains.
>>>>>>>>>
>>>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>
>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>>>
>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>
>>>>>>
>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>
>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>>> need multiple power domains, or in general which clock controller uses
>>>>> which power domain.
>>>>>
>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>
>>>>> That'd be highly appreciated since I've been hitting weird issues there
>>>>> that could be explained by some missing power domains.
>>>>>
>>>>
>>>> Hi Luca,
>>>>
>>>> The targets you mentioned does not have any have multiple rail
>>>> dependency, but could you share the weird issues with respect to clock
>>>> controller I can take a look.
>>>
>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>>> again, but again hitting some clock issues.
>>>
>>> For reference, I am testing with following change:
>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
>>>
>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>>> on this phone - results in following error.
>>>
>>> [    3.140232] ------------[ cut here ]------------
>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>
>>> Checking the driver against downstream driver, it looks like the RCGs
>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>> downstream, but changing that doesn't really improve the situation, but
>>> it does change the error message to this:
>>>
>>> [    2.933254] ------------[ cut here ]------------
>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
>>>
>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>>> iface clk, could something like this be missing on sm6350?
>>>
>>> I'd appreciate any help or tips for resolving this.
>>
>> Is CAMCC_PLL2 online?
> 
> I'd assume so given nothing in dmesg is complaining about that?
> 
> But not sure how to check. Debugcc can't do PLLs, right?

The PLLs have a .is_enabled, so you can take a look in debugfs

> In any case adding CLK_IS_CRITICAL to the camcc_pll2 doesn't change
> anything.

Was worth a shot :(

Konrad

