Return-Path: <linux-arm-msm+bounces-53696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89553A82EFA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE5761B8101F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 18:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FE6278140;
	Wed,  9 Apr 2025 18:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="grTJTIaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F5126B2CA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223953; cv=none; b=sbG7dO7/cpMzVJe2wiwaB9m4IruS3y+PMMRf/0gD2KESmQDcT1OEkSBorUi/i90OLu6P+LliTPPVRGdXC4nIdX7QU2H3gqClmcKR68cE5qHW7swFwwVF9MGXgjEMyA56Pq7Hv7P1fzF9fiL00Qiup/DJFOmh/ZWnijvGnh8IXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223953; c=relaxed/simple;
	bh=AI9YxaHUdkFH0+ZfIcwV6u5b5F9PgshpmXiOT7skFJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0dqi0kMN186g5AMsYDUeEscGKP1kCNzZm8cNlnalTCuvtI7n4KA1B1L/9cOnU8NMCTFgP/iSC8YlcmATWIv2bjjfYcwz4I9LoLEjvCxk4GARS+ejVvxd7B0X3lDAJNqeFtvCYBZYfDmx740dZcfA/7lcORZejMoytyK0HU+htE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=grTJTIaq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H4KIY014992
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 18:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqf5MTz4sL9bNwFSw+g0H3Dwlf7C/BX0UqReS/yNI1Y=; b=grTJTIaqAyhnryqN
	wuWWwTFO2+9TrCBetktcTXDP3XxTtu2xu0+aekKM8OyKKPJ5uGG9BvonzOKuHSkk
	kBQQkD7opkOdeFGAv7EJPQHDnzQtdiChblubxAVk8A7I5nG6n1zdx0ooX6iu6V/L
	DeM3WmuluqPcSD9lrOn+ClEVl0dn45tG7gJ+9uz7OPih1CbBgjeQoIz33BO2Cj/5
	ttszJwlh6ZIClHRH2Bini/j3doveYUQTR5mnMN7IiTMDKhAFIXsbF0q7Vt6m43PL
	MPWJxOlFgw9ctxuAX4MxYP0HN436HUcJGqBVK8zFVQdRJLLfoS5HhtTJ/zqSykJ7
	+hdExQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbumf59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 18:39:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so6107436d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 11:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223948; x=1744828748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqf5MTz4sL9bNwFSw+g0H3Dwlf7C/BX0UqReS/yNI1Y=;
        b=Kd1+dFhhV2CHrVtXHeShMR03pmmQZzqfuLs6oQvvz3dsU5oyvWRZ8Wf7CN3S//xrRq
         Yxqgft9tvILG/M4eopdr9/DlQPzdW64VnsYEAyEMp2Mm9xuz4nHq4YEE8ED1m2e0vg12
         TAodYS7SLFEHXHn7vifpmC1sGdiV2f4FN6XOWNphv8JP/qa9KGLEYZtYuah9jaH4qNgi
         lzrjeglf3X4KIawcvtrzwna90VQaBepCPM8YT0Pym/ebnUcbfruIV2XykOmtdBUnEDsj
         t6rTfEaJSROwniDWT0krDrxG2nTsFRkboq1GVG9l/K5eRTQDkfIeuLRct9LwBreNWk9a
         7JDA==
X-Forwarded-Encrypted: i=1; AJvYcCWkzUSUgfYb8ZNnnMK2PKud7kB14lhICWF1QAL8UoHlYGZRFr0u1wHth05ZYNknbPxC1PHY3wTP3JXzmxWN@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5f9LU4M7O1YJcjVaf64xsyFKDI1eO/bAke32aTIbCcCFmZyI
	UQMGjQoD6RZ58tR20reZO23SjuwtXAoqwSgDz6P64IyOjn1adbrutEeLmluyAUYwpHYEM8xRgya
	Mt59FuuGwJZPv9rCqPKsJmDbl6GFFIPh1ZZ+UOTNFy1dEXLuIo5z1iLjV/OCoPrD7
