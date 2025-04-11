Return-Path: <linux-arm-msm+bounces-54060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC69A86606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 21:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970C83AC017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 19:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C515258CF0;
	Fri, 11 Apr 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Cfx20h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFFE800
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744398963; cv=none; b=EU1Eh11BXItDoqJ9y9bl5lWu/w0JoE+gh+wYwkEGbrSh+xpCspghGMEWLVKzTGKt9AdKa6vJQyb5z8xClujIbQoEuEt4vIFKCt1tJokU68Z13l7or7X8fkTqoeY0kPWQXH1KGJx8R+p1M1EstzN2kZA8g58T0pcaYi/X5LyKKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744398963; c=relaxed/simple;
	bh=pvUKWv+x28Ff+V4b7yI4dgwPdyvafW1Qmhe4vPUo9zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkWhnxxd65sfutMki5UKALp0UnHhDiIfvPTAzSh45d1I/dFL/vamGTp8ZRUUmHRJvuEVVXPGDM7pey27/ERO0TgZ+fj9d/D195MvJtXZnxXKWNlRnC8igcpuWOM7Pp6Oce8QJ10LNyFIupdokpZRWmbXk931CCLZWZ83CaFnGq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6Cfx20h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFGZmb031978
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3a305TDUC/FN1EUQW2b5Zguf/XdkfZu8nixf0K6aank=; b=h6Cfx20hyBOhK+gB
	iCRnoB6/z7j3fNuY0QhN7iKGYzR8PM3nPXYTQosOW7uTrfx6BB/7NYqvo/pLpZZW
	Ro34Q/wmSXadk3oCZMQYTqRaI/i28gnE9xk85gmmOJ+Y9PNTFzcuorbkXiZqSFJ4
	tIdYJZC9QY1GahVk36sIZ8SLkE2w5x0NQGYXM8UCD4vi19lBJhI/6NcpVVvUFUVC
	IEoVOgyFYaynisGBTtQ5+Pio2I3tnv8aLui7gv7GsKGCL8CbqS2v6QYNvxejkMN2
	ntNJgIMuM1aTpt6ZCBjfwlukDpLjspjprUkWmioR2AzVDe+2lF0gkEiF52tA8Kvp
	7luw/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmkcj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 19:16:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5841ae28eso59588085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398959; x=1745003759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3a305TDUC/FN1EUQW2b5Zguf/XdkfZu8nixf0K6aank=;
        b=H7MYwg1d94NyRzq/DMaMkZqyMpB3Nn2NfLxJ1WZqQhuxGXiWjMiAK6I/Uew5TgshJ8
         UyG28W3PSpBLAKdkHaGlh8DbPdWSMkCGeK1fGqHSsc+MPSVB/+VxHBVtjBbWAf1Ov52L
         8MH7wE8mOUKCR683UaSj3B8tqHHu9O45Vm+GHY5L1V8WnE1uHBRdiCrMiesCbl5uJ6tY
         49CrXbomD9lEJiYCYKu2ZVgo6RUMexGkbtmMUTGsxIBxQUMa9uW9GR72n+DnOvu6nblv
         CAzxWsu4+kaSel7j0171tAeVlV5k1FNCeDefatWWzi27qTAIDy+V8DRIaY5qaNCT40Pb
         wkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/bC1N9X+H3SOVBPYw7t67/dL4+aZl1wXZo7bR85gqxDgzBstQTCRrhfv1PD2Q38mIykn0XN5J5MpnDFOt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7AkoE/E54Ry+Dcz15knv4Qnr621kY8XzYlMheiYBRgwmGBFRm
	op7J0SMLzZMaW/iw0BdFzDKq1yh841xAmwDc78tp0wAZTpA15++tsYGebVkpru7Q+sF/xY2h5w6
	YMigzuR0eZVUnyC52HH5lAosEP1iz61RlBrq0tgRTa8bZIVY1ytSoh9GVTu6GrjkB
