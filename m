Return-Path: <linux-arm-msm+bounces-81754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B28C5B186
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E58A3514FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDED31A2392;
	Fri, 14 Nov 2025 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipZxZjBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFB23ZDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AA02264CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763090650; cv=none; b=m7BiU0b6T/VwoQPpep/w9hV0lHIDHJEzKGlVohtxCvNcECFYG6y6iOqQ4/r84oCGfE/7Ey/DqlovhdZ28jAIji8qkTi8229VTk/T7d6AEVRi3qXGf4+X0LHVWLQzsJOxLF9GN2mQ4HFKUNUtM9Ff+oLP3CXCZCTPXvBXDG5sJ5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763090650; c=relaxed/simple;
	bh=IprDe4qrgEnbzgwl5fo+9gFxfBlcWMJLzda+fR8+/jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiM5tmZlmGpkHiCR20EtCRw5rH7zTvhatJbm1mOnHJG/pZjgWi0Jls2keXuCX7vCm84nxqKefZJMjZRmsMMtUDAQobX2ndP0hA5R77EUZt7HHnvFIeKR7l983RNGnojFLie1gVYJ0pqOln5hu7CTqzkW+iCCMbJFxZJ7YHIulMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipZxZjBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFB23ZDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADManIQ1745336
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNxNrJsDy0YUjFlR7ksRiU45D5obzg7cc4C20QxDE/Y=; b=ipZxZjBlpn94HSAs
	7nAYreD7sc9lb1a5s64/C1gL+YDaZU1kYqnZ0JefMAeevn4XEfyGOEevoXn8PTzm
	l+Zi7KwMtSlJIa9ULgHzo4S50n1R7wd/VOudQn6+tSEA3J3NffTbyyUUopW5rmgF
	D26O2PkfGWzf/fDVxRRiAhq07Bj0t2+7pNRh/iptzndjLk5H0f2uRuDa8FOuRg9q
	0RejwoVvmXZKqZUxObHqDAAzxqjTVU5qJzOjI/zjDG/8I2FDv7rSEuXaheFl/Tjs
	cbth19/AW3mEA/L1L5MHrvgXFdQQ9w3k26+p/a7fAjVRHULX24MCVuEc79Zp03sM
	evxg+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9egnqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:24:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso2173796a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763090648; x=1763695448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNxNrJsDy0YUjFlR7ksRiU45D5obzg7cc4C20QxDE/Y=;
        b=JFB23ZDvx+tKLD+gpWkg2/36OfP5l+C8nz5mpZiDlohyhK/ICWq166T6rLuG0MUm9P
         49B8D4lVq57FC5dgAdFr5TP80mmD69Jw+N4j6VdnciqleIXeu4zi+jAiNZDrXk9YmbJE
         GxZxm+SiT07ogYUtI9KIUgyq6RJ/VQaHpMbuBSaYxrh+KPiOB/1s+ll1d0do77sRqOGU
         Kht30YDg6O85KxbC116NYI8vhWOiGkEIClS8Qta984ADhWYFrWIHvHRb49+NRjJ8pWao
         a3TsWHC2eNixAzCc8QVYHN3XN0bRWTCmuGUFdodGtgrybmcpRMfCke6orrLVkXu5L/VG
         xIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763090648; x=1763695448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNxNrJsDy0YUjFlR7ksRiU45D5obzg7cc4C20QxDE/Y=;
        b=TOZRDTYFrdT0W5MDo8kTL24WKIMo23IcEQfWPYSZJecG10jdl8ttehQ+Tm4maAhy6z
         NRz7hS0zZXHbxi8jkAmY7KnUPmMOg8f9eu4RyhwgK2VQgrEEU4cbEOL0+26QQcrXiqJz
         zn3uf9ewSuTxM+pY0x/2WR8IoEdE0YfGdrsvBrYfu+kHUrn2LtOlMz3tx3mo/BudgAl2
         /far9Y1pIvCJQU4wCK5ryDIrDTSMywFb9Czea/rkPMy3mlCG/uoXO5praP8ZJABfsrnr
         bG2w5UJO1ZCF5xb1Ki98BjNB9w5Unu1mbqla0KP3j7yuEESEifP2gB0R1Rr92iydiHTW
         UVGw==
X-Forwarded-Encrypted: i=1; AJvYcCXLj9bvdcXGqBscuftrdoaG50g8Uo3qdptzh1kLmqGlo7s7+SEkg26sv1uBTeC+RV7AVoc3caNMogTzS7Qk@vger.kernel.org
X-Gm-Message-State: AOJu0YzeaTti8EPiFXmURX8D0+pSq/zK/5mthffkSio9x5Paq6h1FtrT
	PbvAU3do7fiSj8Ry9Za8GpHNgP+0Gm5SRalS9jJ4RiEUqvsgXuC7HcM8H2ARwgXwQXTj+YAabGK
	acObNu6TM+gDqDCQ0yXIdEKozwc1xLgCQt/JRZ+dj4asbA67qVZVJsQpmcJk1N4Wjz2KW
X-Gm-Gg: ASbGncvv6Xg8k6gCKv4jE77OCioYsC3tmIIc2jP+K7JIg5hAATiugAlsuIdoEhNPku2
	k9hTs6yPPQ4YjrU9GMd0sj2bJwHJrX1mhd9258Iv20QJAtqLtpfWZIkroC2n5av9iF70kK/+DjJ
	4dRv2aUANChkXibtCeEinemgp6D/jW2ykYBWWleZfH9V8g6TmYTjl9bFONRsaW6jIQ/eFxAsXtE
	Rsm8Gf+9OTvpWlGs3Y4xfeIOqMIqH+dNE//eoVr3vmT5SQwYUZDr2ZSYKHTb+kkYeDYTXRySaU2
	CrxzsebjPZf1S0JDiAGybVkfv1JTm0NEm0DljKecjmAUsY9z4cw6jQ8r4Y/NWXrevccrGnBY1CX
	T0nlbpIZ1zexqx9cjXkb92GCSJ1uUCco=
