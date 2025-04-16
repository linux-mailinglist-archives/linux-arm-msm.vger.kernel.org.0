Return-Path: <linux-arm-msm+bounces-54533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5187A9085B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 18:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F6917A9B5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 16:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFA1211499;
	Wed, 16 Apr 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmzkTcl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48703212FBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819759; cv=none; b=fgK3puFpa4dlmPmSpAP88Vr7eJcRw91YcImYdWFEGWZcHj4nhia8LVsRpR8EbwvcFKlidgRfAqB/Dhpze8EmNdKbqmD1nqr8Av/5PzI1kRnd4+YaEf7fwErffje6XnmsNel76YnnwAE8R7ZZd4uVrhaAb3boxSWi5N4yZ2Yq3oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819759; c=relaxed/simple;
	bh=FwIeW4qgOB5haxONFHXw7a6R1kS+Pg8/36trjRhroCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHrWqURW5CxQCr4OThN7MOefSVx3wFVOXB5hLAiLhm70wyjgdAeeRB8mnVWplhtwO7K1gGccz8SjcR6WC1TGcKD4DWD3LV78K96a+RpTlGnybWXDv3b9CK2B7R+ZA36xpja9vC0dclAEzUALwe6NCfl+J0NDaYotMv2B4zYueHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmzkTcl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mDmS032763
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=; b=AmzkTcl3OozdoeXI
	QOXa/7IT9EFhYmScZ021lQK85PBqhd/1vF8wBbc/9HjrE1131NbqkhogJz5pWlce
	T4PoC4Wvfj/9JUB/KBOVG1CYWgl34wZOo1J4qIEJlME9TiUuzZz0F3lcDvAJR3X+
	5Zf9uCwfTBXVamSw9o6zEnV3uibaPIaF1nPaJ1lP79yQRNUUHcxmcKJX3kItSKvo
	sBxrhH0+QAW3OhNCw83pBVU/A5HFGu+SfGJRTledNqAQUWCP/VhKMXVeLnsBR+v5
	B1OUXkFys97L5RMOsRgWvyfNgFPNeONuCNVzs2z4m2/w8CSZFEOouSVyUxDCEKFA
	iQj6lg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vm7ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso168775585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819756; x=1745424556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=;
        b=dgbLCtV00tA1qCA7SVllcIV4G3otjyGm672Jh/cSspti28g3B9YbTBDrLLgdyTbtih
         CATUUrsQuTBx6mh3+0N8Ib1Ff5273JYCpkpMB9gnYwrBt6w4KHxnx5tcWKbYA5WLnPEq
         g/K7Me9ns2uRLOoZFeTQ5MUblY7JxWaHYv3Ztk334V7gvUtktTckUdC3ITkNceQCwZ2d
         X2RTDkKF1+M29wY8AmlKYoKVE4y1SKAiNXnG1gwgroeGb159Mi8fbwtvuQG2yVhWMGCu
         jmlKJUUbBw5Z+F0fraJxiVtRL1cpoKFCo4ArTqdVo8wU8/oePXA8dP5NaSU6DiKnSNSi
         DRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWO4g6QQ8LuR+bq2bFEz9UkrkGUXu/JmxwMHXZIR+Mb9TKnp3nkjD4EF5FzISByw+tCPk1s3fgO0S5aIq+@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsyzeHwF+ABwB6SKNoO4rveAwuTyvs/KWpJ+lSIz6Vs5654ux
	uUH/T43D5GmOESjWlYe2rs7uIomGsJFsXNFtz5ilJUWvIcJMLBfKE+ci4VtjkmP2joKabvmNHhG
	yk7g6/3eAHwXcrar+pIfXQm9QtMkSa0SK1FnKibb3Skr04gHaxrRbxvXntNVu6KR3
X-Gm-Gg: ASbGncuJ+7mUk2/XayCiNoh0WH1gnLBOOJSmOsjlfZIVDF+cPFrOT2gOQduxjimIXy7
	O5FNNFb4cYxfOG/nxp6UuO/8KZBZo4NBnBMdm5cnF//pyETZQ8rlPqkAQMYLPByqP0Z1w2bzwZ+
	/KsMU5AHOzy8sC0Ju6ZAqnlLfsU5NWRNi+/Rxi5/MS6Hfmdva2UJlZ9HEn/N048hQieIC+Ahobl
	b+3QZZcbm1h6XqA003JiLN2wjAVLNvWvqjtbKuhH6+Qhy3F8XsumE+3tmcI6Sm0lXW3O6RStBY+
	OOhTag5yzFaxSdWJazL0MgLekuQyznQXq08J49kUMRAyM0R9VE1Nn4fa4kBHzV5irj0=
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1424006d6.2.1744819755803;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqTEn4ZwnP85Wl9OFLZVFMob3CDIEgC8OxR/srPtQNfxgXZMTXzLdDo2GRaFTa3vUSJvc1xg==
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1423916d6.2.1744819755308;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d127970sm153280866b.113.2025.04.16.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:09:14 -0700 (PDT)
Message-ID: <b6c941d3-85d4-45e8-ae69-9d9e4dab8440@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 18:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
 <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: opd0dYK5hBzb_-_u7OuTo8QI5_3ZAhie
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ffd62d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=eWPriOLmkRKYu5JWBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: opd0dYK5hBzb_-_u7OuTo8QI5_3ZAhie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=939 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160132

On 4/16/25 5:29 PM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:14 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>>   1 file changed, 187 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d1300..83640fef05d2 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -7,6 +7,7 @@
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>>>               #power-domain-cells = <1>;
>>>           };
>>>   +        camss: isp@ac7a000 {
>>> +            compatible = "qcom,sa8775p-camss";
>>> +
>>> +            reg = <0x0 0xac7a000 0x0 0x0f01>,
>>> +                  <0x0 0xac7c000 0x0 0x0f01>,
>>> +                  <0x0 0xac84000 0x0 0x0f01>,
>>> +                  <0x0 0xac88000 0x0 0x0f01>,
>>> +                  <0x0 0xac8c000 0x0 0x0f01>,
>>> +                  <0x0 0xac90000 0x0 0x0f01>,
>>> +                  <0x0 0xac94000 0x0 0x0f01>,
>> These I think should begin 0x1000 earlier and as a result be 0x1000
> Hi Konrad,
> Thanks for your comments.
> First 0x1000 bytes of CSID are for secure usecase. Actually CSID register address space starts from
> 'TITAN_A_RT_1_CSID_WRAPPER_CLC_CSID0_HW_VERSION' which is 0xac7a000.

Alright, thanks

Konrad

