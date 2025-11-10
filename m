Return-Path: <linux-arm-msm+bounces-80984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2AC46237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724B53BB9B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5302E63C;
	Mon, 10 Nov 2025 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFdIXr6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JS1RWVJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C523016EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772898; cv=none; b=krZ4/G1kkw5xovzG8TLwi9HlfA6O34f/6ZDupgqII9UARjsh7P+R1+tm67JK/kH/uVOACtoQNRfiXxd8BxL0W82NZpVA7vkdRTiTQuWJid3rL7Ey0vtfFLChYsb3YVePmlKBRWO4A2pH0FlvPAv1wHBXvxM55AenzFTrAVtdeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772898; c=relaxed/simple;
	bh=iG0pOqLXhCj91QIEhbeJ2Y8XYoSQwesjv+51amYq6Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3H1hbKPyu/5MYrIoEUkWFyj22y4pZYU+NmT/O4t38EHRQmOcCL3aHBFUZT1lHlYO2QPeHT3zwlKVSA1Owd6sSt3khHXYDue507WN2uNGsC2XYzn1AAgd7QxrLnNryq+V/+o84AJjUcjZo7NJa2H63lBrwJfA560MYLKraV898Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFdIXr6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JS1RWVJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8qjcF1902848
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/PkyWpMb/cINNObNzm5jGZ1qHngyNuMAQKXyGQ+YzY=; b=SFdIXr6Za9mHghZ5
	Akkm6wVAGhMdrT0NyjuH4FDqj2VWToJTCsXqi71uvSFwPSOfwgg7jN6JQfxQBJWE
	/LpMl9ewRPxmcTqrV4YbWp0+UmuMA8ZLdtwHbCaPzV1ik3wbMNjpuWsGBv/2rnoT
	ZvlQr3CSxCgBhFd1OBTCXpiFq9aO56QVlX9E0Dcyzr0etVYQDpXcpIiUSQ/BF/mX
	W4KJ5rAl15vXBWLnhHShobKp9qEMaQqXzSBK2f9AiEuQbxPk6GY9vFEQfxSAck90
	bLM9nMPFsjRcaNaHxKHocNUM/8usgMACtUfjqi7LaXo6OnX9+nSt8/ApWCXW/AZ2
	zFcKrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0jb46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:08:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso7918331cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762772895; x=1763377695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/PkyWpMb/cINNObNzm5jGZ1qHngyNuMAQKXyGQ+YzY=;
        b=JS1RWVJEoTlQUUhAnk18h2CYx/P/5SaVR1JD5dLXBW4tNGBHIx3MBPIdXodM6TvXfX
         tcDxQcErHMxaXiBwqQRUKnZKSW/ENRNhSZaBPUmmy5RC+DnnEPRVlWGuoLS9n8H8C1w8
         Qi/SJYNe3tCabq8HOhnQ+uPKjrKQzVTyKUjbvHubHYuz06otsMIUu5gAY7/3y4BsoNdZ
         LWu/MrId44Yu2I3kXoHqtWlt24vE4l4t3BWfwXqupfY776GQ0xM0FYQ2eHt5/QVf6mtl
         7TeWybfl4AyL2c3e9LJ2Svta2gx0Ihfns8i8JW7ImFt3eeWiiKD9nxQ+hhDYvoxM6Q4h
         WeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772895; x=1763377695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/PkyWpMb/cINNObNzm5jGZ1qHngyNuMAQKXyGQ+YzY=;
        b=qKvuH469FRZktnKNOAXsf4yzH+gd9qeucaYFGQh+5xATv+3yb16B7pBty9OolCMW8X
         XO5WF5m4qsJJ0XXTJqpZa44kSZa0/fvfCt32ky6B5eyOn9kBb5+TWkYPZSa2IonfdCAj
         JSeJ6g5yujHpEQ4rBJMVn4hQUPHO8Rk6FH/3dnlnc5bB4SDrIMnToUtNq6brfFBuHJtW
         AyQbDD3vKu2kLKd+UL7doXELYEWXigij2nO3DmXzUa9uv4rCkL00f65zep3Xf2Bfd1+E
         BbyN8qQUF9a3Ak3QSGun/35ZpLuPHavBuRdblc93OYiUG0ePkHC79T9cGdrz3IkMMMeF
         IDCA==
X-Gm-Message-State: AOJu0YzTJ57p9gt+YuP2LTU7ojLRbm5VRQEqwCo2BeluXfmo490IwLhU
	AA6KAz+lshFiHLQLmW25GbiwgUo2t2BFH12yVifHKa1s96DcWO4DKwRUqgJGkM0Da4eQpyEFVYS
	eIpZMz6Oz8+DbsqQQLS32uczZ2shWCFi4Ebg+q4dfI84OdV//1yamHglEntA0pFUdxVih
