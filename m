Return-Path: <linux-arm-msm+bounces-85370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81236CC35EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F93B30287B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08F63A1E67;
	Tue, 16 Dec 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6eAv7Ph";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkkcuZUr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D1346AF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765893381; cv=none; b=f7M1SjTTNhTOBOvKvtHY/KlZ631NCWm68fzPROerqViH5TSDnZnxtc0nsahsL6vV7xwv1h/9QbPb5DtHCjk8AIG0U5ibm68sZqP/tB+SCZC21N7VnEQ7RGOH1yeIt3am+ZahynvoatwX3OaCmp6htGvY8stOu6CH+Bmm33T++bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765893381; c=relaxed/simple;
	bh=8FjMM2DD5knHDvTobbcP/zz0Bm12uALhLS7xCXUSXdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUz7fpTyqW2iQ66U6EAKqDZ96qeqUjt2rGfp3Hun2Dcj+2HDEl/zlCS1vYy3kLc9VS6Qzx/5FTLnk2ThkSYTK427MudytM0gND/IWn0axC38X27FEoQTyiYVBLLbuCrjkvPNuk1yF4blK/QqMkJrU2OiGZneq22zfU/o+ab4Tfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6eAv7Ph; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkkcuZUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGCiVlQ2869704
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=; b=Q6eAv7Ph+ff5uKYX
	aeCHya+aAFzzUA5bTCYx0/vsLjoTlUokkiQEHjl5/5ebeks95CF3+Kd3wSPqSKbQ
	3bfNvGZFYJkgdRheGV5AKTNtSSBkq+Rj1VmLqz9s8qASVpJlwNNkCXGIMbZ7wD3e
	EumpHBR2J+bJvE/4s+OJWZQQiD0mpW022ga2C+RBXq1qyI1kN+zKDSRVEGYunEyz
	rvpLMUbSK3xds7gLRoM463uYK/hoR/OmzSdVxLtU3K/afMOsEfWjmr2vm9f4byks
	jALM2/JAOryNaxb9OGJ4MRN5K+NYOhU7vtUJg5hEXT5BHrSWO5wKN18A++Inutls
	2VA7yA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33kw9dpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 13:56:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b25c5dc2c3so84375285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765893379; x=1766498179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=;
        b=CkkcuZUr/LHv/MQz/TDfgrI7FMDsxEWyYwrz3ly7J5u7TepNcJewGNWGqBEiLH3mmU
         wRQchqgcyQs6KH9C2NH021fZDlgD3EY/AyKlw6oVCugrOfTFJr1Aah6CIdSFOZut3/Cp
         rbFYgjkaT0igV5Wuc2rHRCDAaRKu66UzLEYf48Pt4BEPscCQ2PS+kv+iWMmYo79wk/bd
         ltd+x7RbUGe3gCQjUGsZLCiqv7HeQh0bp92hTYgQ1KufJ2NQ9YHPw4SI/TIhX/qdmUqy
         usBBjtOsIFbELV3QD0kY0DJXlcBizWauEpK+qKJtpN8Kmm44MhjYsuSTzbHAjnyENuqu
         09Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765893379; x=1766498179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbhsZ0OGYPgaad9zJuJhqIqA++MwVqQPiy0O3X5duD4=;
        b=HgqPZNZ7ALseXQMVHGbHpSqvSI9Otf2aezNSXfIO6DN5tzzVHJJtIWp3AnYQ8IV29K
         7xXwcV1/00QRKhsMXoxuaFsj18/fJTFtBuL2s+pEFlH2mE5ttwr/jDGQQVMBucIe1dKq
         mv8LBV0uF/72+IsIjiOfuppIFN+iwfplKBJS+KRf04V86uBQp4faW/p5H61x1eawsizH
         h89ZomplQw2x/psQvkOJT8JRxY9bNk6jUOhs/WamhcZ+uGfz8WsPNSTfeBx3qSw79n3M
         RANsrui+6wivalThQIp5aFCBAva8+0JDQ8G3sxMA9USPDPyuQkzxsr52CXy0DR9aCPZA
         LjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5kgiD2MfVXCkWZXtAvMR3jmnalT4rJdYYu02FS3jDswqyd2cGQ3SQPUPbHqX5UoyvMUu0HoEyHIY7ZAc/@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCBHnyah7N21Exhac/+n08EqOHikZtndSd52YwrDKAeLDzW96
	YQ392WpA/z+SuKqJYKIFB4YeqgJ6oqVXNnWlAu1l5ReUgtYoF2QByrMNWBgEE4nFiz0AgGshLA4
	DUrF4n+S85HkK94PugU+OB8k+g8JU/YZAhIlCz9ETOUT+Ox9gRhglQwnsFU3jepQbxvno
