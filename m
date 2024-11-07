Return-Path: <linux-arm-msm+bounces-37263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AD9C0933
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 15:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB313284343
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814F3212F0F;
	Thu,  7 Nov 2024 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYsKAIp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AB2212EF1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730990868; cv=none; b=CRahbuiieWOs94dJ8sKn5wqKwocR0NgiXfZLKLuXe71bHfwV3Q+7OEsgJQ+lAeVk7hFRBbvPElne7IaFiGeIHB/YPuiVKCYWg17bvdUyMIs681dW70Ds/eUoVhMxWu9bNhHkquKcBeji/jIGkhvQ08otu15DiLGp9LZ0Wi4ZoH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730990868; c=relaxed/simple;
	bh=ibu2RSkOtegzXegdPneOrz9OnjOT7hzMRGrzeeSwskU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDwvXXbX8i3inuiIZLlFc/KAHqdOYsWBcO6kTKLsRThYBCybz1pJFVkp8JdZEdYEtRxP2upVW7ZSysFH+WnPw/CW6Ikwu4m2tp+yvBWwtcDY/09CwXqpaurBYLEfGko0zboTp5Cavo5ULN+iEND2HW9cxks0GkeUACtj1D7F2po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYsKAIp2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A76oj0q013219
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Nov 2024 14:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbDNBEZF+ivxTJrlQcBDGbzMiej5Dmf5hJPNwms2OQ8=; b=pYsKAIp2GMvy17lb
	er+1YLkbGiRK/G+W6pw8GjSprmC0eGZ3dQtboU6D+crepbVW9SDpxS1CKf+ahq8O
	Mck8LaK5lJEri+ViusI+pxrUeaIolgQslr1nT2rNyeZECxkYZQlvarVztrBtgEtl
	pVANzNhJBDXodMVF1iRiZU/nIEwWO8tvcNj+xOph8GFceAdVeTQo1mESgQ4kq0dM
	aOXhrQnnXdaEMDaHu2G6S1TauWnuUoWHIy0z5Ue/3mM/10x1p7Ye7P7YDtRSm3mv
	BeMyiSptgYUFtJGlFHoB08NXGU7o2fluHZuSvmWgjrBlG0l/E80CcwTloHyBFOwt
	MotClw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qp2rxma6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 14:47:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-84fba3e0787so29269241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 06:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730990864; x=1731595664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbDNBEZF+ivxTJrlQcBDGbzMiej5Dmf5hJPNwms2OQ8=;
        b=GzGZkh4l1yt+AwwfECwE2l1Q+7OXfKdo5LTYB7GEedwvbCedaqz+zhxrJra0Jsiext
         Fmp04z1Bcz5hd/5EUO0ifkHs3VgsdeUnYfftBQkN4Y3uSwYiBreoLGhZPtC3TLvQUCiG
         fb7bMwDgvbTZy86o9g19Qr5MzGtjzYJXc/OsfQJEoAPlAERXD+jKs3To2wXk2efuyN0h
         Ya+mePSnJyFcWcZrSMToCG7P9rLr1eITWiwKoWJ/ri32cEnc+MniN3fg/BpsNsOyXytl
         ogCSg1+J+sViaMGED1rfP0QqrffVS7K6r3iV6aMkhs+bf/6Ivkvc/DbB4w6SzgFmlArP
         CxVA==
X-Forwarded-Encrypted: i=1; AJvYcCXZemDforDbESk6Qyw40awSSmnL9MpSz7KKSIOf0E8l+arD7s7heJSlWIRTRzvcbqGZUtWBC5G+kYmjKMx8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgw1Kh7eZlHcPvdFxB7y0pvL0goE5Y+l2tF4PLcW9UblmPgZCW
	tuYDn9s1tiREnjofMX5fysnEetHa6EKpSGkdSovBQ4mExF5Gz0BIKQUeENoyv8/TBw/buf/qo3z
	P+x58g7mby9bSb6FfL/dEPnpMT8viuVExXc3FTGs8q7FkFXTdAl+gnuh2tWok6jF3
X-Received: by 2002:a05:6102:3c94:b0:49b:ba74:f7d0 with SMTP id ada2fe7eead31-4aadebc2f6fmr164475137.4.1730990863719;
        Thu, 07 Nov 2024 06:47:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFnySNUt52yfwbYGtiZv6pMalDbRXaP/F5VF0eyl6nq8yvshxs/YJIBsx+RY4YtpLEbZPyUA==
X-Received: by 2002:a05:6102:3c94:b0:49b:ba74:f7d0 with SMTP id ada2fe7eead31-4aadebc2f6fmr164457137.4.1730990863224;
        Thu, 07 Nov 2024 06:47:43 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4c3f5sm103014066b.76.2024.11.07.06.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 06:47:42 -0800 (PST)
Message-ID: <9bd3d4e2-aba1-423c-946a-f5c60da71497@oss.qualcomm.com>
Date: Thu, 7 Nov 2024 15:47:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: ipq5424: Add thermal zone nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Konrad Dybcio <konradybcio@gmail.com>, srinivas.kandagatla@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241104124413.2012794-1-quic_mmanikan@quicinc.com>
 <20241104124413.2012794-8-quic_mmanikan@quicinc.com>
 <91ea0f03-9bbe-491d-9056-ebd9fdc73bfa@oss.qualcomm.com>
 <8cb665f5-4885-4853-804a-7313decc719c@quicinc.com>
 <2c7ece9d-95e8-4d01-a9da-c1d5d7388771@gmail.com>
 <fc676574-ffac-40d2-aa47-8d7cb61b5e3f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fc676574-ffac-40d2-aa47-8d7cb61b5e3f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AGSurXFcRhoUz9ulh_0PnrpqnzMTRieA
X-Proofpoint-ORIG-GUID: AGSurXFcRhoUz9ulh_0PnrpqnzMTRieA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070115

On 6.11.2024 11:25 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 11/6/2024 2:42 PM, Konrad Dybcio wrote:
>>
>>
>> On 11/6/24 09:47, Manikanta Mylavarapu wrote:
>>>
>>>
>>> On 11/4/2024 7:21 PM, Konrad Dybcio wrote:
>>>> On 4.11.2024 1:44 PM, Manikanta Mylavarapu wrote:
>>>>> Add thermal zone nodes for sensors present in IPQ5424.
>>>>>
>>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>>> ---
>>>> [...]
>>>>
>>>>> +
>>>>> +        cpu3-thermal {
>>>>> +            polling-delay-passive = <0>;
>>>>> +            polling-delay = <0>;
>>>>> +            thermal-sensors = <&tsens 13>;
>>>>> +
>>>>> +            trips {
>>>>> +                cpu-critical {
>>>>> +                    temperature = <120000>;
>>>>> +                    hysteresis = <9000>;
>>>>> +                    type = "critical";
>>>>> +                };
>>>>> +
>>>>> +                cpu-passive {
>>>>> +                    temperature = <110000>;
>>>>> +                    hysteresis = <9000>;
>>>>> +                    type = "passive";
>>>>
>>>> You have a passive trip point without passive polling
>>>>
>>>
>>> Okay, will remove this.
>>
>> You most likely want to preserve it, while keeping a sensible
>> polling frequency, so that userspace will be aware of the current
>> CPU temperature. <100> sounds like a sensible value here.
>>
>> Konrad
> 
> Temperature sensor's present in IPQ5424 supports interrupts.

Correct.

> Hence no need to configure polling frequency.

No, that interrupt firing signifies crossing the temp threshold (meaning
no updates beyond that) or the tsens watchdog barking.

Konrad