X-Gm-Gg: ASbGncsn5orUIa/R6twZa21GzvhcA2kLu67Jv1oi4sUN1onQ7L7yJVhyh5rZLQKMbYz
	qT/uMpN2b1t5ygoVfP179N2BPNknJL5QbXeWsThjA5z35vmrNnSrlM4PV8YYqsbA7gUO75q2Gsa
	esk4MHT3dafq/aL9hwS3rBGTG9T+Yk6jFNnv+Mjcw/y5XuDbq/PSlVIqz5NuuvFaLkCIdJ346cf
	yIFb2yHn0fIEIUA77BGsXDUfCBx7jZImmBRYPAYIOIUrziJ7gQeklKFxf7qYNrZdFGqY4K3xTXs
	2vnZHvv+K83o7MMsHXHW8ERfhixdJ6l/nysBnJiThGL8cx2yeCukXXG0ycsy/I9RQw==
X-Received: by 2002:ad4:5c8d:0:b0:6e8:af1b:e70e with SMTP id 6a1803df08f44-6f0dbc7d4admr21390446d6.8.1744223947908;
        Wed, 09 Apr 2025 11:39:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtByW9xt2uR5vzFzf+TpdmkDJ75TD1GMSbFIMd+F10uBRLBJ7jIOFCqqqfHNK6a4HMz6a6wQ==
X-Received: by 2002:ad4:5c8d:0:b0:6e8:af1b:e70e with SMTP id 6a1803df08f44-6f0dbc7d4admr21390386d6.8.1744223947588;
        Wed, 09 Apr 2025 11:39:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4204sm133546366b.116.2025.04.09.11.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:39:06 -0700 (PDT)
Message-ID: <170e4c9a-bdf4-44f7-9dd1-9eed31fa27db@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
 <0YH8BNtmMcywwRXI3xHiLyB_zFED-XbjzCyyI1Vc4184BPadVJ-GWj23lpEwaXEHqDPiMiraMsWlOd1qA_hiog==@protonmail.internalid>
 <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
 <1b649ead-f6d6-4fb0-b5ac-02cf2dba92ca@linaro.org>
 <CAFEp6-2kamY6m_vzE0gMi-QKCRYf42RjMd7f2ud6bte=aL9mRA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2kamY6m_vzE0gMi-QKCRYf42RjMd7f2ud6bte=aL9mRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: foROeCrI-jvM7xECGFepF10xRlW2j6oX
X-Proofpoint-ORIG-GUID: foROeCrI-jvM7xECGFepF10xRlW2j6oX
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f6becd cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DQTqHzjkEM4X2CI68noA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090122

On 4/7/25 4:56 PM, Loic Poulain wrote:
> Hi Bryan,
> 
> 
> On Fri, Apr 4, 2025 at 2:10 PM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
>>
>> On 03/04/2025 11:22, Loic Poulain wrote:
>>> Add Camera Control Interface (CCI), supporting two I2C masters.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>   v2: Reorder commits; Update dts properties order and style
>>>   v3: No change for this patch
>>>
>>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
>>>   1 file changed, 50 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> index 7fb5de92bc4c..43fcb4f40a8c 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>> @@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
>>>                               bias-disable;
>>>                       };
>>>
>>> +                     cci0_default: cci0-default-state {
>>> +                             pins = "gpio22", "gpio23";
>>> +                             function = "cci_i2c";
>>> +                             drive-strength = <2>;
>>> +                             bias-disable;
>>> +                     };
>>> +
>>> +                     cci1_default: cci1-default-state {
>>> +                             pins = "gpio29", "gpio30";
>>> +                             function = "cci_i2c";
>>> +                             drive-strength = <2>;
>>> +                             bias-disable;
>>> +                     };
>>> +
>>>                       sdc1_state_on: sdc1-on-state {
>>>                               clk-pins {
>>>                                       pins = "sdc1_clk";
>>> @@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
>>>                       #iommu-cells = <2>;
>>>               };
>>>
>>> +             cci: cci@5c1b000 {
>>> +                     compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
>>> +                     reg = <0x0 0x5c1b000 0x0 0x1000>;
>>> +
>>> +                     interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +                     clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
>>> +                     clock-names = "camss_top_ahb", "cci";
>>
>> do you not need an axi clock GCC_CAMSS_AXI_CLK ?
> 
> AFAIU AXI is not involved for CCI.

I'm not able to infer that from statically provided infromation, try
forcefully shutting the clock down (both the branch and _SRC) and
poking at the CCI

Konrad

