Return-Path: <linux-arm-msm+bounces-62061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF353AE3F90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B450189AA0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD11C248F45;
	Mon, 23 Jun 2025 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KE4S5EZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E0247281
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680548; cv=none; b=GUsLmH44tkglC9wl2PoOcqJTQOrMW4RK0XnPjs7TQmJTu0ptr6FTchz2fGmyKIT3LC3WADiTDmUQWe6K2ptk+tv+tYavK0AYlvjXv11W3rZVCUw0stXtoQNSYVgERA3Lj9S0SXYY6NRmCAjKDZqWM2OX6SdyTu55zKMYdUu3rpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680548; c=relaxed/simple;
	bh=qKSIqsV+KvAGtkioviVhsHDdAWmTF+w9b1unNcPVVFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nX2VJ+0OmhQeJyLbXeRI+e3fMuAsfASQ7nOXuOn9YcEjdBt3c+HVD29EjBwTPNlm/x0/0f5CC6NrO5kA6FcvHiTctxD9utqvZeYsU9xtyBgFsR/1kxCU3+Wn6946vcPrKwtLBhbt2HyiKZ2qSn814xrmSKjwIFOVOftMoXMO/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KE4S5EZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8Lfd3005909
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUA4Ux34VVf9K7rAvlG3QrP3wRtZ4mYRuLZS2Rcg8zw=; b=KE4S5EZA8lx6Tzg4
	Jhpkb/rkGWCT4L4d9fBzMn9RWg0iaweCu/RZMMqP2CKaquT6bK/8RCcaHg84x69G
	W716sPfUlGUDlbEsX+ChVznKYR1rLvFKInkJ8g+ioPWoMRC68lCg0jQIsMuAT4iG
	/iZKas6ImwNmnfyt8e6+eHFvNtpbF3Gb2pRlaHvWhtXlPKEywfEoZFb0SDbvxUEU
	bbo1klTTz7dmhNI47MMOeRK0yQzaSyIjCdt3BdrpjBzxQaTKAYKwp+LLHsZ85s4T
	vFCSXsGXl3la4xjis/FbnlWxIdRhl/V4mryoYQbqdIpC8ZpgkHcf6GwCofn8UQoW
	mA9Lnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8m4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:09:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb53b1e007so7817506d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680545; x=1751285345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUA4Ux34VVf9K7rAvlG3QrP3wRtZ4mYRuLZS2Rcg8zw=;
        b=NE824oivnfBzKCi4b8dK49P6kyK7xITeFXvFTyx4ERc1asM7sFP3XWgO7pCS+hk1+E
         5BBRdUk2cQcBo+6bQi7W6L2y9cF18q1DIpirebw9wmZHMAHPxmcPGngOJuxVImTGF3Xl
         EKJWnH9tYLuEMRwc/vFcClJiOcBWfhk8Mpr5Wviulu/HqxxSKiXUWV0j+fq5yxj4E5cX
         wSXzfB8FLpCcJ0tSZ5Pqer1ykMnBG0Afm4wwqReVZV9AmL2QuwHezcO9YdjobtvX5hc+
         su9PxdwvpN8dMZeBfM/nVQIiGX8BIwKNn97hHM1dCEn7kU2eqI97WHduPqHuOiTOEDS4
         K/IA==
X-Forwarded-Encrypted: i=1; AJvYcCXbZlxRCA0IyBvSo7jzGRtcnKCJMPMGjvJ31Lfhc0SQXyD5CzeZvApHmc/CK07Z07eZvrqKxkv4ljWTiqxc@vger.kernel.org
X-Gm-Message-State: AOJu0YwfDNZ2XrMQPcOByFrUZg/0j/Rdl2SViJ5b100xKDs4Fu6W0NhG
	y+/4QRwamfV+Bd73OTBW4aquWqhq+YQaJuLuOqh8yKxUm/P6E2ArH7/qenKlcpetzGmbgCtIzVd
	PdiwCznt3qUdS5jsQqCGh4r0U4IKBJlu3ZXNLZILOvp6iE2EyB/GBVf0SXlibGGcrnirl
X-Gm-Gg: ASbGnct4XOZd5qEB4QKE1kJwWWRPN+p47zKIJdcw9F5Ax6s81PcEGo9J8+2qQ5EPp2r
	BRoKZVORFjRs0XMreNgst9rhzxJxZLuf5kF82oSU4W/lVE7ND+D7wnE3mIreveGoWo0+j5mSDMT
	TpYj2XSby+pmkV9DgECO/ASFCAMPLjg/5N5aACjxoK/Wz4Iwalz6t98qacHdzBOzBHfpTZxiGrL
	UUQqnsnNTMfFpkrtxno9Zn+U4wfUN7WPDZFi9J6P56DKkNG8dtrv9df3Y7R5MmE4gH3Glj5I2dW
	qwGjsKK2qqvhZBRNV4A93zXyPyBLLSAH0zToyuKi1l6bPAEe7UBPt6vvw+Ps6Im0DT+CaBm9NUN
	FXwM=
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr72341281cf.13.1750680544729;
        Mon, 23 Jun 2025 05:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoNMINZTAhhl7CMp5Boaokx/8RjnVYVBHAJiF7SNTYL5MUao5HTMPsguWO70eQQTBb5Hr2qg==