X-Gm-Gg: ASbGnctcWjXMpX0e5Z+AqMxzuTukMyPjrWLhQXiF67P3GSR68XZBWTZ80J9kNUodTSM
	hqvS+KTXxjCj+q5+vocWllV+uCLFuA//3Rnae+IYiUk0o5ymIx6/zGL375ZGjW1gK9iN54t6XN5
	keQ5qA92678pkSAWohg/1INfFn6LZRRauAo8XSHmaadOobPA+G01KkPvdGLGvXVUg6B/S1KTugG
	/ZR1PZd4NuTgzgxAsCAJSJDZzf3xrNeV1OucDlnrFzWKX/vKcc4rrINDIdC6YDoS5yFojYhgJ0b
	YgA9nyES2FnSm7/JaKOHUKbChCvUPwk69kJzyuCTVoRt0UAQEwwaG31qhLAHqN8abE10LKr3Jjr
	TnDTy9wJbJpjcTBMUhKfR0Yr5QVAvxzeXsQZAn6K1afdamtPYORocVQ+Q
X-Received: by 2002:ac8:5dcc:0:b0:4ed:b2b1:18c1 with SMTP id d75a77b69052e-4edb2b13168mr34851931cf.6.1762772895652;
        Mon, 10 Nov 2025 03:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGApcQKy/u0KSP6Hvg8vtaRZ6wJn3tOg8UCW9LsuS+tewvaEF/qvX8YyUHnBwzpaULQN4+kIw==
X-Received: by 2002:ac8:5dcc:0:b0:4ed:b2b1:18c1 with SMTP id d75a77b69052e-4edb2b13168mr34851541cf.6.1762772895110;
        Mon, 10 Nov 2025 03:08:15 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d0f3sm1113416166b.48.2025.11.10.03.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:08:14 -0800 (PST)
Message-ID: <77898b11-e039-4c62-b651-219c971a3be0@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20251110085013.802976-1-sarthak.garg@oss.qualcomm.com>
 <20251110085013.802976-2-sarthak.garg@oss.qualcomm.com>
 <35e8ef89-3fbc-48ac-9b2b-10c2e95ab024@kernel.org>
 <268122d1-d629-4d8c-b88c-2999c77a1a18@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <268122d1-d629-4d8c-b88c-2999c77a1a18@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 45gHlU34BLKfmIdo16mPp6IkcSmmYvsI
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6911c7a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VJ69uJtSnoo3sbBQX8kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 45gHlU34BLKfmIdo16mPp6IkcSmmYvsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5NyBTYWx0ZWRfX44GH5SMwReOa
 WhFDZWhfmSi5pLlre0Q5+6+YFqL4oXnBHtvxtwep2v5glVe6Kn96DMDUUBc0ZYBGhhpo7+kiQXu
 xkOAGUMV9LUCm0GG8yFVqfVeqzR0F6NNwW+4FBFCfHktH5Fh2e6W+gwK8FwaHpcGsjvvlOcgHTk
 m2TUZxaawhh2E/49fbM5HCxt8enT5yCglv4ezglnQg9b1WFMdCA9d5MKXFPwlu8yBX97m/1gauM
 xdO7dl4rup+FmoEnBRMPp6FznNHUO9kMn+dte67Anr78l/+QqnxV0Rg5qQQwiEJifHxgYjbp6TG
 790DfMpDAyB1pksJ9zfFOBjwlS3W+oSlZ1t5ILCHiqeFIWv4chrUK7gk8A0eC56kvaAdgC73nQV
 aKv+EWnt6fe2/5dJ9dZnKLQMcHm8iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100097

On 11/10/25 10:25 AM, Sarthak Garg wrote:
> 
> On 11/10/2025 2:43 PM, Krzysztof Kozlowski wrote:
>> On 10/11/2025 09:50, Sarthak Garg wrote:
>>> Add SD Card host controller for sm8750 soc.
>>>
>>> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 54 ++++++++++++++++++++++++++++
>>>   1 file changed, 54 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> index a82d9867c7cb..95b210fbfead 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>>> @@ -3482,6 +3482,60 @@ pcie0_phy: phy@1c06000 {
>>>               status = "disabled";
>>>           };
>>>   +        sdhc_2: mmc@8804000 {
>> Nothing improved.
>>
>> Best regards,
>> Krzysztof
> 
> 
> I moved the sdhc_2 node to follow alphanumeric ordering and used hex in reg.
> What extra is needed ?

Nodes with a unit address (numbers after @) are supposed to be sorted
by that register, just like any other register map

Konrad

