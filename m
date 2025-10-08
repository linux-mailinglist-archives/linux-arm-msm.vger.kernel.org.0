Return-Path: <linux-arm-msm+bounces-76337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CEEBC3EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6A144E5FF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC022F3623;
	Wed,  8 Oct 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2UcBihO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EC4A33
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759913346; cv=none; b=a+UnblOBVrSuZN9ZZJmRsLzDycvxVN5uvcoZol5dEpErppvU4xN8/YbOxzwU92JDvW0oQOZ0jsmmr2Dtx8hkdq3gSX0ThWA16YTwOAlOe5udDlu+IoWKlKR5/dWuqSdUrMCYESwUd0He94yg569ujm9DHSGkMssBO7n1+R8VoI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759913346; c=relaxed/simple;
	bh=7BfBSZDHZvPKSGJGNS64jbWWiaNwxlYfIpEdJGGrQ1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ktl/0uWbNWt0dETbgT8qoUCI8aIxtrrpx3u94y0S8UMWoGzK8XlmbbwDbHB1xGuPuagUX2+c7tm49TbMwC+NOuen2lRoZtB7W66MFYGBXk9sjmkPVzooIkyOQEnEiwLkxPUh1jBqP9FT/FEHEQwH0IOi6clAqrpe5DOEowG75Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2UcBihO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aWZp003359
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8wKJs7k8BdJDa4iq/XFnFxcY6LibnKFgudA7DP6ZS0=; b=k2UcBihO4PqnesT3
	sSz1/2a3iHudoAPCGKDARqi9bfhATtseXK0z2QUEiMqOdkDKEHm3xtR8Fpb4VgHp
	KHGYJNHejTCAkPLgzVinwzaZLeY7VdST4aflq6iJimvJCzHZRvndwoViGGaSMB6k
	qUEvQ8s2IB4J8QPX1CTe+cQHKUa/CxqbJpJvijFmWuaRL9u2j02YjNfj7mUBIOIX
	HWF/x7NudT25g75tp4RU7+/oHfJXq2tlWrIm37Oy+Qp1HqW1AfWdXlD6E/RaY9zU
	BBqlypWjLALsagUyeRTwoqpx9UqaaqPjTgrGynsZ6M3byrZCD8qMJdY+/tg9iaqT
	+gp+uA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy71u6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:48:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d8c35f814eso16247341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913337; x=1760518137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8wKJs7k8BdJDa4iq/XFnFxcY6LibnKFgudA7DP6ZS0=;
        b=nPknMrGfB3ZpJwT5T0UYfIZzAs6k1aTAPtdYU5fx68Gi3TkiNvFV/xQYBUpPOD2SHm
         OrVqFMtqiDW8BmfGZEhL6U94TuzWqNhmsc199LT1XYd6v+WpCwrk4D+hLB8jIM+Hinvy
         Q0L8TJjOgSjOBL9I78/YPqfCA/Lp0It9vZEUnZUjcgxb75Ql+WAE64UsMzXoffrBGAi0
         6A8hQstrY9LfVC1N9YFo4yRXe7/m7adEbnAwzNen9BCU4Z8eb4u6CSmUws+2Ctt4ojzj
         GmNMvxlhIysL99oZ9x/HB8lbyY7IixpE2/Q4+QLafe9URU5cQOGNbj0N28SN+7WRCEm/
         arXw==
X-Forwarded-Encrypted: i=1; AJvYcCWBd7hkDp6KM0E+seMEpAcvW+OoynojzYJQM/eS+rqxD/pUweMXggGGIkia4ZGQV3HR2JlruX081H+bO5zZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdDJlMelxLYImG7keM0GibmKruKP/fbxwXYY3FcGpn7RksoF9
	GQK0pvVPAXeZd58VRFTG+oBd2Qdd+3bx5VGKnI77nUcFLpGwLI9EAHrNEi99kssaa/2qEskbIqe
	gFTm/QqsRpV1lhP0OgAGq6lpx4rRtaFF1tGYE3GOYUyGwaunYWcllRZVsFFi3waf7bRE6SFm+of
	3X
X-Gm-Gg: ASbGncsoove8In7hxzdmBh43e/6mw//fIb3CLN1A7gMpgrTscjBEQG8dLUrtblxmDxV
	/bhL8OhnecpHq2xIMdQSEPjBcIOhxjwmTb3EXomDGWjFWEQn1DXK5PZpjtenewBj2PTNAh+66SO
	YLhjHPK0KZ6ODd/L/D1v7mFTHTBgt664Al9pJiy+fQtjW7s/3yuJvMhpzdyM87s/7Q/jtedWNI6
	uBBe4QamwwG3FXF+7D9yvLEw8qfR/SaMOHsttLjkHsvcoYjk4+I0Ok+Ocegy7tPMISnmA1wPtV5
	bvH4ocgD/7jdXi5iV/diNb43eZVHxxaJ3i5C69ZFkEFp96f663xQbq/d89GfjRvZS8c+u9X+v5H
	h/lNhSm91eNCp0LvRdUCAjZMVWOI=
