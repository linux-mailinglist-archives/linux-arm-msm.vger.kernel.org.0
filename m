Return-Path: <linux-arm-msm+bounces-81435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840CC52A1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 15:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9EDF334C17E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BA52765F8;
	Wed, 12 Nov 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWeumA12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIaAQyAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F5279324
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956797; cv=none; b=ZljdFd0ml7+FX4hp/OZceaer10Q7yFp3jHUpHnbSnS4Oau71RUxZI+tOV1XVN47y3J5ED7LbJ1zE1bcCyzuXNn29HObAAgIraxIbm7nc0wcbmwnPQNYuLDf+oCGZy7OegG92ONsQ7O2VlrCmtvnMZPjeCJ0Iqk1UCS4varWCxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956797; c=relaxed/simple;
	bh=J645JbN5Vc9BghfSJdsxeLtDY0SSFlmTbECkHKawAuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OL2hJe2x1QFunlThbX7BJ/UpA2wAQcTzGPACx1GR/C3OH5Qt5UG3+wHDMk37w3GOSlBWAqfRFlyeCG3tef4XTMuA7G14GO3XvmhqLjX21xCcL3RdHrAivJdgDMFugs+MUrlQRxgmdaDI3oaQJLkAC2DtX2O129UVnHh3aSy3wRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWeumA12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIaAQyAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9ggen1109096
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHUut04VaUFbqv9z2L8o3rmMy4cPsU4Nh1pLufyyPTM=; b=IWeumA1208JQozOu
	2w4+m16gqk/chvIJ68R+at2FmZ36nQDeb/jwb+xCHxy1MfeSPL8oFyub7yOv5X/U
	j0ofDaeo+JiCW7FYXFRJ0cZrA8U6UmZ3ErHcX3LNYj7ouBBQwnGyUle91+Jj3ZDw
	choayCdlG+kwYywq/PWkF+yWwIG28eon9S7tQbODEWms3ioEKZ0WDivvHrOBJ1u5
	A9FdyUUMKcC+foWAhgeCoptqaCzGKnnL0UOBDGNz9U8ULJa6MnIMOdomo9LjIN5f
	DNfYlbCAGefdnjiD9IeGiA4NCGUzoH3UuNFZBXeceY4S0URahoy8sdhySVkMYxrJ
	bG52rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum0qus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 14:13:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed5ff5e770so1641901cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762956794; x=1763561594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHUut04VaUFbqv9z2L8o3rmMy4cPsU4Nh1pLufyyPTM=;
        b=RIaAQyAGa7FCyNb3zVEdjI1ffwAYQGgRySMT+jQ7jSiuBt3dwW1R7shYu+HPIzibF5
         DoDnXewVRf15hoa043YRaMkpOMjot1Sdofk6RSHIJaPz77k+ceMcyAznL9ihmLmdQL0z
         ZXRV5aQ3WwukAEhEnYg+MeJ8ruOie2BzPjPKR6ChLGnoMEv2tFocMANyjSVUhr/ALHKG
         kPVje/ByGGtWRkWmpI6Dwy6H9h7o88wQMoC6mz+9nECuT9fKSXez32W79dQJRQYlI4uc
         V7T4AKoO/MEaYaj7b214cJiWikhaApeFcziit3svXN2O29yZUlfMiIk9527FA3kfqMZo
         5OTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956794; x=1763561594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHUut04VaUFbqv9z2L8o3rmMy4cPsU4Nh1pLufyyPTM=;
        b=FrFH7LBfX4asfHQYtDsQcHNipLE2Ct1w7nC3cHu/H+1C/W/Fz2kxjKUHndWsjaddft
         754keTS4cNvm2XZ0OsijOFA2mNnJtgrRuTtsGE9t054wz5rcOSGaBFJJnzQJeKNj5WEe
         aakW9QKyPy2TsoYYL+2B+FWva7BZ/rrDUVjth7pzLMQygRDmY7isQ58PHqVGw8VcA2T5
         xNURA+a7HvKgh+NVQhi5bGR6/e3g6dmbWDAflr9yYww4sMa5hb2P8Vb1wkRS4qfe5gIF
         lHnXRW569iNiXlndApFQXXFGX65DkbPF/zDULhQfi0Gh2p9aQhNUk+/yNXqBp9cUcVP5
         FO6g==
X-Forwarded-Encrypted: i=1; AJvYcCXS2fmkTTcbK0ymQDWkRN8vGbt1MQsOs0VYysSNGwWY2li4QdmZBIjbYqHcqDBEaLB5wKjSKaYCdvDlfGon@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZyA2msUP4EqB899HjWXwO0tAeXuRQghtYK0gDiTqdMqkctfA
	Tq4Dvkmrbkp7QVo5VO5aZKNDbTKnFLOHyMXEjkVpxclQVRVFYaXzKub91AGrFoY8YZj5rwzMZKm
	HyP/AkLr9FYs6wAN03UJAJORXJlEYshta5Wq7/txm8gKAc6lGrcMEmbW0Ww1VNPZRsO5F