X-Gm-Gg: ASbGncvIMjGEyjkHVdzGSO7XRXVVfjonnVmn95pLHas6NJZpgrBHO3CfFSCJK8BW1uF
	MAOFgsIlAOJqms3/RkdDao2VMrdCuPKCPaYxjfkQ42rzCwItPMgsQCRnxkYlW6AezrIYylL6lRc
	vMwcw2omRrpzVujCK+4tPkhsW9PMZ876+7Q0UytbuSZlzk1DeetyoFyyzOq+GyvZQV57JCskASm
	C6t1DMFfMWGFhF5YvpAE7Mg77jPmHlBLxhmTEKDpPXLukUmUQ6ss8cNgf4H/nLSjUV62zchBuO3
	FeVdaANECd+B+WLnDQJutY94i1tHPpPq3ZI7OP2wnd64spUFf0ITBASEEUQTmJXdBg==
X-Received: by 2002:a05:620a:40cc:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7c7b19ae38emr138061785a.8.1744398959049;
        Fri, 11 Apr 2025 12:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEax4zulHWu8nGk5eGUvhc8qZMubEvXymplyY3nW8Si1Yu0Dda62QCU09XbrOJfA5N20R8UAg==
X-Received: by 2002:a05:620a:40cc:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7c7b19ae38emr138059585a.8.1744398958487;
        Fri, 11 Apr 2025 12:15:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bea593sm493975866b.62.2025.04.11.12.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:15:57 -0700 (PDT)
Message-ID: <47787c11-bd21-4a58-bfb4-fd2ac75e77d9@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:15:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcm2290: Add CCI node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
References: <20250403102256.101217-1-loic.poulain@oss.qualcomm.com>
 <0YH8BNtmMcywwRXI3xHiLyB_zFED-XbjzCyyI1Vc4184BPadVJ-GWj23lpEwaXEHqDPiMiraMsWlOd1qA_hiog==@protonmail.internalid>
 <20250403102256.101217-2-loic.poulain@oss.qualcomm.com>
 <1b649ead-f6d6-4fb0-b5ac-02cf2dba92ca@linaro.org>
 <CAFEp6-2kamY6m_vzE0gMi-QKCRYf42RjMd7f2ud6bte=aL9mRA@mail.gmail.com>
 <170e4c9a-bdf4-44f7-9dd1-9eed31fa27db@oss.qualcomm.com>
 <CAFEp6-2jiq+8wOz1WzWR_8R3t4GoVR7COv3iVV-mJkhZxcRYAg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2jiq+8wOz1WzWR_8R3t4GoVR7COv3iVV-mJkhZxcRYAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EJsOIObW1kaN5P4FAPGOFJLFDLQn0eDJ
X-Proofpoint-ORIG-GUID: EJsOIObW1kaN5P4FAPGOFJLFDLQn0eDJ
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f96a70 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=C2MwvOwe_SAwF-TQrWUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110122

