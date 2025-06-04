Return-Path: <linux-arm-msm+bounces-60246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B7ACE01A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 16:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B35C63A7728
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A99290083;
	Wed,  4 Jun 2025 14:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN4lMjof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106FD70810
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046766; cv=none; b=KLQi2T2Y04YHLVGjZ6G0MDUT65E9m1oFYeEofPtnQ/cY6iI3t4+KcoiuYpTyBskSOQuHJH5sUlI+e6KdA5JWT9DAzo7hyCzk2q4b28LEODDMVcNP4yxULCgyLfQaVf/9xTx/uACm3l/AilWPFR9qGOedMtxW3C6fSKkioJrfxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046766; c=relaxed/simple;
	bh=251WaT+JMDeyl8gX0jmb2fEMK7HNiXSHDKHWNo2ZsgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgFokzf80yajPECR9HFJdLjwuyk7SVOtzSAzjpWdcYFUOYvdyAjxInmoCeG2Rjmd3hL/ig122cigkL03ZAZutQkjWpVFLzWU7lIoZsSHokBdots1CFtblz56bA80Oaoewa3KvEqvy11UkI9XYFpSV23QeumcviwE9jrq3bymm/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN4lMjof; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549IQh8028353
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 14:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68QutcxCYHS15NpUFLvGoYlDPJbMclT9Ep0Qrq9GkMQ=; b=RN4lMjofG/LdXVbT
	RKNs+BWuyv0r2q/Rjd5Vycklz8k9guLF+eYxJ5MIUbApT5HbK8qrHjOeAQMqaO9h
	C/7xyaGU0eqEzb3ANecUw8pjj/hbDKJWXMtUnndh73nrjz2MKQHQoc46zd5ipUyN
	NMKIzEWgtglnQo+/WH/LWXIYVoSBJ0WFxnA7gPhOfG87PLce0ui6/k5I7P2WI96K
	pceAo8DM80nPq0JAwODUqY9+9pesLQHpWLhKIpjR7m8eQqeY+OcbMM+26uttKPwB
	yuq0iHGkbFP8U1BjqkwyioWzbt6tCfG+331056+uz0iB1LohGqlWbOnnpHAKPVPb
	W1yyJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sx9py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 14:19:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso149872285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 07:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046762; x=1749651562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68QutcxCYHS15NpUFLvGoYlDPJbMclT9Ep0Qrq9GkMQ=;
        b=WJJIz9adGJq/AHOFSbeWY/LNFnQKFlQW0toFcL+Qj681cEiL+3qZgGDcRKh4nH2u70
         287f7zS8LBJt/z7azs4YULMBO/0LlEPxNDouHTEcF/KNAGtvB+tPASbPeQ6NnYk5t4fs
         8b244ndRCAXdmGO9QO2YXDP2DeCOg40QfZ56OIb/JTS9c5hDsz7AnQhQ9tpbB24R3Pkv
         4YnMKPoqjnIRcrL2x507Ec0FiCe3yA96MtX1WvJiPZOOj/ZXXIEda6oSroTT5vunijrQ
         TbW0kdNVryhRWLg8h1p1Er+z5Cru+zMv9J9sY75Wy1M5AIdkqnrV7dI4U5KaSue4SDFm
         0cIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY2SpVN4DUZVWyJoEGzN6OgDs7BzqGmouDzhv/LqDoKIBOpZsCNjISUMFsKc+WXyNJZZtDwB1TZEcoQcYn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88XbXMxMac9iCxJ+AwdtY9qmLQvOZIUN3oafqZxb6vu7R/beO
	uBLtcWBPx6d2ze6Gr7AoMnuEiznAyzmGuA2xH3af5DMVyB/RK+EmZba4LtOS096WRur5ob3R77r
	gjOAIXwNKPM7B9+8AKNQ/fthQD4t16KKCMDf2qANBludRlmCd8H4JgssjvWiVJ5u/Yqt99tnE5m
	5d
X-Gm-Gg: ASbGnctxv/d2AErwnaZJNo16IsAyye8/R8Yf3t5Ctu27H1x6ktsQnH8VKB7FeJyTvSk
	+//2wq6HiBNQqSxrBqn5EOzQj3DXXcwYmTDlzx/gC67B4tkn/bJmpKi2ARYK9mdw01VImtQYl+Q
	+CLIJ+UQHBPp9lzemV6wltQazWBqTrnogN6gGhk4Mde51dsjjbsZX0m30cpJk3BFYU88b8eYTd0
	4wPWNkaIXFTtJ9p15nVhFdRmDEy6ydyHEql3wQ1lWc+Cwc/P5ASuRuFztv6WRr4zZrULpnqNVpH
	THbL2yvQ5TcXE1ek0UNpy33+BLjt7js0e2bii2QhNuuS4/jkzFJCQdj0v1Hz9zd//g==