X-Gm-Gg: ASbGncvomhMrNxL+bthbiKVpBkOONd9ovnMJ8gylTZI3bc5Fo0aO8wadhknrc73ELYo
	T/Q0gOg2tUUikd2+4xy2ywMmFsgiG1MuWEpIri5zHSyj2+zW/sOfvzQUTb5S33TYFRRA1t2XarU
	44eNEUWv9GdQVSFQFaTllh++UFIAbbcnCA08vg6EuP9mvXa37pqZteMbp/0EDLKVHNIODSXuZUf
	gS8PrStYks3x/tGDxliscQY262eknYS0d//AOHVnpyPOH7pISEtq+ZUoZQsW1mKfwWLZ1p7QH9a
	jYIITzez8aCN3pkAjW6036oALdU2BxfeZmU6BiUrPF5w4NtRMas0zTo7Zne43+gYrmZCWilcXuz
	rg2rmCiDMvnpaM3e6AVQt6Hv9nXFmjW7CTquN4V7k5w65oRVqA30kInjE
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr7118501cf.0.1762956794174;
        Wed, 12 Nov 2025 06:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsHAOmLCaZ3IR3QcSlZdT4HwWzdB7AxGusG/ZYPx7d86XFbaGybUgLs+3lNWZ3zLuwV516CA==
X-Received: by 2002:a05:622a:2cd:b0:4ed:70bd:d9e2 with SMTP id d75a77b69052e-4ede41f17b2mr7117961cf.0.1762956793612;
        Wed, 12 Nov 2025 06:13:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bdf21sm1601021266b.59.2025.11.12.06.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:13:13 -0800 (PST)
Message-ID: <93761f66-c1d9-48dd-855c-20457329a630@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 15:13:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-18-24b601bbecc0@oss.qualcomm.com>
 <09b2ee28-ee2b-46a8-b273-110fb0b4d8a7@oss.qualcomm.com>
 <064d2a33-22e7-446e-9831-a390510698cc@oss.qualcomm.com>
 <20251103102651.ywxi7lqljsmjg7an@hu-kamalw-hyd.qualcomm.com>
 <CADhhZXaD=ut7MCQD_uEvY1ew7o=rqUUtviaXwQSkE-nmvCxMhg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CADhhZXaD=ut7MCQD_uEvY1ew7o=rqUUtviaXwQSkE-nmvCxMhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExNSBTYWx0ZWRfX1WYSiAIzGi9b
 M4L2Nx1VU2fOPtS5nQFaJamLM/z7/RPULxIiD0JuXv/N0eFhQPxgMziZ2WnW47Ibq4OLmgsJxuH
 L8fz8UVM8siQVLJ3n93hlhkUWI2oi6UMlQOMbNH3P4GByxHgRhfJ6WuqjxvC/+goGX7OcPpvUor
 Mg2phrPnXMINRkz5mp9MDp3MzJdO7LE/JU4BokEEE98vX0ElLFtjH7NXdXhG61mnlHBrRQiAk3P
 z+IVYXRFXrX5CHwC7/zvXFDfIIdYKTyzis1T53vfIFUZ9PVR67ao28Nyn5JdL76DyfEdx/3HJYn
 agtMKF1TLxvMOeeyfHy0hc0bvIXOqfz27vZD+DSz1VGaAPlj3A+U4LHDEwNAAUilRmucA4ojnXv
 BrYotGaeSsBfvshVvGhebJZVh3lfww==
X-Proofpoint-GUID: KGKzo5bZOyXihHmV6owEZSmU17zXcXSI
X-Proofpoint-ORIG-GUID: KGKzo5bZOyXihHmV6owEZSmU17zXcXSI
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=691495fa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tAzfh7vgChFEt6Go2VwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120115

On 11/10/25 3:06 PM, Kamal Wadhwa wrote:
> Hi Konrad,
> 
> On Mon, Nov 3, 2025 at 3:56 PM Kamal Wadhwa
> <kamal.wadhwa@oss.qualcomm.com> wrote:
>>
>> On Wed, Oct 08, 2025 at 05:25:39PM +0530, Pankaj Patil wrote:
>>> On 9/25/2025 4:02 PM, Konrad Dybcio wrote:
>>>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>>
>>>>> Add the pmic glink node with connectors.
>>>>>
>>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++++++++
>>>>>  1 file changed, 28 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff182005d67b8b3f84f956a430 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> @@ -79,6 +79,34 @@ key-volume-up {
>>>>>                    wakeup-source;
>>>>>            };
>>>>>    };
>>>>> +
>>>>> +  pmic-glink {
>>>>> +          compatible = "qcom,sm8550-pmic-glink",
>>>> You *must* include a glymur compatible
>>>>
>>>>> +                       "qcom,pmic-glink";
>>>> Are you sure this is still compatible with 8550 after this
>>>> series landed?
>>>>
>>>> https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com/
>>
>> Sorry for late reply, earlier when we were sending this series our understanding
>> was that we only need to support for usb shell, and anyway the device was on the
>> debug board so this feature(battery/charging) was not tested.
>>
>> However, after testing i found that the power supplies are getting registered
>> properly however the data is not coming as expected. we are working to fix this
>> internally from the firmware guys.
> 
> As you had asked,  i was able to check with this patch (and firmware fixes)
> https://lore.kernel.org/linux-arm-msm/20250917-qcom_battmgr_update-v5-0-270ade9ffe13@oss.qualcomm.com/
> 
> The qcom_battmngr driver is working fine with this patch included as well.
> (though i faced some conflicts which i had to manually fix when
> pulling this patch on latest linux-next tag)

It should "work fine" either way, and I'm assuming charge control still
works (as it did on x1e). I'm specifically interested in whether all of
the properties that 8550 introduced and additionally exposes (vs x1e),
such as POWER_SUPPLY_PROP_STATE_OF_HEALTH are supported on Glymur too

Konrad

