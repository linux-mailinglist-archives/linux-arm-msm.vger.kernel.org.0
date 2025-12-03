Return-Path: <linux-arm-msm+bounces-84204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C9C9EC8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 11:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0084D3A8F78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 10:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65162F12B1;
	Wed,  3 Dec 2025 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnAs7cje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A/Q2KYGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9592DE707
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759408; cv=none; b=OduQc5URslGVkJJG/qy9bgKGcWbfs4GfJSHgzkDZCESEDztddspLZb7GrNjrkWTkRJLercbaLP2OXbunaQ9EGnabfu5Drv6RYTtgcMsX683Nces5vC3QB6QCb5oVQz8T1aJBH8cuOkDvadQk548l/bAlDEq4JfttxRWjmhBPm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759408; c=relaxed/simple;
	bh=OJtmt4XR/zighIaICaUQxLIlg7+Y3bLOoJXNW7fB8ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oC5079NgYI6VHTXH3nWO4gpjxVsoq6mdIevUMADsgeRywWd6Lyj4q92Fr74PsSdEuIgyk6M0vGNN2euyyP7fiVyHMa6Kd5vVwb5m8k4LzwASqmn5FPLP479uNpIFzTW/YMsoR7N041WXQRU8XwYg4j3O3Qg6D6sRRjLtCLX2kOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnAs7cje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/Q2KYGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37XbKm1902052
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 10:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlkhF5TBHhAagkES0cixd99625eLuneBdUOcOeIUj9w=; b=UnAs7cjef2X6qXjr
	ydHGG+ErUGiagwyAzj9O0sDFMneZjnudxuhEV2zdSJBAneg2jRRhvQpQNE6D//RK
	G92qC30LVWEtfCbHZTcLFJRF8sAookVI5vip/mSVAYrhNUevVw3ocDXPvHMmBYYD
	yzK6RyYnTbqlCsRKwo3R9OmUoXI5fm4iI7CzYFj5+RN1MBTjsNURVzfOz2Vk+3rq
	xSRcNCTSu2j/OQo8ssy9LGS9SstdixmMUhX/mB8IYwjwTyFu8jln6fD1159OOtYi
	JVPUej+AOaQ9GNzqo4Xq2x7eZlohYskQPRWylmwSj5drpKt7NLmbsp4gAzQmhx0z
	E23/Vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atgx3gnqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 10:56:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so22513141cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 02:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759405; x=1765364205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlkhF5TBHhAagkES0cixd99625eLuneBdUOcOeIUj9w=;
        b=A/Q2KYGColzq/qRb3ByxH5DOQAxHVNulWsaqNqkdKpj5UtipGh90POTAQFt3PcQ3mM
         EE8zZuAGczwSGgXx/wn9iX1yRO/XvrgJEIErFa+79PohxZLR+iiKXiPxu/lVcJ5Xcgml
         FwrQM9H9Gh8eknX7FUYM0xnufc7JW7sGT9l3VBrLkYu6mTd5NP7lNG4rO7pKeoPrHB5I
         oNZsffPAI+310+vZqz2ojs5VDNV5bK6w8kaPna6R9EZAwcMm8Bln+GZ4rCLqUQEvLTT2
         gXPYoOyeo8InUP2O6CgTqKCsmgyuBR3tPdcaiBOo9S9bHhauPUvUUc6p9oojSgUupLs+
         LeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759405; x=1765364205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlkhF5TBHhAagkES0cixd99625eLuneBdUOcOeIUj9w=;
        b=YSa6H9JhwU2G4oiIldyvsgdEm46gR4rA+4eBqUBjb1eBUP7F1P1ktzmfKVCSzIvB0h
         mWtiw4orloH3EDPY12DURtknXDRd3CjndvNBia13LtudiTK3Ido1pT9dFhoV3MSY/rLu
         xe46v4OfTxHwYD0A6jGWihEsLVn+NakFfzV11r0vOq8rSjHGQFiub/6wJJ1FZdSX7HHJ
         x2ca4zQwkI+ckzLYpt3/KISWpjkFwmuuUYOEtQc29Ix3FtOrFgYUZVzJAGzQ1rdy4O3x
         S8c8I3hekifH+5IkScw7BPG+aIORmmO8IblLobxi8pU+TC4ioK8gKx1nIkwKG1kW6iKa
         rz9g==
X-Forwarded-Encrypted: i=1; AJvYcCUI5mO9N/tinmgutrP3b4/WIRHeJsea0hCmDAS18I0jIXtp0weGYBZiRG+5YlNfWUSB1gQMOtA8yWTKNCHh@vger.kernel.org
X-Gm-Message-State: AOJu0YysC4TupHqLPiT/TgxzBpbcy4O8NVgEwm768ypUDJwfWTtBxKUW
	lAFkem0CSvGaLb7DSgN60Wn6hqEeXWBhCTwGYBrTVxPstHg6eZQiKCFwXAaCHGBTwKJ9byixnnX
	2903ci4JRDmNjARvRWSvsEq/jJxVTMBGdLr4VxgRPkRDGyvbTAeW6bsyhXoSkUt3g49Kp
