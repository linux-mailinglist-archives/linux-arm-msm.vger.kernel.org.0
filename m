Return-Path: <linux-arm-msm+bounces-65939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA10B0C940
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4AF4E7395
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6058F2E0B5F;
	Mon, 21 Jul 2025 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PIGkMBg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65E2E0924
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117995; cv=none; b=cyRF8AQDg3kx1ceyhQusqS4lELESjZBgh7A0Vt75gxUBRoCYLtzK4YpS5mfFL21qc4FaY1mkHrIFHbNUOqlRQ99S2U9G8GOCvISOQPOMBXKr5Pb9qXfRwI4IVl8OjNDUVqSRmoyz4lf1loynNsOzwsC8Qg3ERukxUlCEbtXqrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117995; c=relaxed/simple;
	bh=XfILMrJpqF/tuCduLTWyeK1Shsuk0EcxoJjjw57ON60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iic1RiULj98Xym4amUGNVpb33hHDyvnW+QvEX2NWUYaRT3GaDK4jMSRG6nzTbT40HYGs/RDbZ+rpgmGkol+pj05zND3nKgy42csDlrFalFURHNA67n3DF/hoH7JdPQ+JOxvG173uu2cNdi2Kn0/KB5zT81IoZRU25KCSi3S9+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PIGkMBg+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGxxmY016978
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 17:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZ/4PF6N3vG+rQh7F+qrpcJmMG+VX0PeJtiX8Xsn9C4=; b=PIGkMBg+PDrOua3o
	Bf9XtefUwHEa0dPJX+byF9cMvYGIEgfv1u4T0/BhuqIguPzjt1DNaSqDRYoMGitI
	PZ36BouhUWFSYP/rG1uYmqRJLwJ3k7BtoDMQxDvD+emqNTwBluWh/emAZN+Dpv0Y
	hzyYnZVN1aMn5zSZLGoB/PEK/QKV1DAIcO78kPY0C9iqTI+ni1JTgmmExWet9s5P
	hTgmI/k0f7hKLzUjmJnk8RnhR9umCyK87B+Vka2iOOM1X3xDylUG6vMhuv7sutg1
	iV0dkHPKDyyvLEPm1OCvsqaDDDLEk6R23aZJ5D56lpNj3Qbx7ojqFwMMW2fQL7k6
	AwKAcQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vw5kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 17:13:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-75e28bcec3bso810421b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753117992; x=1753722792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ/4PF6N3vG+rQh7F+qrpcJmMG+VX0PeJtiX8Xsn9C4=;
        b=VEwxzWve60W6huBsyG81OsGQLeBOdOpXUsb0O1W72pvFM0c1Ltz63Ubk5I39Qd+pqx
         nNZmIN1ENSv8DfJL6vPP3TRc2ogIMKwTmKqi5X5keZ6YocJn8pUVtanud6N+l1i4e7Tu
         kf+Kpe5gwzKOphOJLJrVYbcuvbOciZIHZBsS0MzkzdZY/2z15GsHOuJy7csaDLd4NZXv
         4zdYoz2DO+0d2EZW4vRRZgFK1AoEx/dv2uYRh5uXr8piU7q8o06p+jbxrD8M/4ZIXJ+b
         Zyi2oukWQ/GTtl1/iDg+COL26Ew94MgpWQ59sIioJqry8a1lC3kgwflHaemiST1k6jCu
         /Hww==
X-Forwarded-Encrypted: i=1; AJvYcCVdUqzXSp1bPV0Nm+jdCdiz4BP4GRdD2OGw06mQSzHbMbh5o8L2mgvjGVyIyNUa7ZMI8iYE2LHyTK3Wcb7U@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZ2I0NzOENk5rMs4vG69/vYOkfYnCs4Nt66L/4XDLQNJ4uCYj
	EwjLWdg86tx1A6pZ7YbdTpKB1f1XEAYLc36Anevs9XytWe+mvuqH62zpqyS8Ma7jvL7H9RJyNii
	SuLgKWVNTKjch0H1+LECXiEbETXA9vNgL/5FQVTW9Io1zRUAf6okGa7yFt25R2S4zjxgQ
X-Gm-Gg: ASbGncvPOC8YGR91TEq66ynPh6HX3vLNXJ6I+IEnMNQJcl7Ab5hWydNOu8urr+1x0Kn
	BVruoIF05nErvVADM+Aa7/kH3x3H1Mt4Ak6dT1NdB+L1PBnVhR6RPHvnD4HPU/7OA3ShltxFUkn
	rx918Lmed1994781T69rcTbPt0daEEvYgp15ZNEyP5y+ZLATFlJ/4OuCPQc9R4iy9qkKvGKz5Wq
	QuMDOMKRxOLWA4FCwpNKURqJyvIfqbts2HTnMa08foIUA2Ws2de0H2hw9WT2BY4JYH316MB3FaN
	Ivhd71KWpMZCF/YeZP1fDVudhiRyDB05tPxnXQtm8Qr/eeiEBLPbwPXOHc2NNkEkjHrY
X-Received: by 2002:a05:6a20:9392:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-23810d55d86mr34423457637.7.1753117991869;
        Mon, 21 Jul 2025 10:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe2/ShNvywiZ+DxmeZg+ZMZ/GKOcyhXqBS+iKk7LMIrbdvIY81RYqsoTDycOuer7bfi9e1ag==
