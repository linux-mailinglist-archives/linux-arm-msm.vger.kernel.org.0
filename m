Return-Path: <linux-arm-msm+bounces-50850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5AA5975D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 15:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AFB33A6F7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B4322B8C3;
	Mon, 10 Mar 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReZPmDvB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172431A314B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616359; cv=none; b=EWTIJ3RHer/TF3ey8PnJifT4SJ1IIdXSP69d1lmhMRaFXkV4v+a6WKG4as3G1xTZU321x/Ca/O9BqttKxLzJ1PrCOq90K8gqQ66xHJ7W6FOvuEMwpJ3UNMP1HkFDTOwRPWbuwWAW5a8o2ZLAM2uDpRo6hfVnxWDEw8/1Yu46xUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616359; c=relaxed/simple;
	bh=Kw4X0RI3xQvRk9ucYIdDfRHJh2hsR5AMw3p+dcYDCzU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T4hBH5UJN8n/0FyR5+zBjvxgqEikkh02L3sV/DjqENOBlJfDAr25UPOQCLS0kZRde2irfIdd43H23Uhcg+4f+djSID3VZWJpTAK2zrloJaeIUzA3T//oT2gJ2J1hhPAXpanFcwJSUxETG2beEm1VQjmIFGU2lTb/Oi0wimeTcmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReZPmDvB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9NExB024785
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+Wq5zJA6gmbv2FgerKyZATG7S66Z12P3Ud/hZNivrE=; b=ReZPmDvBr1fmD+qp
	h4I9JZpX4Ynm+eDHnNilzqcFR07uU3wlimmeei8NkzQKx/w+G311bYD4+9tOps1J
	ic0IOmd3emrnfOLkrdvcazAhUVJov/B1BsPB6DHA1DcRbgjriK0T0iZeZ8DEFSIR
	EutrBCSL1M5mYY++oG1UCrFdsRyu3h8ZKoAXL4TZUuFRgRTVzMEXqKCHOyYTQQFb
	krA1Spt+dmg2Swbq5xhgSTFM38yUiffqpLY1BoaYKzmtRWGhqJZFPMYdCNQV9asU
	agMHG2R8UpECK92ID35ij+oFJBd5/6H+NONoEwVfa01Mnh40ECcLcVtAl+L69XWY
	YSBhJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpn3nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 14:19:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242f3fd213so46908655ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616356; x=1742221156;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+Wq5zJA6gmbv2FgerKyZATG7S66Z12P3Ud/hZNivrE=;
        b=hbAzeHi0YEpw/GgQVSIqulOvJRzLOse+bFVQGFcPs56G2zUA4X7v69D9TpW8JXjtys
         fKv/VawiMRy3HoIDQ2U4W0BIYd4pL6n1Sb2+n0WLV1L6mL4FYlGXSVNh8d7+/jzE719X
         epMj4+LggHMA/8ik7s2ZtkngorLR8mfnzE6aqTinb6Oq3gJVeYmQKe6nJh1iY9r97ge7
         mCaLN2r4qSPL+JP29EFvkecvDLIHxsdn8HPg2EJQUUHuQSh5oEYBlHfHli6pQ/0m5w8J
         UXHyVtH4RDauHfp8bCkXkvNDT6N7+lPQmksC9qvFKsMZegfwB8yIW/cxTy453DUEcVY0
         kdVw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Os0p2/druTA5QNVWnXq5Z9HmpNTvvWTtlRsMmrB8K2mAD0lUWfPux5ZF3tn/WyB6ypry7WejT0taH/GT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Nqy8CnUJUov/ca/ndlUo/BglipDo3EjxNbnVl+de5d5ZfSlW
	mayH0zJK1QUZguVwN3OUu/SrsPhnibWE9LUQfrIRTdonyhHPYLuDdexpTBE9WjujWvwQSd5PyE3
	RKkzkRUa/lqIqTc+XrzffOZSC1swGdL8crFaOeWEOKS9TCWbmMWk3qExW7mfjNHlq
X-Gm-Gg: ASbGncvDSgeX7k82gmlU2+3Tbiaw7fuS/NUHM4wqK089bw0K6AIaP8qT+lQYSMvjpRh
	1tZ+ondOFgNRjxHmvd6H828awH3byN1ENNboS8bwy4uBuFX5+sO9+sQpeaAlqq/ntnkT8oYnOh2
	WOTweEh4er0x83xjSL7VuqLz6UEaNMnUA9sttTuyYesHyA5ugII83F26bFNQWZ/2GZSLvx2/mgm
	eYBM7HyFuIYXFhEqC4K9/gKzbosDZvbUAbq2OutkcUHmim6N9d2DeVnigDiyQHuUslN30gBRJnD
	hymho/IPK4Rw07F0BMGOwElOBKDOiHy9E8xcwDAexH8=
