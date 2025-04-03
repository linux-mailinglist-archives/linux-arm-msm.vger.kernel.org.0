Return-Path: <linux-arm-msm+bounces-53132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D8A7B091
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 23:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 529FD179B55
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37832205AC4;
	Thu,  3 Apr 2025 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvG8y7wY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FB205AB3
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713361; cv=none; b=N+ogbQOcW5rg+cT7LQBIcas6J9WzfhHuCQGapkdssFVPFBzN4NbbwBPJ7LPo0F9D34o1HZHH4IYy9cKrU3i36riEMw+zuQXf6q1JqDwjEQIXQpoY/8HJOdw5ka3lYSyZFACpHmOWw8983hlRv60Q0oA8otFF5rdIrNBIOpkvyl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713361; c=relaxed/simple;
	bh=LlaPfj4DUKuXPP98nymvRSQmhdWDT9UBooca9aD10/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVRZ7nXrCJ4UmtR2Ie20UY2G6aw12XgH4VvlrqXC3tgcln7yEIYCZtxp+pY50aPd51GcyDldSFBoI8voJYwjq/kTVUj2gK2myivO5fE2Jhch03X236zdL9rDPrb28UmQRAIe6gzJFoYVtF99DBACOpJdMy+XXAjVvwTRGcwLeW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvG8y7wY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533JhEav015921
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Apr 2025 20:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s28f5mtAS44+kte+MljByntcVA76CObSAGStiZKJ2DM=; b=SvG8y7wYV+4o1qAc
	A4FGbbZXQxUSjdTG4Sb+T1AmSKICqex8QA8CUPGsha2oiCpMff1gVYApxr1OV3ud
	aZb958B/Y+fCsoQGOo3B8gNrTv2UoKpYFsHGRmxk1yvpxvwA7iXES234tJIH8Mba
	m/QV3zzdEH3wPMqbdqS16CumOYUsavVj2kWkhlc5VdqL8zkMVcgdCqULN7NAKN3g
	bIQ+1s2YIY5H5pyHpfOaBQa9MTFRDdorBTEj7xjIq2gsZJ7VpEEwB3b3lrA6BkdG
	HS9G4A+c3Komo+1gC6pGpXijOW+alvanhYpHyq5NCxqaU3onTCdSJvm+78vr1gTW
	XheYuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbq00x7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 20:49:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767b8e990fso113231cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 13:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713355; x=1744318155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s28f5mtAS44+kte+MljByntcVA76CObSAGStiZKJ2DM=;
        b=VvBMjQ6PXwFxc9YVjBNoq1CI7ClE+Tl5zbXx9x8VSR7MSdK6vo49C8FeazieQKL37z
         6BhYeHiiF5WFbIYhIDTxvzDa6zGxGLcGKpaBu0zst+pz4g95C3CuiIqEA3kK99LY4lmj
         wVPBfj0KfStr/MHjgo8/wHjLFGYwhZ7QTr4TexpfdFFXvRpWv7s0AdYYVY+JLwNiYFtL
         UcyNLBdRSrEOx8jX/szT+v7xaS7r92tuQOmhtxM3Fm3B5S995gaWZ3RdUYtyU4QKje9l
         A3Kei6XFI9zVv6zhpQsb2o4gP7dbUdfvllXufpr1r+KJlTcTUdd60tylbjC1T6yh/EEJ
         TBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoDpit1o0H+tamr+WiP05hAL9fk6rmAR3+BvPLQUjcWsHXzTZWWq8zkZZXWVWPrdtc7bCbqoQRKSU8zGZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOesy/rK8vOdyk7fYr6CEEMmolEUH90Apjni1fVDzV8F4F92P
	SUA8bFLCMJdUT5nO0bQLV0s4l3V5ahzs8UAvj08ryK7IM/E+3DHbsjSREGjoCM6lVrePv1Xb5fq
	KgqwtzN3X6mTYaqzdKuqtr1jUPbs9Lax+Q35MmoyPz5xS4IsOFQuiLSU6AjRVr62c
X-Gm-Gg: ASbGncuV5x1932sRJNtiwfFJcHRiIbOYV/W3C5yqskU5ESH0LpR0bXqEdLQiLAai5Oe
	q8Y2ze3+NQIcYmoHiix+CI/KfQ++2zbhvdiLJnU7aZAxGfgPvLNyCoI5Jk63O1YJYqSW9DjDeWq
	/4eHfzPFYAyrph04o60HG+FLYMHupQMF/YBXT2HHdIuJ4U9qGdENxqa2yRQC7AqX3lRxhm/Jn+p
	U9rnDRbkpnU1Jn65uGhZI7I2ewrb1Wqc3oNBDrcg+1Al0x/4yLtb+Xcxr/S3aKN3/D2G+MZUt9I
	dyyVl2ag6xzyF0qc1O19a7cT/fylmddY7KTtiCnkSswrub3wheK3ciW9ey1EifdRc3fymA==
X-Received: by 2002:a05:622a:1347:b0:472:2122:5a43 with SMTP id d75a77b69052e-479249040cemr4830031cf.1.1743713355196;
        Thu, 03 Apr 2025 13:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVOq1tnzj3l0Pbxcf+TO8tXH+CP8A4Kfy0+V/nltEpUR+qVzOp0CXhKKc7GDQwdFdQ43jjFQ==
X-Received: by 2002:a05:622a:1347:b0:472:2122:5a43 with SMTP id d75a77b69052e-479249040cemr4829861cf.1.1743713354683;
        Thu, 03 Apr 2025 13:49:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm1366015a12.32.2025.04.03.13.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 13:49:14 -0700 (PDT)
Message-ID: <5de57d38-4cc3-44ab-87c4-cdd99911d343@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 22:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wJScXwsjOWiEsfjXMN8Ap9WV2yGBj-Co
X-Proofpoint-ORIG-GUID: wJScXwsjOWiEsfjXMN8Ap9WV2yGBj-Co
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67eef44c cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=OqglutSo4cKLNd8Ow6wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=775
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030110

On 4/3/25 11:32 AM, Dmitry Baryshkov wrote:
> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
> <quic_mmanikan@quicinc.com> wrote:
>>
>>
>>
>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in V6:
>>>>      - No change.
>>>>
>>>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>      dr_mode = "host";
>>>>  };
>>>>
>>>> +&pcie2 {
>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>> +    pinctrl-names = "default";
>>>> +
>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>
>>>
>>> No wake-gpios? Please document it in the commit message.
>>>
>>
>> Hi Dmitry,
>>
>> Thank you for reviewing the patch.
>>
>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>> I will document this information in the commit message and post the next version.
> 
> If the GPIO is routed on the PCB I think it should still be described in the DT.

Even basic s2idle can be woken up from, please describe it.

Konrad

