Return-Path: <linux-arm-msm+bounces-69301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 016BFB2748D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 03:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 263597AD9D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 01:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEC1189F43;
	Fri, 15 Aug 2025 01:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqBUmt/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6586334
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755220025; cv=none; b=tino++I8Gtvc/wsCDvo5V+ekFGp5Vj7Y5rXAUsSmoi4N6lypo2WrFSgC4xofYLG0+sRxnJNS2ydWHRmPV8iGr2B8hTx3IMhMeuhfWxc8O6oNiB7+L1NtP1mao+IJJjilXouYnX7OHwVPprWnGWd5YcaUHaO9VS8KHyMxNNWgB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755220025; c=relaxed/simple;
	bh=E3W5yNIhlkaRbvT37seZFqLZe5Ju1m39nqAxDnNKIQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D51ahUHZjIG8JSrDbNEelwNP9xiJZgDXdRKI+V27kqDHdNoEW0obUXJE7mWhVr5aFl53Hs7m72CCC62wbQJkG5PVGoogdC7+nwlPwoWucQiVhS6/68JQ0O1ZEmjEH5A7T4ZsL3cEilXZjlPAHl9s3kwxZqxZZlB1DQLNVtIUqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqBUmt/7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHW6R8002797
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDTemP53sqqVbxhSCn8l+KTq6D2kUe+G1EUg/hQ0gAk=; b=QqBUmt/7cLOd7nTz
	dSUB6NSleCR7EmG+rTat2h5+TlXarmHeUHP4g3rTNrj0la0EdNw4BmACb08nIf+c
	oU6qYPJUNc/kVKKBjkvufi4gp/UsiVuY6s0MW0M8QdhuOm1DSgy5RAixu0a3EVoz
	1odggMjy3enO8HR5Zikzugq+XHHdz/rRwxFfpIYpoTH+2OdZ95yhimHVTPqnOBGb
	eZIoS32DRLccLlawNU8Xz9kbWMIRFlan4la5zHBSqJz/+64hZP0Ln+CpYZudc8Eo
	gYiUcFNzBFhRdMoZjyc8+3JZHQ77Gx5EKDgRoDul/hEUUPA/J2SSmk+A3PG40N8L
	UPyv5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv9k41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 01:07:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806b2beso33603265ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 18:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755220021; x=1755824821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDTemP53sqqVbxhSCn8l+KTq6D2kUe+G1EUg/hQ0gAk=;
        b=eSWFlVqDeE0d06u310znPc8M1B5mq/RJVf1fy29ejful/yeoQPMyAwFYETE2Ryzqux
         25k9iVTwvbiECE2pd0y1k7q8r820ebtYYWkCarTUDR7vYmbFgVm8TiagvpR95yOUVqMm
         bOzlGLu48a3ehuPwRfz/73NFN0pToV9D770OyqnHdn8Q0cPIUxp2IBYFwsf9NlV7MBI7
         /FoeZCyvVsyEiEPtqBpCLv+F9DhMmhBbRbsAvCZVf/wIICdsR5cTdimVehFm0+nkxZ+r
         Py6/+qYRTfO0SMYxzsjW8sO3WxMx8r78zPV/HyuAmnvP3QaoajiHrzDpSirUf8lN6bdD
         ZARA==
X-Forwarded-Encrypted: i=1; AJvYcCVNqxJ0Hq9poKLWz6P+oCdiwsUj+L8QulX3v+wXGy4fZZtruvd1w5JHSpNQBGMFsyASid4nPf9Rk2AZO7go@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82NI41pBl9zApuqC9IO4shYYc0Q8dnscL2RHLKpLj232YW0aN
	4agmhyp1hYWOStsPY7CrkqwAR1Itljv2bgza+VclFQ/P1oYWuqlksA4a/YM7Q/KN1/dAOurnTZ3
	sOChh0SElBPxR8W2xfQY+EeVt/bmJGat3WpTplFta9Gs12nyNSblKdjaF0ZedQA+XfQu1
