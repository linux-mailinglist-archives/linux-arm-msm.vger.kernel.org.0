Return-Path: <linux-arm-msm+bounces-57294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 398ACAB00AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFB91BA33ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80AC284B32;
	Thu,  8 May 2025 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx1VbU0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC551284B49
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722713; cv=none; b=hdXtLGVl4++bjP7YWn1iTAXKeUk8mu/dkpI/10ibaROnsJ3D0PelNhT/JT68vswBrzpxcZkCMIcHlzvR64MjM3IQxJ/F67hXuN0X48rgD+gq/lobCZz3SDUrkTr19oTclCvz/QFGBIMHgFd1zJ2elj05aR6jWckkVL9NbswHZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722713; c=relaxed/simple;
	bh=kwiaz6X37w2p+rGl0TL9E9E/OK/1JhUxEEvizn3ahAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouPU/LQ77HC2iXiIa2mpfyRLHt+YzdTc5KA4HBp7D3PcBeFGW15LRtJKANTCj32shhgJ/kXsgLrVOj84bYrKzyYToyO+v0gsrqoe7RLiBaIMRVFicp1HGSjgj6iKvk5gw+BjrneHbcOuC+rjnC/88u3ASgm0L4n/preWnJ0YCQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx1VbU0K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548EGKpB016373
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 16:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSgwUqkSfEKmNonIWMkEu2HDYErCYBP3rkqztUMDifA=; b=gx1VbU0KJBasGDR9
	9olNE3xQg9wIMhXlglOw419otAS8RjI9tm29pMl9cuOGntVpwelD3Hnod88u/nTa
	6rKuCG5ENY+tx3Ta8FQbqfEDXCjNAJLeLwLE2DCvDPQYTvEdO8co67Xl4Xe0a6AJ
	TEA4LQclneCObVzAH1hLWrDxB+LBYHOXUUpYbSxdGUVvMIJGnhuXSWXHKJgHx7Cb
	E7kx0rPC576uavyDgHm3/KWSeegXuj0sb62z+36kFF26TsRlYYUS8qTPNi8TD0Ot
	Vx9HDrUWEiDoVO3c2p/ElBGGDQ1CB3eva2yhiPuDTKfSkoT3NlMPLBLbdK5AFfte
	QEaZNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8syph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 16:45:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso26215085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 09:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722710; x=1747327510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSgwUqkSfEKmNonIWMkEu2HDYErCYBP3rkqztUMDifA=;
        b=Tt9JhG7We4eNmhQ8V1OnVn8WMBrD5Gmguwiv3pxqEZaV6+nefG/NB6R/kozW47ntFw
         iGFlXpJDtBygMvcHjI3xTIJuyysEms2pFthte0vVnsNTnVPuNVNu+qjBMrWissn/7zWT
         EArdbHvBK1cCEMxkNxPAarLgaCBXGsvz61tylaChV+tC936p/9MhZYkiiy0nBjH9GNtT
         EZU3zqsmOqSFlZtbiH4dTzYvVJM5PeQ2UXjAGIjRQFAkDicQPxhx4hr1TfWIfxymLhfq
         3bYJ+enuHAcXUOI79Ar3s/1a4jc6s/E1J0gXtjfvdHRABvXgaugKVwF1RwpvLs+kOPxe
         9eFA==
X-Forwarded-Encrypted: i=1; AJvYcCVa2f4LJYYUs0IUbxsdTX1r+g5LFPxGziQOd9HAP8VvV1/DWEkesO4LzZmFdRpKKemahUbsXXeCwvQzQJlr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rILG4zmOS4Rlr6bmJ5zce1nHUHO6CxbdT05ZTlmTr2c4eGp4
	vmofx9zOeknJS4sJbGI3xk+ra3oAMDrizZuN9IJuNaATF9KN/FH0joYwhuauRrSKRmDnFMV37y2
	jQ619oOeaW/LpoEUIth2KPXXBDv7ZagJmrSKGdOZuV2OUfLhAt9WUVM8yNuLHMzZi