X-Gm-Gg: ASbGnct2yl7XKA2cTr/I34hpygokHcNPBLqkXDmVHtRDVzJv/3ic9BX/JqVtcD3Rpi1
	cClU5Q5GjmHLVsssdsnaZzQ3jdlWQYp+aQW1a71xSIum/goi0oOkQS5EdSEpLFrKMGomasNYlyz
	tXrLt4lpRYYI9JXNumWKPGzRES9kTwd+hyutsqYT9MBdGu0ZwAv0hNt+AXEmSGcIV0Xl4tlKg+w
	JJRiPPdUld2HrNS6ZiqyUq6aXfyRFDGBsU0IeFPjUElUEfHylGHWdQzDyzFMnNtNh0fgC5FSIfR
	QM2DsNbZiF8lpeYVfi2TIguh1xCx1bMRQio/WjiGnvZ8lxe6lthKIWuGKmgUIAEc7JblkqvFjP3
	MyhoHNaDgzX1Y+P3OmCPuwR31XDqE405Lhwlp/lkKIXH6m/IYvzclPTgnPryNUkPigw==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr69206185a.3.1764759405467;
        Wed, 03 Dec 2025 02:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkj/PxGQiGLKLkut0E54g3hSB4S41eikEm1v5XWLARNObPBjqCpzJTcKDAApf3uqrKquQfRg==
X-Received: by 2002:a05:620a:269b:b0:89d:4a69:1502 with SMTP id af79cd13be357-8b5f8c0c5d9mr69203885a.3.1764759405029;
        Wed, 03 Dec 2025 02:56:45 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79cbc1f1d5sm285405866b.63.2025.12.03.02.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:56:44 -0800 (PST)
Message-ID: <aad15cca-bd3e-48d2-a70f-f1a66726b50d@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 11:56:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: Add support for Surface Pro 11
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-5-daleyo@gmail.com>
 <ae91cad5-5a0b-4c83-9eb0-6e7baf6a33d0@oss.qualcomm.com>
 <CA+kEDGHyx7C7PNxQ8votwABiQpKhAAh126os3OLu-W0kDo2ySQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+kEDGHyx7C7PNxQ8votwABiQpKhAAh126os3OLu-W0kDo2ySQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfX0+awDTGM5rkO
 NttnHllLpFWX1QaJJKnDLam8DG2QgUSGHw8oYZxDiKeWFu4JzapukbOqvpxFfZDgQlw6XLygfiT
 jLXkrrQ2RE1d0cq4VE9tq6wClRKwE8ui0Vtm0sYkwxEQ11GHRch099tJCofvcggbnXFLmuA7unD
 8CkyGOUsQr4w9QYCBlftxPZrfEG227TB+ziW7KZLEF42q6gg0P/jEzwgecpXDNBWdfEnTVFjntq
 N5enTpGZgtvTAVlDZ9WeJPVgqOPDjWHCeK1EgPYNk+FrqQ6DdvAS0pYgJD7Jne37/Fa+X7qQNnb
 ABtzV5gx4IXxcSU5cR5+d9g4zS9Bsh8Vk4u5Krz6jVh6BeKJRsPeWOH/HdN60ErdXsMKBucswRH
 OWXejG9l/VYKYP0Ek8b2MfctKriTow==
X-Proofpoint-GUID: ACHr7go7UdDhjGb0MlVHcnYuj3cDDVIv
X-Proofpoint-ORIG-GUID: ACHr7go7UdDhjGb0MlVHcnYuj3cDDVIv
X-Authority-Analysis: v=2.4 cv=R/QO2NRX c=1 sm=1 tr=0 ts=6930176e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=07xxzirJNneZIAj5VHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030087

On 12/2/25 7:50 PM, Jérôme de Bretagne wrote:
> Hello,
> 
> As discussed with Dale, I will take over the v3 submission since we've
> worked on this patchset together until now. Here is my feedback below.
> 
> Le lun. 1 déc. 2025 à 16:35, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> a écrit :
>>
>> On 12/1/25 2:14 AM, Dale Whinham wrote:
>>> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
>>> Pro 11 machines (codenamed 'Denali').
>>>
>>> This device is very similar to the Surface Laptop 7 ('Romulus').
>>>
>>> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
>>> x1e and x1p-specific flavors of the device tree without too much code
>>> duplication.
>>
>> [...]
>>
>>> +             pinctrl-0 = <&hall_int_n_default>;
>>> +             pinctrl-names = "default";in v3
>>> +
>>> +             switch-lid {
>>> +                     gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>>> +                     linux,input-type = <EV_SW>;
>>> +                     linux,code = <SW_LID>;
>>
>> I.. don't think this device has a lid - what triggers this GPIO?
> 
> When a Surface tablet is connected to a Surface keyboard, opening/closing
> the keyboard triggers a wakeup/suspend event. I will double-check if this
> entry is involved and will remove/keep it in v3 based on this check.

If you have a magnet handy, you can run `evtest` as root and try waving it
around the screen frame - it's presumably just a hall sensor

Konrad