On 4/11/25 10:02 AM, Loic Poulain wrote:
> Hi Konrad, Bryan,
> 
> On Wed, Apr 9, 2025 at 8:39 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/7/25 4:56 PM, Loic Poulain wrote:
>>> Hi Bryan,
>>>
>>>
>>> On Fri, Apr 4, 2025 at 2:10 PM Bryan O'Donoghue
>>> <bryan.odonoghue@linaro.org> wrote:
>>>>
>>>> On 03/04/2025 11:22, Loic Poulain wrote:
>>>>> Add Camera Control Interface (CCI), supporting two I2C masters.
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>   v2: Reorder commits; Update dts properties order and style
>>>>>   v3: No change for this patch
>>>>>
>>>>>   arch/arm64/boot/dts/qcom/qcm2290.dtsi | 50 +++++++++++++++++++++++++++
>>>>>   1 file changed, 50 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> index 7fb5de92bc4c..43fcb4f40a8c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
>>>>> @@ -557,6 +557,20 @@ qup_uart4_default: qup-uart4-default-state {
>>>>>                               bias-disable;
>>>>>                       };
>>>>>
>>>>> +                     cci0_default: cci0-default-state {
>>>>> +                             pins = "gpio22", "gpio23";
>>>>> +                             function = "cci_i2c";
>>>>> +                             drive-strength = <2>;
>>>>> +                             bias-disable;
>>>>> +                     };
>>>>> +
>>>>> +                     cci1_default: cci1-default-state {
>>>>> +                             pins = "gpio29", "gpio30";
>>>>> +                             function = "cci_i2c";
>>>>> +                             drive-strength = <2>;
>>>>> +                             bias-disable;
>>>>> +                     };
>>>>> +
>>>>>                       sdc1_state_on: sdc1-on-state {
>>>>>                               clk-pins {
>>>>>                                       pins = "sdc1_clk";
>>>>> @@ -1603,6 +1617,42 @@ adreno_smmu: iommu@59a0000 {
>>>>>                       #iommu-cells = <2>;
>>>>>               };
>>>>>
>>>>> +             cci: cci@5c1b000 {
>>>>> +                     compatible = "qcom,qcm2290-cci", "qcom,msm8996-cci";
>>>>> +                     reg = <0x0 0x5c1b000 0x0 0x1000>;
>>>>> +
>>>>> +                     interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>;
>>>>> +
>>>>> +                     clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>, <&gcc GCC_CAMSS_CCI_0_CLK>;
>>>>> +                     clock-names = "camss_top_ahb", "cci";
>>>>
>>>> do you not need an axi clock GCC_CAMSS_AXI_CLK ?
>>>
>>> AFAIU AXI is not involved for CCI.
>>
>> I'm not able to infer that from statically provided infromation, try
>> forcefully shutting the clock down (both the branch and _SRC) and
>> poking at the CCI
> 
> CCI is a 'slow' device, both control and data flow go through register
> R/W (ahb/cnoc).

This is not always a given ;)

> Below is an experiment showing CAMSS AXI can be off during CCI operation.
> 
> ```
> $ cat /sys/kernel/debug/clk/clk_summary | grep -e camss_axi -e camss_cci
>        gcc_camss_axi_clk_src         0       0        0
> 19200000    0          0     50000      ?         deviceless
>           gcc_camss_axi_clk          0       0        0
> 19200000    0          0     50000      N            5c52000.camss
>               bus
>              gcc_camss_cci_clk_src   0       0        0
> 37500000    0          0     50000      ?               deviceless
>                 gcc_camss_cci_0_clk  0       0        0
> 37500000    0          0     50000      N                  cci@5c1b000
> 
> $ echo on > /sys/bus/platform/drivers/i2c-qcom-cci/5c1b000.cci/power/control
> 
> $ cat /sys/kernel/debug/clk/clk_summary | grep -e camss_axi -e camss_cci
>        gcc_camss_axi_clk_src         0       0        0
> 19200000    0          0     50000      ?         deviceless
>           gcc_camss_axi_clk          0       0        0
> 19200000    0          0     50000      N            5c52000.camss
>               bus
>              gcc_camss_cci_clk_src   1       1        0
> 37500000    0          0     50000      ?               deviceless
>                 gcc_camss_cci_0_clk  1       1        0
> 37500000    0          0     50000      Y                  cci@5c1b000
> 
> $ cat /sys/class/i2c-dev/i2c-2/name
> Qualcomm-CCI
> 
> $ i2cdetect -y -r -a 2
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 
> # Dump GCC CAMSS AXI clock registers
> $ dd if=/sys/kernel/debug/regmap/1400000.clock-controller/registers
> count=8 bs=16 skip=90123
> 5802c: 80000000 # CAMSS_AXI_CMD_RCGR => ROOT_EN_DISABLE | ROOT_OFF
> 58030: 00000000 # CAMSS_AXI_CFG_RCGR => SRC_0 | BYPASS | HW_CLK_DISABLE
> [...]
> 58044: 80000220 # CAMSS_AXI_CBCR => CLK_DISABLE | SLEEP_CLOCK2 |
> WAKEUP_CLK2 | CLK_OFF
> 58048: 00010c00 # GCC_CAMSS_AXI_SREGR => MEM_CORE_ON_ACK |
> MEM_PERIPH_ON_ACK | PSCBC_SPARE_CTRL_IN

Amazing, thank you

Konrad