X-Gm-Gg: ASbGncucWK1B44/qLpAY/qTpNE6LwEjuIZgrDqySwwkhbm8A/08I1P0xHVWLDQphp79
	aRiDDKjreCfeXokN1OJGKPQpffXrn6R7yViBxQ9k6FAjnoI/HE38tjpqh8ZZMcXij/zLl3QbH0U
	nNSMohsm1Y0qye4N8X00dVDJ/uGLOqWKQ3AxEOIC4kKgRNQ6WbmFAo5K2f629qtfbnGDWAMZXuM
	acWrBXEp0+2BkapKDYU9PZ+FBnpjgqTIHqK5deh2m3bSuM6ksMRo2keoMIKxfGsOWcab/iRhEnL
	Q6eBE5j5wR/5JLR7N9Gsc4iCkJIH2houQg7XS/ePorZEAoy8FnNDYBCANHgs+5KD5NY=
X-Received: by 2002:a05:622a:44:b0:474:f601:c21e with SMTP id d75a77b69052e-4945272e639mr384761cf.5.1746722709678;
        Thu, 08 May 2025 09:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjCAPrSx/92bGi1x7He7ajN3/L+4Y9gypA2HsWqw0iZxERYDr2h8wCQykaB1fY5i9aXZ5LlA==
X-Received: by 2002:a05:622a:44:b0:474:f601:c21e with SMTP id d75a77b69052e-4945272e639mr384241cf.5.1746722709030;
        Thu, 08 May 2025 09:45:09 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bdddcsm10190466b.140.2025.05.08.09.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:45:08 -0700 (PDT)
Message-ID: <b488ac7b-46dd-44e1-a132-c92daf95b421@oss.qualcomm.com>
Date: Thu, 8 May 2025 18:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
 <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
 <82e6c229-8852-4ae9-add0-5fdc0a15f7c5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82e6c229-8852-4ae9-add0-5fdc0a15f7c5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7qP-qjJbQDEAQoiM372Ht1tnUc61Ck6t
X-Proofpoint-ORIG-GUID: 7qP-qjJbQDEAQoiM372Ht1tnUc61Ck6t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NiBTYWx0ZWRfXzp1Wd3lLWLwt
 tj7L0+d6I0kARDmo/jauuL4O3gJvmdoHoaBccEhSKxvW/YUJc435pTwjigEbZMDIGYZ75PnETfH
 BfnzI+zPYVNtJTPI7dzhJMkPZ7Y9X8i5aQtsjsZ9uI+ycn4bHzdXeifW5Mfjx3EY1diaGvTi8t8
 F+Y+obj0H19V0XSZXbzEm/Qytvzt9Iygv3vrBwV0vdgXXaXvcSeEFOCwaq9y0GMEfR3rCeWUxUI
 rAEha5moS8Rlt4C2Nc1CD31Zu9QD7pcTsUPyykTvGW50uspcunkzqsTtLpy7766ot8bezg9kIr4
 zPxPfHX0fnaB9PZ8fXW7H5brrq6aT7VaZFfePFhab25V3c+nZ2WzgmveIQCe2+/3WFnnC/pw2XO
 bWGi1e8ri0GCurKdDZPJQcN6rt6AMuZ6M7FPSaT8L8VagE8hATic+HEvRXlJ8uSJ4E5lW0ui
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cdf96 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=FNMLLXcm4HOaPzSYPkwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080146

On 5/8/25 6:38 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:24 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
>>> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
>>> through the q6prm clock driver.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---
>>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> index b11b9eea64c1..f3859d805ea7 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> @@ -11,6 +11,54 @@
>>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>   +&lpass_rx_macro {
>>> +    /delete-property/ power-domains;
>>> +    /delete-property/ power-domain-names;
>>> +    clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +         <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>
>> TX -> RX?
>>
>> [...]
>>
>>> +&lpass_wsa_macro {
>>> +    /delete-property/ power-domains;
>>> +    /delete-property/ power-domain-names;
>>> +    clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +         <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>
>> TX -> WSA?
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side, Unlike sm8450 dedicated core clocks. Core TX clk is used for both RX and WSA as per DSP recommendations.

Please leave a comment as it's not obvious

Konrad