X-Received: by 2002:ac8:7d01:0:b0:4d7:f9bc:2057 with SMTP id d75a77b69052e-4e6eabf42dfmr24908581cf.0.1759913336783;
        Wed, 08 Oct 2025 01:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsCSe7n0ysQoCqxTpSE7/nf5Ci/mBlv5y0BJyPNF55pdASGC5ln6HklotZH+fpGWKqoE/HYw==
X-Received: by 2002:ac8:7d01:0:b0:4d7:f9bc:2057 with SMTP id d75a77b69052e-4e6eabf42dfmr24908391cf.0.1759913336234;
        Wed, 08 Oct 2025 01:48:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110de2sm14260231a12.35.2025.10.08.01.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:48:55 -0700 (PDT)
Message-ID: <39d07bf1-cead-449f-85c8-4651e5296cd8@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:48:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: r0q: enable hardware clocks
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-5-ghatto404@gmail.com>
 <d16e8c07-6c10-4c91-9bbe-a260f0497d29@oss.qualcomm.com>
 <99D0B281-03A5-447E-A6BF-892C99829D0B@gmail.com>
 <c21a408b-ec4f-4de8-a9b6-ca25410ace6a@oss.qualcomm.com>
 <CC2BFAA0-7E61-4D91-B369-88EC9AD4A315@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CC2BFAA0-7E61-4D91-B369-88EC9AD4A315@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e62579 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=wKFhJIuLoAScDjwq2nEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tWWKbRSk-hOZ10NW8M6Mz6EFIp3vQk7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX7yFKVsxhwfgB
 0q+1D1ENJyqdKk8EzIIMhQwJDfaCdTVT7dKhykMEUSYoj5cCayDFEQWOtNw1v2MchnmVqeC5JvT
 17qh1bCmGHTk8BFh+IibdmVmM610OwJcPkCW+r6+QuWJJeh1uVKSC0HaWAszP5JHu7LQhKExHgr
 AFI5Gxd7t3ZJdLJmqJAbw19H4+Ktkvu+04pSEoh1zxzNrxGPKxPYwx6vIiYJbEt8EybCVp+unOW
 WCQM4QdR2nnu/bhvumxo1Z0ReH/c/f1sAfcy0s7lnPBzoL1QybO4ZSFgpMt4a5YWd58ERapnZ2T
 u09YNPzI1cf6CBG0M5/4kwjtNztsy/0PygeGN6DHe3t0K6XG++g0diW3N59WaT0CY3b4Rg4jRes
 8uY3WqHKS8NqBTNJemlOgBmDqu2MnA==
X-Proofpoint-ORIG-GUID: tWWKbRSk-hOZ10NW8M6Mz6EFIp3vQk7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

On 10/6/25 5:49 PM, Eric Gonçalves wrote:
> 
> 
> On October 6, 2025 9:31:42 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 10/5/25 5:50 AM, Eric Gonçalves wrote:
>>>
>>>
>>> On September 25, 2025 10:09:48 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 9/20/25 3:46 AM, Eric Gonçalves wrote:
>>>>> Enable the real-time clocks found in R0Q board.
>>>>>
>>>>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts | 15 +++++++++++++++
>>>>>  1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>>>> index c1b0b21c0ec5..c088f1acf6ea 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
>>>>> @@ -225,6 +225,21 @@ vol_up_n: vol-up-n-state {
>>>>>  	};
>>>>>  };
>>>>>  
>>>>> +&pmk8350_rtc {
>>>>> +	nvmem-cells = <&rtc_offset>;
>>>>> +	nvmem-cell-names = "offset";
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&pmk8350_sdam_2 {
>>>>> +	status = "okay";
>>>>> +
>>>>> +	rtc_offset: rtc-offset@bc {
>>>>
>>>> Is this an offset you took from somewhere downstream?
>>>>
>>>> Generally you *really don't want to* poke at random SDAM cells,
>>>> as they contain a lot of important settings (incl. battery/charging)
>>> From another sm8450 device, I'm sure it's okay.
>>
>> That as an argument alone doesn't sound convincing to me, since vendors
>> also sometimes repurpose unused-by-Qualcomm SDAM cells
>>
>> I actually found a data source internally and this cell you're trying
>> to use is reserved for PBS (see drivers/soc/qcom/qcom-pbs.c), meaning
>> you already fell into this trap..
> Interesting, in this case then why does rtc still work? And
> how can I find the real cell? It's not in downstream DT.

Well if nothing accesses that cell between your last write and your first
read, it will of course work, because SDAM is just a means of storage

As for downstream/Android, it does not use SDAM at all

Konrad