X-Gm-Gg: AY/fxX7fqci4L/2EptDWBt9CFyoOLNTg0nAHi7L+wffkbFYczXyk9jEIVJ1O4GCGiwP
	nMKQnTfHLC80aQAd/93975rPoND+36rM4BVhrtU7dVONn3BsfTw8KPpsoSMx5OQaR0YMwaIX0Zr
	yNrFd7/Tqo/uBurR2VUaaPbenn96pjmNwR9/1fhtc9BwDY12Y87z+NN5kswyiKtTt6husJOXBLH
	4ldDsNAnIh4TPZ65DwP7Sl6wVvD52XdyuvdKfCcAdpgW7LCizApDto3nxwkRpnkg9rgipPSCLyb
	K0MIlhqsUcQjo3WqFPE9/WOwfQu7j3EMokdz7X1G3uJnnmmaI98vbTb65TQPAxCtqGmK36P32im
	GmE1WnYCGTw3GuB38ygqN0js+gE6CbmiKxqfs5YP+Kwz4i8cOIRS2lQn0yFzBPcqI+A==
X-Received: by 2002:ae9:ec15:0:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8be7dd7f178mr28298985a.7.1765893378370;
        Tue, 16 Dec 2025 05:56:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGePisB4XYZbY+ZncYC+wZkSePP6j5Z8Hy2GQUKQW+33GwQePycCDqs3B2BjhcozU4/kzxU7g==
X-Received: by 2002:ae9:ec15:0:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8be7dd7f178mr28294985a.7.1765893377546;
        Tue, 16 Dec 2025 05:56:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffde57adfsm103712866b.1.2025.12.16.05.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 05:56:16 -0800 (PST)
Message-ID: <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 14:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TLpIilla c=1 sm=1 tr=0 ts=69416503 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=_D9cum97ibiHH1HWyuYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: lXH2WnQtvJCn95LvoPB9zbzF3lqN7D0R
X-Proofpoint-ORIG-GUID: lXH2WnQtvJCn95LvoPB9zbzF3lqN7D0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDExOSBTYWx0ZWRfX3JXqrM/4bWuv
 Z2yeBz9wuuh1Dv7q1Z1Ranos08oVCat41hdiDboPCf4ozXNPReQgEAIRNYm6q5U1lltrMLcSnuZ
 slp0TUeLSXzlUbGEIofAP5hIA9gVYLkDmELyeP0tU3iukaUB1gQelHUcpAxTqJ3NZnhxzK09RBQ
 PgW98HNQ8fPAVoq1YRtE8reV2ZCfpvGimKb1+qNh5ZMnUXvkeny6LR10iP+o5OVReSbaJun8THS
 EOQPhLKBoVpk+8OLGoXYgFVLpGQPxerqJX7wkG5pqktV3n1SinhkjDCZ4Mo/EcEz3KuhZHPdioS
 OEnRPQgLJoE/TmCCLyWVd9QVnsv+8DkYBmiZUkVv2/yarKHjepMm9IdMWcEtPVHk0FBB921XZ2A
 iMTIgZX7RBVT6g22zJ4fZO1xX4vmzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160119

On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>> support for it.
>>>>
>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>> ---
>>>>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>  1 file changed, 107 insertions(+)
>>>>
>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>  	};
>>>>  };
>>>>  
>>>> +&camss {
>>>> +	vdda-phy-supply = <&vreg_l1a_1p225>;
>>>> +	vdda-pll-supply = <&vreg_s6a_0p87>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	ports {
>>>> +		port@1 {
>>>> +			camss_endpoint1: endpoint {
>>>> +				clock-lanes = <7>;
>>>> +				data-lanes = <0 1 2 3>;
>>>> +				remote-endpoint = <&cam_front_endpoint>;
>>>> +			};
>>>> +		};
>>>> +	};
>>>
>>> This would be much better:
>>>
>>>   &camss_endpoint1: {
>>>       clock-lanes, data-lanes, remote-endpoint here
>>>   };
>>
>> I'm not sure what you mean, there might be some typo.
> 
> My point is that you are duplicating `ports { port@1 {.... }; };` from
> the base DTSI here.  We usually try to avoid this kind of path
> duplication. If you can't have an empty endpoint in the base DTSI, I
> suggest adding necessary labels to port@N nodes and then extending those
> nodes in the board DTSI.
> 
>> If this is about using the commonly-defined endpoints, Vladimir broke it
>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>> afraid this could break a second time before even making it to
>> linux-next.

Quite frankly I don't think that commit was valid, given it's conceivable
that an endpoint could be unconnected..

Konrad