X-Received: by 2002:a17:90b:3c4a:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-343f9e92a0dmr1838120a91.3.1763090647810;
        Thu, 13 Nov 2025 19:24:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2wHiv0drfPBC8W6GDpnf3DWvEzoDK4Gwj95uis+UUMkgLElPlSZP1kdkqV4QZv7KhWHUe/A==
X-Received: by 2002:a17:90b:3c4a:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-343f9e92a0dmr1838093a91.3.1763090647306;
        Thu, 13 Nov 2025 19:24:07 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ba611682cfsm666067b3a.26.2025.11.13.19.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 19:24:06 -0800 (PST)
Message-ID: <0b019df0-f874-4218-a7fc-222b0e35727a@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 08:53:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 0/5] PCI: dwc: Add ECAM support with iATU
 configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com>
 <176160465177.73268.9869510926279916233.b4-ty@kernel.org>
 <e9306983-e2df-4235-a58b-e0b451380b52@oss.qualcomm.com>
 <zovd3p46jmyitqyr5obsvvmxj3sa3lcaczmnv4iskhos44klhk@gk6c55ndeklr>
 <d6a33801-d4fe-40fc-ae19-6a2ce83e5773@oss.qualcomm.com>
 <d5byixqmmka3wm5jo7stfmbydit5dnqpxcczgwc2zu7ge3dc4n@47ukwyvj4oqk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <d5byixqmmka3wm5jo7stfmbydit5dnqpxcczgwc2zu7ge3dc4n@47ukwyvj4oqk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNSBTYWx0ZWRfX/MShy/SZLBFf
 fUxtqGpZbeeZPAwljvzgmtgC8gA78Pf7nIv4lVRZEoT9dLxomoww1bRKDl4Iv4VW1IyXNVWgKNO
 mcBRQV9L8i+wNZAV5vVtZXgScHYhm6/1NdFhRTB7tu046lD108cBWypI0Pvjx5486dg3d+2IMke
 6XnZb+WnhKswAXk6odkWmsHjU47IqOO+/CEkShPFLOXIU6INlDkulNGt8VSVXVhje76fTkab5l6
 +WN0W9LcvMIHhuQw0ZTzcV6evbN5YHDzE+szLsXIIa/WL3BU9ISqClFXQ6L2ZaKZpvUWmXVi/FY
 UuD8h25gEXeEPSHjRPZ217G0/zaG6wTPtEgAiz9vLF4cBsgDulWgLBI8Tjl1pWegzq/vY2e7v3l
 rL0wtsAfwx9smdyzQX+PxeUDBTsXnw==
X-Proofpoint-ORIG-GUID: MA_5p6DwZrC3MiTX7SVP7VCX_rntCYVh
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=6916a0d8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=I0CpK0KROK7xELUHsJQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: MA_5p6DwZrC3MiTX7SVP7VCX_rntCYVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140025



On 11/13/2025 11:03 PM, Bjorn Andersson wrote:
> On Thu, Nov 13, 2025 at 09:27:36AM +0530, Krishna Chaitanya Chundru wrote:
>> On 11/10/2025 11:51 PM, Bjorn Andersson wrote:
>>> On Tue, Oct 28, 2025 at 11:12:23PM +0530, Krishna Chaitanya Chundru wrote:
>>>> On 10/28/2025 4:07 AM, Bjorn Andersson wrote:
>>>>> On Thu, 28 Aug 2025 13:04:21 +0530, Krishna Chaitanya Chundru wrote:
>>>>>> The current implementation requires iATU for every configuration
>>>>>> space access which increases latency & cpu utilization.
>>>>>>
>>>>>> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
>>>>>> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
>>>>>> would be matched against the Base and Limit addresses) of the incoming
>>>>>> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
>>>>>>
>>>>>> [...]
>>>>> Applied, thanks!
>>>>>
>>>>> [1/5] arm64: dts: qcom: sc7280: Increase config size to 256MB for ECAM feature
>>>>>          commit: 03e928442d469f7d8dafc549638730647202d9ce
>>>> Hi Bjorn,
>>>>
>>>> Can you revert this change, this is regression due to this series due to
>>>> that we have change the logic,
>>> How is that possible? This is patch 1 in the series, by definition it
>>> doesn't have any outstanding dependencies.
>> The regression is due to the drivers changes on non qcom platforms.
>>
> Please be specific when you're answering, this way of saying "go fish"
> isn't helpful.
>
> By investing a little bit more time and writing a single sentence to
> share what you know, you could have enlightened me and other readers of
> this email list.
Sorry, for not being clear in the previous reply.
The driver is implemented in a assumption that config space start 
address will
be the dbi address. The driver is using config space start address as 
dbi address
and ignoring the dbi address provided in the device tree.  This 
assumption is
breaking other vendor driver i.e SiFive driver. To fix this regression 
we have removed
this assumption keeping dbi and config space as separate entity.

Due to these driver changes, we have to move DBI to different location 
(controller driver
has ability to move the dbi space) for this reason we need to revert this.

- Krishna Chaitanya.
> Regards,
> Bjorn
>
>> - Krishna Chaitanya.
>>> I've reverted the change.
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> we need to update the dtsi accordingly, I will send a separate for all
>>>> controllers to enable this ECAM feature.
>>>>
>>>> - Krishna Chaitanya.
>>>>
>>>>
>>>>> Best regards,