X-Received: by 2002:a05:620a:24d3:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d2198eee0cmr172821585a.9.1749046762031;
        Wed, 04 Jun 2025 07:19:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhu5IVwhXMCxfnNg+GTBKDVnu8vAYsZyd0PXpSc6Ek1K+ankBBiRwyZhFW7ELTLDR8pmTeZA==
X-Received: by 2002:a05:620a:24d3:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d2198eee0cmr172818785a.9.1749046761567;
        Wed, 04 Jun 2025 07:19:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606a0ec0430sm2846895a12.80.2025.06.04.07.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:19:21 -0700 (PDT)
Message-ID: <b9752b9f-54d8-4ae0-916a-76149abcce69@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 16:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
 <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
 <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=684055eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=CsjPDDX-YaRk47nNTkkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX0X9uzWIPRWSU
 mXjzMC0iLvc3Ss2Vegnvd8SK74jDekyitE/SNkHKD9d8MXZnDxW9N3ONGca9Ec9TEk5ADnmwrO2
 yx71gHIK3BWo5ieX0Bkn2woanoF5t0PT078tka8m+VD8TQSmBkkcpw6uYDaKDeTbH4nIId2pUqc
 NbUc01bzOpA13YJjXbSVJuMEwk7zw+Tyrm+7kogGv1PaSm/6ac332dPNMOMbCT/HC2412Zy1gWW
 tT3BhpzsRXeFpiGhJL4cwWnM6CO8RaqukZbZ3gzp7nJEBOkzi9vL9gj9RvBNVKDf/WZtD0tTXwM
 3+NscsTkM2eWHyXc21amZn7vo+1sAjhVtpQ8LtXxfDoVdmLvWVrz53U1pkr1FL8cXWWZMDrTmvQ
 8dbILpdRkNG984IuihT+C4i7E32rBESM4hoqbB3SZWsWAQp57tiP22vLRweWb1VzGbJc2d27
X-Proofpoint-GUID: rbx4RUYlNPndCNdTMm_nGMt4s0paXJ-N
X-Proofpoint-ORIG-GUID: rbx4RUYlNPndCNdTMm_nGMt4s0paXJ-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040110

On 6/4/25 3:41 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 04, 2025 at 03:24:25PM +0200, Konrad Dybcio wrote:
>> On 6/4/25 2:05 PM, Renjiang Han wrote:
>>>
>>> On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
>>>> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
>>>>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>>>>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>>>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>>>>>>> video functionality. The qcs615 platform currently lacks video
>>>>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>>>>>>> to the same video core.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>>>>>> ---
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +            interconnect-names = "video-mem",
>>>>>>>>> +                         "cpu-cfg";
>>>>>>>>> +
>>>>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
>>>>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>>>>>>> OK. Will update it with next version.
>>>>>> How would you update this?
>>>>> Thanks for your comments. I'll update it like this.
>>>>> iommus = <&apps_smmu 0xe60 0x20>;
>>>>>
>>>>> This 0xe40 SID was based on a previous project. However, after rechecking
>>>>> the documentation yesterday and confirming with colleagues, the correct
>>>>> SID value should be 0xe60. I’ve also validated it on local device, it
>>>>> works as expected. The reason 0xe40 seemed to work earlier is due to the
>>>>> mask value being 0x20, which causes the effective SID derived from 0xe40
>>>>> to be the same as 0xe60.
>>>> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
>>>> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
>>>
>>> Hi Dmitry
>>>
>>> Thank you for your comment.
>>>
>>> I’ve followed up on this sid with a colleague from the kernel team,
>>> and based on our discussion, it seems that the sid in this case should
>>> be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
>>> the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
>>>
>>> @Konrad, I’d appreciate any thoughts or suggestions you might have on it.
>>
>> What our docs describe as 'result sid' is literally 'base ~& mask', so if
>> we used that, setting the mask would be useless..
>>
>> Now, some old NHLOS builds are known to cause issues if the values aren't
>> exactly what they expect (some whitelisting must be going on there).
>>
>> I don't think this should be an issue on this platform, but let's just
>> use 0xe60 0x20 here to reflect the real values
> 
> Isn't 0xe40 also 'real'?

0xe60 and 0xe40 (unmasked) are two separate streams

Konrad> 