X-Received: by 2002:a05:6a20:9392:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-23810d55d86mr34423411637.7.1753117991359;
        Mon, 21 Jul 2025 10:13:11 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.29.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe659a5sm5633550a12.4.2025.07.21.10.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 10:13:10 -0700 (PDT)
Message-ID: <5b569e5f-066b-4e12-8a05-d77852ce11f6@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 22:43:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-8-pankaj.patil@oss.qualcomm.com>
 <aHjJG2nrJJZvqxSu@linaro.org>
 <40534488-24f6-4958-b032-d45a177dfd80@kernel.org>
 <2f5b5e6e-5041-453e-b3f7-b10b40bc6f57@oss.qualcomm.com>
 <52ytt5ag5l65hdjjmvjft2l7ofvt4rgdn6r3bytcpjvyqia7ry@uzajn7qjng4a>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <52ytt5ag5l65hdjjmvjft2l7ofvt4rgdn6r3bytcpjvyqia7ry@uzajn7qjng4a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687e7528 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=7nFZtJUvBAfdOgjOLm7NAA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9SSxU1ZdH87hVqYcdAkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 4HjwTXCtkVxCgAmJ3jYe1mQ_9Rh5Ybgj
X-Proofpoint-ORIG-GUID: 4HjwTXCtkVxCgAmJ3jYe1mQ_9Rh5Ybgj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MSBTYWx0ZWRfXwnH/OybcjGeS
 oTAB9MyETI47ySo/z8fFG2g5RygZwBypANA4Wzwd/nlGRoWr5pWVrJ+bcq1d97ycrkUWL0e1ewO
 Zhc3vT8V68XGIAByAEfxPAsqAhWseVxaLskl1S3YaPh7ICAySoNSLD/KsgK+5ceFnx+cJRThvuo
 2L7wUpQz2JEkN4gO8ShF3O+n4gVo832rpjmk0yq8Xrapk/yK/TbpR0+8Smphe2N8IYQhCfMk9fe
 nLs7PjBOSnAyER0FfiCuydxB4f+DPdOB9WL5N5BHdtOHPGPoobQRBHWsA6pKVPQmY1CLUrCPX05
 A6PdTKwLpMDTGJvfMRGTRTEhLGr1hfJf+zhPPZqo4f82ni8JjteiDzwjF2GUxj7aFL1vRl1krNO
 e55AnfzNCyDmJ62h2uCoCj5/lA6Tjyif+lY4UQjKkLJkkIQvqfvLJISUUBV1HKqexoRv3dbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210151



On 7/20/2025 9:30 AM, Bjorn Andersson wrote:
> On Fri, Jul 18, 2025 at 11:07:23PM +0530, Taniya Das wrote:
>>
>>
>> On 7/17/2025 3:38 PM, Krzysztof Kozlowski wrote:
>>> On 17/07/2025 11:57, Abel Vesa wrote:
>>>> On 25-07-16 20:50:17, Pankaj Patil wrote:
>>>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>>
>>>>> Add support for Global clock controller for Glymur platform.
>>>>>
>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/clk/qcom/Kconfig      |   10 +
>>>>>  drivers/clk/qcom/Makefile     |    1 +
>>>>>  drivers/clk/qcom/gcc-glymur.c | 8623 +++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 8634 insertions(+)
>>>>>  create mode 100644 drivers/clk/qcom/gcc-glymur.c
>>>>>
>>>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>>>> index 051301007aa6..1d9e8c6aeaed 100644
>>>>> --- a/drivers/clk/qcom/Kconfig
>>>>> +++ b/drivers/clk/qcom/Kconfig
>>>>> @@ -645,6 +645,16 @@ config SAR_GPUCC_2130P
>>>>>  	  Say Y if you want to support graphics controller devices and
>>>>>  	  functionality such as 3D graphics.
>>>>>  
>>>>> +config SC_GCC_GLYMUR
>>>>
>>>> Wait, are we going back to this now?
>>>>
>>>> X Elite had CLK_X1E80100_GCC, so maybe this should be CLK_GLYMUR_GCC
>>>> then.
>>>
>>>
>>> Yeah, the SC is meaningless here, unless you call it CLK_SC8480XP_GCC,
>>> so the authors need to decide on one naming. Not mixtures..
>>>
>>>
>> Glymur follows the "SC" naming convention, and historically we've
>> adhered to the format: "SC/SM/SDX/SA_<Clock Controller>_<Target Name or
>> Chipset>". This structure has helped maintain consistency and clarity
>> across platforms.
>>
> 
> The platform isn't named SCGLYMUR - which is where the SC prefix would
> come from.
> 
> I'm not sure there's a benefit to quickly be able to know if a clock
> controller is for a SC, SM, SA, MSM, etc platform. Please let me know if
> I'm missing something.
> 

Bjorn it was more of an alignment for "Compute", "Mobile" and so on and
such was the definition to be used for the clock controllers as well.

>> The case of X1E80100 appears to be an exception—likely influenced by its
>> unique naming convention at the time.
>>
>> That said, I’d prefer to stay aligned with the established convention
>> used for earlier chipsets to preserve continuity. I’d appreciate hearing
>> your thoughts on this as well.
>>
> 
> We're changing the naming model completely, so there is no continuity.
> In fact the Hamoa "exception" would suite us very well for Glymur.
> 
> And look how nicely the CLK_X1E80100_* entries are grouped together in
> the Kconfig.
> 
> Change to CLK_GLYMUR_* please.
> 

Sure, will align, but hope we are all good with the clock driver name
<cc>-<target>.c.

-- 
Thanks,
Taniya Das