X-Received: by 2002:a05:6a00:852:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-736aaab8008mr16770607b3a.16.1741616355886;
        Mon, 10 Mar 2025 07:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSpiN3WbZvFe9s6am2TScjvv9/DFmmZEYEiSM5uSmFppMupwiyNO+jb3RAjIUSnvXpQygleA==
X-Received: by 2002:a05:6a00:852:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-736aaab8008mr16770547b3a.16.1741616355386;
        Mon, 10 Mar 2025 07:19:15 -0700 (PDT)
Received: from [10.216.60.76] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736c05cb6e3sm4581999b3a.45.2025.03.10.07.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 07:19:15 -0700 (PDT)
Message-ID: <9f24e85d-f762-4c29-a58f-ed7652f50919@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 19:49:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 1/5] dt-bindings: iio/adc: Move QCOM ADC bindings to
 iio/adc folder
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Rob Herring (Arm)"
 <robh@kernel.org>
Cc: jic23@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, dmitry.baryshkov@linaro.org,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        quic_kamalw@quicinc.com, rui.zhang@intel.com, lukasz.luba@arm.com,
        lars@metafoo.de, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_skakitap@quicinc.com,
        neil.armstrong@linaro.org
References: <20250131183242.3653595-1-jishnu.prakash@oss.qualcomm.com>
 <20250131183242.3653595-2-jishnu.prakash@oss.qualcomm.com>
 <20250202-convivial-stingray-of-promotion-1123b8@krzk-bin>
 <cc328ade-a05e-4b1d-a8f0-55b18b4a0873@oss.qualcomm.com>
 <690befae-335d-4d35-aa32-abd537dfc4ef@kernel.org>
 <08be051d-6c76-4513-84fd-3ebd0808f695@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <08be051d-6c76-4513-84fd-3ebd0808f695@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kajtpPfwUErpDQux4HV2YLpAHueC4IBz
X-Proofpoint-ORIG-GUID: kajtpPfwUErpDQux4HV2YLpAHueC4IBz
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cef4e5 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Z0xEvofwb1qho15bfkwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100112

On 3/3/2025 7:26 PM, Jishnu Prakash wrote:
> Hi Krzysztof,
> 
> On 2/26/2025 2:41 PM, Krzysztof Kozlowski wrote:
>> On 26/02/2025 09:51, Jishnu Prakash wrote:
>>> Hi Krzysztof,
>>>

....

>>>>> Changes since v4:
>>>>> - Updated some more devicetree files requiring this change.
>>>>
>>>> I don't get why this fails building and nothing here nor in cover letter
>>>> helps me to understand that.
>>>>
>>>
>>> I have tried checking multiple ways for anything missing in my build setup, but I'm not getting this error when building in my local workspace. But the error itself looks invalid to me.
>>
>> So probably false positive / automation issue.
>>
>> Maybe describe just in case in the changelog that you run full
>> dt_binding_check and no errors were reported.
>>
> 
> I can do that, but do you mean I should just push this same patch again
> with only that update in the changelog? 
> 
> I'm asking because I suspect this patch will get the same error again. I
> remember that this patch 1 got the exact same invalid error (qcom,spmi-vadc.h missing)
> in my V4 patch series. At that time, I thought this may be some rare corner
> case error which might not always happen, but that seems wrong now.
> 
> Please let me know, is it better to keep this single patch for the binding file
> movement and reviewers can overlook the invalid error from the bot, or should I split
> this patch, like I suggested in my previous mail ?
> 

Hi Rob,

For now, I'll send the same patch again (moving all QCOM ADC binding files
in a single patch, with compilation fixes), with any required updates,
in my next patch series.

If the same invalid error is reported again (qcom,spmi-vadc.h missing), I hope
you can consider ignoring it, if I confirm build and full dt_binding_check 
worked with no errors, in the changelog, as Krzysztof mentioned.


If this does not sound good, please let me know if you prefer I should split
the patch in one of these 2 ways, as I suggested in my earlier mail:

1. In first patch, move qcom,spmi-vadc.h alone, to "/include/dt-bindings/iio/adc"
updating its path in all other affected files. In second patch, move the remaining
dt-binding header files referencing qcom,spmi-vadc.h, with similar corrections
in other affected files.

or

2. In first patch, copy all the relevant dt-binding header files present in 
"/include/dt-bindings/iio/" folder to "/include/dt-bindings/iio/adc" folder. 
In second patch, update all other files (.c, .yaml, .dts/.dtsi) to use the 
newer ADC file paths and delete the header files in the older 
"/include/dt-bindings/iio/" path.

Thanks,
Jishnu


> Thanks,
> Jishnu
> 
>> BTW, please wrap your emails.
>>
>> Best regards,
>> Krzysztof
> 