X-Received: by 2002:a05:622a:9:b0:4a6:fb4d:b4e with SMTP id d75a77b69052e-4a77a27a4bcmr72340941cf.13.1750680544191;
        Mon, 23 Jun 2025 05:09:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1857c124sm5866353a12.36.2025.06.23.05.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:09:03 -0700 (PDT)
Message-ID: <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:08:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xPQHLxNLSXQsNUSy3YMjq7O5gUJFvesV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3MyBTYWx0ZWRfX2bqB0jFW4ERR
 t8T6zpeD6mJpEEMs+06IiFg6cXFdK5uKmFAOqz1ZZfar6iNE25IpMr1XXTHA82Eq4k0Cei7NyaS
 ho/R6OTKKMuB9sX1o7PUw4woq52tLEL4bOiSi73sZZGqFtxCUyddnogMfSqxmlp9DrkhidG2tG+
 Kr/Ued+JapNakvR1Axn6xTbvFp1ij1tz5U9Z11l7SSQiGfLK+AGc9o6adlRVJXIKVFbqOSpo55z
 yJ7RHqo9WNaG1G1QEt6sT0koUGtNUkWhzMAxtgIbrMlDcHAiRGVt7+Kkjqdc4GtdPhSvAXIBFwr
 4wRkihI+DhaigtLirfxad49gGZtpVA+5M2JD6qBOLKeYZdG127pjD1HYKJJMFLvlOBLKx81sODz
 LdvNK3pv0h5/6MhwsS3NhDmjyIdTOaavuYDybbcMPNMS160YbUO6v58mXOuken8NINB5+xqB
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685943e1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yCTWpnfuZRHAWxVBKy4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xPQHLxNLSXQsNUSy3YMjq7O5gUJFvesV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230073

On 6/22/25 11:48 AM, Krzysztof Kozlowski wrote:
> On 21/06/2025 12:20, Konrad Dybcio wrote:
>> On 6/18/25 9:43 AM, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 09:28, Sarthak Garg wrote:
>>>> Introduce a new optional device tree property `max-sd-hs-frequency` to
>>>> limit the maximum frequency (in Hz) used for SD cards operating in
>>>> High-Speed (HS) mode.
>>>>
>>>> This property is useful for platforms with vendor-specific hardware
>>>> constraints, such as the presence of a level shifter that cannot
>>>> reliably support the default 50 MHz HS frequency. It allows the host
>>>> driver to cap the HS mode frequency accordingly.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>  .../devicetree/bindings/mmc/mmc-controller-common.yaml | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> index 9a7235439759..1976f5f8c401 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>>>> @@ -93,6 +93,16 @@ properties:
>>>>      minimum: 400000
>>>>      maximum: 384000000
>>>>  
>>>> +  max-sd-hs-frequency:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: |
>>>> +      Maximum frequency (in Hz) to be used for SD cards operating in
>>>> +      High-Speed (HS) mode. This is useful for platforms with vendor-specific
>>>> +      limitations, such as the presence of a level shifter that cannot support
>>>> +      the default 50 MHz HS frequency or other.
>>>> +    minimum: 400000
>>>> +    maximum: 50000000
>>>
>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>> deducible, which I already said at v1.
>>
>> I don't understand why you're rejecting a common solution to a problem
>> that surely exists outside this one specific chip from one specific
>> vendor, which may be caused by a multitude of design choices, including
>> erratic board (not SoC) electrical design
> 
> No one brought any arguments so far that common solution is needed. The
> only argument provided - sm8550 - is showing this is soc design.
> 
> I don't reject common solution. I provided review at v1 to which no one
> responded, no one argued, no one provided other arguments.

Okay, so the specific problem that causes this observable limitation
exists on SM8550 and at least one more platform which is not upstream
today. It can be caused by various electrical issues, in our specific
case by something internal to the SoC (but external factors may apply
too)

Looking at the docs, a number of platforms have various limitations
with regards to frequency at specific speed-modes, some of which seem
to be handled implicitly by rounding in the clock framework's
round/set_rate().

I can very easily imagine there are either boards or platforms in the
wild, where the speed must be limited for various reasons, maybe some
of them currently don't advertise it (like sm8550 on next/master) to
hide that

Konrad

