Return-Path: <linux-arm-msm+bounces-85379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB229CC3BBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A669B30B6772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5934339852;
	Tue, 16 Dec 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyoNzVim";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wp/+LsUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067E17B50F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765896102; cv=none; b=s2aicoppCMBjMksU6xH9Bk08f+ELhA52gvOro7OtN8DIOWIrwfYbASjmjnyMW22KiKagRrvyWUrKcNyWm8RtTkBB+sN9NNWzayG6XLhyuLTPI/dAQby7Cpn8JZxWbKepqftGQAVWdFORV4B8LZ6WW76vsLfIZBRjWXy1eFI3lRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765896102; c=relaxed/simple;
	bh=8xgsdnB88ZWTSc4x3ntMzFBc90fHhlMKzzsemfV6qxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceT/UKt9CTZ01cDWNy2cml/tWuTLaP1eLHkE6/QOIPcHL8VSgA772UwGP4R8SVohwDAUN60Cc5+T7XfgY5eAggIi1a2NiJxN6AHiQkpWGsKqm49VlxJ/BaF0pY3oH7B8tGQjgGZywimeqO8F7ijEcBT5JsubyQTvdN9Mfl1QG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyoNzVim; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wp/+LsUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGC3W1T2810423
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuK3BpfIIav92AqguNV6tcGNJeDIYEQRiH95uW3RKuY=; b=eyoNzVimCfdxsiRu
	H98oQo/0QdctC03R34alN2NAAD1WX0rO7/wYYqz92pNbN9yvB+xddWNEVmiqrtTP
	UGkOG+NzwtIpD/f8EbSJW+6Fc9En/FUAIgbXcBc+Cjk2NbXVDmQcgfFVV4gFoL3g
	3EfKcnjkAGwWNFFxwSJkPIK68laPHbrogS93WXfa+QqHOKTGTfjc2k0R181ojKtm
	/rYdeIcMawqRIGH0bBn7z4uXzyWUZtxMzHTUqFeJkXBKclyMVN1O/p6Wi14I30zp
	/+cYUQ4e5e4fzgibQUjnCEQIe6XRbtIewd1YGNZsa8sPlEZaFYpegwYlUIxwghm1
	vOuf+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b32gastj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:41:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a39073c8bso6696496d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765896098; x=1766500898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuK3BpfIIav92AqguNV6tcGNJeDIYEQRiH95uW3RKuY=;
        b=Wp/+LsUvAPj6zFo1bf69Ow+dbcntTQghVtlk0ZMW31W1q48t5rhePIrKrxXlQ0/P4U
         itpmQ8vO7+dfdpSGfESQaaaW9b/Tx4heGVUzTrdJp0or843pm3L5nmRqxtfwXVMm0564
         Ooyn0E4e2OuhksBeYJPzdDdJOBhhLudXRqSVt1ZSsxmYnBUvlhVzxd+sCwPxDGm+wRlG
         hQgXr4DvAJQuF9Rjqv3PCzupThp2oW30TGeWkw0r0vDempuHgTFxYRzpNqVxzaLn6Jus
         u3D3Tgqz4hQgeH6+oGkvGSzwjtMsoS6YyK2/yYD1iUA1VTOElZDxWRVZTJstnjkOULf7
         7MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896098; x=1766500898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuK3BpfIIav92AqguNV6tcGNJeDIYEQRiH95uW3RKuY=;
        b=LUYnHGLnJDxy5Ol3iYiE27DVkKJQTv7wakL9tAlgrqe3Vq8GdWEQfvTWcFC8GUAnzR
         MnXc4wYt1JAdVP17e7VcmzInrd4x6gwsWAwfmpFzcDZvFj1lav4NmHEPCMpS0sl+d2Q8
         zUR7+rmyuekgttoJsgQAo3lTrKUVppKIGp+GUGb0HFMQLs8fMzBC3CI9BnoNFJu92Q40
         ArgbOqLKGvsVY6bZyjcfmCGDBFXzd5dEGzvtlWNH3yWxWFX1wFh/zC6H0U4hcMZUQL69
         8jXIibaoBEeXDAUuZxIxKn+vD3CwA7phLy8JKBdMzndLZ+FlL+WhkpJ4G+UpWONV9Tc7
         iZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ht8w5pn8D7XzqCRVL97ATLUP1QFyD16G8lYlO6VkyU3ZM3bR8udamK7FCuIDjykiUE2GnTYrSxcm4APS@vger.kernel.org
X-Gm-Message-State: AOJu0YwIo0SSRzAZusy6fWxXwryfoqS6wHjgrsaj4lOpbP0hDg22AMzn
	ZLmb5MmjlBo5qPb+VzDsgqEm+Pn3LvL5BlkmQMRs2Ahr+f6swaPnjkNF1pX/K0aMuX2lyIwJiun
	zZXTXmXdvCcuoF38FHM4ZcKqfovrOa7VfY72FhvX2TYsP2yUfKYui6dmQaX+pUcxuhMo0
X-Gm-Gg: AY/fxX4zy+Dc/RqTvvFOWOKsTGyakTahTyc9P+OH8gLa1TdxciX8/Iw+/6e3iozhd4G
	rmOWbHLjN/iPEuYEUmVpxAQ3KJe/wXjYRejhKxqLbmtFR9aS7/qcyMUv60SCNFIzQspARDpjlfF
	Xqt82d3+WAoSOx59gqVj08R9zSQy6mdLb0g2m1MFabYtjOt2Beu5r2pgxdKk9ciTFa7nSdljoE4
	xB+NvRGZGH6GQV6EqLr8osYOm8ZAZaLpd0QWBfLjHr4ld6yUfERjHCSJBbfvPP7+Xr+GLqzRuTj
	iGrRb3Q90BvpismgFmhbjKx78G3hVFpE3JxBIZrTM+zEICGOU8Q5aWvLIIc6Ypw26Nc+OlPryfN
	nbqJSdEpyq2eUVOBCeZJHz/GRjqv6TYELPLbMRPiN0VkHssc33SVaEgdaHwtJqNGofA==