X-Gm-Gg: ASbGncuGeLthJVeRfP2V5t0WgFycyeA8vnNL8D4ofQncj9najkeDgBIaQKyk1C4/s7h
	UJpEVS2ZyZNtTARVzHjoROqqnwVGtwS/lyHpkq+kHy7DZ92Rx2vWjwa1O/rwudz8r6NL/A4xgn7
	LdgzSTieKB+QKj4rhpCn2gHUJSgcg5Ps28/HZdA69yKGL6TdNyqF7EBt3ruHTjc4iJ5ARKunqrq
	YwYIFrs3643zGp9ca6T8ZXkUKtSLX/RVTOkZOxDJp0tDj9QPB9AmQ71zMLF1PuhlaNkLW021nxV
	wRJRASo7lQlT7bPAZ9iFvlpuN8HJGY+4/C9jfY5yl75whbKJ7r0g8sQE1rRkVbf65XJ7RFM+5y1
	uMBrNjZjS17mMxrB+apSP41Uva4g=
X-Received: by 2002:a17:902:ced0:b0:240:a889:554d with SMTP id d9443c01a7336-2446d99d42emr3600155ad.45.1755220020973;
        Thu, 14 Aug 2025 18:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoRXWzdGiF1XsdVWPHqQWYLwIu/sVwT0LWw97cxh/M0gcCmu5vNZ2VC719kSjTBipHI5cloQ==
X-Received: by 2002:a17:902:ced0:b0:240:a889:554d with SMTP id d9443c01a7336-2446d99d42emr3599685ad.45.1755220020441;
        Thu, 14 Aug 2025 18:07:00 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4384baf139sm12438271a12.36.2025.08.14.18.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 18:07:00 -0700 (PDT)
Message-ID: <81ed09ed-67e8-438d-b057-28a21d8cf70c@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 09:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
 <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
 <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
 <a56b3e85-0d42-4945-8b6b-dcff20c7b104@oss.qualcomm.com>
 <nruypjmek7f76m5nbv6vs63koscrwcqknswfm67rkcjtqxpwhe@3ijzkbbaxj2p>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <nruypjmek7f76m5nbv6vs63koscrwcqknswfm67rkcjtqxpwhe@3ijzkbbaxj2p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689e8836 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FDvvkfF-Sd8HMvbO3OkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: m4vxN4Mka18s_moHFytt1bMOvPrN7Eki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX6XGxGS20jJWv
 6nP/orlGfv9tCVvvJOlsFlcrCgdeIMG0vf4tPgQouK0n7Hl+WGPH3BJPNJ2TVW9UleQNz6u58u5
 b71zb9OFPIRZbJJN79nfClJQZl5XygCbY3MyfAda2eSFCvwgjrrMs1CWRCoRHBnmUpVcpTU1vrv
 kqHxmVC62OWUw+8tcmReXwm6/WXMUGQklfhxqt9pgohM3ss9ODaRQquulxjXD8jhHZ3sBHQ9b+g
 3v6HSzU9Hshw9FqYbF38dsnSL0YDBUahmc3rgGRyTsyxToQKE0OPbl0Uko/6/y3grIwZy1Vuw52
 K2rSXFnVkoJ3r7phZ+SwM+58BSwrWma6hwJO9psSoZZiOFnsbrqWBN2FEF6OTQmqVeBxkU0T+0L
 Zkgh4cVM
X-Proofpoint-GUID: m4vxN4Mka18s_moHFytt1bMOvPrN7Eki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 2025-08-14 19:27, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 05:28:01PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-08-14 17:05, Krzysztof Kozlowski wrote:
>>> On 14/08/2025 10:54, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-08-14 16:24, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
>>>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>>>> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
>>>>>> a UART shell.
>>>>>> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
>>>>>> and the HAMOA-IOT-EVK carrier board.
>>>>>> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
>>>>>> GPIOs, and PMICs. It is designed to be modular and can be paired with
>>>>>> various carrier boards to support different use cases.
>>>>>> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
>>>>>> It provides essential peripherals such as UART, on-board PMICs, and
>>>>>> USB-related components.
>>>>>> Together, these components form a flexible and scalable platform, and this
>>>>>> patch set enables their initial bring-up through proper device tree
>>>>>> configuration and driver support.
>>>>>>
>>>>>> Qualcomm SoCs often have multiple product variants, each identified by a
>>>>>> different SoC ID. For instance, the x1e80100 SoC has closely related
>>>>>> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
>>>>>> can lead to confusion and unnecessary maintenance complexity in the device
>>>>>> tree and related subsystems.
>>>>>> To address this, code names offer a more consistent and project-agnostic
>>>>>> way to represent SoC families. They tend to remain stable across
>>>>>> development efforts.
>>>>>> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
>>>>>> Going forward, all x1e80100-related variants—including x1e81000 and others
>>>>>> in the same family—will be represented under the "hamoa" designation in the
>>>>>> device tree.
>>>>>> This improves readability, streamlines future maintenance, and aligns with
>>>>>> common naming practices across Qualcomm-based platforms.
>>>>>>
>>>>>> Features added and enabled:
>>>>>> - UART
>>>>>> - On-board regulators
>>>>>> - Regulators on the SOM
>>>>>> - PMIC GLINK
>>>>>> - USB0 through USB6 and their PHYs
>>>>>> - Embedded USB (eUSB) repeaters
>>>>>> - USB Type-C mux
>>>>>> - PCIe6a and its PHY
>>>>>> - PCIe4 and its PHY
>>>>>> - Reserved memory regions
>>>>>> - Pinctrl
>>>>>> - NVMe
>>>>>> - ADSP, CDSP
>>>>>> - WLAN, Bluetooth (M.2 interface)
>>>>>> - USB DisplayPort
>>>>>>
>>>>>> DTS Dependency:
>>>>>> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
>>>>>>
>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>> ---
>>>>>> To: Bjorn Andersson <andersson@kernel.org>
>>>>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>>>>> To: Rob Herring <robh@kernel.org>
>>>>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>>> To: Conor Dooley <conor+dt@kernel.org>
>>>>>> Cc: linux-arm-msm@vger.kernel.org
>>>>>> Cc: devicetree@vger.kernel.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>
>>>>>> ---
>>>>>> Changes in v5:
>>>>>> - Update base commit.
>>>>>> - Drop an already merged patch:
>>>>>> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
>>>>>> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
>>>>>
>>>>> Please keep full changelog rather than trimming previous iterations.
>>>>
>>>> Sure, I will restore them.
>>>>
>>>>>
>>>>> Also, is there a reason why you didn't pick up audio and display chunks
>>>>> as it was requested on the corresponding reviews?
>>>>
>>>> Display-related changes have been merged into '[PATCH v5 3/3] arm64:
>>>> dts: qcom: Add base HAMOA-IOT-EVK board' and are already present there.
>>>>
>>>> Audio support is still under debugging due to unresolved issues, and
>>>> it's unclear when it will be ready. Would it be acceptable to proceed
>>>> without it for now?
>>> Audio was sent to the lists, so this is confusing. What was the point of
>>> that posting? It clearly said:
>>>
>>> "Basic test is good in Hamoa-IOT-EVK board."
>>
>> Additional issues with audio were discovered during further testing, and
>> the current audio series on the list is not suitable to be merged into
>> this series at this time.
> 
> What if the maintainer had picked up that series, with the issues?
> If you uncover an issue, please respond to the patchset, descring that
> it should not be merged (together with the reason and the description of
> a problem).

OK, I will inform the author of the audio to do so.

> 
>>
>>>
>>> So was that true or not?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