X-Received: by 2002:a05:622a:409:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f1d062f452mr157071261cf.9.1765896098257;
        Tue, 16 Dec 2025 06:41:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMkEOsjFbsS7Ipg//dvpT2pnJNXxgT18opV1fRQfxanda7KKQTXBdq0OYru1u7bNLe7KYy3g==
X-Received: by 2002:a05:622a:409:b0:4f1:aab9:851b with SMTP id d75a77b69052e-4f1d062f452mr157070661cf.9.1765896097332;
        Tue, 16 Dec 2025 06:41:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffbeab76fsm134909166b.41.2025.12.16.06.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:41:35 -0800 (PST)
Message-ID: <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 15:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
        linux-media@vger.kernel.org, Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
 <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
 <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Vcb6/Vp9 c=1 sm=1 tr=0 ts=69416fa3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=POKBKsRifFHOQ751TUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: iYKMimpyEa18oT3rimOSHezNYM3sYIBI
X-Proofpoint-ORIG-GUID: iYKMimpyEa18oT3rimOSHezNYM3sYIBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyNiBTYWx0ZWRfXw4a3vhciWpeD
 Tbz7vooWaZh6MDwZaykneeoHzP+K6zXX4PWD5YMMHgg/1OCoxofbqjH7uXgGpo7Inh2EucL2c5G
 oAU0Zh+w3HOwSogYN/IcqKG0Ysa86j0rkQHruTy3u4zxHnB6NuIXbAOS+CJUO2rKeIfpM0CxAw3
 QdDuW42T7hLvPn5lHJTSZriyfhrMYN8CeY2vrQT9JUmEjXSR2oVQlPvJUIX2dt7rHzxdpMinZj/
 iWRnGuu7kaHaV/hmFyQIA3ZVLS2BUXw8mf9GWXf4h9ym1yYcB6BcPMPf241DF2Lw9yynoqChQDF
 017eIGPIyL65EANFyghWyNdnZOzu3ahYnngCdP+3C8+Ue0IIDs2j0UDR+hlXafSUs/vV7R8sUNR
 Nn6Pk6trzXW7IpsGSWZUnnn5ePTwYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160126

On 12/16/25 3:31 PM, Vladimir Zapolskiy wrote:
> On 12/16/25 15:56, Konrad Dybcio wrote:
>> On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>>>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>>>> support for it.
>>>>>>
>>>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>> ---
>>>>>>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>>>   1 file changed, 107 insertions(+)
>>>>>>
>>>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>>>       };
>>>>>>   };
>>>>>>   +&camss {
>>>>>> +    vdda-phy-supply = <&vreg_l1a_1p225>;
>>>>>> +    vdda-pll-supply = <&vreg_s6a_0p87>;
>>>>>> +
>>>>>> +    status = "okay";
>>>>>> +
>>>>>> +    ports {
>>>>>> +        port@1 {
>>>>>> +            camss_endpoint1: endpoint {
>>>>>> +                clock-lanes = <7>;
>>>>>> +                data-lanes = <0 1 2 3>;
>>>>>> +                remote-endpoint = <&cam_front_endpoint>;
>>>>>> +            };
>>>>>> +        };
>>>>>> +    };
>>>>>
>>>>> This would be much better:
>>>>>
>>>>>    &camss_endpoint1: {
>>>>>        clock-lanes, data-lanes, remote-endpoint here
>>>>>    };
>>>>
>>>> I'm not sure what you mean, there might be some typo.
>>>
>>> My point is that you are duplicating `ports { port@1 {.... }; };` from
>>> the base DTSI here.  We usually try to avoid this kind of path
>>> duplication. If you can't have an empty endpoint in the base DTSI, I
>>> suggest adding necessary labels to port@N nodes and then extending those
>>> nodes in the board DTSI.
>>>
>>>> If this is about using the commonly-defined endpoints, Vladimir broke it
>>>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>>>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>>>> afraid this could break a second time before even making it to
>>>> linux-next.
>>
>> Quite frankly I don't think that commit was valid, given it's conceivable
>> that an endpoint could be unconnected..
>>
> 
> Endpoint is not a device, status property is the property of devices and
> not a property of anything else as the Devicetree Specification v0.4 and
> earlier ones define. Dangling endpoints are fine, there is no need to
> add another property to determine, if an endpoint is connected or not.
> 
> There should be no status properties inside endpoint device tree nodes.

The spec doesn't actually define what a "device" is. Funnily enough, it refers
to "endpoint" as a device:

2.2.2 Generic Names Recommendation
The name of a node should be somewhat generic, reflecting the function of the
_device_ and not its precise programming model. If appropriate, the name should
be one of the following choices:

[...]

* endpoint


Plus an OF node is opaque in its purpose.. The top node, a firmware node, a
node representing a physical IP block and a config.ini-style blurb are all
"device nodes"


But coming back to the real world, the ports/endpoints represent the physical
connections to CAMSS and it makes sense to have them defined in one place,
especially since there's a predictable number of them that should not be left
up to each board to define.. That quite obviously implies that not all boards
are going to utilize all interfaces and the commit of yours that was mentioned
above seems to only be valid on the basis of semantics, which I above mentioned
are not *really* a valid point..

Konrad

